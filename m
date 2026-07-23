Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF3E368D6B
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 17:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784827548; cv=none; b=bWtuu87cFSlZTSBNKlHiwsn+wsjXNcW3Nmu/0inXeHEgvW4fCUrUdXGmggURLtAjezJtLFpFDkQnIjuRxkAgZHiMBYLPiFegy/Dle1dYcsrlCtCe2jTejWlGXwg+jK+lNuyD695ZZNEyJiS3k2JJLo0VdFpx7mpMTVG+UDnZU2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784827548; c=relaxed/simple;
	bh=0RjKs7k53uKgSqQScUo78CUKv3YWr+WvYILKtajpUtk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UHSkPByoa6gyKi8a5M6XS7eZN+zDNTvv+KxNr8jbM/LR0X/JkJSO3J3ijnREYnzeKz+a+mNuh3pbb7MTbtT2qWzJ/8o3DRRnMFLLZJ3vKo7CAuBIziaT5yjiNyrjpZ9JreBD1773IlASO/FPIKFjWbFsXH0JHBLYnQRr+85iclo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 640E31F000E9;
	Thu, 23 Jul 2026 17:25:46 +0000 (UTC)
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v24 03/14] dmaengine: qcom: bam_dma: convert tasklet to
 a BH workqueue
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260723-qcom-qce-cmd-descr-v24-3-4f87bb4d9938@oss.qualcomm.com>
References: <20260723-qcom-qce-cmd-descr-v24-0-4f87bb4d9938@oss.qualcomm.com>
 <20260723-qcom-qce-cmd-descr-v24-3-4f87bb4d9938@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 17:25:44 +0000
Message-Id: <20260723172546.640E31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Hardware register accesses occur on a suspended, unclocked dev=
ice during module removal and channel termination.
- [High] Unprotected hardware access in the interrupt handler before acquir=
ing a PM runtime reference.
- [High] PM usage counter leak on pm_runtime_get_sync() error paths permane=
ntly breaks runtime PM.
--

--- Patch [3]: [PATCH v24 03/14] dmaengine: qcom: bam_dma: convert tasklet =
to a BH workqueue ---
commit 08e5256f7c45114b9d7ecdee4105f52f7321782a
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: dmaengine: qcom: bam_dma: convert tasklet to a BH workqueue

This patch converts the BAM DMA driver from using legacy tasklets to using
the high-priority variant of the BH workqueue for starting DMA transactions.

> --- a/drivers/dma/qcom/bam_dma.c
> +++ b/drivers/dma/qcom/bam_dma.c
> @@ -922,9 +923,9 @@ static irqreturn_t bam_dma_irq(int irq, void *data)
> =20
>  	srcs |=3D process_channel_irqs(bdev);

[Severity: High]
This isn't a bug introduced by this patch, but does process_channel_irqs()
read hardware registers before pm_runtime_get_sync() guarantees the clock
is enabled?

If a spurious interrupt or hardware glitch causes the IRQ handler to fire
while the device is in a runtime-suspended state, this unprotected read
could cause a fatal NoC error.

> -	/* kick off tasklet to start next dma transfer */
> +	/* kick off the work queue to start next dma transfer */
>  	if (srcs & P_IRQ)
> -		tasklet_schedule(&bdev->task);
> +		queue_work(system_bh_highpri_wq, &bdev->work);
> =20
>  	ret =3D pm_runtime_get_sync(bdev->dev);
>  	if (ret < 0)

[Severity: High]
This is also a pre-existing issue, but if pm_runtime_get_sync() fails here
and returns a negative value, the function returns IRQ_NONE without dropping
the PM usage counter.

Since pm_runtime_get_sync() increments the usage counter even on failure,
should there be a call to pm_runtime_put_noidle() on this error path to
prevent a permanent PM usage counter leak? (A similar pattern also exists in
bam_start_dma(), bam_pause(), and bam_resume()).

[ ... ]

> @@ -1424,7 +1424,7 @@ static void bam_dma_remove(struct platform_device *=
pdev)
>  			    bdev->channels[i].fifo_phys);
>  	}
> =20
> -	tasklet_kill(&bdev->task);
> +	cancel_work_sync(&bdev->work);
> =20
>  	clk_disable_unprepare(bdev->bamclk);
>  }

[Severity: Critical]
This is a pre-existing issue, but in bam_dma_remove(), is it possible for an
unclocked hardware write to BAM_IRQ_SRCS_MSK_EE to occur immediately after
the clock is disabled by pm_runtime_force_suspend() higher up in this
function?

Additionally, bam_dma_terminate_all() is called nearby, which may also
perform unclocked hardware writes via bam_chan_init_hw() if there are
pending descriptors.

Could this lead to a synchronous external abort or NoC error during module
removal or unbinding?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-qcom-qce-c=
md-descr-v24-0-4f87bb4d9938@oss.qualcomm.com?part=3D3
