Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446522;
	b=BZZvkSNBCmJvdMDLWHNYlf0LEjRQuLOifecaAPEmwnAOkl5BCeJ6x7YjC04uIc2bBA/D
	 j4AA7kjOd62MhPPLnvsDhuto4gkCq/5YzpiuoyMfvkDlgWPyBPUDU7YaoY38zCkU/eMlm
	 PV+b04T8HUJZBGy3MvJQefICD3Ks0rhrsHQlvCkLV3yo5DNMbsXVFnvebObDJbK6wI74f
	 hQvk1J91xxNh5iMOouaL+Sg7X9M15HetZ3h6U64hFO2XDiqJYkOr+yYJ6tlprh8JSqjO6
	 9L20fdtICajGB+iYKBivRyJ+UYXRhCldy0nIhrtTJKhKMR4s5Rn5rUI7mBsdE/o/UNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446522;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=cBnjnfPrI5GqXOR0gLmz+atrHWpsioGJfdWD9aN4KPs=;
	b=ddwRHEL09cRXYK9eSD7oxFUrU0BWRa29RlpAWpiH158nk4PNqLrJqaxDztsA99kLwky+
	 PFClIaGzoH9Ix1zXtSQFGvMl2GheBdCJZCOQcrGcDxf4+7r/Zp6diItFyqvZTL5EiYW2x
	 /111+Rbr8pUdtoXABeNxUPtuVv7OViNJXhQ+AeddJ4WjiolAMrYQ85wOYcmWNYFBvBf9o
	 WJsd3FObSbpRMceb5Tk3XYqFKsqIXVwmhlySUQyUxKqbKNrLlcXtFV/nr3RJ4VTg22nKP
	 TRzWi/AyE65DB0LcGm4TSJ5ZGAqzjQXrOgxXTLgv1uPnNuMKCIHTX7BdMMAJhqfrKyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kzg52ZXu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3577606A31F;
	Mon, 23 Nov 2026 15:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kzg52ZXu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAC4D1F000C0;
	Mon, 23 Nov 2026 15:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795446521;
	bh=cBnjnfPrI5GqXOR0gLmz+atrHWpsioGJfdWD9aN4KPs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kzg52ZXum6sSfq9YhB5+hMGcLkHSK2PSxOUBiSSkYqvjZTOenX1UTFQeOutdwLRVc
	 PQf1AzoNq1uD60e/uAxuUuc67HkW1sGU9Jn4dZFSNE5+mSqCBPI6hkB9sHn639Ekml
	 bJIxjqkSBCR5pQF4BSxl4V9fafIG0iq6uVtZZSaUD/TlAqYotlIOAnI/AtUltZHf22
	 DfrEW5mEfRcSOX3JzdB5yIHasjwP3D5U+54W62AKt/AUJZLTqsztrwL2WnHhg2S7Ys
	 1BlNvLWNJfFJzty0nK/TCDT5wcx7Rbw218sVjurpeZbp9IeTPUCFBas80XkY5WT4Hf
	 uAcAkS9jjCDZA==
Message-ID: <sashiko-outbox-229497@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 05/28] dmaengine: bcm2835: Fixes for dma_abort
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrea della Porta" <andrea.porta@suse.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261123145728.29082-6-andrea.porta@suse.com>
References: <20261123145728.29082-1-andrea.porta@suse.com>
 <20261123145728.29082-6-andrea.porta@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 15:08:40 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] dmaengine: bcm2835: broken NEXTCB abort and write drain in
  bcm2835_dma_abort()
--

commit a058188488f658c2a3df2427a8957114d4f32435
Author: Dom Cobley <popcornmix@gmail.com>

dmaengine: bcm2835: Fixes for dma_abort

This commit updates bcm2835_dma_abort() to clear BCM2835_DMA_NEXTCB,
issue BCM2835_DMA_ABORT with a shorter poll timeout, and suppress the
timeout error message when DREQ pacing is enabled.

> diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
> index 063e1b2aabe3c..51e3a40dbaece 100644
> --- a/drivers/dma/bcm2835-dma.c
> +++ b/drivers/dma/bcm2835-dma.c
> @@ -419,7 +419,7 @@ static void bcm2835_dma_fill_cb_chain_with_sg(
>  static void bcm2835_dma_abort(struct bcm2835_chan *c)
>  {
>  	void __iomem *chan_base =3D c->chan_base;
> -	long timeout =3D 10000;
> +	long timeout =3D 100;
> =20
>  	/*
>  	 * A zero control block address means the channel is idle.
> @@ -428,19 +428,33 @@ static void bcm2835_dma_abort(struct bcm2835_chan *=
c)
>  	if (!readl(chan_base + BCM2835_DMA_ADDR))
>  		return;
> =20
> -	/* Write 0 to the active bit - Pause the DMA */
> -	writel(0, chan_base + BCM2835_DMA_CS);
> +	/* We need to clear the next DMA block pending */
> +	writel(0, chan_base + BCM2835_DMA_NEXTCB);
> +
> +	/* Abort the DMA, which needs to be enabled to complete */
> +	writel(readl(chan_base + BCM2835_DMA_CS) | BCM2835_DMA_ABORT | BCM2835_=
DMA_ACTIVE,
> +	       chan_base + BCM2835_DMA_CS);
> =20
> -	/* Wait for any current AXI transfer to complete */
> -	while ((readl(chan_base + BCM2835_DMA_CS) &
> -		BCM2835_DMA_WAITING_FOR_WRITES) && --timeout)
> +	/* wait for DMA to be aborted */
> +	while ((readl(chan_base + BCM2835_DMA_CS) & BCM2835_DMA_ABORT) && --tim=
eout)
>  		cpu_relax();
> =20
> -	/* Peripheral might be stuck and fail to signal AXI write responses */
> -	if (!timeout)
> +	/* Write 0 to the active bit - Pause the DMA */
> +	writel(readl(chan_base + BCM2835_DMA_CS) & ~BCM2835_DMA_ACTIVE,
> +	       chan_base + BCM2835_DMA_CS);
> +
> +	/*
> +	 * Peripheral might be stuck and fail to complete
> +	 * This is expected when dreqs are enabled but not asserted
> +	 * so only report error in non dreq case
> +	 */
> +	if (!timeout && !(readl(chan_base + BCM2835_DMA_TI) &
> +	   (BCM2835_DMA_S_DREQ | BCM2835_DMA_D_DREQ)))
>  		dev_err(c->vc.chan.device->dev,
> -			"failed to complete outstanding writes\n");
> +			"failed to complete pause on dma %d (CS:%08x)\n", c->ch,
> +			readl(chan_base + BCM2835_DMA_CS));
> =20
> +	/* Set CS back to default state and reset the DMA */
>  	writel(BCM2835_DMA_RESET, chan_base + BCM2835_DMA_CS);
>  }

[Severity: High]
Does this reintroduce the abort regressions fixed by commit 9e528c799d17
("dmaengine: bcm2835: Fix abort of transactions")?

Commit 9e528c799d17 replaced this BCM2835_DMA_NEXTCB and
BCM2835_DMA_ABORT sequence with pausing the channel, waiting for
BCM2835_DMA_WAITING_FOR_WRITES to clear, and asserting BCM2835_DMA_RESET.
When a channel is blocked on an unasserted DREQ, no AXI write is in
flight, so BCM2835_DMA_WAITING_FOR_WRITES is already clear and the
existing pause-and-reset path completes immediately without timing out.

Reverting to BCM2835_DMA_ABORT introduces three problems:

1. BCM2835_DMA_NEXTCB is written while BCM2835_DMA_ACTIVE is still set,
which per the BCM2835 ARM Peripherals specification is only safe when the
channel is paused; racing with control block completion can cause
BCM2835_DMA_ABORT to abort only the current control block and start the
next one.

2. After clearing BCM2835_DMA_ACTIVE, the code writes BCM2835_DMA_RESET
without waiting for BCM2835_DMA_WAITING_FOR_WRITES to clear, so
bcm2835_dma_terminate_all() can reset the channel and free descriptors
while AXI writes are still in flight.

3. Because BCM2835_DMA_ABORT never completes while a channel is held on
an unasserted DREQ, every termination of a DREQ-blocked channel (such as
dmaengine_terminate_async() on the companion channel at the end of
one-way transfers in bcm2835_spi_dma_rx_done() and
bcm2835_spi_dma_tx_done()) now busy-waits for the full 100-iteration
(~20 us) timeout with interrupts disabled under c->vc.lock.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123145728.2908=
2-1-andrea.porta@suse.com?part=3D5
