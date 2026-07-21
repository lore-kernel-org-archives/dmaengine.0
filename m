Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AAC81B78F3
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 13:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784641927; cv=none; b=Ks1SeV6bxiEorFZq5l6kCwfPOKXSuJUq2vXIB59SvqwHh17uLRJtTh2KuIgXNF5pWw5EUlE5sL3aTVl83FtQ5UGjhIS2Hxe9lDO6npansz86AMIWkLHcYM/gMgc9OSHEfTnYfyESwAoZ7WyR0bmKZ5ce4FtV5f5jxlxKx2NARKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784641927; c=relaxed/simple;
	bh=6VZgr4VAv+FMCWw/6cU6xi0hUZb3Ug5snzsLgSMQYEI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MV1TS+AqqQ7yWjurFsT8ddMIpjeaIWJ7Rt/5LTQh+Uc7kTZ6Y0we+PIE4dtjWlwA0T8poEjzWwvKeHyOK5RkRrldxbjD8QrA8Eq9Hxw9eh/bicILbmOiBL4Y+K+I0cKuQ+qynSgpJccss9slMZVfFA65ehYgXdpBmBusSyGzN/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZL73BRox; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZL73BRox"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92D941F000E9;
	Tue, 21 Jul 2026 13:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784641925;
	bh=Xo5meGE9CR2aLm17atx9EBmD2gAWiYm21DYi9tBLXHs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZL73BRoxMnuyT1UPKaLcSqZOq1Uch0CwY9AWAgHRErDAVtn7YHRc7vsM6yb+XS3Dq
	 JB4e2E/hSIBa3SHpeeuBLhhqFmpQpDA55+ZOBQ4ezmqg71Fg1ACiGmX3GA3eLRndZg
	 D0uMEiAT+n4NIRpk5u3mT4JQ34MQ199AyGhA7O2uS+LpV9gvdi2lt37Ajld5IVZuSE
	 PKJmscWLcCh5NQR3OYEx0FUHRdvbx6j4Omknp1C1pN5VMCG9DYdADbTka5v4/mCCMy
	 rq1MhxcDIVVMqbXYjsgefki1qkEuUnfzMY/n7qiZvU4/2+zs3tpo3UTlO/VMk25HLN
	 frFQWux8cL6iw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v23 03/14] dmaengine: qcom: bam_dma: convert tasklet to
 a BH workqueue
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260721-qcom-qce-cmd-descr-v23-3-1be02deffda9@oss.qualcomm.com>
References: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
 <20260721-qcom-qce-cmd-descr-v23-3-1be02deffda9@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 13:52:05 +0000
Message-Id: <20260721135205.92D941F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Teardown race condition between background work and device removal
- [High] Hardware registers accessed before verifying Runtime PM state in I=
RQ handler
- [High] Resource leak on pm_runtime_get_sync() failure
- [High] Spurious IRQ storm and permanent device disablement due to early I=
RQ request
--

--- Patch [3]: [PATCH v23 03/14] dmaengine: qcom: bam_dma: convert tasklet =
to a BH workqueue ---
commit b043c7508eb0576f9b0b8a168ece5940655bca10
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

dmaengine: qcom: bam_dma: convert tasklet to a BH workqueue

BH workqueues are a modern mechanism, aiming to replace legacy tasklets.
Let's convert the BAM DMA driver to using the high-priority variant of
the BH workqueue.

> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> index fc155e0d1870c..ea3df28e777f9 100644
> --- a/drivers/dma/qcom/bam_dma.c
> +++ b/drivers/dma/qcom/bam_dma.c
> @@ -922,9 +923,9 @@ static irqreturn_t bam_dma_irq(int irq, void *data)
> =20
>  	srcs |=3D process_channel_irqs(bdev);
> =20
> -	/* kick off tasklet to start next dma transfer */
> +	/* kick off the work queue to start next dma transfer */
>  	if (srcs & P_IRQ)
> -		tasklet_schedule(&bdev->task);
> +		queue_work(system_bh_highpri_wq, &bdev->work);
> =20
>  	ret =3D pm_runtime_get_sync(bdev->dev);

[Severity: High]
This is a pre-existing issue, but does process_channel_irqs() read hardware=
=20
registers before pm_runtime_get_sync() verifies the device is active?

If the device is runtime-suspended (clocks disabled) when a spurious or
unhandled interrupt occurs, could this unclocked read cause a bus fault?

[ ... ]

> @@ -1120,14 +1121,14 @@ static void bam_start_dma(struct bam_chan *bchan)
>  }
> =20
>  /**
> - * dma_tasklet - DMA IRQ tasklet
> - * @t: tasklet argument (bam controller structure)
> + * bam_dma_work() - DMA interrupt work queue callback
> + * @work: work queue struct embedded in the BAM controller device struct
>   *
>   * Sets up next DMA operation and then processes all completed transacti=
ons
>   */
> -static void dma_tasklet(struct tasklet_struct *t)
> +static void bam_dma_work(struct work_struct *work)

[Severity: High]
This is a pre-existing issue, but looking at bam_start_dma() which is called
by this work queue:

drivers/dma/qcom/bam_dma.c:bam_start_dma() {
    ...
	vd =3D vchan_next_desc(&bchan->vc);
	if (!vd)
		return;

	ret =3D pm_runtime_get_sync(bdev->dev);
	if (ret < 0)
		return;

If pm_runtime_get_sync() fails, it returns without dropping the usage count=
er=20
and without cleaning up the popped virt_dma descriptor.

Does this permanently leak the descriptor, hang the client waiting for=20
completion, and permanently prevent device suspend?

The same early return pattern appears in bam_free_chan().

[ ... ]

> @@ -1316,14 +1316,14 @@ static int bam_dma_probe(struct platform_device *=
pdev)
>  	if (ret)
>  		goto err_disable_clk;
> =20
> -	tasklet_setup(&bdev->task, dma_tasklet);
> +	INIT_WORK(&bdev->work, bam_dma_work);

[Severity: High]
This is a pre-existing issue, but in bam_dma_probe(), the interrupt is=20
registered before pm_runtime_enable() is called:

drivers/dma/qcom/bam_dma.c:bam_dma_probe() {
    ...
	ret =3D request_irq(bdev->irq, bam_dma_irq, ...);
    ...
	pm_runtime_enable(&pdev->dev);
    ...
}

If an error interrupt fires in this window, will pm_runtime_get_sync() in t=
he=20
IRQ handler return -EACCES because runtime PM is not yet enabled?

If so, could this cause the handler to return IRQ_NONE without clearing the=
=20
hardware interrupt (skipping BAM_IRQ_CLR), leading to an infinite IRQ loop?

[ ... ]

> @@ -1424,7 +1424,7 @@ static void bam_dma_remove(struct platform_device *=
pdev)
>  			    bdev->channels[i].fifo_phys);
>  	}
> =20
> -	tasklet_kill(&bdev->task);
> +	cancel_work_sync(&bdev->work);

[Severity: High]
This is a pre-existing issue, but is the work queue canceled after the devi=
ce=20
is forcefully suspended?

Looking at the code in bam_dma_remove():

    pm_runtime_force_suspend(&pdev->dev);
    ...
    cancel_work_sync(&bdev->work);

If bam_dma_work() executes concurrently with bam_dma_remove(), it calls
bam_start_dma(), which assumes the hardware is active.=20

If pm_runtime_force_suspend() forcefully disables the device clock before t=
he
work queue is canceled, could the background work attempt unclocked hardwar=
e=20
register access and cause a synchronous external abort?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-qcom-qce-c=
md-descr-v23-0-1be02deffda9@oss.qualcomm.com?part=3D3
