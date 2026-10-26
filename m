Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793050952;
	b=bygamUDRYpYQA/B6LVmpjZMJFrVGG8ktxsnq1y5YQuM/WBiC9FH0VRCCumV/8EccL61S
	 t0Ugb8pZrC59Hl/gmJWNrdxCUrjVZt8xZagF4ExTH/NnXSygDCG6te+eM+PRaY0Ka/3kx
	 ulPw+Zp+zIslOGlGm/d2Xxjaa435Vj8LQZNBL4PrU4EC6Naf60QtbibTOwxGcixqhR2Va
	 O1Wq/aLhh2pHHPjKjeDHUnqdYi/TBB2vvZt/GTOBBoJkjYcepx4dkeiy4Y+ev3u88OgV9
	 +1MHubvgokLmzwiTpcMVrxuoVqpqxV1TliEAmeaPpJQ6/HNdC2PAIOzhXlJu6ynd6Jw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793050952;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZjI2lcwuDm0dzr2macE/psmDs5xURkLGTFGCf/yYSiE=;
	b=MKNu4K3n8Gl/PTauPMGgN0U0V3zw4qFPUDkza68TyWk8mAcQ+R8RMMG0oA2n2xWlz48t
	 HnuO5z4SMuWa2dJ6Jo+0SW9Xio1x+w5gcbaNmWAUPE+2ofUNW2a4Fj5r4+eAFVNnI9Qcf
	 29FiNjeQvrMW+JZFb3ZlXDkHWKQDgh/ERX+rSF7e32DHypeXVY6vcc8C6tuF/lc+85Sn4
	 Qup/kuyaZKVQCAUZk3Nx0N486F+WIqj0CSiNVp24CsHOfR0ChtwG0aEBLcvDHypoeW6OI
	 LBnIQRQTePCTEDr2Pe8EY9MxxiLsSs3AUKAQclh+KCoTp01BEkWkvQYEvaWufACGIow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ha59ykEu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.48
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68AB606A31A
	for <dmaengine@vger.kernel.org>; Mon, 26 Oct 2026 21:42:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B68AB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ha59ykEu
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7cc1cf48a39so778000137.1
        for <dmaengine@vger.kernel.org>; Mon, 26 Oct 2026 14:42:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793050951; cv=none;
        d=google.com; s=arc-20260327;
        b=Uzc6zhHg+jHPf402iC43m2JpUbrFu/aCTn/GV9hzJn6J0nx/6uEEbzfDJTvUwJQSzS
         aaZlXVxOJrPvSjba//+WlWGUJcWbRXDOmCG69Buql09qW2j6RXWfqyVmpEJiLcE/zrvn
         9YtwsMj4UmBKffrrfZLVTbYQx9N4rbxgDrqm/dIMgjgyRJPkD/+5dRxKTl6verwPgCtd
         vkWRieoVEQyxQ7I4Xqrg8DxFwPqXPZVidKd1GOQvBHqiNQTWkZaBkuXfwaQOl6mo2rCA
         Pxa+VOzv7SOvGiRviEwgVowiLtuAZfEylzUxc95JIJYRlRY64HfGuC3CIAPBH5tuoWij
         WffQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZjI2lcwuDm0dzr2macE/psmDs5xURkLGTFGCf/yYSiE=;
        fh=L3kqN6znQ6J8zhU8OU7zYTK33USjfDhV1VUndaNjYbs=;
        b=j/w9OjAB/Hrkn77AEOlbJdTtG0JOglytWE41zHcQA425QNGg4PS9TgXVxBKTMwjBxy
         pHvNACCaBah6cbHzXbv1M6T1+0VwctTekoEs+lYXUNCPmGkgq3T3xJNPTMz+oI/nuXds
         h1W5aIxbrmd7JX/ILw549n6+5Fe9ZD0+e0cbvQuN8406enQIqC6NE8nsQE+y+tJjjGt8
         7fWtR9PWCsnGFNppS6anwexTEwcxZbRz/Nc1xXG6BWwCOLS1Q6GQLtzqXknyOpcW3o94
         o5ZQ8PwvAsP88afdrY2cIkkxm693XNvYBTDykOVz83rznShZJxKq2T/771tMYNfhtbft
         x8eA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793050951; x=1793655751; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZjI2lcwuDm0dzr2macE/psmDs5xURkLGTFGCf/yYSiE=;
        b=ha59ykEuNF74RycQCH+a6TH+JXppw03Ay8QNH8f+HyULAAlsYp8791/wEZzrxJxatt
         5ZiI7qqTvsOyAh2FDHJ2X91oxmRdrtSsizD0W8ulG/Ve2ZzrTq8Wk7k+2DD+OqO/8K18
         4c/1kviuQklb1CmuHvygn7cenFVpqOlqjJQFBmDljgXQT0cQRWusN7f49DbXfZOODr1B
         ttpZxmtmmwyy3jkdaK8HftT8WjFeuqIe1BvVA6EBZv3RPr5aiThF9ZI0j9fji9b3WJph
         0f0Jzp9b8upilo8HaQeBnynk6mlHrmyK/mPJwf3LnwqY7oFLWAl/Lgs5zduizroCNdBY
         33dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793050951; x=1793655751;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZjI2lcwuDm0dzr2macE/psmDs5xURkLGTFGCf/yYSiE=;
        b=AOLVgTrzgFWA23AKMoauypnBKWBm/rdK3WQ5TiReDo40BZKD/ix/OWto7bBxhy1X54
         /LRsiC24A2wCQtGRSWlADaLnliJGZ8BKQqGQiIF1gu9GGKTdtQqcTeSao0qdCkyzGq5w
         iUxoCfingN/FtH9IAJu3hReQ1NNRrMtS55Nmb7LN6FTQxCTfq2LmwJSNa2KBYFNQYJjC
         TOzVvyGq3anZtIPCx3gbWU89nLQLSjMhObIg/RKsUkjqHFNUNvjx9rdi6WyFUbcaVYbs
         sBq/ZPs5VL+3T9UeUimBtD+41gGxhLFC7nl+D54vcGSHQI8e9eYvJEMRmzjnDM7wfo+g
         cDIw==
