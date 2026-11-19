Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795108242;
	b=sqHnNBy2VxV+b8NI+g7Tl6q6PuA0EzjjHn0vN4VoPXpoyoWUtKDrKmHVsxGDYXqhhJf5
	 djACWDmUC30IWvGf8x7bx0lr/3S+uMORYfzn1jGgfaDKLGvBdHg0QVjPS1ehcgGFij7Dh
	 a2fVtWoCAC18fmWt0wY0hNYo0MG7rQrx5hiW29/n95QlVbMCZW7ct/y0nmM6GeeoUjneo
	 UrIaQCrvmWFklPnaiJ0GWtwrpwG2Y1tY2QIkKMzvQJVWYPG/vKxxkTXKoYq5BYxx7Agc4
	 GB9pvTjvz6xnB0PFGzvKHZiPwbsGbogSXp1puhNtUfZHY4Sg3gducBcNvo1sFYo4hGw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108242;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=IB66AhoGq+XBJdKAlfvQOH+UpQZfF5Ago45lSMFZXlA=;
	b=U+/emCc4kVDTTDxNTMioRw0Ncgmdq1F953k1WoAFwZ+ha6PwoWyK0TjAeMv2DWk0rbfZ
	 TcDwtOIeIUs12npn92JrUKL8+PoOn9brGQcTNlFT0ZzOh9ojjCOpfcqIdVQN25CpxF4xy
	 RFXIb7hC3+ORdB8ahKChxk9Qs3yAJnxLtXkHGAtH1QmOiMUgIUyIttPmPJP4OvJ1w+/BR
	 kcdXyKYOG++1lxQWLMF3b1Rgya29s3LyE2IAmZuUoq1VtEJ7stpm8VrP9ZDvVmG10MguB
	 f59VFKxE8SkB8k1go6rOSamUotgcOcYLLnzH/L1HzEK3S2NCBEURJpBgYk0+37wZ4EQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qahwVzfw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A4760A3832
	for <dmaengine@vger.kernel.org>; Thu, 19 Nov 2026 17:10:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90A4760A3832
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qahwVzfw
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b88d143160so3238901a12.1
        for <dmaengine@vger.kernel.org>; Thu, 19 Nov 2026 09:10:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795108241; cv=none;
        d=google.com; s=arc-20260327;
        b=Cx6JSHBW8dSnh31oY22yyEs8noyme9sUYUWN3ak6feaiOFubbIqZBCpPt7mSny/HAn
         ceWlHD81HDP+D1aUqG/PGc0cl6yQDexXnLhPGQwVnXEhoq8aDAr6NcoTtHYWjYXvQvXq
         kRn5q+Y7g/vDowtydaxFCIO1HpAyK2uJmD/jB3MprSLZh461NiehWEqalr2ayYx5xD/7
         R0BugWUhJhYXFDu3xIfIvauW3E2N0KRAqaffqSX0rlZwkFrrVtu6aTeaduspeT2RIDPN
         r1CcFMC0YkzkmVzRYf//O9Zj19z4aNp2ff/Ecr/6mypBICl2Sa3Lwz1rgFDXypXBlqht
         IPCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IB66AhoGq+XBJdKAlfvQOH+UpQZfF5Ago45lSMFZXlA=;
        fh=j4Xgcji7iuKj8n9cvBpq+xsdgdbz8n9elj9pslyP/Xg=;
        b=U+yZCqISs0I6wClrqt7x/ICd2xBVQI0WmiFZpLSXUYHwNQSc0ZHSVrUxPS7ZZ0KCcm
         PYtnRJnQuQP4Bq7RllouYUBD3AoAA3x2iuBH/m38lJiqAsRTpwvxtw0gKHtx5gDFKxmY
         BnqJtjiIot4VOELWB0zrAM50kbSOxvrmJLtlnxeJ+JC8/rfD4ifA+qoUu7oHx0NPw1De
         x3VW6llgdjbg3Cc2Pzn78aGXDUs0+9ywFgXdwOPF++Llqmc2h60O7cYEqU8GDH6epxCC
         PeR9EZGn1sPjaV7AfHPRAofIjrehG89Aw1dEBZjDBQoCh16CKWmSNtJUrbFvLmbudUX+
         TSCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795108241; x=1795713041; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IB66AhoGq+XBJdKAlfvQOH+UpQZfF5Ago45lSMFZXlA=;
        b=qahwVzfwOD/DJOA3hTSnXYTnM0w5bXqLYeN7AdR8C6JvJQjXcRlR3qdi7sHN1naNHf
         o8ZR2z1LOld/5w/j0A2veyd4mWuhm77NigR/sNoZbsv8eMzbW/hziI7SFln/dtj9SsPG
         5dvz3TWCshdPYsP2PZSEdUYqG3cnL1PUhcZFJ/oKE54Z3Gu0YOu3UL2Aov8QwQY6TEfG
         9zVab3GAhm7qqwkY90TfPwpoJxVvHlvNWrqFLelqAI+QhqspKFE3of0lK2rgXr6ZZoik
         fCqUAOLyAtFb9b3ivGowKBTsXRxZS3XBCLgDhQzBEHGX47v0qOeqXklc60HGUpJle27K
         1Vfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108241; x=1795713041;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IB66AhoGq+XBJdKAlfvQOH+UpQZfF5Ago45lSMFZXlA=;
        b=S3ltbdEdToD2uBhQf+ZdiqX80jq0RC5SF4otZiHfJPBjX4FVygzx18CEkjBxUKP3zy
         F7AiwPCqjUmMZd7Iy18iJkkARVyMt4jLu+7SgzXnizGbGeevzNKM9P2TEnKGeQx8K5LI
         QsngM7DBJVlnr2kHQYgsHJMb/QS3MgP3rVjTevnvF3pAOL17hSF0Ws2xH0g2C7n80nmQ
         z1bX85/IUSsi39a8j3Nesi033rOhwmVZdnTlgQ0R84ZQSBG3JnGa27yNdLHC5/I9cxNf
         9ofRRd3alVJL2r2wUbWFMeR+t7zBJv20xpy+TVTBycsy0cglmdgAGmeXBPGbc/HxP4jA
         aqOA==
