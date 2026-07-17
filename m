Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49346305E28
	for <dmaengine@vger.kernel.org>; Fri, 17 Jul 2026 08:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784278440; cv=none; b=YfsVApp3xySuRU0LfaksLNbF9C9WDC6AXyheRXz6IZwOaGK8oMpUiBMLgjt9wUQdIru2pdLCoQGceb4aXcGESkde5b21BeBMMgvLFBpBZsWOFEbmEw6sEYlsP6ccODolsPRQ35EKgVefSCn+MUOfvMSemQWFqSloI7FQmhVgM8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784278440; c=relaxed/simple;
	bh=ksjhlpkzcTRl9u/ZzJlO7Pb7SvmJNrZwob1dJcBw9pA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WHGyXzZM8r+KOPr5wiXWUlBGKuycqHMsUHowXbRmxEUDZwMSf1d2FDpSyVU8JFi07NdD2I284ztEr8oydw25ZfgbaasMXEB9WXkPZbBaTwRR9ECmT6+lv+HJoc0NTJgcexyCsEXqb5CmfTS3oi9m51neVkHTx9Md+CPSQI5NuKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=olEzqfG6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="olEzqfG6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9872E1F00A3A;
	Fri, 17 Jul 2026 08:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784278438;
	bh=a44GTuiTSylJgPvVyybU3vE+VtA9F8eyks59r6cF0UI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=olEzqfG6c+SxWVr4DqgyprrRC070cnd1jdan50XT4tlH9U4ZRR6STCipsCZErGmC+
	 oEEbqvS3bJ2Y3tb+CCYYb5FNZjcbGIS/Hd80e6pwC6X/Mdq3luG212VrfAdOoduaNR
	 97QejomSl0eXbKcvacCtO/trCT6ittQwJ43KZiBFgSiQrOOh1F8IU+rnQ2B8nC01a9
	 yuRpDuvgckVgeh0Pn6eg9qyqrrYCrSLmCM1iZRB4jLFXICjJGpI6UJ9Asz3bg+GdH2
	 83ZV+HtZQxUCy1qjNfoTUeN0mfQUBTZa/GrXgRv+CB8oKmYkv/1mnWOgfYKmXcePYG
	 vvMWf+uGggCNw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v22 03/14] dmaengine: qcom: bam_dma: convert tasklet to
 a BH workqueue
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260717-qcom-qce-cmd-descr-v22-3-ff0d18b27246@oss.qualcomm.com>
References: <20260717-qcom-qce-cmd-descr-v22-0-ff0d18b27246@oss.qualcomm.com>
 <20260717-qcom-qce-cmd-descr-v22-3-ff0d18b27246@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 08:53:58 +0000
Message-Id: <20260717085358.9872E1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The interrupt handler accesses hardware registers before verifying=
 the device's runtime PM state, risking an unclocked access crash.
- [High] Race condition between asynchronous workqueue and `pm_runtime_forc=
e_suspend` causes unclocked register access.
- [High] `bam_dma_remove` accesses hardware registers after explicitly disa=
bling device clocks.
- [High] `bam_dma_terminate_all` accesses hardware registers without acquir=
ing a runtime PM reference.
--

--- Patch [3]: [PATCH v22 03/14] dmaengine: qcom: bam_dma: convert tasklet =
to a BH workqueue ---
commit 38bf51a7c8174c93f29b343f8403a75a6af1a76e
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

dmaengine: qcom: bam_dma: convert tasklet to a BH workqueue

BH workqueues are a modern mechanism, aiming to replace legacy tasklets.
Let's convert the BAM DMA driver to using the high-priority variant of
the BH workqueue.

> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> index fc155e0d1870c..ea3df28e777f9 100644
> --- a/drivers/dma/qcom/bam_dma.c
> +++ b/drivers/dma/qcom/bam_dma.c

[ ... ]

> @@ -922,9 +923,9 @@ static irqreturn_t bam_dma_irq(int irq, void *data)
> =20
>  	srcs |=3D process_channel_irqs(bdev);
> =20

[Severity: High]
This is a pre-existing issue, but does process_channel_irqs() access
hardware registers before verifying the device's runtime PM state?

Looking at process_channel_irqs(), it performs a register read right away:

    srcs =3D readl_relaxed(bam_addr(bdev, 0, BAM_IRQ_SRCS_EE));

However, the interrupt handler only takes a PM reference via
pm_runtime_get_sync() after this call.

If a spurious interrupt arrives, or if handler execution is delayed until
after the device has entered runtime suspend and disabled the bamclk, would
this read hit unclocked hardware and crash the system?

> -	/* kick off tasklet to start next dma transfer */
> +	/* kick off the work queue to start next dma transfer */
>  	if (srcs & P_IRQ)
> -		tasklet_schedule(&bdev->task);
> +		queue_work(system_bh_highpri_wq, &bdev->work);
> =20
>  	ret =3D pm_runtime_get_sync(bdev->dev);

[ ... ]

> @@ -1424,7 +1424,7 @@ static void bam_dma_remove(struct platform_device *=
pdev)
>  			    bdev->channels[i].fifo_phys);
>  	}
> =20
> -	tasklet_kill(&bdev->task);
> +	cancel_work_sync(&bdev->work);

[Severity: High]
This isn't a bug introduced by this patch, but is there a race condition
between the work queue and pm_runtime_force_suspend() in the removal path?

In bam_dma_remove(), pm_runtime_force_suspend() is called to disable the
clock before the work queue is cancelled.

If the asynchronous work queue is executing concurrently, it could pass its
internal pm_runtime_get_sync() check before force_suspend overrides the PM
state.

Would the work queue then execute bam_start_dma() and write to unclocked
hardware registers?

[Severity: High]
This is also a pre-existing issue, but does bam_dma_remove() access
hardware registers after explicitly disabling device clocks?

In bam_dma_remove(), immediately following the pm_runtime_force_suspend()
call which disables the bamclk, it issues a writel_relaxed() to
BAM_IRQ_SRCS_MSK_EE and calls bam_dma_terminate_all() which modifies
hardware registers.

Since the clock is disabled at this point, could these accesses crash the
system during driver unbind?

[Severity: High]
While looking at bam_dma_terminate_all(), this is another pre-existing
issue, but does it access hardware registers without acquiring a runtime
PM reference?

When called by DMA clients to abort a transfer, if the channel is active,
it calls bam_chan_init_hw(), which writes to the BAM_P_RST register:

bam_dma_terminate_all()
    if (!list_empty(&bchan->desc_list)) {
        ...
        bam_chan_init_hw(bchan, async_desc->dir);
    }

However, it does not call pm_runtime_get_sync() first.

Since the driver drops its PM reference immediately after submitting a
transaction (relying on a 100ms autosuspend delay), could a client calling
terminate_all hit unclocked hardware if the device has already auto-suspend=
ed?

> =20
>  	clk_disable_unprepare(bdev->bamclk);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717-qcom-qce-c=
md-descr-v22-0-ff0d18b27246@oss.qualcomm.com?part=3D3
