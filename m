Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4075923183C
	for <dmaengine@vger.kernel.org>; Wed, 22 Jul 2026 00:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784680740; cv=pass; b=gzTEZv4E48YdhklNb1UK29E9NrR8TLAybUlpcu0TpIHCOOeb1tf3bTd3x6OC8/4QAtr3KsVTkMQp4rAneJAVp71u4TWzbyDAbHmQjNFmwCNbTPuas9FoH8gf9azZEDA+JMwoW1kh+eJ+NZOCOkNSMaQ1/WYwjMaB3a7/Y3SUN18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784680740; c=relaxed/simple;
	bh=FMHWof+JpKV2/riXKZCdismivtn+cNor229eXE3oeiA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d1etoasLZjQXPn3vm5vho7KQ4raYrqYvrRO8GnKUxgItTUyK/flzQh9ZwFt3CUHDPhEajJMKMrpDuy/YnOWPkTj+DeZhfPcve1NUuKIj0/Y8LS6w96d7vDu14eDR6D1xYMKpXmc4HDOwQ+n6V2sS+c0bWKlCd1VVFLp2Z1pwRvY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kHzkVcHg; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kHzkVcHg"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-69eefa92a1cso1795972a12.3
        for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 17:38:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784680737; cv=none;
        d=google.com; s=arc-20260327;
        b=suq9j4xMFBanQFxMc6u1AB665MFUymtsHMGnu5Bo6OFoiw5JIG+M6JFxZDZj+hWamv
         pGjKjZrDygmOifhXMHxDW0m/O7k3XxuTIkah2ahy3H2NzxAtgei+nQGRuvJu5/SlkRXP
         nF95wLnhjv8GLFZlDfLTdOuySmpYcmQ2tc8Qdkj4lsm48bI9K0ub/L1ilnoTRemHX0QX
         LH/GNsi9eSJyCnKxLvU2Q64ZpR8ZdXPSnEnNNipt9ls9yEwL3pyqHxYYJCH8ZL8IRoZ6
         dP0R7BKf6TavhjvcLec0UoNwuq+yI9AIFdpxnqdKdZ9r1sESIgEIktNA6Jp+maaqa5dF
         qV1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=azkuUllNfDrFdgH3N+ddf8hDBt/c9sS75yI7yHLGenU=;
        fh=iapLhjvYRws+p1CWBpwLtTYleyiTiy6Mm5WnFfee2YA=;
        b=EqlC1UBgJkPSx+5IYUA1phUPgU2Dt/fZt3LH16FBsvRd+6vikSS1Nd2bRZpGJTqNuO
         dzbMEytCJbQJ8VfljcQ8NBPjvx5KrSCVnop/2yTAsojtU7ajr+b5+o2QExZ/ag43cdMI
         Xr8lAiAI0wBrvWiRrCYEhgyva9sWlqxtXiExrxB0XFiAjZ/mlJpDL/TgSKX1qk1YJzXv
         gUpk8xB0nyJ+Q0h21ojSmS2JNGDsXoAxmWoRB0FqPLbAQV9JSrhzfKTpQdlkywIusEaV
         0uPNbnoutq7hPutqag3mPOzDN3trQa3FFOy5vSqvpvNgIB71P+B9qoHL7WnPWeWLoK/F
         XJtg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784680737; x=1785285537; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=azkuUllNfDrFdgH3N+ddf8hDBt/c9sS75yI7yHLGenU=;
        b=kHzkVcHgIl77IXtqqiTZF66W29hvMiSzpL8gvTv10NpeiKl635oXcSmVI6LSV0Ggyk
         +2EA9LoV4n/c/ZSaPEQvhP66h+aRhSGWZk/uN6LvPtS/40sKYQJls6Af54LOb4CBckL8
         UH1PTkDUbpjXY/k8+egz6zSky5tmidNpD3OuhTaSQH9sRy/ZFWEabvl1J9dHLzHcAmlJ
         diOyBHgySUP+btOQSafkYNbknqCsLhw+txJInHG1OekpEbDDGK+dYyx0dSzjr6O/PJdL
         xo5x/F7aNPiD6pt9hUGgRdIj646V87eUCN4+9WE/+3KOBHQqRVZ3n5Noh/srgJksa7hr
         eXww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784680737; x=1785285537;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=azkuUllNfDrFdgH3N+ddf8hDBt/c9sS75yI7yHLGenU=;
        b=QohivJq5X9c/TXG0g8uFZq+6Qz6ijX21qITrXufrIOXC3XdHowzwFDTMUSCGUv6fP0
         WI03HsNzUV75Ib7N68ExIH1Aj8E3ZLBcNJxRJII1Bu4Eacezi4SvUPt6mnrKWiLY+I78
         yOPxMMZ/EiY3znaccIPITQC8M4d69zFX/QSim0IlFIAM/9ZZG1+QK7ZEVPmq9Wd2qHRJ
         9Eq+Sj4S/nbeuo+0EorMZakfBeCupk2XLeYV5VhocvHC4dVBwkI8LrZDR9g9c/EX9Kxc
         dfh8Sp8XLqma2Vc+5x/gVITdA0YAGa1JL0jMQRPO+EeMHTjdwguyMO9aecrKAPrvr4SB
         MU8A==
X-Gm-Message-State: AOJu0YyZU4TLDNYTHQ/I8onsNj1UtcYUq7Yob6b6i0j15fJbJzNVWd7Y
	p5wVm2kjzDcxsHksZmpRg0gpL3V/H/37CV8lIfguwNEjjVI6MDd83xyBcGtZh/vS4XxhGAHvjid
	5fGxjvE4gIHCOUJAHimaMCkr5Qlwia+Y=
