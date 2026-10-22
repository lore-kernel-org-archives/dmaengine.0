Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792704897;
	b=LWa3uVp6FAzMBYiiP2kmQHTn+sKQ2/4c1YTA1J0txYQKqWogITcnnA+mzdyNIa32p+ev
	 JcnxljyslRBJFJ9mIpA2r8PWoxuiAFJ+DjwdfgBQcHnYJpUekw8Y5mCQ6mvuOHwKQk9mh
	 N9lWNM5iGxLXtyP3LwyeGtLkiOMs+rf94w3r/OY/DBOvnnKw1vnDDSpEyqLuh4gwaK+F+
	 2zv0/SeN0THvPI1DwBJE2vzSTY+3knFlnU8pS1V2G7y2nSHYXIMtW3osqzosiZbLUohuR
	 IcV/XSx7Ve1buAQ3ngO79vOC9VPmLDz41sJ2AMWbDbHOlt4nl5UFDhXAk0ClHanZZVA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792704897;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=LA0xVzv55vv90cseImuUZu6G5SXRivgPxKWoy9yziNo=;
	b=CSjUfbQwzdRw1zheXioWnXY/0UOWqU+mSts3lVBF8MTaSONpEqvY9iY9v9MWfs45Al3w
	 Raai88HrIJ148hZSFUM34szq8shK8vF1ORH2ahHbW5baCA/dGWNgKU4OHa5QYrUAOBWo/
	 mEFogNs9t97nQoEjRxkLZSdnG5szneSD57OrOwXIjL8que9mi2u30WBIX8fE5mlfCZpV9
	 8unyj1FF9UfWND/IqIFe2hGXBgBaxRGDNNwaJiMit2N7Q34PWlqFFBv2q4EHYx/sLJQRX
	 90nvW2wgw8aEqPUaBaCwXUA5r+DeAAObgEn/AxmR7X4TCAVXcPJvBaKMFh/eJHLEhwQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CcwLQnE1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.53
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7748C606A31A
	for <dmaengine@vger.kernel.org>; Thu, 22 Oct 2026 21:34:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7748C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CcwLQnE1
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-7cc0892f92cso119834137.3
        for <dmaengine@vger.kernel.org>; Thu, 22 Oct 2026 14:34:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792704896; cv=none;
        d=google.com; s=arc-20260327;
        b=Mj9NWMrDDmyYlBlvmxjMMeQ76k52dM2hWq0aleiUz9LkIXwG8zfrrGpD73Veyhn1cg
         8uXGodBFwxumUZX4y0Pz4rpS4IrQwSZW/pncFRyGmw3m10L8m+r+Q1Fo4/KuG1Lwn1Qp
         3QAcr4SXcvpZztwEYTF28fx3uUDbx4O0bBAGmiMrEgKPi+iCWN2f+yPWugKYUBD9Lre+
         rNQiMe8qQ8vtPT/Sb6SJsDef6purL2StPDPTjDxxIXAeczUf442l1SbSrLHZo4qlhMlp
         JHGH5ORD20ui5Ub7WTWzZ0rAt4THHOC0Das9o66iZHQIU+u8tvTwhBdV7jf0lbiZajLJ
         505Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LA0xVzv55vv90cseImuUZu6G5SXRivgPxKWoy9yziNo=;
        fh=LrM3G6RcmBZ425pLRY8E44TM1XcCb9gU9D3viVl1X8E=;
        b=f1nqI+66o85nT/15aWIzCjM2Ik++tu2Z07OOPW4vyUR9wUy6Uo6CaQ9lQ/R7ZbUBw2
         391724RL3OOajYqu6+FyrGh5KFT+dVik44UmhR24MOgL0W9Vo6z5LCaEV5TI9A254/Ls
         AT+UtBhSzV1lZtpGhec2bx4V6J4hc6TjH/dsYzNH+X2tuUtN1E2EEBmVT8rlWimWRWbO
         WsHdqOTqNkxeFxpBgr2f8jOVsnx7mfcqEgiO5zX4h0otyjOLLH+CZvrCVycNGTvTLiKp
         pixpTYHVWW38/vflHwlKZ+NTXlQh1ElJ0E34rg2jiSwPWRYMXloNYIje/67mvKp83gkW
         0ZnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792704896; x=1793309696; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LA0xVzv55vv90cseImuUZu6G5SXRivgPxKWoy9yziNo=;
        b=CcwLQnE1MbJt3kXIi9J5+e0px0CgILAM/Zk6llEpTUbJ8CYiSp+KLDLm9SmvYYp7aL
         gCW59ks0teE1Ht8kUOSP4VJ4GBloFZbYrCDYkDiUL+wHpXEugUXqZCGYmR1TpGNv/cmq
         GqgLhnw+xKOFqirkjfLx9cEpKXu3k6bODFTXCrvaZ716/heZbitYcYnGsFZQDFTonWFB
         FSX3PBcwIAR1nMAtdW3tgAZL7rkH31cYQyxd0eS8kQCNWP/fO2hNN+yo3MxtDhYbT+HU
         TNW5XFxS12+/KPLnYG13YvuikmwIbI0wRiPMUFD3ce2/Sxc27JS1fAXvYvaIR5YZTMNY
         xa6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792704896; x=1793309696;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LA0xVzv55vv90cseImuUZu6G5SXRivgPxKWoy9yziNo=;
        b=AmTqbLXTax+31MlKnMIVaMuzgDllY8Y09qT6oNVTGv2HBKxYf7hQd4HtgyB7qDxR/o
         NWQAhhflw+gstsFb5uGwSdMIXN+UiiblKCczcxb2EHN05gAnEMkWJWHtyDsQttDbzfwr
         wE6/ntX3Hxetr1Cn6YcCXVLC0rAenY71YNrB7q67RgbhymBWySnzqaMfj/JfcoHkTyEi
         UAVZH3n7X/L0JZe9VKMZrXoj2xiDzyhXH4fVoExtJpMr902DaV5Ycqf+Y6bKTKUkczTH
         CMaLmYj1AqECglnH1hzu5XTh4SMA3MTpDRYOF6/X4PQyDdqznv6QHa5DjkWhFSeUzLDY
         bN/A==
