Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CAD44AB62
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 21:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784670812; cv=pass; b=OlIcMbvonlUOC8hT9YV1gvIkzhMGLfSopxvR4AxHNMNCUAxdQ6vp0yBcRziQUJE3EPcpZ8Vav6Pv7x3HvO8CK8omgjvBqpgQuAkHr0tDCr+fJ8ZNXgOXFnAWKidZatNKfK6ZmBwsVX/WQfFM3IatLbg9WIoTWdwH+41MnsJ5koM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784670812; c=relaxed/simple;
	bh=lDAFm0AlQlMv36abl0lSjstPMod6dj3JAIR+jGejxao=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dPozCmZabidUNmO5BAJJ0g3/4TMeOueIRwitpRG6QXxic480gLwc6GXN2jvT/S27a8Otpptw+p/Rka00+sJW/Fc7HIVv5GoEIwBN5AlmmAG8MLXoobLsCG1ju9j3mnVDF8F3J3MBths+2JXAGIdUhFdCpu0Em6swZZlRpk09qCs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qBL0lVE5; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qBL0lVE5"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-69f2c67650aso1223515a12.2
        for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 14:53:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784670809; cv=none;
        d=google.com; s=arc-20260327;
        b=XVI0PZ9qTa5zswbdhg+Xyt1t7pVXIc9kXW4uxjLlIEy4da+px2YQq8mfalfseq52sb
         wNbhzecjPmSybD8Tr46LWkrExOR7rQq0tOhI/5BbQMorTEd8WkK3qmhdOt37lWPyGeFT
         ZTDg9JgKZp2cvOZJTneBlDvCEBY/tpdCq6LspiJG7PqOeG/VzAcNOQ/mmQ6ZOTlvcHrx
         3uTVjAxw+LpiBefnp7OpE9C9x3AybzbNnbnOusp1WA0F9hYmI15jfgzhBA52epjTrFpb
         dem8ubboIcU6eE/0NmbHWofpK3EwOkqZbM9RHxkaQ4bD9/IzjmeuihQoFgY8aKUpNXir
         NHkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3o1amn2i0mQHd+YvbfIzs5EW18I0zpxANTx0ehHvb5A=;
        fh=iapLhjvYRws+p1CWBpwLtTYleyiTiy6Mm5WnFfee2YA=;
        b=LqyU8LC2YGwrGiLOPkNMQpHlM+SAuYBqfmS667glkKQ5Dj4eP9Ih/AHQKXR5N5hhWc
         FzSZqGM9S/YHQ3KhQ+MGu9RxI7QZkwbuM4j2C98CENHip1doqUeNZSkqiHmYIsNWzyvX
         iGvl+Oc4CWyltcZvooB9D3BmPSDdqlAHktpY9CxamCufbKFYTG6Ibhgo8DEcfyPy2Zcv
         SE0jj64kG1z2wfbQ69DAuqRCv3VVJF15PPBFL2tGs4mf/KICAyxh0bCuzKiwiPO/swG3
         Jn/9ebjzD+Ha7mG1gSRq1FEC8bM1IzBYHGZiohoX0mj5NQXF7s3/usHWkOzdUqtyrOmR
         i/jw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784670809; x=1785275609; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3o1amn2i0mQHd+YvbfIzs5EW18I0zpxANTx0ehHvb5A=;
        b=qBL0lVE5J4d0Z/ewEEd7NHEvPKO4945W0mJdSPvu2IsgQsvl3rBcaR00cOL/kCQdBe
         ueXx4GejoP5DlzlVHMlUn5wfzeYpUN06O0m0/AMnjnD4gVzLzD0F4uHbaHnCF0u9Ug+y
         WiwORocHCPtrpP5qxHIVOXdkN/AbctDNtR4PEbTVYyOkhYZ3H9qAtRPSHHfzXnkWVM4o
         woVioD3pvTYEQe8XOkfHr8msqEmEHggslRBS2OFmLRMfa3t4aZCcuVyjFLSM/TU48VMf
         ts68Palw7nVAQuf4605acHoEk5kBTwnmLhXn/5l593uz2XtLuKc97GD0zXTyL5mrj/7W
         N5KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784670809; x=1785275609;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3o1amn2i0mQHd+YvbfIzs5EW18I0zpxANTx0ehHvb5A=;
        b=DA7rJ+NQmP8qn+CKRFC44MFht6W3lwSLOIdnxjeRxltOp2jE4AYqb9T7Hke0ow9ODH
         xdeDem+9vL1PFhjIwGhcEiA73LR7kZCQeXwka+ELyfj7S5ViiHo3Lmo3XE82NXekj75O
         9V8bbuH2NsJYyrEyg6aGWwG6jj4d1F+ZCytj0o/ZbdYNbjQicgd4U0qmYqz8tBANPMBd
         hXxRco7mnazsIN+faMLUX4IOdXd+0xeLHxNvnqskw2I8b+CPV2f5+vX5SxffKSehpb+4
         UegKoK6i+rGVuL1nNJZKOl3oLFfi0kMWlTyEpieQ1g3g9D/GVUBD2+YmT8SkGWjlQXtL
         +HOg==
X-Gm-Message-State: AOJu0YwceXQzl8w3d6k3NM+1MF2656VL1ZUhU/2WCyWdC7tLYEyJLXu4
	Coe47h996rRKI+oe1ZRNNZBBuwBNyLTJvXgfVtaTVLC83jbQ7uaJAZ4K3jcGKPM8ObGG95ka3zp
	qI8XoMZm9W5hN7WT5Nksu4cVxzrn9hl4=
