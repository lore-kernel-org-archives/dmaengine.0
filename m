Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A92429028
	for <dmaengine@vger.kernel.org>; Wed, 16 Sep 2026 19:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789587292; cv=pass; b=jmydN9R0QvK/1kJlBXVqjZuncrRoQfekvHqodvECTTqk7I+9wHeUxdyjJce1O444ONs/NdKlWRn0v5c0G/TkrhZqAtfqbut3NkG+Sd6ikD0L3xK6GuQowfdWAiXbn9CBTtU65ETWOt6Dauy6xygJUyUygrMIQzOaWKXlPetk8dQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789587292; c=relaxed/simple;
	bh=lbkr1e+oVHmAXh9PMaJpKET/ZPWCaHqCdzTnFjKanZw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b2qFFkBcwZkaB+d8C6Aqhr8F2Ier7KLioNWTbSzNocT6nevLsVXKKtFdex0hfX9xMDmZWPnPCvcdBajHo6ubw4MUTN7114zKqGRCeziKAiRMX2s6QfCktiybnDyDq06ojBAVhIs5xAMVjeHtdyc/otUynSRILN/e9vFpVl4yqX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UF3mDb/l; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UF3mDb/l"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f7dbfso13936466b.2
        for <dmaengine@vger.kernel.org>; Wed, 16 Sep 2026 12:34:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789587283; cv=none;
        d=google.com; s=arc-20260327;
        b=RSTUBH9B+YMXDbxJFsfeOWFLPVSAUeQL/U/hgnGkNoNdv642Daf3FEB3ZOZwfopPms
         IxU0OLHWQL42qxvZrystWYAH1hFzL05qrdynyC40VL0SwWLM4h5nuyP1aPvC6YtNJnVo
         7ojAY8HKmkEWihmbDngZxid9KFfYwZWR9CxdHFsiZmgehBrQNn7wRi2Z8XQoWkAUm9O8
         azqdc45X5vx1vHU7odf/s1SeES3eLXM1bCYbl9bzKMtGTgA6j4KaTT6FEEDpTH8VoFm7
         3iu/8DY3BmNv0qpdceTuEYY48Hf2MsU54oiizxtFpSTO1JTUpa6MBa02vmxTo7LGnIrT
         So0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g1Y9KLbKJHfx489zL13A2Cg7pSCrSzAZXPuS+c+f7Y8=;
        fh=Cwan3+mv1FJ4Cbo+uoaqlddyynQhyteBIS2H06TqPeY=;
        b=gkIleawarvgiC5zr9sQsJe7MpW4sz04tmL+8P6M0bx4cP0MtLTKRcpRbSKYZnsX7vg
         o51tTlc7RMf2VeaJEcbQhO4vdtmgIgTncDxEc0s4NHlpb/i5nGkEGUjQuzKJDpOkXmIr
         xKigdnW4d+WjLyHfb1+I27yysaMXu/dDSLKU3+TwTNDdxabfE/hPMRseEDgSvQagWvbZ
         IoDpI3vs6HhiDdktVGVSHCuX56eTMTH6ax0kIYN7iSbThNYPOTKXcYfAqDwMM0d2fLE0
         T8ocT6mrahcqfv0xiDUvwRYuW8H87J7sSfIUbTtAyJpddt91iVHCg8M6uZALqPb9TRNK
         nVrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789587283; x=1790192083; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g1Y9KLbKJHfx489zL13A2Cg7pSCrSzAZXPuS+c+f7Y8=;
        b=UF3mDb/lSlH04u4IJ0MaVvp9Gm3tTVJ6/5EOD/Qq38QSyfxWpcL5PGtiaWDWyus0od
         MJHN9ZHDJiVhmhi+WJX3JafnEqwhfOS9r8yrINqeRIdZUkynYgTrnNmCmW/R28To/In8
         4/iUvBVisv2vqco1In+ZpStb9gT3J9MCTe+L/xJYO0XZIdF2PmSKNGYSR7m7zJkMFpKg
         5AUiknApoQerFQ1qnqcSxy0iW/wSjdFwbE5DeOcfWqwyXyMooAw7u4sAcNF2ZL3+QrJ2
         Xb6W8CTjeFDsLrjjVSgUGG9MK9tJr6vtvK6MHG6Z7I1XOH0gWisA1K2seKTdhTx4wW/Q
         zqCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789587283; x=1790192083;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g1Y9KLbKJHfx489zL13A2Cg7pSCrSzAZXPuS+c+f7Y8=;
        b=mloVo49VPFaYvecosUJ61QHporYKfDTKD4vjptigC/8Cu2q+wUAW+kvL+Mwt5+ASrS
         QAJbqhbl1NZtgyfl7IWmyhLbmlar52bdiaFr9Kqm12Erq/a8qWA7O4r1itPVgFdzuMBJ
         0IRbfNI+fcILVb1F7/DvdS5Gnk5oJxsFL/Jpe9Tw2UdvdMYNeuI5NBWy0zSi1xhpQ9Re
         M3tRcbyJNWfsu9igglu8Gm4jTYOBfrrr8kJOTvvL7XyGGIMrcmzSWhuSRIo/OdTn6IV1
         8Hgg2l82soVSpl8ZfRRGChoi5B6kUnziGYuE4lMWvs7MCfdI8WCLWIBIb4WnRt7VQ5n/
         Px5w==
