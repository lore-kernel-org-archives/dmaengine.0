Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B633BB689
	for <dmaengine@vger.kernel.org>; Mon, 20 Jul 2026 20:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784578547; cv=pass; b=HM2U35pLhBz2K0pILw/vJfTWdZWMi2owvKUinKsxhMkE+zgx6PVuLtdJLSA6ydAgRYbDW/mv+4Ll4vtgXnqnAXN1SI/PJiExEKN7/j5WMhjKyUZZt4ewQI7A3zevST8beLdKEWVb1cp215ojWsxhRqdmHkxmOfz7xWxGrjJEwWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784578547; c=relaxed/simple;
	bh=0p2kZAYpFIdpVlA4mjNIjxG5VWs/PTrv0Gds/Ia39cU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dmv9CAEeaEnT7wVtfkZ3NSoQI2E4Gzgnr0lNfgvB0/OuTpQOg6ovW8e/Q/UrolHwGklgake7B4r9phyhYTlYGhrINdV96RUmcjxZ27PqvtmNOuih68PJApFHUE9PW3fObjoP3C2rAcMhBAgXbMqmqDnUjvBEiOg3Fsb3ujZ42K4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NL7+kInR; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NL7+kInR"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-69ea0595598so2244344a12.0
        for <dmaengine@vger.kernel.org>; Mon, 20 Jul 2026 13:15:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784578525; cv=none;
        d=google.com; s=arc-20260327;
        b=b73E9rv8BDnFWCfdhTkM4mtHVWsTK3LBi1dc8WJNDdRAm2/8fGqLeyZ4qoLBceXJDd
         0q2A7n6SPSjz5Wp42hJt+ObTdZe4cdZ7dxOX6l1ij57jr2IIcmR3BODv0vo0Jjc/x9a5
         IDysrtEP4O5qnuCE/AyGkPMKUx3uLXN2alPHaCJczkDtT4keLALzxjnI9WvQTZ/ymP95
         Dx+swdNDuoW4Y3dlnvYkZmyLzP0GfZIfzHMmRlmslqExD6/7+MJ2dhFHsQ5QT5tQb4jx
         cLJu7PGTE3zo1HyXBt1fi+hKHvn2FF361nbwuUi9DoWYDJ29ftZIEZYobsKA5/DfNNse
         0e5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZQb7PpL27JnCX9FypSAlU8E4iu976fO6fazIkBgl3Gs=;
        fh=iapLhjvYRws+p1CWBpwLtTYleyiTiy6Mm5WnFfee2YA=;
        b=mUU07rlgAhB5mSzbjjVzq5RcTiWw2kptyaP9swxD6EcZRvh0VtyvoYOhTYjNtaDpS8
         SIJ/e2KIPyQ+xS4/RHL6LTOcL7eNG6ZZzsRfuASg+EimPGQGrYvM+rCa3tveL6phlIgV
         OMtXnW0t/uzSU/mx9vJ40fGTVW4El/u/Ilw64h4p3PVHRRE08RIx9sKkoVksxM4NTwoJ
         h9ng10OpOHjxicw0Gr34xc7TpU4J/nysuBw5L5Z27R8518TMZ/XlJU2DUzSyG+6qfl8X
         FpiyhXPFqRUerdu0s2g61/fiB7uTxm/EhcL2C0NtZrinjYDDQpI4GzI/lur1dn03Eiu8
         u1JQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784578525; x=1785183325; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZQb7PpL27JnCX9FypSAlU8E4iu976fO6fazIkBgl3Gs=;
        b=NL7+kInRFNV6iB/E2A+taOIX5RHgVJOM2X1w9HZenVmkc2l/6oR/EW+HoPUy86jwsI
         UP73aGeojP9ZVuTGVsA/DFAiEMz9+JCs/O2ZghAThUCm0necZpIxwM3iyYejDqQhGPGT
         8lEjD+bpKbE0y2nzL7biFE5WiILabRD0g+0WUvTbYoot6zUpdPDv6+EoAQT2s8412EI6
         IUS9hILkv58NISEoWqQAEn/+gUNlr2f0Q/VGM/6JhJuc7+UzTLY/c2ugu4oRhB1DYquB
         rxO4PiFJJ5X7yJkqjn4LBGEJGBf3tg8x/DZJc556+BWTW5b+rH/pgKJOBE2WAEem455y
         mbVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784578525; x=1785183325;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZQb7PpL27JnCX9FypSAlU8E4iu976fO6fazIkBgl3Gs=;
        b=NyYMfp1KVO3jd85VMoOUZUygrLUcjnWLz0MQC5bb/Ru+XMR2LX31HKGm3OpjoZ2YSp
         RXi87pJ4NxFXeOeQv9RGKa9Xw5K1m52X2P47qtjS3RG/JxoPtR893tnYdlloPq2cZP6h
         Hoal9qcqceUpgBx7dpkHkV/GBoEiJb5ku3U1Cudn0B8o7w8fWRlawUBDbU8Qjj8y9aOh
         J+sR+QRQN6J5V2dloH1c9bqqobfJgFRXLX5BD5PAfQoVi5NYV15I0gEL0Jd8v2vDHXNe
         mgaaf+8qfpMG/p4z/RUACcCoS8bF0cZxADeGN3/5iO+IWeH5RKdlS1t1QQ9NmC7OVDp1
         4jHQ==
