Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170BB40BCDF
	for <dmaengine@vger.kernel.org>; Thu, 13 Aug 2026 11:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786619219; cv=none; b=rUK2Fc72chJVvI5pw+QHcuN8N/CIMQImAUF0bbyS+iGm2OFuHmdFojPjZHabbZ2fv9hCA8LxOHGX3jav4VRbgW6qi7NrYf6L7aGEnbzl4ZPswAoDAG+nWh2dF3yS2ZcVwWgOL0lGdZkCUl1hc9Txs2GaQVMuZFcOXePPbmaumkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786619219; c=relaxed/simple;
	bh=535Ld9w5FkcKS8C8QcK10DRdiryArQusIJbN2VXZ0hA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=m37ihvwVBFND6jQnr9JzavqbL9ajQ38yaaqnCeRJyn0FRfvtjovqhURQhkGcACjVNjYgUQosjWbHPLiM11/25tslMdY8fyKm3Qsfnh9FOPWH3G2Oi4Fs1UBGC53ijxFSfxfytCZoIpiABC6EV3XdavIUgbEBVJ1qqIwxCGy95+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=amezfzhd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="amezfzhd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4A541F00A3D;
	Thu, 13 Aug 2026 11:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786619213;
	bh=4V94Fk2cfp5NNwghxNuf/lEkhSeydez5MW03tfNky30=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=amezfzhd0WljFhJCpgmKczoXsDO9+r+gvYIpqxBoYCxiJWfQqRaAxP8Kf+/dKoNHw
	 9YbMP6EjgV5zEqkxa0LCyoitWJlNrUJoE7vuwEM8LMgtFvCiGf0lBUGPO7DIlSxTLn
	 nj6vjt5S4FJbQlSzBlwlsFm8mMkqvLxQ92pCoWFfS2uWkn6Zq2dxKYbCiF85GR3wne
	 KhyE/fNC3I3qZt3Fx0b7cHI55K5HGTkUOC0Qu/qPDXhej5RxDWzApTW9taZB2zVJWj
	 0ICaKmC5CZn50aeIqySAqwrx14bXZ4reRxKX6OzhGo4lrvTelhABY2djHpXnNcr5ua
	 iBb4tTIoWY3SQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: sprd: fix clock imbalance when enabling
 ashb_clk fails
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chaithanya Lagisetty" <nagachaithanya9911@gmail.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260813105354.2577040-1-nagachaithanya9911@gmail.com>
References: <20260813105354.2577040-1-nagachaithanya9911@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 11:06:53 +0000
Message-Id: <20260813110653.A4A541F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver ignores `-EPROBE_DEFER` for the optional `ashb_clk`, wh=
ich prevents proper probe deferral.
- [High] Unchecked `pm_runtime_get_sync()` failures leak the PM usage count=
er and cause unbalanced clock teardowns.
- [High] The interrupt handler returns without clearing the hardware interr=
upt if a channel has no active descriptor, triggering an infinite IRQ storm.
- [High] The interrupt handler is registered before critical resources are =
initialized, leading to a NULL pointer dereference.
- [High] Channels are manually removed from the device's channel list befor=
e unregistering the DMA device, leaking channel resources.
--

--- Patch [1]: [PATCH] dmaengine: sprd: fix clock imbalance when enabling a=
shb_clk fails ---
commit db2ba297caa82c1c816130ae2b34acb419871f3c
Author: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>

dmaengine: sprd: fix clock imbalance when enabling ashb_clk fails

sprd_dma_enable() enables sdev->clk and then enables the optional
ashb_clk. If clk_prepare_enable() for ashb_clk fails, the function
returns the error without disabling sdev->clk, which was already
enabled. Both callers (probe and resume) treat a non-zero return as
nothing was enabled and bail out, so sdev->clk is leaked.

> diff --git a/drivers/dma/sprd-dma.c b/drivers/dma/sprd-dma.c
> index 087fea3af2e41..3ea5c3ba1a8c8 100644
> --- a/drivers/dma/sprd-dma.c
> +++ b/drivers/dma/sprd-dma.c
> @@ -270,9 +270,16 @@ static int sprd_dma_enable(struct sprd_dma_dev *sdev)
>  	 * The ashb_clk is optional and only for AGCP DMA controller, so we
>  	 * need add one condition to check if the ashb_clk need enable.
>  	 */
> -	if (!IS_ERR(sdev->ashb_clk))
> +	if (!IS_ERR(sdev->ashb_clk)) {
>  		ret =3D clk_prepare_enable(sdev->ashb_clk);
> +		if (ret)
> +			goto disable_clk;
> +	}
> =20
> +	return 0;
> +
> +disable_clk:
> +	clk_disable_unprepare(sdev->clk);
>  	return ret;
>  }

