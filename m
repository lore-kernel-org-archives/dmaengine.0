Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87A141D228
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 17:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784827574; cv=none; b=u5aRNMLRFsIZDj8jkMM3mT2gyBysqDhjJNvkCYp0gqJsDqsGyN4BZYSSr2V5nwwBmObJQL5NEnYtxq7qHvuCCud4/ZjEf5Ghe5RtGTQqkOf/rB4Z9rih93v1ZyujaahJkWzLXT+DSVFIQ9WvVpADK65cfbnWmH0ARrflKFDjisU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784827574; c=relaxed/simple;
	bh=xxeAEemnR6TdjjezbCe9Lzys5w14oqoyNE+0oU7l+4A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=by1MnBMkXcSSWEVOV8huQmVkG6nGZewa1n9vbgPYZAcL/Ea+zbDeMdmGBVaiaZPD6pWVuZ9JtD0N9vr+PY4Q+OFTgtxentgaq/MBNcBqkT8nyfIXOPq4wSHddQBMwBIArWdig+GIBYK95yd+YeFlTT0Hd3ZUHmY67lVbyluTJ6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CyGmjSY6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CyGmjSY6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B9391F000E9;
	Thu, 23 Jul 2026 17:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784827572;
	bh=KEtNcWNnPLQ8rOABbO0NzwVtKHkT7+DGswP+LAc/twk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CyGmjSY6XM/w1kQF+vD6HbMADBUY7ivFU0ev9pxBXrWVU0pPy2uwH+N1jeBdDxjDq
	 5+tKLE36BYMrFWzIgWAZ96/DVeeDvEjvVz005bIAXe7arB6kjp5M+XPhW084ts6rGY
	 3R7znESg19RLLAoemAGFOntfjUEy5fQWW3njJelgYKKAHCSKspmcu+Tppc8nBEeUy9
	 lF+fKPcrwzNmbE3jmbuv98nkU7McSEPJ5jkBwO4cvl9FoFKfkaXxxX6KyzVk7JgVpI
	 4SsBWcEcT9wCNzI1WBTYbZMUo0LK7nFxgNIOtL+jXnacW5We1pcrcm8BDV2OmS4bjF
	 x4tumQWDJjzhw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v24 02/14] dmaengine: qcom: bam_dma: free interrupt
 before the clock in error path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260723-qcom-qce-cmd-descr-v24-2-4f87bb4d9938@oss.qualcomm.com>
References: <20260723-qcom-qce-cmd-descr-v24-0-4f87bb4d9938@oss.qualcomm.com>
 <20260723-qcom-qce-cmd-descr-v24-2-4f87bb4d9938@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 17:26:12 +0000
Message-Id: <20260723172612.7B9391F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] Moving `free_irq()` to the beginning of `bam_dma_remove()` creates=
 a teardown race condition that hangs concurrent DMA clients.

Pre-existing issues:
- [High] Hardware registers are accessed unconditionally after the clock is=
 disabled, which will crash the system.
- [High] The IRQ handler reads hardware registers before verifying the devi=
ce's power state, causing crashes on spurious interrupts.
- [High] Enabling the IRQ before Runtime PM creates a race condition that l=
eads to an unhandled interrupt storm.
- [High] Unprotected concurrent read-modify-write on the global `BAM_IRQ_SR=
CS_MSK_EE` register can permanently mask DMA interrupts.
--

--- Patch [2]: [PATCH v24 02/14] dmaengine: qcom: bam_dma: free interrupt b=
efore the clock in error path ---
commit 5c7877cf778976fcc2d921fe8fab12e7fb1eecc1
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: dmaengine: qcom: bam_dma: free interrupt before the clock in error=
 path

The BAM interrupt was requested with a devres helper, meaning on error it
was freed after probe returned and the clock was already disabled,
potentially causing crashes if the interrupt fired. This patch stops using
devres for the interrupt, instead manually freeing it before the clock is
disabled in both the error path and remove().

Fixes: e7c0fe2a5c84 ("dmaengine: add Qualcomm BAM dma driver")
Closes: https://sashiko.dev/#/patchset/20260427-qcom-qce-cmd-descr-v16-0-94=
5fd1cafbbc%40oss.qualcomm.com?part=3D2

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
This is a pre-existing issue, but does requesting the IRQ here before
Runtime PM is enabled create a race condition that could lead to an
unhandled interrupt storm?

If an error interrupt fires in the window before pm_runtime_enable() is
called, bam_dma_irq() will run, call pm_runtime_get_sync() (which returns
-EACCES), and return IRQ_NONE without acknowledging the global BAM interrup=
t.
Since the IRQ is level-triggered, won't it fire continuously?

[ ... ]
> @@ -1401,6 +1402,8 @@ static void bam_dma_remove(struct platform_device *=
pdev)
>  	struct bam_device *bdev =3D platform_get_drvdata(pdev);
>  	u32 i;
> =20
> +	free_irq(bdev->irq, bdev);
> +

[Severity: High]
Does moving free_irq() to the beginning of bam_dma_remove() create a teardo=
wn
race condition that could hang concurrent DMA clients?

If a client submits a DMA request during device removal, in the window
after free_irq() runs but before dma_async_device_unregister() removes
the device from the DMA engine, won't the transaction start but its
interrupt can never be handled?

>  	pm_runtime_force_suspend(&pdev->dev);
> =20
>  	of_dma_controller_free(pdev->dev.of_node);
> @@ -1409,8 +1412,6 @@ static void bam_dma_remove(struct platform_device *=
pdev)
>  	/* mask all interrupts for this execution environment */
>  	writel_relaxed(0, bam_addr(bdev, 0,  BAM_IRQ_SRCS_MSK_EE));

[Severity: High]
This is a pre-existing issue, but can this unconditional register access cr=
ash
the system if the clock was already disabled?

Since pm_runtime_force_suspend() forces the device to a suspended state
and disables the clock, doesn't writel_relaxed() access the memory-mapped
register BAM_IRQ_SRCS_MSK_EE without an active clock?


[Severity: High]
This isn't a bug introduced by this patch, but does the IRQ handler read
hardware registers before verifying the device's power state?

Looking at bam_dma_irq():

	srcs |=3D process_channel_irqs(bdev);

	/* kick off tasklet to start next dma transfer */
	if (srcs & P_IRQ)
		tasklet_schedule(&bdev->task);

	ret =3D pm_runtime_get_sync(bdev->dev);

If a spurious interrupt fires while the device is auto-suspended (clock
disabled), bam_dma_irq() calls process_channel_irqs() which issues an
unconditional readl_relaxed(). Could this cause a kernel panic since the
device power state is only checked later via pm_runtime_get_sync()?

[Severity: High]
This is a pre-existing issue, but can the unprotected read-modify-write on
BAM_IRQ_SRCS_MSK_EE permanently mask DMA interrupts?

Looking at bam_free_chan():

	/* mask irq for pipe/channel */
	val =3D readl_relaxed(bam_addr(bdev, 0, BAM_IRQ_SRCS_MSK_EE));
	val &=3D ~BIT(bchan->id);
	writel_relaxed(val, bam_addr(bdev, 0, BAM_IRQ_SRCS_MSK_EE));

If two different channels are initialized or freed concurrently by different
clients, could the read-modify-write operations race and cause one update to
be overwritten, since they only use per-channel locks or no locks?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-qcom-qce-c=
md-descr-v24-0-4f87bb4d9938@oss.qualcomm.com?part=3D2
