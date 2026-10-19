Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792427614;
	b=lv+JsPVpm5UKsd7x7LQK/HCU6q1rn2HhPJIWBuvMKY3bcbnNVgrd1+lytooZcEONlfJY
	 0y3Usou4Z5Ne7UMKExlVq85n1zogRP2oA4etuNgkGxeJbb5IsJkDdkVoVfA9qgohqI/AQ
	 EqiWCiUMTSBRkfWA79lJ40/qH6LwXp+Kr21B6uIyIfyzU5Seew1SkkxoNY/Sz4vpqBXUt
	 7e/zOqcsRLMZuGQZjMm3nlJAuxDGCwNbPnRj3pX1mfBvIXid9HNdsfFs5K+sNXS08hKoM
	 xPUM1t7r6BgJigcAt4Jas1cdEZitISExnoU/aSwWgpJPzj8a92GnB4e15bPCfLxNLwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792427614;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ilb/Wz8g6IKQOjM/gDfIe/vHvIQRdHLtIdNjeBVBjQA=;
	b=KR7adCf41ut4KvUd7Ofko1yadaBjEz+4L8EXW3PeNoQEvrtjk3OxSfGOiEKZodO6PVyd
	 XXHFCvLZRe6zw8QJCzBm/v+DR40K42wh/pjjAWlUxGZ8DebogZWD80i4QifQeTRB6OhvV
	 MMyCLlZl0ncc9NFtFACdICOKA2KXfpBKmv7LuYB3dxxBRY3+kFRfe8vUgU7+AvWbc6Oxo
	 B+k09IDxGaOF2dokrKino0SiSPDo0iO6yJS2Jkd0YPX4qentihbmakRdH94MrIa1Fgpds
	 DByOhYRfzp/4HTJIluzXn02s4LbDxU5+BBv2xsLHlwAFNQvA5YH4CWzTTvhnHDUtGWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ALwf4oqd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C53606A31E
	for <dmaengine@vger.kernel.org>; Mon, 19 Oct 2026 16:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ALwf4oqd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FDCC1F000C4;
	Mon, 19 Oct 2026 16:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792427613;
	bh=ilb/Wz8g6IKQOjM/gDfIe/vHvIQRdHLtIdNjeBVBjQA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ALwf4oqdledy9jCFlt3AGK+5L58kKFfWTcCuG9cthm9c6IR62iCU9+1B1FM5to7Ew
	 77HYi82cG0V3h3yHTa39MunEiechBxjVN20b9DDZcnpSuBDPmac8H49tUqZD3FYgxi
	 5FnA/xNCDeOB2KwtaihwEXBK+zGdA5C1Ox1WOCVW0az7ZDHd0f+LCkw3VM5kAaGv2t
	 pIRqZcuxaF0iZOH9O25BC3JdCq3b1jpXYm11d63Wyy9bMe7V2+11jHB1HGRbtfwd28
	 6yZxy4ZaZj1xHmxgV1MQsfnYjjws6+XaU3NJ9HNZweMe43mFwp8OXBzoVZRiS3V6t8
	 J+m1F2uw3Z+eQ==
Message-ID: <sashiko-outbox-177912@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] dmaengine: idxd: generation-number transaction
 status
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Byrne" <daniel1.byrne@intel.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261019150632.4026424-3-daniel1.byrne@intel.com>
References: <20261019150632.4026424-1-daniel1.byrne@intel.com>
 <20261019150632.4026424-3-daniel1.byrne@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 16:33:32 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [Critical] dmaengine: idxd: pre-halt epoch in idxd_dma_tx_submit() frees =
active desc
- [Critical] dmaengine: idxd: cookie 0 in idxd_dma_tx_status() double-frees=
 wq->descs[0]
- [High] dmaengine: idxd: unordered state and reset_epoch in idxd_dma_tx_st=
atus()
- [High] dmaengine: idxd: untracked polled descriptors leak on terminate or=
 abandon
- [High] dmaengine: idxd: unretired desc on disabled state in idxd_dma_tx_s=
tatus()
- [High] dmaengine: idxd: stale txd state on submit failure in idxd_dma_tx_=
submit()
- [Medium] dmaengine: idxd: late epoch read in idxd_dma_synchronize() wedge=
s workqueue
--

