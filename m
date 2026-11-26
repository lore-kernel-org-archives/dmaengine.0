Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703380;
	b=yA7df3RdzWPRyAIdcPxiMQ/I3Gm62oGb80aE7YTQ3pyzesjHGS1F+eFv5BGdMwcmZiS8
	 D1scwvyTOvRQPPteQUTYasZpTfWaFUkaPyQkS8yljKxYdrjyGFKtLs1Oj1W4uCzj55y02
	 1m3PrVJrEyZdvVcZgQyQEDaaF7CCErmDJeB0x2Ckr+UYQdj8RttM0Ae1/2AzX6T0wBesP
	 zqS+So0EP5+u5tHqw3m0ilL26CNNhhZFMpkRcIF8TWrG09NGbpMPsIamLmR/z0bgGDMvv
	 nu4PZkpZKa+DI5juwwOvX0sPZThwHsM672NRoRN+o6F/wYMVnK8G0+aFFgJmUdtYl5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703380;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Go0TMbxFIn6Uh64J5GWsZj276nuCgaJAlCWObxr0QGU=;
	b=qhR7ToIhwzXnjKXoqqMyIM0Rb7A8aBP4yB14yzg/VQvvcTQghP+zOAsgZ0BJqoXLz0PI
	 PBOOxEL44jgDjkMzjE3YmUxSXhAEp21QESOTNNMygt8faoaAPzPbrqqxVD7B7aO1IyXmO
	 Y3X4vYBSSGoc3BfubFrNPlJFBF9UBvW4hcXX7m7W3PMY5GgeWLgC9pIqVpusGLy9Wad00
	 r2hdKrULXHFft7q69Uy7hdCnkyDW+XaEwWiuNE+8YIH/HodEbsyBw0A2U5b3T+rP3svn2
	 qEepRV9xa71qE8ZRaagrPyYeoLUo0J+qCKJ0IjDqzh9/qJfN0RCAk7JgI8rp2gw1FyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Pxj5aToy;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2AB606A323
	for <dmaengine@vger.kernel.org>; Thu, 26 Nov 2026 14:29:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A2AB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Pxj5aToy
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so64152955e9.1
        for <dmaengine@vger.kernel.org>; Thu, 26 Nov 2026 06:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795703377; x=1796308177; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Go0TMbxFIn6Uh64J5GWsZj276nuCgaJAlCWObxr0QGU=;
        b=Pxj5aToyp5zuyslVpU32TLw31Yz1JmqJCNehyB9UtgFts7ql+nnycG9J6q0lsbhSsP
         clym1pTOgpVt8qUXmCVR5mi0IgHAs6C4YnDr0rlCZ8mnJFDMLP8hFrrJbrBNJrGYjOam
         EcKk7wFteJmcNzTI/HaIoQrJq8adsEJ8RdcezFqcfmrIAUTsP8Doao4AwcMhHY7WxHqJ
         rVhbakdJjBHok1eivCk3Ie85UoiolkddoINOJ4OUnfkpFXd1trx4E6ZEFEfAdv1vKGpI
         mG0CWOS6vxI5b23AaXLHFEix2fJ2Ja07mMn85uigHbVDfOq++0Gfoj+FbG3R6Y09gxNK
         9w3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703377; x=1796308177;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Go0TMbxFIn6Uh64J5GWsZj276nuCgaJAlCWObxr0QGU=;
        b=IcMmw6AKynkBf51y3SINE3LB1ZU2Fgp4scKmxUx4yPy8Vx/ftf/64Ej5bwe3xQgM64
         /DuyZaPvBc/9SyHLH8gXW1IGNJBmi9CQRHOo2lwnHhYGqqcbsceEg5dKvGNp1jWja2Ex
         a4b6J7morVSGWlxgVT8lcxsuAv66aJ8b84cjvQWmN5x3xwhNlwUpC1Q+fHF6d1EXdi9r
         6arHOmnLpzmYm7w9BwLPQNpDJTS7s5C2ckptfq+bKuI5HYqqqI5D9DqflFF568bhOa5o
         i+FilkiC2FGg99YgWWQmVIgzHGIPWELOO022pmMO0ewxYBT2JNQtcxmOYyWZ3sHiIG8f
         Ka0Q==
