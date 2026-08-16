Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F9D3451CF
	for <dmaengine@vger.kernel.org>; Sun, 16 Aug 2026 05:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786859953; cv=none; b=Mh+QUwMdUhQ/XXo8Gy7MrhDuHw6Q96q4qpAzVpdaoU0DRKfD1+d1QTcJk5PWXz3NHQbH8tFiKhNLNnXorKWt1wbT8M65Z7pI4JPCGGhgGjeHmGOw0CEIH+B6UYHev8XzUUDMirKSCaVmQeRy/GGa6Z+njJj1pfklTZuv+WFxgbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786859953; c=relaxed/simple;
	bh=m/O7DoC+fIDm3Ul0Wz8l77V/9MPWM1FHtjl/I7Sm300=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oXjCoYWPL/mN9dw0ku4vFNTFIn/4fRb50fzDgQEzAED/UEeMvhlHTdbZstf2ciQUfBZ8eRmhCbpHIb5RwQ8i10UV2oQ067e2D9myxmYw+SMFoKFkBCrHmcGODck+qhKb9EBBNNLoaH7bj0QS4d83nWd88y9aowAUT+vt/aWydPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KHDsonGM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KHDsonGM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 205381F000E9;
	Sun, 16 Aug 2026 05:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786859952;
	bh=nJl3EVNmNuCQiSgCpb1+XSyP4eveNK5Xj1SL5v1w0QY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KHDsonGMR0Dv3A2DO+BPoYfEm9a1A4r3Z6IZlcIHnmH6WBX4TUZEKKD4cs7iNKGr3
	 55y9w4Q+7ceDgc+8JxNBBWnZTNB+Li3k8kCDXnP6s7b1dK/xxe9xdwt6Q+e12uLI3L
	 luqzgfDEDlMZXuFOdA24StvK16u5R/sA6XCBLQXKroj8cYbcx+Yv7BvQK4yOsFpcij
	 aF/z/URuLMZL8tMMOQBfr/DY5DNMpui3I8LMZh1yzpQW8DxTXd2G331/nXk9WF1zr6
	 ReuKOUBem/b6SF6CuiW12vKm/ZKP0PpQ1rKlL1Qk6j5M2g/4n4e4Fd1MOwd9k+aj3U
	 b8q8JT9vNFZ9w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] dmaengine: sprd: use clk_bulk API to fix clock
 imbalance
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chaithanya Lagisetty" <nagachaithanya9911@gmail.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260816055005.2667930-1-nagachaithanya9911@gmail.com>
References: <an3zMHoaxx4XzvpK@SMW015318>
 <20260816055005.2667930-1-nagachaithanya9911@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 16 Aug 2026 05:59:11 +0000
Message-Id: <20260816055912.205381F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Runtime PM usage counter and enablement state leak on error paths.
- [High] Device interrupt requested before hardware IO memory is mapped and=
 spinlocks are initialized.
--

--- Patch [1]: [PATCH v2] dmaengine: sprd: use clk_bulk API to fix clock im=
balance ---
commit ed070633d7ec91a8fe862c830443d077ba0540c0
Author: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>

dmaengine: sprd: use clk_bulk API to fix clock imbalance

This patch converts the driver to use the clk_bulk API to handle clock
enabling and disabling. It simplifies error paths and fixes a clock
imbalance issue where sdev->clk was leaked if the optional ashb_clk failed
to enable.

> diff --git a/drivers/dma/sprd-dma.c b/drivers/dma/sprd-dma.c
> index 087fea3af2e41..ac6fe6118ad19 100644
> --- a/drivers/dma/sprd-dma.c
> +++ b/drivers/dma/sprd-dma.c
[ ... ]
> @@ -1140,16 +1120,18 @@ static int sprd_dma_probe(struct platform_device =
*pdev)
>  	if (!sdev)
>  		return -ENOMEM;
> =20
> -	sdev->clk =3D devm_clk_get(&pdev->dev, "enable");
> -	if (IS_ERR(sdev->clk)) {
> -		dev_err(&pdev->dev, "get enable clock failed\n");
> -		return PTR_ERR(sdev->clk);
> -	}
> +	sdev->clks[0].id =3D "enable";
> +	sdev->clks[0].clk =3D devm_clk_get(&pdev->dev, "enable");
> +	if (IS_ERR(sdev->clks[0].clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(sdev->clks[0].clk),
> +				     "get enable clock failed\n");
> =20
>  	/* ashb clock is optional for AGCP DMA */
> -	sdev->ashb_clk =3D devm_clk_get(&pdev->dev, "ashb_eb");
> -	if (IS_ERR(sdev->ashb_clk))
> -		dev_warn(&pdev->dev, "no optional ashb eb clock\n");
> +	sdev->clks[1].id =3D "ashb_eb";
> +	sdev->clks[1].clk =3D devm_clk_get_optional(&pdev->dev, "ashb_eb");
> +	if (IS_ERR(sdev->clks[1].clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(sdev->clks[1].clk),
> +				     "get ashb_eb clock failed\n");
> =20
>  	/*
>  	 * We have three DMA controllers: AP DMA, AON DMA and AGCP DMA. For AGCP

[Severity: High]
This is a pre-existing issue, but does this code request the interrupt too
early?

Looking at the sequence further down in sprd_dma_probe():

	sdev->irq =3D platform_get_irq(pdev, 0);
	if (sdev->irq > 0) {
		ret =3D devm_request_irq(&pdev->dev, sdev->irq, dma_irq_handle,
				       0, "sprd_dma", (void *)sdev);
		...
	}

	sdev->glb_base =3D devm_platform_ioremap_resource(pdev, 0);

The interrupt is requested before sdev->glb_base is mapped and before the
virtual channels are initialized. If an interrupt is pending (for example,
left over from a bootloader or kexec), could the IRQ handler dma_irq_handle=
()
fire immediately?

If it fires early, the handler will attempt to read from sdev->glb_base:

drivers/dma/sprd-dma.c:dma_irq_handle() {
	...
	u32 irq_status =3D readl(sdev->glb_base + SPRD_DMA_GLB_INT_MSK_STS);
	...
}

Since sdev was allocated with devm_kzalloc(), sdev->glb_base is still NULL,
which would lead to a NULL pointer dereference. The handler might also lock
schan->vc.lock before it has been initialized by vchan_init(). Would it be
safer to request the interrupt after all necessary resources are mapped and
initialized?


[Severity: High]
This isn't a bug introduced by this patch, but is there a PM usage counter
leak on the error path further down in sprd_dma_probe()?

When pm_runtime_get_sync() fails, the code jumps to err_rpm:

	ret =3D pm_runtime_get_sync(&pdev->dev);
	if (ret < 0)
		goto err_rpm;
...
err_rpm:
	sprd_dma_disable(sdev);
	return ret;

This skips calling pm_runtime_put_noidle() and pm_runtime_disable(), which
could leave the runtime PM state unbalanced and prevent the device from ever
suspending if the probe is retried.

A similar issue appears to exist in sprd_dma_alloc_chan_resources(), where
it directly returns the result of pm_runtime_get_sync():

drivers/dma/sprd-dma.c:sprd_dma_alloc_chan_resources() {
	...
	return pm_runtime_get_sync(chan->device->dev);
}

Could this also leak the usage counter if pm_runtime_get_sync() fails?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260816055005.2667=
930-1-nagachaithanya9911@gmail.com?part=3D1
