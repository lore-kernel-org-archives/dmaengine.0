Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFF5346A0C
	for <dmaengine@vger.kernel.org>; Thu, 16 Jul 2026 18:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784226948; cv=pass; b=g65dUfqTtMbuWK6RT3woSb62Q7V6tvRFmI00DNVh1sAmgeyaM8g/UgX/YLAw2A/PzOJ+qaSfm3DGCQ+2l2cQDU7EcWG7Dz3ZhdJNtjfb8XmKW3MnqLFQ5/g0MxrkVRwNG7pV/now4QtVhmHABlfdAMyHtJHJ9PWZkd7HaKFbatE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784226948; c=relaxed/simple;
	bh=KuSPQH1PIT8HqjLDXw8Df6FITpqp/xSN0Y1rM0TwZeU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QPU31azJzG2qA5mSPXyDzFboh1JWoHuyFHl4SOhtoF9uNpj/gow6izu78YKedwoDjHjN9XQpyNO8pky+OG+mrVCdpIroaOFfTRvzq0RPP5uRqly1JR1KhGd3vRkLzjgt11GIG6g1ChKyXefRLERzxEltuqkfC9homRh+BbyYv6o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WBP6uQVv; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WBP6uQVv"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-69c5f6f7a40so3319370a12.0
        for <dmaengine@vger.kernel.org>; Thu, 16 Jul 2026 11:35:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784226943; cv=none;
        d=google.com; s=arc-20260327;
        b=dVUtnIpa3omGXMTX/zIEB1nOflis3LWl/zJlCVvKV9pgB5xG9dC//EeKQ6NXDnkiwB
         Wd7ywZV9ryB3OueMgqOSFHU+M1DWL8BP5JfjVI5XUPMKu5dOsIgRmfv28BNJ8YV8xDZo
         or/67lEhanzjlYIA1qaZ9gh/EqqtmhbTXwsrJCRRotCt33cHj/LgBk5fcaeE0DGnxua9
         zNpB8U2qb0jXLZyov1qyXf3ViSsY5+Smtdw3dcw5DV6yxd7BDkv1NQsBwvjgb3KdyGMS
         iBNma2+DhCBCrvmr6SXW8UtFRMg87W4efNIRmqS7M6IfxRDc6kMo/TR1KvISLP/W/nWX
         Zkiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kB+rnJqM+xTsqNMdF9Rk9QynNwvqNR0sY/Ay973UlGQ=;
        fh=qfuWBQ7eQ4UUv7HDrLQXFhxUKbyAroUFqYScBhqYvdU=;
        b=o9KnEwppmHEv14PXPPg/XBU1qGLx688JCkyNoosmZPfzuV9zZTEZOhvDy5Z16qWQ7o
         o8rqPR0TEO6pUgWyY+8T0oErdgB6OHDoRGINQQOY2hdOT2+B0xK74nrR8taXhVqsF+FX
         CLGvgd7IIGstWSu67z1rTWC1a57kc5vztpA5eil8VmToOWrBVxD/sKaDSPBXyIybps4T
         75gm6Zv8lQDnvgXHhSjfQs2Rzgqo6T4m3J5NY9jh/4/yMhXY0n3fiU65ch72VZlzVv+9
         IyrvoV2N2NrJ4M23SL5Urm3WRoiRx6Ej6XGOx+1LQni5xr2b8zlExXWJeQ8OUilbCHGo
         D2ZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784226943; x=1784831743; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kB+rnJqM+xTsqNMdF9Rk9QynNwvqNR0sY/Ay973UlGQ=;
        b=WBP6uQVvS+RGajlaTk96xhEe3MCF1C7oSqCzmtBiLtXyIHrdR7Apl54WZWr8yE9KCA
         yIlLcL0bC3ZMhypCZ6YrSteQs0LBVWgtJJRX9q7o7ZDA0PM9Rkzu5/II1qBJIXAAc6S/
         6slqNp4FBI20o9s6MQnOSr8eltxSw1UbVt3qM2qon0S1VRiIRZ+LOVP6HOvIxg5wKUqj
         0o8fbyUzMDmi+YZjJ2jiR4Pmn4a2m3XcVbcKG7YDg41hP+277mJpwqy20aT3cdQtdpE8
         94cn2GT9ynkj1YjsP0rx7DVrfFwnQyVCrE4hxrP2blrJcc0zbe018DfUur0cH7tVfTyp
         q2Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784226943; x=1784831743;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kB+rnJqM+xTsqNMdF9Rk9QynNwvqNR0sY/Ay973UlGQ=;
        b=eb06tocJQgu6BPyPGIPTcGgtCTeMwlIINi+qTHU+6HdtBdCGkmZ5jC5409FfyyGKiL
         vA5O1ermCr7fWsNlYkGYmMvWTflRgA+o1D1rXiH9zUQuY/Ft/kzRbAfVeKFM1Ckn2JAt
         OkJDB+dTHqzYJT/PtyNbC6QEfZbHf8rRrVIRPEpx3A4Xgq7jKGxQFeREHKKbAuuRRd3M
         X1LfalKUKkQwp5Wid6nlwLg11lGxN1qTtC3rCxW3/A5lSidI3xbxUyYVCLFMWdT1rEo9
         RcTJol7r8dBe1f2fk+mBrZWqOui1zw1erBiWizo1tLiET4cd6X6iqMPrm8sEzRmcJ8AP
         KJMw==
