Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792438581;
	b=XmQWMvIvkl787f0KN9TA/RL36hiEQuDYs89sNn+YZlzj26A0Gm4up0eBbiuUsjwQ3MuN
	 nA8VdakuIubkeAlHoUcFta6CCYa2Aabif91MEsryEe61VMaRsa74OCTRssyr9G01GJSca
	 A7MUoxyXmuwiSMtKPfYgGXXcqtwbdL+K5K07tw7fi0ffk1MpQFikxU+OJ/ayj6D+GN42g
	 4cpJzt+gsT9Zh2lUnALFImojuDtRyqWJkqatuO3ozEYvu9lLAgf67UxFNaoowK4yXza9p
	 bOBXp/idcZ61U1u1WNuIeXMLEMu2UIuEE/NZbpBqXCDkpGCFOz8pdeiwj7SAYwrTNrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792438581;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=whsEyqaAMR9JWQCXFQQIH1tLOwJVJITgXSG71jeTDHE=;
	b=tgB1u7Kq+V5BFTEJKGNsHg+cNUDiqsG/WTeBdLe8OQArs2DoVKekpw7Dvty2+NjwO5bF
	 askP/McL29/9jQg2gASCiK4nOMsutnt/R5i0iHfIztmw1V8qCbxMXyCYsR+2w676K7IUh
	 ADilybK0IgWIwf4ag0MIsy+0qBsa0YIJVRwzoVJ/4utJQZtNuaa3ni1Vm1Pe0lHA8Ni6B
	 7CHDbR1ejMdWdik0Uq9BR/m4A2b781hkTR07KZ27liYJTOQTicC6wuCmBpDuvI63t80Jv
	 FEZVOvuxQaSwdAosdW3dxN8CYqwRadxK+FLgoDYJpSSAHDyMbZAD8iif5M5Vtj6NcbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AafKuclt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC6C606A322
	for <dmaengine@vger.kernel.org>; Mon, 19 Oct 2026 19:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AafKuclt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7FED1F000C5;
	Mon, 19 Oct 2026 19:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792438581;
	bh=whsEyqaAMR9JWQCXFQQIH1tLOwJVJITgXSG71jeTDHE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AafKuclttOdoG8gQLtpuHQ4PGDVHy+hA6iKYuqAfcEFttosJjJXWj9Dy/UhjLLLMb
	 GCdO1LrsKNl93i+rUyKZbXImCmQwnbPFThwcqm/KWBmP6wT5FZ9FvyJ33utr1DZdeP
	 icOo4Vrbv5JJ5Nrr9OhvSzJWAqahx1xAdyRga7TybW8shEniRV/R5k5+Oc3a+MQHf9
	 uksdZ0w4lu2F/3vy2pCwNjstAT8MiqCq6xP4JQcPryV5fjDjwiz9ptVJ+2C10OHxBh
	 Pb0QiXxSiSs1O0u7UmqK7ggcY7zQLL4Q3Wzpyt445eLkV8y7hnEcPPXT7QOH+CS7po
	 gVz6eumsZfFVg==
Message-ID: <sashiko-outbox-178145@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 16/17] dmaengine: idxd: keep client callbacks on a halt
 flush and cancel resubmissions after a terminate
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Byrne" <daniel1.byrne@intel.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261019150630.4026341-17-daniel1.byrne@intel.com>
References: <20261019150630.4026341-1-daniel1.byrne@intel.com>
 <20261019150630.4026341-17-daniel1.byrne@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 19:36:20 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [Critical] dmaengine: idxd: deferred halt flush races with idxd_dmaengine=
_drv_remove()
- [Critical] dmaengine: idxd: halt flush fails to abort DSA_COMP_INT_HANDLE=
_INVAL descs
- [Critical] dmaengine: idxd: unsynchronized abort in idxd_int_handle_resub=
mit_work()
- [High] dmaengine: idxd: deferred halt flush runs callbacks after terminat=
e_all()
- [High] dmaengine: idxd: idxd_dma_terminate_all() bumps terminate_gen befo=
re kill
--

commit 6d8942e7925503eef278b95468cdbb6ea9bd20c4
Author: Daniel Byrne <daniel1.byrne@intel.com>

dmaengine: idxd: keep client callbacks on a halt flush and cancel resubmiss=
ions after a terminate

This commit updates idxd_flush_pending_descs() and llist_abort_desc() to
preserve client callbacks during device halt flushes and internal
interrupt-handle resubmissions while stripping them on teardown and
client-initiated terminations. It also introduces a per-queue
terminate_gen counter to cancel pending interrupt-handle resubmissions
across dmaengine_terminate_all().

