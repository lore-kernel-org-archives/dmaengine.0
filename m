Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793007318;
	b=SkmFMGA44+uP5XWW+bRFEnF+4ZCcsDrIs6tKaxpJHTpZBI6geDaGjpdPaLnF+k6Unr+5
	 wlBPfg34H7hdIYrkwj+qbomOlFpUQIDtD5XyrHd9ZEw/S81gOuOdlK5+aUY1T4Y0fy1RO
	 748itf4oGUNxUIDSmMsJ47kx+2RSW09vwlG+BdKSWKeyOq5aE8tukfDuqyAkjBFDa0kL+
	 UexErIy+1vq7kjYucUXdf5YxwRwuAxPIIA6cj/KwfVF8CxLUbAnJgfVmKv6LhwxOo6cWW
	 fE2S6kg8YsyJ0XtzHmINcd5eojAQcGPI1VwPuYUyq31PyWlAAiK+/BWQhDojbVmefGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793007318;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=rpp4HFvsGszK3nn9DAg/ahaYBPyTpKxkYeTqN5cOCXA=;
	b=p5Sl79X5awRTThTQH/o/bpaCoC5WI+K9XLsUDahP79k/23GVNq12FjhOJipwMFUaOZbj
	 QUv63vpL5wmLI9IC0gV/20ntfTWQaPRXqBC62ijuBNynqz1fZqcxva4JX6nGjOIAergcP
	 0FxRxxDRB81mxbMI7DS+YLQndTCT/52SLthA4/0kUZDbwoIpMsXO8afR1CJi7xgzjx5op
	 fu9Ke0qCbAjqTAZDIuKALuYjV7kluCtEWci3scPU1C89SwIYjJZFq1sx8DUng6Et5kwLA
	 9hwZ+0XEwbxMLovPgvRdAx7O69RSwBq3joI641O5kSVOhY2LUvxf4iTm6GEO0N35o1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wi+KmTm4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4AB606A320;
	Mon, 26 Oct 2026 09:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wi+KmTm4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E90D1F01828;
	Mon, 26 Oct 2026 09:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793007318;
	bh=rpp4HFvsGszK3nn9DAg/ahaYBPyTpKxkYeTqN5cOCXA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Wi+KmTm46KStbEwCJOaZjGsR1xvQb8MSCSeG6Pfjr0EOwdEBJPanGCoNbMnb36mM+
	 ijh8dlHR3BR1VH0F463j3QgDagiPnJI66Zp576bUU9vKb0TLsAOEy8+rrYo+ridpuU
	 i6PASCSzbNQu0LABICiKnMFTCkY9IgIu0J8QBeWtKSzwlTYxFK+8zeJGf66X6uqwPj
	 xVMg5C0pDng/YfdEGrvUki+ZnnOTg5MpHhGE6eoo3iXj44OLpjy+xuVokL7m9FcWx9
	 valkKnTFN+Cc3lb/DNXaO3VPUcz/HCKqjUBrw8uQ+slinh/Ut3ZYHU/WUTmMwNx5iZ
	 yvSxrB2vK1vWQ==
Message-ID: <sashiko-outbox-184805@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] dmaengine: loongson: loongson2-apb-cmc-dma: Add
 pause/resume support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Binbin Zhou" <zhoubinbin@loongson.cn>, dmaengine@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <92800ae186112366116647ee4f50d4ba09249ef8.1792988985.git.zhoubinbin@loongson.cn>
References: <cover.1792988985.git.zhoubinbin@loongson.cn>
 <92800ae186112366116647ee4f50d4ba09249ef8.1792988985.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 09:35:17 +0000
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
- [Medium] dmaengine: loongson: loongson2_cmc_dma_start_transfer() clears p=
ause state
- [Medium] dmaengine: loongson: loongson2_cmc_dma_tx_status() ignores pause=
 if !state
--

commit 8e161a43d78d90e76eaddc39b1b96c7a28b1dd6c
Author: Binbin Zhou <zhoubinbin@loongson.cn>

dmaengine: loongson: loongson2-apb-cmc-dma: Add pause/resume support

