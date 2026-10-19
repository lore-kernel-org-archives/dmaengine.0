Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792439640;
	b=VdmB45hZEW9zmtyBfmFn5VaA8zXJbR+vb0zQgI1hDPXGg0s0bM9mJMuLk+bbjwWF7OGC
	 SIR89v4ZpKnG3jhOhA/oHbF98PuFChJvAPcfTnMXCagdYDkjPPePo9tHchMPXAXyLuLqe
	 aM5o+TK/cOVvQeuzfzlADXmpaepFxbzuUKHAyIFJmSV+uXfbCfh7cd10qLF2Wn/DqAaKF
	 8x/6zUXg1G33HgcA/i/Nj/aWcSHn+nWFOo6F2VEMvjRJ3TRiOvzK1HO+j2qP49h0bqg0e
	 R8s5BbF/GBDVBLVfnLiwPK4RurKxyh+QBzCj309kgDYYh5P+bZywjE4eTBGw7UvxCxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792439640;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=gtOJcAkQO+EceQGLDvhGMKukNDYcmkidaQWm8PfNzW8=;
	b=06Pdh9Zb8+W7fyHL7ZTaGa46aIgVdPgQOJu4SQhEdc5yNCHosMiIYIjTLYrIkFT/DgZS
	 ajt3ZrkVfJhH/q9Eevvo/Jujs27uQXtDTdXx/GrwJOOfah/tyNoblxJuVlzeGU+Tr3jT0
	 Uj2PpvGHYGuk4dW+BrA26Ic+LV1YZd8RZ638EyENxpLWhfSQOANXFYGopNYOHgJiOh3KK
	 JUAdX8cQdrp/2BmItfuKQEblkorImRLMqPE6xZ2WweMKpoy3ZkQVOFxl8QM3EnthlQRTy
	 fn8S2JSqtqfJCz7Pdv2FjgRHCMd2rCVae4sew0UmsSpmix5lITnP5lI2MAyaghiU9Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=huqwvKuL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4AA606A31B
	for <dmaengine@vger.kernel.org>; Mon, 19 Oct 2026 19:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=huqwvKuL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91D941F000C4;
	Mon, 19 Oct 2026 19:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792439639;
	bh=gtOJcAkQO+EceQGLDvhGMKukNDYcmkidaQWm8PfNzW8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=huqwvKuLshQ6OaaZeY/SXQeDsQtBTJ9kPQkUjH6rO1tMz8a12afp71GGieeEuX8zD
	 viXHPwCNU+klB1ugifCW1mJioDmTbj1uxxuql3I2zI5DmwZx5pHB1KODAUgoYssH1V
	 kjD438BCAcEUWdtBVrsHeO1e23FWiMr8s5u2OtQxtyrkXpIu4LWjRX15rjWVAyBlf1
	 NP4S3+JBnz5XGJ/fm4a1dUfEoUeloi/AkXHGXkszk3MBzaQcPA8vTT88GFWWhHGOgO
	 r/G0NgAXEAOHrA/kpSmy79s/xsLFi4vIKDz0XfCqPYbV0uvAtyVOCpAMsjpAaskkny
	 IrvnGA5DpAuNg==
Message-ID: <sashiko-outbox-178156@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 17/17] dmaengine: idxd: run the interrupt-handle revoke
 under the queue lock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Byrne" <daniel1.byrne@intel.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261019150630.4026341-18-daniel1.byrne@intel.com>
References: <20261019150630.4026341-1-daniel1.byrne@intel.com>
 <20261019150630.4026341-18-daniel1.byrne@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 19:53:59 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] dmaengine: idxd: deadlock on wq_lock in idxd_abort_invalid_int_han=
dle_descs()
- [High] dmaengine: idxd: drain and handle update on killed wq in idxd_int_=
handle_revoke()
- [Medium] dmaengine: idxd: handle leak and rebind race in idxd_int_handle_=
revoke()
--

