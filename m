Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792696422;
	b=d9BHBBs2hyFo18oseEg7nf3N1049dacBdVO6IObl+pMyRMMDJsjTpdzdNZ6Zfo2dktxK
	 KrjOloluhKDFUaRc8ozxXh7ocHwSntK3M1xjxmbBzFzvsQvWtJZkdzJ0YUL0aEi6T9KRj
	 CwEbQ8DUhSRYiU8HwtFA0REFVodwHUNiGo+XSublsyvpXQQzNG7mcW3KUj9gtpj/ZiN8N
	 SP4wxWliNT3vSF1e2vw9QaYwE0UV7BJpeyPrnxsR5/WvV2xnsEswt/Ap57RrfYcsS1Yl5
	 T4epS4v4HcJBV/Q8MAB8vkWadRiAx8C3kJDC+9rVlxdy2E9PP2uU99aCqK+4Cv6ge8Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792696422;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=TtAVhYz4QvdzrjAhGjbDu9/cGxuf5U8xz1dalJDUVVM=;
	b=t/QfYZ/Gx+lYm8VB2tsuEFQm+ZvcxtDGq49wt1wfETcW4TIwTFbrQKGhSwy5OVYnrbbf
	 wJtzlZmU1oTZwd7EipVeyEmF/eq8hxWeCMpZSAQ8PNa++GFereveTYgKqDlVDgHINd+q0
	 3519YZ45s+xhRQOx/j4rrjIzQ/YFM9jSRaZeDHronw8HtvV+WK5079k+TyFXYuAhqWMSR
	 hgAW150H2JvYv7D4jIY2/xeZNzdCvtHn+nT8PiU4P8QRx5xlUDI9+pKJOYNfZFPiRU9Zr
	 QyrvQyQq4G1C3ndrDHn9EyE2EFK3y1iRfWcz3FqBFkq87xNs/OD2NPJCN6GW2nvBg/w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=i7darYlE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.41
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D7B606A31A
	for <dmaengine@vger.kernel.org>; Thu, 22 Oct 2026 19:13:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7D7B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=i7darYlE
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-7c19c6721a3so29601137.2
        for <dmaengine@vger.kernel.org>; Thu, 22 Oct 2026 12:13:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792696421; cv=none;
        d=google.com; s=arc-20260327;
        b=pd388tUOimiHYsYvWgFtSnGQpd20N9t1/5+PbtM9XKeaKUb/xz1hj6cAOthxiZCCeI
         cfJxf2V/7TSYx+yJmvu5EvpsCm7YEBRxkuSA06J+1llY/3DIEOcVR6b1FxiPbvn0B2if
         GWhHX2maQfQRLLYNNcxDIpkmV/K0gY033kwUl8hge2gYz1Io6idAM64GhL8Ti7fettKA
         GOYKLPzEvc/eYpcmeYAuuaIaA8zMIwBdyWTHJ8hY+WLSd+CAthKZL53yqls7aUUfkcUp
         Dur+jPKBvQDxNiOEW4QrcSptevBcMPh0YmajS1SxauzfzyIkMnuKeZIv8LHp0c9L9VFb
         Xm4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TtAVhYz4QvdzrjAhGjbDu9/cGxuf5U8xz1dalJDUVVM=;
        fh=YXboIEgLAvGUk2ILnSZo+k49G/NG0DhWEcJDDjUnkCg=;
        b=fG/xlmFhFpiAHaDZrAk25odyjN8tzVTki8uhErViL4gtKppZD4GDpocuDkicfaAOHJ
         0jyo9nNEIfrgQXqFqHtw3WnzkO2yL+zdcSzdIiyEYDGsuH8Zsl3gOSoDsJxhj6u6+i62
         BUg97GwflKZrdGM/egZhUCsJM8j7/mRMoyG6L8tOWfb+JYsQJ11CqOIz8/DLuO5Bud6d
         KNADVXptet5a1s1A6rnIJG4B0X32nZvnoHor5DaPDFDs3HwqgEY7np2srh9iX+iLRybT
         SDpvjrqC9wkc3MQkzk7Vx4/nyJzHFV752RBj/ZvJznndGXE9tIZS2pvHbCzIMgSF4WSs
         7F5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792696421; x=1793301221; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TtAVhYz4QvdzrjAhGjbDu9/cGxuf5U8xz1dalJDUVVM=;
        b=i7darYlEIo1U43FFo1YC+jEltkgS+5KI2K8Hl4HrATDhLYkHgDZDLf8J57wzqWKu+R
         TJ7Hpds3OmA7DsfIjembs0PSPFnrJLk04BjnJ9OU6jPxxR3XBAE5IxYotNQtQefMA5Ji
         Ni+Xc4h88Q8DAFZEn14ibIamI9m0IgyWiJBYsuzvmHEm5iAYqPNC/lPDoaZN7Y4jEgeA
         UO4FBm56qPXcYVXEWGFJ+RZK0M7s7y8GEZO/LjM/gg+h7C7y8oUD7PujRMaBPS7P+7uz
         B82358d/dqcfTqIUwVcvIzfx4ZTLDpYO8BhZlxn4Qr/s3f3wVpnU1prvi0SRIRlQOvxv
         WP1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792696421; x=1793301221;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TtAVhYz4QvdzrjAhGjbDu9/cGxuf5U8xz1dalJDUVVM=;
        b=aX1NW252StkSxaWiSRRusOrYwMJJRBF0soWAJw8BRlOkzxT0oDzwydQE556g23zGXe
         Vs5vooG6FHptfI+HXQQ7ewrQjMGOjVIvNEXYqFxkUhraH01Z8peqrvGm52zyseIraDCd
         bZlBfxXt2ILdXy+Pee/Zre2kK2Kfzf31YcJ1F60aVn8fLiS+x6Zn3nY8W1BzYTFFYF3W
         nmnDH7wDYgzeeM1H/TIMy3e9dWso1gMnJXNyozxEK0DKlJeMHvm+UGlbyUNOp3kQkd6L
         qPz5MrMbqx/YSTb3a/niSsawQkxUJN+F21Gzga9b0cRKHqk9ktzOLhhYrORJ/3+OJdib
         SmPw==