> diff --git a/drivers/dma/idxd/device.c b/drivers/dma/idxd/device.c
> index 158c141650e3d..5ccdc5ff8d53d 100644
> --- a/drivers/dma/idxd/device.c
> +++ b/drivers/dma/idxd/device.c
> @@ -1527,7 +1527,7 @@ int idxd_device_load_config(struct idxd_device *idx=
d)
>  }
> =20
>  static void idxd_flush_pending_descs(struct idxd_irq_entry *ie,
> -				     bool quarantine)
> +				     bool keep_callbacks, bool quarantine)
>  {
>  	struct idxd_wq *wq =3D ie_to_wq(ie);
>  	struct idxd_desc *desc, *itr;
> @@ -1543,6 +1543,28 @@ static void idxd_flush_pending_descs(struct idxd_i=
rq_entry *ie,
>  			list_add_tail(&desc->list, &ie->work_list);
>  	}
> =20
> +	/*
> +	 * A halt flush that delivers the callbacks of a dmaengine queue
> +	 * leaves its descriptors to the interrupt thread, which runs them
> +	 * without wq_lock, as it runs every completion. A callback may
> +	 * terminate the channel, which takes that lock, and the halt flush
> +	 * holds it. The halted device writes no record any more, so one it
> +	 * never finished is marked aborted for the thread to complete.
> +	 */
> +	if (keep_callbacks && idxd_wq_has_txd(wq)) {
> +		bool wake =3D false;
> +
> +		list_for_each_entry(desc, &ie->work_list, list) {
> +			if (!desc->completion->status)
> +				desc->completion->status =3D IDXD_COMP_DESC_ABORT;
> +			wake =3D true;
> +		}
> +		spin_unlock(&ie->list_lock);
> +		if (wake)
> +			irq_wake_thread(ie->vector, ie);
> +		return;
> +	}

[Severity: High]
Can this deferred completion path still invoke client callbacks after
dmaengine_terminate_all() or dmaengine_terminate_sync() has returned?

When idxd_wq_thread() runs irq_process_work_list(), it moves every
descriptor with a non-zero status from ie->work_list onto its stack-local
flist before dropping ie->list_lock:

drivers/dma/idxd/irq.c:irq_process_work_list() {
	list_for_each_entry_safe(desc, n, &irq_entry->work_list, list) {
		if (desc->completion->status) {
			list_move_tail(&desc->list, &flist);
		}
	}

	spin_unlock(&irq_entry->list_lock);

	list_for_each_entry_safe(desc, n, &flist, list) {
		list_del(&desc->list);

		if (unlikely(desc->completion->status =3D=3D IDXD_COMP_DESC_ABORT)) {
			idxd_desc_complete(desc, IDXD_COMPLETE_ABORT, true);
			continue;
		}

		idxd_desc_complete(desc, IDXD_COMPLETE_NORMAL, true);
	}
}

If the first descriptor's callback calls dmaengine_terminate_async() ->
idxd_dma_terminate_all() (or another CPU calls dmaengine_terminate_all()
concurrently), idxd_flush_pending_descs() sees ie->pending_llist and
ie->work_list already empty because the remaining descriptors are on
irq_process_work_list()'s local flist. Since neither irq_process_work_list()
nor idxd_dma_complete_txd() checks wq->terminate_gen, irq_process_work_list=
()
continues iterating flist and invokes the remaining callbacks after
dmaengine_terminate_all() has returned.

In addition, on a system-reset halt or during idxd_device_reinit() ->
idxd_device_reset(), idxd_device_clear_state() ->
idxd_device_wqs_clear_state() -> idxd_wq_disable_cleanup() sets
wq->state =3D IDXD_WQ_DISABLED right after idxd_wqs_halt_flush() returns. If
the client then calls dmaengine_terminate_all(), __idxd_wq_flush_descs()
returns early without flushing ie->work_list or stripping callbacks:

drivers/dma/idxd/device.c:__idxd_wq_flush_descs() {
	if (wq->state !=3D IDXD_WQ_ENABLED || wq->type !=3D IDXD_WQT_KERNEL)
		return;
}

And idxd_dma_synchronize() does not synchronize with ie->vector (and
idxd_wq_drain() also returns immediately when wq->state !=3D IDXD_WQ_ENABLE=
D),
allowing dmaengine_terminate_sync() to return while idxd_wq_thread() is
still running callbacks.

[Severity: Critical]
Also in this loop, what happens if a descriptor on ie->work_list (or moved
from ie->pending_llist) finished just before the halt with
desc->completion->status =3D=3D DSA_COMP_INT_HANDLE_INVAL?

Because desc->completion->status is already non-zero, the loop leaves it as
DSA_COMP_INT_HANDLE_INVAL. When idxd_wq_thread() -> irq_process_work_list()
processes the descriptor, it sees status !=3D IDXD_COMP_DESC_ABORT and calls
idxd_desc_complete(desc, IDXD_COMPLETE_NORMAL, true) ->
idxd_dma_complete_txd(), which queues idxd_int_handle_resubmit_work() on
idxd->wq instead of aborting the descriptor:

drivers/dma/idxd/dma.c:idxd_dma_complete_txd() {
	} else if (desc->completion->status) {
		if (idxd->request_int_handles && comp_type !=3D IDXD_COMPLETE_ABORT &&
		    desc->completion->status =3D=3D DSA_COMP_INT_HANDLE_INVAL &&
		    idxd_queue_int_handle_resubmit(desc))
			return;
}

On an FLR halt, idxd_device_flr runs on idxd->wq, unbinds the queue driver
via idxd_dmaengine_drv_remove(), and frees wq->descs, wq->compls,
wq->idxd_chan, and wq->sbq while idxd_int_handle_resubmit_work() is still
queued. Should a descriptor with status =3D=3D DSA_COMP_INT_HANDLE_INVAL al=
so
be overwritten with IDXD_COMP_DESC_ABORT here, matching the non-callback
path below?

[ ... ]

> diff --git a/drivers/dma/idxd/dma.c b/drivers/dma/idxd/dma.c
> index 1d08856f5c4ec..0a7517cb51f29 100644
> --- a/drivers/dma/idxd/dma.c
> +++ b/drivers/dma/idxd/dma.c
> @@ -199,8 +199,18 @@ static int idxd_dma_terminate_all(struct dma_chan *c)
>  {
>  	struct idxd_wq *wq =3D to_idxd_wq(c);
> =20
> +	guard(mutex)(&wq->wq_lock);
> +	/*
> +	 * A descriptor that completed with a revoked interrupt handle is
> +	 * resubmitted by a work item. One submitted before this terminate
> +	 * may reach that work after the flush, from the interrupt thread or
> +	 * from a work item queued earlier, and is cancelled there rather
> +	 * than run with its callback once the client may have freed its
> +	 * memory.
> +	 */
> +	WRITE_ONCE(wq->terminate_gen, wq->terminate_gen + 1);
>  	/* The device keeps running what the lists held. See synchronize. */
> -	idxd_wq_flush_descs(wq, true);
> +	__idxd_wq_flush_descs(wq, false, true);
> =20
>  	return 0;
>  }

[Severity: High]
Since WRITE_ONCE(wq->terminate_gen, wq->terminate_gen + 1) runs before
__idxd_wq_flush_descs() calls idxd_wq_kill(wq), can an in-flight
idxd_submit_desc() stamp the new post-terminate generation onto a
pre-terminate descriptor?

If a concurrent client submission in __idxd_submit_desc() has already
acquired wq->wq_active via percpu_ref_tryget_live(&wq->wq_active) before
idxd_wq_kill(wq) calls percpu_ref_kill(), it can reach:

drivers/dma/idxd/submit.c:__idxd_submit_desc() {
	if (desc_flags & IDXD_OP_FLAG_RCI) {
		ie =3D &wq->ie;
		desc->hw->int_handle =3D ie->int_handle;
		if (submitter_cleans)
			desc->terminate_gen =3D READ_ONCE(wq->terminate_gen);
		llist_add(&desc->llnode, &ie->pending_llist);
	}
}

while idxd_wq_kill(wq) is waiting in wait_for_completion(&wq->wq_dead).
That pre-terminate submission then stamps desc->terminate_gen with the
already-incremented wq->terminate_gen. If the descriptor completes with
DSA_COMP_INT_HANDLE_INVAL and idxd_wq_thread() pops it from
ie->pending_llist and queues idxd_int_handle_resubmit_work() before
idxd_flush_pending_descs() takes ie->list_lock, the resubmission will see
desc->terminate_gen =3D=3D READ_ONCE(wq->terminate_gen) and will not be
cancelled.

[ ... ]

> diff --git a/drivers/dma/idxd/irq.c b/drivers/dma/idxd/irq.c
> index 99b2df7fc2de0..4517a09fcf1b9 100644
> --- a/drivers/dma/idxd/irq.c
> +++ b/drivers/dma/idxd/irq.c
> @@ -452,7 +452,7 @@ static void idxd_wqs_halt_flush(struct idxd_device *i=
dxd, bool resurrect)
>  			continue;
>  		}
>  		killed =3D idxd_wq_kill(wq);
> -		__idxd_wq_flush_descs(wq, false);
> +		__idxd_wq_flush_descs(wq, idxd_wq_refcount(wq) > 0, false);
>  		idxd_wq_halt_release(wq);
> =20
>  		if (resurrect) {

[Severity: Critical]
When resurrect is false (on an FLR halt), does leaving descriptors on
ie->work_list for idxd_wq_thread() race with idxd_dmaengine_drv_remove()?

After idxd_wqs_halt_flush(idxd, false) wakes idxd_wq_thread() and releases
wq->wq_lock, idxd_halt() queues idxd_device_flr, which calls
pci_reset_function() -> idxd_reset_done() -> idxd_unbind() ->
idxd_device_drv_remove() -> idxd_dmaengine_drv_remove() (this path can also
run if the driver is unbound via sysfs after a halt):

drivers/dma/idxd/dma.c:idxd_dmaengine_drv_remove() {
	mutex_lock(&wq->wq_lock);
	__idxd_wq_quiesce(wq);
	idxd_unregister_dma_channel(wq);
	idxd_drv_disable_wq(wq);
	mutex_unlock(&wq->wq_lock);
}

idxd_unregister_dma_channel(wq) kfrees wq->idxd_chan before
idxd_drv_disable_wq(wq) -> idxd_wq_free_irq(wq) calls free_irq(ie->vector,
ie) and idxd_flush_pending_descs(ie, false, false).

Can this cause two regressions during teardown:

1. When idxd_wq_thread() or idxd_wq_free_irq() -> idxd_flush_pending_descs()
completes those descriptors via idxd_dma_complete_txd(),
dma_cookie_complete(&desc->txd) writes tx->chan->completed_cookie into the
already-freed wq->idxd_chan?

2. While idxd_dmaengine_drv_remove() holds wq->wq_lock and blocks in
idxd_wq_free_irq() -> free_irq(ie->vector, ie) waiting for idxd_wq_thread()
to finish, if a callback running in idxd_wq_thread() calls
dmaengine_terminate_all() -> idxd_dma_terminate_all(), will it deadlock
trying to acquire wq->wq_lock?

> @@ -659,22 +659,27 @@ static void idxd_int_handle_resubmit_work(struct wo=
rk_struct *work)
>  	int rc;
> =20
>  	desc->completion->status =3D 0;
> -	rc =3D idxd_submit_desc(wq, desc);
> +	rc =3D idxd_resubmit_desc(wq, desc);
>  	if (rc < 0) {
>  		dev_dbg(&wq->idxd->pdev->dev, "Failed to resubmit desc %d to wq %d.\n",
>  			desc->id, wq->id);
>  		/*
> -		 * If the error is not -EAGAIN, it means the submission failed due to =
wq
> -		 * has been killed instead of ENQCMDS failure. Here the driver needs to
> -		 * notify the submitter of the failure by reporting abort status.
> -		 *
> -		 * -EAGAIN comes from ENQCMDS failure. idxd_submit_desc() will handle =
the
> -		 * abort.
> +		 * The submission failed because the device is not enabled,
> +		 * because the wq has been killed or because ENQCMDS failed,
> +		 * and in each case the descriptor is on no list. Here the
> +		 * driver needs to notify the submitter of the failure by
> +		 * reporting abort status. The submit has dropped its
> +		 * wq_active reference by now, so a callback that submits or
> +		 * terminates does not wait for it. A descriptor submitted
> +		 * before a terminate_all, which cancels its resubmission,
> +		 * gets no callback, since its client terminated it.
>  		 */
> -		if (rc !=3D -EAGAIN) {
> -			desc->completion->status =3D IDXD_COMP_DESC_ABORT;
> -			idxd_desc_complete(desc, IDXD_COMPLETE_ABORT, false);
> +		if (desc->terminate_gen !=3D READ_ONCE(wq->terminate_gen)) {
> +			desc->txd.callback =3D NULL;
> +			desc->txd.callback_result =3D NULL;
>  		}
> +		desc->completion->status =3D IDXD_COMP_DESC_ABORT;
> +		idxd_desc_complete(desc, IDXD_COMPLETE_ABORT, false);
>  		idxd_free_desc(wq, desc);
>  	}
>  	kfree(irw);

[Severity: Critical]
Because idxd_int_handle_resubmit_work() runs on idxd->wq without holding
wq->wq_active or wq->wq_lock once idxd_resubmit_desc() returns rc < 0, and
neither idxd_dma_synchronize() nor idxd_dmaengine_drv_remove() ->
idxd_drv_disable_wq() flushes idxd->wq, can this failure path race with
channel termination and workqueue teardown?

1. If idxd_resubmit_desc() fails with -EAGAIN, -EIO, or -ENXIO just before
the client calls dmaengine_terminate_sync(), idxd_int_handle_resubmit_work()
can read wq->terminate_gen before idxd_dma_terminate_all() increments it,
and then invoke desc->txd.callback in idxd_desc_complete() after
dmaengine_terminate_sync() has already returned to the client.

2. Even when desc->terminate_gen !=3D READ_ONCE(wq->terminate_gen) is true,
idxd_desc_complete(desc, IDXD_COMPLETE_ABORT, false) ->
idxd_dma_complete_txd() runs asynchronously after dmaengine_terminate_sync()
has returned:

drivers/dma/idxd/dma.c:idxd_dma_complete_txd() {
	tx =3D &desc->txd;
	if (complete && tx->cookie) {
		dma_cookie_complete(tx);
		dma_descriptor_unmap(tx);
		dmaengine_desc_get_callback_invoke(tx, &res);
		tx->callback =3D NULL;
		tx->callback_result =3D NULL;
	}
}

Doesn't this call dma_descriptor_unmap(tx) after dmaengine_synchronize() has
already returned, and write tx->chan->completed_cookie =3D tx->cookie in
dma_cookie_complete(tx) where it can overwrite chan->completed_cookie
backwards if the client has already submitted and completed newer
descriptors after terminate_sync()?

3. If the workqueue is unbound or disabled via idxd_dmaengine_drv_remove()
-> idxd_drv_disable_wq() while idxd_int_handle_resubmit_work() is still
pending on idxd->wq, idxd_unregister_dma_channel() frees wq->idxd_chan and
idxd_wq_free_resources() frees wq->descs, wq->compls, and wq->sbq before
idxd_int_handle_resubmit_work() accesses desc and calls idxd_free_desc(wq,
desc).

[ ... ]

> diff --git a/drivers/dma/idxd/submit.c b/drivers/dma/idxd/submit.c
> index cf8536e94c15e..469a0cadb984d 100644
> --- a/drivers/dma/idxd/submit.c
> +++ b/drivers/dma/idxd/submit.c

[ ... ]

> @@ -250,6 +274,12 @@ int idxd_submit_desc(struct idxd_wq *wq, struct idxd=
_desc *desc)
>  	if (desc_flags & IDXD_OP_FLAG_RCI) {
>  		ie =3D &wq->ie;
>  		desc->hw->int_handle =3D ie->int_handle;
> +		/*
> +		 * A resubmission keeps the stamp of the client's submit, so
> +		 * the resubmit work sees every terminate since then.
> +		 */
> +		if (submitter_cleans)
> +			desc->terminate_gen =3D READ_ONCE(wq->terminate_gen);
>  		llist_add(&desc->llnode, &ie->pending_llist);
>  	}

[Severity: High]
As noted above in idxd_dma_terminate_all(), because this read of
wq->terminate_gen happens under wq->wq_active while idxd_dma_terminate_all()
updates wq->terminate_gen before calling idxd_wq_kill(wq), can a submission
that entered __idxd_submit_desc() prior to dmaengine_terminate_all() read
the post-terminate generation here and escape cancellation if it later hits
an invalid interrupt handle?

> =20
> @@ -275,7 +305,7 @@ int idxd_submit_desc(struct idxd_wq *wq, struct idxd_=
desc *desc)

[ ... ]

>  			if (ie)
> -				llist_abort_desc(wq, ie, desc);
> +				llist_abort_desc(wq, ie, desc, submitter_cleans);
>  			percpu_ref_put(&wq->wq_active);
>  			return rc;
>  		}
> @@ -284,4 +314,15 @@ int idxd_submit_desc(struct idxd_wq *wq, struct idxd=
_desc *desc)
>  	percpu_ref_put(&wq->wq_active);
>  	return 0;
>  }
> +/* A client submission: on failure the return value is the notification.=
 */
> +int idxd_submit_desc(struct idxd_wq *wq, struct idxd_desc *desc)
> +{
> +	return __idxd_submit_desc(wq, desc, true);
> +}
>  EXPORT_SYMBOL_NS_GPL(idxd_submit_desc, "IDXD");
> +
> +/* The driver's own resubmission: a failure must still call the client b=
ack. */
> +int idxd_resubmit_desc(struct idxd_wq *wq, struct idxd_desc *desc)
> +{
> +	return __idxd_submit_desc(wq, desc, false);
> +}

[ ... ]

>

endasi

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019150630.4026=
341-1-daniel1.byrne@intel.com?part=3D16
