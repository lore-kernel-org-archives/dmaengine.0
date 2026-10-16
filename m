Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77266237180
	for <dmaengine@vger.kernel.org>; Fri, 16 Oct 2026 03:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792120107; cv=none; b=GbvaKvLyhFeuGFBF5qF5aSG9OtUfwZuIlDgs/4ABa/d4/oTkyKwi/RLwDW72j5F+dLBUYQvWcCuuEgrdR97P1z1kJ41Sohjcw6nRjwYAruNHN7pu2V2yYuRKbhgVJckAmlYRb1fGxgoUM3yYQDd/Liv4xWcSjnbxE9Dwy3YUb3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792120107; c=relaxed/simple;
	bh=tLp101UHoggnPzq+/C8/sFxU0lzi7N8i3zEAi5ROWR4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=M0ewA/XVPUFgF7lAhMviPlBDauKEe2tuXQAS6NQVZI2o89E5+Nz7r9steLKTmue+pogWPqmi22DPL8HlE0kAfsb9xvSvfygP3WbVukGdSmpWCrvVNWrx2NimAuF6Lzta/6/mzH2MpDrr/vboZu2RAGBOmUE1jYf8iUve+4U0JqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UWYQ8dpM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UWYQ8dpM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2F061F000C4;
	Fri, 16 Oct 2026 03:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792120106;
	bh=uWxM2ni3Xzgx1w5ijJk2zH4L70ciNo7Z+DMrdJ7x6s4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UWYQ8dpMLOhvWV4xs+Fj4tUJdRfvxvUODPLKKxH6d45etUElPq4ws0I3i9nPVkhdC
	 siSA5oTUHegrwPCA6osw07JvMQyKGC/SCk6h2jCLZa8D8YFUEuKgjIGvNptwHRcd1L
	 NMqW+8TPjhyjRsrIjEoQIMBf4Nk8oTrNhh5xmtws9OhWEe3lSFUvztdMZoI7zsrlYM
	 aV00zNtUOCtqEATKR597xayf/W0QWLU3pyFhwTuliemT/imXB/33+80ZtZEpEkJ0OI
	 7y+xv5CPKGIerFD5Km3NJH7kl6Oco3BEZN7p0YIM8wT7BkwvhZsglGQKNJmpkh5KJo
	 Nv9rOufA7bl0A==
Message-ID: <sashiko-outbox-173653@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: amlogic: Fix regmap error check issue
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xianwei Zhao" <xianwei.zhao@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261016-fix-a9-dma-complier-v1-1-024421d5b3c8@amlogic.com>
References: <20261016-fix-a9-dma-complier-v1-1-024421d5b3c8@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 03:08:25 +0000
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dmaengine: amlogic: free_wq leaked on error paths in aml_dma_pro=
be()
--

commit 84261163c6f208aa12834ec242da34b3d805e7ad
Author: Xianwei Zhao <xianwei.zhao@amlogic.com>

dmaengine: amlogic: Fix regmap error check issue

This commit changes the error check for devm_regmap_init_mmio() to use
IS_ERR() instead of IS_ERR_OR_NULL(). This resolves a Smatch warning about
passing zero to PTR_ERR().

Closes: https://lore.kernel.org/r/202610080953.C5TYlCaA-lkp@intel.com/

> diff --git a/drivers/dma/amlogic-dma.c b/drivers/dma/amlogic-dma.c
> index 78ee2337ae712..684121d13fcab 100644
> --- a/drivers/dma/amlogic-dma.c
> +++ b/drivers/dma/amlogic-dma.c
> @@ -632,7 +632,7 @@ static int aml_dma_probe(struct platform_device *pdev)
> =20
>  	aml_dma->regmap =3D devm_regmap_init_mmio(&pdev->dev, aml_dma->base,
>  						&aml_regmap_config);
> -	if (IS_ERR_OR_NULL(aml_dma->regmap))
> +	if (IS_ERR(aml_dma->regmap))
>  		return PTR_ERR(aml_dma->regmap);

[Severity: Medium]
Does this code leak the free_wq workqueue on this error path?

aml_dma->free_wq is allocated earlier in aml_dma_probe() using
alloc_ordered_workqueue(), which isn't managed by devres:

drivers/dma/amlogic-dma.c:aml_dma_probe() {
    ...
	aml_dma->free_wq =3D alloc_ordered_workqueue("aml_dma_free", 0);
	if (!aml_dma->free_wq)
		return -ENOMEM;
    ...
}

If devm_regmap_init_mmio() fails and we return directly here, there is
no cleanup for the allocated workqueue.

> =20
>  	aml_dma->clk =3D devm_clk_get_enabled(&pdev->dev, NULL);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016-fix-a9-dma=
-complier-v1-1-024421d5b3c8@amlogic.com?part=3D1
