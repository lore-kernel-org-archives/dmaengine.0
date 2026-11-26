Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704363;
	b=4SLRjW6QytzytzX8aknU3oBPkL6kDSTgwA4GTQtj+++v9U5dofBJxod+c6WE8lWLLG45
	 u7vCmDhS6PBj9uHl828OTIho9yQias05tZFcVH1Kv+eBkJ32hNRL6EdWNQrPZdA+xdfDv
	 bJSEWMTzFUU/hGSqn+jGOfinLSV/hsVcwjXK+jzB9+jyUevHcV+3rP7snfvUF8vkVNc3s
	 NQBkhhtD94IzWHSncxUnsbPG1JD1YmzhoMR28SNlpWAEWuZNdWTCUmCTFNZSI1WYm0YcO
	 KEczFZrsq321limEaGWub3tqx9QvE/zrhZcbNxGgkyzISaijLtDosm6qXdB+CaLgwtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704363;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Wu1agTFEkGcx3K6CnCdIJjGrSzPmSSzxOxrr1RuQESY=;
	b=KgYyXb1m0m7Lo1huvCAhLrHuKUfDJtv2RS9T5IqnPuHooxXxvk8NRqNKCc6aPyXwutDH
	 DStoq+dKqu4QrgvXeJulcQWx6EoRW5BZzdtHZdijcrhqBFWCjNpDFi53X3paiQAx1A1Gs
	 btcmWMgp6gt2J+D4iCkBEtrYxNo6uWhPx+ofQ/YEVPnsbSCLMkVNdvqtC4K1n8vTsO02G
	 XnhGCK5G6sFEJVPP7un7DTh/rjLUXfL48rGtg3gSyWBGZuTdgW2w+lygz+IrUi7Ntmt1G
	 4Jmi1Zdtr5Fq6bKumL3gXWaNmjYdJMpcia0MSyH46AnmefVKqGv8BsUHIoH8U8S69lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=PrY5X9JI;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865C7606A327
	for <dmaengine@vger.kernel.org>; Thu, 26 Nov 2026 14:46:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 865C7606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=PrY5X9JI
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c506a231b88so953712866b.3
        for <dmaengine@vger.kernel.org>; Thu, 26 Nov 2026 06:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795704360; x=1796309160; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wu1agTFEkGcx3K6CnCdIJjGrSzPmSSzxOxrr1RuQESY=;
        b=PrY5X9JIHXb4qCOmbPGQEhCJ+snfEAQq9mqA6AkUzJOCOxr19TbiI+b7MJezD+vHrJ
         W+VkhuxjOjmuopQgXRrNpHvvnXkokmXdYWt/sVqBNEdHwQqN9+taJREj/GIOPkl8FkN0
         NS1jADcJh9CMWcvo+S9ltpiVfLtf4w5i+4irDDTeAf/nlXBAAMItr67neuhaqaQ4PXuS
         LzT7WKYVvqXK6prhN9QrkNIe6cwWybOWLerzZF98j4R+4i8EZoSSHSg1MSXgM2Zie0n1
         Fe2On8V0rn5A+qLKpV4IubjfLdxKfRd56TgbX/8dEoe7Ah6KXc2B43voULbrcwTzpenv
         gYGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795704360; x=1796309160;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wu1agTFEkGcx3K6CnCdIJjGrSzPmSSzxOxrr1RuQESY=;
        b=nejHZ8V9iqf7/MLF9RwA+FF+MroXeenUvWFKD3Qwk00uRuJcMHS5F1oI3f7dD6onT4
         h+fHpqVi4gFLEonmtLQ0PQvhzwJO6J6csPNXNIoM54od+lxEOMB3u9h2BAmJmxEqZYcj
         N1u6L3DgCl9lIuQgwMb90jxDdoRkXgttJNdNcZlZd37naGr77hqRF5SdYq6NV4LN+3e0
         RKPDq3UlFkBcAalduZOpnGBFdCTL5nXmfX/Yw8rnTKoLv8Tgy7dIDFoG98ImJPMxTapD
         IfRUYB/c+pTUsDrtjkdoGskggFRtC/XDVk77l9FRkoZi2a/KO1R7eFuO+MP0JnacaBbc
         tRPQ==
X-Forwarded-Encrypted: i=1; AL+hErGR0uQwyAH43m42eJRsMEOBAF9k2abbzl6VTNGZ22noobXs00t4a8lQw0hy8IjfhjGaA/KroV8/GJs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8EmVibHm6pqhjecEkQ8r5BEu42XRv2yZ932ly1yZjM1P8HWo10
	MF9h0kBWgvW8Cb61ip1rdbvYuuxdZOMB5wyz34PXW9u1tI22zd3UYJD9HPNAH63Vuts=