X-Gm-Message-State: AOJu0Yw89nzxD8hr0PB3USUfV84tu80tiNqScI7QhACqyvPPEzx8mA6k
	wdPKCYxKsO4vSSklIVQaNzHj78Cuh2IOhXJZkO8HewoVTyb/QWMogYsfcjpDAuTMkKRU0cAqFHZ
	kFeaN/PPboiabG8G/rCFdEFUIvX6vAMY=
X-Gm-Gg: AfdE7ckWtzvj5B2mIkYFCI540ogicSV+WZLV+VaaBgUsA6LuwQT/HPVEktlvUekfV0i
	o1BhJ7SlvRzu2x1/z4jQgP1ggZx41j1iV/AZLGHFnffbCiSwN+x3aD6rLMTirZaLYvsb0wfLOQt
	NB9L8ZjLBcq+hrp6Vm9Nab0CjUcIqKERTOS4IP+XCnxoNZDFVdsQea4UNGvj1HHsxmoAKyWy6V0
	Cg6tvEv9spbbPP2IcuDF89NSsA0CkCi5LIHb+FczuUak5BZbXKCozzExkidSbDPLpb4yb3iqKZ8
	UjDlga3gyZX1UVPR/nLA9Tnz8N+KgrJeLHjAyJnCQeLywus4+Sz+bVQZfIvuB8OeFgmo+hCp7Vn
	172oxVHIL1FVq8RoAtMHnFJEuaKNs9zLwmuAlPaqk/kA0Px8rK1YA89tTC4ZIh4eZfd325wzrY0
	6+DCJxfXA=
X-Received: by 2002:a05:6402:5304:b0:698:3b7c:7e5b with SMTP id
 4fb4d7f45d1cf-69e1a05b602mr5053989a12.39.1784226943053; Thu, 16 Jul 2026
 11:35:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714233855.870797-1-rosenp@gmail.com> <20260714233855.870797-3-rosenp@gmail.com>
 <alkOwebrTsoMTX7l@lizhi-Precision-Tower-5810>
In-Reply-To: <alkOwebrTsoMTX7l@lizhi-Precision-Tower-5810>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 16 Jul 2026 11:35:31 -0700
X-Gm-Features: AUfX_mx3wGx4LMmujU_R7dacaBQ7NKVQjEuqSgamvKVf5d5Il1MwzTFjuVSoNtE
Message-ID: <CAKxU2N_iW3ygrzfPDBvSkeOOxoA0eHG_bnASLZbhV4aYphDrKw@mail.gmail.com>
Subject: Re: [PATCH 2/3] dma: fsl_raid: keep MMIO bases as void __iomem and
 cast at access
