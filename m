Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792437478;
	b=djCQtjE1rPnDZGCvDmXhVq1OMZI0Ss1dz6zrkOlo8gG7213BSAsD810JXcHIgp56xcIp
	 xS0HZs0igyjCr2W9kpea5QZvgDOq8ml+lHX9GcuPuXMOMZYQSTyHbu2dzCQK8p79RRMOT
	 ECNZZ0NjUdXebfn8zhkzJ1IdjnXj7A9PzhMCS0ObLd9RKzqS4NujDYG+i585nHjdAInu8
	 fLfQT5LLkiFHQss6vyfZ30GwjEDO8CDDe0lR+u91nPqy9xruoxN6R4EYfYUCnUrn6Zqif
	 HuLlhEDokZG+h402R/ZzWT3bxkXOQ9WZOTwzhs7sSOUMB1/+88s/BHQGbe0lC/hjZzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792437478;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+qh/pOfi02SdK1B7LhZ9JOBfvnwo5Y+K66DuK6JUGJ4=;
	b=xcLOurWDipXST0h3B63QnH5EvwE3hh8kOk2Xfd1XPueKjSDIjmhDyO0kZmzwONDUVGtA
	 WsGjkQhFfOkn+2hyjypDtnj1dRqHdkNVuOSOmsNM/8rO330sfpBcBizQSeodii8SfKqyV
	 WJjTP+ZmZF8iFHpvRug6TVo+16VkcWc4H5q86XpaZKyaK7Fdq85TD4PscUF0AxKnioxHm
	 l1WGUJk6G7HS5/5VoRV18vT/eqbhcZuKfQ8+r47y7bI+88dZqgeo1xuXtXEV45Fsy/9y1
	 z+8kenDkDeD39eVqtTs16prPujcpCLCYz8IFgIA53syW9GRYG/2sDLAL9rnqB/JJmfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fqx0h0O0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F488606A319
	for <dmaengine@vger.kernel.org>; Mon, 19 Oct 2026 19:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fqx0h0O0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE7461F000C4;
	Mon, 19 Oct 2026 19:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792437478;
	bh=+qh/pOfi02SdK1B7LhZ9JOBfvnwo5Y+K66DuK6JUGJ4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fqx0h0O0p+osJtR0R+IiWt/zeFLNBl7fBImtxyzQdb6SONtZQ3j10ZbFmeh7Zg0Yn
	 3dAJUXVslN57eaFSGExSeMlTp1ZbdiCuWVIdg8FyaB3+EsOeuDTxp0OdLSWA00BgI3
	 DBjFzKruYcZ46I5A2dbwMiYoQlYlLXqbdjWmQHC+u5bEeLc6roMUO/3fehOisH9XZJ
	 53BL3gjoEGeZr04FPaYvMQU1mzCIVpNIb5mjxyqiKAQQADLR7XfshbMrh6p4K3gzSI
	 F8Tnzo1J/pvBaSwvTr8d24xNB/WbTrwxgbzhq9FVfSJSuCLjdZzmzuT8CpBmwsMFzM
	 Y5M4NhPAc8htQ==
Message-ID: <sashiko-outbox-178140@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 15/17] dmaengine: idxd: flush the work queues on every
 halt type
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Byrne" <daniel1.byrne@intel.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261019150630.4026341-16-daniel1.byrne@intel.com>
References: <20261019150630.4026341-1-daniel1.byrne@intel.com>
 <20261019150630.4026341-16-daniel1.byrne@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 19:17:57 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dmaengine: idxd: premature wq_active revival in idxd_wqs_halt_flus=
h()
--

commit 6dda938d3d45e583931b07390e3058529e447340
Author: Daniel Byrne <daniel1.byrne@intel.com>

dmaengine: idxd: flush the work queues on every halt type

This commit flushes kernel work queues on all device halt types (software
reset, FLR, and system reset) rather than only on FLR. Before flushing, it
kills wq_active and waits for in-flight submitters to finish, reviving the
reference afterwards on software reset.

