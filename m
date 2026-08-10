Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FC1439359
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786387577; cv=none; b=EhzSmQssD0h+NRJ9ytPulyGPJ0FtuRrjtAuCfqvB9eJkRNWvNJoog0oKMk3f3hxjL8JTeTI4OSwmkgRvb8UyRVLw1AYnwKNhw/7yl0Ipk7Q7ns1FW7+4b2+FWa4yazaulIBpV2dUcduweFSg9id2MHuO7jL/DZRzX14TpoyK8cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786387577; c=relaxed/simple;
	bh=oGKYCp4EV6ODZzauFs6ITsJ1fODL4HNA6lzreu8rx1k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mTqe+R/Rw5/YBpuIflDV9Jh3J8mHeopy0hysKMDIyumFYL3xuyl/uPfCub3JUMrcyUC9vXQ4c2e4kVU4bPJ1FiulYSP+sJ/P5U2xlTbfhgphvJgGylI6+uWonROVCPRXBi2aA7SmIWGPV8N8RjJK+B3ArGw+35XOrCbsHoSE24I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OY43AYq0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OY43AYq0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 082751F00A3A;
	Mon, 10 Aug 2026 18:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786387573;
	bh=LA9uDaQ+oNNK0OxCvmROk6JWMxxuVrhnuwFS8CQwYnQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OY43AYq076wY7OjU0EtyNh75ow2nzvD4aDT227QZwO+Usk3JUJFqyyNCjyTFhHgJM
	 kMrJoqfzwNqsZ1unMCk0yIxtXEZvHixdBI6NDXtK4ZDWYFnjz+V88/TUkJzUff8n0u
	 Sic4R6wa5kyEjGsFx1S2LTko6LK20sUzymwdMXCyaFtHxbFg8ZEvLQughjhrXSp6qM
	 DK+WCQ66g2+twrYL3XFoXC9z7hlmZ+GmiB+Bm1Pd1RXi3AX3V88c9eSWBvLKGKFEB3
	 gvA0S41EUK9Isy1cTiBiCqQ+S26VrnQkq5nuYquNzdOeNndOyQ390JTo1+j5BzPCJ1
	 U83JucgieNiOw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 25/34] dmaengine: mv_xor_v2: use channel BH helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <7503158dca9b831cd8efafd78de3124c3cc7202f.1786384169.git.allen.lkml@gmail.com>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <7503158dca9b831cd8efafd78de3124c3cc7202f.1786384169.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 18:46:12 +0000
Message-Id: <20260810184613.082751F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incorrect teardown ordering in `mv_xor_v2_remove()` frees DMA memo=
ry before disabling interrupts and killing the bottom-half work.
- [High] The IRQ handler is registered before the bottom-half work is initi=
alized and before descriptor memory is allocated, creating a race condition=
 with early interrupts.
- [High] Probe error paths fail to kill the initialized bottom-half work, r=
isking a use-after-free if an interrupt schedules the work before probe fai=
ls.
--

--- Patch [25]: [PATCH v3 25/34] dmaengine: mv_xor_v2: use channel BH helpe=
rs ---
commit 5bac7d61a8218a20b1f3b692adf51b25c890e0c1
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: mv_xor_v2: use channel BH helpers
   =20
Replace the device tasklet with the per-channel BH helper so descriptor
callbacks run through dmaengine_*_bh.

> diff --git a/drivers/dma/mv_xor_v2.c b/drivers/dma/mv_xor_v2.c
> index cad4d4fb51ac3..14d563ec6bf0e 100644
> --- a/drivers/dma/mv_xor_v2.c
> +++ b/drivers/dma/mv_xor_v2.c

[ ... ]

> @@ -760,7 +758,7 @@ static int mv_xor_v2_probe(struct platform_device *pd=
ev)
>  	if (ret)
>  		goto free_msi_irqs;
> =20
> -	tasklet_setup(&xor_dev->irq_tasklet, mv_xor_v2_tasklet);
> +	dmaengine_init_bh(&xor_dev->dmachan, mv_xor_v2_tasklet);
> =20
>  	xor_dev->desc_size =3D mv_xor_v2_set_desc_size(xor_dev);
> =20

[Severity: High]
This is a pre-existing issue, but registering the IRQ handler before
allocating the descriptor memory and initializing the bottom-half seems ris=
ky.

If the kernel is booted via kexec and there are pending hardware interrupts,
could the IRQ handler fire immediately upon registration and schedule the
bottom-half work?

If that happens, mv_xor_v2_tasklet() would execute and dereference=20
xor_dev->hw_desq_virt before dma_alloc_coherent() has initialized it.
Would it be safer to request the IRQ after the structures are fully set up?

[Severity: High]
This is a pre-existing issue, but looking at the error handling in probe:

	xor_dev->hw_desq_virt =3D
		dma_alloc_coherent(&pdev->dev, ...);
	if (!xor_dev->hw_desq_virt) {
		ret =3D -ENOMEM;
		goto free_msi_irqs;
	}

In error paths like goto free_msi_irqs or goto free_hw_desq, the probe retu=
rns
without killing the initialized bottom-half work. If an early interrupt alr=
eady
scheduled the bottom-half, could this lead to a use-after-free when devres
frees the device structures but the scheduled workqueue still executes?

[ ... ]

> @@ -869,7 +867,7 @@ static void mv_xor_v2_remove(struct platform_device *=
pdev)
> =20
>  	platform_device_msi_free_irqs_all(&pdev->dev);
> =20
> -	tasklet_kill(&xor_dev->irq_tasklet);
> +	dmaengine_kill_bh(&xor_dev->dmachan);
>  }

[Severity: High]
This isn't a bug introduced by this patch, but looking at the full
mv_xor_v2_remove() function:

static void mv_xor_v2_remove(struct platform_device *pdev)
{
	...
	dma_free_coherent(&pdev->dev,
			  xor_dev->desc_size * MV_XOR_V2_DESC_NUM,
			  xor_dev->hw_desq_virt, xor_dev->hw_desq);

	devm_free_irq(&pdev->dev, xor_dev->irq, xor_dev);
	platform_device_msi_free_irqs_all(&pdev->dev);
	dmaengine_kill_bh(&xor_dev->dmachan);
}

Since dma_free_coherent() frees the descriptor memory before the bottom-half
is killed, could an interrupt fire and schedule the bottom-half during this
window?

If mv_xor_v2_tasklet() runs after dma_free_coherent(), it would dereference
the freed xor_dev->hw_desq_virt memory. Should the IRQ be freed and
dmaengine_kill_bh() be called before tearing down the DMA memory?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786384168.gi=
t.allen.lkml@gmail.com?part=3D25
