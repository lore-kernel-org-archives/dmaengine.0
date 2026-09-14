Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7F238645E
	for <dmaengine@vger.kernel.org>; Mon, 14 Sep 2026 18:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789412206; cv=pass; b=NzxpBRs1pFsUgF0CPOOg+NxypNKDAn9Bt/YhRDEnO2DQQeN3tTdPObF9kWlNXhJ++rpkqvieY0BmmtPK9OLmuH8IkrD7JdCTsYTltWam7nfkOmlwEY73RYKG+A5Off0hBH5S5HuSpo33MnKzz+zAAietRJtADIFmZVrJavKXuyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789412206; c=relaxed/simple;
	bh=TtfncmH80mrck36+bgc7vP1BFutRtUXi6yzpcoGC5lU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TY7vdkJRhvURcwMlc58e6V/YoV4fc+nD1eA4Ny1cLj3EE4RWBo/k8QoEQJmu6twK+smUH3WqTgnREXZtYpt3dDj7vnZqayhRDbaml9gw0PmTcSUR5lOG1zPT8eK2mK11MbnBNT5Dhyyu2qozob2caOx0sA7czeoC0nSPCC8X9lk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S4iNEEQi; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S4iNEEQi"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c1670dad7a8so651618766b.3
        for <dmaengine@vger.kernel.org>; Mon, 14 Sep 2026 11:56:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789412203; cv=none;
        d=google.com; s=arc-20260327;
        b=BsG0BiLFvQU+ESQv0NDqgMt52WfSdF2rP3eRxAHUqWo2fgK2TPSv07iN8upS0UPLXR
         4vmVAoVr/GBlIPrUmDPod4DyWr6q6/iOkgOJgdp5thbcp6S6XC6OMsV/VRB4HH1V3G7S
         x6Y1UBzrqKdXs6t9E9hm9uVcP4w0Yhs4D3PdBOnlryW6ms5vGRZ9eYRuNJfJm5OWQNbh
         X2seV/hV0gQp4P8klF2ouoLttuXpWo8ivP03tr+rhZld3DFuKL2sbkQSdpmCKjo7vwYm
         jQpsGx6LS3eTgvD8U5D2mqj95madT5pECH8SYxuZFAI8/UM847meTBSw+mkYgiFOXhHg
         0l4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=InVDDjxxDJpVrdg9GAOJRRP06/ftdzYITwk4z/cEu+o=;
        fh=qfuWBQ7eQ4UUv7HDrLQXFhxUKbyAroUFqYScBhqYvdU=;
        b=lmvC5+GTiI0++z5KwZaeWD/tLQu2ush8l/XLls9TD56httqDhU9h5PlSl0yJWl2GBr
         pnyxvIV2/kBKYZZM5koKrkLkBTfwdqpGLiBkAtN5Dfd23YiDnENFJJnkjLIvWkLiNJW0
         KYc/VUqRGvcj9Ic+risDRtUU5yq7y4Q/9ZriflMn9qcfc2Of6LLBtlbvZR1WuEWOVxYL
         dKCnIsjLIHckOQlteZa6jg/qK+HmzOBHYb5lzhOI7XAFeCbFr2g7Slid2YdLrhjK8M73
         C6oBvtshFzj04JnkTflQwtJh0xQ3rRrOfMfeugOahXsnsPmz8KxFSDp6uEdA9gdRRXvw
         dWuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789412203; x=1790017003; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=InVDDjxxDJpVrdg9GAOJRRP06/ftdzYITwk4z/cEu+o=;
        b=S4iNEEQiSuFQb4NtHSswPNABERr1P5gn1h/gS9bHd0/Op6XdJ+oAZNtPJA8eBSTJna
         YRx4St9x1rpS/H/A6Oasj6vk7hDQh/M4PZfY96Hh2vxfF5zAVUXAnUQFVxwHGx+xvfRJ
         CW+oB6LFw5ZD03N820P910krQW0FnnPgnqukZV+Aqec3xJwCyurjmq+cmBn+kMzsgYxR
         9xMoRoZnYw8Erq4uXJv5PS8iPB8eMdyeuULxjUC1pVckUnvvAVHLaZnDDWYcKHHWtcZp
         PZOPBD3UmtPqSOLcE1VGknq0Cv/hT2ckLfXm9anV6gB8vG6lX6il/On9UFPsJOD9Nulj
         edSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789412203; x=1790017003;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=InVDDjxxDJpVrdg9GAOJRRP06/ftdzYITwk4z/cEu+o=;
        b=RynWE4Afl7A88IPN0VJWLya4pNTo/SDb7dva1ebklnWXF1+7OKbA16KQmEvcVycl0B
         wUmUvstdYhuSwpzCjJMav730gBCHW8WAYeaFdVMxLkUPZ7DsNiCLbTnscWrsO6xOdRI4
         RHaZpDUzTt0II52WlACdSZsSz1g1hU72ziRIrax5O84rOwXFwpqIns+oSiE84KjuIAOG
         yukjneRhd5Aox+tEuYjOr6rGo5Wtwym/Bh37bEPhsp2tSwec0MClg25XYDsekuTKFvmj
         CK6iXk4kG2b2P+kVz5qIFIC5w/XNW3qoiutLlHr05+Ajto8oS2m/iaUYwScsJ6v4l7ex
         c09g==
