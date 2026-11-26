Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795652401;
	b=RKRZKriHZkiDG3vLwgu6bs6rkc8KRPIgw65vkZg/E1tdHz98ugk8qzuhqaZA4tDbyNCu
	 3XjPwHXDrZCWtLbuOdLKnHPrTUMfHwYIWV4D8lIsAO3YKiMkzZX81pQsg1UPlmj7eae2N
	 l83fzHvbbkKIJ9U0UInv1ZYNXeAOmm0A23PtZq0/wSnhLHux1eQe3jfJ8EQiDlvfS37re
	 oSCljJfmYmbgxe1Tdzy44bJdHeQVuAimohEVFDUKzAaPzSCXn9vPiH9jHrORmVhxq0KH8
	 +WsTL6QAklw8u87iJwjlj3fuZxN97qEc41S8XMA+gbigrwaQzMWLYkX2yNjgPMKuqrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795652401;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qZMDKWnTOaDA1G7qNoe6e8JYD5ZdwzSqrwN3AdutERM=;
	b=p4c3Q6rh3/nzlqeeHhKUHhPM3Mc1A2YVkL4H3O1DEur/1fQBvHOJvUHc+t8+3eBJrGym
	 M7QAUeFVLz/Q0rizq5vQzv6dSgjRavo3vnGeCfNPLXcuL48ANY6HHUz+kB5sl73R8zosw
	 Eu0XJ2j6+A3L7Ynm7GOpT1E/RV9DbBG26FUA5WcYh3Ua4gWJG7IVtJ1bzYXXcAwZpCNXb
	 BX8rOKGO7A4Nq5nKiY+IDxPn8zZBGvJ6Ze0ULCB7PM6zadV3th3efnElnGm0lzrsH9uw8
	 H3Qykg06j89xjJJ4ApwX3IAgCWfI4l7hN+IXorEPhNq2HBWjhq7txU4AvYg4wEVp2jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PquAuHCb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C172606A31E
	for <dmaengine@vger.kernel.org>; Thu, 26 Nov 2026 00:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PquAuHCb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79D511F0089E;
	Thu, 26 Nov 2026 00:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795652400;
	bh=qZMDKWnTOaDA1G7qNoe6e8JYD5ZdwzSqrwN3AdutERM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PquAuHCb+72HA1N+fQcHwKBHayjeyIZAWF9TDA7eg/lSReVXlCVsxy1U+trixvR7B
	 pOMF+J4uP+reNP4gPusSwZSdEL9y/Re6h/bPV73yGt7wT8BCFP8RxwWOsdfpnR9JRQ
	 FGR3kVEcaQEiOOnu78an0q2uHwzjtpGukyqBxLdIJSQMVVgcRzopOEWIUpuN4S1YIn
	 v/+6/ee/8zLTDQf90MeYedsLoX9Mnzjp1415eFsu5K4MWpKo8K92LD75IxgVBfcdmY
	 R+8Kktcwu/ZxgjwjAVuCUkcbe9yEhFu9zwU1HGvdk++HsB/a35CMrPDpooZa0zvvJ1
	 EViRwizAZjYZA==
Message-ID: <sashiko-outbox-234461@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 8/8] dmaengine: idxd: Don't flush the descriptors on
 terminate_all()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vinicius Costa Gomes" <vinicius.gomes@intel.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261125-wt-idxd-fixes-v2-8-25a4691dfb9e@intel.com>
References: <20261125-wt-idxd-fixes-v2-0-25a4691dfb9e@intel.com>
 <20261125-wt-idxd-fixes-v2-8-25a4691dfb9e@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 00:19:55 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] dmaengine: idxd: use-after-free of idxd_chan on quiesced WQ in
  synchronize()
- [Medium] dmaengine: idxd: terminated descriptors resubmitted on
  invalid int handle
--

commit fcece576ebf908c4c4a2589f3aea6943e129e474
Author: Vinicius Costa Gomes <vinicius.gomes@intel.com>

dmaengine: idxd: Don't flush the descriptors on terminate_all()

This commit marks the DMA channel as terminated in idxd_dma_terminate_all()
to suppress completion callbacks and defers draining and flushing pending
descriptors to idxd_dma_synchronize().