X-Gm-Message-State: AFq9FYLc9QFfSig17/GlBR20Dxr25pKMjkCNlBxa/BfjHIBQukmEkQ2T
	t00dfuCwQ/Q+g9WS3YwdsOhA6znRxnRwZwSeHzIca32RJh8FJV33BIWyqMMDUeAW4x6UL/yxr4H
	bCubnsWwP5tLB2DSI8b+RLcdwd4sSdEkmbqcpono=
X-Gm-Gg: AYBFou35PL4bVz80TuPOil1IObfs1DgvbnZW2bwqYV7vP+u7wIob6SyFYAN7AUo3zxY
	Oxj7m/lMnDcZeXLjYuJDmuexZIIkp3eKplni3DtaXB5+RTsdjkFjoGaCinDSOqVOsgH7Q0Xb5Mh
	pJo6TM7eKW+pe75pU+6XfAofl8//IgLdYpk/IQ3HOsS48nJ4VoMIl/yOle95q1U6WRnonH+yyLf
	iGUTCvKWYoUp6uqKPKqlyPsmB7hn9DrHDx6x0UwmVUNHAPQXgVFcJjPpmzSeLS5Vnglao3feOlE
	dl3/CFTPU0qoZxIDyEuwfNyUKjUEdSLgpKg+bQj/wsaAUfy9WRT640R6zID6QY1a32+0U/q9P3p
	eS6fL8CTo9DGnvCG4HUe6yvQv6NsvyZKiZndvKCLdq1qhPsgfTCKFbgULabNb1Cg5Gt2dxb0zqY
	COFRNr0fRhGDxblqR8kVt7Upk/wkxee5DMgZri1nI/PFBhTyxT7fu39tJvLwKjbcZI9XietCyFX
	8ZGlzRAJe0xK3DSeGy8RITj6Ygkbw==
