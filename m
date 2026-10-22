Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792704337;
	b=nAntc3sSjaY7f2WTlWNv+i/rcp4jWwDFQEqbw1EYw6X3JDV0yLtZIvGsM4vb4AIiGHAi
	 QbR++q7ifK3H2Jl5PPGZIT/6622Pq3rGWdHBLldJ65qwVrF5xAZDjFyPnK+4fRgdMvwz+
	 U/DNUu3/b/hTV34OiDSBDDmhzGKaidg05LPnomfRckdldL2nbxzaixLjCcMXjh0kQbduq
	 9zSufJRQQXJKqEPcmQC2r1JcCVP5u/4udU9CyBQQCrbgEezSWJvzbGxzeUutv+N/8oLS7
	 LUmk2CdsTA0MCAYoXuuAEKeRnWmC0n45NequpP0hSKoHFDThWxXfdcZWPXX36DY46NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792704337;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=IuTtdfiZ4oSQCWjE+2u1cfrRS0S+FZFrUwRTVu7vJFw=;
	b=nZTxyF1pzWHsbOGoH3TXzTVyJV+T3XDrG0chOfVA9Vtzt7OSs1Qi3XaPTGoHf8gfcFXx
	 b7ewZss6xqwsmfUlYCxueU3WWjnYHxjTLIKxmAZVgtgSlNKPwjc9w0KdsC6L9axILNC+b
	 2mSPdJq6nZyw1ybofL9G8E2N7IeCjDdAf9gKeGgFv1zng9nkS3YSqDokRSA49ijs1iWPJ
	 UBVtxZWPCAQsR5Wvmqqlev0GCAHg4EoH8SdUn1/ThE7S2V4YsOxMKV7WdwZ6u77KjVqu9
	 GFuvju1mwA3jvNReLxMeYIxUN+bcrS+27ibLh8S6TxZa4LhNmXFBQfn+CQT6+trr1Tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TYfNgqKK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0D2606A31A
	for <dmaengine@vger.kernel.org>; Thu, 22 Oct 2026 21:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TYfNgqKK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2045F1F031E1;
	Thu, 22 Oct 2026 21:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792704337;
	bh=IuTtdfiZ4oSQCWjE+2u1cfrRS0S+FZFrUwRTVu7vJFw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TYfNgqKKibcxTh9XYBZs/Rjttl6pQRAD+exIf3wlbQW1QMRw8FRl6qu7EYXv9ZGvG
	 T232OLVYDlUSgSyqcF4OMCdW10IusX4YiTKb8+5pusCPVrjSWdJKANdXNahfWW42VU
	 kjsxtK/AmBE4uPrl2d+yay5oPQvbyucMPgeXyvq9vSDwnngZc27tvyJE+4PqMJN47b
	 AdQUceUJYw6p+nQWfv/h5EhHqyFVRXneQZ0YHcFynpixYCUilQlw4hKN3+P5wgGuJO
	 TrwHpaF/4DkLJgRIhD3XFEv22Xsfq14/dpzIRo08JC6PItJ+MN02v4btdClz0euuBc
	 NmZNbHxf9n97A==
Message-ID: <sashiko-outbox-182061@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: mediatek: uart: make channel termination
 atomic
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261022-submit-mtk-uart-dma-terminate-atomic-v1-v1-1-aa498ba5da25@gmail.com>
References: <20261022-submit-mtk-uart-dma-terminate-atomic-v1-v1-1-aa498ba5da25@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 21:25:36 +0000
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
- [High] dmaengine: mediatek: dangling c->desc in mtk_uart_apdma_terminate_=
all()
--

commit add32020b23bda4849b015bc2e7b816090491c89
Author: James Hilliard <james.hilliard1@gmail.com>

dmaengine: mediatek: uart: make channel termination atomic

This commit updates mtk_uart_apdma_terminate_all() to serialize hardware
channel termination under c->vc.lock using atomic register polling instead =
of
sleeping polls and synchronize_irq(). It also checks VFF_INT_FLAG in
mtk_uart_apdma_irq_handler() under c->vc.lock in case termination already
acknowledged the interrupt, and aborts descriptor cleanup if stopping the
channel times out.

> diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c b/drivers/dma/mediatek=
/mtk-uart-apdma.c
> index f74e9a3285887..73d4b701ac858 100644
> --- a/drivers/dma/mediatek/mtk-uart-apdma.c
> +++ b/drivers/dma/mediatek/mtk-uart-apdma.c
> @@ -256,6 +256,12 @@ static irqreturn_t mtk_uart_apdma_irq_handler(int ir=
q, void *dev_id)
>  	unsigned long flags;
> =20
>  	spin_lock_irqsave(&c->vc.lock, flags);
> +	/* Termination may have acknowledged an interrupt before we got the loc=
k. */
> +	if (!mtk_uart_apdma_read(c, VFF_INT_FLAG)) {
> +		spin_unlock_irqrestore(&c->vc.lock, flags);
> +		return IRQ_NONE;
> +	}
> +
>  	if (c->dir =3D=3D DMA_DEV_TO_MEM)
>  		mtk_uart_apdma_rx_handler(c);
>  	else if (c->dir =3D=3D DMA_MEM_TO_DEV)
> @@ -400,10 +406,12 @@ static int mtk_uart_apdma_terminate_all(struct dma_=
chan *chan)
>  	LIST_HEAD(head);
>  	int ret;
> =20
> +	spin_lock_irqsave(&c->vc.lock, flags);
> +
>  	mtk_uart_apdma_write(c, VFF_FLUSH, VFF_FLUSH_B);
> =20
> -	ret =3D readx_poll_timeout(readl, c->base + VFF_FLUSH,
> -			  status, status !=3D VFF_FLUSH_B, 10, 100);
> +	ret =3D readx_poll_timeout_atomic(readl, c->base + VFF_FLUSH,
> +					status, status !=3D VFF_FLUSH_B, 10, 100);
>  	if (ret)
>  		dev_err(c->vc.chan.device->dev, "flush: fail, status=3D0x%x\n",
>  			mtk_uart_apdma_read(c, VFF_DEBUG_STATUS));
> @@ -415,11 +423,14 @@ static int mtk_uart_apdma_terminate_all(struct dma_=
chan *chan)
>  	 * 3. set stop as 0
>  	 */
>  	mtk_uart_apdma_write(c, VFF_STOP, VFF_STOP_B);
> -	ret =3D readx_poll_timeout(readl, c->base + VFF_EN,
> -			  status, !status, 10, 100);
> -	if (ret)
> +	ret =3D readx_poll_timeout_atomic(readl, c->base + VFF_EN,
> +					status, !status, 10, 100);
> +	if (ret) {
>  		dev_err(c->vc.chan.device->dev, "stop: fail, status=3D0x%x\n",
>  			mtk_uart_apdma_read(c, VFF_DEBUG_STATUS));
> +		spin_unlock_irqrestore(&c->vc.lock, flags);
> +		return ret;
> +	}
> =20
>  	mtk_uart_apdma_write(c, VFF_STOP, VFF_STOP_CLR_B);
>  	mtk_uart_apdma_write(c, VFF_INT_EN, VFF_INT_EN_CLR_B);
> @@ -429,9 +440,6 @@ static int mtk_uart_apdma_terminate_all(struct dma_ch=
an *chan)
>  	else if (c->dir =3D=3D DMA_MEM_TO_DEV)
>  		mtk_uart_apdma_write(c, VFF_INT_FLAG, VFF_TX_INT_CLR_B);
> =20
> -	synchronize_irq(c->irq);
> -
> -	spin_lock_irqsave(&c->vc.lock, flags);
>  	vchan_get_all_descriptors(&c->vc, &head);
>  	spin_unlock_irqrestore(&c->vc.lock, flags);

[Severity: High]
When mtk_uart_apdma_terminate_all() runs while a transfer is active on the
channel (for example, via dmaengine_terminate_async() from
serial8250_tx_dma_flush() or serial8250_rx_dma_flush()), does c->desc remai=
n a
dangling pointer to freed memory?

When a transfer is started in mtk_uart_apdma_issue_pending(), the active
descriptor remains on c->vc.desc_issued while c->desc points to it:

drivers/dma/mediatek/mtk-uart-apdma.c:mtk_uart_apdma_issue_pending() {
	...
	if (vchan_issue_pending(&c->vc) && !c->desc) {
		vd =3D vchan_next_desc(&c->vc);
		c->desc =3D to_mtk_uart_apdma_desc(&vd->tx);
	...
}

The only place that clears c->desc is mtk_uart_apdma_chan_complete_handler(=
),
called from mtk_uart_apdma_irq_handler():

drivers/dma/mediatek/mtk-uart-apdma.c:mtk_uart_apdma_chan_complete_handler(=
) {
	struct mtk_uart_apdma_desc *d =3D c->desc;

	if (d) {
		list_del(&d->vd.node);
		vchan_cookie_complete(&d->vd);
		c->desc =3D NULL;
	}
}

In mtk_uart_apdma_terminate_all(), VFF_INT_EN and VFF_INT_FLAG are cleared
under c->vc.lock (so any pending mtk_uart_apdma_irq_handler() sees
!mtk_uart_apdma_read(c, VFF_INT_FLAG) and returns IRQ_NONE early), and
vchan_get_all_descriptors(&c->vc, &head) splices c->vc.desc_issued into head
before vchan_dma_desc_free_list(&c->vc, &head) frees the descriptor.

Because c->desc is not cleared during termination, subsequent calls to
mtk_uart_apdma_issue_pending() will see a non-NULL c->desc and refuse to st=
art
any new transfers on the channel, and any later interrupt on the channel wo=
uld
dereference the freed descriptor in mtk_uart_apdma_rx_handler() and
mtk_uart_apdma_chan_complete_handler().

Should mtk_uart_apdma_terminate_all() also set c->desc =3D NULL while holdi=
ng
c->vc.lock?

> =20
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022-submit-mtk=
-uart-dma-terminate-atomic-v1-v1-1-aa498ba5da25@gmail.com?part=3D1