This commit adds pause and resume support to the Loongson-2 APB CMC DMA
driver by clearing and restoring LOONGSON2_CMCDMA_CCR_EN while preserving
the hardware transfer position. It also updates status reporting and
cyclic scatterlist advancement to honor the paused state.

> diff --git a/drivers/dma/loongson/loongson2-apb-cmc-dma.c b/drivers/dma/l=
oongson/loongson2-apb-cmc-dma.c
> index c654e05729024..a4153ea854623 100644
> --- a/drivers/dma/loongson/loongson2-apb-cmc-dma.c
> +++ b/drivers/dma/loongson/loongson2-apb-cmc-dma.c

[ ... ]

> @@ -184,6 +185,8 @@ static void loongson2_cmc_dma_stop(struct loongson2_c=
mc_dma_chan *lchan)
>  	loongson2_cmc_dma_write(lddev, LOONGSON2_CMCDMA_CCR, lchan->id, ccr);
> =20
>  	loongson2_cmc_dma_irq_clear(lchan, LOONGSON2_CMCDMA_MASKI);
> +
> +	lchan->paused =3D false;
>  }

[Severity: Medium]
Can this reset lchan->paused and restart DMA when a segment completion
interrupt races with loongson2_cmc_dma_pause() on a non-cyclic transfer?

loongson2_cmc_dma_pause() allows pausing any channel with an active
lchan->desc, including non-cyclic slave_sg transfers. If a scatterlist
segment finishes and latches LOONGSON2_CMCDMA_TCI just before
loongson2_cmc_dma_pause() acquires lchan->vchan.lock and sets
lchan->paused =3D true, the interrupt handler will subsequently run:

  loongson2_cmc_dma_chan_irq()
    -> loongson2_cmc_dma_handle_chan_done()
      -> loongson2_cmc_dma_start_transfer()

Unlike the cyclic path in loongson2_cmc_dma_configure_next_sg(), the
non-cyclic path in loongson2_cmc_dma_handle_chan_done() calls
loongson2_cmc_dma_start_transfer():

	loongson2_cmc_dma_stop(lchan);
	...
	/* Start DMA */
	reg->ccr |=3D LOONGSON2_CMCDMA_CCR_EN;
	loongson2_cmc_dma_write(lddev, LOONGSON2_CMCDMA_CCR, lchan->id, reg->ccr);

This clears lchan->paused =3D false in loongson2_cmc_dma_stop() and
unconditionally sets LOONGSON2_CMCDMA_CCR_EN for the next scatterlist
entry or next queued descriptor. Should non-cyclic scatterlist
advancement also preserve lchan->paused and avoid re-enabling the channel
while paused?

[ ... ]

> @@ -534,6 +545,13 @@ static enum dma_status loongson2_cmc_dma_tx_status(s=
truct dma_chan *chan, dma_co
>  			/* Active descriptor: compute residue from hardware progress */
>  			state->residue =3D loongson2_cmc_dma_desc_residue(lchan, lchan->desc,
>  									lchan->next_sg);
> +			/*
> +			 * A paused channel still has an active descriptor but is not making
> +			 * progress. Report DMA_PAUSED so clients can distinguish it from a
> +			 * running transfer.
> +			 */
> +			if (lchan->paused && status =3D=3D DMA_IN_PROGRESS)
> +				status =3D DMA_PAUSED;
>  		} else if (vdesc) {
>  			/* Queued descriptor not yet started: residue is the total length */
>  			struct loongson2_cmc_dma_desc *ldesc =3D to_lmdma_desc(vdesc);

[Severity: Medium]
What happens if a client queries transfer status on a paused channel with
a NULL state pointer, such as via dmaengine_tx_status(chan, cookie, NULL)
or dma_async_is_tx_complete()?

Earlier in loongson2_cmc_dma_tx_status():

	status =3D dma_cookie_status(chan, cookie, state);
	if (status =3D=3D DMA_COMPLETE || !state)
		return status;

When state is NULL, loongson2_cmc_dma_tx_status() returns early before
acquiring lchan->vchan.lock and checking lchan->paused, so it will return
DMA_IN_PROGRESS instead of DMA_PAUSED for the active paused descriptor.
Should the lchan->paused check still be performed when state is NULL?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1792988985.gi=
t.zhoubinbin@loongson.cn?part=3D4
