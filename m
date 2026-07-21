Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA06E1DED40
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 16:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784650510; cv=pass; b=i8amAQrPOMyi6p6v+FaBLQTAshGSOU6ANUxxe6zpzPmUllWVH/XkflG4pTnV6vUNP96TEjy1IFboQ4LeUG+UZB8L/11aQmiGRlnlYG/ANXMZ1inHJxU82B0euhDCI//CuvHfAMgjS22+GG82qTNONDHVHhq53+CSuy3ae8OuJhE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784650510; c=relaxed/simple;
	bh=0InRp8yvnqBOseUQfGY/Gg1FmgI4xIQDP2NafwpfDOw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c7fwn1pxph4897I1BSqFZeWtpGW2xwyrUvI6bxp2DC+W3lSZdN2E9mPlJ1FMLINzD6rhXByl/3YyxecpcPt8bspVWC4Gg+PUwvnvRXkgaKDK0qWhba1nh4xA+0Foojqe2hSvNCjURx8f6H2J0iUf056NQZDW7ij8eV/rGuX2Iq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YPAauVAU; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YPAauVAU"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ceed7018c8so54188465ad.1
        for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 09:15:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784650508; cv=none;
        d=google.com; s=arc-20260327;
        b=H/758xzcm3ENNIdvJIqpA9rbmGeU0F5sEGLMxK+1XScNWMBAjlg0xkTE6X5t1FaXEd
         /2nhLfaE/ybj2NhupItPO710mTbqSuGh9V61UjkqwwW0ctFHhucXjVbGqX7WbXpO+eFF
         ana40pXOR28OPRDe3BgHmcdRDM0Dh8imwjMUwVtHIG2YNYmXbkiP2bKz2vDlYx7vA47e
         +NyqPq+cDhHb/urWR7/yL7eU0JDq18WHD7Y9ZFBy2tNob9Bg5lrpzTdIihm/AHE/0u7I
         eXPVkY/BRzd7S/qqIX1lXTuTQJa+VQbEfYSSrZTlISMte4MvHm5HrPh1BgWqIR9hxwyS
         vwYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IgNXR6G7FgCbu0VjOkM5rLom6H5zjJdGl0GKEVlbeWk=;
        fh=wToROD5aiEjg/IHgjN6o72HjMbq1WK3BLL++pjcHtXQ=;
        b=Bfy6FW7MVFHS5FnUm7wMsCxhGt9s0GzwRu4Yy2sIUSfkks9lLySaeOS4Tg9mF03Flc
         SSZTIsQPgIM3hYxBZHFoDU7dOe++Dd6t3iildjRLHgOsyKj3okK/P9Mv+OomOD0hoNlK
         2FVqBD7/wAElTSdthLMjwFt3cosfNqBaCx0UESPqpDd0LTH/TQEczd2BbsqALe/SMeoy
         ht4g700EOmuQoxlhlXavAHSYTYlflC/k7dOZdHdHV9BLTws1R54f0bvYLO0vy/KwY7ea
         vdnKxcwIFwsGpGRVrvv4jaUWWqHqWm89l00WcAYTSR3VkYSy8QC2Ef35gmdQ20OvJjtJ
         mBbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784650508; x=1785255308; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IgNXR6G7FgCbu0VjOkM5rLom6H5zjJdGl0GKEVlbeWk=;
        b=YPAauVAU0Uo+Yi6+TbXsDpO0loTn9MWqTJDEsyuMbW/6tEfraOqvV7D3tTDuphCx0q
         KoN5YwFF3HZhokq2VeptYJNNDBLNBFOOoh25TMtiGLK1MkjdjxG4p1dM/1Cccu+k3IQU
         kIaRq5zH8lTuLa4+89Fc4d108RshWJkhzLl88hR1yP6mTNGQEk4/DU5THDF6stpeeHfz
         BtsyITG5j4kwrqainAGSQ6zo3Y2I75Pm66pO62ugyhA8lv7TyevPWgbaub6z3d19dOM2
         bQoMiGoRj9NXEKckDlE46tbK2mKzq4Jx8BVlbDyTw4vSJjtaDepIbv4PBAGu1D6ub2oT
         74LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784650508; x=1785255308;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IgNXR6G7FgCbu0VjOkM5rLom6H5zjJdGl0GKEVlbeWk=;
        b=Sxt8et31QJU3WUtQ1hidO+Ns310rOBmaNpTasioIKQkJsWUsQwuPi4Gc7ghrSOBtBR
         HwpMYcrcLB/IlvD0uQP+ToFf12ZO5fUYCtr4yMWSsEChYg/IUtmLgjy7TO3E8vB+/flk
         qMJbPmoqre4uoryBZxdCzRQJSbWf10nU610FeWG4g70Sv27eRHluPoQuvqJqSbn2BHOJ
         ktFarDWxO2Vlnk1CMsmemZnXwJZEG+ghQgR13MM+R/qwLG3QCzk+N8qm9iXIU2Y8KzEU
         fDk5P1AGwo3SBTMtzB1cur6BQnDGH6Ehjg0eD36TSEMCmMSXMvqVFDdo0NbxHeQ3XowW
         ZMbg==