X-Forwarded-Encrypted: i=1; AKwUvByXmBClG3KasiPpCagL9Ra3ck+S31eCT0o/GCd2tddSCiLcjCw89LS/vkeaIXEMuS2pruvmfVso840=@vger.kernel.org
X-Gm-Message-State: AFq9FYJT2Sm6LTQamIYgzYmkTA0o8Jxswq61LpQ0YyfdNTiqo8y1Se4N
	Cv2b2WSplnLPTHC2AtRjLhx7ds0wcr2EHCC9QQJ9aPWxwgRXopm809GbTq041UhozSLyA4PcT7h
	T/gScEex0fm74L94oiqVq01DMPDvEZr4=
X-Gm-Gg: AYBFou0/dON2Ld54rHGy0kngbVPPgoAY5K0PlDT5fUiljaqMX3Fcvap+01w5Fb22jqi
	jt6HBbtvckcLWgmv454uCpP7nYWuwnSubchSDhLY1AXekXDGDFErKK917dnx7QI/JkBT+2jVbVi
	zVOub2L5ocJgwq/GEMr0QKC3TPFKrDinsyipVZUdpcCm7xn3Z6EEZzGmQ3p0DPDzw6bXQFtpeqE
	rlDMltoVN2S0iAru3ZSfl+993MwkNVICltYfVO8e/8bTTODIyV7hIGcUpHz/dXQFPitusXJFNtu
	Om7xZjXSIspi4nrzjqkKGkptiQVZd5KhZPInTFOHpcMg/n3KOrKbnDbnS4E8x56L5qDP8VYhrJ/
	p0I7nDkkYymecvZbohCV9LpVLy1+8aKDWB+pWq7Bxyxl8lfeCBZRagJ2rTVWu38EUVGyROhAxzW
	nGRWQaxoSoMWFcOuVyJ7SUzf4uYUrD/l4ZrtZBAKmtkQmnI6cNgXUwvowxSebtrF8Un0LSFItIU
	/7HDPrqtDx4WIu4hy7vL6mxEpywXw==
X-Received: by 2002:a05:6102:4bc1:b0:7cc:1218:1d2a with SMTP id
 ada2fe7eead31-7ccc32eb44amr171247137.9.1792696420656; Thu, 22 Oct 2026
 12:13:40 -0700 (PDT)
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021-submit-sun6i-dma-descriptor-mask-v1-v1-1-76e72bd52e57@gmail.com>
 <ato1bMSJgTVZnOyd@SMW015318>
In-Reply-To: <ato1bMSJgTVZnOyd@SMW015318>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 22 Oct 2026 13:13:29 -0600
X-Gm-Features: AclHuK8dUweaO7VirTuh-oMszxWLhvnB6Zh7PvCummnzZQmZVHWezvakVRYMIa4
Message-ID: <CADvTj4o+XjFjE4uhNSaaA78t0dqhXaOFkzux_CfWGyC1CCp6Yw@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: sun6i: constrain descriptor addresses through
 the DMA mask
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, dmaengine@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 10:10=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> wr=
ote:
>
> On Wed, Oct 21, 2026 at 03:11:29PM -0600, James Hilliard wrote:
> > Descriptor allocations pass GFP_DMA32 to dma_pool_alloc(). The DMA API
> > chooses the memory zone from the device address mask, rather than accep=
ting
> > zone-selection flags from the driver. These flags can also reach the po=
ol
> > metadata allocation and trigger a slab allocator warning, as observed o=
n
> > H616 when preparing the first UART receive-DMA chain.
> >
> > Set a 32-bit coherent DMA mask before creating the descriptor pool and
> > remove GFP_DMA32 from its allocations. The driver does not encode the
> > extra descriptor-address bits supported by some variants, so descriptor
> > links must remain below 4 GiB. Keep the streaming mask unchanged for
> > variants with wider source and destination addresses.
>
> Spouse other dma address in src/dest in descriptor also limited to 32bit.

