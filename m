Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E31226980F
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 17:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784827696; cv=none; b=LMEhfC3gnYCl5JyxYjY60Gk1ro1Q0jD8+texXWbx5pe4+7gRxodjMchht3FnJzeR3U+hc9exSaMOwlW0wGr77Qoc5Ot2feW9gE3tsdsqHNMQLW0gSBOMOnn2c889Ff2bUuIiKPfbjv/2uhI/ByHN2T3nIQ2229l0t4vlvnh4qKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784827696; c=relaxed/simple;
	bh=KaYghs+Kgn7zSVOwFEoDiRJ6PZhrP+zEFynADqoTqbI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lAfk75OtVrC3eyIdaW1vNoiugV+C1j/Nf3opEZCYCD9xRxVMTDnSN6b/MNIjMzfFWMEBUt1XGIznK3BmJ02VYoHei3Y3KQGRuY+ENvUNx4uArOaZ3SbAIfIHayre3rRjSkWuUKFq9yui39YFQI7BexcIfo2Cwz8uApH4qCUt6NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DcFn1MIC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DcFn1MIC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 661591F000E9;
	Thu, 23 Jul 2026 17:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784827694;
	bh=UTcKUWY/ZxdybLGUpWBdVVyyCsn4VmuVy78eGXO4JBM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DcFn1MICXt2BFlrOZEktguf0aheh6uxscI2Yp4l99FZ3xGYhUYNozAljP1rPmer+Q
	 I3n9tyLDNUQ+rNQvYsx8wdX1PEAC3hzwY3O3B1ZS0cMyOe/s8O2OvxXwsNI5MDh/KH
	 O8RLEkKSXQKOaSv/pKZIXH0xLftFTRaIgk4cN6FAga+HAtfSS37pgKi3g+xHitTebQ
	 0JO/uvCXnvRWCXKnIBcUlreE1k4DuwRHReOJB9MZEcMbVaCcxmo05vCzjfQr0vIUVx
	 F3ASgs0uMzwS+CYQDA2PSReBRNJJNgTXXXqNsJxQDQk701M0orrCXno8ombldfvgQp
	 c+s8yBcOPmhNg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v24 06/14] dmaengine: qcom: bam_dma: add support for BAM
 locking
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260723-qcom-qce-cmd-descr-v24-6-4f87bb4d9938@oss.qualcomm.com>
References: <20260723-qcom-qce-cmd-descr-v24-0-4f87bb4d9938@oss.qualcomm.com>
 <20260723-qcom-qce-cmd-descr-v24-6-4f87bb4d9938@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 17:28:13 +0000
Message-Id: <20260723172814.661591F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] Calling `queue_work()` inside `bam_start_dma()` when there is exac=
tly 1 slot available creates an infinite busy-loop in softirq context (soft=
lockup).
- [High] The transaction completion callback fires before the hardware pipe=
 is actually unlocked, violating the mutual exclusion requirement.
- [High] The driver clears the software lock state prematurely, allowing co=
ncurrent configuration changes to corrupt in-flight hardware execution.
- [Medium] The 'reserved' field of the lock command element is left uniniti=
alized before being synced to the device.

Pre-existing issues:
- [Critical] Mismatch between FIFO wrapping modulo and CIRC_SPACE size lead=
s to silent descriptor overwrites and data corruption.
--

--- Patch [6]: [PATCH v24 06/14] dmaengine: qcom: bam_dma: add support for =
BAM locking ---
commit bf87fb2cf384d859e1e0efff5d0a48f0cb3ccea2
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

dmaengine: qcom: bam_dma: add support for BAM locking

Add support for BAM pipe locking. To that end: when starting DMA on a TX
channel (DMA_MEM_TO_DEV) - prepend the existing queue of issued
descriptors with an additional "dummy" command descriptor with the LOCK
bit set. Once the transaction is done (no more issued descriptors),
issue one more dummy descriptor with the UNLOCK bit.

> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> --- a/drivers/dma/qcom/bam_dma.c
> +++ b/drivers/dma/qcom/bam_dma.c

[ ... ]