X-Forwarded-Encrypted: i=1; AKwUvByx6NNzPEHquJlOwtXfLJ1l78L+4bs4t3uyZeFS1LA6Ty9KrOS7SdoL0FRnLRT85rOleE8hO1EI+y8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcpqjlwHaiHGaOMnb5mAZdIdMvoJI1HU39PpOJkW48ZzmoRN3o
	wx2VGcYsGBJ+YHqOP3HcUifvXi3g5F15IGTxUGCxleRPdu4lOnw4WJvst2mzlgUHVzlmcnBX0X0
	CwJj6kqy+mGoGApcNA/Tiw9GBvmKmAGs=
X-Gm-Gg: AYBFou2ysG9WjsPC0AZ0XHSewgYzrmKCpIQwySIDHWUEjqyOqXrseWWYmdoyheZKWde
	AzrXq3YyV0VsgO5dBFiEsvxjBVFC1bYYxTjRQBAfQ8r32FlKviM6ptMdTtFtCoNYhA/Gg0xRv3/
	VyJMOLfa0EIMdJC1VUw2i35jUcie4Rk/kBBXt232sgz5KzgRWr1Fy4c78DxN5yB2+MxhmYrG+UY
	lcFW+jajONiZJTXvWVXgJAdHnxEnUHGHs11YP/9HDOK76iL0InCnbQc85/tv9X36EfmH0Z9bfK1
	XoF2nyAlypoACdSxvxnDxPW4e/8ZcDe12su1X0i/7CisKFTxvl2mh/c3hSDC5gUx2wqINS8qd1W
	S+3iUoJz2ZQLIOY5juG90KLfwwkK6PZe0cu7b6BndniLbMbkTttZdGksuIyCslYw9tR8V78EUIf
	NqFwQlhbyodwNs2NWOtgMbRTI8jCs8vANn3jJOKNhfoO/5hq4cTJPzJ1hgK2qcdVwgYbwOwPRtA
	GPLGnXsOGT7AiSGV4ahdGQ14UaGkg==
X-Received: by 2002:a05:6102:334b:b0:7cc:33c9:b3d2 with SMTP id
 ada2fe7eead31-7ce5cdcaeecmr2526579137.25.1793050950510; Mon, 26 Oct 2026
 14:42:30 -0700 (PDT)
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-0-ef1acb0be768@gmail.com>
 <20261023-submit-sun6i-dma-lifetime-next-v1-v3-4-ef1acb0be768@gmail.com> <at_CpZrmQ986UEqv@SMW015318>
