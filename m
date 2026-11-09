Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794203885;
	b=pJx5p/wOdeoguW4cpP7mvGI1e6pI4pGs7mOLHcL1qP/+tplZMMKwwDcLois4PsTKd5DB
	 3+8n114aBWI/Q+f/99hKNNQt0yic/9e/Z2fGDnI1ePO+1OWPqyPaXr41xRpHLQFzcTs3/
	 FAQQrIUKHE4YD75ugJzUJiQ//8u+OJPVpEBm8L2nm2ZjoePxe3VUjHUYIChrjXa+J5WCa
	 Y2js7TuHxCuERMyg/5Grc+SCffJSiLzimhavzMjVNJFMnfD4FHt5q0RM8g20/RIexzdh+
	 iBVAlOJE0FCT5rLipG1vraQ3zNNZgJwuIsbQ+aQxEZetGh1Ltv+FZB/niKcZ3MA3isg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794203885;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=/WzA1TTGgDM/gMmbtBmts5e4EgZIL/YxOR4bvQ02Ea0=;
	b=PMgx2t9yL4Al3ecsNNAa3AEyAO1Y0pRkf9uDsiEf6JNFheuuznLnaQXsoch98SSMyphF
	 maAJrHXSYCt3lypPtU9o81in9GSzTrdsKplDOHmGC9Lz8U66osuGrZx6bZ76R7qoQdBnZ
	 juDTlRJGxrWThGsmjloIpK+zYKA7Ax6aHcPfZQoKDqUIrkSBpIOxNK2OQLlOA5HkgmdRk
	 hKlpyc1+QZ5al9dSjWIg7PteO9yjx6OBzrIrOIJzEuQWDQdBbziPG8oZpsV0NJvzyKtE4
	 zuZ2ZK3G1CJhlc4EYsVbkOSXs89BvZ47WUlzJ7lvlaov+W+LRAz9nZ0Sr8a5k5Ogvyw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TsNZR1t7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.54
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D41606A321
	for <dmaengine@vger.kernel.org>; Mon,  9 Nov 2026 05:58:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69D41606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TsNZR1t7
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7d2dc1ac787so137099137.2
        for <dmaengine@vger.kernel.org>; Sun, 08 Nov 2026 21:58:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794203884; cv=none;
        d=google.com; s=arc-20260327;
        b=QZEXyICv/igonDKxSoDEEz5MaWizzIk+KNElCBtFv761QejjwuurqqrJhfEhLUSYH3
         iPgPmJrBbHYf8BxcAlKWE6xoSrhxu6UQ2ctWIuJRS5vRWjFfqvUONvQgf8SGQW3+yThl
         oZDdpPeUes3RMI1cajgEGpa6wXRJQMQWxCIpgNaZlVzgGm/rAdnlbsEKYdvjXNHQpABa
         0VX04FhRCDSg21q7uuKXgTC4XM4RJgalw0SBoqRGNqyTjAjYVjC8StFtxu4pPMNFRBJ2
         kREhoSSkye8FS4XzHtDqFtd6Jh/JF4hORCx0lPyulMRLvMBpaWRDDYZmdp6w5gISGRiY
         2gtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/WzA1TTGgDM/gMmbtBmts5e4EgZIL/YxOR4bvQ02Ea0=;
        fh=LrM3G6RcmBZ425pLRY8E44TM1XcCb9gU9D3viVl1X8E=;
        b=CoRsN6mekbxdigEV/VwC5AWpuyC51wMx2giQTd7LgKOGXm1aWXZ+SoNcJAifa44jBm
         Gw00ByHu79uXy10Hye9AdfcdRxVxABw3X3FhCBmQhchqACZRL8SQK0GuOQw8BOz1t6nJ
         Cr68Ox2AH3ZHCmE2vZpcY/YI9mmdrdeHty19nX5BupdQe8oyFfW5u83gWbNWNxGZh8Ew
         pA87uOR0cHfPyjezf8H/k/2RMPQbb390Q6u2vFV6cHDX4xNp7G6mOghsr9/c/jR99CVv
         BEFvErWOarmwvkD5mybxdNniFQzt+XvhLaMuDC579706l9Pp711GIj/IgswszuGc/8Mh
         avpw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794203884; x=1794808684; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/WzA1TTGgDM/gMmbtBmts5e4EgZIL/YxOR4bvQ02Ea0=;
        b=TsNZR1t7wcHH5J5nVal6VaWfUZY35HSNI3aI0ENjUjdVym9Mwjfr54tME+ZG93+5MU
         xexASuWON8OnCsu5eVTKxEL1ZKZsEjlGXSQ4nvCkYpGauafYb7P5hmfMYlTup2QpzHr3
         t7aPTMdYgNrcx11R35YzsnM6a85H9CDgPYC7vyR6+zVbxrU6qdWrCCoasgJMNZZ8g8YR
         kvJB1A5UW335exT1nGjvbOhq5k1EbQagzB12Tao2mbDzUmB6IUMaa0+gOckeu//STp9H
         135mQebbFMnrhV0NArFEaggzls22HoV71nLCT/t2RDSt6PxT5mSWk8bBTykVSMwhDtkk
         kRvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794203884; x=1794808684;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/WzA1TTGgDM/gMmbtBmts5e4EgZIL/YxOR4bvQ02Ea0=;
        b=NOLyLLJ/XYU6qB3+ZkpSLaUT61IP61zTz/R9Nkpx+NQ7St6xtrWNEVRpGN1vDzUvYy
         2CttBeW5M7Eh9YmLtkOXA7TrZSmaCP38kOMNh/3DFYw5JNBIIWyOUyYRIio/22c7QnvG
         Ztzi6u3M3QCS9wyO2QNtVG0XDkKkmf/Q3yBlpcCjS2iE6zmQ4aqgDY2+/Vsp9ip8/gXx
         aPg6j2bMD6P5FGavYiyxFbvEFjQlFuEbtC3sVRnodwu7x337FcSriWkx6oufoPg5hyQD
         p3u9QDrOcKAtoUcgJ/FE08wGw4ANrTdkUEi/0EZ6EWFlHozdAFA7EC83i8QqGwC3IlB5
         W8Sg==
