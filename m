Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623473921DB
	for <dmaengine@vger.kernel.org>; Thu, 13 Aug 2026 15:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786636160; cv=none; b=pPE7DhJF4bWJJQRs0jujdaCgyXQe/nTPBfdcmz+40cFkmDZWNKhBynQu+zpG7Vc2XPCH/1hhNpqqIq0xH7/FoqChpoXBP/nDVKiHfksGyphB5ri2+bMlq2Nrple9wCajS6YawbAYxV/9ceA0GZhLs7f0wFvm5klu3sSv4f5D1sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786636160; c=relaxed/simple;
	bh=+bsnBMaSP4Rqhu5rNFRir9RClYdbcgB9tyJSMlepm5U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NIEOWP4ll000BkVvgLqbzTntB9YKeNxiBHf2+5rxUNxGDLzFjpVKtU/MQwFjtirQij7yHSNJWJ06fRqTAJ0eVldxF1FGKjP0m7EAzsFpS7cncw1tCbOh6igFIWaXZkq1eQsQwHJVTt+b++pfY2HTNH9WydSwEvyMHpucDiuzdo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jp9e2jhV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jp9e2jhV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B55C1F000E9;
	Thu, 13 Aug 2026 15:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786636151;
	bh=sIpohmS+2DyKbd3bZQwNxok5sda7OSz7y4PQjRNpno0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jp9e2jhVihBuTPYh+QX1PzlE1njXK+ikpMq/tDR738eXtukC8gNmd0yv09nYUAYhK
	 nIDfnRkw/SJZmd0BO4b3DdiyAFy5lT7O84uce8S4AojnF2+MPbsxsNsCQts6I5kF5T
	 bQstr7/wuB8swe+a2MyzG5yKz8sVRzt4z9s/BYp9mMUgilX98URT5oiz/wuXsu+l6b
	 YCJslravtRCBrecLksOTgBsku/lCng0qzunRxO9+LKwuVo7ssp7sO3yWqypbElLpoa
	 4xuoZ43QmrjkfkKnUayE4kq4rdqcnZZ8AOK64+9uHD9YCgOGtgy5TYbZ46z4/EMYHt
	 QTNS/rhEdkJCA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: sprd: Fix runtime PM reference leak in probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ruoyu Wang" <ruoyuw560@gmail.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260813153149.3953497-1-ruoyuw560@gmail.com>
References: <20260813153149.3953497-1-ruoyuw560@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 15:49:10 +0000
Message-Id: <20260813154911.3B55C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Premature IRQ registration and incorrect devres teardown order lea=
ding to UAF or bus errors.
- [High] The interrupt handler accesses hardware registers without checking=
 if the device is active.
--

--- Patch [1]: [PATCH] dmaengine: sprd: Fix runtime PM reference leak in pr=
obe ---
commit 274e07c9f2493c369c243df16cab2b58e4834d15
Author: Ruoyu Wang <ruoyuw560@gmail.com>

dmaengine: sprd: Fix runtime PM reference leak in probe

The commit modifies the error handling path in sprd_dma_probe() to
correctly unwind runtime PM state. If pm_runtime_get_sync() fails, it
now jumps to err_register to drop the reference without idling the
partially initialized device, and disables runtime PM before turning off
clocks.

> diff --git a/drivers/dma/sprd-dma.c b/drivers/dma/sprd-dma.c
> index 087fea3af2e41..19b32a23c882d 100644
> --- a/drivers/dma/sprd-dma.c
> +++ b/drivers/dma/sprd-dma.c
> @@ -1212,7 +1212,7 @@ static int sprd_dma_probe(struct platform_device *p=
dev)
> =20
>  	ret =3D pm_runtime_get_sync(&pdev->dev);
>  	if (ret < 0)
> -		goto err_rpm;
> +		goto err_register;

[Severity: High]
This is a pre-existing issue, but does the devm cleanup order risk a NULL
pointer dereference or accessing unmapped memory on probe failure?

Looking at sprd_dma_probe(), the IRQ is requested before the device IO
memory is mapped:

drivers/dma/sprd-dma.c:sprd_dma_probe() {
    ...
	if (sdev->irq > 0) {
		ret =3D devm_request_irq(&pdev->dev, sdev->irq, dma_irq_handle,
				       0, "sprd_dma", (void *)sdev);
    ...
	sdev->glb_base =3D devm_platform_ioremap_resource(pdev, 0);
    ...
}

If an interrupt is already pending on the line, it could fire immediately
upon unmasking. This would cause dma_irq_handle() to read from
sdev->glb_base before it is initialized, resulting in a NULL pointer
dereference.

Additionally, because devm_request_irq() is called before
devm_platform_ioremap_resource(), devres will unmap the memory before
freeing the IRQ during probe failure teardown. If an interrupt fires during
this window, could the handler access unmapped memory?


[Severity: High]
This is also a pre-existing issue, but does the interrupt handler safely
access hardware registers when the device might be runtime suspended?

drivers/dma/sprd-dma.c:dma_irq_handle() {
    ...
	u32 irq_status =3D readl(sdev->glb_base + SPRD_DMA_GLB_INT_MSK_STS);
    ...
}

If a spurious interrupt occurs while the device is suspended and clocks are
disabled, dma_irq_handle() unconditionally reads from the hardware
register.

Should the handler verify the device's runtime PM state via
pm_runtime_get_if_active() before accessing registers to prevent a
synchronous external abort?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813153149.3953=
497-1-ruoyuw560@gmail.com?part=3D1
