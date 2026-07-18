Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29DF19AD5C
	for <dmaengine@vger.kernel.org>; Sat, 18 Jul 2026 05:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784352701; cv=pass; b=Pw69TB8iQ4j72QOIlBHKql7GQWR5QadZlhDO4xORJA0JzitQNILSz6NfSXoxoabQHiVNsktXTqQ4MjAzsRE10MWv/IEp6YXXnjuDFWHRTeVYntDBu0RziQY8jnYwM8qRJ/K5QMPRhioHtDab3SDaTFURWTIXyR82EqlfmzO1GOY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784352701; c=relaxed/simple;
	bh=IMFfzfkyR/jKEMWGgu6BEv7/SxyIqAEI3PRVNndgoWk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TRCnI1iK4RG9Lcmd2y6ZrQP5eUEKwpoyRBh22Dg9Nqz7sAEglf9zNjFhZV/HYiuva0XQypKdJlASSWNPS1EDI+x5suKVixqN2P9JUb8viwrNfkVjRhYL5xZNmMcuVN9qdBPB/WRLzMXUlkSaEnVKPPsp2az3o47JNflr3PTEePc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FsjqcFBX; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FsjqcFBX"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-69e08ad526cso4903704a12.1
        for <dmaengine@vger.kernel.org>; Fri, 17 Jul 2026 22:31:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784352698; cv=none;
        d=google.com; s=arc-20260327;
        b=eZuO1qutZVViWexw/aZJmQ+1e1CNFd/VxkM1Bslk4bj4qaOOol6r9JgD2z5nHn4uCc
         svunhQj4gOMT0bW/Ma4CAGeA5lMYKw9xnmvpRkNhLQhndr6HLF1idwAWVq4oPsqLan/Y
         x+Y7C2gLOjeG9lTwr6CHvyPLpzopyPJlY1Hbjmvuo6sD56KEFi/2NBo7H7V/4Ldx6V36
         YEhm45WKia2MNKJWRR9VbZ6UVkjtkKlDi2PN5bUfjn1YQ3qEFNgZPlR9NVOXkSyy+Qpn
         YSQD1ctCNcyopJnUUwMd5nEXwaH2eIGG09dR6y78SUW+JFLe80SUm5hUWg8OsdzswFMc
         KKow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bY/0bpvSuBX4pBrYgChn9XFDAOyGIiKVR1a8UoxdhOk=;
        fh=osGbBS4cRtiBx7AvmHXmK6mmq9Xl6rEqpd5MK+wio78=;
        b=gIQd1+iEEg4lSv6eOetaliOvSxplaWNPlLBkrPUJThqvsTDXF+88oymJhIhdfJg9yX
         1jNHeGA4D90HX6mHP3EaD3XRGrRRb4K5aEBjXW07HmQGnprUodF14pJGOVy6/mByKFOd
         v5JTN7KnznG5p0P9xd7wIlUDpZMnoDKI9dXfANPr22A6X97UhT49rSSl9v5yxNTkNdcw
         3DmxyERqqlqB87/UIL5CaEvMop7BnbBHuwhyZygDeQ0/pidPg2nuZ83/FMZbJiRsATfN
         qbmzHTpWvZggTqt3g7y7TkQycnUQtCGc/So12hx52LZ1T/r7x9l9KStnfjKe1+aCY3Mx
         icmA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784352698; x=1784957498; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bY/0bpvSuBX4pBrYgChn9XFDAOyGIiKVR1a8UoxdhOk=;
        b=FsjqcFBXzxZa77OL/Rks+CJw+1bil6gc53BmU+5wpvlMI1DAVf6YR3n6ZAU+KBHBKt
         lvmHgQc2t4JpSt0BqrOm7gPDNpDcAu/X9WO2sqrsu2OrjA7QrHSbqIk5i0ak8ayd0CQS
         kHPqCEcj4KAVSB5ty9EBK46cr0gthUEJgYbiiv5XGlF1+rIiRBHqe6ljIOyeZEWEXoK2
         GBQ3nLAx97yP60wDoijFLgw3+GatlSntMLObbBmHPExEgoZdGbefbt9Ay5I4/jKHCkfQ
         o7X0nnn7iV5gu+2SrSiQ86iRkyPhpFlAnso1Vpc44lXZo9stkSGJuxfyXi+LTI91t1mX
         441g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784352698; x=1784957498;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bY/0bpvSuBX4pBrYgChn9XFDAOyGIiKVR1a8UoxdhOk=;
        b=GZNiXmYh39DQfSFglcEuxF15nFX4QDHU/HUofythWqyO1yNrkfI6uGNfnUPD0MFsWQ
         ZjQUA6KnKIaytf5lgNdyRzJHVaoKfXWRMdwrkn28kZBGfQwt09yJWEg04KpnCU5TYmFr
         xo5fkv9H12xnAqVssZvEzwLof2dOXV3k8Kuaw/S0m85qsMrVnm9f6GQg4tCUvaBR3Fjn
         hn6OXzb0ZwW+v7r7gAaU05cpzjWA5rG1lzDnxzNQl/IK4Mb4FmZeDrLEl9ce548naBYJ
         KQ4tdC2+uRjtl1tPZxDEM00x3r7BWQbn8YHLQ7aOTybjLqZ/FUWRDbhrq8X5n1SLASp+
         u3Xg==
