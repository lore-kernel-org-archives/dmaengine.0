Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A58929DB9A
	for <dmaengine@vger.kernel.org>; Thu,  3 Sep 2026 02:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788401218; cv=none; b=GBbYV9sdDQFL9Ti3lK8LrxlEuc0mmJTcHYOb8LDhbRVsX4n1V4NH6cbV8cfuFhs5z/mIYLUe7/gHpXSreo47szUtkO3qIYFtQLmCkwYUubwDCGPEsbOoJL/bDkVVSNBZ5Bp4kBeVwy+6/1A9QiQvTjOolVyTEMeBUKuJI9bZSM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788401218; c=relaxed/simple;
	bh=TE7yOQhdtY4GnpUXiq2Q1aKUPqPrVC7pZbiMcSME7RI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Kmp/AmVRKVPZSpQXfqKREj+SDZClHB7Jlq3IUi1TuTLcf7yJ8XUsAdXc2yg3cdf0F9kXbzkM7UQKvg0JAC1x/TpSvO7vRde0ovhev6cWYwGQl3PPwS18TP+HESJ8Fg1GBDCjmV0HioWCWLuQrh0I2LjEJnMjTyQReKGsnEifFO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ihyiv1J9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ihyiv1J9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 607CC1F000E9;
	Thu,  3 Sep 2026 02:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788401216;
	bh=f4y/y8Su7piWnLQcsVPUFnNaMQZmaMsOmBgbOX60vSE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ihyiv1J9RVvKXdtPgWZu98mlaeVal9+0MZSEL1LAa1FYpNOzVFQp/VD/CbnAMyyzb
	 ENrifgJKTJsm6OwoiJj63WFfMJb0CqaRwqoILm6tg+q5uM+vTxr8W0MzYvD98bMhha
	 jUlQZZvEHB3eC/iiZxK0xFn69qhvVwCG8mRsQ8cfHKxkDruErFC/tUBQDsJ/tvNqy4
	 NOvAmViN/J4Ft0iAkCwPDqJWq79uEAUP3ruDVlVdtbXh9uNBjpXLk6nQxWJd8LHkCj
	 94y//PvSNtBB8yLr/y16Nm0cE+b/m4KLdbIbGd0CVHQu8P2JHYtbEWwmQFmsccXhtJ
	 Zpp3VwY+Eij7w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] dmaengine: dw-axi-dmac: convert to clk bulk APIs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Li Youhong" <dayou5941@163.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260903015438.2514100-1-dayou5941@163.com>
References: <20260903015438.2514100-1-dayou5941@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 02:06:56 +0000
Message-Id: <20260903020656.607CC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unbalanced clock enable count in `dw_remove()` causes a clock leak=
 if the device is active.
- [High] Canceling an asynchronous `pm_runtime_put()` with `pm_runtime_disa=
ble()` in the `dw_probe()` error path leaks clocks.
- [High] Unconditional hardware access in shared IRQ handler without checki=
ng runtime PM state causes system crashes.
- [High] Missing `synchronize_irq()` in suspend callback for shared IRQ cau=
ses race conditions and crashes.
- [High] Missing `pm_runtime_put_noidle()` on `axi_dma_resume()` failure le=
aks the PM runtime usage counter.
- [High] Hardware and tasklets are destroyed while the DMA controller is st=
ill registered, creating a use-after-free race with DMA clients.
--

commit a98a1cba1a47c1e768fc851375c6e5c3c3acafac
Author: Li Youhong <liyouhong@kylinos.cn>
Subject: dmaengine: dw-axi-dmac: convert to clk bulk APIs

This commit updates the DesignWare AXI DMA controller driver to use the clk
bulk APIs for managing its core and configuration clocks. This allows prepa=
re
and enable failures to be rolled back automatically. The driver's probe,
remove, suspend, and resume functions are updated accordingly.

> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma=
/dw-axi-dmac/dw-axi-dmac-platform.c
> index eebed2474210d..413be7dce5fc8 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> @@ -1320,8 +1320,7 @@ static int axi_dma_suspend(struct axi_dma_chip *chi=
p)
>  	axi_dma_irq_disable(chip);
>  	axi_dma_disable(chip);
> =20
> -	clk_disable_unprepare(chip->core_clk);
> -	clk_disable_unprepare(chip->cfgr_clk);
> +	clk_bulk_disable_unprepare(DW_AXI_DMA_MAX_CLKS, chip->clks);

[Severity: High]
This is a pre-existing issue, but does this suspend callback need to
synchronize against in-flight shared interrupts?

The suspend callback tears down hardware and disables clocks without
calling synchronize_irq(). If a shared interrupt fires and its handler
is executing on another CPU while this runs, it could result in a kernel
panic when the handler accesses unclocked memory registers.

>  	return 0;
>  }

[ ... ]