X-Forwarded-Encrypted: i=1; AL+hErEoUBK1GNV+paF9GplHKtvLCogJeDDYVOzdKyFv2VXfX1pcNoTERbAO8m2rcMYUWcCrJHXUo+z3RIw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9VkudbZBuHN31wl22/+D+165e8jQGKmZntlaWB+X5wOqXXPFn3
	7EsPOUf5wQ7FqsDOEaAMF3/+gNvmsTGE4tzF1EU7YkeFMRm2DaPDpby3u8OiLVZ+5EV/ZWmiR1k
	wrRo8T/9yRV1ifNA6JxuGUswACM4sMx0EAwF5
X-Gm-Gg: AYBFou23aQ3KUgiZ4i4vP8Miv6mEyY7LWR838YkdcIWQd8+W6L/JyE5TlDx0cj43BDq
	2LJG3NtExl4kMbfldzcPy0RjzTprDCdj7c5oEpv1DlSE7Gd904Gs+59Ee7Nxa97+sxQ8N6uyQhI
	qWuWrjFTcuFAZPJ3lPQxVhqd7OKO535hKNm1DryVKkUdi++ZnxBN+pGFRhVyBes5j1tliphMBoQ
	Vxmk7h5CIesAzwQ8ZIOZXTCsMoQwhNkqpcsexuvtTFYHugRv7qMp7dSo4HXWRl0Kiob8K7kU+xM
	BZbBTdkS3Cer1/EZvVKUSQjvMOiLLZw6c1ty8OSpR3yt5Y7uoFJAOJ+4r3t3zOg6AWMmpeGQJs1
	LhrbmQN6FooaIJ1Z8dcoSun4LfGVLjQLmIdFsyjhsVX/knhgM33DDAwOL6rLfpzZYqJAqLVPTiO
	skZ66ccqTs+/CcwIog6kD4WSSg2o/ejUP1zAQcBHesFZ+yHH2VkXOtkQlatS+fD3U1LHL4QU6T8
	0KxALihUOtL/dWZkJ6v8mPMuFrq5g==
X-Received: by 2002:aa7:d798:0:b0:6b1:d439:5c5 with SMTP id
 4fb4d7f45d1cf-6ba37c7beb2mr15304a12.3.1795108240628; Thu, 19 Nov 2026
 09:10:40 -0800 (PST)
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-submit-dw-axi-dma-stop-pause-v1-v8-0-f8e7fe60594c@gmail.com>
 <20261119-submit-dw-axi-dma-stop-pause-v1-v8-7-f8e7fe60594c@gmail.com> <av8ncvLCe85P5j0r@SMW015318>
