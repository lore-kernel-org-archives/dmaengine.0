Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B76138839D
	for <dmaengine@vger.kernel.org>; Mon, 24 Aug 2026 20:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787603061; cv=pass; b=Ggi3W4yG4dae9TaSja/HALt2OXJZva3TUgKadLyh5+OPSAygJgXE/LFC4If9x/4EvPbR7eCPn5N3O1uKVS+Owr5I8J8E1HK1AjU05R04w/HVHQ456vCZ8Md0xTudYcnlhEc610meaol/yS9fs+mQIIcI6SbTS68Ha9OVgWAkxJA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787603061; c=relaxed/simple;
	bh=NRos0QdouQhmcr4VKKCe6wuLpj9sJreDcMARIW7wl8w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ag0jKyJffmdH0a//rxXjxdU8uXW8JMaqB8P6iSsnFxlgG2W+y/172APnRydbZ4U4H1cr/zwv2bjGYbAYUaakfIdk9VPWp8jpd8zDZiVlHQRP9WEMID296J6o4spCeS0cc4LwGRepMkg+tdRqGlDzjjH24vGf41kSPqWLEDO/qNU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lwqs1dM6; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lwqs1dM6"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a17cb94b26so7465254a12.3
        for <dmaengine@vger.kernel.org>; Mon, 24 Aug 2026 13:24:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787603058; cv=none;
        d=google.com; s=arc-20260327;
        b=XNtk/gJAOmmMoaR/47+8c4brlHoQL3ovpFdNaDwwxjEaCWh8uCVZVfPxhNLAOIqrlZ
         P6HIbBAe3JPJ8QNObTIxInd5HZ8FbpZhNIm22YTiRZ6xShYkDbkp93plPZbB79Pe7EQM
         GJqAaVBKPX25Cmv+4FNbviQJFNhEWbLMmiOt0cFReKwoKSWFR4VQknjLXEYgs3Vof4GH
         5bqYgUiFEmrspn6YKpu7kJ0+S/CkU/MeE4A/oMt+ziqdA6umt+987pKPsWpjEi3BuiaU
         VcihQ1haB/9zLtT85P6MeddM/A4J1nN2kSWUP3v+ilVRmGLEYD3JSM+vk6WNH3K7P1wR
         7rnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+Ae8n7e2LG5AISEZM+Kf8LPJGt1FwWYvYnAfYa7Gl4o=;
        fh=qfuWBQ7eQ4UUv7HDrLQXFhxUKbyAroUFqYScBhqYvdU=;
        b=SYgvRYa0G8LtU0uRFjl9bTuYxJQvlnL9uE5V63PlasW4PTRMlzu1cC6w39aNvHqAZ2
         8wNiI2CoaaQi2OIPhITiddvAgZxJfzsPnkTPR04anNjJrHneIqO7+naCJLHFBI6ZTbxh
         3khLvkdE9LCAxQibrKSN1bBKnfH0k6kb+PHt4F3IHut3a+gDcPLhNWiZ9GN2WG/+jHZv
         axmxjc/3SI02V4t4tr7Hn3UKqcL1HK5RyYAaaDcF7/XLg/OlPmSofE1aMm2Ncy1c9FL0
         bNoTiWlEEWrJsO+7K884yf6PiT0B4SkxqwfwXkZdUMi+VVx4xPC8CeOyEUCeyyLI2nvY
         tcow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787603058; x=1788207858; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+Ae8n7e2LG5AISEZM+Kf8LPJGt1FwWYvYnAfYa7Gl4o=;
        b=lwqs1dM6XU47RpZ1kPpPSP7X5QBwEfGzxlht8N7Yet6TXJqgYVXL3krjbJPXjSQPzH
         RNoF3wCrM6Em294CtueshQK3mAflw/szBTKNieBKdGhvI/Fy9D3DI/9z67MFXUyv6NYF
         +qN/xPyg/s8m6Jh9krvzWib+l8+jiCTXeTWuE+G7pRGqh558c8Uv0qoGzpVwKXEP87vq
         I4+8kkR7XqvincwnFlPD5Co3Rjo8MUuNEM7KL00OaBluRs5Yw+NH7G0mfygTYKN8L5rE
         bprHsTbIuhirvL+W+bL/d6O5r1JOPFEBiloArergtwGs0omLKrclHUKLlQt2oThl4hPv
         P/ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787603058; x=1788207858;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Ae8n7e2LG5AISEZM+Kf8LPJGt1FwWYvYnAfYa7Gl4o=;
        b=stn0QHPYcsTYL82UK6qRT2esRQmxe1ZeM9qE4qOYVP6J/pQEjmTBP9mE3tRh7SnDzL
         0aer/e+H0qIr1+wUh/Lx1hNstCT3pQ+mCZvPUuDK6m5NR8g4u6ecG1FMFRU2zY+wkgou
         1CvKqd7N+6ZsP0piHvNnq65sTxL9AM9+HFZT5YqES9qN1DQYe8YM2yPICjPW6fwntED1
         3pD+t9b12oaT51sk69OYNVrmKE6EsxX5Sor60D+zmJtomw+Ol4nwmVZVshqU/YabtZNy
         RKwYCM0Q50+5iTPkUX5Ju0146PaL0tJn2dNL0jBBbm54PUMPHziE6ls4cUIoEzQJV8pE
         aeBw==