X-Forwarded-Encrypted: i=1; AL+hErGPrTOioiGJuMIkAVLBXtPQo6mK6/f031pzqDgJBMj+T/iz4jFoLp/rLHVvanO/mifSW6ATXcMJBrY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pJlmVZEt/AGq143gOJAocc1CRIA0PnVBoR0hYGor6SX8z59vS
	O1/vP8CPshvb3vk6oEMO5UcE3Iwp4SiOLyfC2QyKxvZtzh/uT8N4HAtCUE69IGrw2qg=
X-Gm-Gg: AZFdTZckHReS5QHlt02atDGngOPgrbdUtQ213QAHurbOVz7niBbXLP87NGo+ZMUE8In
	ZGnGAjkxLzVUFx8+JI3MPwA5HZGcB36vMWkRlTynxTX6YkSiwgmsEdYBTR1fYMWmW3pGndqUQ8+
	YyWoS/mVdjswE17k06umKnEibqZI5J6ROlWzBep3E563N89dBbOg/JatyEtQld1ognLu1BqrT49
	1r0SslvSTky04i11cUjLQqT+Zd4mWlJ7YRjcOM8BDff+e9Ie9N3fTcfIP69nB3gAIi0UdDufYIo
	HnN3fpAtsht00fua3bc3jO+7Nkisf+baILFgWfTyYj8bsAvX8ZJ9/E7MNw4atiLAE5koDrqjze3
	Fq0CV+1HqJbhScujdXIBWfN4tqX3Gig2TBdHuM2jiKTXDyRF5plh5PR1D4Bx/llAwRwg12KXXhi
	OPIwbxjzd7HT8FCxWZQPLzUm18q6oen4Ukc3DQOF/W60Kdv1YqSO6zcBoBbLhy/TZ7VbFYbsOeW
	NaFSp52tU42HPzqph3lWX+tLnfhJTsShho24QwtPl47TbZ+dLFUSbrybbMOVcQ1ajVRQn08Jxuw
	8WvxpCPY8wQbnDm9B99fdCu7PvH6
X-Received: by 2002:a05:600c:a085:b0:4a5:26b8:4507 with SMTP id 5b1f17b1804b1-4bb8881e6c6mr419119205e9.21.1795703377520;
        Thu, 26 Nov 2026 06:29:37 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906e4ce6sm365232415e9.4.2026.11.26.06.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:29:37 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 26 Nov 2026 15:33:37 +0100
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dom Cobley <popcornmix@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 03/28] dmaengine: bcm2835: Add NO_WAIT_RESP,
 DMA_WIDE_SOURCE and DMA_WIDE_DEST flag
Message-ID: <awhDQbBKe0vLWbdr@apocalypse>
References: <20261123145728.29082-1-andrea.porta@suse.com>
 <20261123145728.29082-4-andrea.porta@suse.com>
 <awXlR5RAVl8XMVxA@lizhi-Precision-Tower-5810>
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awXlR5RAVl8XMVxA@lizhi-Precision-Tower-5810>

Hi Frank,