X-Forwarded-Encrypted: i=1; AHgh+RrttgiwkOSVb5eMXouA630JV0TJ4Nz7lLTCPzpBx5hVe08QwU67ICviUmOoA2zSRJPpGHr6n8cpQqw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGblItMbXNAUtrQgMkdfq3a93LHTLOEsW1j2dLmczUD9OSmkK8
	KWzfXnga3U3GlI0fatGryRpW94QPGfZONgImu29n5Po1NjYgDS5mVbeWSDfGgC33YK2DV/deh69
	oQ/FG9TO1qmaSZt0I7RqShtfyp8MpeCE=
X-Gm-Gg: AfdE7cmrfGgYkuESzOawScnOyduMmylm/EeCmo280steczMWWlsR1VwHTCWP1XXWQfR
	4xQOyIjUbvsZSKizyj21hHR0dR5q+chbGBxKwXcJr6SBsyg2pfX1moPpUNtITKSsRulPpujKjHp
	lk9OXp6wg3E7AioLhfhuEPZDFTjbOW+JGxkBe8phrfM890GXKrNbEx2gM26PMwvSUWbBCYYuG4J
	4XsH/T2pzwehbPuIH7XpULQUJfNBzZ+jtOFbGIPY72gkupFIUoUqxAhOr1Cbb6AG2KtHRJRJ90P
	VfKatvuvHH15GM6HB36vVIjrFssKYaan77obShIcWV20qCRHStrkAzynPD4NVF7p/JmIR2bzcAI
	j3tj9oPDwrDkaC0k5TmPauY367lr76fYJU/Z0GY0pc5GmBxeHYhIegKHqdWIJM/ETaRR/Qv2ldf
	yhRr1E8Dc=
X-Received: by 2002:a05:6402:3884:b0:698:663d:d7bd with SMTP id
 4fb4d7f45d1cf-69e652730cbmr2055740a12.11.1784352697891; Fri, 17 Jul 2026
 22:31:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260718033122.2372985-1-rosenp@gmail.com> <20260718034659.0A03B1F000E9@smtp.kernel.org>
In-Reply-To: <20260718034659.0A03B1F000E9@smtp.kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 17 Jul 2026 22:31:26 -0700
X-Gm-Features: AUfX_mx0m19_QeTggddpkvrYszagFFHMcDqnfmkRbjd7z_tDC3DatRC7LaSALCc
Message-ID: <CAKxU2N_TBzHSu9e8pgD4DA3uJ8+VQfSdDOrgfWbz-bwrnJe+1g@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: fsl_raid: replace in_be32/out_be32 with ioread32be/iowrite32be
To: sashiko-reviews@lists.linux.dev
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2026 at 8:47=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 4 potential issu=
e(s) to consider:
>
> Pre-existing issues:
Based on these. I think this should be defered.
> - [Critical] `request_irq` is used without `devm_` and is never freed on =
error paths or during device removal, leading to Use-After-Free in the inte=
rrupt handler.
> - [High] The driver configures a 40-bit DMA mask but incorrectly programs=
 the 64-bit ring base addresses, truncating upper address bits and incorrec=