To: Frank Li <Frank.li@oss.nxp.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2026 at 10:03=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> wr=
ote:
>
> On Tue, Jul 14, 2026 at 04:38:54PM -0700, Rosen Penev wrote:
> > The fsl_re_ctrl and fsl_re_chan_cfg structures describe memory-mapped
> > RAID Engine registers accessed only via ioread32be()/iowrite32be(), yet
> > the pointers to them (re_regs in struct fsl_re_drv_private, and jrregs
> > in struct fsl_re_chan) were not __iomem-qualified, so sparse emitted
> > "different address spaces" warnings for every register access.
> >
> > Store both MMIO bases as a plain void __iomem * and derive jrregs with
> > void __iomem * arithmetic from re_regs, rather than carrying typed
> > register struct pointers through the driver. Each function that touches
> > the registers introduces a local typed pointer (struct fsl_re_ctrl
> > __iomem *ctrl / struct fsl_re_chan_cfg __iomem *jr) and uses ->field,
> > which is the idiomatic kernel pattern and keeps the registers' __iomem
> > qualification intact.
>
> Any document or reference show this is idiomatic kernel pattern?
Closest thing I can find is

https://lkml.indiana.edu/hypermail/linux/kernel/0409.1/2592.html

As the link mentions, it's real nice to avoid the unnecessary casting in

chan->jrregs =3D (struct fsl_re_chan_cfg *)((u8 *)re_priv->re_regs +
               off + ptr);

sparse would flag that anyway. __iomem would need to be added to both point=
ers.
>
> Frank
>
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Fixes: https://lore.kernel.org/oe-kbuild-all/202008111749.yy85rFMD%25lk=
p@intel.com/
> > Assisted-by: opencode:hy3-free
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/dma/fsl_raid.c | 66 ++++++++++++++++++++----------------------
> >  drivers/dma/fsl_raid.h |  4 +--
> >  2 files changed, 34 insertions(+), 36 deletions(-)
> >
> > diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
> > index 888f55b672a5..47ebdf274331 100644
> > --- a/drivers/dma/fsl_raid.c
> > +++ b/drivers/dma/fsl_raid.c
> > @@ -106,15 +106,17 @@ static dma_cookie_t fsl_re_tx_submit(struct dma_a=
sync_tx_descriptor *tx)
> >  static void fsl_re_issue_pending(struct dma_chan *chan)
> >  {
> >       struct fsl_re_chan *re_chan;
> > +     struct fsl_re_chan_cfg __iomem *jr;
> >       int avail;
> >       struct fsl_re_desc *desc, *_desc;
> >       unsigned long flags;
> >
> >       re_chan =3D container_of(chan, struct fsl_re_chan, chan);
> > +     jr =3D re_chan->jrregs;
> >
> >       spin_lock_irqsave(&re_chan->desc_lock, flags);
> >       avail =3D FSL_RE_SLOT_AVAIL(
> > -             in_be32(&re_chan->jrregs->inbring_slot_avail));
> > +             in_be32(&jr->inbring_slot_avail));
> >
> >       list_for_each_entry_safe(desc, _desc, &re_chan->submit_q, node) {
> >               if (!avail)
> > @@ -127,7 +129,7 @@ static void fsl_re_issue_pending(struct dma_chan *c=
han)
> >
> >               re_chan->inb_count =3D (re_chan->inb_count + 1) &
> >                                               FSL_RE_RING_SIZE_MASK;
> > -             out_be32(&re_chan->jrregs->inbring_add_job, FSL_RE_ADD_JO=
B(1));
> > +             out_be32(&jr->inbring_add_job, FSL_RE_ADD_JOB(1));
> >               avail--;
> >       }
> >       spin_unlock_irqrestore(&re_chan->desc_lock, flags);
> > @@ -158,6 +160,7 @@ static void fsl_re_cleanup_descs(struct fsl_re_chan=
 *re_chan)