On 14:28 Tue 24 Nov     , Frank Li wrote:
> On Mon, Nov 23, 2026 at 03:56:41PM +0100, Andrea della Porta wrote:
> > From: Phil Elwell <phil@raspberrypi.com>
> >
> > Use bit 27 of the dreq value (the second cell of the DT DMA descriptor)
> > to request that the WAIT_RESP bit is not set.
> >
> > Use (reserved) bits 24 and 25 of the dreq value
> > (the second cell of the DT DMA descriptor) to request
> > that wide source reads or wide dest writes are required
> >
> > Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> > Signed-off-by: Phil Elwell <phil@raspberrypi.com>
> > Co-developed-by: Andrea della Porta <andrea.porta@suse.com>
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >  drivers/dma/bcm2835-dma.c | 25 +++++++++++++++++++++----
> >  1 file changed, 21 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
> > index 690f5ba1c439..118ba2f71dc8 100644
> > --- a/drivers/dma/bcm2835-dma.c
> > +++ b/drivers/dma/bcm2835-dma.c
> > @@ -145,6 +145,21 @@ struct bcm2835_desc {
> >  #define BCM2835_DMA_WAIT(x)	(((x) & 31) << 21) /* add DMA-wait cycles */
> >  #define BCM2835_DMA_NO_WIDE_BURSTS BIT(26) /* no 2 beat write bursts */
> >
> > +/* A fake bit to request that the driver doesn't set the WAIT_RESP bit. */
> > +#define BCM2835_DMA_NO_WAIT_RESP BIT(27)
> > +#define WAIT_RESP(x) (((x) & BCM2835_DMA_NO_WAIT_RESP) ? \
> > +		      0 : BCM2835_DMA_WAIT_RESP)
> > +
> 
> why need recorder these information at in hardware control block if it
> is reserved by hardware?

These bits are never written to the control block: they live in the upper bits of
the DREQ cell of the DT specifier and the driver translates them into the S_WIDTH/
D_WIDTH/WAIT_RESP bits of TI. *_PER_MAP() masks the DREQ to 5 bits, so nothing leaks
into the hardware.
v4 will move the definitions to a dt-bindings header and adds a comment to make
this clear.

Regards,
Andrea

> 
> Frank
> 
> > +/* A fake bit to request that the driver requires wide reads */
> > +#define BCM2835_DMA_WIDE_SOURCE BIT(24)
> > +#define WIDE_SOURCE(x) (((x) & BCM2835_DMA_WIDE_SOURCE) ? \
> > +		      BCM2835_DMA_S_WIDTH : 0)
> > +
> > +/* A fake bit to request that the driver requires wide writes */
> > +#define BCM2835_DMA_WIDE_DEST BIT(25)
> > +#define WIDE_DEST(x) (((x) & BCM2835_DMA_WIDE_DEST) ? \
> > +		      BCM2835_DMA_D_WIDTH : 0)
> > +
> >  /* debug register bits */
> >  #define BCM2835_DMA_DEBUG_LAST_NOT_SET_ERR	BIT(0)
> >  #define BCM2835_DMA_DEBUG_FIFO_ERR		BIT(1)
> > @@ -605,8 +620,9 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_memcpy(
> >  {
> >  	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
> >  	struct bcm2835_desc *d;
> > -	u32 info = BCM2835_DMA_D_INC | BCM2835_DMA_S_INC;
> > -	u32 extra = BCM2835_DMA_INT_EN | BCM2835_DMA_WAIT_RESP;
> > +	u32 info = BCM2835_DMA_D_INC | BCM2835_DMA_S_INC |
> > +		   WAIT_RESP(c->dreq) | WIDE_SOURCE(c->dreq) | WIDE_DEST(c->dreq);
> > +	u32 extra = BCM2835_DMA_INT_EN;
> >  	size_t max_len = bcm2835_dma_max_frame_length(c);
> >  	size_t frames;
> >
> > @@ -636,7 +652,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
> >  	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
> >  	struct bcm2835_desc *d;
> >  	dma_addr_t src = 0, dst = 0;
> > -	u32 info = BCM2835_DMA_WAIT_RESP;
> > +	u32 info = WAIT_RESP(c->dreq) |
> > +		   WIDE_SOURCE(c->dreq) | WIDE_DEST(c->dreq);
> >  	u32 extra = BCM2835_DMA_INT_EN;
> >  	size_t frames;
> >
> > @@ -688,7 +705,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
> >  	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
> >  	struct bcm2835_desc *d;
> >  	dma_addr_t src, dst;
> > -	u32 info = BCM2835_DMA_WAIT_RESP;
> > +	u32 info = WAIT_RESP(c->dreq) | WIDE_SOURCE(c->dreq) | WIDE_DEST(c->dreq);
> >  	u32 extra = 0;
> >  	size_t max_len = bcm2835_dma_max_frame_length(c);
> >  	size_t frames;
> > --
> > 2.51.0
> >
