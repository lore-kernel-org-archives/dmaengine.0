Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795805662;
	b=mGFtgo4p0vE4Ewp0KsL70fp2wJkABNaLWTDnYX5SQmqWzjFReM1bkzhpr6Bq3GzGLdW3
	 O+zCoHZBARvFkWEW0Bo8S+HdvHttXqfYbMv0cNwGO37dPXknldDd+m1VFwMRXkBuj6pbu
	 9yRF/8fPG5G4zZzytFBI3k2MHqLgpoIUZRdiUf6VyPHROFCTtni+PBTnbZhh2nSoQVMOH
	 5fpSev/3ZJiyTlbyhYGJOiA6NR0GZlc2QzFH85uHvrnH3QHhGza5QQvgKjxMtfnIhUnA1
	 G+e3xDu32bLo8B4tCTlU5onUn1Zjzb7My1IgvDhPOfYJ0c9wNA2jPzuqXHRFHLZRMLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795805662;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=51kGECU7mnaWff1zdYP1hH1erxWAFEkfyrjZFzcM8y8=;
	b=VRQP33wwEpmiC9NN4hDh3VAaKBZZX3XQJHbNzoOSmuFRC3xa6IfCmbHHAOT3P1yLFqkj
	 JjM5CwExsd5ASh6JUXsVrSZ7K9TdYWqC8JO7e0ciawSsKHocUKZchMJLSsDXVDoAhzAi4
	 KHk/dTVP6CiwgiJM+IP2RepcSwlgk0f0TTOzbGwY8UZBRZcva3Ure9p8EU2YuxuFz/v4j
	 AP8J5SGGg1OnQdx23WCldJBr4xIlWDtP6aHoSd/g4MmRSETf4g7FTT0Jo2zalwSGjZCwc
	 uvC5baMes4OqsTRax4YMAOKAWeuuw3AyK/f7lqR3qdlVwaMle1VAkvDu7+W+aadwmSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ScU7ieTa;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB35606A31F
	for <dmaengine@vger.kernel.org>; Fri, 27 Nov 2026 18:54:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EB35606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ScU7ieTa
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb9d8e8e90so55695425e9.3
        for <dmaengine@vger.kernel.org>; Fri, 27 Nov 2026 10:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795805660; x=1796410460; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=51kGECU7mnaWff1zdYP1hH1erxWAFEkfyrjZFzcM8y8=;
        b=ScU7ieTaj4/9UFIPvuUfx9G5EKDJiKsPDiD+bWJVvXYg4+4shgY+3ihB99m0356vjy
         0ATG6HJjRGZDGvInK7zSRAsmzUv1dzu0+gQsYIO9/KbflI4LZNvFtp20yl61lCuWvoKp
         eOG/WbgvNrXB6GOZDaZ2JN1bPgkY0a7jd1xYNTnqb7YkekWAQ2iaCBikx2bgynaaXEsy
         JD7U6RI4BYNDSJBW+0Oy+Kf3NXBxS/lShpuZN21QiTZ+lPUHXru4OCPu46lFboL/rcSY
         qHSi+1tcpvMP+c4oAwdNgVRyIkUoib/C5M/QZ01l2yE2TZpBdAAx2rzvm+Q5W0DMrNQP
         5rjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795805660; x=1796410460;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=51kGECU7mnaWff1zdYP1hH1erxWAFEkfyrjZFzcM8y8=;
        b=ymmkblP47oLFkvejtAqe9E4N/Jr0ZYg1oVh+52SO8twvK4LF2KpVzavyjbiewSZ5vc
         2Ka11b5SDizFXTGuwrUwa7olwrPob9YQq95jrXVrMJKgBAkd5+MGYRnhGsPFsMArtii4
         lKCKVAJgIwh53ueV38DzZP75xP7bnd5u5aThEBKHAIZvSc3qX0onnLWP3ZX3Ru2Hk8Be
         NQOi5UbZ81RV3hGZXLez+vGqfkS9EtTKsyUy5C2c2+PbnAyXgy/QONubocdrIRmbDnol
         JVfr35itwYVJ6MSvkfab880kn3mFj0j5zYzVvGy9CLThRMr8Sc8wtzT95jMkHZV/OuMZ
         thzA==