> >  static void fsl_re_dequeue(struct tasklet_struct *t)
> >  {
> >       struct fsl_re_chan *re_chan =3D from_tasklet(re_chan, t, irqtask)=
;
> > +     struct fsl_re_chan_cfg __iomem *jr =3D re_chan->jrregs;
> >       struct fsl_re_desc *desc, *_desc;
> >       struct fsl_re_hw_desc *hwdesc;
> >       unsigned long flags;
> > @@ -167,7 +170,7 @@ static void fsl_re_dequeue(struct tasklet_struct *t=
)
> >       fsl_re_cleanup_descs(re_chan);
> >
> >       spin_lock_irqsave(&re_chan->desc_lock, flags);
> > -     count =3D FSL_RE_SLOT_FULL(in_be32(&re_chan->jrregs->oubring_slot=
_full));
> > +     count =3D FSL_RE_SLOT_FULL(in_be32(&jr->oubring_slot_full));
> >       while (count--) {
> >               found =3D 0;
> >               hwdesc =3D &re_chan->oub_ring_virt_addr[re_chan->oub_coun=
t];
> > @@ -192,8 +195,7 @@ static void fsl_re_dequeue(struct tasklet_struct *t=
)
> >               oub_count =3D (re_chan->oub_count + 1) & FSL_RE_RING_SIZE=
_MASK;
> >               re_chan->oub_count =3D oub_count;
> >
> > -             out_be32(&re_chan->jrregs->oubring_job_rmvd,
> > -                      FSL_RE_RMVD_JOB(1));
> > +             out_be32(&jr->oubring_job_rmvd, FSL_RE_RMVD_JOB(1));
> >       }
> >       spin_unlock_irqrestore(&re_chan->desc_lock, flags);
> >  }
> > @@ -201,12 +203,12 @@ static void fsl_re_dequeue(struct tasklet_struct =
*t)
> >  /* Per Job Ring interrupt handler */
> >  static irqreturn_t fsl_re_isr(int irq, void *data)
> >  {
> > -     struct fsl_re_chan *re_chan;
> > +     struct device *dev =3D data;
> > +     struct fsl_re_chan *re_chan =3D dev_get_drvdata(dev);
> > +     struct fsl_re_chan_cfg __iomem *jr =3D re_chan->jrregs;
> >       u32 irqstate, status;
> >
> > -     re_chan =3D dev_get_drvdata((struct device *)data);
> > -
> > -     irqstate =3D in_be32(&re_chan->jrregs->jr_interrupt_status);
> > +     irqstate =3D in_be32(&jr->jr_interrupt_status);
> >       if (!irqstate)
> >               return IRQ_NONE;
> >
> > @@ -216,13 +218,13 @@ static irqreturn_t fsl_re_isr(int irq, void *data=
)
> >        * need to do something more than just crashing
> >        */
> >       if (irqstate & FSL_RE_ERROR) {
> > -             status =3D in_be32(&re_chan->jrregs->jr_status);
> > +             status =3D in_be32(&jr->jr_status);
> >               dev_err(re_chan->dev, "chan error irqstate: %x, status: %=
x\n",
> >                       irqstate, status);
> >       }
> >
> >       /* Clear interrupt */
> > -     out_be32(&re_chan->jrregs->jr_interrupt_status, FSL_RE_CLR_INTR);
> > +     out_be32(&jr->jr_interrupt_status, FSL_RE_CLR_INTR);
> >
> >       tasklet_schedule(&re_chan->irqtask);
> >
> > @@ -627,6 +629,7 @@ static int fsl_re_chan_probe(struct platform_device=
 *ofdev,
> >       struct device *dev, *chandev;
> >       struct fsl_re_drv_private *re_priv;
> >       struct fsl_re_chan *chan;
> > +     struct fsl_re_chan_cfg __iomem *jr;
> >       struct dma_device *dma_dev;
> >       u32 ptr;
> >       u32 status;
> > @@ -657,8 +660,8 @@ static int fsl_re_chan_probe(struct platform_device=
 *ofdev,
> >               goto err_free;
> >       }
> >
> > -     chan->jrregs =3D (struct fsl_re_chan_cfg *)((u8 *)re_priv->re_reg=
s +
> > -                     off + ptr);
> > +     jr =3D re_priv->re_regs + off + ptr;
> > +     chan->jrregs =3D jr;
> >
> >       /* read irq property from dts */
> >       chan->irq =3D irq_of_parse_and_map(np, 0);
> > @@ -709,30 +712,23 @@ static int fsl_re_chan_probe(struct platform_devi=
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
> > +     out_be32(&jr->inbring_base_h, chan->inb_phys_addr & FSL_RE_ADDR_B=
IT_MASK);
> > +     out_be32(&jr->oubring_base_h, chan->oub_phys_addr & FSL_RE_ADDR_B=
IT_MASK);
> > +     out_be32(&jr->inbring_base_l, chan->inb_phys_addr >> FSL_RE_ADDR_=
BIT_SHIFT);
> > +     out_be32(&jr->oubring_base_l, chan->oub_phys_addr >> FSL_RE_ADDR_=
BIT_SHIFT);
> > +     out_be32(&jr->inbring_size, FSL_RE_RING_SIZE << FSL_RE_RING_SIZE_=
SHIFT);
> > +     out_be32(&jr->oubring_size, FSL_RE_RING_SIZE << FSL_RE_RING_SIZE_=
SHIFT);
> >
> >       /* Read LIODN value from u-boot */
> > -     status =3D in_be32(&chan->jrregs->jr_config_1) & FSL_RE_REG_LIODN=
_MASK;
> > +     status =3D in_be32(&jr->jr_config_1) & FSL_RE_REG_LIODN_MASK;
> >
> >       /* Program the CFG reg */
> > -     out_be32(&chan->jrregs->jr_config_1,
> > -              FSL_RE_CFG1_CBSI | FSL_RE_CFG1_CBS0 | status);
> > +     out_be32(&jr->jr_config_1, FSL_RE_CFG1_CBSI | FSL_RE_CFG1_CBS0 | =
status);
> >
> >       dev_set_drvdata(chandev, chan);
> >
> >       /* Enable RE/CHAN */
> > -     out_be32(&chan->jrregs->jr_command, FSL_RE_ENABLE);
> > +     out_be32(&jr->jr_command, FSL_RE_ENABLE);
> >
> >       return 0;
> >
> > @@ -752,6 +748,7 @@ static int fsl_re_probe(struct platform_device *ofd=
ev)
> >       u8 ridx =3D 0;
> >       struct dma_device *dma_dev;
> >       struct resource *res;
> > +     struct fsl_re_ctrl __iomem *re_regs;
> >       int rc;
> >       struct device *dev =3D &ofdev->dev;
> >
> > @@ -767,17 +764,18 @@ static int fsl_re_probe(struct platform_device *o=
fdev)
> >       re_priv->re_regs =3D devm_ioremap(dev, res->start, resource_size(=
res));
> >       if (!re_priv->re_regs)
> >               return -EBUSY;
> > +     re_regs =3D re_priv->re_regs;
> >
> >       /* Program the RE mode */
> > -     out_be32(&re_priv->re_regs->global_config, FSL_RE_NON_DPAA_MODE);
> > +     out_be32(&re_regs->global_config, FSL_RE_NON_DPAA_MODE);
> >
> >       /* Program Galois Field polynomial */
> > -     out_be32(&re_priv->re_regs->galois_field_config, FSL_RE_GFM_POLY)=
;
> > +     out_be32(&re_regs->galois_field_config, FSL_RE_GFM_POLY);
> >
> >       dev_info(dev, "version %x, mode %x, gfp %x\n",
> > -              in_be32(&re_priv->re_regs->re_version_id),
> > -              in_be32(&re_priv->re_regs->global_config),
> > -              in_be32(&re_priv->re_regs->galois_field_config));
> > +              in_be32(&re_regs->re_version_id),
> > +              in_be32(&re_regs->global_config),
> > +              in_be32(&re_regs->galois_field_config));
> >
> >       dma_dev =3D &re_priv->dma_dev;
> >       dma_dev->dev =3D dev;
> > diff --git a/drivers/dma/fsl_raid.h b/drivers/dma/fsl_raid.h
> > index 69d743c04973..6069615e2e1e 100644
> > --- a/drivers/dma/fsl_raid.h
> > +++ b/drivers/dma/fsl_raid.h
> > @@ -256,7 +256,7 @@ struct fsl_re_hw_desc {
> >  struct fsl_re_drv_private {
> >       u8 total_chans;
> >       struct dma_device dma_dev;
> > -     struct fsl_re_ctrl *re_regs;
> > +     void __iomem *re_regs;
> >       struct fsl_re_chan *re_jrs[FSL_RE_MAX_CHANS];
> >       struct dma_pool *cf_desc_pool;
> >       struct dma_pool *hw_desc_pool;
> > @@ -273,7 +273,7 @@ struct fsl_re_chan {
> >       struct device *dev;
> >       struct fsl_re_drv_private *re_dev;
> >       struct dma_chan chan;
> > -     struct fsl_re_chan_cfg *jrregs;
> > +     void __iomem *jrregs;
> >       int irq;
> >       struct tasklet_struct irqtask;
> >       u32 alloc_count;
> > --
> > 2.55.0
> >
