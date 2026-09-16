Received: from mail-ej2-f24.google.com (mail-ej2-f24.google.com [74.125.228.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6E34A3F16
	for <dmaengine@vger.kernel.org>; Wed, 16 Sep 2026 21:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.152
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789595228; cv=pass; b=t83TVdM4Jq1zl3Xk4vOTzZEIJwokFKZH//B8M4TFw4xpr/jV3b2E1Sx5bdD6ZwWkEJV/NlLzt2l1JzRsxZtyx7n479WBKM46aY3Z8HUfmlEihmxwUrrlPchIbW/v3g7p3sNr3fipDeJrFqt0NBKtjjEziXUgmbwqgxk7kbEOkSM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789595228; c=relaxed/simple;
	bh=kqAE238eZJ1QWaBrodNLSxhvzuufzav8wwSyPhv7Xjc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RZJ/YA0eo798NJu4WmIVQTvpFVWL8X/cD8U+OpmtYHJJJjYwLnTDR0+QKIDQcvdpEkk0maK0ZIfB/y6tj0r8LSvIeGCcxLiNgHr07nAaueVdJnEJnFkdmruLPb8pBMSoMU6Lfk/21xZdQwDxK/KAx8N7FkwkGvdQ1PhOwsF1vkc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MYVGjf73; arc=pass smtp.client-ip=74.125.228.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MYVGjf73"
Received: by mail-ej2-f24.google.com with SMTP id a640c23a62f3a-c29d33431c8so28351966b.2
        for <dmaengine@vger.kernel.org>; Wed, 16 Sep 2026 14:46:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789595207; cv=none;
        d=google.com; s=arc-20260327;
        b=n78F91HRr66OBVlDpcGfiwLt2+FRoOFm5AAxVJaHqMGCbBdZ5ZA5iVv/MTAAw12BHO
         TFVxbCP01dwVtxdoWXo4YrLYFWLYBd74qWxsGICNyan66O2o9QNt5rE62uhiIbtaHJ1u
         blTocMvByiMtdnCuh1RVJJFsXe0dHXy73TtnSBDRQsOudXldY7aNVqXeCtd6dwnboFgt
         ZyOAqjhNHhy+50/xjFruL35wQkOVY66VH79o/x5WR+VG31712j96/jGWSW8rCeDoPp16
         TZSCwKvEF/JguIRu78BTetuku2usQDQl6wdyGU/Ldkw0zzBEew6vBH2BzVmDhD51GjcO
         0UUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4vS+1dvzi7Y+x/KirADYaqDHW8NYqQEmTS40hoDTXeA=;
        fh=oDAnnQ/SNfcNq0Iulz9Op5NCrtNjk/3yNGSUuLRVreU=;
        b=ByxgzryBHwkTVnMrENWfucdwIHVxGPjUZYy/mRIQi8zbfE2yFLKX/2DJBZZA2njuHj
         odrQ/XV69Y2tSXqszGAMZHcWNyN7OgP/S27Y/yBzJkqE0WIctwI64BePO5+zUwPTuJLy
         E39a2xPKPYMM2EFcrEAdlO4pZumrOdR86SAcahq3ReT+aKTHXqSqybCAe8dHjJ1L6erz
         G5A/wgiOfqsH0XaYlQPiR5VPIiD/2SeHVIAVsulGYkizMSGdNFksBLcUlaYgQ0fgET6E
         U/rajPJHg7V03sFqiRvl4K5c5D/9Rz19gnm8Fbrl9I+0dsZzEJ7gUhkQ+pRVHDQ9ot5L
         d9lg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789595207; x=1790200007; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4vS+1dvzi7Y+x/KirADYaqDHW8NYqQEmTS40hoDTXeA=;
        b=MYVGjf734wH/4j3Sq9bO0FdG7wKdNt55UYJovHMBv07Mzs+MvCunlLhBdyYn7ipBX2
         nCYONVkWjdRNxiBF5QwSiVQACDnO4DgqsSpiFXSZo2yTpcd38HVJEkoUYPdAfO7dqTCo
         oeRlcyk29cVOL/9monmak+kGjuTfHJsHGYhZIkIgN21cX+4EJpWO09C432CfnyFe9Wwy
         nDfroTqiipKy9ezQ4WRdJbkDA55At08JF/l8BIXpsPUgrD8kirYL4lRQPPps8NMA9ZY0
         KOh11fDcC6LTovGSvBIMNmB4WbrYTfhEnkCVWe75AQkq0c/kpsicD4UAZ98zK/igmkDO
         MAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789595207; x=1790200007;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4vS+1dvzi7Y+x/KirADYaqDHW8NYqQEmTS40hoDTXeA=;
        b=oPXkbRaFE9q/H6jJnafcH2DZ9NQBF55fBcVJYW7AvHY83t8q4aq21x2m+JgOPPwi/9
         kj79gDSrI0fkqzNNAuy0TSZJiOVg8SkYeA0OGQ661/KUmzjlX7cT5d/6FlHHphhoe/GO
         aZ2YsmMvaB6iznpO9lFYJrJEq9DNSlC9k3LddqPP95HxC/0pIGE0GUzeCdv77A8WmIkK
         OiujC3rprVn7QrtXdlh5XqqRUGXR4bN2+3nuPG3uCTFNwXQumSpJAiy2ou3eypoDPrOG
         KdHJzc8c1jFWTuc7/ZbGnDQBxNHKlsFrj3Ta3nvDGRHJvapA0feKKnptKJwLPzogt1U+
         wv+w==
X-Gm-Message-State: AFuF++nCPkG3UJCdVVrzrKJ2cS2RW9so3taMBm0DUFhomJpwkOuyR8aq
	bw2hF/e7p/iMo4P1agKomx0XtpW8zM7jxo7afcSEnwGMRCydqwj1s7pD8TaMeA72XStm44UEgWH
	iJPmhIsppjRAFRJnikL6thlEipQfsC7REDD4lkNs=
X-Gm-Gg: AYBFou1a1J1PwiYhTOhZu8Q8dy1hpP+9AR6EG4nyUbYZMcP0mEuEAj4bvkrds2TBem8
	AoniWxl6O6TS4MIc76hBEBY71ydlPxNlz74tPAfR6F5jsQhAHxWE+RE6PkGNWkziovQqphIYOwQ
	AcXZZHTvwnM1pNsmqFZqizOaKjOYAPBeYiyESgYVg2X38gqBCp84Lb0N3k0w75pe1UMspdO/BHI
	jC8Z6Qywtb9HQ3ZU9wHtnpwJmQnMmx8HIlt+B7lMitb06FtJECcyefqG23hSUp1TBK9xUuFHz2d
	o8E69/+sAC3EPGph1l2yuwEVLYyv1gu8d4zOyZ9hiY683LUQ6XCLXtNW71oQHoktWFqWMu8V+Gt
	KAonJwXR/82UBADCen5z2kv7bn4pNh+BmpYdTvR62gpPniHl/38zUH6w8N0WFSvBCSFBJzwrvwX
	QbDkPJQxzVXLaMTk6yenAJS968yUTSRE6yP/PrVVcmjQv/mCUlKXC3nVOKBWSeraRNlw==
X-Received: by 2002:a17:907:3f2a:b0:c29:512a:4668 with SMTP id
 a640c23a62f3a-c29e52ff4dcmr289062966b.27.1789595207042; Wed, 16 Sep 2026
 14:46:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916182405.12985-1-rosenp@gmail.com> <aqrowa1TFhIDA-17@SMW015318>
In-Reply-To: <aqrowa1TFhIDA-17@SMW015318>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 16 Sep 2026 14:46:34 -0700
X-Gm-Features: AcwNN1WY6iX8qh2LELsgf9VLXlYNjHOD3KOzsSe5taIIH5KHhdz0g-vw5on_RnU
Message-ID: <CAKxU2N-zLp3612KRsdmWKjm2hMBOikBZDBEqvpLOxpg44J4Fwg@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: mv_xor: use writel() instead of relaxed variant
To: Frank Li <Frank.li@oss.nxp.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Saeed Bishara <saeed@marvell.com>, 
	Lennert Buytenhek <buytenh@marvell.com>, Maciej Sosnowski <maciej.sosnowski@intel.com>, 
	Dan Williams <djbw@kernel.org>, Nicolas Pitre <nico@marvell.com>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 12:06=E2=80=AFPM Frank Li <Frank.li@oss.nxp.com> wr=
ote:
>
> On Wed, Sep 16, 2026 at 11:24:05AM -0700, Rosen Penev wrote:
> > Fix the ordering guarantees between descriptor memory writes and the
> > MMIO accesses that expose them to the engine. The descriptor pool is
> > allocated with dma_alloc_wc(), so writes sit in the CPU write buffers
> > and must be drained before the engine is allowed to read them.
> >
> > Program the next-descriptor pointer with writel() instead of
> > writel_relaxed(); the full accessor drains prior memory writes before
> > the MMIO write.
> >
> > In mv_xor_tx_submit() the appended chain link must be visible before th=
e
> > busy-status register is read. Use a full mb() so the engine cannot fetc=
h a
> > stale chain link and stall the channel after the CPU decides it is stil=
l
> > busy.
> >
> > Fixes: ff7b04796d98 ("dmaengine: DMA engine driver for Marvell XOR engi=
ne")
> > Assisted-by: LLM
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/dma/mv_xor.c | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/dma/mv_xor.c b/drivers/dma/mv_xor.c
> > index c4e0dce3ca64..0de2b1ad5c30 100644
> > --- a/drivers/dma/mv_xor.c
> > +++ b/drivers/dma/mv_xor.c
> > @@ -103,7 +103,10 @@ static u32 mv_chan_get_current_desc(struct mv_xor_=
chan *chan)
> >  static void mv_chan_set_next_descriptor(struct mv_xor_chan *chan,
> >                                       u32 next_desc_addr)
> >  {
> > -     writel_relaxed(next_desc_addr, XOR_NEXT_DESC(chan));
> > +     /* writel drains descriptor writes to DRAM before the engine
> > +      * is pointed at them
> > +      */
> > +     writel(next_desc_addr, XOR_NEXT_DESC(chan));
>
> I remember this my comments before, should be v2 version?
>
> >  }
> >
> >  static void mv_chan_unmask_interrupts(struct mv_xor_chan *chan)
> > @@ -410,6 +413,11 @@ mv_xor_tx_submit(struct dma_async_tx_descriptor *t=
x)
> >               /* fix up the hardware chain */
> >               mv_desc_set_next_desc(old_chain_tail, sw_desc->async_tx.p=
hys);
> >
> > +             /* make the new link visible to the engine before we read
> > +              * the channel state, the device may fetch it at any poin=
t
> > +              */
> > +             mb();
> > +
>
> The first is readl_relaxed() in mv_chan_is_busy(), all io readl and write=
l
> is ordered.
>
> which part need mb() here?
It's to deal with readl_relaxed in mv_chan_is_busy. I'll change to
regular readl in v2.
>
> Frank
>
> >               /* if the channel is not busy */
> >               if (!mv_chan_is_busy(mv_chan)) {
> >                       u32 current_desc =3D mv_chan_get_current_desc(mv_=
chan);
> > --
> > 2.55.0
> >
