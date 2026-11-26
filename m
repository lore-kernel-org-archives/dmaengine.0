Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705574;
	b=QkonUhXBULd+Jz8UkWksNyvwJMU1LINeiu1Qf/s640Op5t9xG5v3CTh0rgmYp+TFdX33
	 XjU7S5iQJN13W1mKEnvq9hh3Fo15YwivXy7A6AHUWXHs659rO1uoApVpCR2ysK+Y6JuXV
	 YvC7eLJodQ0Pidwz0QoRccAuPVn+F4+eNx2TI9OWm2Ucdqi/ClgdL/vBRlHHIu9NKf7XY
	 mazL01RJJoPYnJnQHe2BcM0cLydpxZZ/ciHddMWsxVAEjrWjWo8lZ3wKSbYx0a46M4BSK
	 IzPyHJOKSpT+68H1psKD8p5qwMvt8Lh/cCTE+up2t+gXJO+RqZE18CpAo1Cqb4C4x6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705574;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ArVfh1wsf+Kth2ceemwq0MhxiQP2TwBL9XnUiqzbYq0=;
	b=QHtRKcs6DSws6tZ/OCDlgd24pKLZEOy0gJQbXAd/j6KsPT/viRkQUjdrYulKc8wzWKhx
	 xWISKnBpiYpPH66ZgYTlxNHTqdS4NmP+CcNvvfqjyefaPUFK9xNlgzqf0JBFUrhZ0S3jD
	 sTc9c4eSGVlYFXIPL579UBGbG4ZYwIphlEr1E9af4/l+klw93Q8S1cvNMtstfQlYoqU30
	 WFEdH+VWXJMvux00zcnsgJeYMqiyHPpoq3TQig/EBP7Djbe8T05yTt8CrGhPJiziF5wBf
	 Ji8Paal/e0a4Bx9luEpiZ6PHH7yrKUZmrDzThQUkPO7b9ofCFq4ohSclzEEqZr7mgUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=dZrmxiRN;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC82606A323
	for <dmaengine@vger.kernel.org>; Thu, 26 Nov 2026 15:06:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFC82606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=dZrmxiRN
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so67048205e9.2
        for <dmaengine@vger.kernel.org>; Thu, 26 Nov 2026 07:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795705571; x=1796310371; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ArVfh1wsf+Kth2ceemwq0MhxiQP2TwBL9XnUiqzbYq0=;
        b=dZrmxiRNELCK7pidOeGv4MJJl/V6zvRCFFnhZ4gc4PHktWahW6j1A81Kjd27oOWOz3
         WrMIKFApx+hWYq9zbI0oMt1hOPP5UCS1WSE9icu5bhfBrFPpToHOEjj08zNmqm121UqT
         6M2HkxkmudOobxgqZ+Lf75RFxYp6bn/BDcrbEJMaBeHvGvlpBL4geJawp16opRIkETCJ
         K+A6SbvI686YrcVn0CkcFEFjQzXPlwQuoJ8DNhHYMQQfekhomo9p1dhMTjyobcpCB4Z0
         bz+l1RJAJZl+MrIkrU6fwaLsqmtob0rTr77zjvJk73fQ6sG1Di+iRkESMybWgMVPdl/h
         BieQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795705571; x=1796310371;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ArVfh1wsf+Kth2ceemwq0MhxiQP2TwBL9XnUiqzbYq0=;
        b=XBxESZOZM5gNPiREqOZBEt1AtwocbLvmu1m2jOkgHpclExkWqZPrHo4fRsxxXdGzQz
         /ql7ahh7UTSQ71kbgPyikS0Dfeq944ajPEuhswn0UD6q71h1OuCDUk+Bi8OXPv2Ud9cO
         YLiTraU+0MhrSISkxBJh+wfea2zYAm4AIUTp1pDGQv9rAhnhgCUWYSHa5wYGKPCj8FkB
         /tlzxgl1MtNSeapHN5tOq51oChacnjEBNkv6DijpqS1KsLsNOuF3DlnPso/uXPPxD/v8
         l34z3QtdyKDvEIxZfjeY1cN/FQNnEGc/i3KzUfK+BISUd2C6wr0QGkke+ilWGv4Ewm0h
         k9Fg==
X-Forwarded-Encrypted: i=1; AL+hErG4zu0Az4k5Y+qsTlxP5espGrYYR4OHBdiRFqoJV9BLF+uxJIfvain/XLccYcENZpnLKr8bqV6QvEQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8C8Dy3GS8hnCizR5wzYQBRh7RrxlHcvKRonSnCXPM6Gkdpoyma
	LU4kKmzM+GeW5ZdFk2f4sqACPMdJXxSMvSQlQfnkS20jHp8zHqpABU2TXAmwt1mD2JY=