X-Gm-Gg: AR+sD12l7zbz7Hd2N5/tzOKdykN0P7rSoZvFrWdj+YMTsSWAIPTyv/jM12TQP59x48g
	1wvCbNvbRY6vojSb9x4TvF5NxgalNUM63A0B41GNTVCXOI+mCsXcJjGu22A5ata1bpe0yDHO4Yk
	spSNx74Lh/Bsw7jiN6TmaX2Acjrggvi7e9AbjBz32dk+Rrt/rLw9Dg8j/Vm+Vyoxlp02h3dR4a1
	odfA2OCu/ovjtNwcEflPjhj0bMEPm2blezlZk8yM6Vs1jNkwQrF8CRJjz9YELqNWUAfMtl6lJPc
	fEjy9zzVOfEn9GH5fhitpNBpIdUMPBEZpaXXy/HZQxbrfqSyMPE7wvPC+uZ0PyHnPnfhV6Ghtax
	EK1r0K+Vd5TTj519LLX7kNXY0kwxbnwXfn4cRow6vjPO7YKi1lo1iTPtGPI3Y6tG1bfJLbwcLGk
	J3bw6T9oc=
X-Received: by 2002:a05:6402:a0c4:b0:698:36e2:f5e2 with SMTP id
 4fb4d7f45d1cf-69e65272739mr6485414a12.13.1784680737382; Tue, 21 Jul 2026
 17:38:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721221807.664865-1-rosenp@gmail.com> <amAIK9HrKUidNADC@SMW015318>
In-Reply-To: <amAIK9HrKUidNADC@SMW015318>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 21 Jul 2026 17:38:46 -0700
X-Gm-Features: AUfX_mxQBpiKozH2WHw7TjNSoCrxEo97lTEk3F2ip_ClDmDH1rOxXL4kU6OyDYE
Message-ID: <CAKxU2N-kXn2_-VZ=Lh3u2W9yqdik+dG9uXqEoFCKRS9z1rC2-w@mail.gmail.com>
Subject: Re: [PATCHv3] dmaengine: fsl_raid: check fsl_re_chan_probe() return value
To: Frank Li <Frank.li@oss.nxp.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Xuelin Shi <xuelin.shi@freescale.com>, 
	Harninder Rai <harninder.rai@freescale.com>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2026 at 5:00=E2=80=AFPM Frank Li <Frank.li@oss.nxp.com> wro=
te:
>
> On Tue, Jul 21, 2026 at 03:18:07PM -0700, Rosen Penev wrote:
> > fsl_re_probe() ignores the return value of fsl_re_chan_probe() and
> > unconditionally increments total_chans. When a channel fails to probe
> > (for example, an IRQ mapping failure) its re_jrs[] slot is left NULL, y=
et
> > total_chans still advances, so fsl_re_remove_chan() later dereferences =
the
> > NULL pointer during device removal.
> >
> > Check return value and only count successfully probed channels, and gua=
rd
> > fsl_re_remove() against NULL entries.
> >
> > Fixes: ad80da658bbc ("dmaengine: Driver support for FSL RaidEngine devi=
ce.")
> > Assisted-by: opencode:hy3-free
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  v3: fix sashiko review
> >  v2: fix description
> >  drivers/dma/fsl_raid.c | 24 +++++++++++++++++++++---
> >  1 file changed, 21 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
> > index bfaef6245695..66de27eb4365 100644
> > --- a/drivers/dma/fsl_raid.c
> > +++ b/drivers/dma/fsl_raid.c
> > @@ -841,13 +841,30 @@ static int fsl_re_probe(struct platform_device *o=
fdev)
> >               for_each_child_of_node(np, child) {
> >                       rc =3D of_device_is_compatible(child,
> >                                            "fsl,raideng-v1.0-job-ring")=
;
> > +                     if (!rc)
> > +                             continue;
> > +
> > +                     if (ridx >=3D FSL_RE_MAX_CHANS) {
> > +                             dev_warn(dev,
> > +                                     "too many job rings, max %d\n",
> > +                                     FSL_RE_MAX_CHANS);
> > +                             of_node_put(child);
> > +                             goto done;
>
> does break work here?
Oh I see what's going on. A different commit I have adds another goto
label in this function. I'll rework.
>
> Frank
> > +                     }
> > +
> > +                     rc =3D fsl_re_chan_probe(ofdev, child, ridx, off)=
;
> >                       if (rc) {
> > -                             fsl_re_chan_probe(ofdev, child, ridx++, o=
ff);
> > -                             re_priv->total_chans++;
> > +                             dev_err(dev,
> > +                                     "job ring %d probe failed: %d\n",
> > +                                     ridx, rc);
> > +                             continue;
> >                       }
> > +                     ridx++;
> > +                     re_priv->total_chans++;
> >               }
> >       }
> >
> > +done:
> >       dma_async_device_register(dma_dev);
> >
> >       return 0;
> > @@ -875,7 +892,8 @@ static void fsl_re_remove(struct platform_device *o=
fdev)
> >
> >       /* Cleanup chan related memory areas */
> >       for (i =3D 0; i < re_priv->total_chans; i++)
> > -             fsl_re_remove_chan(re_priv->re_jrs[i]);
> > +             if (re_priv->re_jrs[i])
> > +                     fsl_re_remove_chan(re_priv->re_jrs[i]);
> >
> >       /* Unregister the driver */
> >       dma_async_device_unregister(&re_priv->dma_dev);
> > --
> > 2.55.0
> >