X-Gm-Message-State: AOJu0YyEZsMff+Q9v/oN98Rzo2yPIuhr53WkqFRSOGronQpmXwKYqd2p
	WeujOl5N7Cxv+RbOQOXD60It68EtAaWSggpvwOxrDWXxyETGvmF1MdpE+uwhMuVzb62eTl3MPLt
	eSL3UCJjbJR7+ucIryDB3M1XAt49ez5Q=
X-Gm-Gg: AR+sD118NW5rofDjdN/NeFzg1e3iXyxIfrtYYz6MCs4S4amalUlRmRtrZ3kNL0oU1E6
	ZY+nPWL8l6QLNRVF/MoWxrbbsLsXybojihuCc8rJTWsRPosT1fu0t3pMAmkaYYVGu0ShZdry9Ct
	/F3yCV10orinPLx3OoKMY75v7VCqckYqgEMd97Jahxsc6W9xdGpmCIwfgcNgPj1WSmnyuUSrvSi
	J7vREAlME0vz5WOXvfzKZojWj6+ksv6oRUt3X/OlFPENISCStFvfFws4h45eVauBnB3xsmMjEU8
	48A2kanWdwTv0q+SgvXyAkWwNbS4Lgp267FhP+dKBmt+EcX68ptoh9sUCRKswQqrv+rTIemrfe4
	+1xZkiVy/NlUM8rys7fnK+Zj0yT/xJZyYDk+wNpsYCGPz15ghyqBdA66/FYAoM9Z6oFuCesdE
X-Received: by 2002:a05:6402:2354:b0:699:e496:8711 with SMTP id
 4fb4d7f45d1cf-69e6530e827mr6042391a12.34.1784578524889; Mon, 20 Jul 2026
 13:15:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260718231716.230144-1-rosenp@gmail.com> <al5G-QqO55iNJpbe@lizhi-Precision-Tower-5810>
In-Reply-To: <al5G-QqO55iNJpbe@lizhi-Precision-Tower-5810>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 20 Jul 2026 13:15:13 -0700
X-Gm-Features: AUfX_mwxL3nJrFuw7bmMB_LN6OPvuOmDP-9cEx50M6Ar2lNAmyiWPrzwa_fOrc0
Message-ID: <CAKxU2N-PArxj1UGWyVhx_Qieu+N2jH_0f0__vTLKtVZiU0XcnA@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: fsl_raid: free resources in probe
To: Frank Li <Frank.li@oss.nxp.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Xuelin Shi <xuelin.shi@freescale.com>, 
	Harninder Rai <harninder.rai@freescale.com>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2026 at 9:04=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> wro=