X-Gm-Gg: AR+sD11uD0ZaOtBdgUV9JxGVi5S5up/kuWQB51wGaoa7ULYJHkZnAe4tTxmIe42Au7w
	Nng1o3hjyQEHYdrkfC5owlDEmZfSqvJqvjBIUOTjjfsCMD208CwqjMmv8PWXj1aTz8x60gacVJp
	U/DQltYwAxDCTorlDhFopJAC4HN2nInfa3tKR8NSKecvPpaH8zssIuofBmcQ7iYCftCWmofaBeZ
	LQSPWMPp+Fe5AR3ZcRFLVqrx32qERBOJgECz4sPAxN2HDx3Q543T8hLFe1LZKM9L5cL6CiiOxGF
	GvgzkTwHwzQabaz9CnpxhB28s1UKRI0BjnbXBrwg9Cf4r4sB5H8zQSWbTFXFY5NdmpP5JxmFElx
	W3wDPmeSn1722C5TNzl3FmtrGyJaoZ/QD7N5z8vPlNdSn7i1Da/TtMJUComACxpoaDrYMJt/u
X-Received: by 2002:a17:907:3fa1:b0:c16:1a3:9022 with SMTP id
 a640c23a62f3a-c16b4732c8amr742060266b.38.1784670809106; Tue, 21 Jul 2026
 14:53:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721195422.353794-1-rosenp@gmail.com> <20260721195422.353794-3-rosenp@gmail.com>
 <al_n9QnYzdvII8fZ@SMW015318>
In-Reply-To: <al_n9QnYzdvII8fZ@SMW015318>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 21 Jul 2026 14:53:17 -0700
X-Gm-Features: AUfX_myRohZ5BHFqs1GNQLf8Rk2fH-4TuzoH8wNDuJDKB_m3XW_GjVR4_LLBse4
Message-ID: <CAKxU2N8Gw+3Cgkk7FvGVoR2V-hDUafVT6H_OOGS5Jd67BNWp1Q@mail.gmail.com>
Subject: Re: [PATCHv2 2/2] dmaengine: fsl_raid: free resources in probe
To: Frank Li <Frank.li@oss.nxp.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Xuelin Shi <xuelin.shi@freescale.com>, 
	Harninder Rai <harninder.rai@freescale.com>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2026 at 2:43=E2=80=AFPM Frank Li <Frank.li@oss.nxp.com> wro=
te:
>
> On Tue, Jul 21, 2026 at 12:54:22PM -0700, Rosen Penev wrote:
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
> > Fixes: ad80da658bbc ("dmaengine: Driver support for FSL RaidEngine devi=
ce.")
> > Assisted-by: opencode:hy3-free
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/dma/fsl_raid.c | 20 ++++++++++++++------
> >  drivers/dma/fsl_raid.h |  1 +
> >  2 files changed, 15 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
> > index 2d54879cd6e1..cabc79e61e85 100644
> > --- a/drivers/dma/fsl_raid.c
> > +++ b/drivers/dma/fsl_raid.c
> > @@ -661,8 +661,7 @@ static int fsl_re_chan_probe(struct platform_device=
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
> > @@ -688,17 +687,19 @@ static int fsl_re_chan_probe(struct platform_devi=
ce *ofdev,
> >       chandev =3D &chan_ofdev->dev;
> >       tasklet_setup(&chan->irqtask, fsl_re_dequeue);
> >
> > +     platform_set_drvdata(chan_ofdev, chan);
>
> Previous patch already set, why need set again?
This is because request_irq uses platform_get_drvdata.

On further review, I think chan should be passed directly.
>
> Frank
> >       ret =3D request_irq(chan->irq, fsl_re_isr, 0, chan->name, chan_of=
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
> > @@ -712,7 +713,7 @@ static int fsl_re_chan_probe(struct platform_device=
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
> > @@ -744,8 +745,6 @@ static int fsl_re_chan_probe(struct platform_device=
 *ofdev,
> >       out_be32(&chan->jrregs->jr_config_1,
> >                FSL_RE_CFG1_CBSI | FSL_RE_CFG1_CBS0 | status);
> >
> > -     platform_set_drvdata(chan_ofdev, chan);
> > -
> >       /* Enable RE/CHAN */
> >       out_be32(&chan->jrregs->jr_command, FSL_RE_ENABLE);
> >
> > @@ -754,7 +753,12 @@ static int fsl_re_chan_probe(struct platform_devic=
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
> > +     of_platform_device_destroy(chan_ofdev);
> >       return ret;
> >  }
> >
> > @@ -892,6 +896,8 @@ static int fsl_re_probe(struct platform_device *ofd=
ev)
> >
> >  static void fsl_re_remove_chan(struct fsl_re_chan *chan)
> >  {
> > +     free_irq(chan->irq, chan->ofdev);
> > +
> >       tasklet_kill(&chan->irqtask);
> >
> >       dma_pool_free(chan->re_dev->hw_desc_pool, chan->inb_ring_virt_add=
r,
> > @@ -899,6 +905,8 @@ static void fsl_re_remove_chan(struct fsl_re_chan *=
chan)
> >
> >       dma_pool_free(chan->re_dev->hw_desc_pool, chan->oub_ring_virt_add=
r,
> >                     chan->oub_phys_addr);
> > +
> > +     of_platform_device_destroy(chan->ofdev);
> >  }
> >
> >  static void fsl_re_remove(struct platform_device *ofdev)
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
