Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704796;
	b=CNTYh3LtaUHFdWHL96LEBJ8M5LjE8pxoIQLtfSg0juRypCUfb+acEp2TPDoseE4UBhxU
	 FHTBit3eNpVcf95+b8UrV+JP6i6caXZxOSOnA905mmGJRLKxndYEhAHw/jcHJf0kfnNh7
	 jeb6KC89NPLwmOLqIQia2n1sEsRLy5J+kaSqjjJ9I7ZWL3J3MTGGyhQ4VcX5To6xlrJiC
	 d8ZEJD58EbLlzxop3gUYYsyx6IZqMAL0ETra+fjnqxaVlRmMXWsjq0TxxwqbD3li4bqz8
	 gCr+yheEVSv5hGlgyIQtTQsCcOaA8WB114oP5I32Vo/loPvZITfZ/IICgBWaGkWRjMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704796;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ZqMqbfj/cETQCXmO3wbil3gEmzGzk18Px5yh8y4lWVg=;
	b=Lb4O+fRicFZ0Rl6tJSIhrAffaSfg12P8InkaVqeKqFg0iRv8smgi3YsJ2BFmc/EejIDp
	 /eu8egrmU0e2CSFSMDdSsyFIs/HX3dBC6gGoTubKzA9CdK35eXGECCaOoGD8Nv0GcAOKB
	 6nOtAFdDbnIax7Mri00XeJfB2EjMyeMrjd30TftZYZhl5feyhKl7bGKFeAUzYzEbJLxVg
	 ULh8Wd9KkdqOD9MY2TJtpVF9hb1L1h2cHGiyLzQpF9+PeS24Bq0P8Dtud3ve1kZNg/Jzh
	 ZIrFvQy7jU1nZtQNV2gzqeVVLPY3uO3BFKIsOiceZqJlETaGD3twPKSvZm7VwUVwwGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=SbH0mZzT;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748A560A3817
	for <dmaengine@vger.kernel.org>; Thu, 26 Nov 2026 14:53:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 748A560A3817
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=SbH0mZzT
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so57572405e9.3
        for <dmaengine@vger.kernel.org>; Thu, 26 Nov 2026 06:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795704794; x=1796309594; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZqMqbfj/cETQCXmO3wbil3gEmzGzk18Px5yh8y4lWVg=;
        b=SbH0mZzTQkyuq3Sga3blWcZFEfcQIFRZmyVP1q634WAIOy6CvybhvI93yuiE0JiTZ6
         zZvpRZu7lDlbqxMnYYpy0mh8SunGI+MJP35P+iPhpvLMDf5hoqMNkbAXzngC4mawAh4R
         T7eCVkrw5Htp2UBW2pMGLTLK/c6sfljG2P3zGVWxu45O1ZRKesy9JLyVJrouV4j3Ya3r
         OzHu5iE8UznSx2fqb08zYWXAnqvB6c7uRLo7IWbSWHwTm5XvCYqgQ3prnXc4jLuXwwAz
         BSXqrO9p5ZjjnbglFoq8anfSnyIhAgQv0yN3zqfPOHmgjCDwgQj7u9gtteiL8SocUNVn
         Q3Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795704794; x=1796309594;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZqMqbfj/cETQCXmO3wbil3gEmzGzk18Px5yh8y4lWVg=;
        b=LMP73DXDKNw/ozGmf+g85BULdAAwY2FuyPneWwCe//qlPQkjqCuarAQ6Hfdo+3MhRw
         eAV+ReWuT5L7fuRUMKRCvTT1Hb0+HcjMmAyHAfocXyfH+XPrBlZa4f3sQ/n2HRcvFbdJ
         80QBKqaKKtrKIJwl6KixkRlbcQXNza96H0gchSU+XogdCUmJqp8M+RQK7iQicIIUuWe9
         5cZOBH7KqsiPGOTNo9/BW4qkBwEl8LE6o60Lpgn6t482dc0i+CcZexhmX+iseP6faGxM
         AzWZi4V3Q/wAGMVS4nQcIjYojuOFU5QZYp64dRU5Izmk4jiWZgETCHe8khQQdsu+Myi4
         JalQ==
X-Forwarded-Encrypted: i=1; AL+hErFnX3EUT9YqDi4k1N1X03aOWeQP80mmzQWDtts0ZeC533+fDus4+VJFVvN8czbkpzCNqjcaTVhX89U=@vger.kernel.org
X-Gm-Message-State: APuU4Z919qFJAgy1SljO8nz95qkHM+EGl933kE9YGI5wBywW6vYTf7j/
	LzBnW+iR3wAsbafC2OEzfjS2fLmP5PlywdvsMJNoUzmkmDlrNkt9zk7/lrkVaIhdE9Uqanpgb2+
	zk+GYcns=
X-Gm-Gg: AZFdTZcnMkGfsbD7n60YYP2GmaEMswptSjnX6xXYQOb7a+bROg6K+pmQtcPNM+ngcYM
	fyRHNcMgAadajcXLdilKrT8m3jqHgqrsRysxXIPYva4i+bC/86pP5BLaeAKsj7tNF65RRYMdYbv
	iD1yfYXqCCw2g1l0+95CyibIUQBKdZt4uqtb8FC+4eAz4Y9BMWELk1a3PwKih3Ke2O5cmXkG8GH
	wTYwwhTeATxcFCvTDJoRoKZzEqaHrtAaRJAd6BmVUO2xuz/lsKa69h3Puwzw5GFC2Or88miAvK2
	DIceSg56SBEuprz38rUfFBT6ED6O/4fEwWuq+7TbWRNV+cIdFeAyk5k5y8QaVOFm+hKrpzhsMIe
	cMlbzXH8PGoDviDIdX0CxgybUqM6YCzI94EWvQGPMNZRM0lT74JcNb7PSsbM2EEx/42mi9nnbDT
	JAQLHZm89NPGdhiI6EYkZM/n4z8pM0DAuxW08fyDw9c4z/JqcB64264yYqgbjbpBfmBwO6d9Rj8
	Vu43XOYbGf4okTw3EuhORznmHD8IX3Fy/xthshmxhxI/xW+vLc7Ioq7lVCTZn82NzRrLzF794fO
	go6iMSv6nbt3f7KZtt7dv0uo6snK