X-Gm-Message-State: AFuF++mKAM3QVDNvx/8eX7b/w1aibv83gbcUYEXOxrOrMY/IHT2nf2WE
	sq5IRd3fy3WpXDBpmC4fudEhcL/g2/Nc+XgsGLT5HrQ5LP/mxzCZ44IshQV3wIJcWPUSkw9uopy
	SCIWtxXUSa0zWIg0vVq5AQHHnOorjgWQ=
X-Gm-Gg: AR+sD12LgaV+JjgfTBWaZ8CExncoOhu9jPlW6MIfA4y6Lbjh1FyMqRAX5iyLFkUpBXR
	3ddWmJD4Y0dmXjfvfrFQZJznUzZlWHVjQ1UkqjoiCjEjiR+nAXJVqhFLck8r8izQ8p5044a5QBS
	R97aPO1yOwHY3/MsjKRNHyEPjnlkE+hNNJVI9Mc6wHwfILnZf1fn2x14uHU3PgOK2hSw8nDttA8
	tnEcoDfENREBbyj2FVH0mfjNGH7P7mh5om2jAokwHnPqhQirG5J5HapbF8EGsVOOWVUDlfG/25z
	qf+VS9g4rfN3gpiuhMUfbh2gq9xxZkNVIwg/GFI/Vfne8V7Yk01gxTih3QASZx3gc3fffrN9dXB
	kYtzHHn6U09XzyaogVukt7QFRJpnGZnanTSzuY/igT8ACiZsmv8AMl70rSiMI3Qp/KmGlKnolUz
	1TZDWQUOjF5Bs0Q60+2Egxo2ikGhT0gNPIlBkA8BeV46axdcRHFT2WHaw=
X-Received: by 2002:a05:6402:2553:b0:6a3:f63a:4978 with SMTP id
 4fb4d7f45d1cf-6a5c412b2d1mr1099611a12.8.1787603057629; Mon, 24 Aug 2026
 13:24:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260823044900.11466-1-rosenp@gmail.com> <aoxiYtuTC3dULO06@SMW015318>
