Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D5A374E41
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 13:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784641714; cv=none; b=P8VMaFeHBBSFEPX8O/ZBjJ8h30hwagema3Y9wh+qWHKNAoAHja8BFjY9Hl2aGXkItE/NP2YuoWnOwwnS+vQYEtjPOsPxOuiNFrPZtYXJE0pykjH2vbzbE/rTlqndH7tLdHxZ9YQW/BW45ZroBxgGBS0mWln9b9XwXhV5dz9LZWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784641714; c=relaxed/simple;
	bh=Bjoe4yLp99ABifxO8m2rCritXkH9PGVw1lhc3xAbfFM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MvffXPgOSHbkdCLz9ndj0aqh648+liFcMzRL2A1U2fbvRRZTyyzfsa9tsJefsIvrlODh2rptqV8+l6P7Atp6VgzrAzIJkNkL1qsVcYFONDfgHcFEjJszY/TIyiS0ByBZuen9r1GuO5qd3E2NsoqdXYoCD72pnD7rpdm3bw3qNZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ftgS390G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ftgS390G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67A551F000E9;
	Tue, 21 Jul 2026 13:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784641712;
	bh=3xxm5DGrfnu4E/X+BqJgC0CUjd53SrYxF4mFkKkiYE0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ftgS390G9k1ToSmRbHZ4Q7UkIgDmJ7YOCkP6L843QGDSzOJ8F5tHmXpa8yCrSGpxE
	 i4TNkYKCEktFSKHCfcLQF0qm+XfOYDDIOGAizHyj3LtNpGsoM0MNDbq3pg2EgPRPMZ
	 X0QR+0ob3Dj3fbHOKqI4sHdtBLO7em1CzxvlLWhDXgGTUhOLBipZAQH2A9VWWupwDa
	 oqiKM2LfIMURqzSyhYxxtDczXai8G9e76JnyfUmeNWaeP/nJXoxhFbazRB01uOOjDq
	 1uv0wXo0MSRaHTJtVqxNue8EyjpshOw289m0vlv8ono3vmgS2PUOPIxB7vjvhLAizo
	 XjSR0v/Y4TNLQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v23 02/14] dmaengine: qcom: bam_dma: free interrupt
 before the clock in error path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260721-qcom-qce-cmd-descr-v23-2-1be02deffda9@oss.qualcomm.com>
References: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
 <20260721-qcom-qce-cmd-descr-v23-2-1be02deffda9@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 13:48:31 +0000
Message-Id: <20260721134832.67A551F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unclocked Hardware Access in `bam_dma_remove()`
- [High] Unclocked Register Access in IRQ Handler
- [High] Tasklets are killed too late in `bam_dma_remove()`, causing a race=
 condition with device teardown
- [High] Requesting the IRQ before PM runtime is fully enabled can trigger =
a system-hanging IRQ storm
- [Medium] Unbalanced `clk_disable_unprepare()` in `bam_dma_remove()` trigg=
ers clock framework warning
- [Medium] PM Runtime usage counter leak on `pm_runtime_get_sync()` failures
--

--- Patch [2]: [PATCH v23 02/14] dmaengine: qcom: bam_dma: free interrupt b=
efore the clock in error path ---
commit 9cb6e1d095c67c46c54a187984f1dac9efb8fda4
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

dmaengine: qcom: bam_dma: free interrupt before the clock in error path
   =20
This commit stops using devres for the BAM interrupt, freeing it manually
in the probe error path and remove functions. This prevents the interrupt
from firing after the clock is disabled.

Link: https://sashiko.dev/#/patchset/20260427-qcom-qce-cmd-descr-v16-0-945f=
d1cafbbc%40oss.qualcomm.com?part=3D2

> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> index 1bb26af0405f3..fc155e0d1870c 100644
> --- a/drivers/dma/qcom/bam_dma.c
> +++ b/drivers/dma/qcom/bam_dma.c
> @@ -1332,8 +1332,7 @@ static int bam_dma_probe(struct platform_device *pd=
ev)
>  	for (i =3D 0; i < bdev->num_channels; i++)
>  		bam_channel_init(bdev, &bdev->channels[i], i);
> =20
> -	ret =3D devm_request_irq(bdev->dev, bdev->irq, bam_dma_irq,
> -			IRQF_TRIGGER_HIGH, "bam_dma", bdev);
> +	ret =3D request_irq(bdev->irq, bam_dma_irq, IRQF_TRIGGER_HIGH, "bam_dma=
", bdev);

[Severity: High]
This isn't a bug introduced by this patch, but does requesting this
interrupt before PM runtime is fully enabled risk a system-hanging IRQ
storm?

In bam_dma_probe(), the global BAM interrupts are unmasked before this call,
but pm_runtime_enable() is not called until the end of the probe function.

If an interrupt fires immediately, bam_dma_irq() will call
pm_runtime_get_sync(). Since PM runtime isn't enabled yet, it returns
-EACCES, and the handler returns IRQ_NONE without clearing the interrupt.

Because the interrupt is level-sensitive (IRQF_TRIGGER_HIGH), could the
hardware instantly re-assert it and trap the CPU in an infinite loop?

[ ... ]

> @@ -1401,6 +1402,8 @@ static void bam_dma_remove(struct platform_device *=
pdev)
>  	struct bam_device *bdev =3D platform_get_drvdata(pdev);
>  	u32 i;
> =20
> +	free_irq(bdev->irq, bdev);
> +
>  	pm_runtime_force_suspend(&pdev->dev);
> =20
>  	of_dma_controller_free(pdev->dev.of_node);
> @@ -1409,8 +1412,6 @@ static void bam_dma_remove(struct platform_device *=
pdev)
>  	/* mask all interrupts for this execution environment */
>  	writel_relaxed(0, bam_addr(bdev, 0,  BAM_IRQ_SRCS_MSK_EE));

[Severity: High]
This is a pre-existing issue, but does this write result in unclocked
hardware access?

When pm_runtime_force_suspend() is called just above, it invokes
bam_dma_runtime_suspend() which explicitly disables the device clock via
clk_disable().

Immediately afterward, writel_relaxed() attempts to mask interrupts on the
now-unclocked hardware. Could this access trigger an external bus abort and
crash the kernel during device removal?

> -	devm_free_irq(bdev->dev, bdev->irq, bdev);
> -
>  	for (i =3D 0; i < bdev->num_channels; i++) {
>  		bam_dma_terminate_all(&bdev->channels[i].vc.chan);

[Severity: High]
This is a pre-existing issue, but does bam_dma_terminate_all() also access
hardware registers while the clock is disabled?

Similar to the interrupt masking above, this invokes channel initialization
and reset logic. Could accessing unclocked registers here cause a synchrono=
us
bus abort?

>  		tasklet_kill(&bdev->channels[i].vc.task);

[Severity: High]
This isn't a bug introduced by this patch, but are these channel tasklets
and the global DMA tasklet terminated too late?

Since pm_runtime_disable() is never called in this remove function, if a
tasklet was scheduled prior to free_irq(), it might execute concurrently
with this channel teardown.

The tasklet calls pm_runtime_get_sync(), which could successfully wake the
device and initiate DMA transfers while the main thread is unregistering
channels and freeing FIFO memory. Could this lead to a use-after-free and
hardware state corruption?


I also noticed a few other pre-existing issues in this driver outside the
immediate diff context that might need attention:

drivers/dma/qcom/bam_dma.c:bam_dma_remove() {
    ...
    clk_disable_unprepare(bdev->bamclk);
}

[Severity: Medium]
This is a pre-existing issue, but does calling clk_disable_unprepare() here
cause a clock framework warning?

In probe, the clock is prepared and enabled exactly once. During removal,
pm_runtime_force_suspend() guarantees the device is in a suspended state,
meaning bam_dma_runtime_suspend() has already decremented the clock enable
count to 0.

Calling clk_disable_unprepare() here attempts to disable the clock a second
time, which triggers a WARN splat in clk_core_disable() and corrupts the
state. Should only clk_unprepare() be used here instead?

drivers/dma/qcom/bam_dma.c:bam_dma_irq() {
    ...
    srcs |=3D process_channel_irqs(bdev);
    ...
}

[Severity: High]
This is a pre-existing issue, but can this lead to unclocked register access
in the IRQ handler?

In bam_dma_irq(), process_channel_irqs() is called before
pm_runtime_get_sync(). process_channel_irqs() immediately reads the
BAM_IRQ_SRCS_EE hardware register.

If a spurious or delayed interrupt is delivered while the device is in a
runtime-suspended state (and the clock is disabled), will this unclocked
read trigger an external bus abort and crash the system?

drivers/dma/qcom/bam_dma.c:bam_start_dma() {
    ...
    ret =3D pm_runtime_get_sync(bdev->dev);
    if (ret < 0)
        return;
    ...
}

[Severity: Medium]
This is a pre-existing issue, but does this leak the PM runtime usage
counter when pm_runtime_get_sync() fails?

pm_runtime_get_sync() increments the runtime PM usage counter
unconditionally. If it returns an error, the caller must decrement it via
pm_runtime_put_noidle().

Checking for a negative return value and returning immediately leaves the
counter incremented. This same pattern appears to exist in bam_pause(),
bam_resume(), bam_free_chan(), and bam_dma_irq(). Will this prevent the BAM
DMA controller from ever entering runtime suspend again?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-qcom-qce-c=
md-descr-v23-0-1be02deffda9@oss.qualcomm.com?part=3D2