X-Gm-Message-State: AFuF++nk89JAjQGFbXdd0CgDdG7eApa+bGor94//aMskYDzNQeDRzzPO
	Zm3c6ETg5xav6mhv/qpTsWbDYhrjyBqnxyKnellqp0bfPsFcF47fA/N2lJUVMvaavhQh6qhhHAc
	d460gQw2Lfi8922+sIYigWVCDwXeNfls=
X-Gm-Gg: AYBFou2CKwITd2DTNevlpLpUWvnkgNv6iIJtXLACEJq6uLuJ45Tot3wNwM0JT758Ke8
	C+qYBaAesOpzVJEjKol6Q619UAJ70ONM2kAsEetJ07U5LhOcy+U/XuIlOFkX+IG6DadzafUAjBx
	fqecdxupjWbo/yKoHmEg9GOLOHDm7Uc6Z06BRnvN3r24XTfnDA1dgQMu9Vd5SIXQAFVbUCJmdnu
	AUOITTrD72GtXVY6hWkdhkbn6MhhtF0gMHjf00luGxGRTW0p6NNUwfZGtYwyAD6PbG2QpxR77kh
	3POxMAQfAv5deTIihLmNpYWk56MPugW5GqTKGXlSGH/ycCp8IBzYY9UBZTeoFM/MXzKKGXy+lzG
	3VGf0od8okJ6/Quo/EC52LU0E/1hkt2P0Qzl6j+x/P/KxRfLGsIHcNAiQp1TY2s1EPlqN0318DV
	T6IUBfPyv2OhBlDNDU21YC5iFsFie0FTBqZFvlZ8Qh0HgQD4JXhMbmAlNdthhN8hodQQ==
X-Received: by 2002:a17:907:3fa8:b0:c15:f26a:3438 with SMTP id
 a640c23a62f3a-c29e5392d27mr271360466b.24.1789587282657; Wed, 16 Sep 2026
 12:34:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916182608.13523-1-rosenp@gmail.com> <aqrpAlpvHWTi9eGI@SMW015318>
