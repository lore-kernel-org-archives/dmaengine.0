Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0552EEE86
	for <dmaengine@vger.kernel.org>; Sun, 30 Aug 2026 06:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788070848; cv=none; b=o3pwCCFEkFZGbpJnJcuzqF0BRE6mKc64REswHCOPzLKLKG2TDTQ/2+SvoeoiDxBkQyYA6D0maHpSaX0KDMVMD4QDpoXbmmweysjsIWP48HAH6N8uHDuZmCMOYU+MsUxxYHpc8qQfwPeEjuo6YFmLduRMH2CuAq13jeHp2okOA40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788070848; c=relaxed/simple;
	bh=W1DeoB90av+QWGzklUaLzKheCnR28zlSACF6YclntNw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=R2ZtlpD3MEKW/RFkx6TMwtow3ScrhrYzZ+esD7M91eNF5JfmmmyjPYubmxWjvb1qMDFrR23NRlqUvTVLc96R6ZGsIFOKpU44pvgJ9APTCRpA3YKWDZ+MwXxEj8H8Np2wOkFu3bC6EOqtsGgJxDfOlzgcKGNSiowLfyPudn2trnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O8XJDeJ7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O8XJDeJ7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 335911F00AC4;
	Sun, 30 Aug 2026 06:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788070846;
	bh=xRAE5VripuG96ZPUQNB1HIXRpyQAcEfjAn0/1yzeivQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O8XJDeJ7QbtDBkYPf1RWdrRzaaPmB7EpI48vdq6YpL50PGPM0oG7PMUyw6MS91lvX
	 v7ch56Jlkwgf1P95/ew26D69hUmqEboCXlih9Z0aT+7sakc9vcVgXPhNTMd3JwT6vk
	 2JiQN9o9ydyeNNmYFFdRB2V6bueVJR5mmUyjP65iEL7DH+rtkTvfCjjtOrZ5J66Fbc
	 xMSed+IQeUL75O2RsPosioxmnM8SdbFQrPBx3xVvkqoC7llVuBfRjqdfoxI0ERVsg+
	 KXYWeAwIsEG3+ZUL1WGoigcx419dqXIZBxgpHmGcDHsm7x2XmOPtOgiLcThYR6g16E
	 c04sw/11hSrNA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: mediatek: initialize tasklets before
 requesting IRQs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Runyu Xiao" <runyu.xiao@seu.edu.cn>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260830060422.2204459-1-runyu.xiao@seu.edu.cn>
References: <20260830060422.2204459-1-runyu.xiao@seu.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 Aug 2026 06:20:45 +0000
Message-Id: <20260830062046.335911F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:

New issues:
- [High] Missing `tasklet_kill()` on the `mtk_cqdma_probe()` error path res=
ults in a Use-After-Free if a tasklet is scheduled before the failure occur=
s.

Pre-existing issues:
- [High] The interrupt handler `mtk_cqdma_irq()` can crash with a NULL poin=
ter dereference if an interrupt triggers before all physical channels are a=
llocated during probe.
- [High] Requesting IRQs and registering the DMA device before enabling pow=
er domains and clocks causes asynchronous or synchronous external aborts.
- [High] Missing `of_dma_controller_free()` on the probe error path leaves =
a dangling pointer in the OF DMA list.
- [High] Incorrect teardown order in `mtk_cqdma_remove()` allows tasklets t=
o be re-scheduled after being killed.
- [High] Error path in `mtk_cqdma_prep_dma_memcpy()` frees descriptors that=
 are already linked into the virtual channel's list, causing list corruptio=
n and use-after-free.
- [High] A zero-length DMA transfer request causes an out-of-bounds access =
and crash in `mtk_cqdma_prep_dma_memcpy()`.
- [High] When issuing multiple pending descriptors, the CPU is forced to sy=
nchronously wait for hardware completion for all descriptors, stalling the =
system.
--

commit 0bc1ea9cc66d3b94f9b7b69d7f95a506a7e4bd12
Author: Runyu Xiao <runyu.xiao@seu.edu.cn>