commit e4c3f180dc3ed131fd6df39a4bcc607512483269
Author: Daniel Byrne <daniel1.byrne@intel.com>

dmaengine: idxd: generation-number transaction status

This commit implements per-descriptor transaction status polling in
idxd_dma_tx_status() by encoding the descriptor slot ID, a 14-bit generation
counter, and an interrupt flag in the DMA cookie, and uses a device
reset_epoch counter to retire polled descriptors caught by a device halt.

> diff --git a/drivers/dma/idxd/dma.c b/drivers/dma/idxd/dma.c
> index 0a7517cb51f29..dd5a9d9274ce6 100644
> --- a/drivers/dma/idxd/dma.c
> +++ b/drivers/dma/idxd/dma.c

[ ... ]

> @@ -154,11 +168,128 @@ static void idxd_dma_free_chan_resources(struct dm=
a_chan *chan)
>  		idxd_wq_refcount(wq));
>  }
> =20
> +/*
> + * A cookie has exactly one polling owner, the client that submitted the
> + * transaction. Observing a terminal completion record here retires and
> + * recycles the descriptor, since a polled descriptor has no interrupt
> + * and nobody else will. Two contexts polling the same live cookie
> + * would race that recycle, which every in-tree dmaengine polling
> + * client already avoids by construction.
> + */
>  static enum dma_status idxd_dma_tx_status(struct dma_chan *dma_chan,
>  					  dma_cookie_t cookie,
>  					  struct dma_tx_state *txstate)
>  {
> -	return DMA_OUT_OF_ORDER;
> +	struct idxd_wq *wq;
> +	struct idxd_desc *desc;
> +	u32 idx;
> +	u8 status;
> +
> +	if (txstate)
> +		memset(txstate, 0, sizeof(*txstate));
> +
> +	if (dma_submit_error(cookie))
> +		return DMA_ERROR;
> +
> +	wq =3D to_idxd_wq(dma_chan);
> +
> +	idx =3D cookie & DESC_ID_MASK;
> +	if (idx >=3D wq->num_descs)
> +		return DMA_ERROR;
> +
> +	desc =3D wq->descs[idx];
> +
> +	/*
> +	 * Descriptors with a completion interrupt armed (RCI) are
> +	 * completed and recycled by the IRQ handler. Reading their
> +	 * completion record here would race with the handler, and so
> +	 * would reading the recycled descriptor's flags, which is why
> +	 * the property travels in the cookie the caller owns. The handler
> +	 * invalidates the cookie on completion, so a matching cookie means
> +	 * the command is still in progress.
> +	 */
> +	if (cookie & IDXD_COOKIE_RCI)
> +		return READ_ONCE(desc->txd.cookie) =3D=3D cookie ?
> +			DMA_IN_PROGRESS : DMA_COMPLETE;
> +
> +	if (desc->txd.cookie !=3D cookie) {
> +		/*
> +		 * The cookie belongs to an old transaction that has
> +		 * already completed and been recycled.
> +		 */
> +		return DMA_COMPLETE;
> +	}

[Severity: Critical]
What happens here when a caller passes cookie =3D=3D 0 (or any cookie whose
generation field is 0) to idxd_dma_tx_status()?

For example, ntb_transport_free_queue() in drivers/ntb/ntb_transport.c calls
dma_sync_wait(chan, qp->last_cookie) when tearing down a queue, where
qp->last_cookie is 0 if no transfer was submitted.

Because dma_submit_error(0) returns 0, cookie =3D=3D 0 selects wq->descs[0].
When wq->descs[0] is free (either newly allocated or previously completed v=
ia
idxd_dma_complete_txd() -> dma_cookie_complete()), desc->txd.cookie is 0 and
desc->cpu is -1.

As a result, desc->txd.cookie !=3D cookie evaluates 0 !=3D 0 (false). If
wq->descs[0] completed a previous transaction, desc->completion->status is
still non-zero (or if a halt occurred, desc->epoch !=3D reset_epoch), so
idxd_dma_tx_status() calls idxd_dma_complete_txd() -> idxd_free_desc() on
the already-free wq->descs[0]:

drivers/dma/idxd/submit.c:idxd_free_desc() {
	int cpu =3D desc->cpu;

	desc->cpu =3D -1;
	sbitmap_queue_clear(&wq->sbq, desc->id, cpu);
}

Passing cpu =3D -1 into sbitmap_queue_clear() -> sbitmap_update_cpu_hint() =
on a
non-round-robin sbitmap_queue executes *per_cpu_ptr(sb->alloc_hint, -1) =3D=
 0,
causing an out-of-bounds per-CPU write, or double-freeing slot 0 if another
thread just allocated it in idxd_alloc_desc() before reaching
idxd_dma_tx_submit().

Should idxd_dma_tx_status() reject cookies with cookie < DMA_MIN_COOKIE or a
zero generation field before indexing wq->descs[]?

> +
> +	status =3D desc->completion->status & DSA_COMP_STATUS_MASK;
> +
> +	if (status) {
> +		/* Capture completion record fields before desc is freed below. */
> +		u8 fault_info =3D desc->completion->fault_info;
> +		u64 fault_addr =3D desc->completion->fault_addr;
> +
> +		/*
> +		 * Check against the original status because ABORT is
> +		 * software defined as 0xff, which DSA_COMP_STATUS_MASK
> +		 * can mask out.
> +		 */
> +		if (unlikely(desc->completion->status =3D=3D IDXD_COMP_DESC_ABORT))
> +			idxd_dma_complete_txd(desc, IDXD_COMPLETE_ABORT, true, NULL, NULL);
> +		else
> +			idxd_dma_complete_txd(desc, IDXD_COMPLETE_NORMAL, true, NULL, NULL);
> +
> +		dev_dbg(&wq->idxd->pdev->dev,
> +			"dsa completion: status=3D0x%02x fault_info=3D0x%02x fault_addr=3D0x%=
llx\n",
> +			status, fault_info, fault_addr);
> +
> +		if (status =3D=3D DSA_COMP_SUCCESS)
> +			return DMA_COMPLETE;
> +
> +		return DMA_ERROR;
> +	}
> +
> +	/*
> +	 * The descriptor is genuinely outstanding. A polled descriptor
> +	 * carries no interrupt, so nothing but this function will ever
> +	 * retire it, and a work queue or device that is no longer enabled
> +	 * will not complete it either. Report the failure instead of
> +	 * leaving the caller polling forever.

[Severity: High]
Since a polled descriptor is not submitted with IDXD_OP_FLAG_RCI,
__idxd_submit_desc() does not add it to wq->ie.pending_llist:

drivers/dma/idxd/submit.c:__idxd_submit_desc() {
	if (desc_flags & IDXD_OP_FLAG_RCI) {
		ie =3D &wq->ie;
		desc->hw->int_handle =3D ie->int_handle;
		if (submitter_cleans)
			desc->terminate_gen =3D READ_ONCE(wq->terminate_gen);
		llist_add(&desc->llnode, &ie->pending_llist);
	}
}

If a client calls dmaengine_terminate_all() / dmaengine_terminate_sync() (f=
or
example, dmatest_func() in drivers/dma/dmatest.c or nvmet_pci_epf_dma_trans=
fer()
after a timeout) or abandons a cookie without polling it to a terminal resu=
lt,
idxd_dma_terminate_all() -> __idxd_wq_flush_descs() only flushes
ie->pending_llist and ie->work_list.

Does this leak the descriptor slot in wq->sbq and its desc->txd.unmap buffer
while also bypassing the quarantine mechanism in idxd_dma_synchronize() for
in-flight polled descriptors?

> +	 *
> +	 * A descriptor submitted before a device halt is dead for good:
> +	 * the halt ended the engines and the reset that follows starts
> +	 * them empty, so its record will never be written even once the
> +	 * device is enabled again. Only in that case can the descriptor
> +	 * be retired here safely; otherwise the pool would shrink by one
> +	 * for every descriptor caught by a halt.
> +	 */
> +	if (desc->epoch !=3D READ_ONCE(wq->idxd->reset_epoch)) {
> +		idxd_dma_complete_txd(desc, IDXD_COMPLETE_ABORT, true, NULL, NULL);
> +		return DMA_ERROR;
> +	}
> +	/*
> +	 * A device that is no longer enabled runs nothing it holds, so an
> +	 * outstanding descriptor on it has failed. A halt stores its state
> +	 * before it bumps the epoch, and this poll may have read the epoch
> +	 * before the halt and the state after it, so the epoch is read
> +	 * again: only the retire frees the slot of a descriptor the halt
> +	 * caught. A halted device whose epoch still matches is between the
> +	 * two stores, and the next poll retires the descriptor. The submit
> +	 * reads the state after the stamp, so it refuses a descriptor
> +	 * stamped with the bumped epoch.
> +	 */
> +	if (wq->idxd->state !=3D IDXD_DEV_ENABLED) {
> +		if (desc->epoch !=3D READ_ONCE(wq->idxd->reset_epoch)) {
> +			idxd_dma_complete_txd(desc, IDXD_COMPLETE_ABORT, true,
> +					      NULL, NULL);
> +			return DMA_ERROR;
> +		}
> +		if (wq->idxd->state =3D=3D IDXD_DEV_HALTED)
> +			return DMA_IN_PROGRESS;
> +		return DMA_ERROR;
> +	}
> +	if (wq->state !=3D IDXD_WQ_ENABLED)
> +		return DMA_ERROR;
> +
> +	return DMA_IN_PROGRESS;
>  }

