Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944083C3F7B
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 21:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785187053; cv=none; b=atU0SJEMbWIROlVmau2qstgsDE71b/B/sBYrgljSOv8U1zLD+HeoQ2FoE/eiFHdhblphFdAKjnAinSkGXEkKqhJrzvhCW/7uW54IJ8G5k8FjSgphd38CQwO50qJfscZ09O/BNaISBu0buLX78fuikMIkm9EBorLoMo0goTDNIao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785187053; c=relaxed/simple;
	bh=L4kQMROuo/T5HkfMlyBRBzd9yeeZK23el0xUIwcYjf8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EMG8lcPi8cRxtBxWt88Vb0x5VPnvuH/o+jDFaZwyVrzru7X2a8S3syxUaJ6jmBJWzmEfnSdu+ZnSxQ7Y1O1bmgUUoiwonhgGrY/qIVM3VvQXF28gCbkuqByhCcGNxYj+IRqduBxUPIMKsdLJ50354i5kvrS3MgFpDwEMeBjOW/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SA6nksos; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SA6nksos"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04E931F000E9;
	Mon, 27 Jul 2026 21:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785187052;
	bh=L2NcL35OepWVOfKljX2dDJn8S3uTMbaeQDpVNMw8lG0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SA6nksosuhBLYmIB7oJzlT/L24drWMD2Cn08JTgV6h9K4NrLe2ADXRUQruEVQplEY
	 0md89K+/QiTHse8pXzFBTBXNfdQS/xxG4eTeszEa2yLuQW2f1HfeqcgXLEv6fpdzVR
	 6t6C+A+KvqUdD3zjrCMMNwgICo2EgvEztOtZiREg4nX538ZSJ4ngDshqsT2DRm1nRT
	 hCFwhwthHhdH+9uS4X3Ub4Qbg77hwax9OvHND1WkguNbuH+BiTihadUBMTGGJ13ZnQ
	 +v9xh8Pf3BbhxFyTj10JqvzR7Z3YoLef97+QfZWha+Ivq8rM/O66Ep5Ubw9fd92nUA
	 XxmDH1DJlSfKg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 48/64] dmaengine: owl-dma: kill vchan BH on teardown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <36654fac68081c725fc25c3cce5db571567d6985.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <36654fac68081c725fc25c3cce5db571567d6985.1785183549.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 21:17:31 +0000
Message-Id: <20260727211732.04E931F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The interrupt handler incorrectly processes cyclic DMA transaction=
s as if they were one-shot transfers, breaking cyclic DMA (e.g., audio play=
back) by stopping the channel after the first period.
- [High] Virtual channels stall indefinitely if their transactions are queu=
ed when all physical DMA channels are busy.
- [High] Missing `device_synchronize` callback exposes client drivers to Us=
e-After-Free vulnerabilities during channel teardown.
- [High] The driver fails to halt active hardware DMA channels during `remo=
ve()`, causing rogue DMA transfers and potential bus lockups.
--

--- Patch [48]: [PATCH v2 48/64] dmaengine: owl-dma: kill vchan BH on teard=
own ---
commit 2420d60507a6a038239d14db32bd418a2fe41702
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: owl-dma: kill vchan BH on teardown

This commit updates the driver to use dma_chan_kill_bh() for virt-dma clean=
up
during teardown, replacing the older tasklet_kill() interface.

> diff --git a/drivers/dma/owl-dma.c b/drivers/dma/owl-dma.c
> index 7c80572fc71d1..5f2140dc01cec 100644
> --- a/drivers/dma/owl-dma.c
> +++ b/drivers/dma/owl-dma.c
> @@ -1055,7 +1055,7 @@ static inline void owl_dma_free(struct owl_dma *od)
>  	list_for_each_entry_safe(vchan,
>  				 next, &od->dma.channels, vc.chan.device_node) {
>  		list_del(&vchan->vc.chan.device_node);
> -		tasklet_kill(&vchan->vc.task);
> +		dma_chan_kill_bh(&vchan->vc.chan);
>  	}
>  }

[Severity: High]
This isn't a bug introduced by this patch, but does the interrupt handler
incorrectly process cyclic DMA transactions as if they were one-shot transf=
ers?

In drivers/dma/owl-dma.c:owl_dma_interrupt():

    txd =3D vchan->txd;
    if (txd) {
        vchan->txd =3D NULL;
        vchan_cookie_complete(&txd->vd);

        if (vchan_next_desc(&vchan->vc))
            owl_dma_start_next_txd(vchan);
        else
            owl_dma_phy_free(od, vchan);
    }

It appears this unconditionally completes and removes the descriptor without
checking txd->cyclic or calling vchan_cyclic_callback(). Can this break
cyclic DMA transfers by stopping the channel after the first period?


[Severity: High]
This is a pre-existing issue, but could virtual channels stall indefinitely=
 if
their transactions are queued when all physical DMA channels are busy?

When allocating a physical channel in owl_dma_phy_alloc_and_start():

    pchan =3D owl_dma_get_pchan(od, vchan);
    if (!pchan)
        return;

If no physical channel is available, the request silently remains in the
virtual queue. However, when a physical channel is later freed in
owl_dma_phy_free():

    owl_dma_terminate_pchan(od, vchan->pchan);
    vchan->pchan =3D NULL;

The physical channel is released, but it doesn't appear to be reassigned to
other waiting virtual channels. Does this cause queued transfers on those
unassigned virtual channels to stall indefinitely?


[Severity: High]
While this isn't a bug introduced by your change, is the device_synchronize
callback missing from the DMA engine operations?

In drivers/dma/owl-dma.c:owl_dma_probe():

    od->dma.device_pause =3D owl_dma_pause;
    od->dma.device_resume =3D owl_dma_resume;
    od->dma.device_terminate_all =3D owl_dma_terminate_all;
    od->dma.src_addr_widths =3D BIT(DMA_SLAVE_BUSWIDTH_4_BYTES);

Without mapping device_synchronize to vchan_synchronize,
dmaengine_terminate_sync() acts as a no-op for synchronization. Could this
expose client drivers to use-after-free vulnerabilities if the bottom-half
continues to run concurrently after the client assumes the channel is safely
halted?


[Severity: High]
This is a pre-existing issue, but does the driver fail to cleanly halt acti=
ve
hardware DMA channels during removal?

In drivers/dma/owl-dma.c:owl_dma_remove():

    of_dma_controller_free(pdev->dev.of_node);
    dma_async_device_unregister(&od->dma);

    /* Mask all interrupts for this execution environment */
    dma_writel(od, OWL_DMA_IRQ_EN0, 0x0);

    /* Make sure we won't have any further interrupts */
    devm_free_irq(od->dma.dev, od->irq, od);

    owl_dma_free(od);

    clk_disable_unprepare(od->clk);

The removal function destroys driver resources and disables clocks, but
it doesn't seem to loop over od->pchans to smoothly halt running physical
channels via owl_dma_terminate_pchan(). Can disabling the clock while the
DMA controller is actively mastering the bus lock up the system, or cause
rogue DMA writes to freed memory?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785183549.gi=
t.allen.lkml@gmail.com?part=3D48