X-Received: by 2002:a05:6102:4448:b0:7c0:1d48:b2a2 with SMTP id
 ada2fe7eead31-7ccc34426d7mr180886137.31.1792704896300; Thu, 22 Oct 2026
 14:34:56 -0700 (PDT)
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022-submit-mtk-uart-dma-terminate-atomic-v1-v1-1-aa498ba5da25@gmail.com>
 <sashiko-outbox-182061@kernel.org>
In-Reply-To: <sashiko-outbox-182061@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 22 Oct 2026 15:34:45 -0600
X-Gm-Features: AclHuK8XSvw8qsK2rLsmYRH4GbjeZAAeNXGi3DQaPA1mpnSYabxmiTKjlnStHRg
Message-ID: <CADvTj4qMcb48RucqxGxL7qqdu7dDbUw0pSBX7v-t2Q9+MbmfGA@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: mediatek: uart: make channel termination atomic
To: sashiko-reviews@lists.linux.dev
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 3:25=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] dmaengine: mediatek: dangling c->desc in mtk_uart_apdma_terminat=
e_all()
> --
>
> commit add32020b23bda4849b015bc2e7b816090491c89
> Author: James Hilliard <james.hilliard1@gmail.com>
>
> dmaengine: mediatek: uart: make channel termination atomic
>
> This commit updates mtk_uart_apdma_terminate_all() to serialize hardware
> channel termination under c->vc.lock using atomic register polling instea=
d of
> sleeping polls and synchronize_irq(). It also checks VFF_INT_FLAG in
> mtk_uart_apdma_irq_handler() under c->vc.lock in case termination already
> acknowledged the interrupt, and aborts descriptor cleanup if stopping the
> channel times out.
>
> > diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c b/drivers/dma/mediat=
ek/mtk-uart-apdma.c
> > index f74e9a3285887..73d4b701ac858 100644
> > --- a/drivers/dma/mediatek/mtk-uart-apdma.c
> > +++ b/drivers/dma/mediatek/mtk-uart-apdma.c
> > @@ -256,6 +256,12 @@ static irqreturn_t mtk_uart_apdma_irq_handler(int =
irq, void *dev_id)
> >       unsigned long flags;
> >
> >       spin_lock_irqsave(&c->vc.lock, flags);
> > +     /* Termination may have acknowledged an interrupt before we got t=
he lock. */
> > +     if (!mtk_uart_apdma_read(c, VFF_INT_FLAG)) {
> > +             spin_unlock_irqrestore(&c->vc.lock, flags);
> > +             return IRQ_NONE;
> > +     }
> > +
> >       if (c->dir =3D=3D DMA_DEV_TO_MEM)
> >               mtk_uart_apdma_rx_handler(c);
> >       else if (c->dir =3D=3D DMA_MEM_TO_DEV)
> > @@ -400,10 +406,12 @@ static int mtk_uart_apdma_terminate_all(struct dm=
a_chan *chan)
> >       LIST_HEAD(head);
> >       int ret;
> >
> > +     spin_lock_irqsave(&c->vc.lock, flags);
> > +
> >       mtk_uart_apdma_write(c, VFF_FLUSH, VFF_FLUSH_B);
> >
> > -     ret =3D readx_poll_timeout(readl, c->base + VFF_FLUSH,
> > -                       status, status !=3D VFF_FLUSH_B, 10, 100);
> > +     ret =3D readx_poll_timeout_atomic(readl, c->base + VFF_FLUSH,
> > +                                     status, status !=3D VFF_FLUSH_B, =
10, 100);
> >       if (ret)
> >               dev_err(c->vc.chan.device->dev, "flush: fail, status=3D0x=
%x\n",
> >                       mtk_uart_apdma_read(c, VFF_DEBUG_STATUS));
> > @@ -415,11 +423,14 @@ static int mtk_uart_apdma_terminate_all(struct dm=
a_chan *chan)
> >        * 3. set stop as 0
> >        */
> >       mtk_uart_apdma_write(c, VFF_STOP, VFF_STOP_B);
> > -     ret =3D readx_poll_timeout(readl, c->base + VFF_EN,
> > -                       status, !status, 10, 100);
> > -     if (ret)
> > +     ret =3D readx_poll_timeout_atomic(readl, c->base + VFF_EN,
> > +                                     status, !status, 10, 100);
> > +     if (ret) {
> >               dev_err(c->vc.chan.device->dev, "stop: fail, status=3D0x%=
x\n",
> >                       mtk_uart_apdma_read(c, VFF_DEBUG_STATUS));
> > +             spin_unlock_irqrestore(&c->vc.lock, flags);
> > +             return ret;
> > +     }
> >
> >       mtk_uart_apdma_write(c, VFF_STOP, VFF_STOP_CLR_B);
> >       mtk_uart_apdma_write(c, VFF_INT_EN, VFF_INT_EN_CLR_B);
> > @@ -429,9 +440,6 @@ static int mtk_uart_apdma_terminate_all(struct dma_=
chan *chan)
> >       else if (c->dir =3D=3D DMA_MEM_TO_DEV)
> >               mtk_uart_apdma_write(c, VFF_INT_FLAG, VFF_TX_INT_CLR_B);
> >
> > -     synchronize_irq(c->irq);
> > -
> > -     spin_lock_irqsave(&c->vc.lock, flags);
> >       vchan_get_all_descriptors(&c->vc, &head);
> >       spin_unlock_irqrestore(&c->vc.lock, flags);
>
> [Severity: High]
> When mtk_uart_apdma_terminate_all() runs while a transfer is active on th=
e
> channel (for example, via dmaengine_terminate_async() from
> serial8250_tx_dma_flush() or serial8250_rx_dma_flush()), does c->desc rem=
ain a
> dangling pointer to freed memory?
>
> When a transfer is started in mtk_uart_apdma_issue_pending(), the active
> descriptor remains on c->vc.desc_issued while c->desc points to it:
>
> drivers/dma/mediatek/mtk-uart-apdma.c:mtk_uart_apdma_issue_pending() {
>         ...
>         if (vchan_issue_pending(&c->vc) && !c->desc) {
>                 vd =3D vchan_next_desc(&c->vc);
>                 c->desc =3D to_mtk_uart_apdma_desc(&vd->tx);
>         ...
> }
>
> The only place that clears c->desc is mtk_uart_apdma_chan_complete_handle=
r(),
> called from mtk_uart_apdma_irq_handler():
>
> drivers/dma/mediatek/mtk-uart-apdma.c:mtk_uart_apdma_chan_complete_handle=
r() {
>         struct mtk_uart_apdma_desc *d =3D c->desc;
>
>         if (d) {
>                 list_del(&d->vd.node);
>                 vchan_cookie_complete(&d->vd);
>                 c->desc =3D NULL;
>         }
> }
>
> In mtk_uart_apdma_terminate_all(), VFF_INT_EN and VFF_INT_FLAG are cleare=
d
> under c->vc.lock (so any pending mtk_uart_apdma_irq_handler() sees
> !mtk_uart_apdma_read(c, VFF_INT_FLAG) and returns IRQ_NONE early), and
> vchan_get_all_descriptors(&c->vc, &head) splices c->vc.desc_issued into h=
ead
> before vchan_dma_desc_free_list(&c->vc, &head) frees the descriptor.
>
> Because c->desc is not cleared during termination, subsequent calls to
> mtk_uart_apdma_issue_pending() will see a non-NULL c->desc and refuse to =
start
> any new transfers on the channel, and any later interrupt on the channel =
would
> dereference the freed descriptor in mtk_uart_apdma_rx_handler() and
> mtk_uart_apdma_chan_complete_handler().
>
> Should mtk_uart_apdma_terminate_all() also set c->desc =3D NULL while hol=
ding
> c->vc.lock?

This issue is fixed separately here:
https://lore.kernel.org/all/20261022-submit-mtk-uart-dma-retire-v1-v1-1-3f9=
b99a9d89a@gmail.com/

>
> >
> >
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022-submit-m=
tk-uart-dma-terminate-atomic-v1-v1-1-aa498ba5da25@gmail.com?part=3D1