X-Gm-Message-State: APuU4Z8v/JnVSC4J30TNx+kwxwRcWwMAh9J4dj1G/MbMyd+BcRMNravD
	f8k+vUFgbno+TUbsEOL+hm7xBu+o1yUymNuovqzA43RyXhmt/0bPTrJtvEgs3y6hOQbPmLa8d5R
	UPs0bMJ676CeyrFR7LFIArA6PI1Msu6nZJVdU+DY=
X-Gm-Gg: AYBFou3IBxnqzM+UXXwwLPdHacoG8pGGgHXc5lDeNnPBWVYok/NtPCwfpihUamj9XIw
	90TIo3a0XYD5yeHduZuyDMCLolsf+Ih8yHYhrNnruHdh3x7UvO3YYTtMlYOQZjmStKrpzpgdRAW
	AYGYjCue7O16zeSgf39mopSv8y6kPnlsAqO0PcOqYRk/p1D+Jo5Uq+2i4kHClyipeiH7G+ei52p
	P1m2r8TbNHUItAKwd+0X5+NkLVB+6F8dQv2R0u/Kul+pnSqG/pNU17uhyQbxh7P+QMouVFYvyV1
	7WjIOJE7JmPH4/4TdpyouM1HAtl54LGUosRVH+x4TIqYkDUrAVmIsNWvAmsRXnND2wNTreF4GgJ
	nvc8SgotpHXho1Fe3a1+1UOzCpb0ai2FrAz/Upc4WVg5slFC3CkVAyTvwVVgTjV9ZwqtVcdt0Mk
	K3xYE6hnvW6P2rMyOp69czWzSAxw6lK7oNezKOcmK20G/t5pe0/Me+10lVciLb9bJhqE92T6otS
	0nnVqjHzH3YDQiDGKXZQtd0pkDy9g==
