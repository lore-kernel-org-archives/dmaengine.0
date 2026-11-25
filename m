Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795625446;
	b=M6yn0hUNxIT/TJFGTXbVG55ihcE/3pvsU5gD40WR/ETlzMYq/iO4dpzjH5qGD4tJoOif
	 Gix1W+l7qik0MTbjExaXG6cVOuepfZSAHabA/2yIbSP7ZWeGmIgBXwPN+99y1dn/jcC+r
	 yS8QR4LZZWqyvm9yo57pdqhBZ60KB0MQqUS6gU7zcG7h4SGrsqWQMK1szV1zGvj67jV+A
	 EcB3SqW5ZLEpAYn+TdjyvoQDYZ9UKCXKadlfD/Bony3WcgriCgfn4iMvwFHpi+QpITOBj
	 a3NjEAGD6zUxzpFw4B4dH8+3KPqu//AloGsYTNAXgsKCF1M+v8rrWL2gR35ZVAuZPlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795625446;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=65XtBmLJdfWQJvR6eUuDDRlIAGtJpIhJNiA7jG2qSls=;
	b=oSiRqdgwbfL/0/HQGx4bLaNnQHvOkncYzvRi+icK+j2RzJTzVXDiY9e0GBWw8JGlJ9+u
	 chSoFZosgL8TLLeYBj3uOEvgIuY0DMPmc4NcnWGE+DXK/lCQSCYx140wgNXnii6JEIkiC
	 LQiAYrORNwbZUehfiGJctONuUljllo/TzqOlurVQufr2tkoUPsWQdoF4HZyeCLc1Wz3hL
	 Jen0YHiURVvMg53WpYHNblp3hJ0rqb1wHOME7jOfRVaCSIYmHlPPL5HjNPtI9JxWVXuJ+
	 5oyolblv9klgWUYEQDLtCKERLmL8UhDZK9rRGOZXyc0FJrM3waRtvIpV5DZukD8l3XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PL+mTTcT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FC5606A321
	for <dmaengine@vger.kernel.org>; Wed, 25 Nov 2026 16:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PL+mTTcT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3C801F000ED;
	Wed, 25 Nov 2026 16:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795625445;
	bh=65XtBmLJdfWQJvR6eUuDDRlIAGtJpIhJNiA7jG2qSls=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PL+mTTcTTL0CKMEk6BvwhTvC5ejsLBLzLq4pD7M2zQMNxMcG6UiztP5hGcvNVdEPM
	 bVqe3Ri6rD93ieRcV0ZWoGeAKRchyagtExr8QJMoflk+31vb/mN5gWlRS61uX2RaFJ
	 Cq+q64IK91Pmi/5ey0nM6i73woa69yuxLq76+EXK7ZcnpRALudUIAgeww0TIFsFpDq
	 Gdxi2YDBV52EwqV2FNz+b63rB//OQ9ih2V7N8EYO2WWzNFodxI/l9iIYVbvvESWhAZ
	 FGxejmCrYI8coIQ2n3sRZrDHrRyyJt50ZoNWtmuMF92qsZPCrd0srVc+rMzOL8e4J1
	 SfTFpYokg/WaA==
Message-ID: <sashiko-outbox-233780@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] spi: omap2-mcspi: skip the TX drain wait in duplex
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Klotzbuecher" <mk@mkio.de>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261125162045.1222271-1-mk@mkio.de>
References: <20261125162045.1222271-1-mk@mkio.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 16:50:45 +0000
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
- [Medium] spi: omap2-mcspi: broken non-FIFO DMA handling in
  omap2_mcspi_tx_duplex()
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [High] spi: omap2-mcspi: race condition in omap2_mcspi_set_dma_req()
  [1]
--

commit be820d0974cd0a480f2639f996cc447a021feacc
Author: Markus Klotzbuecher <mk@mkio.de>

spi: omap2-mcspi: skip the TX drain wait in duplex

This commit skips DMA_PREP_INTERRUPT and the TX completion wait for host
full-duplex DMA transfers, clearing the TX DMA request after RX DMA
completes instead of in the TX callback.

Link: https://lore.kernel.org/r/20220822091531.27827-1-vaishnav.a@ti.com [1]