X-Forwarded-Encrypted: i=1; AL+hErHPlQd0mH3pB8eK28/hjAG8fTvAo85QzzsjFbJexQ2MVECv1xo9Z5mtla2IpTNOEr7KdqQDTOioi9A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OO52xaPrpaICU4WkcY9FUnOn6oY+R8JffSOyoUdZ3cq0439aY
	2PGSa+qf8ktlWz8KEWAC2OBKfQENsny1P+ZWpjuERdd6Bc1JR8jImWQK11/vu+UQ7aA=
X-Gm-Gg: AZFdTZfZGFTK8itlsHW59i06t1QbJf7iemMA81CTs3zO9EvaFEXE4KVwrGHZyReb/lH
	7ZuzdX0EAI2QQcpn0oD9rK5h1ozf8QjmETC6jRTdidSWhUYsp0R3rIK3zYVC7s++AZVQPADu559
	axFUNXWqp/FTud+k0k0FNq+/KQlzAdb5unFFvGRg12Aa5Ni+2hmKGFA2okyzRkX2l69R5tUPfcm
	NURaJ7sTCUCTxEbt/JhoORDkQKM64SF/NGZs/I6qaH8UaU23quyxI4qsQaKxgYWEo1Cxjm6QzXL
	5a/+KX3wIPyV0fyYpvHPWHCERcX6F1NwqDGL1WA/VunpfoR54bUGTrmTZEgAbD7+oM7R6Qtub46
	RGlXPg25JEbYkvgBYR/q2uBprjjGm3UlacN3Kx4KNUOf8qhtgWlPpztStPEpNhftz90o/nby3qJ
	MomkS2sou7GFxyS0YfgHLLpHSe96i4dcDq05Fyoi07Zz0mJi7UAT0WhlbSDuvsod9V5R347/2Vv
	KetGkeEN+Vdo4Z7OGbF5b/42GW7T6okaqs8A5Bb6EsIzyXAOwC9Bc4pUZaeiQVja99iF8BVwJSp
	cqJJnDY++Z1pPKZxNGjiQz4f7xX7
X-Received: by 2002:a05:600c:3484:b0:4a2:133:45e1 with SMTP id 5b1f17b1804b1-4bb88812f16mr523283925e9.24.1795805659913;
        Fri, 27 Nov 2026 10:54:19 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bbab390cf5sm234366765e9.7.2026.11.27.10.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:54:19 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Fri, 27 Nov 2026 19:58:19 +0100
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
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
Subject: Re: [PATCH v3 06/28] dt-bindings: dma: brcm,bcm2835-dma: Document
 dma-channel-mask and DREQ flags
Message-ID: <awnSy5BOabcnj73I@apocalypse>
References: <20261123145728.29082-1-andrea.porta@suse.com>
 <20261123145728.29082-7-andrea.porta@suse.com>
 <e2d27b2e-db69-4fac-b7f3-28961a9e094c@gmx.net>
 <awhL0itLEAIsK4HR@apocalypse>
 <ba983cd0-68d7-4184-ab75-d79f2666520c@gmx.net>
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
In-Reply-To: <ba983cd0-68d7-4184-ab75-d79f2666520c@gmx.net>

Hi Stefan,

