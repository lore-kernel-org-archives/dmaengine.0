Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792430794;
	b=TQjPpzEm7H/ClGGftC13brhXFZEH8O5iwM9sh+O/yFU4rFESGYeyJnfXFM+Aug1Dp7gL
	 SuXC3RjLhBuQ12LQ9cgnk4qoH1p2EX1Iwx40267B3vFRg8qe4NLo5I5My6Q8lNrNYQIlr
	 dMKtBv7NjvrdL1ezOf4rQDnRgdoYNwhCN5qD5M3MBgZYEhCdazExZXW1IakskuHVlq5u7
	 hrUIn7WuHFNjt5P75Tb9AEW7/Yzn+ql1uYE//Km+8CTBri9AsbJaHRk128zhfQR7ApODh
	 kAiJmq8ea0K/ui9KiwSA79KyfOx8dcIPZ2+AlqLG8FZ9aMfJu/ZxlBfV3srBy5axueQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792430794;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=SojYv4cweNJxmeOJNg+T16kAJUAnTe2uW+uEtjnszm4=;
	b=V3tTmK+pA9pJpy6Dvoev+kZ314lMfyaMWjd8eBDRuE3P5mnS30xeGbAWd5Tq7wKut1Wr
	 C7unO1g8HP4zq9736dnBxG75bVW6Z/I/LjvNhkTtK6T3MNJLughfmHE+XR6yNl07GB2dz
	 AC6hibJni4+1+xyJC+lpfHyw2zI33HNMjsavT6BR92CnHrPj7hkfJIBoIojVj2slBmsPq
	 16t2uge3KSJjZdbNzQUorFcn4nGxw5N9CCXQqe5DelZH/TkG0sBO9WgxmEaY6xynjJo9T
	 QPuLdu4imc+q1ocKXe2iO3qwn7XwUGcBYrWmlns6u35cASNAP9FAbaFP3xn5UMeiK4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FNRqnw9V;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0C4606A319
	for <dmaengine@vger.kernel.org>; Mon, 19 Oct 2026 17:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FNRqnw9V
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 915D51F000C4;
	Mon, 19 Oct 2026 17:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792430793;
	bh=SojYv4cweNJxmeOJNg+T16kAJUAnTe2uW+uEtjnszm4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FNRqnw9VshM8ojBdF6mwlaWChlb8hT9sr4dWQCClkCvAY7d7gcb1zNXnaI3wC3DEF
	 dYRXVJcFYKD0TGB1ZFqxezFJGuUqm2X8Ate1JNCI5dEkkrC4P9YykIlZPBh8EPpT6A
	 u1gRJWdOLLRO/sbuSItTb7GrG88u/YkZnpZUIDUbUfyC7CnKEQ9fiZ0c0A+DvN+3tX
	 o/RFlimYzxrBNVxbIA3kzRIhUBfDBji+APE0trcQtKA70U7l6hLY8aoxQegw2SMJ2W
	 41b8A2KKuYPB109ZkPpR166K3UQqL07Va8gi3Zz0rJFomRA7j0qBu8UQG6Xydh7r8X
	 oxS+l1jfe85DQ==
Message-ID: <sashiko-outbox-178035@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 09/17] dmaengine: idxd: quarantine terminate_all's
 descriptor slots until the device has drained
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Byrne" <daniel1.byrne@intel.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261019150630.4026341-10-daniel1.byrne@intel.com>
References: <20261019150630.4026341-1-daniel1.byrne@intel.com>
 <20261019150630.4026341-10-daniel1.byrne@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 17:26:33 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] dmaengine: idxd: missing wq_lock in idxd_dma_synchronize() causes =
UAF
- [High] dmaengine: idxd: missing idxd_wq_thread() sync on channel terminat=
ion
--

commit 9c6985db5bd50b1fe55f86734ee2fd37bc6a5f05
Author: Daniel Byrne <daniel1.byrne@intel.com>

dmaengine: idxd: quarantine terminate_all's descriptor slots until the devi=
ce has drained

This commit prevents premature descriptor slot and DMA unmap data reuse on
idxd_dma_terminate_all() by moving in-flight aborted descriptors to a
per-queue quarantine list. The quarantined slots and unmap data are then
released in idxd_dma_synchronize() after draining the workqueue, or upon
device halt or workqueue resource teardown.

> diff --git a/drivers/dma/idxd/device.c b/drivers/dma/idxd/device.c
> index 41223d2e20af0..09475f5ea026d 100644
> --- a/drivers/dma/idxd/device.c
> +++ b/drivers/dma/idxd/device.c

[ ... ]

