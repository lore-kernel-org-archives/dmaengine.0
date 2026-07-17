Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654F635950
	for <dmaengine@vger.kernel.org>; Fri, 17 Jul 2026 05:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784265102; cv=none; b=CUTwulUH/0+KneDk4ycLRL45OBjl3oeRV288rcz5tIxKTAmlf5Iv1Cb/wr91Rspp0wbU9c4PBIkZEgknA4nMPc4b/41gjr17HMPNh/zWJtYfyF1lL7G6KIgeq8twLTwYMT6+fGFd6wkj45ewJbPaIsjSV6zpOm8PpGYwRs2f/Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784265102; c=relaxed/simple;
	bh=YXlC6NFi35mhEOLR6rTmqcPv22KsxT+onV8dUQlUXic=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aOIFofFHTfGNBC33SATfjTD0TyMuCK4KsiL3BlhPg7lmklGLLkDmdZ5u0B2dGQoTurBpNLYMdbiALKuKAtnxF/GR80cVuag/JHjTxTEkXIr2g5HNcV35RX0vhPNq97t9yXnYdQ1ergQwyQkryE3eXHeXUs9HMKIDbv9q2r/wXM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZSr8qtk/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZSr8qtk/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E0BE1F000E9;
	Fri, 17 Jul 2026 05:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784265100;
	bh=atZXPBJW6jKY3xKyLOm9Dayn5yGaVxGkuKpdR6SwNtA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZSr8qtk/RpnQaaFjut4eyjZFE1NbFPXqZsN2NkXUHuxbUm4Xu6AO5AHA/zQhoIKZS
	 v+dxFwTm0AIhXNBr1yz2mwUvBlj+I2sSgExQ+b5JlURLJjZKK4vVbzWgJGwrdVvbhf
	 jeDEdpr/60sBWqw4Hu3U5pmlULtr4FxTuwL1XYcAuEZYNgdknk3iXSh6NfJXMFdLf2
	 9p8S0jfYjaY+enmoh65PVibIFrEGwkpt5AFGsK/E8mGWjk5VIIpdCZ7181Fp8ZWiVn
	 VRVt3wt6COpKhUi3i4IDAIKpPbOK566ma/jtTtfbDAur9v4yv7/YblxRIVmYOhafj2
	 d/Nui45cvzIGw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND] dmaengine: qcom: bam_dma: Defer IRQ trigger type
 to device tree
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Santhosh" <vishnu.santhosh@oss.qualcomm.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260717-qcom-bam-dma-irq-trigger-v1-1-6405eac86f00@oss.qualcomm.com>
References: <20260717-qcom-bam-dma-irq-trigger-v1-1-6405eac86f00@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 05:11:40 +0000
Message-Id: <20260717051140.9E0BE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unclocked MMIO accesses cause system crash (synchronous external a=
bort).
- [High] Error path devres race conditions cause Use-After-Free and system =
crashes.
- [High] Missing `pm_runtime_put_noidle()` leaks device usage counter on er=
ror paths.
- [High] Requesting IRQ before enabling PM runtime can cause an interrupt s=
torm and CPU hang.
--

--- Patch [1]: [PATCH RESEND] dmaengine: qcom: bam_dma: Defer IRQ trigger t=
ype to device tree ---
commit ddb45d4f1215300c79f379d22aecb598266fe011
Author: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

dmaengine: qcom: bam_dma: Defer IRQ trigger type to device tree

The driver hardcodes IRQF_TRIGGER_HIGH when registering the BAM
interrupt, which overrides the trigger type specified in the device
tree. This patch uses IRQF_TRIGGER_NONE instead, which allows the kernel
to use the trigger type already configured by platform_get_irq().

> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> index 19116295f8325..6c3e2ca8a572f 100644
> --- a/drivers/dma/qcom/bam_dma.c
> +++ b/drivers/dma/qcom/bam_dma.c
> @@ -1303,7 +1303,7 @@ static int bam_dma_probe(struct platform_device *pd=
ev)
>  		bam_channel_init(bdev, &bdev->channels[i], i);
> =20
>  	ret =3D devm_request_irq(bdev->dev, bdev->irq, bam_dma_irq,
> -			IRQF_TRIGGER_HIGH, "bam_dma", bdev);
> +			IRQF_TRIGGER_NONE, "bam_dma", bdev);

[Severity: High]
This is a pre-existing issue, but does requesting the IRQ here before enabl=
ing
PM runtime risk an interrupt storm and CPU hang?

Since devm_request_irq() is called before pm_runtime_enable(), if an
interrupt fires immediately, bam_dma_irq() handles it. However, because PM
runtime is disabled, pm_runtime_get_sync() returns -EACCES.

The handler then returns IRQ_NONE without clearing the BAM interrupt status:

drivers/dma/qcom/bam_dma.c:bam_dma_irq() {
...
	ret =3D pm_runtime_get_sync(bdev->dev);
	if (ret < 0)
		return IRQ_NONE;
...
}

For level-triggered interrupts, wouldn't this leave the line asserted and
cause an interrupt storm?

[Severity: High]
This isn't a bug introduced by this patch, but does relying on devres to fr=
ee
the IRQ create a race condition on error paths?

If a failure occurs after this devm_request_irq() call, the error path
manual teardown leaves a window where the IRQ is still active:

drivers/dma/qcom/bam_dma.c:bam_dma_probe() {
...
err_tasklet_kill:
	tasklet_kill(&bdev->task);
err_disable_clk:
	clk_disable_unprepare(bdev->bamclk);

	return ret;
}

If an interrupt fires during this window before devres frees the IRQ,
bam_dma_irq() runs. It could either access unclocked MMIO or call
tasklet_schedule().

Does this mean the scheduled tasklet remains pending while devres frees bde=
v,
leading to a use-after-free when the tasklet executes?

[Severity: High]
This is a pre-existing issue, but do unclocked MMIO accesses cause system
crashes (synchronous external aborts)?

In bam_dma_irq(), process_channel_irqs() is called unconditionally before
pm_runtime_get_sync():

drivers/dma/qcom/bam_dma.c:bam_dma_irq() {
...
	srcs |=3D process_channel_irqs(bdev);

	ret =3D pm_runtime_get_sync(bdev->dev);
...
}

If a spurious interrupt fires while the device is runtime-suspended, it rea=
ds
registers without a clock.

Similarly, in bam_dma_remove():

drivers/dma/qcom/bam_dma.c:bam_dma_remove() {
...
	pm_runtime_force_suspend(&pdev->dev);
...
	writel_relaxed(0, bam_addr(bdev, 0,  BAM_IRQ_SRCS_MSK_EE));
...
}

Does writing to BAM_IRQ_SRCS_MSK_EE immediately after forcing the device
into suspend (which disables its clock) deterministically crash the system?

[Severity: High]
This isn't a bug introduced by this patch, but does the error path in PM
runtime handling leak the device usage counter?

If pm_runtime_get_sync() fails, it increments the usage counter but the
driver returns directly without dropping the reference:

drivers/dma/qcom/bam_dma.c:bam_pause() {
...
	ret =3D pm_runtime_get_sync(bdev->dev);
	if (ret < 0)
		return ret;
...
}

This missing pm_runtime_put_noidle() on failure appears across multiple
functions, including bam_start_dma(), bam_free_chan(), bam_pause(),
bam_resume(), and bam_dma_irq().

Can this cause the device to permanently fail to enter runtime suspend?

>  	if (ret)
>  		goto err_bam_channel_exit;
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717-qcom-bam-d=
ma-irq-trigger-v1-1-6405eac86f00@oss.qualcomm.com?part=3D1