X-Gm-Gg: AZFdTZcAvrqKCysffP9Tqzk7BqSVF/nFJ3mgA3e5+sh83Hy0f4AcOA1wMWTCdaXOBq/
	4M8Kgvb2iXzcwxt1dDk5ExLKzld229SnNKNIw5+DqxoRqJ1snys6DM9iikSyJt3j0aYvg/EnsYm
	JPovAq7AHgvers72pVn5Tyuq/m+uCEJURH+7N52c9xIpSYeUODPWtvWiPCrBB8ERHhptP55bSfQ
	hFdED8NucVBzEaKoz4O+BlPAqBQXAA19XMD7IfmJXIA8Ow9WPx4XdQKtbOyP4Ct7UUVPEkNPXXP
	UQf4qR2zCgMpPh6gftzqpX91OOR4sOboQQoOtRkFsu6ZpSosKXRFVSuQXCRfSchs85w6opRoVEj
	HIVTxe4qr70k19b2PFDGM8T78CXqBy7AJgsEnLCC/Bc8aTBv9Fb5dD7P4x2bKIQEVD6G+BthH6J
	s+6xmfgBypVWMJnkybVfojnx8pb1nIFF8Nzc9WFTCSPr04DnxnTjmIdU1Ka5mQDMv7WNuW0z2Sc
	OHyze4NAW8RwzpVXXdWx3SFaUy3uMptLUm2IgzJZTb+29rr1bOxTM7+YW2CumE0ysweNq8sPlDb
	YDo58R3EsRoUMVc6m0fG2/P1A2LL
X-Received: by 2002:a17:906:4fc4:b0:c51:24a3:208 with SMTP id a640c23a62f3a-c513a5da66bmr1688802166b.9.1795704359748;
        Thu, 26 Nov 2026 06:45:59 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae698ccsm760181766b.26.2026.11.26.06.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:45:59 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 26 Nov 2026 15:49:59 +0100
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
Subject: Re: [PATCH v3 10/28] dmaengine: bcm2835: make address increment
 platform independent
Message-ID: <awhHF_MII6yCi1T9@apocalypse>
References: <20261123145728.29082-1-andrea.porta@suse.com>
 <20261123145728.29082-11-andrea.porta@suse.com>
 <awXpsh-ZbSqbotIm@lizhi-Precision-Tower-5810>
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
In-Reply-To: <awXpsh-ZbSqbotIm@lizhi-Precision-Tower-5810>

Hi Frank,

On 14:46 Tue 24 Nov     , Frank Li wrote:
> On Mon, Nov 23, 2026 at 03:56:48PM +0100, Andrea della Porta wrote:
> > Actually the criteria to increment source & destination address isn't
> > based on platform specific bits. It's just the DMA transfer direction which
> > is translated into the info bits. So introduce two new helper functions
> > and get the rid of these platform specifics.
> >
> > Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >  drivers/dma/bcm2835-dma.c | 28 ++++++++++++++++++++++------
> >  1 file changed, 22 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
> > index 77b3e2f58ac5..6180a2737e07 100644
> > --- a/drivers/dma/bcm2835-dma.c
> > +++ b/drivers/dma/bcm2835-dma.c
> > @@ -273,6 +273,24 @@ static u32 bcm2835_dma_prepare_cb_extra(struct bcm2835_chan *c,
> >  	return result;
> >  }
> >
> > +static inline bool need_src_incr(enum dma_transfer_direction direction)
> > +{
> > +	return direction != DMA_DEV_TO_MEM;
> > +}
> > +
> > +static inline bool need_dst_incr(enum dma_transfer_direction direction)
> > +{
> > +	switch (direction) {
> > +	case DMA_MEM_TO_MEM:
> > +	case DMA_DEV_TO_MEM:
> > +		return true;
> > +	default:
> > +		break;
> > +	}
> > +
> > +	return false;
> > +}
> > +
> 
> This is not 100% correct. there are case DMA_DEV_TO_DEV, and some peripheral
> FIFO is a range of MMIO space, not fixed address.
> 

The driver only advertises DMA_MEM_TO_MEM, DMA_MEM_TO_DEV and DMA_DEV_TO_MEM
(see .directions field), and all the peripherals it serves are accessed through
a single FIFO register.
The helpers keep the behaviour of the S_INC/D_INC bits they replace. In v4 I'll
make them explicit about the supported directions and I'll document that DEV_TO_DEV
is not supported.
Supporting FIFO windows would be a separate feature, which no client needs right
now.

Thanks,
Andrea

> Frank
> 
> >  static void bcm2835_dma_free_cb_chain(struct bcm2835_desc *desc)
> >  {
> >  	size_t i;
> > @@ -338,10 +356,8 @@ static void bcm2835_dma_create_cb_set_length(struct bcm2835_chan *chan,
> >   * @cyclic:         it is a cyclic transfer
> >   * @info:           the default info bits to apply per controlblock
> >   * @frames:         number of controlblocks to allocate
> > - * @src:            the src address to assign (if the S_INC bit is set
> > - *                  in @info, then it gets incremented)
> > - * @dst:            the dst address to assign (if the D_INC bit is set
> > - *                  in @info, then it gets incremented)
> > + * @src:            the src address to assign
> > + * @dst:            the dst address to assign
> >   * @buf_len:        the full buffer length (may also be 0)
> >   * @period_len:     the period length when to apply @finalextrainfo
> >   *                  in addition to the last transfer
> > @@ -413,9 +429,9 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
> >  			d->cb_list[frame - 1].cb->next = cb_entry->paddr;
> >
> >  		/* update src and dst and length */
> > -		if (src && (info & BCM2835_DMA_S_INC))
> > +		if (src && need_src_incr(direction))
> >  			src += control_block->length;
> > -		if (dst && (info & BCM2835_DMA_D_INC))
> > +		if (dst && need_dst_incr(direction))
> >  			dst += control_block->length;
> >
> >  		/* Length of total transfer */
> > --
> > 2.51.0
> >