While reviewing this patch, I noticed some pre-existing regressions in the =
same
file.

drivers/dma/sprd-dma.c:sprd_dma_probe() {
[ ... ]
	sdev->ashb_clk =3D devm_clk_get(&pdev->dev, "ashb_eb");
	if (IS_ERR(sdev->ashb_clk))
		dev_warn(&pdev->dev, "no optional ashb eb clock\n");
[ ... ]

[Severity: High]
This is a pre-existing issue, but does this code ignore -EPROBE_DEFER?

If the clock provider is probed after this driver, treating the clock as
permanently absent could prevent probe deferral and lead to missing hardware
clocks.


drivers/dma/sprd-dma.c:sprd_dma_alloc_chan_resources() {
	return pm_runtime_get_sync(chan->device->dev);
}

drivers/dma/sprd-dma.c:sprd_dma_probe() {
[ ... ]
	ret =3D pm_runtime_get_sync(&pdev->dev);
	if (ret < 0)
		goto err_rpm;
[ ... ]
err_register:
	pm_runtime_put_noidle(&pdev->dev);
	pm_runtime_disable(&pdev->dev);
err_rpm:
	sprd_dma_disable(sdev);
	return ret;
}

drivers/dma/sprd-dma.c:sprd_dma_remove() {
	struct sprd_dma_dev *sdev =3D platform_get_drvdata(pdev);
	struct sprd_dma_chn *c, *cn;

	pm_runtime_get_sync(&pdev->dev);

[Severity: High]
This is a pre-existing issue, but do these pm_runtime_get_sync() calls
properly handle failure?

In sprd_dma_alloc_chan_resources(), the error is returned directly,
abandoning the incremented usage counter.

In sprd_dma_probe(), the err_rpm path skips pm_runtime_put_noidle() and
pm_runtime_disable().

In sprd_dma_remove(), failing to check the return value can lead to
unbalanced clock teardowns if the device is already suspended.


drivers/dma/sprd-dma.c:dma_irq_handle() {
[ ... ]
	while (irq_status) {
		i =3D __ffs(irq_status);
		irq_status &=3D (irq_status - 1);
		schan =3D &sdev->channels[i];

		spin_lock(&schan->vc.lock);

		sdesc =3D schan->cur_desc;
		if (!sdesc) {
			spin_unlock(&schan->vc.lock);
			return IRQ_HANDLED;
		}

[Severity: High]
This isn't a bug introduced by this patch, but does this early return cause=
 an
interrupt storm?

If the handler exits here without calling sprd_dma_clear_int() to acknowled=
ge
the hardware interrupt, the interrupt controller might immediately refire it
upon exit.


drivers/dma/sprd-dma.c:sprd_dma_probe() {
[ ... ]
	sdev->irq =3D platform_get_irq(pdev, 0);
	if (sdev->irq > 0) {
		ret =3D devm_request_irq(&pdev->dev, sdev->irq, dma_irq_handle,
				       0, "sprd_dma", (void *)sdev);
		if (ret < 0) {
			dev_err(&pdev->dev, "request dma irq failed\n");
			return ret;
		}
	} else {
		dev_warn(&pdev->dev, "no interrupts for the dma controller\n");
	}

	sdev->glb_base =3D devm_platform_ioremap_resource(pdev, 0);

[Severity: High]
This is a pre-existing issue, but could this lead to a NULL pointer
dereference?

The interrupt is unmasked by devm_request_irq() before
devm_platform_ioremap_resource() initializes sdev->glb_base.

If an interrupt fires early, the handler will blindly dereference the
uninitialized base address in dma_irq_handle():
u32 irq_status =3D readl(sdev->glb_base + SPRD_DMA_GLB_INT_MSK_STS);


drivers/dma/sprd-dma.c:sprd_dma_remove() {
[ ... ]
	list_for_each_entry_safe(c, cn, &sdev->dma_dev.channels,
				 vc.chan.device_node) {
		list_del(&c->vc.chan.device_node);
		tasklet_kill(&c->vc.task);
	}

	of_dma_controller_free(pdev->dev.of_node);
	dma_async_device_unregister(&sdev->dma_dev);

[Severity: High]
This isn't a bug introduced by this patch, but does this manual list_del()
leak channel resources?

Removing the channels from the list causes dma_async_device_unregister() to
see an empty list and skip freeing its resources.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813105354.2577=
040-1-nagachaithanya9911@gmail.com?part=3D1
