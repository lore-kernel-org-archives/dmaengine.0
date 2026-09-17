Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3419236E49B
	for <dmaengine@vger.kernel.org>; Thu, 17 Sep 2026 23:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789688748; cv=pass; b=otkATgJcguM6UZhCFNe5Kv59LjB2dSkR2YhlxsuGpKEmbdV3NMinnnwVDskrCzFTof/o6TZ4AtxFTARo/SUapU1L8wP2fEm01MKEWij0MYQZe93m3hnXh3fCHF5Z9ZR8TZXBYDnevg+GFLYs1dA8swZWTqg+AbHkvoVVx/7P9Gc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789688748; c=relaxed/simple;
	bh=pE4rjGDF1bQbyBBb0Wy35uSEjHl+G4PyGMxkQjXjeRA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NYYZ5ZNE/6mI2lUlB832UqxLXIBs5hu//LtPpSCCbfGHdzPPTd3ZUMhUeOiwB2GtiBY54sMVlUqrdMR0cpPziq0OfNWojBbseLTsZL3im1VQ0MKl2BodGW0T+GWrVhsWF8WbCM0b5u8z5vpUdRr3by1XVnCypJ0EVxlI7nCPxVs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C076HdeP; arc=pass smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C076HdeP"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a98505364aso220948a12.3
        for <dmaengine@vger.kernel.org>; Thu, 17 Sep 2026 16:45:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789688743; cv=none;
        d=google.com; s=arc-20260327;
        b=kfw/95gZJ1kwtl7BgRrsh/rsMB7VXczNcE4Kqh6tRcIdhkmQZy/LFS0B8O4x1ziVnU
         H1W9ArcpmXQ6XormdzWMkOrLAFqcCXpA+n1AdPat2wKJ/q/YiF6R3azQ6L7ZMJr/jS1k
         G/MstTD3bzJ8mnYlNykXt7kH8qt5/dJxA7/Ic90tcdTmPQxhKfJuTC/T/fVa/ha4ZQJe
         Wa2ox04A68AdVJpC7DrKa2UoFwrd8VKU9+acX6wMVBNeNNOOxYkr9TdoUjYqGXReKiXe
         PRx6Zqk11wNk/jM/o2NWnOsAR5hSxtdiWHVgR7f8DSOx/SEg8p+llJLORRnJxfpFmfNN
         bPXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IRCvOsr2xS9Eb1jZjbj4vcoW3Fq5/gZdfVw4G7qLA0s=;
        fh=oDAnnQ/SNfcNq0Iulz9Op5NCrtNjk/3yNGSUuLRVreU=;
        b=dFMpwT4xucNejuFjOqO4M9StnLH5KB8cnPKi5txFFDXNkNt/2esxZ9jdq/jZVu84Gv
         IiJj2bTD56eZ+wCbKksG8d3mlKleCyg0F4oUWvHLjvDp0NqUn5HPgDoEmVUQZDqaFH+H
         OCWH70gUtZPX7reOYIrqq++EBKw8MeVWNexzcnX6HCUubV/ObVAwQ1LbT/CvnaEwUBhi
         VLwyk7I8ZY4ZU33PBewpVP8r8HxBZTxYoaoeA+QA00j8Vl+Tiw0KKwzUIrl+aVmhtMyL
         us8pApevRgTvhPBCFMBNJQfWghzSZKhbyrBECJSX9ZOtSMaCkZf7QyF+ggYgw+o9f4BB
         QxkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789688743; x=1790293543; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IRCvOsr2xS9Eb1jZjbj4vcoW3Fq5/gZdfVw4G7qLA0s=;
        b=C076HdePBPIHEZPZcWB41QMZCTaSXAdizom0yZ6C1fmKp+R6mXM+vcxSqyr8RL6VX2
         oF2FevOwyCJhYFkjYWKd4H0Bl9RFIFotRYREuMZ3aIpKXhozpCvEItsEfDllESaEBTYv
         XjzaY8TWbhla/u3shdNviwywlEfjooS9LWBKwU6QoifQy2nqhm+aIhZvyl5on9fGk9k2
         1OSY88/ifwaZ1Ho075KlYbJVk/W8hpCQNDZyc1Fn7rTOl8CD4KHhNyw7shkhs+FpP4y3
         y1Fdjtebzyql3/LcjWBFIhaqU5vIfo3Tq7Rs4QOM5ShHoeP7+w97NhPikoKoqRM709wH
         ndyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789688743; x=1790293543;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IRCvOsr2xS9Eb1jZjbj4vcoW3Fq5/gZdfVw4G7qLA0s=;
        b=MZuHhx5DG0l1ZCFupw/HSeuoUoWZLdvD7GTrniO1H2u7xGd/zbQcBjF/gIP6j1fiPU
         9PwYHPKUIL46Itm2E2DizWzZzhRnjJVXvsg/iJ5gqDikLyBk62QIMWmxVlsoHCk48Ae1
         dz6z63WepvtDS1Un8SAGbmO1MrgArTqbx/+dDpe5VD9y5IRK0w5DlZ8aucJICH5zyKgx
         qfBykf7mHdmSgWl1RGj5ahgiY9CTQaOWyai/pb0Kh5hixlmIrWoiExCdKMwXRj3hffpj
         yJ3PvxboJkH6Vp9A0qAXIrE/GLgAFGk6j+aeFMIBK0Il7v5aikRp6O/KuRIaljB9e+Rv
         tcbQ==