> @@ -676,10 +697,51 @@ static void bam_free_chan(struct dma_chan *chan)
>  static int bam_slave_config(struct dma_chan *chan,
>  			    struct dma_slave_config *cfg)
>  {
> +	struct bam_config *peripheral_cfg =3D cfg->peripheral_config;
>  	struct bam_chan *bchan =3D to_bam_chan(chan);
> +	const struct bam_device_data *bdata =3D bchan->bdev->dev_data;
> +
> +	if (peripheral_cfg && cfg->peripheral_size !=3D sizeof(*peripheral_cfg))
> +		return -EINVAL;
> =20
>  	guard(spinlock_irqsave)(&bchan->vc.lock);
> =20
> +	/*
> +	 * This is required to setup the pipe locking and must be done even
> +	 * before the first call to bam_start_dma().
> +	 */
> +	if (bdata->pipe_lock_supported && peripheral_cfg) {
> +		if (cfg->direction !=3D DMA_MEM_TO_DEV)
> +			return -EINVAL;
> +
> +		if (bchan->bam_locked)
> +			return -EBUSY;
> +
> +		if (!bchan->lock_ce) {
> +			bchan->lock_ce =3D kmalloc_obj(*bchan->lock_ce, GFP_ATOMIC);

[Severity: Medium]
Will this leave the reserved field of the command element uninitialized?

Looking at how this is initialized in include/linux/dma/qcom_bam_dma.h:

static inline void
bam_prep_ce_le32(struct bam_cmd_element *bam_ce, u32 addr,
                 enum bam_command_type cmd, __le32 data)
{
        bam_ce->cmd_and_addr =3D
                cpu_to_le32((addr & 0xffffff) | ((cmd & 0xff) << 24));
        bam_ce->data =3D data;
        bam_ce->mask =3D cpu_to_le32(0xffffffff);
}

The reserved field is not set here, and kmalloc_obj() does not zero the
memory. Could this map and sync uninitialized kernel heap memory to the DMA
hardware?

[ ... ]

> @@ -1064,22 +1145,34 @@ static void bam_start_dma(struct bam_chan *bchan)
> =20
>  	lockdep_assert_held(&bchan->vc.lock);
> =20
> -	if (!vd)
> +	vd =3D vchan_next_desc(&bchan->vc);
> +	if (IS_BUSY(bchan) || (!vd && !bchan->bam_locked))
>  		return;
> =20
>  	ret =3D pm_runtime_get_sync(bdev->dev);
>  	if (ret < 0)
>  		return;
> =20
> +	if (!bchan->initialized)
> +		bam_chan_init_hw(bchan, container_of(vd, struct bam_async_desc, vd)->d=
ir);
> +
> +	if (bchan->locking_enabled && !bchan->bam_locked) {
> +		/* Defer locking until we also have space for a data descriptor */
> +		avail =3D CIRC_SPACE(bchan->tail, bchan->head, MAX_DESCRIPTORS + 1);

[Severity: Critical]
This is a pre-existing issue, but does CIRC_SPACE() calculate the correct
available space when bchan->tail wraps at 4095?

MAX_DESCRIPTORS is 4095. Down below in bam_start_dma(), the pointers wrap
via:

    bchan->tail +=3D async_desc->xfer_len;
    bchan->tail %=3D MAX_DESCRIPTORS;

Since bchan->tail wraps to 0 after 4094, it never reaches 4095. However,
CIRC_SPACE() is called with MAX_DESCRIPTORS + 1 (4096). Because
CIRC_SPACE() assumes the pointers wrap at the provided power-of-2 size, when
the buffer is full (tail =3D=3D head), won't it incorrectly evaluate the sp=
ace as
4095 and cause a massive buffer overrun?

> +		if (avail < 2) {
> +			queue_work(system_bh_highpri_wq, &bdev->work);
> +			goto out;
> +		}

[Severity: High]
Can this early return cause an infinite busy-loop softlockup?

If exactly one slot is available (avail =3D=3D 1), queue_work() is called a=
nd
we return. The worker executes bam_dma_work():

    if ((!list_empty(&bchan->vc.desc_issued) || bchan->bam_locked) &&
        !IS_BUSY(bchan))
        bam_start_dma(bchan);

Since IS_BUSY() only tests for avail =3D=3D 0, the check passes and
bam_start_dma() is immediately called again. It sees avail < 2 again,
queues the work again, and returns. Could this loop indefinitely in softirq
context until a hardware interrupt eventually fires?

[ ... ]

> @@ -1135,11 +1228,24 @@ static void bam_start_dma(struct bam_chan *bchan)
>  		if (((avail <=3D async_desc->xfer_len) || !vd ||
>  		     dmaengine_desc_callback_valid(&cb)) &&
>  		    !(async_desc->flags & DESC_FLAG_EOT))
>  			desc[async_desc->xfer_len - 1].flags |=3D
>  				cpu_to_le16(DESC_FLAG_INT);

[Severity: High]
Does this cause the transaction completion callback to fire before the
hardware pipe is actually unlocked?

DESC_FLAG_INT is set on the data descriptor here, regardless of whether an
UNLOCK descriptor will immediately follow. When the data descriptor complet=
es,
an interrupt is generated and process_channel_irqs() completes the cookie:

    if (!async_desc->num_desc)
        vchan_cookie_complete(&async_desc->vd);

Could this notify client drivers of transaction completion while the UNLOCK
descriptor is still pending in the hardware FIFO, allowing clients to modify
state or power down the device prematurely?

[ ... ]

> +	/*
> +	 * Close the bracket once there is no more client work queued. The
> +	 * UNLOCK is flagged for an interrupt so process_channel_irqs() is
> +	 * guaranteed to observe its completion and retire it from the FIFO
> +	 * promptly, instead of leaving bchan->head to lag until a later
> +	 * bracket's skip-loop catches up with it.
> +	 */
> +	if (bchan->bam_locked && !vd && !IS_BUSY(bchan)) {
> +		bam_fifo_write_lock(bchan, DESC_FLAG_UNLOCK | DESC_FLAG_INT);
> +		bchan->bam_locked =3D false;
> +	}

[Severity: High]
Is the software lock state cleared too early here?

We synchronously set bchan->bam_locked to false immediately after placing t=
he
UNLOCK descriptor into the software FIFO, before the hardware has actually
completed the transaction.=20

If a client then calls bam_slave_config(), the -EBUSY check for
bchan->bam_locked will pass, and the driver might overwrite bchan->lock_ce
or configuration registers while the hardware is still busy processing
in-flight descriptors. Does this violate the mutual exclusion requirement?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-qcom-qce-c=
md-descr-v24-0-4f87bb4d9938@oss.qualcomm.com?part=3D6