The src and dst fields contain the low 32 bits, but on variants with
has_high_addr, sun6i_dma_set_addr() stores address bits 33:32 in the
descriptor's para word: bits 17:16 for the source and bits 19:18 for the
destination. Those variants therefore support 34-bit payload addresses.
Variants without that capability retain 32-bit addressing.

> Do you means only descripor address have 32bit limiation, other have not
> such limiation?

For the current driver, yes: descriptor addresses must remain below
4 GiB, while payload addresses can use the wider range on supported
variants.

The descriptor restriction is not necessarily a hardware limitation.
Some variants also support extended descriptor addresses, but require
encoding their high bits into the otherwise-unused low address bits.
The driver does not implement that encoding: it writes the descriptor
address directly to DMA_CHAN_LLI_ADDR and stores the next descriptor
address directly in p_lli_next.

The patch preserves that existing restriction by setting the coherent
DMA mask used by dma_pool_alloc(), instead of passing GFP_DMA32.
The streaming mask and existing payload-address encoding remain
unchanged.

> Frank
> >
> > Fixes: ec31c5c59492 ("dmaengine: sun6i: Add support for 34-bit physical=
 addresses")
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  drivers/dma/sun6i-dma.c | 11 ++++++++---
> >  1 file changed, 8 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> > index 7704b016aed8..0ef6ed1f936e 100644
> > --- a/drivers/dma/sun6i-dma.c
> > +++ b/drivers/dma/sun6i-dma.c
> > @@ -684,7 +684,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_pr=
ep_dma_memcpy(
> >       if (!txd)
> >               return NULL;
> >
> > -     v_lli =3D dma_pool_alloc(sdev->pool, GFP_DMA32 | GFP_NOWAIT, &p_l=
li);
> > +     v_lli =3D dma_pool_alloc(sdev->pool, GFP_NOWAIT, &p_lli);
> >       if (!v_lli) {
> >               dev_err(sdev->slave.dev, "Failed to alloc lli memory\n");
> >               goto err_txd_free;
> > @@ -743,7 +743,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_pr=
ep_slave_sg(
> >               return NULL;
> >
> >       for_each_sg(sgl, sg, sg_len, i) {
> > -             v_lli =3D dma_pool_alloc(sdev->pool, GFP_DMA32 | GFP_NOWA=
IT, &p_lli);
> > +             v_lli =3D dma_pool_alloc(sdev->pool, GFP_NOWAIT, &p_lli);
> >               if (!v_lli)
> >                       goto err_lli_free;
> >
> > @@ -826,7 +826,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_pr=
ep_dma_cyclic(
> >               return NULL;
> >
> >       for (i =3D 0; i < periods; i++) {
> > -             v_lli =3D dma_pool_alloc(sdev->pool, GFP_DMA32 | GFP_NOWA=
IT, &p_lli);
> > +             v_lli =3D dma_pool_alloc(sdev->pool, GFP_NOWAIT, &p_lli);
> >               if (!v_lli) {
> >                       dev_err(sdev->slave.dev, "Failed to alloc lli mem=
ory\n");
> >                       goto err_lli_free;
> > @@ -1345,6 +1345,11 @@ static int sun6i_dma_probe(struct platform_devic=
e *pdev)
> >               return PTR_ERR(sdc->rstc);
> >       }
> >
> > +     /* This driver uses unextended 32-bit addresses for descriptor li=
nks. */
> > +     ret =3D dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
> > +     if (ret)
> > +             return ret;
> > +
> >       sdc->pool =3D dmam_pool_create(dev_name(&pdev->dev), &pdev->dev,
> >                                    sizeof(struct sun6i_dma_lli), 4, 0);
> >       if (!sdc->pool) {
> >
> > ---
> > base-commit: 93f51579e7df248780214094418f205253383cc5
> > change-id: 20261021-submit-sun6i-dma-descriptor-mask-v1-35bb381b932a
> >
> > Best regards,
> > --
> > James Hilliard <james.hilliard1@gmail.com>
> >
