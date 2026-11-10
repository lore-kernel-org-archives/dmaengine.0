Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794333874;
	b=JccPj+A7uLVr5TJLF0YKho9tMbAsoomGUHZ6OI/iaYmRiYcrZ2YZtnVVGmG6itxZlT7v
	 WtStLFGiwQJZ223L3VdtC9gYNUYMQErOs802tb/dE9MTgjCwwDHK9vA5NZZTiePgh7VYh
	 qUVl4opi5tNepqd80rtopZAJ1jp2DrrM5CRH0F51pYMT0tIHBBXTEqZon9QEP2XwuCZ77
	 3CoQBl7y8aauGJxIG1qEcUy/b1M2RLrVY3gywcxf8O2kcWrzE/7MDaiAK8j4N+OAQMOzt
	 CHVhggZWFaDQ1rugmbDYfUOFREeDo8PdmJMLr99WmZEUlybrHDKOrqd8ZbtGoaHIWdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794333874;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Im6eD6PEHap21DRCmNlwexzp6NvZdn170NUIQpaBsok=;
	b=nFXBHvU/0QL9Yj+edczMPuT2GmkBSdA2GxV8Q4FMZ493cDS9wuhWmKaVcSWonl+8OXMa
	 UyAsoEcOep7KO+HBn48mWKqfDIQy1yD/oXjI+02cn3CAhoPnvTuXdklS0PUHNljmbc28r
	 EbaJrq33unzu4nXFarxuXMhzxzgRd/qMQtSulyBcMsEljvlRVaYtgMiD0d4fSAT7fYHCB
	 ONGigbbq0g6Ry/Duhwh3croFk33X3gLQDM1ySFETgqq3j5AoQP6EirfDg9gsdhIA/VRiU
	 GHl6CNWtd0RZJAzZ5DdzOTZk0noC3kLtbTAE1IMlHni1CNz2gBio3DmtnqCHvDBsv9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WqupF7uZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E92606A320
	for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 18:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WqupF7uZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78F7D1F0089F;
	Tue, 10 Nov 2026 18:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794333873;
	bh=Im6eD6PEHap21DRCmNlwexzp6NvZdn170NUIQpaBsok=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WqupF7uZIlJGCq9kxtd6/nC0ul5MGLVCWrrAYxL5PR619D0TmQZCf0KCOhNDSvmlh
	 E8rT3RE8R9aFHwJJqIDj4rzV8WOCrmL4jXkpEcdclSbySM2EVOC0AdkVwNXYZ9gPwL
	 OhhqKog/u7ZwG3CFTG8/ccPuBZQdjCPDzxuJtndx7ccdrUCy25BulR+clkECnZvmjm
	 ed2EGmH6Vfx8D76xtDeiyH2khvkKH1S9DyKaSsSQXgNfoZJyvBVrGcwXniGvkkMulw
	 WkPH0JEltLE7ExHaK1z6YPO5LQcL9kjLMi3GH1jJKqAl2s+rQzI0WqaExPjcDreu/J
	 anXS7k3WiffTw==
Message-ID: <sashiko-outbox-207555@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 23/33] dmaengine: timb_dma: route callbacks via
 channel BH
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <e9f90c61446942c160480ee81e220869de918105.1794315350.git.allen.lkml@gmail.com>
References: <cover.1794315350.git.allen.lkml@gmail.com>
 <e9f90c61446942c160480ee81e220869de918105.1794315350.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 18:04:33 +0000
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
- [High] dmaengine: timb_dma: race in __td_ier_mask() and TIMBDMA_IER
  updates
- [High] dmaengine: timb_dma: race between timb_dma_chan_bh() and
  channel teardown
--

commit dc5312469115907bacab896cc42d4d204804abfc
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: timb_dma: route callbacks via channel BH

This commit moves per-channel DMA completion handling from the controller
tasklet to per-channel BH work items and drains the BH work during channel
teardown and driver removal.