In-Reply-To: <av8ncvLCe85P5j0r@SMW015318>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 10:10:24 -0700
X-Gm-Features: AclHuK_Y7AlixNJBbpaDWLrVUhA0MRGjl2vg52iPc4aH9wpFGg6JJT-el35Sbf0
Message-ID: <CADvTj4rEztb25QikuQpZLndcKe8K_bvvQ7i4rcWE7=JMHyHv6g@mail.gmail.com>
Subject: Re: [PATCH v8 7/9] dmaengine: dw-axi-dmac: serialize interrupt status
 with channel reuse
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Sergey Khimich <serghox@gmail.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Sia Jee Heng <jee.heng.sia@intel.com>, 
	Baruch Siach <baruch@tkos.co.il>, Mitch Barnett <mitch@accuratesound.ca>, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 9:44=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> wro=
te:
>
> On Thu, Nov 19, 2026 at 09:01:02AM -0700, James Hilliard wrote:
> > The interrupt handler reads and acknowledges channel status before taki=
ng
> > the channel lock. Termination can finish and a new transfer can start
> > before the handler takes that lock. The saved completion or error statu=
s
> > then applies to the new descriptor, stopping it and completing its cook=
ie
> > before its DMA transfer has finished.
> >
> > Termination also leaves completion and error status pending. A subseque=
nt
> > interrupt can consume that status after the channel has been reused, ev=
en
> > if no handler was running when the old transfer was stopped.
> >
> > Read and acknowledge status under the channel lock and keep it held whi=
le
> > processing the event. Move locking out of the completion and error help=
ers
> > into their sole caller, and clear all channel status after a successful
> > stop. Status collection, descriptor ownership and channel reuse then sh=
are
> > the same serialization.
> >
> > Initialize the virtual channels before requesting the shared IRQs so ev=
ery
> > lock is ready before the interrupt handler can run.
> >
> > Fixes: 1fe20f1b8454 ("dmaengine: Introduce DW AXI DMAC driver")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 31 ++++++++++++------=
--------
> >  1 file changed, 14 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/d=
ma/dw-axi-dmac/dw-axi-dmac-platform.c
> > index 2547f9596ae6..2eeb902eaad3 100644
> > --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> > +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> > @@ -21,6 +21,7 @@
> >  #include <linux/iopoll.h>
> >  #include <linux/io-64-nonatomic-lo-hi.h>
> >  #include <linux/kernel.h>
> > +#include <linux/lockdep.h>
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> >  #include <linux/of_dma.h>
> > @@ -1072,9 +1073,8 @@ static void axi_chan_list_dump_lli(struct axi_dma=
_chan *chan,
> >  static noinline void axi_chan_handle_err(struct axi_dma_chan *chan, u3=
2 status)
> >  {
> >       struct virt_dma_desc *vd;
> > -     unsigned long flags;
> >
> > -     spin_lock_irqsave(&chan->vc.lock, flags);
> > +     lockdep_assert_held(&chan->vc.lock);
> >
> >       axi_chan_disable(chan);
> >
> > @@ -1083,7 +1083,7 @@ static noinline void axi_chan_handle_err(struct a=
xi_dma_chan *chan, u32 status)
> >       if (!vd) {
> >               dev_err(vchan_chan_dev(&chan->vc), "BUG: %s, IRQ with no =
descriptors\n",
> >                       axi_chan_name(chan));
> > -             goto out;
> > +             return;
> >       }
> >       /* Remove the completed descriptor from issued list */
> >       list_del(&vd->node);
> > @@ -1100,9 +1100,6 @@ static noinline void axi_chan_handle_err(struct a=
xi_dma_chan *chan, u32 status)
> >       chan->desc =3D NULL;
> >       chan->cyclic_restart =3D false;
> >       axi_chan_start_first_queued(chan);
> > -
> > -out:
> > -     spin_unlock_irqrestore(&chan->vc.lock, flags);
> >  }
> >
> >  static void axi_chan_block_xfer_complete(struct axi_dma_chan *chan)
> > @@ -1111,11 +1108,11 @@ static void axi_chan_block_xfer_complete(struct=
 axi_dma_chan *chan)
> >       struct axi_dma_hw_desc *hw_desc;
> >       struct axi_dma_desc *desc;
> >       struct virt_dma_desc *vd;
> > -     unsigned long flags;
> >       u64 llp;
> >       int i;
> >
> > -     spin_lock_irqsave(&chan->vc.lock, flags);
> > +     lockdep_assert_held(&chan->vc.lock);
> > +
> >       if (unlikely(axi_chan_is_hw_enable(chan))) {
> >               dev_err(vchan_chan_dev(&chan->vc), "BUG: %s caught DWAXID=
MAC_IRQ_DMA_TRF, but channel not idle!\n",
> >                       axi_chan_name(chan));
> > @@ -1127,7 +1124,7 @@ static void axi_chan_block_xfer_complete(struct a=
xi_dma_chan *chan)
> >       if (!vd) {
> >               dev_err(vchan_chan_dev(&chan->vc), "BUG: %s, IRQ with no =
descriptors\n",
> >                       axi_chan_name(chan));
> > -             goto out;
> > +             return;
> >       }
> >
> >       desc =3D vd_to_axi_desc(vd);
> > @@ -1159,9 +1156,6 @@ static void axi_chan_block_xfer_complete(struct a=
xi_dma_chan *chan)
> >               chan->desc =3D NULL;
> >               axi_chan_start_first_queued(chan);
> >       }
> > -
> > -out:
> > -     spin_unlock_irqrestore(&chan->vc.lock, flags);
> >  }
> >
> >  static irqreturn_t dw_axi_dma_interrupt(int irq, void *dev_id)
> > @@ -1169,6 +1163,7 @@ static irqreturn_t dw_axi_dma_interrupt(int irq, =
void *dev_id)
> >       struct axi_dma_chip *chip =3D dev_id;
> >       struct dw_axi_dma *dw =3D chip->dw;
> >       struct axi_dma_chan *chan;
> > +     unsigned long flags;
> >
> >       u32 status, i;
> >
> > @@ -1178,6 +1173,7 @@ static irqreturn_t dw_axi_dma_interrupt(int irq, =
void *dev_id)
> >       /* Poll, clear and process every channel interrupt status */
> >       for (i =3D 0; i < dw->hdata->nr_channels; i++) {
> >               chan =3D &dw->chan[i];
> > +             spin_lock_irqsave(&chan->vc.lock, flags);
> >               status =3D axi_chan_irq_read(chan);
> >               /* Leave suspension status for the pause and resume paths=
. */
> >               status &=3D ~DWAXIDMAC_IRQ_SUSPENDED;
> > @@ -1190,6 +1186,7 @@ static irqreturn_t dw_axi_dma_interrupt(int irq, =
void *dev_id)
> >                       axi_chan_handle_err(chan, status);
> >               else if (status & DWAXIDMAC_IRQ_DMA_TRF)
> >                       axi_chan_block_xfer_complete(chan);
> > +             spin_unlock_irqrestore(&chan->vc.lock, flags);
> >       }
> >
> >       /* Re-enable interrupts */
> > @@ -1220,7 +1217,7 @@ static int dma_chan_terminate_all(struct dma_chan=
 *dchan)