> diff --git a/drivers/dma/idxd/irq.c b/drivers/dma/idxd/irq.c
> index 1ec3d360eea8f..99b2df7fc2de0 100644
> --- a/drivers/dma/idxd/irq.c
> +++ b/drivers/dma/idxd/irq.c
> @@ -422,15 +422,61 @@ static void idxd_device_flr(struct work_struct *wor=
k)
>  		dev_err(&idxd->pdev->dev, "FLR failed\n");
>  }
> =20
> -static void idxd_wqs_flush_descs(struct idxd_device *idxd)
> +/*
> + * Complete what the halted engines will never finish, or a client waiti=
ng
> + * on one of those descriptors waits forever. The flush hands descriptors
> + * back, so no submitter may still own one: a submitter that passed the
> + * state check before the halt can hold a descriptor on the pending list
> + * while its ENQCMDS retries, and it aborts and frees that descriptor
> + * itself when the submit fails. Killing wq_active and waiting for the
> + * last submitter to drop its reference orders the flush after that.
> + * Each queue is handled in one hold of wq_lock, from the state check
> + * through the revive. A driver remove that quiesces the queue in one
> + * hold and disables it in another, as iaa_crypto's does, would otherwise
> + * find the reference dying between the kill and the revive, skip its
> + * own kill, and have the revive undo its quiesce before its disable
> + * frees the queue.
> + * @resurrect: revive the queues afterwards for a reset that keeps them.
> + */
> +static void idxd_wqs_halt_flush(struct idxd_device *idxd, bool resurrect)
>  {
> +	bool killed;
>  	int i;
> =20
>  	for (i =3D 0; i < idxd->max_wqs; i++) {
>  		struct idxd_wq *wq =3D idxd->wqs[i];
> =20
> -		idxd_wq_flush_descs(wq, false);
> +		mutex_lock(&wq->wq_lock);
> +		if (wq->state !=3D IDXD_WQ_ENABLED || wq->type !=3D IDXD_WQT_KERNEL) {
> +			mutex_unlock(&wq->wq_lock);
> +			continue;
> +		}
> +		killed =3D idxd_wq_kill(wq);
> +		__idxd_wq_flush_descs(wq, false);
>  		idxd_wq_halt_release(wq);
> +
> +		if (resurrect) {
> +			/*
> +			 * Revive only what this flush killed, and only if no
> +			 * failed interrupt handle revoke killed it for good,
> +			 * which leaves the handle invalid. The state changes
> +			 * without the lock only to enabled, in the reinit of
> +			 * an earlier halt, or on a queue that an FLR recovery
> +			 * has unbound, whose reference reads as dying, so this
> +			 * flush did not kill it. A reference an earlier halt
> +			 * left dead stays dead, since that halt's recovery
> +			 * unbinds the queue. The revive has to stay in this
> +			 * hold: moved to the reinit, it would reopen the
> +			 * window described above.
> +			 */
> +			if (killed && wq->ie.int_handle !=3D INVALID_INT_HANDLE)
> +				percpu_ref_reinit(&wq->wq_active);
> +			complete_all(&wq->wq_resurrect);
> +		} else {
> +			/* Let blocked submitters retry and fail on the state. */
> +			complete_all(&wq->wq_resurrect);
> +		}
> +		mutex_unlock(&wq->wq_lock);
>  	}
>  }
> =20
> @@ -442,6 +488,8 @@ static irqreturn_t idxd_halt(struct idxd_device *idxd)
>  	if (gensts.state =3D=3D IDXD_DEVICE_STATE_HALT) {
>  		idxd->state =3D IDXD_DEV_HALTED;
>  		if (gensts.reset_type =3D=3D IDXD_DEVICE_RESET_SOFTWARE) {
> +			/* The reinit below re-enables the queues, so revive them. */
> +			idxd_wqs_halt_flush(idxd, true);
>  			/*
>  			 * If we need a software reset, we will throw the work
>  			 * on a system workqueue in order to allow interrupts
[ ... ]
> diff --git a/drivers/dma/idxd/submit.c b/drivers/dma/idxd/submit.c
> index fab3e0176cbae..cf8536e94c15e 100644
> --- a/drivers/dma/idxd/submit.c
> +++ b/drivers/dma/idxd/submit.c
[ ... ]
> @@ -215,6 +225,22 @@ int idxd_submit_desc(struct idxd_wq *wq, struct idxd=
_desc *desc)
>  			return -ENXIO;
>  	}
> =20
> +	/*
> +	 * A software-reset halt revives wq_active before its reinit enables
> +	 * the device again. A submitter that passed the check above before
> +	 * the halt and got its reference after the revive would post to the
> +	 * halted device, which drops the descriptor, and nothing would
> +	 * complete an interrupt-armed one. The halt stores the state before
> +	 * its kill and revives the reference after the wait. The barrier
> +	 * pairs with the release in percpu_ref_reinit() and orders this
> +	 * read after the tryget that saw the revive.
> +	 */
> +	smp_rmb();
> +	if (idxd->state !=3D IDXD_DEV_ENABLED) {
> +		percpu_ref_put(&wq->wq_active);
> +		return -EIO;
> +	}
> +
>  	portal =3D idxd_wq_portal_addr(wq);

[Severity: High]
Can reviving wq->wq_active in idxd_wqs_halt_flush() before
idxd_device_reinit() runs allow idxd_submit_desc() to post descriptors to a
work queue that is still disabled in hardware?

On a software-reset halt, idxd_halt() calls idxd_wqs_halt_flush(idxd, true),
which reinitializes wq->wq_active and completes wq->wq_resurrect, and then
queues idxd_device_reinit(). In idxd_submit_desc(), the second check only
verifies idxd->state !=3D IDXD_DEV_ENABLED after acquiring wq->wq_active.

However, in idxd_device_reinit():

drivers/dma/idxd/irq.c:idxd_device_reinit() {
	...
	rc =3D idxd_device_enable(idxd);
	if (rc < 0)
		goto out;

	for (i =3D 0; i < idxd->max_wqs; i++) {
		if (test_bit(i, idxd->wq_enable_map)) {
			struct idxd_wq *wq =3D idxd->wqs[i];

			rc =3D idxd_wq_enable(wq);
			if (rc < 0) {
				clear_bit(i, idxd->wq_enable_map);
				dev_warn(dev, "Unable to re-enable wq %s\n",
					 dev_name(wq_confdev(wq)));
			}
		}
	}
}

idxd_device_enable() sets idxd->state =3D IDXD_DEV_ENABLED before the loop
calls idxd_wq_enable() on each work queue.

Once idxd->state is set to IDXD_DEV_ENABLED, won't submitters on a dedicated
work queue pass both checks in idxd_submit_desc(), add interrupt-armed
descriptors to ie->pending_llist, and call iosubmit_cmds512() before
idxd_wq_enable() has enabled that work queue in hardware, causing the device
to drop the descriptors and leaving waiting clients hung?

In addition, there appear to be two cases where the work queue is never
re-enabled in hardware even after idxd_device_reinit() finishes while
wq->wq_active remains live:

1. If idxd_wq_enable() fails in idxd_device_reinit(), it warns and clears
   wq_enable_map, leaving idxd->state =3D=3D IDXD_DEV_ENABLED and wq->wq_ac=
tive
   live on the disabled work queue.

2. If IDXD_FLAG_CONFIGURABLE is not set, idxd_device_reset() ->
   idxd_device_clear_state() does not clear wq->state, so idxd_wq_enable()
   sees wq->state =3D=3D IDXD_WQ_ENABLED and returns 0 without issuing
   IDXD_CMD_ENABLE_WQ:

drivers/dma/idxd/device.c:idxd_wq_enable() {
	...
	if (wq->state =3D=3D IDXD_WQ_ENABLED) {
		dev_dbg(dev, "WQ %d already enabled\n", wq->id);
		return 0;
	}

	idxd_cmd_exec(idxd, IDXD_CMD_ENABLE_WQ, wq->id, &status);
	...
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019150630.4026=
341-1-daniel1.byrne@intel.com?part=3D15
