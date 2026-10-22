Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792708169;
	b=4fwtK0G3ejFqmsc5iItLxgWmop0bkhvjGg4sL814cWlW6Lnn1/z66lKOVVRltysDDACh
	 H2t49Xc5c43A3jjiO58Dj+Ja7N+Pvcekg6i0461JzAu0/53CHLVquJfejFwbrto3j+VN2
	 u+jGQ+s+hR02qpatMw3JSrktGtGcdWWZ8QoEatWRxDL7CQsVCuShKwnNH76oIpM0FOQ9E
	 33DurikjbSC9/nwf2ikDTZkxHHKY45cmRosB90eNMumYehC8Vp01OrbqBcCdbNzLDDmjZ
	 rbn/kqqQsZOqb/Lf4prWtTuCdXkFnWhILwV2Sje6G3e2Zp0sqAqYEr1pnSNP7yaiNcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792708169;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=vMyD24zIksX5iyZivlendeJe+HpeBe1LyFNcDxlm1dk=;
	b=d1jrI43cfByIQ9p1zZFqBoUthICSXG/zJA2sf2lbtorNyAMGltwIU9ra1m8UQeS1BfuX
	 qEHqm8qG/bYZsGHdB+JSRC+6F1Xqe+AzKR+CI4P1ZuVf5vRWnFLIlmbmML1z6yWRMUJ+e
	 3odTiDaRhtuF289zIGdzOxPDLjkkdmfZHUPC14eC07v5BOc1fUmuoEmxcyP3NChWX6VZe
	 rkZt58SpCz1l4JVBhO58eUIQ93i+T5gHfrDKSgPC1W/bWus8o6zE3naGNJ19L9xOSio3k
	 P80yVpIXgM1wUu/mdxkIPFoFPNq2qa2VeEvZEf0pyNYJKimAscm2A0Iv8Nq1J5fw6rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XvqgJc8H;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F75606A319
	for <dmaengine@vger.kernel.org>; Thu, 22 Oct 2026 22:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XvqgJc8H
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C39C51F01825;
	Thu, 22 Oct 2026 22:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792708169;
	bh=vMyD24zIksX5iyZivlendeJe+HpeBe1LyFNcDxlm1dk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XvqgJc8H+lUYOX6V6muYtOFBrc2PrSkhMvpAJmcAL8kOgObAFySSxCs9XPWfL0f0s
	 LqhVucH/YLixK8esA6zv06q/XIXhPBb5Gft+Iicm3fane5Vk0/FW9oz1QnynHzeSOY
	 oYPZGm6YSROT/ZahT7DUUqWYK9uJTRsR9PNrJbILDTAWGTxV7GgcRejDk4Rke07KKJ
	 aMvj8zs5kLfEz0Xnci8yRAg/SJJijXSsROlmiWjMKfp2C9oTBpJh2nPt3KgHAuqNuc
	 0yv2Tt9Wvx6uFkvKT7t5Dr1AJW3Cz7gE45PSUpnS3uqRCXflsW2yhZViSuXaQMXr1y
	 j0ET0PkxCTsmA==
Message-ID: <sashiko-outbox-182123@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/5] dmaengine: xilinx_dma: Recover a withheld AXI DMA
 channel
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jeff C. Jensen" <kernel@nullptr.com>, dmaengine@vger.kernel.org
Cc: vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261022-xilinx-dma-work-v1-5-20faea2e7a80@nullptr.com>
References: <20261022-xilinx-dma-work-v1-0-20faea2e7a80@nullptr.com>
 <20261022-xilinx-dma-work-v1-5-20faea2e7a80@nullptr.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 22:29:28 +0000
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
- [High] dmaengine: xilinx_dma: chan->quiesced not cleared on failed reset
- [Medium] dmaengine: xilinx_dma: race in xilinx_dma_tx_submit() across cha=
nnel recovery
--

commit 0230d2d57b7d259e756e6f7875674a232d1f812a
Author: Jeff C. Jensen <kernel@nullptr.com>

dmaengine: xilinx_dma: Recover a withheld AXI DMA channel

This commit adds two-step recovery for a withheld single-channel AXI DMA
controller by resetting the engine in xilinx_dma_terminate_all() and
reclaiming the quarantined descriptors in xilinx_dma_synchronize().

> diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_=
dma.c
> index 0316c6e7881f9..c72c0fc985c5c 100644
> --- a/drivers/dma/xilinx/xilinx_dma.c
> +++ b/drivers/dma/xilinx/xilinx_dma.c

[ ... ]

> @@ -2917,12 +2920,109 @@ xilinx_mcdma_prep_slave_sg(struct dma_chan *dcha=
n, struct scatterlist *sgl,
>  	return NULL;
>  }
> =20

[ ... ]

> +static int xilinx_dma_reset_withheld_channel(struct xilinx_dma_chan *cha=
n)
> +{
> +	unsigned long flags;
> +	int err;
> +
> +	if (!xilinx_dma_reset_is_isolated(chan)) {
> +		dev_err(chan->dev,
> +			"channel %p stays withheld: a reset would disturb the other channel\n=
",
> +			chan);
> +		return -EBUSY;
> +	}
> +
> +	err =3D chan->stop_transfer(chan);
> +	if (err)
> +		dev_dbg(chan->dev, "channel %p did not halt before its reset\n", chan);
> +
> +	err =3D xilinx_dma_chan_reset(chan);
> +	if (err) {
> +		dev_err(chan->dev, "channel %p stays withheld: reset failed again\n", =
chan);
> +		return err;
> +	}
> +
> +	spin_lock_irqsave(&chan->lock, flags);
> +	chan->quiesced =3D true;
> +	spin_unlock_irqrestore(&chan->lock, flags);
> +
> +	return 0;
> +}

[Severity: High]
What happens if terminate is called twice on a withheld channel before
dmaengine_synchronize() runs, and the second reset times out?

Specifically, in drivers/dma/xilinx/xilinx_dma.c:

1. A single-channel AXI DMA controller fails a reset and is withheld via
   xilinx_dma_quarantine_channel() with chan->quarantined =3D true and
   chan->err =3D true.

2. The client calls dmaengine_terminate_async(), which runs
   xilinx_dma_terminate_all() -> xilinx_dma_reset_withheld_channel().
   When xilinx_dma_chan_reset() succeeds, xilinx_dma_reset() clears
   chan->err =3D false and sets chan->idle =3D true, and
   xilinx_dma_reset_withheld_channel() sets chan->quiesced =3D true.
   Because dmaengine_synchronize() has not run yet, chan->quarantined
   remains true.

3. Before dmaengine_synchronize() runs, terminate is called again (for
   example, via dmaengine_terminate_sync() or a second
   dmaengine_terminate_async() during teardown).
   xilinx_dma_terminate_all() sees xilinx_dma_chan_quarantined(chan) is
   still true and invokes xilinx_dma_reset_withheld_channel() a second
   time.

4. xilinx_dma_reset_withheld_channel() unconditionally starts another
   hardware soft reset via xilinx_dma_chan_reset(chan) (writing
   XILINX_DMA_DMACR_RESET to XILINX_DMA_REG_DMACR) without clearing
   chan->quiesced. If this second reset times out,
   xilinx_dma_reset_withheld_channel() returns -ETIMEDOUT, but leaves
   chan->quiesced =3D true and chan->err =3D false from the earlier reset
   while XILINX_DMA_DMACR_RESET is still incomplete in hardware and
   XILINX_DMA_DMAXR_ALL_IRQ_MASK has not been re-enabled.

Similarly, xilinx_dma_quarantine_channel() does not clear
chan->quiesced =3D false when withholding a channel:

drivers/dma/xilinx/xilinx_dma.c:xilinx_dma_quarantine_channel() {
	spin_lock_irqsave(&chan->lock, flags);
	chan->quarantined =3D true;
	chan->err =3D true;
	/* a completion pass mid-callback stops at its current descriptor */
	chan->terminating =3D true;
	...
}

When dmaengine_synchronize() subsequently runs (either directly or
unconditionally via dma_release_channel() -> dma_chan_put()),
xilinx_dma_synchronize() -> xilinx_dma_recover_channel() sees both
chan->quarantined and chan->quiesced set to true. Wouldn't that cause
xilinx_dma_recover_channel() to free chan->quarantine_list, release the
segment reservations in chan->seg_used, and allow new transfers or
xilinx_dma_free_chan_resources() to free chan->seg_v while the second
hardware reset has not completed?