dmaengine: mediatek: initialize tasklets before requesting IRQs

The CQDMA probe registers each physical-channel IRQ before initializing
the tasklet scheduled by the interrupt handler. A pending interrupt can
schedule an uninitialized tasklet while probe is still running.

> diff --git a/drivers/dma/mediatek/mtk-cqdma.c b/drivers/dma/mediatek/mtk-=
cqdma.c
> index 80791e30aec24..8038f14d1afb4 100644
> --- a/drivers/dma/mediatek/mtk-cqdma.c
> +++ b/drivers/dma/mediatek/mtk-cqdma.c
> @@ -815,6 +815,7 @@ static int mtk_cqdma_probe(struct platform_device *pd=
ev)
>  		INIT_LIST_HEAD(&cqdma->pc[i]->queue);
>  		spin_lock_init(&cqdma->pc[i]->lock);
>  		refcount_set(&cqdma->pc[i]->refcnt, 0);
> +		tasklet_setup(&cqdma->pc[i]->tasklet, mtk_cqdma_tasklet_cb);

[Severity: High]
Does this patch introduce a use-after-free risk on the probe error path?

By moving tasklet_setup() before devm_request_irq(), the tasklet becomes
active early. If a subsequent probe step (like mtk_cqdma_hw_init) fails,
the error path returns without killing the scheduled tasklets:

drivers/dma/mediatek/mtk-cqdma.c:mtk_cqdma_probe() {
    ...
err_unregister:
    dma_async_device_unregister(dd);
   =20
    return err;
}

If an early interrupt has already scheduled the tasklet, and devres frees
the channel memory upon probe failure, will the tasklet subsequently execute
on freed memory?


[Severity: High]
This is a pre-existing issue, but can the interrupt handler crash with a
NULL pointer dereference if an interrupt triggers before all physical chann=
els
are allocated during probe?

During mtk_cqdma_probe(), channels are allocated and their IRQs requested
sequentially in a loop. If an IRQ fires for channel 0 before channel 1 is
allocated, mtk_cqdma_irq() iterates over all channels:

