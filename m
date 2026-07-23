Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9D8412C0C
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 09:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784798087; cv=none; b=AHurP4izbKflO7pjpTq9vUozrkOy2hznvHgnmbvjqukfDGBsphMEsyHQ8sL94LsDLyzd0H6j+SrDfrY74XjNBxWYOffdNzuU145A1604X2N3Agjwi2h75f4HwB45NpEp0QgYUWftNCoOIXMBoTAipknLQnB+5u47Cw5vas0Tid8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784798087; c=relaxed/simple;
	bh=VMCRGx20eOH2vpjzT+qD9NQTllLa7CQNfltUjvwJug4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sStUejS5UE55zDaWhvXCXjwZEHssgYRubo2jxx0Mlpg2+aHJEZhEvC8GxtsNhcmlfLXea+GmX/0bSISqfJwmdUY8ZvMZxqFSknGdDnNTts8unvFO1X+cY2UEKWdMV6frah9SbdH4HMf8KOQCSu1OdKOovhW4xylKDhhG/eI9Eww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dln8Z+6f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dln8Z+6f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFFA51F000E9;
	Thu, 23 Jul 2026 09:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784798086;
	bh=NOfrQAhehq2ifDLALc2ekQpVhzyHAkIv5CMjRAKIyAo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Dln8Z+6fq7EK7kd0lSCilraph9BudmYMVjrPchkQ2T4Glzg1yi6ksHuE1GR3xYmeR
	 P3EJVpwTILJQTsYYUtrtQhUC9yQYL4T0aCRrPf9tuQlS8bj+kr9q3PwfVM/08vIUx7
	 lR/CMDK7GIikFGUXMMxTxd9BBfrSmUEfRoqzpS/HwkzWs4MjRpXNZZSjTEn/CbNqWN
	 Y9NwqLhn9LJBSsDoJRLe7+tkFJsFvTibt5bwqWhnJYfOfChDbcfr1wH7xrmBNOVMdP
	 EZYB9YeZRemFwiTIP7O71B5OVUvjNJ0BDCj4QXBTOx5PICcdCSs10lDhZMUeJasskf
	 mg5Pd9ZlJD/NQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 14/19] dmaengine: dw-edma: Reset LL state after
 terminate and abort
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260723084150.521366-15-den@valinux.co.jp>
References: <20260723084150.521366-1-den@valinux.co.jp>
 <20260723084150.521366-15-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 09:14:35 +0000
Message-Id: <20260723091445.EFFA51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Deferring `EDMA_REQ_STOP` for Legacy eDMA when `ll_pending > 0` ca=
uses a permanent channel stall if the hardware has already stopped without =
a pending doorbell.

Pre-existing issues:
- [High] Virtual descriptors are permanently leaked during channel terminat=
ion because `dw_edma_terminate_vdesc` removes them from the tracking lists =
without ever freeing their backing memory.
--

--- Patch [14]: [PATCH v2 14/19] dmaengine: dw-edma: Reset LL state after t=
erminate and abort ---
commit 88e57ef5a9d3ec5120e32fad81665662de2e275a
Author: Koichiro Den <den@valinux.co.jp>

dmaengine: dw-edma: Reset LL state after terminate and abort

Termination and abort can leave published entries in the circular ring.
Reset such a ring before reuse, but leave an already clean ring alone.
This avoids clearing the whole ring after every synchronous transfer.

> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-=
edma-core.c
> index 963abecdc59ed..9305137f85f67 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c
[ ... ]
> @@ -616,36 +617,64 @@ static int dw_edma_device_resume(struct dma_chan *d=
chan)
>  	return err;
>  }
> =20
> +/* Must be called with vc.lock held. */
> +static bool dw_edma_may_be_active(struct dw_edma_chan *chan)
> +{
> +	if (chan->non_ll)
> +		return dw_edma_core_ch_status(chan) =3D=3D DMA_IN_PROGRESS;
> +
> +	if (!dw_edma_ll_pending(chan))
> +		return false;
> +
> +	/*
> +	 * Legacy eDMA can report STOPPED while a doorbell-triggered start is
> +	 * still pending. Native HDMA has a dedicated STOP event.
> +	 */
> +	return !dw_edma_ll_has_hdma_stop_event(chan) ||
> +	       dw_edma_core_ch_status(chan) =3D=3D DMA_IN_PROGRESS;
> +}
> +
> +/* Must be called with vc.lock held after the channel has stopped. */
> +static void dw_edma_finish_termination(struct dw_edma_chan *chan)
> +{
> +	dw_edma_terminate_all_descs(chan);

[Severity: High]
This is a pre-existing issue, but does dw_edma_terminate_all_descs() leak
virtual descriptors during channel termination?

Looking at the termination path, dw_edma_terminate_all_descs() uses
dw_edma_terminate_vdesc_list() to move descriptors to the desc_terminated l=
ist:

drivers/dma/dw-edma/dw-edma-core.c:dw_edma_terminate_all_descs() {
    dw_edma_terminate_vdesc_list(&chan->vc.desc_issued);
    dw_edma_terminate_vdesc_list(&chan->vc.desc_submitted);
}

However, there appears to be no call to vchan_dma_desc_free_list() within t=
he
termination path.

Are these descriptors permanently leaked until the entire channel is releas=
ed
via free_chan_resources(), potentially exhausting system memory if triggered
repeatedly by userspace?

> +
> +	/* Preserve a clean ring; resync only if entries remain published. */
> +	if (!chan->non_ll && dw_edma_ll_pending(chan))
> +		dw_edma_core_reset_ll(chan);
> +
> +	chan->request =3D EDMA_REQ_NONE;
> +	chan->status =3D EDMA_ST_IDLE;
> +}
[ ... ]
> @@ -965,17 +994,30 @@ static void dw_edma_done_interrupt(struct dw_edma_c=
han *chan)
>  	bool active;
> =20
>  	spin_lock_irqsave(&chan->vc.lock, flags);
> -	if (chan->status =3D=3D EDMA_ST_PAUSE) {
> -		spin_unlock_irqrestore(&chan->vc.lock, flags);
> -		return;
> -	}
> +	if (chan->status =3D=3D EDMA_ST_PAUSE)
> +		goto out;
> +
> +	/*
> +	 * A stopped event sampled after the request can complete it directly.
> +	 * If it was sampled just before the request, complete the request only
> +	 * when its boundary drains all published entries. A running event only
> +	 * advances LL progress.
> +	 */
> +	if (chan->request !=3D EDMA_REQ_NONE && !chan->non_ll &&
> +	    (!chan->ll_irq_stopped || !chan->ll_irq_requested)) {
> +		bool stopped =3D chan->ll_irq_stopped;
> =20
> -	if (!chan->non_ll)
>  		dw_edma_ll_consume_progress(chan);
> +		if (!stopped || dw_edma_ll_pending(chan))
> +			goto out;

[Severity: High]
Can this cause a permanent channel stall for Legacy eDMA when descriptors
are pending?

If dw_edma_device_terminate_all() is called while ll_pending > 0, it defers
termination by setting EDMA_REQ_STOP and waits for a DONE IRQ.

If the hardware has already stopped (e.g., reaching the end of the previous
chain) and the doorbell was bypassed, the DONE IRQ handler processes comple=
ted
elements but sees ll_pending > 0. It takes the goto out path:

drivers/dma/dw-edma/dw-edma-core.c:dw_edma_done_interrupt() {
    if (!stopped || dw_edma_ll_pending(chan))
        goto out;
    ...
out:
    dw_edma_core_ch_maybe_doorbell(chan);
}

However, dw_edma_core_ch_maybe_doorbell() will refuse to ring the doorbell
because EDMA_REQ_STOP is set:

drivers/dma/dw-edma/dw-edma-core.c:dw_edma_core_ch_maybe_doorbell() {
    if (... || chan->request !=3D EDMA_REQ_NONE || ...)
        return;
    ...
}

With the hardware stopped and no doorbell rung, will any further IRQs arriv=
e,
or does this permanently stall the channel?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723084150.5213=
66-1-den@valinux.co.jp?part=3D14