[Severity: High]
There appear to be two issues in the non-enabled state handling at the end =
of
idxd_dma_tx_status():

First, wq->idxd->state is read twice without READ_ONCE() and without memory
barriers ordering it against READ_ONCE(wq->idxd->reset_epoch), while
idxd_halt() in drivers/dma/idxd/irq.c also writes idxd->state =3D IDXD_DEV_=
HALTED
without WRITE_ONCE() or a write barrier before bumping idxd->reset_epoch:

drivers/dma/idxd/irq.c:idxd_halt() {
	if (gensts.state =3D=3D IDXD_DEVICE_STATE_HALT) {
		idxd->state =3D IDXD_DEV_HALTED;
		WRITE_ONCE(idxd->reset_epoch, idxd->reset_epoch + 1);
}

If a poller observes wq->idxd->state !=3D IDXD_DEV_ENABLED (because it is
IDXD_DEV_HALTED) and desc->epoch =3D=3D READ_ONCE(wq->idxd->reset_epoch) be=
fore
idxd_halt() increments reset_epoch, and idxd_halt() then bumps reset_epoch =
and
transitions idxd->state to IDXD_DEV_DISABLED or IDXD_DEV_ENABLED before the
second check:

	if (wq->idxd->state =3D=3D IDXD_DEV_HALTED)
		return DMA_IN_PROGRESS;
	return DMA_ERROR;

won't the second read of wq->idxd->state see a state other than
IDXD_DEV_HALTED and return terminal DMA_ERROR without retiring desc?
Similarly, without barriers between idxd->state and idxd->reset_epoch in
idxd_halt() and the submit path, can a submitter observe the bumped
reset_epoch before observing idxd->state =3D=3D IDXD_DEV_HALTED, stamping a=
 dead
descriptor with the post-halt epoch so polling returns DMA_IN_PROGRESS
forever after software reset?

Second, when idxd_dma_tx_status() returns terminal DMA_ERROR because
wq->idxd->state =3D=3D IDXD_DEV_DISABLED (for example after idxd_device_dis=
able(),
which drains/disables the device without changing reset_epoch) or because
wq->state !=3D IDXD_WQ_ENABLED (after idxd_wq_disable() or idxd_wq_reset()),
it does not call idxd_dma_complete_txd().

Since idxd_wq_disable(), idxd_wq_reset(), and idxd_device_disable() only set
the disabled state after hardware has stopped, doesn't returning DMA_ERROR
here without calling idxd_dma_complete_txd(desc, IDXD_COMPLETE_ABORT, true,
NULL, NULL) leak desc->txd.unmap and the descriptor slot in wq->sbq, while
leaving desc->txd.cookie intact?

> @@ -177,7 +308,17 @@ static dma_cookie_t idxd_dma_tx_submit(struct dma_as=
ync_tx_descriptor *tx)
>  	int rc;
>  	struct idxd_desc *desc =3D container_of(tx, struct idxd_desc, txd);
> =20
> -	cookie =3D dma_cookie_assign(tx);
> +	cookie =3D (desc->gen << DESC_ID_BITS) | (desc->id & DESC_ID_MASK);
> +	if (desc->hw->flags & IDXD_OP_FLAG_RCI)
> +		cookie |=3D IDXD_COOKIE_RCI;
> +
> +	if (desc->gen =3D=3D DESC_GEN_MAX)
> +		desc->gen =3D 1;
> +	else
> +		desc->gen++;
> +
> +	tx->cookie =3D cookie;
> +	desc->epoch =3D READ_ONCE(wq->idxd->reset_epoch);
> =20
>  	rc =3D idxd_submit_desc(wq, desc);
>  	if (rc < 0) {

[Severity: Critical]
Can stamping desc->epoch in idxd_dma_tx_submit() before calling
idxd_submit_desc() cause an active post-reset descriptor to be prematurely
unmapped and freed by idxd_dma_tx_status()?

In idxd_dma_tx_submit(), desc->epoch is read before idxd_submit_desc() ->
__idxd_submit_desc() acquires wq->wq_active:

drivers/dma/idxd/submit.c:__idxd_submit_desc() {
	if (!percpu_ref_tryget_live(&wq->wq_active)) {
		wait_for_completion(&wq->wq_resurrect);
		if (!percpu_ref_tryget_live(&wq->wq_active))
			return -ENXIO;
	}

	smp_rmb();
	if (idxd->state !=3D IDXD_DEV_ENABLED) {
		percpu_ref_put(&wq->wq_active);
		return -EIO;
	}
}

If a thread reads desc->epoch in idxd_dma_tx_submit() (say epoch E), and th=
en
a software-reset halt occurs in idxd_halt() (bumping idxd->reset_epoch to
E + 1, killing and reviving wq->wq_active in idxd_wqs_halt_flush(idxd, true=
),
and re-enabling the device in idxd_device_reinit()), the submitter can wait=
 on
wq->wq_resurrect (or be preempted before percpu_ref_tryget_live()), wake up
after idxd_device_reinit() sets idxd->state =3D IDXD_DEV_ENABLED, and submit
desc to the newly enabled hardware while desc->epoch is still E.

When the client then polls idxd_dma_tx_status() while hardware is still
executing the descriptor, desc->epoch !=3D READ_ONCE(wq->idxd->reset_epoch)
(E !=3D E + 1) matches and calls idxd_dma_complete_txd(desc,
IDXD_COMPLETE_ABORT, true, NULL, NULL), unmapping the DMA buffers and freei=
ng
the descriptor slot while the DMA engine is still writing to them.

Should desc->epoch instead be stamped inside __idxd_submit_desc() after
acquiring wq->wq_active and before checking idxd->state !=3D IDXD_DEV_ENABL=
ED
(similar to how desc->terminate_gen is stamped while holding wq->wq_active)?

[Severity: High]
Also in idxd_dma_tx_submit(), when idxd_submit_desc(wq, desc) returns an er=
ror
(rc < 0), idxd_free_desc(wq, desc) is called directly:

	tx->cookie =3D cookie;
	desc->epoch =3D READ_ONCE(wq->idxd->reset_epoch);

	rc =3D idxd_submit_desc(wq, desc);
	if (rc < 0) {
		idxd_free_desc(wq, desc);
		return rc;
	}

In __idxd_submit_desc(), llist_abort_desc() is only called if submission fa=
ils
after pending_llist insertion and only when ie is non-NULL (which is only t=
rue
for IDXD_OP_FLAG_RCI descriptors). If __idxd_submit_desc() fails early (e.g.
idxd->state !=3D IDXD_DEV_ENABLED or wq_active is dead) or if idxd_enqcmds()
fails for a polled descriptor where ie is NULL, desc is freed back to wq->s=
bq
with tx->cookie, tx->callback, tx->callback_result, and tx->unmap still set.

When that slot is later reallocated by a polling client that does not set a
callback and is completed by idxd_dma_tx_status() -> idxd_dma_complete_txd(=
),
won't dmaengine_desc_get_callback_invoke() invoke the stale callback from t=
he
earlier failed submission?

> @@ -219,6 +360,7 @@ static void idxd_dma_synchronize(struct dma_chan *c)
>  {
>  	struct idxd_wq *wq =3D to_idxd_wq(c);
>  	LIST_HEAD(quarantined);
> +	u32 epoch;
> =20
>  	/*
>  	 * dmaengine_synchronize() promises the client that its memory may
> @@ -240,7 +382,13 @@ static void idxd_dma_synchronize(struct dma_chan *c)
>  	 * Only a device reset ends the exposure of the client's memory.
>  	 */
>  	idxd_wq_quarantine_take(wq, &quarantined);
> -	if (!idxd_wq_drain(wq)) {
> +	/*
> +	 * A halt during the drain kills every descriptor submitted before
> +	 * it, which is all of them, and a reset that followed may have
> +	 * ended the drain itself. Such a drain is as good as complete.
> +	 */
> +	epoch =3D READ_ONCE(wq->idxd->reset_epoch);
> +	if (!idxd_wq_drain(wq) || READ_ONCE(wq->idxd->reset_epoch) !=3D epoch) {
>  		idxd_wq_quarantine_free(wq, &quarantined);
>  		WRITE_ONCE(wq->stuck, false);
>  		return;

[Severity: Medium]
What happens if idxd_halt() runs after idxd_wq_quarantine_take(wq,
&quarantined) but before epoch =3D READ_ONCE(wq->idxd->reset_epoch)?

In that window:
1. idxd_wq_quarantine_take() splices the entries out of wq->quarantine.
2. idxd_halt() increments idxd->reset_epoch to E + 1 and calls
   idxd_wqs_halt_flush() -> idxd_wq_halt_release(wq), which sees an empty
   wq->quarantine and sets wq->stuck =3D false.
3. idxd_dma_synchronize() reads epoch =3D E + 1 and calls idxd_wq_drain(wq).
4. If idxd_device_reinit() resets the device while idxd_wq_drain() is runni=
ng
   so that idxd_cmd_exec() fails with IDXD_CMDSTS_HW_ERR and
   idxd_device_is_halted() is already false when idxd_cmd_drain_result() ch=
ecks
   it, idxd_wq_drain() returns -ETIMEDOUT while reset_epoch is still E + 1.

Wouldn't idxd_dma_synchronize() then put the quarantined descriptors back a=
nd
set wq->stuck =3D true after idxd_wq_halt_release() has already finished,
wedging the newly reset workqueue? Would reading reset_epoch before calling
idxd_wq_quarantine_take() avoid this window?

> diff --git a/drivers/dma/idxd/idxd.h b/drivers/dma/idxd/idxd.h
> index b0cfd71011742..7fe5ec6c3bf36 100644
> --- a/drivers/dma/idxd/idxd.h
> +++ b/drivers/dma/idxd/idxd.h

[ ... ]

> diff --git a/drivers/dma/idxd/irq.c b/drivers/dma/idxd/irq.c
> index 8217698056bb4..5e34790359ee9 100644
> --- a/drivers/dma/idxd/irq.c
> +++ b/drivers/dma/idxd/irq.c
> @@ -508,6 +508,14 @@ static irqreturn_t idxd_halt(struct idxd_device *idx=
d)
>  	gensts.bits =3D ioread32(idxd->reg_base + IDXD_GENSTATS_OFFSET);
>  	if (gensts.state =3D=3D IDXD_DEVICE_STATE_HALT) {
>  		idxd->state =3D IDXD_DEV_HALTED;
> +		/*
> +		 * Every descriptor submitted before this point is dead: the
> +		 * device will never write its completion record. Pollers
> +		 * compare their descriptor's epoch against this to retire
> +		 * such descriptors instead of waiting for a record that never
> +		 * comes.
> +		 */
> +		WRITE_ONCE(idxd->reset_epoch, idxd->reset_epoch + 1);
>  		if (gensts.reset_type =3D=3D IDXD_DEVICE_RESET_SOFTWARE) {
>  			/* The reinit below re-enables the queues, so revive them. */
>  			idxd_wqs_halt_flush(idxd, true);

[Severity: High]
As noted above in idxd_dma_tx_status(), should idxd->state =3D IDXD_DEV_HAL=
TED
use WRITE_ONCE() followed by smp_wmb() before updating idxd->reset_epoch so
that readers in idxd_dma_tx_status() and __idxd_submit_desc() cannot observe
the incremented reset_epoch before observing IDXD_DEV_HALTED?

Also, if idxd_halt() is entered again while a reset is in progress or via a
subsequent halt, could bumping idxd->reset_epoch while idxd->state is alrea=
dy
IDXD_DEV_HALTED race with a poller in idxd_dma_tx_status() that relies on
reset_epoch only changing after idxd->state transitions to IDXD_DEV_HALTED?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019150632.4026=
424-1-daniel1.byrne@intel.com?part=3D2
