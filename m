Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7E237CD4E
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 21:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785186589; cv=none; b=mxXABTK0hm2g0Yh4nqLNvYUPztRxvcDlCpe3Db9paec6WOkNDDAq3CukPpv7m3114odhdWfngdv9J58WKqnehHZkBRa6aT+Z3N+RSRyRJKCJyQukn3vqrWOoK/L+DPNPVarieJxgb3RjhiEanCyHg9e12xlzFkqDJ2BW2KX68eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785186589; c=relaxed/simple;
	bh=+IMuydudj8qgaWR/kduJHJp9NJ7kwjwmj9fip6WqDoY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UusI/eijJ9GLrz1uEwYwukSdT5p78vh5hSdIItwGCxP5wTW2ahnq/LAARvbYMBE+Y3XjSI9cIWhj9r8j8lJrdb/S5R+9oU/oAIRLr4b0LcaXLjMf6H3a8iT23E8yAMMfnW1JvzTIqnS+3cbMw5VAn9wGtbtFrNpl0AYUAjntXU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oVtAhai8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oVtAhai8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F13421F00A3A;
	Mon, 27 Jul 2026 21:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785186588;
	bh=5IQHF4gaxGtYvvwrAr8xOmEPGO3WHcvASx374Sfrzxw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oVtAhai84HXBtFa9K2Zd51OlVymHsfKla4n9HusuRTpGRyiGysY03f0LSni5mw8Wh
	 OYdgx8u4SFSIDPTHGiAzm1U1F2i/E2Cpy3/SUr+4iFkpATySjGOSE4wMp3B6ZNSCIL
	 usZh0NWjbAn7j5vPFc/dPFl2QUDuPQ4xKbA2+5dGxxe2ehcfk6pujIcuF7tbmG7E0L
	 I9upcO21XZB2DbzERXOrphjboHyeCDUfnnCja7UhKZGyhECrKRSbnvyqjUVsmtrrMR
	 dG4d8f/HgSRp4CbB4S/qswaJTaQBYzrkhk/rHBrCElOkN17LVVjk80YS3jMIvdV1eY
	 Hnz0SYdg30yzw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 38/64] dmaengine: img-mdc-dma: kill vchan BH on
 teardown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <333e90fe6e8df85aec14d6b4c9ebe9da7040d122.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <333e90fe6e8df85aec14d6b4c9ebe9da7040d122.1785183549.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 21:09:47 +0000
Message-Id: <20260727210947.F13421F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing pm_runtime_set_suspended() in the driver removal path caus=
es PM state mismatch on subsequent rebinds, leading to hardware faults.
- [High] The PM runtime usage counter is leaked in mdc_alloc_chan_resources=
() if pm_runtime_get_sync() fails.
- [High] Hardware registers are accessed in mdc_dma_probe() before the devi=
ce clock is enabled.
- [High] The IRQ handler is registered before its associated virtual channe=
l spinlock is initialized, allowing a spurious interrupt to lock an uniniti=
alized spinlock.
--

--- Patch [38]: [PATCH v2 38/64] dmaengine: img-mdc-dma: kill vchan BH on t=
eardown ---
commit b4d81ea29e678b96ef67f182eaf0b8fc7065fe66
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: img-mdc-dma: kill vchan BH on teardown

Use dma_chan_kill_bh() for virt-dma cleanup.

> diff --git a/drivers/dma/img-mdc-dma.c b/drivers/dma/img-mdc-dma.c
> index b3765ba158030..374034c737c0e 100644
> --- a/drivers/dma/img-mdc-dma.c
> +++ b/drivers/dma/img-mdc-dma.c
[ ... ]
> @@ -1031,7 +1031,7 @@ static void mdc_dma_remove(struct platform_device *=
pdev)
> =20
>  		devm_free_irq(&pdev->dev, mchan->irq, mchan);
> =20
> -		tasklet_kill(&mchan->vc.task);
> +		dma_chan_kill_bh(&mchan->vc.chan);
>  	}
> =20
>  	pm_runtime_disable(&pdev->dev);
>  	if (!pm_runtime_status_suspended(&pdev->dev))
>  		img_mdc_runtime_suspend(&pdev->dev);

[Severity: High]
This is a pre-existing issue, but does mdc_dma_remove() need to call
pm_runtime_set_suspended() here?

When the driver is unbound and rebound via sysfs, the hardware is manually
suspended but the PM runtime state is left as RPM_ACTIVE. On rebind,
mdc_dma_probe() enables runtime PM but sees the device as already active.

When a channel is requested, won't pm_runtime_get_sync() return without
enabling the clock, leading to an imprecise external abort (kernel panic)
during subsequent register writes?


While reviewing this file, I noticed a few other pre-existing issues:

drivers/dma/img-mdc-dma.c:mdc_alloc_chan_resources()
> static int mdc_alloc_chan_resources(struct dma_chan *chan)
> {
> 	struct mdc_chan *mchan =3D to_mdc_chan(chan);
> 	struct device *dev =3D mdma2dev(mchan->mdma);
>=20
> 	return pm_runtime_get_sync(dev);
> }

[Severity: High]
This isn't a bug introduced by this patch, but does mdc_alloc_chan_resource=
s()
leak the PM runtime usage counter if pm_runtime_get_sync() fails?

If pm_runtime_get_sync() returns an error (e.g., -EACCES), the usage counter
is incremented but the error is directly propagated. Since the allocation
aborts, the free routine is never called to decrement the counter.

Doesn't this permanently prevent the device (and potentially the parent pow=
er
domain) from entering low-power suspend states? Should this check the return
value and call pm_runtime_put_noidle() on failure?


drivers/dma/img-mdc-dma.c:mdc_dma_probe()
> 	mdma->clk =3D devm_clk_get(&pdev->dev, "sys");
> 	if (IS_ERR(mdma->clk))
> 		return PTR_ERR(mdma->clk);
[ ... ]
> 	val =3D mdc_readl(mdma, MDC_GLOBAL_CONFIG_A);

[Severity: High]
This is a pre-existing issue, but are hardware registers accessed in
mdc_dma_probe() before the device clock is enabled?

mdc_readl() reads MDC_GLOBAL_CONFIG_A shortly after getting the "sys" clock,
but the clock appears to only be enabled later in img_mdc_runtime_resume().

On systems where the bootloader doesn't leave the clock enabled, wouldn't
reading from unclocked peripheral registers cause an imprecise external abo=
rt
(kernel panic) during device initialization?


drivers/dma/img-mdc-dma.c:mdc_dma_probe()
> 		ret =3D devm_request_irq(&pdev->dev, mchan->irq, mdc_chan_irq,
> 				       IRQ_TYPE_LEVEL_HIGH,
> 				       dev_name(&pdev->dev), mchan);
> 		if (ret < 0)
> 			return ret;
>=20
> 		mchan->vc.desc_free =3D mdc_desc_free;
> 		vchan_init(&mchan->vc, &mdma->dma_dev);

[Severity: High]
This isn't a bug introduced by this patch, but is the IRQ handler registered
before its associated virtual channel spinlock is initialized?

devm_request_irq() is called before vchan_init() initializes mchan->vc.lock.
If the IRQ line is asserted immediately after registration (e.g. from a warm
boot or shared interrupt), mdc_chan_irq() will fire and attempt to acquire a
zero-initialized lock.

Could this trigger a kernel panic with lock debugging enabled?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785183549.gi=
t.allen.lkml@gmail.com?part=3D38