In-Reply-To: <aqrpAlpvHWTi9eGI@SMW015318>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 16 Sep 2026 12:34:31 -0700
X-Gm-Features: AcwNN1Xbx_JJZ6j4oUjA6U9H3g3nle4kXaOU00QLrD790RcfaMDYk2LY_Cj838Y
Message-ID: <CAKxU2N_bJJijZ7QLx=ubaVWA6Mn=q7tswKj=mE8NFJXz=Uf6RQ@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: mv_xor: protect MBUS window access with a spinlock
To: Frank Li <Frank.li@oss.nxp.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Stefan Roese <sr@denx.de>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 12:07=E2=80=AFPM Frank Li <Frank.li@oss.nxp.com> wr=
ote:
>
> On Wed, Sep 16, 2026 at 11:26:08AM -0700, Rosen Penev wrote:
> > mv_xor_add_io_win() reads and writes shared MBUS window registers
> > and updates the shared win_start/win_end arrays in mv_xor_device.
> > Multiple DMA channels can call this function concurrently via
> > mv_xor_prep_dma_xor(), leading to races where two threads can
> > select the same free window slot, corrupt the registers, or produce
> > inconsistent cached state.
> >
> > Add a spinlock to struct mv_xor_device and hold it across the
> > register read-modify-write and cache update in mv_xor_add_io_win().
> >
> > Fixes: 77ff7a706f01 ("mv_xor: Add support for IO (PCIe) src/dst areas")
> > Assisted-by: LLM
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/dma/mv_xor.c | 15 +++++++++++++--
> >  drivers/dma/mv_xor.h |  1 +
> >  2 files changed, 14 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/dma/mv_xor.c b/drivers/dma/mv_xor.c
> > index 0de2b1ad5c30..e7c6ec54ce25 100644
> > --- a/drivers/dma/mv_xor.c
> > +++ b/drivers/dma/mv_xor.c
> > @@ -497,11 +497,14 @@ static int mv_xor_add_io_win(struct mv_xor_chan *=
mv_chan, u32 addr)
> >       u8 target, attr;
> >       int ret;
> >       int i;
> > +     unsigned long flags;
> >
> >       /* Nothing needs to get done for the Armada 3700 */
> >       if (xordev->xor_type =3D=3D XOR_ARMADA_37XX)
> >               return 0;
> >
> > +     spin_lock_irqsave(&xordev->win_lock, flags);
> > +
>
> use auto clean up guard()
Could that be backported though?
>
> Frank
> >       /*
> >        * Loop over the cached windows to check, if the requested area
> >        * is already mapped. If this the case, nothing needs to be done
> > @@ -511,6 +514,7 @@ static int mv_xor_add_io_win(struct mv_xor_chan *mv=
_chan, u32 addr)
> >               if (addr >=3D xordev->win_start[i] &&
> >                   addr <=3D xordev->win_end[i]) {
> >                       /* Window is already mapped */
> > +                     spin_unlock_irqrestore(&xordev->win_lock, flags);
> >                       return 0;
> >               }
> >       }
> > @@ -521,8 +525,10 @@ static int mv_xor_add_io_win(struct mv_xor_chan *m=
v_chan, u32 addr)
> >
> >       /* If no IO window is found that addr has to be located in SDRAM =
*/
> >       ret =3D mvebu_mbus_get_io_win_info(addr, &size, &target, &attr);
> > -     if (ret < 0)
> > +     if (ret < 0) {
> > +             spin_unlock_irqrestore(&xordev->win_lock, flags);
> >               return 0;
> > +     }
> >
> >       /*
> >        * Mask the base addr 'addr' according to 'size' read back from t=
he
> > @@ -540,8 +546,10 @@ static int mv_xor_add_io_win(struct mv_xor_chan *m=
v_chan, u32 addr)
> >
> >       /* Set 'i' to the first free window to write the new values to */
> >       i =3D ffs(~win_enable) - 1;
> > -     if (i >=3D WINDOW_COUNT)
> > +     if (i >=3D WINDOW_COUNT) {
> > +             spin_unlock_irqrestore(&xordev->win_lock, flags);
> >               return -ENOMEM;
> > +     }
> >
> >       writel((addr & 0xffff0000) | (attr << 8) | target,
> >              base + WINDOW_BASE(i));
> > @@ -556,6 +564,8 @@ static int mv_xor_add_io_win(struct mv_xor_chan *mv=
_chan, u32 addr)
> >       writel(win_enable, base + WINDOW_BAR_ENABLE(0));
> >       writel(win_enable, base + WINDOW_BAR_ENABLE(1));
> >
> > +     spin_unlock_irqrestore(&xordev->win_lock, flags);
> > +
> >       return 0;
> >  }
> >
> > @@ -1353,6 +1363,7 @@ static int mv_xor_probe(struct platform_device *p=
dev)
> >
> >       platform_set_drvdata(pdev, xordev);
> >
> > +     spin_lock_init(&xordev->win_lock);
> >
> >       /*
> >        * We need to know which type of XOR device we use before
> > diff --git a/drivers/dma/mv_xor.h b/drivers/dma/mv_xor.h
> > index c87cefd38a07..034db4d0bfb1 100644
> > --- a/drivers/dma/mv_xor.h
> > +++ b/drivers/dma/mv_xor.h
> > @@ -80,6 +80,7 @@ struct mv_xor_device {
> >       struct clk           *clk;
> >       struct mv_xor_chan   *channels[MV_XOR_MAX_CHANNELS];
> >       int                  xor_type;
> > +     spinlock_t           win_lock;
> >
> >       u32                  win_start[WINDOW_COUNT];
> >       u32                  win_end[WINDOW_COUNT];
> > --
> > 2.55.0
> >