te:
>
> On Sat, Jul 18, 2026 at 04:17:15PM -0700, Rosen Penev wrote:
> > Add free_irq() in the error unwind of fsl_re_chan_probe() and in
> > fsl_re_remove_chan() so the interrupt is always released.
> >
> > Also add tasklet_kill(). Present in _remove but not _probe.
> >
> > Also add platform_device_put on failure as of_platform_device_create()
> > increases the reference count and needs platform_device_put on failure.
> > Requires placing the pointer in the struct for the _remove function.
> > While at it, use platform_get/set_drvdata as there's no need for using =
a
> > device pointer for that.
> >
>
> Can you split these patch, one patch just fix one problem.
> 1: replace dev_get_drvdata() with platform_get_drvdata()
> 2: add error handle one by one.
I think splitting into two is fine. The problem with splitting the
resource patch in two is the intermediate state would be broken.

2 files changed, 15 insertions(+), 6 deletions(-)

is a small enough patch anyway.
>
>
> Frank
>
> > Fixes: ad80da658bbc ("dmaengine: Driver support for FSL RaidEngine devi=
ce.")
> > Assisted-by: opencode:hy3-free
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/dma/fsl_raid.c | 32 ++++++++++++++++++++------------
> >  drivers/dma/fsl_raid.h |  1 +
> >  2 files changed, 21 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
> > index 0b0b4e8fc821..b1a10292324d 100644
> > --- a/drivers/dma/fsl_raid.c
> > +++ b/drivers/dma/fsl_raid.c
> > @@ -212,10 +212,11 @@ static void fsl_re_dequeue(struct tasklet_struct =
*t)
> >  /* Per Job Ring interrupt handler */
> >  static irqreturn_t fsl_re_isr(int irq, void *data)
> >  {
> > +     struct platform_device *pdata =3D data;
> >       struct fsl_re_chan *re_chan;
> >       u32 irqstate, status;
> >
> > -     re_chan =3D dev_get_drvdata((struct device *)data);
> > +     re_chan =3D platform_get_drvdata(pdata);
> >
> >       irqstate =3D in_be32(&re_chan->jrregs->jr_interrupt_status);
> >       if (!irqstate)
> > @@ -645,7 +646,7 @@ static int fsl_re_chan_probe(struct platform_device=
 *ofdev,
> >       struct platform_device *chan_ofdev;
> >
> >       dev =3D &ofdev->dev;
> > -     re_priv =3D dev_get_drvdata(dev);
> > +     re_priv =3D platform_get_drvdata(ofdev);
> >       dma_dev =3D &re_priv->dma_dev;
> >
> >       chan =3D devm_kzalloc(dev, sizeof(*chan), GFP_KERNEL);
> > @@ -656,8 +657,7 @@ static int fsl_re_chan_probe(struct platform_device=
 *ofdev,
> >       chan_ofdev =3D of_platform_device_create(np, NULL, dev);
> >       if (!chan_ofdev) {
> >               dev_err(dev, "Not able to create ofdev for jr %d\n", q);
> > -             ret =3D -EINVAL;
> > -             goto err_free;
> > +             return -EINVAL;
> >       }
> >
> >       /* read reg property from dts */
> > @@ -683,17 +683,18 @@ static int fsl_re_chan_probe(struct platform_devi=
ce *ofdev,
> >       chandev =3D &chan_ofdev->dev;
> >       tasklet_setup(&chan->irqtask, fsl_re_dequeue);
> >
> > -     ret =3D request_irq(chan->irq, fsl_re_isr, 0, chan->name, chandev=
);
> > +     ret =3D request_irq(chan->irq, fsl_re_isr, 0, chan->name, chan_of=
dev);
> >       if (ret) {
> >               dev_err(dev, "Unable to register interrupt for JR %d\n", =
q);
> >               ret =3D -EINVAL;
> > -             goto err_free;
> > +             goto err_free_tasklet;
> >       }
> >
> >       re_priv->re_jrs[q] =3D chan;
> >       chan->chan.device =3D dma_dev;
> >       chan->chan.private =3D chan;
> >       chan->dev =3D chandev;
> > +     chan->ofdev =3D chan_ofdev;
> >       chan->re_dev =3D re_priv;
> >
> >       spin_lock_init(&chan->desc_lock);
> > @@ -707,7 +708,7 @@ static int fsl_re_chan_probe(struct platform_device=
 *ofdev,
> >       if (!chan->inb_ring_virt_addr) {
> >               dev_err(dev, "No dma memory for inb_ring_virt_addr\n");
> >               ret =3D -ENOMEM;
> > -             goto err_free;
> > +             goto err_free_irq;
> >       }
> >
> >       chan->oub_ring_virt_addr =3D dma_pool_alloc(chan->re_dev->hw_desc=
_pool,
> > @@ -739,7 +740,7 @@ static int fsl_re_chan_probe(struct platform_device=
 *ofdev,
> >       out_be32(&chan->jrregs->jr_config_1,
> >                FSL_RE_CFG1_CBSI | FSL_RE_CFG1_CBS0 | status);
> >
> > -     dev_set_drvdata(chandev, chan);
> > +     platform_set_drvdata(chan_ofdev, chan);
> >
> >       /* Enable RE/CHAN */
> >       out_be32(&chan->jrregs->jr_command, FSL_RE_ENABLE);
> > @@ -749,7 +750,12 @@ static int fsl_re_chan_probe(struct platform_devic=
e *ofdev,
> >  err_free_1:
> >       dma_pool_free(chan->re_dev->hw_desc_pool, chan->inb_ring_virt_add=
r,
> >                     chan->inb_phys_addr);
> > +err_free_irq:
> > +     free_irq(chan->irq, chan_ofdev);
> > +err_free_tasklet:
> > +     tasklet_kill(&chan->irqtask);
> >  err_free:
> > +     platform_device_put(chan_ofdev);
> >       return ret;
> >  }
> >
> > @@ -828,7 +834,7 @@ static int fsl_re_probe(struct platform_device *ofd=
ev)
> >               return -ENOMEM;
> >       }
> >
> > -     dev_set_drvdata(dev, re_priv);
> > +     platform_set_drvdata(ofdev, re_priv);
> >
> >       /* Parse Device tree to find out the total number of JQs present =
*/
> >       for_each_compatible_node_scoped(np, NULL, "fsl,raideng-v1.0-job-q=
ueue") {
> > @@ -864,21 +870,23 @@ static void fsl_re_remove_chan(struct fsl_re_chan=
 *chan)
> >  {
> >       tasklet_kill(&chan->irqtask);
> >
> > +     free_irq(chan->irq, chan->ofdev);
> > +
> >       dma_pool_free(chan->re_dev->hw_desc_pool, chan->inb_ring_virt_add=
r,
> >                     chan->inb_phys_addr);
> >
> >       dma_pool_free(chan->re_dev->hw_desc_pool, chan->oub_ring_virt_add=
r,
> >                     chan->oub_phys_addr);
> > +
> > +     platform_device_put(chan->ofdev);
> >  }
> >
> >  static void fsl_re_remove(struct platform_device *ofdev)
> >  {
> >       struct fsl_re_drv_private *re_priv;
> > -     struct device *dev;
> >       int i;
> >
> > -     dev =3D &ofdev->dev;
> > -     re_priv =3D dev_get_drvdata(dev);
> > +     re_priv =3D platform_get_drvdata(ofdev);
> >
> >       /* Cleanup chan related memory areas */
> >       for (i =3D 0; i < re_priv->total_chans; i++)
> > diff --git a/drivers/dma/fsl_raid.h b/drivers/dma/fsl_raid.h
> > index adbfede330a7..34d362803610 100644
> > --- a/drivers/dma/fsl_raid.h
> > +++ b/drivers/dma/fsl_raid.h
> > @@ -270,6 +270,7 @@ struct fsl_re_chan {
> >       struct list_head active_q; /* already issued on hw, not completed=
 */
> >       struct list_head submit_q;
> >       struct list_head free_q; /* alloc available queue */
> > +     struct platform_device *ofdev;
> >       struct device *dev;
> >       struct fsl_re_drv_private *re_dev;
> >       struct dma_chan chan;
> > --
> > 2.55.0
> >