> +
> +/**
> + * xilinx_dma_recover_channel - Return a withheld channel to service
> + * @chan: Driver specific DMA channel
> + *
> + * Must run after the completion tasklet has been killed, so that no com=
pletion
> + * pass holds a withheld descriptor. Frees the withheld descriptors, whi=
ch
> + * restores their segment links and releases their reservations, and ret=
urns
> + * the channel to idle with no error, so it takes work again. Does nothi=
ng
> + * unless the engine was reset after the channel was withheld.
> + */
> +static void xilinx_dma_recover_channel(struct xilinx_dma_chan *chan)
> +{
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&chan->lock, flags);
> +	if (!chan->quarantined || !chan->quiesced) {
> +		spin_unlock_irqrestore(&chan->lock, flags);
> +		return;
> +	}
> +	xilinx_dma_free_desc_list(chan, &chan->quarantine_list);
> +	chan->quarantined =3D false;
> +	chan->quiesced =3D false;
> +	chan->cyclic =3D false;
> +	chan->err =3D false;
> +	chan->idle =3D true;
> +	chan->desc_pendingcount =3D 0;
> +	chan->desc_submitcount =3D 0;
> +	spin_unlock_irqrestore(&chan->lock, flags);
> +
> +	dev_info(chan->dev, "channel %p recovered\n", chan);
> +}

[Severity: Medium]
Can clearing chan->quarantined =3D false in xilinx_dma_recover_channel()
race with an in-flight xilinx_dma_tx_submit() that dropped chan->lock to
run xilinx_dma_chan_reset()?

In drivers/dma/xilinx/xilinx_dma.c, xilinx_dma_tx_submit() drops
chan->lock around xilinx_dma_chan_reset() and
xilinx_dma_quarantine_controller(), then reacquires chan->lock to check
chan->quarantined:

drivers/dma/xilinx/xilinx_dma.c:xilinx_dma_tx_submit() {
	...
	if (chan->err) {
		spin_unlock_irqrestore(&chan->lock, flags);
		err =3D xilinx_dma_chan_reset(chan);
		if (err < 0) {
			if (chan->xdev->dma_config->dmatype !=3D XDMA_TYPE_AXIDMA)
				return err;
			xilinx_dma_quarantine_controller(chan);
			cookie =3D err;
		}
		spin_lock_irqsave(&chan->lock, flags);
		if (chan->quarantined)
			goto withhold;
	}

	cookie =3D dma_cookie_assign(tx);

	/* Put this transaction onto the tail of the pending queue */
	append_desc_queue(chan, desc);
	...
}

If Thread A's xilinx_dma_chan_reset() fails in xilinx_dma_tx_submit() and
calls xilinx_dma_quarantine_controller(), Thread A's descriptor desc has
not yet been added to chan->quarantine_list while chan->lock is still
dropped.

If Thread B concurrently runs dmaengine_terminate_sync() ->
xilinx_dma_terminate_all() -> xilinx_dma_reset_withheld_channel() and
xilinx_dma_synchronize() -> xilinx_dma_recover_channel() before Thread A
reacquires chan->lock, xilinx_dma_recover_channel() frees
chan->quarantine_list and sets chan->quarantined =3D false.

When Thread A then reacquires chan->lock in xilinx_dma_tx_submit(), it
sees chan->quarantined is false, skips the withhold path, overwrites
cookie =3D err with dma_cookie_assign(tx), and appends desc to
chan->pending_list after dmaengine_terminate_sync() has already completed.
If another descriptor was prepared after recovery, its segments were
reserved at chan->seg_next (after desc's segments), so appending desc
behind it queues AXI DMA ring segments out of ring order; and if desc is
cyclic, the recovery reset also cleared XILINX_DMA_CR_CYCLIC_BD_EN_MASK in
XILINX_DMA_REG_DMACR that xilinx_dma_prep_dma_cyclic() wrote before
submission.

Should xilinx_dma_tx_submit() check whether its own reset attempt failed
rather than relying on chan->quarantined remaining true across the lock
drop?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022-xilinx-dma=
-work-v1-0-20faea2e7a80@nullptr.com?part=3D5
