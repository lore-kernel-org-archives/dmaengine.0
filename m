Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794201445;
	b=qdqnCQ6vJ3z+Q8aM7y6mgbPqZAReL4TgkdpAjlyjccG7KImy0xRC9F9nlicQg0pGP4B5
	 E8ZmTRf+yc7YY8Y5qFj2O/ayk4yL5GfAa8Tb8f7CN/syBEGPi7y5uxWmgGHxat+NDnuVO
	 GiWLpmQLi92Nx6FdFu+FDmas2+/rnj4jFO+6hzPkNZ8AC+jdoR4G6aWoOwNQiN38DPDOD
	 RbbJT3kU7PSElfyrrxURBckI52foe0F/lhnla2agj/qiLO51gor0IYGNdfHX4kH1hBtFL
	 ArdRL9oL7Ys42kYBnN9JYSvDyZqHpyfaNZN7EcmRPu43O/JzG/cQUiKcs5EAYRaoV/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794201445;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=sftVWz01ak+2ek/WT5EVoxI3nhj5QJpKZ+pSguV/fHc=;
	b=OcVAgDIsxrXG/aSFYidsNkD2WzjfssUo8uVfQRidhznlL1lImcrhrjd+Wr81sKGOhl8s
	 +xmMqofRwwdFME/xDHKrzDkmG1BZdGED4s+gk/sdfXU3fVv7OtVibcidpnwtgHj5shh3Q
	 +kGLWMxbKUqrUv34v/Kjwb20a2au+o1cOPyN1ohlHVy+V+LGlNIdpJedVVQdp8T1m1CZ3
	 ImpzKVL3EK+VW/D0TEQA4lxLW0YzgA2U/GCkjJpy5fYdMvOqOA9sN4jyEmkmp24ki6o5i
	 75uFf5emCJZ6s0jL5N3D0I5qRW/+qPppsrR0yrlo6yx9A7NL0zPIZ6JnbqUCmkNtI5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WwowoOqs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BDF606A321
	for <dmaengine@vger.kernel.org>; Mon,  9 Nov 2026 05:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WwowoOqs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9B301F0089F;
	Mon,  9 Nov 2026 05:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794201445;
	bh=sftVWz01ak+2ek/WT5EVoxI3nhj5QJpKZ+pSguV/fHc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WwowoOqsywmDfUqjAWcSe7eKJcGZQYUvmihjfZmajUoUc8tHUBQVEWfwwIIXxkXOd
	 y+K/X17iT4HwVpv2lhimkUiz2fwTZzT4nyVU2znRCt/3VWpBJztP/qbVYQSeU+OyDp
	 Y9EvvTo0acFbt7WMwecKrVPr5ADKoW3iETwMUq4n8nkbfNNbLXE6pTf+glj5Swhzps
	 u+xRBAIB748Fqh0Ml4exHu25SGO0CPQmer+ykR+2SKb0T5UVNjjlHfrsJ0JoTewxMy
	 mWJfsaBT162ksMTb93r4uoWw91C7LexeKAZXlt6nBGQduA3ASTrQD8G9is/V5q+q1o
	 uBL1hujQwjlDg==
Message-ID: <sashiko-outbox-204425@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] dmaengine: dw-axi-dmac: preserve suspension status
 until pause observes it
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261108-submit-dw-axi-dma-stop-pause-v1-v1-3-c48ec19e9ee4@gmail.com>
References: <20261108-submit-dw-axi-dma-stop-pause-v1-v1-0-c48ec19e9ee4@gmail.com>
 <20261108-submit-dw-axi-dma-stop-pause-v1-v1-3-c48ec19e9ee4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 05:17:24 +0000
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
- [High] dmaengine: dw-axi-dmac: hardware suspend bit left set when
  is_paused is false
- [High] dmaengine: dw-axi-dmac: axi_chan_enable() clobbers pause state
  in cyclic mode
--

commit 225811462c3128b58ce5d32c533d4264178f3cdc
Author: James Hilliard <james.hilliard1@gmail.com>

dmaengine: dw-axi-dmac: preserve suspension status until pause observes it

This commit preserves the DWAXIDMAC_IRQ_SUSPENDED status bit across the
interrupt handler and failed pause polls so dma_chan_pause() only clears
the status and sets chan->is_paused after observing the hardware
acknowledgment, while resetting both in axi_chan_enable() and
dma_chan_terminate_all().

> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma=
/dw-axi-dmac/dw-axi-dmac-platform.c
> index de092f190528a..33340f0e7462a 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> @@ -226,6 +226,9 @@ static inline void axi_chan_enable(struct axi_dma_cha=
n *chan)
>  {
>  	u64 val;
> =20
> +	axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
> +	chan->is_paused =3D false;
> +
>  	if (chan->chip->dw->hdata->nr_channels >=3D DMAC_CHAN_16) {
>  		val =3D axi_dma_ioread64(chan->chip, DMAC_CHEN);
>  		if (chan->id >=3D DMAC_CHAN_16) {

[Severity: High]
Can axi_chan_block_xfer_complete() clobber chan->is_paused and
DWAXIDMAC_IRQ_SUSPENDED on a cyclic channel by calling axi_chan_enable()?

In cyclic mode each segment has CH_CTL_H_LLI_LAST set, so segment
completion raises DWAXIDMAC_IRQ_DMA_TRF and calls axi_chan_enable() to
start the next segment:

drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:axi_chan_block_xfer_complete=
() {
	...
	if (chan->cyclic) {
		desc =3D vd_to_axi_desc(vd);
		if (desc) {
			...
			axi_chan_enable(chan);
		}
	}
}

Because dw_axi_dma_interrupt() reads CH_INTSTATUS before
axi_chan_block_xfer_complete() takes chan->vc.lock, dma_chan_pause() can
run in between:

CPU0                              CPU1
dw_axi_dma_interrupt()
  status =3D axi_chan_irq_read(chan)
                                  dma_chan_pause()
                                    lock(&chan->vc.lock)
                                    /* sets suspend bit in HW */
                                    chan->is_paused =3D true;
                                    unlock(&chan->vc.lock)
  axi_chan_block_xfer_complete()
    lock(&chan->vc.lock)
    axi_chan_enable(chan)
      axi_chan_irq_clear(..., DWAXIDMAC_IRQ_SUSPENDED);
      chan->is_paused =3D false;    <-- clobbers pause state

When axi_chan_enable() clears chan->is_paused while the hardware suspend
bit remains asserted in DMAC_CHSUSPREG or DMAC_CHEN, a later
dma_chan_resume() sees chan->is_paused =3D=3D false and skips
axi_chan_resume(), leaving the cyclic channel permanently suspended in
hardware.  If dma_chan_pause() instead timed out on CPU1,
axi_chan_enable() also clears the late DWAXIDMAC_IRQ_SUSPENDED
acknowledgment that a retry would look for.

[ ... ]

> @@ -1206,6 +1211,8 @@ static int dma_chan_terminate_all(struct dma_chan *=
dchan)
> =20
>  	vchan_get_all_descriptors(&chan->vc, &head);
> =20
> +	axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
> +	chan->is_paused =3D false;
>  	chan->cyclic =3D false;
>  	spin_unlock_irqrestore(&chan->vc.lock, flags);
> =20
> @@ -1225,6 +1232,9 @@ static int dma_chan_pause(struct dma_chan *dchan)
> =20
>  	spin_lock_irqsave(&chan->vc.lock, flags);
> =20
> +	if (chan->is_paused)
> +		goto out;
> +
>  	if (chan->chip->dw->hdata->nr_channels >=3D DMAC_CHAN_16) {
>  		val =3D axi_dma_ioread64(chan->chip, DMAC_CHSUSPREG);
>  		if (chan->id >=3D DMAC_CHAN_16) {
> @@ -1258,10 +1268,12 @@ static int dma_chan_pause(struct dma_chan *dchan)
>  		udelay(2);
>  	} while (--timeout);
> =20
> -	axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
> -
> -	chan->is_paused =3D true;
> +	if (timeout) {
> +		axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
> +		chan->is_paused =3D true;
> +	}
> =20
> +out:
>  	spin_unlock_irqrestore(&chan->vc.lock, flags);
> =20
>  	return timeout ? 0 : -EAGAIN;

[Severity: High]
Does leaving chan->is_paused false when dma_chan_pause() times out, or
clearing chan->is_paused in dma_chan_terminate_all() and axi_chan_enable(),
leave the hardware channel suspend bit set with no way for
dma_chan_resume() to clear it?

dma_chan_pause() asserts the channel suspend bit in DMAC_CHSUSPREG or
DMAC_CHEN before polling CH_INTSTATUS, and only axi_chan_resume() clears
that bit:

drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:dma_chan_resume() {
	...
	if (chan->is_paused)
		axi_chan_resume(chan);
	...
}

When the poll in dma_chan_pause() times out, DMAC_CHSUSPREG / DMAC_CHEN
still has the suspend bit set, so the hardware suspends the channel once
the current burst completes, yet chan->is_paused remains false.  Callers
that do not retry dmaengine_pause() before calling dmaengine_resume() (or
that terminate and reuse a paused channel, since neither
dma_chan_terminate_all() nor axi_chan_enable() clears the suspend bit in
DMAC_CHSUSPREG / DMAC_CHEN) will never run axi_chan_resume(), leaving the
channel permanently suspended in hardware.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108-submit-dw-=
axi-dma-stop-pause-v1-v1-0-c48ec19e9ee4@gmail.com?part=3D3