X-Gm-Message-State: AFuF++kZWB0SL06Zw1PQyywVqBGYo1HmkD63SmxqEWcRrqFO/tLAg0sm
	/v4P0DxCkBVRfkzbyLHDI99nt66IuMjCq1n5sE5yN1lKH61wSj6pfRMvoMJIWVlijQQpxQRfC6S
	GXBnlVy8M2skkPDK5qMbvadDxnbn8Pws=
X-Gm-Gg: AYBFou322XiJ5cvU25D/r6s9KMi7JOVts1UeCDEacXMD28RJ+DrBEwIlkA5GYpEJjsL
	PP6yySEEJKEZaBqG0XXnQI8gVU+8vcHu1QZsns+k3v2mAGQaKMSDw5JET9Ov1oXmJUidacdVX5J
	4cx4uDfMXdulYNcs8v7+BrhDTPZNPEjs/E+FSeiJ7EZdMtLvaHgLrFGpUZ/6RH/AbTY44eXW21u
	EeAQiSYisI+JEhik3rFUc3/YbExkU4L+pS0dKQCTty1Eml/UhS2SRnwuevlx3LXHL8wS7CPR3CL
	fh+ruOgfQgSxaPv7iAmtL83lyChZi6kZ2s66qafmSVg/vpJBLcYReLKA30XxHM3/JxncimOEeBJ
	4EdOi7uQ3yVZz3vofyK71wMue2aWyYl5r5+Kt2w9R4cZYLtSolGMPJ/NUMN2OPgj3AnyhnfHDEh
	uSPzz+VT0qWFfkf6t3cS0YOtYMqxcGXkL/ncXlJELY7XpKt+mlg8eG7nk8FI/qtiuhgC3YlMUdn
	RFO
X-Received: by 2002:a17:906:c10f:b0:c29:659e:2fd2 with SMTP id
 a640c23a62f3a-c2a157c1e2amr70591466b.27.1789688743376; Thu, 17 Sep 2026
 16:45:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916182405.12985-1-rosenp@gmail.com> <aqrowa1TFhIDA-17@SMW015318>
 <CAKxU2N-zLp3612KRsdmWKjm2hMBOikBZDBEqvpLOxpg44J4Fwg@mail.gmail.com> <aqsZMeDZShMpCVj_@SMW015318>
In-Reply-To: <aqsZMeDZShMpCVj_@SMW015318>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 17 Sep 2026 16:45:31 -0700
X-Gm-Features: AcwNN1XwuyK7TTtG8HY8dqkkaXc2gXqb_ZtiR21TrmE9DTQIzZohBc4bNkcnUts
Message-ID: <CAKxU2N-KfzS3uXRE6GKy2FL2mgrfXwbHaZx21ynhrubnGkJcvQ@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: mv_xor: use writel() instead of relaxed variant
To: Frank Li <Frank.li@oss.nxp.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Saeed Bishara <saeed@marvell.com>, 
	Lennert Buytenhek <buytenh@marvell.com>, Maciej Sosnowski <maciej.sosnowski@intel.com>, 
	Dan Williams <djbw@kernel.org>, Nicolas Pitre <nico@marvell.com>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 3:33=E2=80=AFPM Frank Li <Frank.li@oss.nxp.com> wro=