> diff --git a/drivers/dma/idxd/dma.c b/drivers/dma/idxd/dma.c
> index 9937b671f6376..f8ce06274ef46 100644
> --- a/drivers/dma/idxd/dma.c
> +++ b/drivers/dma/idxd/dma.c
[ ... ]
> @@ -47,7 +50,8 @@ void idxd_dma_complete_txd(struct idxd_desc *desc,
>  	if (complete && tx->cookie) {
>  		dma_cookie_complete(tx);
>  		dma_descriptor_unmap(tx);
> -		dmaengine_desc_get_callback_invoke(tx, &res);
> +		if (!READ_ONCE(to_idxd_dma_chan(tx->chan)->terminated))
> +			dmaengine_desc_get_callback_invoke(tx, &res);
>  		tx->callback =3D NULL;
>  		tx->callback_result =3D NULL;
>  	}

[Severity: Medium]
Can a terminated descriptor that completes with DSA_COMP_INT_HANDLE_INVAL
still be resubmitted instead of aborted?

Earlier in idxd_dma_complete_txd(), a descriptor with status
DSA_COMP_INT_HANDLE_INVAL is queued onto idxd->wq via
idxd_queue_int_handle_resubmit() and returns before reaching the
terminated check above:

drivers/dma/idxd/dma.c:idxd_dma_complete_txd() {
	if (desc->completion->status =3D=3D DSA_COMP_SUCCESS) {
		res.result =3D DMA_TRANS_NOERROR;
	} else if (desc->completion->status) {
		if (idxd->request_int_handles && comp_type !=3D IDXD_COMPLETE_ABORT &&
		    desc->completion->status =3D=3D DSA_COMP_INT_HANDLE_INVAL &&
		    idxd_queue_int_handle_resubmit(desc))
			return;
...
}

Because idxd_flush_pending_descs() passes IDXD_COMPLETE_NORMAL whenever
desc->completion->status is non-zero, both idxd_wq_thread() and
idxd_flush_pending_descs() queue the terminated descriptor for
asynchronous resubmission on idxd->wq without unmapping or freeing it.
idxd_dma_synchronize() then clears idxd_chan->terminated and returns while
idxd_int_handle_resubmit_work can still resubmit the descriptor to the
device.

> @@ -196,18 +200,43 @@ static void idxd_dma_release(struct dma_device *dev=
ice)
> =20
>  static int idxd_dma_terminate_all(struct dma_chan *c)
>  {
> -	struct idxd_wq *wq =3D to_idxd_wq(c);
> -
> -	idxd_wq_flush_descs(wq);
> +	/* The device still runs them, synchronize() waits for it */
> +	WRITE_ONCE(to_idxd_dma_chan(c)->terminated, true);
> =20
>  	return 0;
>  }
> =20
>  static void idxd_dma_synchronize(struct dma_chan *c)
>  {
> -	struct idxd_wq *wq =3D to_idxd_wq(c);
> +	struct idxd_dma_chan *idxd_chan =3D to_idxd_dma_chan(c);
> +	struct idxd_wq *wq =3D idxd_chan->wq;
> =20
>  	idxd_wq_drain(wq);
> +	if (!READ_ONCE(idxd_chan->terminated))
> +		return;
> +
> +	/*
> +	 * Not wq_lock: dma_release_channel() calls this under dma_list_mutex,
> +	 * which the WQ removal takes under wq_lock. The removal waits for
> +	 * wq_active instead.
> +	 */
> +	if (!percpu_ref_tryget_live(&wq->wq_active)) {
> +		wait_for_completion(&wq->wq_resurrect);
> +		/* The WQ is quiesced, disabling it flushes them */
> +		if (!percpu_ref_tryget_live(&wq->wq_active))
> +			return;
> +	}

[Severity: High]
Does returning early when wq->wq_active is dead cause a use-after-free on
wq->idxd_chan when idxd_drv_disable_wq() later flushes the pending
descriptors?

In idxd_dmaengine_drv_remove(), idxd_unregister_dma_channel() frees
wq->idxd_chan before idxd_drv_disable_wq() stops the IRQ and flushes the
remaining descriptors:

CPU0                                  CPU1
idxd_dmaengine_drv_remove()           dma_release_channel()
  mutex_lock(&wq->wq_lock)              mutex_lock(&dma_list_mutex)
  __idxd_wq_quiesce(wq)                 idxd_dma_synchronize()
    percpu_ref_kill(&wq->wq_active)       percpu_ref_tryget_live() -> false
    ...                                   wait_for_completion()
    complete(&wq->wq_resurrect)           percpu_ref_tryget_live() -> false
  idxd_unregister_dma_channel(wq)         return
    ...                                 mutex_unlock(&dma_list_mutex)
    kfree(wq->idxd_chan)
  idxd_drv_disable_wq(wq)
    idxd_flush_pending_descs(&wq->ie)
      idxd_dma_complete_txd()
        dma_cookie_complete(tx)
        to_idxd_dma_chan(tx->chan)->terminated  <-- use-after-free

Each flushed descriptor's tx->chan still points into the freed
wq->idxd_chan, so idxd_dma_complete_txd() writes
tx->chan->completed_cookie and reads
to_idxd_dma_chan(tx->chan)->terminated on freed memory (and idxd_wq_thread()
can do the same before idxd_wq_free_irq() runs).  idxd_dma_synchronize()
also returns to the caller while the IRQ thread and DMA mappings are still
active.

In addition, paths such as idxd_int_handle_revoke(), idxd_misc_thread() and
idxd_halt() quiesce wq->wq_active without disabling the workqueue, leaving
pending descriptors unmapped and leaked if idxd_dma_synchronize() returns
early here.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-wt-idxd-fi=
xes-v2-0-25a4691dfb9e@intel.com?part=3D8