On 19:23 Fri 27 Nov     , Stefan Wahren wrote:
> Hi Andrea,
> 
> Am 26.11.26 um 16:10 schrieb Andrea della Porta:
> > Hi Stefan,
> > 
> > On 18:49 Mon 23 Nov     , Stefan Wahren wrote:
> > > Hi Andrea,
> > > 
> > > Am 23.11.26 um 15:56 schrieb Andrea della Porta:
> > > > The available channels are currently described by the vendor specific
> > > > brcm,dma-channel-mask property, while the generic dma-channel-mask
> > > > property from dma-common.yaml carries exactly the same information.
> > > > Allow the generic property and mark the vendor one as deprecated,
> > > > requiring at least one of them, so that device trees can provide both
> > > > for compatibility with older kernels.
> > > > 
> > > > The single specifier cell is also not limited to the DREQ number: the
> > > > driver interprets some of the upper bits as per-channel flags (AXI
> > > > priorities, wide accesses, burst and write-response handling). Document
> > > > the meaning of those bits.
> > > > 
> > > > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > > this patch should before the bcm2835-dma patches which modify the dma-cell
> > > behavior.
> > Ack.
> > 
> > > > ---
> > > >    .../bindings/dma/brcm,bcm2835-dma.yaml        | 26 ++++++++++++++++---
> > > >    1 file changed, 23 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
> > > > index c9b9a5490826..f619e395cf0d 100644
> > > > --- a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
> > > > +++ b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
> > > > @@ -37,15 +37,30 @@ properties:
> > > >        maxItems: 16
> > > >      '#dma-cells':
> > > > -    description: The single cell represents the DREQ number.
> > > > +    description: |
> > > > +      The single cell contains the DREQ number in bits 0-4, optionally
> > > > +      combined with the following per-channel flags:
> > > > +        bits 16-19: AXI priority
> > > > +        bits 20-23: AXI panic priority
> > > > +        bit 24: use wide (128-bit) source reads
> > > > +        bit 25: use wide (128-bit) destination writes
> > > > +        bit 27: do not wait for AXI write responses
> > > > +        bit 28: wait for outstanding writes before signalling completion
> > > > +        bit 29: do not pause the channel when the debug signal is asserted
> > > > +        bit 30: use multi-beat bursts
> > > No strong opinion, but mixing DREQ number with per-channel flags is ugly
> > I agree it isn't pretty, but it is the encoding the downstream DTBs have been
> > using for years. Switching to #dma-cells = <2> (or introducing new exotic properties)
> > would mean supporting both formats in the driver: I'm trying to play nice here in
> > order to not break compatibility with downstream DTBs, which I think should be wise.
> > The header I'll add in v4 with the definitions for these flags at least makes the
> > device trees readable.
> as I said I don't have strong opinion about this.
> 
> Imho adding these configuration bits to the DREQ number was a downstream
> hack. Furthermore providing some kind of compatibility with downstream was
> never intended and cannot be guaranteed.

Fine then, let's move those flags to teh second dma cell.

Thanks,
Andrea

> 
> Best regards
> > 
> > > >        const: 1
> > > > +  dma-channel-mask:
> > > > +    maxItems: 1
> > > > +
> > > I think, the dma-channel-mask stuff should be a separate change.
> > Ack.
> > 
> > Regards,
> > Andrea
> > 
> > > Best regards
> > > >      brcm,dma-channel-mask:
> > > >        $ref: /schemas/types.yaml#/definitions/uint32
> > > > +    deprecated: true
> > > >        description:
> > > >          Bitmask of available DMA channels in ascending order that are
> > > >          not reserved by firmware and are available to the
> > > >          kernel. i.e. first channel corresponds to LSB.
> > > > +      Use the generic dma-channel-mask property instead.
> > > >    unevaluatedProperties: false
> > > > @@ -54,7 +69,12 @@ required:
> > > >      - reg
> > > >      - interrupts
> > > >      - "#dma-cells"
> > > > -  - brcm,dma-channel-mask
> > > > +
> > > > +anyOf:
> > > > +  - required:
> > > > +      - dma-channel-mask
> > > > +  - required:
> > > > +      - brcm,dma-channel-mask
> > > >    examples:
> > > >      - |
> > > > @@ -96,7 +116,7 @@ examples:
> > > >                            "dma14",
> > > >                            "dma-shared-all";
> > > >            #dma-cells = <1>;
> > > > -        brcm,dma-channel-mask = <0x7f35>;
> > > > +        dma-channel-mask = <0x7f35>;
> > > >        };
> > > >    ...
> 