> @@ -1524,13 +1519,11 @@ static int dw_probe(struct platform_device *pdev)
> =20
>  	chip->dw->hdata->use_cfg2 =3D !!(flags & AXI_DMA_FLAG_USE_CFG2);
> =20
> -	chip->core_clk =3D devm_clk_get(chip->dev, "core-clk");
> -	if (IS_ERR(chip->core_clk))
> -		return PTR_ERR(chip->core_clk);
> -
> -	chip->cfgr_clk =3D devm_clk_get(chip->dev, "cfgr-clk");
> -	if (IS_ERR(chip->cfgr_clk))
> -		return PTR_ERR(chip->cfgr_clk);
> +	chip->clks[0].id =3D "cfgr-clk";
> +	chip->clks[1].id =3D "core-clk";
> +	ret =3D devm_clk_bulk_get(chip->dev, DW_AXI_DMA_MAX_CLKS, chip->clks);
> +	if (ret)
> +		return ret;

[Severity: High]
This isn't a bug introduced by this patch, but does the error path in
dw_probe() leak the PM runtime usage counter?

Later in dw_probe(), pm_runtime_get_noresume() increments the usage
count. If the subsequent axi_dma_resume() fails, execution jumps to
err_pm_disable where pm_runtime_disable() is called, but the usage count
is never decremented. This permanently prevents runtime suspend if the
device is later successfully rebound.

[Severity: High]
This is also a pre-existing issue, but does canceling the asynchronous
suspend in the dw_probe() error path leak clocks?

If probe fails at dmaenginem_async_device_register(), the preceding call
to pm_runtime_put() asynchronously drops the PM usage count and queues an
idle/suspend work. However, jumping to err_pm_disable calls
pm_runtime_disable(), which explicitly cancels pending asynchronous PM
requests. This leaves the device active and permanently leaks the clocks.

[Severity: High]
This isn't a bug introduced by this patch, but is it safe to request the
IRQ as shared without checking the runtime PM state in the interrupt
handler?

In axi_req_irqs(), the IRQ is requested with IRQF_SHARED. If the device
is runtime suspended (clocks are off) and another device sharing the line
triggers an interrupt, dw_axi_dma_interrupt() unconditionally reads the
DMAC_CFG register. Without verifying if the device is active via
pm_runtime_get_if_active(), this unclocked hardware access can cause a
kernel panic.

[ ... ]

> @@ -1640,19 +1633,24 @@ static void dw_remove(struct platform_device *pde=
v)
>  	struct dw_axi_dma *dw =3D chip->dw;
>  	struct axi_dma_chan *chan, *_chan;
>  	u32 i;
> +	int ret;
> =20
>  	/* Enable clk before accessing to registers */
> -	clk_prepare_enable(chip->cfgr_clk);
> -	clk_prepare_enable(chip->core_clk);
> -	axi_dma_irq_disable(chip);
> -	for (i =3D 0; i < dw->hdata->nr_channels; i++) {
> -		axi_chan_disable(&chip->dw->chan[i]);
> -		axi_chan_irq_disable(&chip->dw->chan[i], DWAXIDMAC_IRQ_ALL);
> +	ret =3D clk_bulk_prepare_enable(DW_AXI_DMA_MAX_CLKS, chip->clks);

[Severity: High]
This isn't a bug introduced by this patch, but does unconditionally
incrementing the clock count here lead to a resource leak?

If the driver is unbound while the device is already in the RPM_ACTIVE
state, the clocks are already enabled with a count of 1. Calling
clk_bulk_prepare_enable() unconditionally raises the count to 2.

> +	if (ret)
> +		dev_err(&pdev->dev, "Failed to enable clocks\n");
> +	else {
> +		axi_dma_irq_disable(chip);
> +		for (i =3D 0; i < dw->hdata->nr_channels; i++) {
> +			axi_chan_disable(&chip->dw->chan[i]);
> +			axi_chan_irq_disable(&chip->dw->chan[i], DWAXIDMAC_IRQ_ALL);
> +		}
> +		axi_dma_disable(chip);
>  	}
> -	axi_dma_disable(chip);
> =20
>  	pm_runtime_disable(chip->dev);
> -	axi_dma_suspend(chip);
> +	if (!ret)
> +		axi_dma_suspend(chip);

[Severity: High]
This is a pre-existing issue, but since axi_dma_suspend() only decrements
the clock count once, will the clocks remain permanently enabled if the
count was 2? This unbalanced clock enable count would prevent deep power
states on removal.

[Severity: High]
This isn't a bug introduced by this patch, but is there a use-after-free
race with DMA clients during teardown?

Because the controller is registered via devres in probe
(dmaenginem_async_device_register), it is only unregistered after
dw_remove() completes. However, tasklets and hardware are destroyed
immediately afterward in this function. This lack of teardown symmetry
means DMA clients could still submit requests during this window, leading
to a potential oops or interaction with powered-down hardware.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903015438.2514=
100-1-dayou5941@163.com?part=3D1