> >
> >               vchan_terminate_all(&chan->vc);
> >
> > -             axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
> > +             axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_ALL);
> >               chan->desc =3D NULL;
> >               chan->pause_requested =3D false;
> >               chan->is_paused =3D false;
> > @@ -1600,10 +1597,6 @@ static int dw_probe(struct platform_device *pdev=
)
> >       if (!dw->chan)
> >               return -ENOMEM;
> >
> > -     ret =3D axi_req_irqs(pdev, chip);
> > -     if (ret)
> > -             return ret;
> > -
> >       INIT_LIST_HEAD(&dw->dma.channels);
> >       for (i =3D 0; i < hdata->nr_channels; i++) {
> >               struct axi_dma_chan *chan =3D &dw->chan[i];
> > @@ -1617,6 +1610,10 @@ static int dw_probe(struct platform_device *pdev=
)
> >               vchan_init(&chan->vc, &dw->dma);
> >       }
> >
> > +     ret =3D axi_req_irqs(pdev, chip);
> > +     if (ret)
> > +             return ret;
> > +
>
> Most likely, irq request should after dma engine register. irq handle may
> use some DMAengine APIs.

Patch 9 [0] separates requesting the IRQ from allowing the handler to
service channels. Requesting it first means that if the IRQ request
fails, no DMA client has been given a channel it can't use.

Until DMAengine registration succeeds, the controller interrupts are
masked and irq_ready is false. If another device raises the shared
line in that window, our handler returns IRQ_NONE before accessing
any channel. A completion during registration stays pending until the
controller interrupts are enabled.

[0] https://lore.kernel.org/r/20261119-submit-dw-axi-dma-stop-pause-v1-v8-9=
-f8e7fe60594c@gmail.com/

>
> Frank
>
> >       /* Set capabilities */
> >       dma_cap_set(DMA_MEMCPY, dw->dma.cap_mask);
> >       dma_cap_set(DMA_SLAVE, dw->dma.cap_mask);
> >
> > --
> > 2.53.0
> >