X-Forwarded-Encrypted: i=1; AHgh+RoQR4riefGeVt15RyaCtJlFlq+e1g7TXFM4hCSx4AXAzdjEb49A/32JyC2mySubiip1dka2wnV7ee0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVoAbudjwT83AisI19WXSzSs8kb36c1v9jlH+K0ayJC1fqkPCu
	+KQvxgSS+kp/J7Kz6ds2r0pyqvkIcWpWFFbwRSXYiN7gSbOhspO4kezHip7aneDcwwvlN+dOGcl
	4xKFs4o5qG4fJtZumUBdZAL1qXt+RQk8=
X-Gm-Gg: AR+sD10voApRtJIrFYjp7caABZirpaObDhXGWbXag/JRvr11OgykeNeDEHihLFxkKfD
	FCXHis61u/pV32bdoS/UEDABaUM1GqZ8Z5oFpRIuP17x0AZD4KIsltFoETUoCQ/T/RNDBRfUsaF
	rp0t3SzJf6FMWxI4vi6eiaAalS8I6rDN0eLa03MXOJ2aX4/eIkh9IlyKyTMkim0dnMtdn+X1JQw
	u3BMk+VpiCtv5ARuu/GnWIaORr4r1jCsxHxc63roGNOsBtUqunYZfRWZFsGj2EnHMwHHfxOXilu
	fjKyVWP6+/tJwx6IFjQ=
X-Received: by 2002:a17:903:3b85:b0:2cc:777f:d67c with SMTP id
 d9443c01a7336-2cf3488b0d2mr200606075ad.13.1784650508072; Tue, 21 Jul 2026
 09:15:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720142538.2766-1-mahad.ibrahim.dev@gmail.com> <CAJhJPsVj=pntghpDvzwcNj4hm-7Uu0bD+Uy-4b3Okw5Sq__JQw@mail.gmail.com>
In-Reply-To: <CAJhJPsVj=pntghpDvzwcNj4hm-7Uu0bD+Uy-4b3Okw5Sq__JQw@mail.gmail.com>
From: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
Date: Tue, 21 Jul 2026 21:14:55 +0500
X-Gm-Features: AUfX_mw_f7fhOlKyg76JQf_H1QYuX81oqzcFrWW8btfyHfWvpPtDACpY59Lwjv4
Message-ID: <CAHpOaLADzSJqSF6=oue2gwrszNAv_mv_XTG2GM5J8Np-+i+Edw@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: loongson1-apb-dma: fix residue calculation for
 queued descriptors
To: Keguang Zhang <keguang.zhang@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, linux-mips@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Keguang,

Thank you for the quick response and feedback. I'll adopt the single-loop
structure.

Additionally, Sashiko pointed out another possible flaw, which occurs when
the hardware is idle. The hw[LS1X_DMADESC_NEXT] of the last terminator LLI
in a chain is 0 and the current next_phys the hardware returns with

    next_phys =3D chan->curr_lli->hw[LS1X_DMADESC_NEXT];

is also 0. Which would match, however I do not think it's the preferred
behavior, the residue would only be the length of the last LLI. If
you wish I can add it as an additional patch on top of the single-loop
structure.

Best regards,

Mahad Ibrahim