> @@ -170,10 +172,18 @@ EXPORT_SYMBOL_NS_GPL(idxd_wq_alloc_resources, "IDXD=
");
>  void idxd_wq_free_resources(struct idxd_wq *wq)
>  {
>  	struct device *dev =3D &wq->idxd->pdev->dev;
> +	LIST_HEAD(dead_descs);
> =20
>  	if (wq->type !=3D IDXD_WQT_KERNEL)
>  		return;
> =20
> +	/*
> +	 * The disable frees the pool only after its drain and its reset
> +	 * completed, and a failed enable has run nothing, so the device no
> +	 * longer reaches what a quarantined descriptor maps.
> +	 */
> +	idxd_wq_quarantine_take(wq, &dead_descs);
> +	idxd_wq_quarantine_free(wq, &dead_descs);
>  	free_hw_descs(wq);
>  	free_descs(wq);
>  	dma_free_coherent(dev, wq->compls_size, wq->compls, wq->compls_addr);

[ ... ]

> @@ -1476,16 +1563,38 @@ void idxd_wq_free_irq(struct idxd_wq *wq)
>  	ie->pasid =3D IOMMU_PASID_INVALID;
>  }
> =20
> -void idxd_wq_flush_descs(struct idxd_wq *wq)
> +/*
> + * @quarantine: the device keeps running, so the slots of the descriptors
> + * it has not finished stay out of use until a drain covers them. A halt
> + * has killed them and frees their slots at once.
> + */
> +void idxd_wq_flush_descs(struct idxd_wq *wq, bool quarantine)
>  {
>  	struct idxd_irq_entry *ie =3D &wq->ie;
> +	bool killed =3D false;
> =20
>  	guard(mutex)(&wq->wq_lock);
> =20
>  	if (wq->state !=3D IDXD_WQ_ENABLED || wq->type !=3D IDXD_WQT_KERNEL)
>  		return;
> =20
> -	idxd_flush_pending_descs(ie);
> +	/*
> +	 * A submitter between its list add and its portal write holds
> +	 * wq_active. Waiting for the reference to die puts every listed
> +	 * descriptor in the device, where the drain that frees the
> +	 * quarantine covers it. A halt flush has done this itself.
> +	 */
> +	if (quarantine && !percpu_ref_is_dying(&wq->wq_active)) {
> +		reinit_completion(&wq->wq_resurrect);
> +		percpu_ref_kill(&wq->wq_active);
> +		wait_for_completion(&wq->wq_dead);
> +		killed =3D true;
> +	}
> +	idxd_flush_pending_descs(ie, quarantine);
> +	if (killed) {
> +		percpu_ref_reinit(&wq->wq_active);
> +		complete_all(&wq->wq_resurrect);
> +	}
>  }

[Severity: High]
How are idxd_wq_flush_descs() and idxd_dma_synchronize() synchronized
against the per-WQ MSI-X threaded interrupt handler idxd_wq_thread()?

In drivers/dma/idxd/device.c, idxd_wq_flush_descs() kills wq->wq_active to
wait for submitters before calling idxd_flush_pending_descs(), which drains
ie->pending_llist and ie->work_list under ie->list_lock:

	spin_lock(&ie->list_lock);
	head =3D llist_del_all(&ie->pending_llist);
	if (head) {
		llist_for_each_entry_safe(desc, itr, head, llnode)
			list_add_tail(&desc->list, &ie->work_list);
	}

	list_for_each_entry_safe(desc, itr, &ie->work_list, list)
		list_move_tail(&desc->list, &flist);
	spin_unlock(&ie->list_lock);

However, idxd_wq_thread() remains active during both idxd_dma_terminate_all=
()
and idxd_dma_synchronize().

First, at this commit, irq_process_pending_llist() in drivers/dma/idxd/irq.c
detaches ie->pending_llist outside ie->list_lock and re-queues incomplete
descriptors one at a time:

	head =3D llist_del_all(&irq_entry->pending_llist);
	if (!head)
		return;

	llist_for_each_entry_safe(desc, t, head, llnode) {
		u8 status =3D desc->completion->status & DSA_COMP_STATUS_MASK;

		if (status) {
			...
		} else {
			spin_lock(&irq_entry->list_lock);
			list_add_tail(&desc->list,
				      &irq_entry->work_list);
			spin_unlock(&irq_entry->list_lock);
		}
	}

If idxd_flush_pending_descs() runs while irq_process_pending_llist() holds
the detached list in head, those descriptors are missed by the flush and
subsequently added back onto ie->work_list un-aborted and un-quarantined.
(A later commit in this series, "dmaengine: idxd: fix the double free of a
descriptor whose submission failed", moves llist_del_all() and the work_list
insertion under ie->list_lock, which closes that window for incomplete
descriptors.)

Second, even with that later change, both irq_process_work_list() and
irq_process_pending_llist() move completed descriptors onto a local flist
under ie->list_lock, drop ie->list_lock, and then invoke
idxd_desc_complete() -> idxd_dma_complete_txd() outside the lock. Any
descriptor moved to idxd_wq_thread()'s local flist before
idxd_flush_pending_descs() takes ie->list_lock will not have its callback
cleared.

Because idxd_dma_synchronize() only drains the hardware queue via
idxd_wq_drain(wq) and does not synchronize with the threaded IRQ handler
(for example via synchronize_irq(wq->ie.vector)), could
idxd_dma_synchronize() return while idxd_wq_thread() is still running
dma_descriptor_unmap() and dmaengine_desc_get_callback_invoke() on
previously submitted descriptors, leading to a use-after-free if the client
frees its callback context after dmaengine_synchronize()?

> diff --git a/drivers/dma/idxd/dma.c b/drivers/dma/idxd/dma.c
> index defd1af74c0a9..196045cb9ef2d 100644
> --- a/drivers/dma/idxd/dma.c
> +++ b/drivers/dma/idxd/dma.c
> @@ -199,7 +199,8 @@ static int idxd_dma_terminate_all(struct dma_chan *c)
>  {
>  	struct idxd_wq *wq =3D to_idxd_wq(c);
> =20
> -	idxd_wq_flush_descs(wq);
> +	/* The device keeps running what the lists held. See synchronize. */
> +	idxd_wq_flush_descs(wq, true);
> =20
>  	return 0;
>  }
> =20
>  static void idxd_dma_synchronize(struct dma_chan *c)
>  {
>  	struct idxd_wq *wq =3D to_idxd_wq(c);
> +	LIST_HEAD(quarantined);
> =20
> +	/*
> +	 * dmaengine_synchronize() promises the client that its memory may
> +	 * be freed afterwards. The drain keeps that promise, and nothing
> +	 * the device held before it is left to write a completion record,
> +	 * so the slots terminate_all quarantined are free again.
> +	 */
> +	idxd_wq_quarantine_take(wq, &quarantined);
>  	idxd_wq_drain(wq);
> +	idxd_wq_quarantine_free(wq, &quarantined);
>  }

[Severity: High]
Can idxd_dma_synchronize() race with workqueue teardown and cause a
use-after-free on wq->descs and wq->sbq?

idxd_wq_halt_release() in drivers/dma/idxd/device.c acquires wq->wq_lock and
checks wq->state and wq->type before touching the quarantine:

void idxd_wq_halt_release(struct idxd_wq *wq)
{
	LIST_HEAD(dead_descs);

	guard(mutex)(&wq->wq_lock);

	if (wq->state !=3D IDXD_WQ_ENABLED || wq->type !=3D IDXD_WQT_KERNEL)
		return;

	idxd_wq_quarantine_take(wq, &dead_descs);
	idxd_wq_quarantine_free(wq, &dead_descs);
}

In contrast, idxd_dma_synchronize() splices wq->quarantine onto its local
stack list under only wq->ie.list_lock, sleeps in idxd_wq_drain() ->
idxd_cmd_exec(), and then frees the descriptors without holding wq->wq_lock.

If workqueue teardown runs concurrently (such as via sysfs unbind, PCI
removal in idxd_remove(), or FLR recovery in idxd_reset_done() calling
idxd_unbind() -> idxd_device_drv_remove() -> idxd_dmaengine_drv_remove() ->
idxd_drv_disable_wq() -> idxd_wq_free_resources()), idxd_wq_free_resources()
sees wq->quarantine empty because the descriptors were already moved onto
idxd_dma_synchronize()'s stack list, and proceeds to free wq->descs[i] and
wq->sbq:

	idxd_wq_quarantine_take(wq, &dead_descs);
	idxd_wq_quarantine_free(wq, &dead_descs);
	free_hw_descs(wq);
	free_descs(wq);
	dma_free_coherent(dev, wq->compls_size, wq->compls, wq->compls_addr);
	sbitmap_queue_free(&wq->sbq);

When idxd_wq_drain() returns in idxd_dma_synchronize(),
idxd_wq_quarantine_free() (or idxd_wq_quarantine_put_back() in the later
commit "dmaengine: idxd: return -ETIMEDOUT from drains and resets and leak
what the device may still write") will dereference the freed struct idxd_de=
sc
objects and call idxd_free_desc() -> sbitmap_queue_clear() on the freed
wq->sbq. Should idxd_dma_synchronize() also serialize under wq->wq_lock and
verify the workqueue state before taking and freeing quarantined descriptor=
s?

> =20
>  int idxd_register_dma_device(struct idxd_device *idxd)

[ ... ]

>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019150630.4026=
341-1-daniel1.byrne@intel.com?part=3D9