commit 2920ff390e78f9271a288774e6a5796ea738663d
Author: Daniel Byrne <daniel1.byrne@intel.com>

dmaengine: idxd: run the interrupt-handle revoke under the queue lock

This commit acquires wq_lock in idxd_int_handle_revoke() after requesting a
new interrupt handle so that handle updates, drains, or failure quiesce and
descriptor aborts serialize against workqueue unbind and halt.

> diff --git a/drivers/dma/idxd/irq.c b/drivers/dma/idxd/irq.c
> index 4517a09fcf1b9..8217698056bb4 100644
> --- a/drivers/dma/idxd/irq.c
> +++ b/drivers/dma/idxd/irq.c
> @@ -115,6 +115,11 @@ static void idxd_abort_invalid_int_handle_descs(stru=
ct idxd_irq_entry *ie)
>  	struct idxd_desc *d, *t;
>  	struct llist_node *head;
> =20
> +	/*
> +	 * An unbind frees the descriptors and the allocator under
> +	 * wq_lock, so they are completed under it as well.
> +	 */
> +	lockdep_assert_held(&ie_to_wq(ie)->wq_lock);
>  	spin_lock(&ie->list_lock);
>  	head =3D llist_del_all(&ie->pending_llist);
>  	if (head) {
> @@ -142,6 +147,7 @@ static void idxd_int_handle_revoke(struct work_struct=
 *work)
>  	struct pci_dev *pdev =3D idxd->pdev;
>  	struct device *dev =3D &pdev->dev;
>  	int i, new_handle, rc;
> +	bool killed;
> =20
>  	if (!idxd->request_int_handles) {
>  		kfree(revoke);
> @@ -166,15 +172,31 @@ static void idxd_int_handle_revoke(struct work_stru=
ct *work)
>  			continue;
> =20
>  		rc =3D idxd_device_request_int_handle(idxd, i, &new_handle, IDXD_IRQ_M=
SIX);
> -		if (rc < 0) {
> +		if (rc < 0)
>  			dev_warn(dev, "get int handle %d failed: %d\n", i, rc);
> +
> +		/*
> +		 * The request runs without wq_lock, so that a reset can end
> +		 * it, and the queue may have been unbound meanwhile. An
> +		 * unbind invalidates the handle in the same wq_lock hold
> +		 * that unmaps the portal and frees the descriptors, so a
> +		 * handle still valid under the lock means that the queue
> +		 * still has its portal, its descriptors and its completion
> +		 * handler. Everything below, the drain included, stays in
> +		 * this hold.
> +		 */
> +		guard(mutex)(&wq->wq_lock);
> +		if (ie->int_handle =3D=3D INVALID_INT_HANDLE)
> +			continue;

[Severity: Medium]
Can this leak new_handle or race with a concurrent unbind and rebind while
wq->wq_lock is not held during idxd_device_request_int_handle()?

First, if idxd_device_request_int_handle() succeeds (rc =3D=3D 0) while a
concurrent unbind runs idxd_drv_disable_wq() -> idxd_wq_free_irq():

drivers/dma/idxd/device.c:idxd_wq_free_irq() {
	if (idxd->request_int_handles)
		idxd_device_release_int_handle(idxd, ie->int_handle, IDXD_IRQ_MSIX);
	idxd_device_clear_perm_entry(idxd, ie);
	ie->vector =3D -1;
	ie->int_handle =3D INVALID_INT_HANDLE;
	ie->pasid =3D IOMMU_PASID_INVALID;
}

idxd_wq_free_irq() only releases the old ie->int_handle and sets
ie->int_handle =3D INVALID_INT_HANDLE. When idxd_int_handle_revoke() then
acquires wq->wq_lock and sees ie->int_handle =3D=3D INVALID_INT_HANDLE, it =
hits
continue without calling idxd_device_release_int_handle() on new_handle.

Second, if the queue is unbound and then rebound via idxd_drv_enable_wq() ->
idxd_wq_request_irq() before idxd_int_handle_revoke() acquires wq->wq_lock:

drivers/dma/idxd/device.c:idxd_wq_request_irq() {
	if (idxd->request_int_handles) {
		rc =3D idxd_device_request_int_handle(idxd, ie->id, &ie->int_handle,
						    IDXD_IRQ_MSIX);
		if (rc < 0)
			goto err_int_handle;
	} else {
		ie->int_handle =3D ie->id;
	}
}

ie->int_handle is populated with a new valid handle for the rebound queue.
When idxd_int_handle_revoke() acquires wq->wq_lock, ie->int_handle is no
longer INVALID_INT_HANDLE, so it treats the newly rebound queue as the old
binding: if the earlier idxd_device_request_int_handle() failed (for exampl=
e,
while the permission entry was cleared during the unbind), it overwrites the
new ie->int_handle with INVALID_INT_HANDLE and quiesces the rebound queue; =
if
it succeeded before the rebind, it overwrites the rebound queue's
ie->int_handle with the stale new_handle.

> +
> +		if (rc < 0) {
>  			/*
>  			 * Failed to acquire new interrupt handle. Kill the WQ
>  			 * and release all the pending submitters. The submitters will
>  			 * get error return code and handle appropriately.
>  			 */
>  			ie->int_handle =3D INVALID_INT_HANDLE;
> -			idxd_wq_quiesce(wq);
> +			__idxd_wq_quiesce(wq);
>  			idxd_abort_invalid_int_handle_descs(ie);
>  			continue;
>  		}

[Severity: High]
Can calling idxd_abort_invalid_int_handle_descs() while holding wq->wq_lock
deadlock on wq->wq_lock?

idxd_abort_invalid_int_handle_descs() completes descriptors synchronously:

idxd_int_handle_revoke()
  guard(mutex)(&wq->wq_lock)
  idxd_abort_invalid_int_handle_descs(ie)
    idxd_desc_complete(d, IDXD_COMPLETE_ABORT, true)
      idxd_dma_complete_txd(d, IDXD_COMPLETE_ABORT, true, NULL, NULL)
        dmaengine_desc_get_callback_invoke(tx, &res)

For a dmaengine workqueue, the client completion callback is invoked
synchronously under wq->wq_lock. As noted in idxd_flush_pending_descs() in
drivers/dma/idxd/device.c:

	/*
	 * A halt flush that delivers the callbacks of a dmaengine queue
	 * leaves its descriptors to the interrupt thread, which runs them
	 * without wq_lock, as it runs every completion. A callback may
	 * terminate the channel, which takes that lock, and the halt flush
	 * holds it. The halted device writes no record any more, so one it
	 * never finished is marked aborted for the thread to complete.
	 */

If the client callback terminates the channel on error via
dmaengine_terminate_async() or dmaengine_terminate_all(), it enters
idxd_dma_terminate_all():

drivers/dma/idxd/dma.c:idxd_dma_terminate_all() {
	struct idxd_wq *wq =3D to_idxd_wq(c);

	guard(mutex)(&wq->wq_lock);
	...
}

Wouldn't that immediately self-deadlock on wq->wq_lock?

> @@ -193,21 +215,20 @@ static void idxd_int_handle_revoke(struct work_stru=
ct *work)
>  			continue;
>  		}
> =20
> -		mutex_lock(&wq->wq_lock);
> -		reinit_completion(&wq->wq_resurrect);
> -
> -		/* Kill percpu_ref to pause additional descriptor submissions */
> -		percpu_ref_kill(&wq->wq_active);
> -
> -		/* Wait for all submitters quiesce before we change interrupt handle */
> -		wait_for_completion(&wq->wq_dead);
> +		/*
> +		 * Kill percpu_ref to pause additional descriptor submissions
> +		 * and wait for all submitters to quiesce before we change
> +		 * the interrupt handle. A queue a halt already killed and did
> +		 * not revive is left dead.
> +		 */
> +		killed =3D idxd_wq_kill(wq);
> =20
>  		ie->int_handle =3D new_handle;
> =20
>  		/* Revive percpu ref and wake up all the waiting submitters */
> -		percpu_ref_reinit(&wq->wq_active);
> +		if (killed)
> +			percpu_ref_reinit(&wq->wq_active);
>  		complete_all(&wq->wq_resurrect);
> -		mutex_unlock(&wq->wq_lock);
> =20
>  		/*
>  		 * The delay here is to wait for all possible MOVDIR64B that

[Severity: High]
When idxd_wq_kill(wq) returns false because a halt or teardown quiesce
already killed wq->wq_active, is it safe to still update ie->int_handle and
call idxd_int_handle_revoke_drain(ie)?

In idxd_halt() in drivers/dma/idxd/irq.c:

		if (halt_flr(err)) {
			idxd->state =3D IDXD_DEV_HALTED;
			...
			idxd_wqs_halt_flush(idxd, false);
			for (i =3D 0; i < idxd->max_wqs; i++) {
				struct idxd_wq *wq =3D idxd->wqs[i];

				if (wq->type =3D=3D IDXD_WQT_KERNEL)
					WRITE_ONCE(wq->ie.int_handle, INVALID_INT_HANDLE);
			}
			...
		} else {
			idxd->state =3D IDXD_DEV_HALTED;
			/* Same as above: nothing in flight will ever complete. */
			idxd_wqs_halt_flush(idxd, false);
			idxd_wqs_unmap_portal(idxd);
			idxd_device_clear_state(idxd);

In the system-reset branch, idxd_wqs_halt_flush() kills wq->wq_active under
wq->wq_lock and unlocks, while wq->state is still IDXD_WQ_ENABLED and
ie->int_handle is not invalidated. Next, idxd_wqs_unmap_portal() unmaps
wq->portal and sets wq->portal =3D NULL without holding wq->wq_lock before
idxd_device_clear_state() clears wq->state under wq->wq_lock (and on
non-configurable devices without IDXD_FLAG_CONFIGURABLE,
idxd_device_clear_state() does not clear wq->state at all).

If idxd_int_handle_revoke() acquires wq->wq_lock after idxd_wqs_halt_flush(=
),
idxd_wq_kill(wq) returns false, but idxd_int_handle_revoke() proceeds to
idxd_int_handle_revoke_drain(ie):

drivers/dma/idxd/irq.c:idxd_int_handle_revoke_drain() {
	...
	portal =3D idxd_wq_portal_addr(wq);
	...
	wmb();
	if (wq_dedicated(wq)) {
		iosubmit_cmds512(portal, &desc, 1);
	} else {
		rc =3D idxd_enqcmds(wq, portal, &desc);

which dereferences wq->portal while it is NULL or being unmapped.

Similarly, in the FLR branch of idxd_halt(), wq->ie.int_handle is set to
INVALID_INT_HANDLE outside wq->wq_lock after idxd_wqs_halt_flush(). If
idxd_int_handle_revoke() acquires wq->wq_lock after idxd_wqs_halt_flush()
before that write, or if iaa_crypto_remove() has called idxd_wq_quiesce(wq)
prior to disabling the queue, idxd_wq_kill(wq) returns false, yet
idxd_int_handle_revoke() still writes ie->int_handle =3D new_handle and sub=
mits
a hardware drain descriptor to the halted or quiesced queue.

Should idxd_int_handle_revoke() avoid updating ie->int_handle and issuing t=
he
drain when killed is false (or when the device is halted)?

=D1=82=D0=B8=D1=82=D1=8C=D1=81=D1=8F

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019150630.4026=
341-1-daniel1.byrne@intel.com?part=3D17