On Tue, Jul 21, 2026 at 12:32=E2=80=AFPM Keguang Zhang <keguang.zhang@gmail=
.com> wrote:
>
> Hi Mahad,
>
> Thanks for catching this use-after-iterator issue.
>
> On Mon, Jul 20, 2026 at 10:25=E2=80=AFPM Mahad Ibrahim
> <mahad.ibrahim.dev@gmail.com> wrote:
> >
> > ls1x_dma_tx_status() locates the descriptor actively being processed by
> > walking the LLI list and comparing the hardware reported next descripto=
r
> > pointer against each element's next-descriptor pointer.
> >
> > A list_for_each_entry macro is used in the comparison phase, which
> > internally expands to the container_of macro to find the current
> > ls1x_dma_lli's next-descriptor pointer to compare against. However a
> > problem occurs when the loop reaches the final lli list element and wra=
ps
> > around to the head. The head is a different struct ls1x_dma_desc. It go=
es
> > down to the offset the node member would be at in ls1x_dma_lli inside o=
f
> > ls1x_dma_desc.
> >
> > This leaves the lli pointer somewhere inside of ls1x_dma_desc at the en=
d
> > of the loop. The subsequent phys debug value read therefore would print
> > garbage as a valid phys address.
> >
> > The primary bug occurs in the residue calculation list_for_each_entry_f=
rom
> > macro. The lli pointer still points to somewhere inside of ls1x_dma_des=
c,
> > when the list_for_each_entry_from performs the same wrong offset
> > calculation on ls1x_dma_desc to determine the stop condition of the loo=
p,
> > it lands at the same offset that lli pointer is on, and the loop
> > immediately stops.
> >
> > This produces a 0 residue value, while it should be the entire length o=
f
> > the lli list chain. The driver advertises DMA_RESIDUE_GRANULARITY_SEGME=
NT,
> > so a 0 residue would mean the transfer has completed.
> >
> > Found by the following Coccinelle check:
> >
> >   scripts/coccinelle/iterators/use_after_iter.cocci
> >
> >   drivers/dma/loongson/loongson1-apb-dma.c:461:6-9: ERROR: invalid
> >   reference to the index variable of the iterator on line 450
> >
> > Note the check still reports this line after the fix; the remaining use
> > is safe (the cursor is only dereferenced on the match path, or reset to
> > the first entry otherwise).
> >
> > I did not see a bug upstream detailing this error, nor do I have the
> > hardware to confirm this bug or error, all this is from a pure code
> > examination.
> >
> > As I do not possess the hardware, I cannot test the patch. Compile test=
ed
> > only with mips64-linux-gnu-gcc.
> >
> > Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
> > ---
> >  drivers/dma/loongson/loongson1-apb-dma.c | 15 +++++++++++----
> >  1 file changed, 11 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/dma/loongson/loongson1-apb-dma.c b/drivers/dma/loo=
ngson/loongson1-apb-dma.c
> > index 89786cbd20ab..8bb6e6e5719d 100644
> > --- a/drivers/dma/loongson/loongson1-apb-dma.c
> > +++ b/drivers/dma/loongson/loongson1-apb-dma.c
> > @@ -439,6 +439,7 @@ static enum dma_status ls1x_dma_tx_status(struct dm=
a_chan *dchan,
> >                         struct ls1x_dma_desc *desc =3D to_ls1x_dma_desc=
(vd);
> >                         struct ls1x_dma_lli *lli;
> >                         dma_addr_t next_phys;
> > +                       bool found =3D false;
> >
> >                         /* get the current lli */
> >                         if (ls1x_dma_query(chan, &chan->curr_lli->phys)=
)
> > @@ -447,11 +448,17 @@ static enum dma_status ls1x_dma_tx_status(struct =
dma_chan *dchan,
> >                         /* locate the current lli */
> >                         next_phys =3D chan->curr_lli->hw[LS1X_DMADESC_N=
EXT];
> >                         list_for_each_entry(lli, &desc->lli_list, node)
> > -                               if (lli->hw[LS1X_DMADESC_NEXT] =3D=3D n=
ext_phys)
> > +                               if (lli->hw[LS1X_DMADESC_NEXT] =3D=3D n=
ext_phys) {
> > +                                       found =3D true;
> >                                         break;
> > -
> > -                       dev_dbg(chan2dev(dchan), "current lli_phys=3D%p=
ad",
> > -                               &lli->phys);
> > +                               }
> > +
> > +                       if (!found)
> > +                               lli =3D list_first_entry(&desc->lli_lis=
t,
> > +                                                      struct ls1x_dma_=
lli, node);
>
> However, I don't think falling back to list_first_entry() when no
> match is found is appropriate. Since next_phys should always match one
> of the LLIs in the descriptor chain, failing to find a match should be
> treated as an unexpected condition rather than silently falling back
> to the first LLI.
> I would suggest something like:
>
>        scoped_guard(spinlock_irqsave, &chan->vc.lock) {
>                vd =3D vchan_find_desc(&chan->vc, cookie);
>                if (vd) {
>                        struct ls1x_dma_desc *desc =3D to_ls1x_dma_desc(vd=
);
>                        struct ls1x_dma_lli *lli;
>                        dma_addr_t next_phys;
>
>                        /* get the current lli */
>                        if (ls1x_dma_query(chan, &chan->curr_lli->phys))
>                                return status;
>
>                        /* locate the current lli */
>                        next_phys =3D chan->curr_lli->hw[LS1X_DMADESC_NEXT=
];
>                        list_for_each_entry(lli, &desc->lli_list, node) {
>                                if (lli->hw[LS1X_DMADESC_NEXT] !=3D next_p=
hys)
>                                        continue;
>
>                                dev_dbg(chan2dev(dchan), "current
> lli_phys=3D%pad\n", &lli->phys);
>
>                                /* count the residues */
>                                list_for_each_entry_from(lli,
> &desc->lli_list, node)
>                                        bytes +=3D
> lli->hw[LS1X_DMADESC_LENGTH] * chan->bus_width;
>
>                                dma_set_residue(state, bytes);
>                                return status;
>                        }
>
>                        dev_warn(chan2dev(dchan), "unable to locate
> current LLI\n");
>                }
>        }
>
>        return status;
>
> > +                       else
> > +                               dev_dbg(chan2dev(dchan), "current lli_p=
hys=3D%pad",
> > +                                       &lli->phys);
> >
> >                         /* count the residues */
> >                         list_for_each_entry_from(lli, &desc->lli_list, =
node)
> > --
> > 2.54.0
> >
>
>
> --
> Best regards,
>
> Keguang Zhang
