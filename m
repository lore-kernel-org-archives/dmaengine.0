Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1017082D
	for <dmaengine@vger.kernel.org>; Fri, 17 Jul 2026 08:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784278245; cv=none; b=HfFlcABa6xkhj/Mn8t5NLqeGcBGyGbEP6MDU7273ttJPUpe4pOnGnDhpqR8136ig6sjumQsM8AQRC/hZVhSSDIoFWqgHmDsAvfeF/76qccfudAUrnPS4bhiTfhX56o9aVWldKKHVUdPaoIwW5DZxDW4X659aMGvzKIFnManWk8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784278245; c=relaxed/simple;
	bh=CJqO0H+c6jw8DL7ZE69wpSgcBuimYQbgv+ERbzoTYi0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CVVrzyCBScVmGOqPHEFDXYzcFmVOYNyBlSzDEXLUbE0cG9y9zfTwttmjtyfBbC5R6/7Ie+xu2lxDhQrEpLy6UhdPETI80aUYhAUGhLkSpp52vqsMKk2z1EmpsQ7JMT6Zvst7Uu6j8G/J5yg64dnaOKAbadRF+JDtyJZRtZ8ZqHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YIthHhYe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YIthHhYe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D0FB1F000E9;
	Fri, 17 Jul 2026 08:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784278244;
	bh=LOLf1k1wCdXHOa3rxKXSISpO/Zmyp89EvlY/ECBFJFY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YIthHhYei98iUju3IEpIDwFssTFPcl4VY+4dnaj5KbpSbxSo4NME7IhoxZK7zE5YX
	 WmrYHCZlO72Pxjchbci6t0+zKJaQzxg+/o8oPY9SD0sX1tBp2RK1d1U6OHgeYITp2d
	 55w52vAHEKhxTGAk6sPFullFmU9AYVp7J/8WgI0RgxJ7+niGqhO2TEj4jCDmVww8Mk
	 GIe6ic7XfGKTmGFVdbwPue+kKwwyhPbwtw2IiKxFtq0D1gpUvbBKs+4uuZ8H6Du0Ig
	 Bb1E9fcq/06ddPXD4Pv4xvYrjuDDlhZ0AvDWhY6fAzGbE5uMAe0EiQHC/qqYLsf13R
	 mcR3WUbyr72fA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v22 02/14] dmaengine: qcom: bam_dma: free interrupt
 before the clock in error path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260717-qcom-qce-cmd-descr-v22-2-ff0d18b27246@oss.qualcomm.com>
References: <20260717-qcom-qce-cmd-descr-v22-0-ff0d18b27246@oss.qualcomm.com>
 <20260717-qcom-qce-cmd-descr-v22-2-ff0d18b27246@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 08:50:43 +0000
Message-Id: <20260717085044.1D0FB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Hardware registers are accessed unconditionally in `bam_dma_remove=
` after the device clock is disabled, triggering a synchronous external abo=
rt.
- [High] The `bam_dma_irq` handler reads hardware registers before ensuring=
 the device is active, causing a system crash if an interrupt fires while s=
uspended.
- [High] Requesting the IRQ before enabling runtime PM in `bam_dma_probe` c=
reates a window for an unresolvable interrupt storm.
--

--- Patch [2]: [PATCH v22 02/14] dmaengine: qcom: bam_dma: free interrupt b=
efore the clock in error path ---
commit d0592746450db32b7c23e78cfc63961f80e670a4
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

dmaengine: qcom: bam_dma: free interrupt before the clock in error path

This commit replaces devm_request_irq() with manual request_irq() and
free_irq() to ensure the interrupt is freed before the clock is disabled
in the error path and remove(). This prevents spurious interrupts from
reading registers while the clock is powered off.

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
This is a pre-existing issue, but requesting the IRQ before enabling runtim=
e PM
in bam_dma_probe() creates a window for an unresolvable interrupt storm.

If an interrupt is pending when request_irq() is called, bam_dma_irq() fires
and calls pm_runtime_get_sync(). Because pm_runtime_enable() hasn't been ca=
lled
yet, pm_runtime_get_sync() fails, causing the handler to return IRQ_NONE
without clearing the global BAM interrupt:

bam_dma_irq()
    ...
    ret =3D pm_runtime_get_sync(bdev->dev);
    if (ret < 0)
        return IRQ_NONE;

    if (srcs & BAM_IRQ) {
        clr_mask =3D readl_relaxed(bam_addr(bdev, 0, BAM_IRQ_STTS));
        ...

Because the IRQ is requested with IRQF_TRIGGER_HIGH, the controller will
immediately re-fire, locking up the CPU. Could the IRQ request be moved aft=
er
runtime PM is enabled?

[Severity: High]
This is another pre-existing issue, but the bam_dma_irq() handler reads
hardware registers before ensuring the device is active.=20

If an interrupt fires while suspended (e.g., from a shared line or a race),
the handler calls process_channel_irqs(), which immediately executes a
readl_relaxed():

bam_dma_irq()
    srcs |=3D process_channel_irqs(bdev);
        ...
        process_channel_irqs()
            srcs =3D readl_relaxed(bam_addr(bdev, 0, BAM_IRQ_SRCS_EE));

This happens before pm_runtime_get_sync() is called to wake the device, whi=
ch
will cause a synchronous external abort (kernel panic) on ARM platforms if =
the
clock is disabled. Should the runtime PM wake happen before accessing any
registers?

>  	if (ret)
>  		goto err_bam_channel_exit;
> =20
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
> =20
> -	devm_free_irq(bdev->dev, bdev->irq, bdev);
> -
>  	for (i =3D 0; i < bdev->num_channels; i++) {
>  		bam_dma_terminate_all(&bdev->channels[i].vc.chan);

[Severity: High]
This isn't a bug introduced by this patch, but hardware registers are acces=
sed
unconditionally in bam_dma_remove() after the device clock is disabled.

When pm_runtime_force_suspend() is called, it invokes the runtime suspend
callback to disable the BAM clock. Immediately after this, the function cal=
ls
writel_relaxed() to mask interrupts:

bam_dma_remove()
    ...
    pm_runtime_force_suspend(&pdev->dev);
    ...
    writel_relaxed(0, bam_addr(bdev, 0,  BAM_IRQ_SRCS_MSK_EE));

It also calls bam_dma_terminate_all(), which resets the channel via
bam_chan_init_hw() and performs multiple unclocked hardware accesses.

Accessing hardware registers while the peripheral clock is disabled causes a
synchronous external abort on Qualcomm ARM platforms. Should the register
accesses and termination happen before pm_runtime_force_suspend()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717-qcom-qce-c=
md-descr-v22-0-ff0d18b27246@oss.qualcomm.com?part=3D2