X-Received: by 2002:a05:6102:161f:b0:7bf:74c1:b606 with SMTP id
 ada2fe7eead31-7d2db271d90mr715189137.34.1794203884276; Sun, 08 Nov 2026
 21:58:04 -0800 (PST)
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108-submit-dw-axi-dma-stop-pause-v1-v1-0-c48ec19e9ee4@gmail.com>
 <20261108-submit-dw-axi-dma-stop-pause-v1-v1-3-c48ec19e9ee4@gmail.com> <sashiko-outbox-204425@kernel.org>
In-Reply-To: <sashiko-outbox-204425@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 8 Nov 2026 22:57:53 -0700
X-Gm-Features: AclHuK9BMIiVNXAgZ5ZFv46VfSdrHHwTcF3dDjHcf25xaomgelb6ZCm9ZeLGtEo
Message-ID: <CADvTj4pFnQUBDvMMXNN-JyKpMNhTApZE-Ot1dqXjLMrkh+3hXw@mail.gmail.com>
Subject: Re: [PATCH 3/3] dmaengine: dw-axi-dmac: preserve suspension status
 until pause observes it
To: sashiko-reviews@lists.linux.dev
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 10:17=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [High] dmaengine: dw-axi-dmac: hardware suspend bit left set when
>   is_paused is false
> - [High] dmaengine: dw-axi-dmac: axi_chan_enable() clobbers pause state
>   in cyclic mode
> --
>
> commit 225811462c3128b58ce5d32c533d4264178f3cdc
> Author: James Hilliard <james.hilliard1@gmail.com>
>
> dmaengine: dw-axi-dmac: preserve suspension status until pause observes i=
t
>
> This commit preserves the DWAXIDMAC_IRQ_SUSPENDED status bit across the
> interrupt handler and failed pause polls so dma_chan_pause() only clears
> the status and sets chan->is_paused after observing the hardware
> acknowledgment, while resetting both in axi_chan_enable() and
> dma_chan_terminate_all().
>
> > diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/d=
ma/dw-axi-dmac/dw-axi-dmac-platform.c
> > index de092f190528a..33340f0e7462a 100644
> > --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> > +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> > @@ -226,6 +226,9 @@ static inline void axi_chan_enable(struct axi_dma_c=
han *chan)
> >  {
> >       u64 val;
> >
> > +     axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
> > +     chan->is_paused =3D false;
> > +
> >       if (chan->chip->dw->hdata->nr_channels >=3D DMAC_CHAN_16) {
> >               val =3D axi_dma_ioread64(chan->chip, DMAC_CHEN);
> >               if (chan->id >=3D DMAC_CHAN_16) {
>
> [Severity: High]
> Can axi_chan_block_xfer_complete() clobber chan->is_paused and
> DWAXIDMAC_IRQ_SUSPENDED on a cyclic channel by calling axi_chan_enable()?
>
> In cyclic mode each segment has CH_CTL_H_LLI_LAST set, so segment
> completion raises DWAXIDMAC_IRQ_DMA_TRF and calls axi_chan_enable() to
> start the next segment:
>
> drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:axi_chan_block_xfer_comple=
te() {
>         ...
>         if (chan->cyclic) {
>                 desc =3D vd_to_axi_desc(vd);
>                 if (desc) {
>                         ...
>                         axi_chan_enable(chan);
>                 }
>         }
> }
>
> Because dw_axi_dma_interrupt() reads CH_INTSTATUS before
> axi_chan_block_xfer_complete() takes chan->vc.lock, dma_chan_pause() can
> run in between:
>
> CPU0                              CPU1
> dw_axi_dma_interrupt()
>   status =3D axi_chan_irq_read(chan)
>                                   dma_chan_pause()
>                                     lock(&chan->vc.lock)
>                                     /* sets suspend bit in HW */
>                                     chan->is_paused =3D true;
>                                     unlock(&chan->vc.lock)
>   axi_chan_block_xfer_complete()
>     lock(&chan->vc.lock)
>     axi_chan_enable(chan)
>       axi_chan_irq_clear(..., DWAXIDMAC_IRQ_SUSPENDED);
>       chan->is_paused =3D false;    <-- clobbers pause state
>
> When axi_chan_enable() clears chan->is_paused while the hardware suspend
> bit remains asserted in DMAC_CHSUSPREG or DMAC_CHEN, a later
> dma_chan_resume() sees chan->is_paused =3D=3D false and skips
> axi_chan_resume(), leaving the cyclic channel permanently suspended in
> hardware.  If dma_chan_pause() instead timed out on CPU1,
> axi_chan_enable() also clears the late DWAXIDMAC_IRQ_SUSPENDED
> acknowledgment that a retry would look for.
>
> [ ... ]
>
> > @@ -1206,6 +1211,8 @@ static int dma_chan_terminate_all(struct dma_chan=
 *dchan)
> >
> >       vchan_get_all_descriptors(&chan->vc, &head);
> >
> > +     axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
> > +     chan->is_paused =3D false;
> >       chan->cyclic =3D false;
> >       spin_unlock_irqrestore(&chan->vc.lock, flags);
> >
> > @@ -1225,6 +1232,9 @@ static int dma_chan_pause(struct dma_chan *dchan)
> >
> >       spin_lock_irqsave(&chan->vc.lock, flags);
> >
> > +     if (chan->is_paused)
> > +             goto out;
> > +
> >       if (chan->chip->dw->hdata->nr_channels >=3D DMAC_CHAN_16) {
> >               val =3D axi_dma_ioread64(chan->chip, DMAC_CHSUSPREG);
> >               if (chan->id >=3D DMAC_CHAN_16) {
> > @@ -1258,10 +1268,12 @@ static int dma_chan_pause(struct dma_chan *dcha=
n)
> >               udelay(2);
> >       } while (--timeout);
> >
> > -     axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
> > -
> > -     chan->is_paused =3D true;
> > +     if (timeout) {
> > +             axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
> > +             chan->is_paused =3D true;
> > +     }
> >
> > +out:
> >       spin_unlock_irqrestore(&chan->vc.lock, flags);
> >
> >       return timeout ? 0 : -EAGAIN;
>
> [Severity: High]
> Does leaving chan->is_paused false when dma_chan_pause() times out, or
> clearing chan->is_paused in dma_chan_terminate_all() and axi_chan_enable(=
),
> leave the hardware channel suspend bit set with no way for
> dma_chan_resume() to clear it?
>
> dma_chan_pause() asserts the channel suspend bit in DMAC_CHSUSPREG or
> DMAC_CHEN before polling CH_INTSTATUS, and only axi_chan_resume() clears
> that bit:
>
> drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:dma_chan_resume() {
>         ...
>         if (chan->is_paused)
>                 axi_chan_resume(chan);
>         ...
> }
>
> When the poll in dma_chan_pause() times out, DMAC_CHSUSPREG / DMAC_CHEN
> still has the suspend bit set, so the hardware suspends the channel once
> the current burst completes, yet chan->is_paused remains false.  Callers
> that do not retry dmaengine_pause() before calling dmaengine_resume() (or
> that terminate and reuse a paused channel, since neither
> dma_chan_terminate_all() nor axi_chan_enable() clears the suspend bit in
> DMAC_CHSUSPREG / DMAC_CHEN) will never run axi_chan_resume(), leaving the
> channel permanently suspended in hardware.

The failed-pause/resume case is an issue, but successful termination and
reuse are different. The CH_SUSP register description [0] states that
"CH_SUSP is cleared when channel is disabled."

dma_chan_terminate_all() disables the channel and waits for CH_EN to
clear before resetting is_paused. With patch 2/3 applied, a disable
timeout returns an error before reaching that reset. Successful
termination therefore clears the hardware suspend request without
needing axi_chan_resume().

That does not resolve the late-acknowledgment case when the channel
remains enabled after a failed pause.

[0] https://www.scribd.com/document/962771796/DW-Axi-Dmac-Databook

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108-submit-d=
w-axi-dma-stop-pause-v1-v1-0-c48ec19e9ee4@gmail.com?part=3D3