X-Gm-Message-State: AFuF++mhi67eBSBZ1ClTCgRSzRFSulA8RjhlPjUghSm57DGMcbKuQyQQ
	ESeOsM1647iMr0WbJyWe7W69o8B9EegnnkJuq4O+doBGwNrnlrDOmvJ6JwsA6SFAOZyeWR1gARN
	D8Qh0sxufn47m1RunaCpZKbCO9Driowk=
X-Gm-Gg: AYBFou0y/cyTcsJE5hOJXzMLBO8yKlgpmoLwJI6MNA9B2dmolFcWyhprN8xejq5tPL9
	Lz9FDYxDQa0SZKdQBVtzJgOA7CYBMI2xnwY5hguQvugggj5Sl6rhwzQ6aOCRXaOF4XMdfQPN6d4
	qHsqAkxkHP0Tjw5sbsR8JX5k3ynsPYSQULleEkdsdp06O1MCVGQ/Xy3hSnVIYqpW9YocfZPIX1f
	ZUli2KT+t5O5POEOmfS68ujOLhhEBvmkzhpjsmAjR8nN9lHbvomVmWbqf0m3yOnDVF0kgiVSOfi
	NsFSht3kI22fPxHYRlt2pXUjmNvlDp/kT5uMnDOTSCvLxFvGbnnMLhR29C4+qDxQ5We8DmN2rbX
	0VLSBI2GDK/I53EAAaPFimanGRV+7CieSNt8dRB8ZcNsy32AGKaxnMy4+aCEIlYwiL2CuzycX0Y
	yjsdFtzKppOAEjHjjVsRh+40KqlQbFrAfzBWGW0gpu+ByGxItp4g/fclo4LQDlIZUoLA==
X-Received: by 2002:a17:907:f497:b0:c26:19de:912c with SMTP id
 a640c23a62f3a-c29b86f1102mr253024066b.31.1789412202869; Mon, 14 Sep 2026
 11:56:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911220640.178074-1-rosenp@gmail.com> <aqgYKc5ViiWynzqS@SMW015318>