drivers/dma/mediatek/mtk-cqdma.c:mtk_cqdma_irq() {
    ...
    for (i =3D 0; i < cqdma->dma_channels; ++i, schedule_tasklet =3D false)=
 {
        spin_lock(&cqdma->pc[i]->lock);
    ...
}

Would this dereference the unallocated cqdma->pc[1] and cause a crash via
spin_lock()?


[Severity: High]
This isn't a bug introduced by this patch, but does requesting IRQs and
registering the DMA device before enabling power domains and clocks risk an
external abort?

In mtk_cqdma_probe(), devm_request_irq() and dma_async_device_register()
are called before mtk_cqdma_hw_init() enables power domains and clocks.=20

If a spurious interrupt or an immediate client transaction occurs, it will
attempt to read or write unclocked hardware registers:

drivers/dma/mediatek/mtk-cqdma.c:mtk_cqdma_irq() {
    ...
    if (mtk_dma_read(cqdma->pc[i], MTK_CQDMA_INT_FLAG) ...
    ...
}

Could this lead to a synchronous external abort and a kernel panic?


[Severity: High]
This is a pre-existing issue, but does the probe error path leave a dangling
pointer in the OF DMA list?

In mtk_cqdma_probe(), the device structure pointer is added to the global
OF DMA list:

    err =3D of_dma_controller_register(pdev->dev.of_node,
                                     of_dma_xlate_by_chan_id, cqdma);

If mtk_cqdma_hw_init() fails, the error path jumps to err_unregister, which
fails to call of_dma_controller_free():

err_unregister:
    dma_async_device_unregister(dd);

    return err;

When devres frees the cqdma device structure, will this leave a dangling
pointer that can be accessed by subsequent DMA requests?

>  		cqdma->pc[i]->base =3D devm_platform_ioremap_resource(pdev, i);
>  		if (IS_ERR(cqdma->pc[i]->base))
>  			return PTR_ERR(cqdma->pc[i]->base);
> @@ -869,10 +870,6 @@ static int mtk_cqdma_probe(struct platform_device *p=
dev)
> =20
>  	platform_set_drvdata(pdev, cqdma);
> =20
> -	/* initialize tasklet for each PC */
> -	for (i =3D 0; i < cqdma->dma_channels; ++i)
> -		tasklet_setup(&cqdma->pc[i]->tasklet, mtk_cqdma_tasklet_cb);
> -
>  	dev_info(&pdev->dev, "MediaTek CQDMA driver registered\n");
> =20
>  	return 0;

[Severity: High]
This isn't a bug introduced by this patch, but does the teardown order in
mtk_cqdma_remove() allow tasklets to be re-scheduled after being killed?

VC tasklets are killed before PC hardware interrupts are disabled and
PC tasklets are killed:

drivers/dma/mediatek/mtk-cqdma.c:mtk_cqdma_remove() {
    ...
    for (i =3D 0; i < cqdma->dma_requests; i++) {
        vc =3D &cqdma->vc[i];
        ...
        tasklet_kill(&vc->vc.task);
    }
    ...
    for (i =3D 0; i < cqdma->dma_channels; i++)
        tasklet_kill(&cqdma->pc[i]->tasklet);
    ...
}

If an interrupt fires in this window and schedules a PC tasklet, couldn't
the PC tasklet call vchan_cookie_complete() and reschedule the VC tasklet
after it was already killed, leading to a use-after-free when devres frees
the tasklet memory?


[Severity: High]
This is a pre-existing issue, but does the error path in
mtk_cqdma_prep_dma_memcpy() free descriptors that are already linked into
the virtual channel's list?

Descriptors are added to the active vc->desc_allocated list:

drivers/dma/mediatek/mtk-cqdma.c:mtk_cqdma_prep_dma_memcpy() {
    ...
    tx =3D vchan_tx_prep(to_virt_chan(c), &cvd[i]->vd, flags);
    ...
}

If a subsequent memory allocation for cvd[i] fails, the error path frees
cvd[i - 1] without unlinking it:

    ...
    for (; i > 0; --i)
        kfree(cvd[i - 1]);
    return NULL;
}

Will the DMA framework later access this freed memory and cause a
use-after-free?


[Severity: High]
This isn't a bug introduced by this patch, but does a zero-length DMA
transfer request cause an out-of-bounds access?

If mtk_cqdma_prep_dma_memcpy() is called with len =3D=3D 0, the allocation
count becomes 0:

drivers/dma/mediatek/mtk-cqdma.c:mtk_cqdma_prep_dma_memcpy() {
    ...
    nr_vd =3D DIV_ROUND_UP(len, MTK_CQDMA_MAX_LEN);
    cvd =3D kzalloc_objs(*cvd, nr_vd, GFP_NOWAIT);
    ...
}

kzalloc_objs() will return the ZERO_SIZE_PTR error pointer. The
initialization loop is skipped, and the code attempts to dereference
it out-of-bounds:

    ...
    return &cvd[0]->vd.tx;
}

Could this trigger a kernel panic when a driver submits a 0-length DMA
request?


[Severity: High]
This is a pre-existing issue, but does issuing multiple pending
descriptors force the CPU to synchronously wait for hardware completion?

In mtk_cqdma_issue_vchan_pending(), the trigger_engine variable is scoped
outside the loop and never reset back to false:

drivers/dma/mediatek/mtk-cqdma.c:mtk_cqdma_issue_vchan_pending() {
    ...
    bool trigger_engine =3D false;
    ...
    if (trigger_engine)
        mtk_cqdma_start(pc, cvd);
    ...
}

For all subsequent queued descriptors, will this repeatedly execute
mtk_cqdma_start(), which busy-waits with spinlocks held and interrupts
disabled for the previous transaction to finish, potentially stalling
the system?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260830060422.2204=
459-1-runyu.xiao@seu.edu.cn?part=3D1