X-Received: by 2002:a05:600c:a11:b0:4a2:e0c:2b0a with SMTP id 5b1f17b1804b1-4bb888120famr434903565e9.16.1795704793802;
        Thu, 26 Nov 2026 06:53:13 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442995sm636202395e9.2.2026.11.26.06.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:53:13 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 26 Nov 2026 15:57:13 +0100
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Vinod Koul <vkoul@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Saenz Julienne <nsaenz@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dom Cobley <popcornmix@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 02/28] dmaengine: bcm2835: Add support for per-channel
 flags
Message-ID: <awhIyZ2weVtCrKN6@apocalypse>
References: <20261123145728.29082-1-andrea.porta@suse.com>
 <20261123145728.29082-3-andrea.porta@suse.com>
 <7258e7d8-c968-4876-bfb4-de89e2fb05e3@gmx.net>
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
In-Reply-To: <7258e7d8-c968-4876-bfb4-de89e2fb05e3@gmx.net>

Hi Stefan,

On 18:37 Mon 23 Nov     , Stefan Wahren wrote:
> Hi Andrea,
> 
> Am 23.11.26 um 15:56 schrieb Andrea della Porta:
> > From: Phil Elwell <phil@raspberrypi.org>
> > 
> > Add the ability to interpret the high bits of the dreq specifier as
> > flags to be included in the DMA_CS register. The motivation for this
> > change is the ability to set the DISDEBUG flag for SD card transfers
> > to avoid corruption when using the VPU debugger.
> actually I'm not against this feature, but this seems to pad out this
> series. Is this really necessary for BCM2711 or 40 bit support?

The flags of patches 3-5 have in-tree users in this series: the BCM283x HDMI
audio channel uses wide source reads and no write response wait (patch 27),
and the BCM2712 HDMI audio uses bursts, wide reads and the AXI priority/panic
priority (patch 28), as done by the downstream device trees too.
If you prefer, I can move them to a follow-up series together with the HDMI
audio patches: in this case you'll have to wait for the upcoming new series
in order to have the updated audio nodes in DTBs.

Many thanks,
Andrea

> 
> Best regards
> > 
> > Signed-off-by: Phil Elwell <phil@raspberrypi.org>
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >   drivers/dma/bcm2835-dma.c | 10 ++++++++--
> >   1 file changed, 8 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
> > index b19182c6e3df..690f5ba1c439 100644
> > --- a/drivers/dma/bcm2835-dma.c
> > +++ b/drivers/dma/bcm2835-dma.c
> > @@ -137,6 +137,10 @@ struct bcm2835_desc {
> >   #define BCM2835_DMA_S_DREQ	BIT(10) /* enable SREQ for source */
> >   #define BCM2835_DMA_S_IGNORE	BIT(11) /* ignore source reads - read 0 */
> >   #define BCM2835_DMA_BURST_LENGTH(x) (((x) & 15) << 12)
> > +#define BCM2835_DMA_CS_FLAGS(x) ((x) & (BCM2835_DMA_PRIORITY(15) | \
> > +				      BCM2835_DMA_PANIC_PRIORITY(15) | \
> > +				      BCM2835_DMA_WAIT_FOR_WRITES | \
> > +				      BCM2835_DMA_DIS_DEBUG))
> >   #define BCM2835_DMA_PER_MAP(x)	(((x) & 31) << 16) /* REQ source */
> >   #define BCM2835_DMA_WAIT(x)	(((x) & 31) << 21) /* add DMA-wait cycles */
> >   #define BCM2835_DMA_NO_WIDE_BURSTS BIT(26) /* no 2 beat write bursts */
> > @@ -433,7 +437,8 @@ static void bcm2835_dma_start_desc(struct bcm2835_chan *c)
> >   	c->desc = to_bcm2835_dma_desc(&vd->tx);
> >   	writel(c->desc->cb_list[0].paddr, c->chan_base + BCM2835_DMA_ADDR);
> > -	writel(BCM2835_DMA_ACTIVE, c->chan_base + BCM2835_DMA_CS);
> > +	writel(BCM2835_DMA_ACTIVE | BCM2835_DMA_CS_FLAGS(c->dreq),
> > +	       c->chan_base + BCM2835_DMA_CS);
> >   }
> >   static irqreturn_t bcm2835_dma_callback(int irq, void *data)
> > @@ -460,7 +465,8 @@ static irqreturn_t bcm2835_dma_callback(int irq, void *data)
> >   	 * if this IRQ handler is threaded.) If the channel is finished, it
> >   	 * will remain idle despite the ACTIVE flag being set.
> >   	 */
> > -	writel(BCM2835_DMA_INT | BCM2835_DMA_ACTIVE,
> > +	writel(BCM2835_DMA_INT | BCM2835_DMA_ACTIVE |
> > +	       BCM2835_DMA_CS_FLAGS(c->dreq),
> >   	       c->chan_base + BCM2835_DMA_CS);
> >   	d = c->desc;
> 