In-Reply-To: <aqgYKc5ViiWynzqS@SMW015318>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 14 Sep 2026 11:56:31 -0700
X-Gm-Features: AcwNN1XNYfhRZ9JwjZrSRRHjJV50DydZSSuGetocf8Q2opC6iByS3BkPVP-6b1o
Message-ID: <CAKxU2N-uY2_ToL5ivHxdu2WijN9zA1O3PCoiLw1pr52nsSJ2VA@mail.gmail.com>
Subject: Re: [PATCHv2] dmaengine: ppc4xx: use devm_platform_ioremap_resource()
To: Frank Li <Frank.li@oss.nxp.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 8:52=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> wro=
te:
>
> On Fri, Sep 11, 2026 at 03:06:40PM -0700, Rosen Penev wrote:
> > Replace the open-coded sequence of of_address_to_resource(),
> > request_mem_region(), and ioremap() with devm_platform_ioremap_resource=
().
> > This eliminates error-path cleanup for both the memory region and the
> > ioremap.
> >
> > The two separate initcodes PPC_ADMA_INIT_MEMRES and PPC_ADMA_INIT_MEMRE=
G
> > are collapsed into PPC_ADMA_INIT_MEMRES since the combined call covers
> > both steps.
> >
> > Also emove unused PPC_ADMA_INIT_MEMREG enum value
>
> emove?  can you bound all ppc4xx patches to one patch serial to avoid
> pick up conflict between these patches.
I sent the ones that have none.
>
> Frank
>
> >
> > The PPC_ADMA_INIT_MEMREG error code is no longer used after converting
> > to devm_platform_ioremap_resource().  Remove it from the enum and the
> > corresponding error string.
> >
> > Assisted-by: LLM
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  v2: cut some stuff from description
> >  drivers/dma/ppc4xx/adma.c | 46 +++++----------------------------------
> >  1 file changed, 6 insertions(+), 40 deletions(-)
> >
> > diff --git a/drivers/dma/ppc4xx/adma.c b/drivers/dma/ppc4xx/adma.c
> > index 39498779e241..17b60704a702 100644
> > --- a/drivers/dma/ppc4xx/adma.c
> > +++ b/drivers/dma/ppc4xx/adma.c
> > @@ -37,7 +37,6 @@
> >  enum ppc_adma_init_code {
> >       PPC_ADMA_INIT_OK =3D 0,
> >       PPC_ADMA_INIT_MEMRES,
> > -     PPC_ADMA_INIT_MEMREG,
> >       PPC_ADMA_INIT_ALLOC,
> >       PPC_ADMA_INIT_COHERENT,
> >       PPC_ADMA_INIT_CHANNEL,
> > @@ -49,7 +48,6 @@ enum ppc_adma_init_code {
> >  static char *ppc_adma_errors[] =3D {
> >       [PPC_ADMA_INIT_OK] =3D "ok",
> >       [PPC_ADMA_INIT_MEMRES] =3D "failed to get memory resource",
> > -     [PPC_ADMA_INIT_MEMREG] =3D "failed to request memory region",
> >       [PPC_ADMA_INIT_ALLOC] =3D "failed to allocate memory for adev "
> >                               "structure",
> >       [PPC_ADMA_INIT_COHERENT] =3D "failed to allocate coherent memory =
for "
> > @@ -3997,7 +3995,6 @@ static void ppc440spe_adma_release_irqs(struct pp=
c440spe_adma_device *adev,
> >  static int ppc440spe_adma_probe(struct platform_device *ofdev)
> >  {
> >       struct device_node *np =3D ofdev->dev.of_node;
> > -     struct resource res;
> >       struct ppc440spe_adma_device *adev;
> >       struct ppc440spe_adma_chan *chan;
> >       struct ppc_dma_chan_ref *ref, *_ref;
> > @@ -4040,28 +4037,12 @@ static int ppc440spe_adma_probe(struct platform=
_device *ofdev)
> >               pool_size <<=3D 2;
> >       }
> >
> > -     if (of_address_to_resource(np, 0, &res)) {
> > -             dev_err(&ofdev->dev, "failed to get memory resource\n");
> > -             initcode =3D PPC_ADMA_INIT_MEMRES;
> > -             ret =3D -ENODEV;
> > -             goto out;
> > -     }
> > -
> > -     if (!request_mem_region(res.start, resource_size(&res),
> > -                             dev_driver_string(&ofdev->dev))) {
> > -             dev_err(&ofdev->dev, "failed to request memory region %pR=
\n",
> > -                     &res);
> > -             initcode =3D PPC_ADMA_INIT_MEMREG;
> > -             ret =3D -EBUSY;
> > -             goto out;
> > -     }
> > -
> >       /* create a device */
> >       adev =3D kzalloc_obj(*adev);
> >       if (!adev) {
> >               initcode =3D PPC_ADMA_INIT_ALLOC;
> >               ret =3D -ENOMEM;
> > -             goto err_adev_alloc;
> > +             goto out;
> >       }
> >
> >       adev->id =3D id;
> > @@ -4081,10 +4062,10 @@ static int ppc440spe_adma_probe(struct platform=
_device *ofdev)
> >       dev_dbg(&ofdev->dev, "allocated descriptor pool virt 0x%p phys 0x=
%llx\n",
> >               adev->dma_desc_pool_virt, (u64)adev->dma_desc_pool);
> >
> > -     regs =3D ioremap(res.start, resource_size(&res));
> > -     if (!regs) {
> > -             dev_err(&ofdev->dev, "failed to ioremap regs!\n");
> > -             ret =3D -ENOMEM;
> > +     regs =3D devm_platform_ioremap_resource(ofdev, 0);
> > +     if (IS_ERR(regs)) {
> > +             ret =3D PTR_ERR(regs);
> > +             initcode =3D PPC_ADMA_INIT_MEMRES;
> >               goto err_regs_alloc;
> >       }
> >
> > @@ -4121,7 +4102,7 @@ static int ppc440spe_adma_probe(struct platform_d=
evice *ofdev)
> >       if (!chan) {
> >               initcode =3D PPC_ADMA_INIT_CHANNEL;
> >               ret =3D -ENOMEM;
> > -             goto err_chan_alloc;
> > +             goto err_regs_alloc;
> >       }
> >
> >       spin_lock_init(&chan->lock);
> > @@ -4214,19 +4195,12 @@ static int ppc440spe_adma_probe(struct platform=
_device *ofdev)
> >       }
> >  err_page_alloc:
> >       kfree(chan);
> > -err_chan_alloc:
> > -     if (adev->id =3D=3D PPC440SPE_XOR_ID)
> > -             iounmap(adev->xor_reg);
> > -     else
> > -             iounmap(adev->dma_reg);
> >  err_regs_alloc:
> >       dma_free_coherent(&ofdev->dev, adev->pool_size,
> >                         adev->dma_desc_pool_virt,
> >                         adev->dma_desc_pool);
> >  err_dma_alloc:
> >       kfree(adev);
> > -err_adev_alloc:
> > -     release_mem_region(res.start, resource_size(&res));
> >  out:
> >       if (id < PPC440SPE_ADMA_ENGINES_NUM)
> >               ppc440spe_adma_devices[id] =3D initcode;
> > @@ -4240,8 +4214,6 @@ static int ppc440spe_adma_probe(struct platform_d=
evice *ofdev)
> >  static void ppc440spe_adma_remove(struct platform_device *ofdev)
> >  {
> >       struct ppc440spe_adma_device *adev =3D platform_get_drvdata(ofdev=
);
> > -     struct device_node *np =3D ofdev->dev.of_node;
> > -     struct resource res;
> >       struct dma_chan *chan, *_chan;
> >       struct ppc_dma_chan_ref *ref, *_ref;
> >       struct ppc440spe_adma_chan *ppc440spe_chan;
> > @@ -4278,12 +4250,6 @@ static void ppc440spe_adma_remove(struct platfor=
m_device *ofdev)
> >
> >       dma_free_coherent(adev->dev, adev->pool_size,
> >                         adev->dma_desc_pool_virt, adev->dma_desc_pool);
> > -     if (adev->id =3D=3D PPC440SPE_XOR_ID)
> > -             iounmap(adev->xor_reg);
> > -     else
> > -             iounmap(adev->dma_reg);
> > -     of_address_to_resource(np, 0, &res);
> > -     release_mem_region(res.start, resource_size(&res));
> >       kfree(adev);
> >  }
> >
> > --
> > 2.55.0
> >