> diff --git a/drivers/dma/timb_dma.c b/drivers/dma/timb_dma.c
> index 0acd7a36a3d0d..d24508e2a0bbf 100644
> --- a/drivers/dma/timb_dma.c
> +++ b/drivers/dma/timb_dma.c
> @@ -433,6 +433,8 @@ static void td_free_chan_resources(struct dma_chan *c=
han)
> =20
>  	dev_dbg(dmaengine_chan_dev(chan), "%s: Entry\n", __func__);
> =20
> +	dmaengine_kill_bh(&td_chan->chan);
> +
>  	/* check that all descriptors are free */
>  	BUG_ON(!list_empty(&td_chan->active_list));
>  	BUG_ON(!list_empty(&td_chan->queue));
> @@ -575,17 +577,42 @@ static void td_tasklet(struct tasklet_struct *t)
>  	for (i =3D 0; i < td->dma.chancnt; i++)
>  		if (ipr & (1 << i)) {
>  			struct timb_dma_chan *td_chan =3D td->channels + i;
> -			spin_lock(&td_chan->lock);
> -			__td_finish(td_chan);
> -			if (!list_empty(&td_chan->queue))
> -				__td_start_next(td_chan);
> -			spin_unlock(&td_chan->lock);
> +			dmaengine_schedule_bh(&td_chan->chan);
>  		}
> =20
>  	ier =3D __td_ier_mask(td);
>  	iowrite32(ier, td->membase + TIMBDMA_IER);
>  }
> =20
> +static void timb_dma_chan_bh(struct dma_chan *chan)
> +{
> +	struct timb_dma_chan *td_chan =3D container_of(chan, struct timb_dma_ch=
an,
> +						     chan);
> +	struct timb_dma *td =3D tdchantotd(td_chan);
> +	u32 ier;
> +
> +	spin_lock(&td_chan->lock);
> +	__td_finish(td_chan);
> +	if (!list_empty(&td_chan->queue))
> +		__td_start_next(td_chan);
> +	spin_unlock(&td_chan->lock);

[Severity: High]
Can a pending timb_dma_chan_bh() work item prematurely complete a newly
submitted transfer after td_terminate_all() or td_issue_pending()?

Previously, td_tasklet() took td_chan->lock and finished the active
descriptor immediately.  Now, td_tasklet() only schedules the channel BH
work, and td_terminate_all() tears down the active descriptor without
canceling or flushing that work:

CPU0 (<softirq>)                  CPU1
td_tasklet()
  dmaengine_schedule_bh()
                                  td_terminate_all()
                                    spin_lock_bh(&td_chan->lock)
                                    __td_finish(td_chan)
                                    spin_unlock_bh(&td_chan->lock)
                                  td_tx_submit()
                                    spin_lock_bh(&td_chan->lock)
                                    __td_start_dma(td_chan)
                                    spin_unlock_bh(&td_chan->lock)
timb_dma_chan_bh()
  spin_lock(&td_chan->lock)
  __td_finish(td_chan)  <-- stops and unmaps the new in-flight transfer

When the stale BH work runs, __td_finish() unmaps and completes the newly
started descriptor at the head of td_chan->active_list while hardware DMA is
still in flight.

In addition, dmaengine_kill_bh() in td_free_chan_resources() only flushes
td_chan->chan.bh_work without waiting for td->tasklet.  If td_tasklet() is
pending or running on another CPU, it can schedule the channel BH after
dmaengine_kill_bh() returns, or leave td_chan->active_list non-empty when
td_free_chan_resources() reaches BUG_ON(!list_empty(&td_chan->active_list)).

> +
> +	/*
> +	 * The controller tasklet re-armed IER before this channel was
> +	 * finished. Recompute it now that the channel state has changed.
> +	 */
> +	ier =3D __td_ier_mask(td);
> +	iowrite32(ier, td->membase + TIMBDMA_IER);
> +}

[Severity: High]
Does calling __td_ier_mask(td) and writing TIMBDMA_IER without holding the
channel locks race with concurrent channel completions and starts?

Previously, __td_finish() and __td_start_next() ran sequentially inside the
single controller tasklet before calling __td_ier_mask(td).  Now, both
td_tasklet() and each channel's timb_dma_chan_bh() call __td_ier_mask(td)
without holding any td_chan->lock:

drivers/dma/timb_dma.c:__td_ier_mask() {
	for (i =3D 0; i < td->dma.chancnt; i++) {
		struct timb_dma_chan *td_chan =3D td->channels + i;
		if (td_chan->ongoing) {
			struct timb_dma_desc *td_desc =3D
				list_entry(td_chan->active_list.next,
				struct timb_dma_desc, desc_node);
			if (td_desc->interrupt)
				ret |=3D 1 << i;
		}
	}
}

If another CPU is inside __td_finish() (from another channel's BH,
td_terminate_all(), or td_issue_pending()), __td_ier_mask() can observe
td_chan->ongoing =3D=3D true while list_move() empties td_chan->active_list:

CPU0                              CPU1
timb_dma_chan_bh()                __td_finish(td_chan)
  spin_unlock(&td_chan->lock)
  __td_ier_mask(td)
    if (td_chan->ongoing)
                                    td_chan->ongoing =3D false;
                                    list_move(&td_desc->desc_node,
                                              &td_chan->free_list);
      td_desc =3D list_entry(
        td_chan->active_list.next, ...)
      if (td_desc->interrupt)  <-- out-of-bounds read off list head

When active_list is empty, active_list.next points to &td_chan->active_list
itself, so reading td_desc->interrupt reads past struct timb_dma_chan (and
past the end of the struct timb_dma slab allocation on the last channel), or
reads a freed descriptor if td_free_chan_resources() frees free_list.

Second, writing ier to TIMBDMA_IER outside any lock races with
__td_enable_chan_irq() when another channel starts a transfer, overwriting
TIMBDMA_IER with a stale mask and losing that channel's completion
interrupt.

Third, td_irq() masks interrupts by writing 0 to TIMBDMA_IER and relies on
td_tasklet() to clear TIMBDMA_ISR before re-enabling TIMBDMA_IER.  Because
td_tasklet() now writes TIMBDMA_IER before timb_dma_chan_bh() runs
__td_finish() to stop RX DMA and clear ongoing, and because
timb_dma_chan_bh() can also write TIMBDMA_IER after td_irq() masks it for
another channel but before td_tasklet() acknowledges TIMBDMA_ISR, an
unacknowledged interrupt can be unmasked immediately and re-trigger
td_irq().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794315350.gi=
t.allen.lkml@gmail.com?part=3D23