tly placing the lowest 4 bits into the high address register, causing silen=
t memory corruption for high memory allocations.
> - [High] Deadlock in `fsl_re_dequeue` due to invoking DMA client callback=
 with the channel spinlock held.
> - [High] Unchecked return value of `fsl_re_chan_probe` causes a NULL poin=
ter dereference during device removal.
> --
>
> --- Patch [1]: [PATCH] dmaengine: fsl_raid: replace in_be32/out_be32 with=
 ioread32be/iowrite32be ---
> commit 9a55b4c8c34b72fe5484852d6708a7ea677fc0df
> Author: Rosen Penev <rosenp@gmail.com>
>
> dmaengine: fsl_raid: replace in_be32/out_be32 with ioread32be/iowrite32be
>
> This commit replaces ppc4xx-specific accessors (in_be32/out_be32) with
> generic portable helpers (ioread32be/iowrite32be) in the fsl_raid driver.
> It also enables COMPILE_TEST for extra compile coverage.
>
> > diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
> > index 2d86f61105e52..e559c636bf552 100644
> > --- a/drivers/dma/fsl_raid.c
> > +++ b/drivers/dma/fsl_raid.c
> [ ... ]
> > @@ -167,7 +167,7 @@ static void fsl_re_dequeue(struct tasklet_struct *t=
)
> >       fsl_re_cleanup_descs(re_chan);
> >
> >       spin_lock_irqsave(&re_chan->desc_lock, flags);
> > -     count =3D FSL_RE_SLOT_FULL(in_be32(&re_chan->jrregs->oubring_slot=
_full));
> > +     count =3D FSL_RE_SLOT_FULL(ioread32be(&re_chan->jrregs->oubring_s=
lot_full));
>
> [Severity: High]
> This is a pre-existing issue, but can this lead to a deadlock?
>
> Looking at fsl_re_dequeue(), it acquires the desc_lock spinlock using
> spin_lock_irqsave() and holds it while processing completed descriptors:
>
> spin_lock_irqsave(&re_chan->desc_lock, flags);
> ...
> if (found) {
>         fsl_re_desc_done(desc);
>         list_move_tail(&desc->node, &re_chan->ack_q);
> }
>
> The fsl_re_desc_done() function synchronously invokes the client callback
> via dmaengine_desc_get_callback_invoke().
>
> If the DMA client callback submits a new request, would it call
> fsl_re_tx_submit() and attempt to reacquire the exact same desc_lock,
> resulting in a deadlock?
>
> >       while (count--) {
> >               found =3D 0;
> >               hwdesc =3D &re_chan->oub_ring_virt_addr[re_chan->oub_coun=
t];
> [ ... ]
> > @@ -708,30 +707,23 @@ static int fsl_re_chan_probe(struct platform_devi=
ce *ofdev,
> >       }
> >
> >       /* Program the Inbound/Outbound ring base addresses and size */
> > -     out_be32(&chan->jrregs->inbring_base_h,
> > -              chan->inb_phys_addr & FSL_RE_ADDR_BIT_MASK);
> > -     out_be32(&chan->jrregs->oubring_base_h,
> > -              chan->oub_phys_addr & FSL_RE_ADDR_BIT_MASK);
> > -     out_be32(&chan->jrregs->inbring_base_l,
> > -              chan->inb_phys_addr >> FSL_RE_ADDR_BIT_SHIFT);
> > -     out_be32(&chan->jrregs->oubring_base_l,
> > -              chan->oub_phys_addr >> FSL_RE_ADDR_BIT_SHIFT);
> > -     out_be32(&chan->jrregs->inbring_size,
> > -              FSL_RE_RING_SIZE << FSL_RE_RING_SIZE_SHIFT);
> > -     out_be32(&chan->jrregs->oubring_size,
> > -              FSL_RE_RING_SIZE << FSL_RE_RING_SIZE_SHIFT);
> > +     iowrite32be(chan->inb_phys_addr & FSL_RE_ADDR_BIT_MASK, &chan->jr=
regs->inbring_base_h);
> > +     iowrite32be(chan->oub_phys_addr & FSL_RE_ADDR_BIT_MASK, &chan->jr=
regs->oubring_base_h);
> > +     iowrite32be(chan->inb_phys_addr >> FSL_RE_ADDR_BIT_SHIFT, &chan->=
jrregs->inbring_base_l);
> > +     iowrite32be(chan->oub_phys_addr >> FSL_RE_ADDR_BIT_SHIFT, &chan->=
jrregs->oubring_base_l);
>
> [Severity: High]
> This is a pre-existing issue, but does this correctly program the 64-bit
> DMA base addresses?
>
> The driver advertises 40-bit DMA address support in fsl_re_probe() by
> calling:
>
> dma_set_mask(dev, DMA_BIT_MASK(40));
>
> However, when writing the physical addresses here in fsl_re_chan_probe(),=
 it
> shifts the address right by FSL_RE_ADDR_BIT_SHIFT into inbring_base_l, an=
d
> extracts the lowest bits via FSL_RE_ADDR_BIT_MASK into inbring_base_h.
>
> If a DMA buffer is allocated above the 64GB boundary, will this drop the
> upper bits and extract the lowest bits into the high register, leading to
> the hardware reading or writing the wrong physical memory?
>
> [Severity: Critical]
> This is a pre-existing issue, but is there a missing IRQ cleanup here?
>
> Earlier in fsl_re_chan_probe(), the driver requests an interrupt without
> using the managed devm_ wrapper:
>
> ret =3D request_irq(chan->irq, fsl_re_isr, 0, chan->name, chandev);
>
> If fsl_re_chan_probe() fails later, or if the driver is unbound and
> fsl_re_remove_chan() is called, free_irq() is never called to unregister
> the handler.
>
> Since the chan structure is allocated with devm_kzalloc, will a dangling
> interrupt firing after the device is removed cause fsl_re_isr() to
> dereference the freed chan pointer and crash?
>
> > +     iowrite32be(FSL_RE_RING_SIZE << FSL_RE_RING_SIZE_SHIFT, &chan->jr=
regs->inbring_size);
> > +     iowrite32be(FSL_RE_RING_SIZE << FSL_RE_RING_SIZE_SHIFT, &chan->jr=
regs->oubring_size);
> [ ... ]
> > @@ -766,15 +758,15 @@ static int fsl_re_probe(struct platform_device *o=
fdev)
> >       re_priv->base =3D re_regs;
> >
> >       /* Program the RE mode */
> > -     out_be32(&re_regs->global_config, FSL_RE_NON_DPAA_MODE);
> > +     iowrite32be(FSL_RE_NON_DPAA_MODE, &re_regs->global_config);
>
> [Severity: High]
> This is a pre-existing issue, but are we missing an error check on the
> return value of fsl_re_chan_probe()?
>
> Later in fsl_re_probe(), the driver iterates over child nodes and calls
> fsl_re_chan_probe(), but ignores the return value and unconditionally
> increments total_chans:
>
> for_each_child_of_node(np, child) {
>         rc =3D of_device_is_compatible(child,
>                                      "fsl,raideng-v1.0-job-ring");
>         if (rc) {
>                 fsl_re_chan_probe(ofdev, child, ridx++, off);
>                 re_priv->total_chans++;
>         }
> }
>
> If fsl_re_chan_probe() fails (for example, failing to map an IRQ), the ar=
ray
> element re_priv->re_jrs[ridx] remains uninitialized.
>
> During module unload, fsl_re_remove_chan() unconditionally dereferences t=
he
> pointer when calling tasklet_kill(&chan->irqtask).
>
> Will this result in a NULL pointer dereference on cleanup if any channel
> failed to probe?
>
> >
> >       /* Program Galois Field polynomial */
> > -     out_be32(&re_regs->galois_field_config, FSL_RE_GFM_POLY);
> > +     iowrite32be(FSL_RE_GFM_POLY, &re_regs->galois_field_config);
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260718033122.23=
72985-1-rosenp@gmail.com?part=3D1