In-Reply-To: <aoxiYtuTC3dULO06@SMW015318>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 24 Aug 2026 13:24:06 -0700
X-Gm-Features: AcwNN1XpJbkOrkqlApIM67Pwt6WmF7_o1I_0iuQSJDmjWmSaJcuhbYbz5bz12YI
Message-ID: <CAKxU2N_tmhkqh=wW82zrsHh56LuMKro-MzOFzJk5ETDx61xprw@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: bestcomm: ioremap early
To: Frank Li <Frank.li@oss.nxp.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2026 at 8:25=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> wro=
te:
>
> On Sat, Aug 22, 2026 at 09:49:00PM -0700, Rosen Penev wrote:
>
> subject: dmaengine: bestcomm: use devm_platform_get_and_ioremap_resource(=
) to simplify code
>
>
> > Doing so allows handling potential -EPROBE_DEFER before any work gets
> > done.
> >
> > Replace the open-coded resource lookup, request_mem_region, ioremap and
> > the manual iounmap/release_mem_region cleanup in probe/remove with the
> > managed devm_platform_get_and_ioremap_resource() helper. This removes t=
he
> > now-unused error-unmap/release paths and simplifies probing.
> >
> > This also fixes a resource size mismatch between allocating and freeing=
.
> > From sashiko:
> >
> > >     release_mem_region(res_bcom.start, sizeof(struct mpc52xx_sdma));
> >
> > This is a pre-existing issue, but does this mismatch in size during rel=
ease
> > cause a permanent resource leak?
>
> %s/?/.
>
> > The memory region is requested earlier in mpc52xx_bcom_probe() using th=
e
> > device tree node size:
> >     if (!request_mem_region(res_bcom.start, resource_size(&res_bcom),
> >                             DRIVER_NAME)) {
> > However, the error path above attempts to release the region using a fi=
xed
> > compile-time size: sizeof(struct mpc52xx_sdma). Since __release_region(=
)
> > strictly verifies the boundaries of the requested resource, if these si=
zes
> > differ, the check fails and the I/O memory region is never freed. Drive=
r
> > unbinding in mpc52xx_bcom_remove() also uses this same fixed size.
>
> Needn't this paragraph, "devm_platform_get_and_ioremap_resource..." alrea=
dy
> clear enough.
This section is generated from Sashiko. Same as the above.
>
> Frank
>
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/dma/bestcomm/bestcomm.c | 45 ++++++++-------------------------
> >  1 file changed, 10 insertions(+), 35 deletions(-)
> >
> > diff --git a/drivers/dma/bestcomm/bestcomm.c b/drivers/dma/bestcomm/bes=
tcomm.c
> > index 432b43520ddc..44ff4a42376b 100644
> > --- a/drivers/dma/bestcomm/bestcomm.c
> > +++ b/drivers/dma/bestcomm/bestcomm.c
> > @@ -13,7 +13,6 @@
> >  #include <linux/kernel.h>
> >  #include <linux/slab.h>
> >  #include <linux/of.h>
> > -#include <linux/of_address.h>
> >  #include <linux/of_irq.h>
> >  #include <linux/platform_device.h>
> >  #include <asm/io.h>
> > @@ -365,13 +364,19 @@ bcom_engine_cleanup(void)
> >  static int mpc52xx_bcom_probe(struct platform_device *op)
> >  {
> >       struct device_node *ofn_sram;
> > -     struct resource res_bcom;
> > +     struct resource *res_bcom;
> > +     void __iomem *regs;
> >
> >       int rv;
> >
> >       /* Inform user we're ok so far */
> >       printk(KERN_INFO "DMA: MPC52xx BestComm driver\n");
> >
> > +     /* Get, reserve & map io */
> > +     regs =3D devm_platform_get_and_ioremap_resource(op, 0, &res_bcom)=
;
> > +     if (IS_ERR(regs))
> > +             return PTR_ERR(regs);
> > +
> >       /* Get the bestcomm node */
> >       of_node_get(op->dev.of_node);
> >
> > @@ -402,35 +407,13 @@ static int mpc52xx_bcom_probe(struct platform_dev=
ice *op)
> >       /* Save the node */
> >       bcom_eng->ofnode =3D op->dev.of_node;
> >
> > -     /* Get, reserve & map io */
> > -     if (of_address_to_resource(op->dev.of_node, 0, &res_bcom)) {
> > -             printk(KERN_ERR DRIVER_NAME ": "
> > -                     "Can't get resource\n");
> > -             rv =3D -EINVAL;
> > -             goto error_sramclean;
> > -     }
> > -
> > -     if (!request_mem_region(res_bcom.start, resource_size(&res_bcom),
> > -                             DRIVER_NAME)) {
> > -             printk(KERN_ERR DRIVER_NAME ": "
> > -                     "Can't request registers region\n");
> > -             rv =3D -EBUSY;
> > -             goto error_sramclean;
> > -     }
> > -
> > -     bcom_eng->regs_base =3D res_bcom.start;
> > -     bcom_eng->regs =3D ioremap(res_bcom.start, sizeof(struct mpc52xx_=
sdma));
> > -     if (!bcom_eng->regs) {
> > -             printk(KERN_ERR DRIVER_NAME ": "
> > -                     "Can't map registers\n");
> > -             rv =3D -ENOMEM;
> > -             goto error_release;
> > -     }
> > +     bcom_eng->regs =3D regs;
> > +     bcom_eng->regs_base =3D res_bcom->start;
> >
> >       /* Now, do the real init */
> >       rv =3D bcom_engine_init();
> >       if (rv)
> > -             goto error_unmap;
> > +             goto error_sramclean;
> >
> >       /* Done ! */
> >       printk(KERN_INFO "DMA: MPC52xx BestComm engine @%08lx ok !\n",
> > @@ -439,10 +422,6 @@ static int mpc52xx_bcom_probe(struct platform_devi=
ce *op)
> >       return 0;
> >
> >       /* Error path */
> > -error_unmap:
> > -     iounmap(bcom_eng->regs);
> > -error_release:
> > -     release_mem_region(res_bcom.start, sizeof(struct mpc52xx_sdma));
> >  error_sramclean:
> >       kfree(bcom_eng);
> >       bcom_sram_cleanup();
> > @@ -463,10 +442,6 @@ static void mpc52xx_bcom_remove(struct platform_de=
vice *op)
> >       /* Cleanup SRAM */
> >       bcom_sram_cleanup();
> >
> > -     /* Release regs */
> > -     iounmap(bcom_eng->regs);
> > -     release_mem_region(bcom_eng->regs_base, sizeof(struct mpc52xx_sdm=
a));
> > -
> >       /* Release the node */
> >       of_node_put(bcom_eng->ofnode);
> >
> > --
> > 2.55.0
> >