In-Reply-To: <at_CpZrmQ986UEqv@SMW015318>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 26 Oct 2026 15:42:18 -0600
X-Gm-Features: AclHuK-4-WgnFSyD4HMuuPSJHkf08GLM_LN-zKGiCU3BeJkAlzKME5OQQIP7X_g
Message-ID: <CADvTj4ptPZeNsjrdB9Lr2aJe9FKJ+w1m0ATfwXhO=zEo0APtvA@mail.gmail.com>
Subject: Re: [PATCH v3 4/9] dmaengine: sun6i: serialize physical channel ownership
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>, Maxime Ripard <mripard@kernel.org>, 
	Jens Kuske <jenskuske@gmail.com>, Jean-Francois Moine <moinejf@free.fr>, 
	Hongling Zeng <zenghongling@kylinos.cn>, Chengfeng Ye <cyeaa@connect.ust.hk>, 
	Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>, dmaengine@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 3:14=E2=80=AFPM Frank Li <Frank.li@oss.nxp.com> wro=
te:
>
> On Fri, Oct 23, 2026 at 05:38:23PM -0600, James Hilliard wrote:
> > The allocator changes vchan->phy and pchan->vchan under sdev->lock, but
> > termination reads the physical channel before taking either lock. The I=
RQ
> > handler also takes an unprotected owner snapshot. Termination can miss =
a
> > new assignment or detach an owner while an interrupt is about to comple=
te
> > its descriptor. A sampled IRQ can also be applied after reassignment.
> >
> > Protect physical-channel ownership with sdev->lock across allocation,
> > interrupt handling, pause, termination and residue queries. Read and
> > acknowledge IRQ status under that lock, and allocate and start each pen=
ding
> > channel in the same critical section. This also serializes updates to t=
he
> > shared interrupt-enable registers.
> >
> > Nest vc.lock inside the device lock when accessing descriptor lists or
> > updating cookies, including cyclic notifications. virt-dma takes vc.loc=
k
> > independently when preparing, submitting and completing descriptors, so
> > the device lock does not replace it. Client callbacks run outside both
> > locks in the virtual-channel tasklet.
> >
> > Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A3=
1 DMA controller")
> > Reported-by: Sashiko <sashiko-bot@kernel.org>
> > Closes: https://lore.kernel.org/r/20260706065650.34B131F00A3A@smtp.kern=
el.org
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  drivers/dma/sun6i-dma.c | 67 ++++++++++++++++++++++++-----------------=
--------
> >  1 file changed, 33 insertions(+), 34 deletions(-)
> >
> > diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> > index 435d7daa1c0f..d3a63c866645 100644
> > --- a/drivers/dma/sun6i-dma.c
> > +++ b/drivers/dma/sun6i-dma.c
> > @@ -217,6 +217,10 @@ struct sun6i_dma_dev {
> >       struct clk              *clk;
> >       struct clk              *clk_mbus;
> >       int                     irq;
> > +     /*
> > +      * Physical channels, pending list and registers; nests outside v=
c.lock.
> > +      * virt-dma also takes vc.lock independently for its lists and co=
okies.
> > +      */
> >       spinlock_t              lock;
> >       struct reset_control    *rstc;
> >       struct tasklet_struct   task;
> > @@ -524,11 +528,11 @@ static void sun6i_dma_tasklet(struct tasklet_stru=
ct *t)
> >       struct sun6i_dma_dev *sdev =3D from_tasklet(sdev, t, task);
> >       struct sun6i_vchan *vchan;
> >       struct sun6i_pchan *pchan;
> > -     unsigned int pchan_alloc =3D 0;
> >       unsigned int pchan_idx;
> >
> > +     spin_lock_irq(&sdev->lock);
> >       list_for_each_entry(vchan, &sdev->slave.channels, vc.chan.device_=
node) {
> > -             spin_lock_irq(&vchan->vc.lock);
> > +             spin_lock(&vchan->vc.lock);
> >
> >               pchan =3D vchan->phy;
> >
> > @@ -545,10 +549,9 @@ static void sun6i_dma_tasklet(struct tasklet_struc=
t *t)
> >                               pchan->vchan =3D NULL;
> >                       }
> >               }
> > -             spin_unlock_irq(&vchan->vc.lock);
> > +             spin_unlock(&vchan->vc.lock);
> >       }
> >
> > -     spin_lock_irq(&sdev->lock);
> >       for (pchan_idx =3D 0; pchan_idx < sdev->num_pchans; pchan_idx++) =
{
> >               pchan =3D &sdev->pchans[pchan_idx];
> >
> > @@ -557,31 +560,20 @@ static void sun6i_dma_tasklet(struct tasklet_stru=
ct *t)
> >
> >               vchan =3D list_first_entry(&sdev->pending,
> >                                        struct sun6i_vchan, node);
> > +             spin_lock(&vchan->vc.lock);
> >
> >               /* Remove from pending channels */
> >               list_del_init(&vchan->node);
> > -             pchan_alloc |=3D BIT(pchan_idx);
> >
> >               /* Mark this channel allocated */
> >               pchan->vchan =3D vchan;
> >               vchan->phy =3D pchan;
> >               dev_dbg(sdev->slave.dev, "pchan %u: alloc vchan %p\n",
> >                       pchan->idx, &vchan->vc);
> > +             sun6i_dma_start_desc(vchan);
> > +             spin_unlock(&vchan->vc.lock);
> >       }
> >       spin_unlock_irq(&sdev->lock);
> > -
> > -     for (pchan_idx =3D 0; pchan_idx < sdev->num_pchans; pchan_idx++) =
{
> > -             if (!(pchan_alloc & BIT(pchan_idx)))
> > -                     continue;
> > -
> > -             pchan =3D sdev->pchans + pchan_idx;
> > -             vchan =3D pchan->vchan;
> > -             if (vchan) {
> > -                     spin_lock_irq(&vchan->vc.lock);
> > -                     sun6i_dma_start_desc(vchan);
> > -                     spin_unlock_irq(&vchan->vc.lock);
> > -             }
> > -     }
> >  }
> >
> >  static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
> > @@ -590,9 +582,11 @@ static irqreturn_t sun6i_dma_interrupt(int irq, vo=
id *dev_id)
> >       u32 channels_per_reg =3D sdev->cfg->num_channels_per_reg;
> >       struct sun6i_vchan *vchan;
> >       struct sun6i_pchan *pchan;
> > +     unsigned long flags;
> >       int i, j, ret =3D IRQ_NONE;
> >       u32 status;
> >
> > +     spin_lock_irqsave(&sdev->lock, flags);
> >       for (i =3D 0; i < DIV_ROUND_UP(sdev->num_pchans, channels_per_reg=
); i++) {
> >               status =3D sun6i_read_irq_stat(sdev, i);
> >               if (!status)
> > @@ -608,14 +602,14 @@ static irqreturn_t sun6i_dma_interrupt(int irq, v=
oid *dev_id)
> >                       pchan =3D sdev->pchans + i * channels_per_reg + j=
;
> >                       vchan =3D pchan->vchan;
> >                       if (vchan && (status & vchan->irq_type)) {
> > +                             spin_lock(&vchan->vc.lock);
> >                               if (vchan->cyclic) {
> >                                       vchan_cyclic_callback(&pchan->des=
c->vd);
> >                               } else {
> > -                                     spin_lock(&vchan->vc.lock);
> >                                       vchan_cookie_complete(&pchan->des=
c->vd);
> >                                       pchan->done =3D pchan->desc;
> > -                                     spin_unlock(&vchan->vc.lock);
> >                               }
> > +                             spin_unlock(&vchan->vc.lock);
> >                       }
> >
> >                       status =3D status >> DMA_IRQ_CHAN_WIDTH;
> > @@ -625,6 +619,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, voi=
d *dev_id)
> >                       tasklet_schedule(&sdev->task);
> >               ret =3D IRQ_HANDLED;
> >       }
> > +     spin_unlock_irqrestore(&sdev->lock, flags);
> >
> >       return ret;
> >  }
> > @@ -931,19 +926,20 @@ static int sun6i_dma_pause(struct dma_chan *chan)
> >  {
> >       struct sun6i_dma_dev *sdev =3D to_sun6i_dma_dev(chan->device);
> >       struct sun6i_vchan *vchan =3D to_sun6i_vchan(chan);
> > -     struct sun6i_pchan *pchan =3D vchan->phy;
> > +     struct sun6i_pchan *pchan;
> >       unsigned long flags;
> >
> >       dev_dbg(dmaengine_chan_dev(chan), "vchan %p: pause\n", &vchan->vc=
);
> >
> > +     spin_lock_irqsave(&sdev->lock, flags);
> > +     pchan =3D vchan->phy;
> >       if (pchan) {
> >               writel(DMA_CHAN_PAUSE_PAUSE,
> >                      pchan->base + DMA_CHAN_PAUSE);
> >       } else {
> > -             spin_lock_irqsave(&sdev->lock, flags);
> >               list_del_init(&vchan->node);
>
> suppose need vchan lock here?

vchan->node links the channel into sdev->pending; it is separate from
virt-dma's descriptor-list nodes. All runtime accesses to that pending
list are protected by sdev->lock.

The same lock protects vchan->phy, so it also keeps the physical-channel
assignment stable while pause() checks it and either pauses the hardware
or removes the channel from the pending list.

resume() additionally needs vc.lock because it inspects vc.desc_issued,
and issue_pending() needs it to move descriptors between virt-dma lists.
pause() does not access those lists or cookies, so taking vc.lock here
would not protect any additional state.

>
> Frank
> > -             spin_unlock_irqrestore(&sdev->lock, flags);
> >       }
> > +     spin_unlock_irqrestore(&sdev->lock, flags);
> >
> >       return 0;
> >  }
> > @@ -978,15 +974,14 @@ static int sun6i_dma_terminate_all(struct dma_cha=
n *chan)
> >  {
> >       struct sun6i_dma_dev *sdev =3D to_sun6i_dma_dev(chan->device);
> >       struct sun6i_vchan *vchan =3D to_sun6i_vchan(chan);
> > -     struct sun6i_pchan *pchan =3D vchan->phy;
> > +     struct sun6i_pchan *pchan;
> >       unsigned long flags;
> >       LIST_HEAD(head);
> >
> >       spin_lock_irqsave(&sdev->lock, flags);
> > +     spin_lock(&vchan->vc.lock);
> > +     pchan =3D vchan->phy;
> >       list_del_init(&vchan->node);
> > -     spin_unlock_irqrestore(&sdev->lock, flags);
> > -
> > -     spin_lock_irqsave(&vchan->vc.lock, flags);
> >
> >       if (pchan && pchan->desc && pchan->desc !=3D pchan->done) {
> >               struct virt_dma_desc *vd =3D &pchan->desc->vd;
> > @@ -1007,7 +1002,8 @@ static int sun6i_dma_terminate_all(struct dma_cha=
n *chan)
> >               pchan->done =3D NULL;
> >       }
> >
> > -     spin_unlock_irqrestore(&vchan->vc.lock, flags);
> > +     spin_unlock(&vchan->vc.lock);
> > +     spin_unlock_irqrestore(&sdev->lock, flags);
> >
> >       vchan_dma_desc_free_list(&vchan->vc, &head);
> >
> > @@ -1018,8 +1014,9 @@ static enum dma_status sun6i_dma_tx_status(struct=
 dma_chan *chan,
> >                                          dma_cookie_t cookie,
> >                                          struct dma_tx_state *state)
> >  {
> > +     struct sun6i_dma_dev *sdev =3D to_sun6i_dma_dev(chan->device);
> >       struct sun6i_vchan *vchan =3D to_sun6i_vchan(chan);
> > -     struct sun6i_pchan *pchan =3D vchan->phy;
> > +     struct sun6i_pchan *pchan;
> >       struct sun6i_dma_lli *lli;
> >       struct virt_dma_desc *vd;
> >       struct sun6i_desc *txd;
> > @@ -1027,11 +1024,12 @@ static enum dma_status sun6i_dma_tx_status(stru=
ct dma_chan *chan,
> >       unsigned long flags;
> >       size_t bytes =3D 0;
> >
> > +     spin_lock_irqsave(&sdev->lock, flags);
> > +     spin_lock(&vchan->vc.lock);
> >       ret =3D dma_cookie_status(chan, cookie, state);
> >       if (ret =3D=3D DMA_COMPLETE || !state)
> > -             return ret;
> > -
> > -     spin_lock_irqsave(&vchan->vc.lock, flags);
> > +             goto out;
> > +     pchan =3D vchan->phy;
> >
> >       vd =3D vchan_find_desc(&vchan->vc, cookie);
> >       txd =3D to_sun6i_desc(&vd->tx);
> > @@ -1045,9 +1043,10 @@ static enum dma_status sun6i_dma_tx_status(struc=
t dma_chan *chan,
> >               bytes =3D sun6i_get_chan_size(pchan);
> >       }
> >
> > -     spin_unlock_irqrestore(&vchan->vc.lock, flags);
> > -
> >       dma_set_residue(state, bytes);
> > +out:
> > +     spin_unlock(&vchan->vc.lock);
> > +     spin_unlock_irqrestore(&sdev->lock, flags);
> >
> >       return ret;
> >  }
> >
> > --
> > 2.53.0
> >
