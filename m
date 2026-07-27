Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73883C3F7B
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 21:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785187188; cv=none; b=aQ4CKcNciSf16mvqGKtkTQ5fhbhBWbzMZW9H9WKxUkzbwTHczq037T0xW1iVRU2MQ7m1OW1zVF4eujDRdnvKwnDU3Nwin5AxXyst9n+fgv2ZWuUfI4ZQF2M6WJ69Qo1zldcbNUyzd33fi8rWynU5qFNSbp1hcqXD/6ZifM4JO2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785187188; c=relaxed/simple;
	bh=MEM4L1wTw5SfTgXdwmY0w5s4z+mu0RKGmMS8XxsCkJs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XBphw85tUYTgBWdU533rVVgGOrd6F8X3+h52CsS4NDbAcUtv9EAffjHSanKzKoFwP3xcMHajDwRWsXdfeP8aAHx3egTpaBLHHtqAgoaw+AJO9t5iIAXSMaeWODKNU1b6wW13YK99erZHqgZGG51isRf7ugSNUaCPEAaj+/b5i2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nFMEEmVs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nFMEEmVs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 287E71F000E9;
	Mon, 27 Jul 2026 21:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785187187;
	bh=PHjy6tiBRhGtrO4CjxfOQg45SPLeU70FFxeaoybVyKg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nFMEEmVsSWOyVGvwiwLHkxHz0TT9ztLwXbdF+UiZuNw5IsV2vmzr9RA+we9wMNODw
	 1JUBjLolNPx8Vuomza6fJw1oASQEGj64rTVRPr/YrQ1kd+/4Tuh17dxxB6Hv4p+kTJ
	 NUFW+FfhBbpUkh5g41ccyu1vSgGOMfYzfE9L5Tpsqadsmwnm8owlOOPdzAGES0XR8y
	 EQZrOdsGNht2j0klmPD1H733bQ0pN58o3ZXYuRi59gb5pGAgaw5J5div/FCMDJHwZY
	 kaicb6ru3qhLiKl8IzLP6vhkSmCIc2tB4vVCy/p/JS48SLzGCf7t7aNxGX4g3zDgqT
	 CQHgGU6gXqqjQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 60/64] dmaengine: bam-dma: use dma_chan_kill_bh
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <b4d1a1d4b56f548e157a4d9d8bed785f507dc157.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <b4d1a1d4b56f548e157a4d9d8bed785f507dc157.1785183549.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 21:19:46 +0000
Message-Id: <20260727211947.287E71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [High] In the probe error path, the BAM interrupts are not masked and the=
 IRQ is not freed before disabling clocks and cleaning up state.
- [High] Hardware registers are accessed while the peripheral clock is disa=
bled in `bam_dma_remove`, leading to bus faults (Data Abort).
- [High] Failing to drop the PM runtime usage counter on error paths preven=
ts the device from ever entering runtime suspend.
- [High] The driver fails to implement the `device_synchronize` DMA engine =
callback, rendering `dmaengine_synchronize()` a no-op.
- [Medium] Calling `clk_disable_unprepare` in `bam_dma_remove` underflows t=
he clock enable count.
--

--- Patch [60]: [PATCH v2 60/64] dmaengine: bam-dma: use dma_chan_kill_bh -=
--
commit 66f1d34a1a1de31180ac528ea6a897680d6ee0d9
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: bam-dma: use dma_chan_kill_bh

virt-dma now dispatches completion callbacks through per-channel BH
work instead of its tasklet. Cancel that work during teardown before
channel storage is released.

> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> index 1bb26af0405f3..74bc2fe445b32 100644
> --- a/drivers/dma/qcom/bam_dma.c
> +++ b/drivers/dma/qcom/bam_dma.c
> @@ -1387,7 +1387,7 @@ static int bam_dma_probe(struct platform_device *pd=
ev)
>  	dma_async_device_unregister(&bdev->common);
>  err_bam_channel_exit:
>  	for (i =3D 0; i < bdev->num_channels; i++)
> -		tasklet_kill(&bdev->channels[i].vc.task);
> +		dma_chan_kill_bh(&bdev->channels[i].vc.chan);

[Severity: High]
This isn't a bug introduced by this patch, but the driver fails to implement
the device_synchronize DMA engine callback here in bam_dma_probe().

Because bdev->common.device_synchronize is never assigned,
dmaengine_synchronize() returns immediately. This could allow DMA clients
to free memory while the completion bottom-half work is still executing
concurrently.=20

Should the driver provide a wrapper that calls vchan_synchronize()?

>  err_tasklet_kill:
>  	tasklet_kill(&bdev->task);
>  err_disable_clk:
>  	clk_disable_unprepare(bdev->bamclk);

[Severity: High]
This is a pre-existing issue, but does this error path leave the BAM
interrupts active before disabling the clock?

Because devm_request_irq() is used, the interrupt is not freed until after
probe() returns. If an interrupt fires during this window, bam_dma_irq()
will access BAM hardware registers while the clock is disabled via
clk_disable_unprepare(), which can trigger a synchronous external abort on
QCOM platforms.

Could we mask interrupts and free the IRQ explicitly before disabling clock=
s?

> @@ -1413,7 +1413,7 @@ static void bam_dma_remove(struct platform_device *=
pdev)
> =20
>  	for (i =3D 0; i < bdev->num_channels; i++) {
>  		bam_dma_terminate_all(&bdev->channels[i].vc.chan);
> -		tasklet_kill(&bdev->channels[i].vc.task);
> +		dma_chan_kill_bh(&bdev->channels[i].vc.chan);

[Severity: High]
This isn't a bug introduced by this patch, but are hardware registers
accessed after the clock is disabled?

Looking at bam_dma_remove(), pm_runtime_force_suspend() is called early,
which disables the clock. Immediately after, writel_relaxed() is called to
mask interrupts, and bam_dma_terminate_all() accesses hardware. Accessing
unclocked peripheral registers on QCOM platforms triggers a fatal
synchronous external abort.

Should the hardware shutdown logic occur before forcing PM suspend?

[Severity: Medium]
This is a pre-existing issue, but is there a double-disable of the clock in
bam_dma_remove()?

Since pm_runtime_force_suspend() has already suspended the device and
disabled the clock, the later call to clk_disable_unprepare() at the end
of this function will disable it again, causing the clock enable count to
drop below zero.

[Severity: High]
This isn't a bug introduced by this patch, but does the
pm_runtime_get_sync() failure path in bam_dma_irq() leak the PM usage
counter?

If pm_runtime_get_sync() returns a negative error:

drivers/dma/qcom/bam_dma.c:bam_dma_irq() {
	...
	ret =3D pm_runtime_get_sync(bdev->dev);
	if (ret < 0)
		return IRQ_NONE;
	...
}

Returning IRQ_NONE immediately without calling pm_runtime_put_noidle()
permanently leaks the PM reference count.

Additionally, returning IRQ_NONE without clearing the hardware interrupt
status leaves the IRQ asserted, potentially causing an IRQ storm that leads
to a CPU soft-lockup.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785183549.gi=
t.allen.lkml@gmail.com?part=3D60