X-Gm-Gg: AZFdTZdRwCa7vcAk0cndCzzmoJx5cBwWMK4VzPoGeS2ftqvWYil6wG/K9gbFm/NYJxB
	EXh03Ixk5GB62eyMiJ4bMHdtLq9DRlbY6yizyZwW5HnGf4G0ys1iJClvLlVDKSR0xB9FQ9B7Ann
	/yi59Md7RNuPw0DHY6209NR4hS1qB/3VbUwjrhUdDt63nadL66R9DOZm3SrnEEut5i4W2HRYLk4
	642GmPxcyywP2yNbsw6L2JhtUuyhz9QDi6AYF1ZnNu2j3VWp8nGDfE+5GUyKgvBP5TDjjyVPScV
	xAd49zcEChfjnyUMwmLOKP6T3ejNmapfCTDlv+YtJlHIx152JLwZ7gBwE5iTlPzVYsJWwCB3x0z
	pCZpiE+mLCu1T1r7O48vaXnmY0oBJ3uYK54rxHOe0Jwl+GLllQOUx4QIjwGqMqsEtyT+4dP35RI
	iZNXW8mk4ZZ92SGlnNNNpjwZzTqTHxruOokh4euhmf6t6VIT0p8lXena7iJmSTCOcatBcFLyiGy
	zS8Q8+q11aZvwAxhQ4e7qHwoN1h8BHGXzYDqH7/IX/xx/8iZBxhbIy5Hx01V75Ev38rg64kqJVd
	STkO+6G1KTjzU47ku7ONKAoVCeP9
X-Received: by 2002:a05:600c:8287:b0:4a1:6992:f861 with SMTP id 5b1f17b1804b1-4bb887e064dmr436496855e9.1.1795705571098;
        Thu, 26 Nov 2026 07:06:11 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067846esm415663915e9.4.2026.11.26.07.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 07:06:10 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 26 Nov 2026 16:10:10 +0100
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
Message-ID: <awhL0itLEAIsK4HR@apocalypse>
References: <20261123145728.29082-1-andrea.porta@suse.com>
 <20261123145728.29082-7-andrea.porta@suse.com>
 <e2d27b2e-db69-4fac-b7f3-28961a9e094c@gmx.net>
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
In-Reply-To: <e2d27b2e-db69-4fac-b7f3-28961a9e094c@gmx.net>

Hi Stefan,

On 18:49 Mon 23 Nov     , Stefan Wahren wrote:
> Hi Andrea,
> 
> Am 23.11.26 um 15:56 schrieb Andrea della Porta:
> > The available channels are currently described by the vendor specific
> > brcm,dma-channel-mask property, while the generic dma-channel-mask
> > property from dma-common.yaml carries exactly the same information.
> > Allow the generic property and mark the vendor one as deprecated,
> > requiring at least one of them, so that device trees can provide both
> > for compatibility with older kernels.
> > 
> > The single specifier cell is also not limited to the DREQ number: the
> > driver interprets some of the upper bits as per-channel flags (AXI
> > priorities, wide accesses, burst and write-response handling). Document
> > the meaning of those bits.
> > 
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> this patch should before the bcm2835-dma patches which modify the dma-cell
> behavior.

Ack.

> > ---
> >   .../bindings/dma/brcm,bcm2835-dma.yaml        | 26 ++++++++++++++++---
> >   1 file changed, 23 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
> > index c9b9a5490826..f619e395cf0d 100644
> > --- a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
> > +++ b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
> > @@ -37,15 +37,30 @@ properties:
> >       maxItems: 16
> >     '#dma-cells':
> > -    description: The single cell represents the DREQ number.
> > +    description: |
> > +      The single cell contains the DREQ number in bits 0-4, optionally
> > +      combined with the following per-channel flags:
> > +        bits 16-19: AXI priority
> > +        bits 20-23: AXI panic priority
> > +        bit 24: use wide (128-bit) source reads
> > +        bit 25: use wide (128-bit) destination writes
> > +        bit 27: do not wait for AXI write responses
> > +        bit 28: wait for outstanding writes before signalling completion
> > +        bit 29: do not pause the channel when the debug signal is asserted
> > +        bit 30: use multi-beat bursts
> No strong opinion, but mixing DREQ number with per-channel flags is ugly

I agree it isn't pretty, but it is the encoding the downstream DTBs have been
using for years. Switching to #dma-cells = <2> (or introducing new exotic properties)
would mean supporting both formats in the driver: I'm trying to play nice here in
order to not break compatibility with downstream DTBs, which I think should be wise.
The header I'll add in v4 with the definitions for these flags at least makes the
device trees readable.

> >       const: 1
> > +  dma-channel-mask:
> > +    maxItems: 1
> > +
> I think, the dma-channel-mask stuff should be a separate change.

Ack.

Regards,
Andrea

> 
> Best regards
> >     brcm,dma-channel-mask:
> >       $ref: /schemas/types.yaml#/definitions/uint32
> > +    deprecated: true
> >       description:
> >         Bitmask of available DMA channels in ascending order that are
> >         not reserved by firmware and are available to the
> >         kernel. i.e. first channel corresponds to LSB.
> > +      Use the generic dma-channel-mask property instead.
> >   unevaluatedProperties: false
> > @@ -54,7 +69,12 @@ required:
> >     - reg
> >     - interrupts
> >     - "#dma-cells"
> > -  - brcm,dma-channel-mask
> > +
> > +anyOf:
> > +  - required:
> > +      - dma-channel-mask
> > +  - required:
> > +      - brcm,dma-channel-mask
> >   examples:
> >     - |
> > @@ -96,7 +116,7 @@ examples:
> >                           "dma14",
> >                           "dma-shared-all";
> >           #dma-cells = <1>;
> > -        brcm,dma-channel-mask = <0x7f35>;
> > +        dma-channel-mask = <0x7f35>;
> >       };
> >   ...
> 