> diff --git a/drivers/spi/spi-omap2-mcspi.c b/drivers/spi/spi-omap2-mcspi.c
> index 061d50c65dfd0..1eaa86c8d892e 100644
> --- a/drivers/spi/spi-omap2-mcspi.c
> +++ b/drivers/spi/spi-omap2-mcspi.c
> @@ -413,6 +413,18 @@ static void omap2_mcspi_tx_callback(void *data)
>  	complete(&mcspi_dma->dma_tx_completion);
>  }
> =20
> +/*
> + * In host full duplex the RX completion proves that every TX word was
> + * shifted out, so TX needs neither a callback nor k3-udma's peer drain
> + * check, which it defers to a kworker.
> + */
> +static bool omap2_mcspi_tx_duplex(struct spi_device *spi,
> +				  struct spi_transfer *xfer)
> +{
> +	return xfer->tx_buf && xfer->rx_buf &&
> +	       !spi_controller_is_target(spi->controller);
> +}

[Severity: Medium]
Should omap2_mcspi_tx_duplex() also require mcspi->fifo_depth > 0?

When the transfer exceeds OMAP2_MCSPI_MAX_FIFOWCNT on controllers with
max_xfer_len =3D=3D 0, omap2_mcspi_set_fifo() disables the FIFO and sets
mcspi->fifo_depth =3D 0.  In that mode, omap2_mcspi_rx_dma() only transfers
elements - 1 words via DMA, disables the channel after dma_rx_completion,
polls OMAP2_MCSPI_CHSTAT_RXS for the last word, and re-enables the channel:

drivers/spi/spi-omap2-mcspi.c:omap2_mcspi_rx_dma() {
	...
	omap2_mcspi_set_enable(spi, 0);

	elements =3D word_count - 1;

	if (!mcspi_wait_for_reg_bit(chstat_reg, OMAP2_MCSPI_CHSTAT_RXS)) {
		...
	} else {
		dev_err(&spi->dev, "DMA RX last word empty\n");
		*count -=3D mcspi_bytes_per_word(word_len);
	}
	omap2_mcspi_set_enable(spi, 1);
	return 0;
}

Without omap2_mcspi_tx_callback() clearing OMAP2_MCSPI_CHCONF_DMAW when
the last TX word is written, omap2_mcspi_rx_dma() re-enables the channel
while DMAW is still set and TX0 is empty, asserting a spurious TX DMA
request before omap2_mcspi_txrx_dma() clears DMAW.

In addition, if the last word has not shifted out when
omap2_mcspi_rx_dma() disables the channel after elements - 1 RX words, the
RXS poll times out, decrements *count, and returns 0.
omap2_mcspi_txrx_dma() then returns 0 without waiting for
dma_tx_completion or calling dmaengine_terminate_sync(mcspi_dma->dma_tx),
and omap2_mcspi_transfer_one() returns -EIO on count !=3D t->len, allowing
the SPI core to unmap xfer->tx_sg while the TX DMA channel is still active.

[ ... ]

> @@ -672,6 +689,8 @@ static int omap2_mcspi_txrx_dma(struct spi_device *sp=
i,
>  					 &rx_submitted, &dma_started);
>  		if (ret)
>  			goto out;
> +		if (omap2_mcspi_tx_duplex(spi, xfer))
> +			omap2_mcspi_set_dma_req(spi, 0, 0);

[Severity: High]
This problem wasn't introduced by this patch, but nothing serializes
[1] the read-modify-write of the cached CHCONF0 register in
omap2_mcspi_set_dma_req() when RX and TX DMA completion callbacks run
concurrently on target full-duplex transfers:

CPU0                                  CPU1
omap2_mcspi_rx_callback()             omap2_mcspi_tx_callback()
  omap2_mcspi_set_dma_req(..., 1, 0)    omap2_mcspi_set_dma_req(..., 0, 0)
    l =3D mcspi_cached_chconf0(spi);
                                          l =3D mcspi_cached_chconf0(spi);
    l &=3D ~OMAP2_MCSPI_CHCONF_DMAR;
                                          l &=3D ~OMAP2_MCSPI_CHCONF_DMAW;
    mcspi_write_chconf0(spi, l);
                                          mcspi_write_chconf0(spi, l);
                                            <-- overwrites DMAR clear

Can this lost update leave OMAP2_MCSPI_CHCONF_DMAR or
OMAP2_MCSPI_CHCONF_DMAW enabled in CHCONF0 and hang subsequent DMA
transfers?

[1] https://sashiko.dev/#/bug/linux-53ef0b8a-76a9-4654-bac2-e99f1ecedc21

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125162045.1222=
271-1-mk@mkio.de?part=3D1