te:
>
> On Wed, Sep 16, 2026 at 02:46:34PM -0700, Rosen Penev wrote:
> > On Wed, Sep 16, 2026 at 12:06=E2=80=AFPM Frank Li <Frank.li@oss.nxp.com=
> wrote:
> > >
> > > On Wed, Sep 16, 2026 at 11:24:05AM -0700, Rosen Penev wrote:
> > > > Fix the ordering guarantees between descriptor memory writes and th=
e
> > > > MMIO accesses that expose them to the engine. The descriptor pool i=
s
> > > > allocated with dma_alloc_wc(), so writes sit in the CPU write buffe=
rs
> > > > and must be drained before the engine is allowed to read them.
> > > >
> > > > Program the next-descriptor pointer with writel() instead of
> > > > writel_relaxed(); the full accessor drains prior memory writes befo=
re
> > > > the MMIO write.
> > > >
> > > > In mv_xor_tx_submit() the appended chain link must be visible befor=
e the
> > > > busy-status register is read. Use a full mb() so the engine cannot =
fetch a
> > > > stale chain link and stall the channel after the CPU decides it is =
still
> > > > busy.
> > > >
> > > > Fixes: ff7b04796d98 ("dmaengine: DMA engine driver for Marvell XOR =
engine")
> > > > Assisted-by: LLM
> > > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > > ---
> > > >  drivers/dma/mv_xor.c | 10 +++++++++-
> > > >  1 file changed, 9 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/dma/mv_xor.c b/drivers/dma/mv_xor.c
> > > > index c4e0dce3ca64..0de2b1ad5c30 100644
> > > > --- a/drivers/dma/mv_xor.c
> > > > +++ b/drivers/dma/mv_xor.c
> > > > @@ -103,7 +103,10 @@ static u32 mv_chan_get_current_desc(struct mv_=
xor_chan *chan)
> > > >  static void mv_chan_set_next_descriptor(struct mv_xor_chan *chan,
> > > >                                       u32 next_desc_addr)
> > > >  {
> > > > -     writel_relaxed(next_desc_addr, XOR_NEXT_DESC(chan));
> > > > +     /* writel drains descriptor writes to DRAM before the engine
> > > > +      * is pointed at them
> > > > +      */
> > > > +     writel(next_desc_addr, XOR_NEXT_DESC(chan));
> > >
> > > I remember this my comments before, should be v2 version?
> > >
> > > >  }
> > > >
> > > >  static void mv_chan_unmask_interrupts(struct mv_xor_chan *chan)
> > > > @@ -410,6 +413,11 @@ mv_xor_tx_submit(struct dma_async_tx_descripto=
r *tx)
> > > >               /* fix up the hardware chain */
> > > >               mv_desc_set_next_desc(old_chain_tail, sw_desc->async_=
tx.phys);
> > > >
> > > > +             /* make the new link visible to the engine before we =
read
> > > > +              * the channel state, the device may fetch it at any =
point
> > > > +              */
> > > > +             mb();
> > > > +
> > >
> > > The first is readl_relaxed() in mv_chan_is_busy(), all io readl and w=
ritel
> > > is ordered.
> > >
> > > which part need mb() here?
> > It's to deal with readl_relaxed in mv_chan_is_busy. I'll change to
> > regular readl in v2.
>
> I just want to know which variable need read barrier() ?

Review says:

 #### Validity of mb() after mv_desc_set_next_desc()

  =E2=80=A2 Ordering the memory store (old_chain_tail->phy_next_desc) befor=
e
the MMIO register load (readl_relaxed(XOR_ACTIVATION) in
mv_xor.c:181-188) is necessary to prevent the
  CPU from seeing busy =3D=3D 1 while the link store is still in the CPU's
store buffer, followed by the hardware completing old_chain_tail,
reading a stale 0-pointer, and
  halting without the CPU restarting it.
  =E2=80=A2 Since readl_relaxed() does not order against prior memory store=
s,
and dma_wmb() / wmb() only order stores against stores, a mandatory
full barrier (mb()) is the
  appropriate barrier for ordering a normal/WC memory store before an MMIO =
read.
>
> Frank
>
> > >
> > > Frank
> > >
> > > >               /* if the channel is not busy */
> > > >               if (!mv_chan_is_busy(mv_chan)) {
> > > >                       u32 current_desc =3D mv_chan_get_current_desc=
(mv_chan);
> > > > --
> > > > 2.55.0
> > > >
