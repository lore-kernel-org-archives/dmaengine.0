Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703914;
	b=uTgIB+0v9G3c8lUbpcD25CsSaNWD26xVLrwHZwnfRIw+qOYnqzDKBJWdCkraPBKnfn7H
	 LZv7LK4a84L83OBhzaLhOkVtWsXyXEi/CISGapv8uDB+dFx8mzW8nCzJpUO8B4joGK1WZ
	 It3fCEzrgMvh03uRmGQmJ63mfgLfiBQOAfxthJ5xivc47U6GVG1CkKgRukeMC5ylXse0t
	 Gor0eb8PslMjRVFf9LpMx2cO6l/hv6sp8d28hiyjXzXi950pfFZFpdRizDlNTmLM5zt/6
	 tfFm7A5jwWWm/vpCAlY+Jx1oHoiLJ2KRg60w7COn7EzbSD4zLdRsXt4a3Rl3wRHAYVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703914;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=auCcba+5d77RO1uYXgMttg2oy3VWOurHghWnl0cLv30=;
	b=3LvDmw3aI/Vooi2AnDXx8IJNvRi24/pXNMb6OFI1A1C7p38RBf8OFap7JKD+6EtdRMhq
	 42orHI+6rqzoq7a9D96iSFxqw/VcY64ZO6TCjmv/DAmJrQm+62sQr6h/m9G6LHCIPaJ9j
	 6CAIaZO+l5+hV44wGobqHMIsIjj40FsPnCiTU/Rtn8CCzeHklypBWql68qbwmpsiOu8nK
	 pp98GXIKqIGD4tqUDa1NenJ4QaxKLOmbx7sm+kZbhgMFqoi8QTT+oE7AIi7PFjizLdkqq
	 rDCNCRN/IBlv1mDIMkfg7JIJQSTxzJEn5F/QuOCKIb3qvfvNzT2P0x3qJAL06mpc1uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=WnMPnIzC;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E80606A31C
	for <dmaengine@vger.kernel.org>; Thu, 26 Nov 2026 14:38:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15E80606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=WnMPnIzC
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso87552065e9.1
        for <dmaengine@vger.kernel.org>; Thu, 26 Nov 2026 06:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795703912; x=1796308712; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=auCcba+5d77RO1uYXgMttg2oy3VWOurHghWnl0cLv30=;
        b=WnMPnIzCdls3owP/R7yn2u4u0fUOEWTcVkLBsniilxqyGNDXTQ4mYtnNLW3jq/gu8c
         JPS6XwAQwe668dr05qBwoRf0yembIvH2CAhC+xD8WP+BUPu2x4ClIkjwObp9imYTKk52
         lnj0RGIaYTyR+Z6WA1w2C4afowfHBTIE6Nb8KHlB7IuGRKAu+h+V/HPe5eHILMCfzJOX
         yfV/voIjnBtVa99WV+7BRTtcAJCkH7Z6caSMesferB2eX/KNe0Wl17xIQIPl3rIV603U
         CJeJK0MAOKn2FlslWKKSsBesSuwXYQhexEcxP4WxvsX30dh/dcuhROsUUVhT1G25gxpv
         XJzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703912; x=1796308712;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=auCcba+5d77RO1uYXgMttg2oy3VWOurHghWnl0cLv30=;
        b=Jggu/0nyAr3PqaM1XOKaEfgH+tDMrqD5ufx6IsEFhCyi8qyy3nshIv9xyYeB6xndkd
         0WzT8Ps7O4whHYpYatjyZ6pvyZfARVkEMrb96GA9iEvKBVeHTEyukhcJSeavYja0HLc/
         TmoyNsIEGK3IBPkJzIseGXVz6AIzDashasdOCKjKykhPacv4mMQKbTjqgtnWanGAwhjz
         wPsYMMoKO2bh0LH/xkH2lX6TbKNIOsRq3tvgRhylV1+D6slF0wyDfLAPRnAvByti2wPr
         fT1a6GyY1vk2H+WB0efCsz1A5GDa0EKs9VLkC19LGFdHTtdmdFn7gIbim2Bsw6hH9wdx
         +nyg==
X-Forwarded-Encrypted: i=1; AL+hErHVj6W0axOGZ2rbNkk8FU55Wj3q5GcjeRnLEfwcpApEwhKnLTz1zo09yUknKGTtBGEaW/E3ECYdYTA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HbUYDauVMzs1X49/X9mO/4+AiUL49Ze8Cgqx3KDQYfT0pDlyv
	NzLhHOuPTUI1pl+/bQ5KgnCBMWU3yuZPoIEF1KLJb4iGgkU5GHZx3v3kIY72y0mGgxo=
X-Gm-Gg: AZFdTZewoAWpZ0EuahecRLYX6PnfPDmIfhUsCkr4lYFCenYkzTGquS7E5RxKhwlMbE5
	/v1MRSCd3F+7oCPW4Yyi4LITqtjtz9EuqX3RVzhluc8FsdxHERnqhM9fZKMBEJMo8VcSlREtDeR
	c3uz/dg1WauP4tgNv1aMUpvcunAfoxCl/maaLmJbRs+GFJ1s71Tv3Ubho+MAYRPW2KEVlAWTfsx
	AbJC9MMYVBjLcKSjgujnrFRLFwGtgkGkkU+0lhHfujywQQfkz/BlvFF0HfbB0GGmVM9RVffdNqt
	6ctrcCBdb2DlNwNblS4V0GncQ54XVHdXmr21f4QE3ER+9I2A6cySvFWwj3RlTwGDettdN/VY/2D
	w0Iy+I+sJNcljn1dFS+nYSyWEH+uJJjvMqhyRCUI5wk/nGihQzErDxce8OOhr5k8S7qPNoc7lRr
	ayz+g7jtr0quKVj7sFJLEOD1+vaCNbihkCV3RAU4wgZ4z+sybI3RdPl/e39HOqFDVZhBHXwRdQa
	B82yKbnJJqyJFIDcN0V6Dv6AxM4XQRO6hvFYQ8qYlHJ2dT5GrsZtj1LdOMsD4+eZ8KxttfufWWZ
	8jFOHN2KC8nCzZyRS88UYxs/mA1Tug==
X-Received: by 2002:a05:600c:4e16:b0:4bb:69b2:d3df with SMTP id 5b1f17b1804b1-4bb88813024mr437965725e9.25.1795703912479;
        Thu, 26 Nov 2026 06:38:32 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865b1sm615439805e9.5.2026.11.26.06.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:38:32 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 26 Nov 2026 15:42:32 +0100
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
Subject: Re: [PATCH v3 06/28] dt-bindings: dma: brcm,bcm2835-dma: Document
 dma-channel-mask and DREQ flags
Message-ID: <awhFWBteSWqZ5keD@apocalypse>
References: <20261123145728.29082-1-andrea.porta@suse.com>
 <20261123145728.29082-7-andrea.porta@suse.com>
 <awXnR8jz-Nd4QLJ_@lizhi-Precision-Tower-5810>
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
In-Reply-To: <awXnR8jz-Nd4QLJ_@lizhi-Precision-Tower-5810>

Hi Frank,

On 14:36 Tue 24 Nov     , Frank Li wrote:
> On Mon, Nov 23, 2026 at 03:56:44PM +0100, Andrea della Porta wrote:
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
> > ---
> >  .../bindings/dma/brcm,bcm2835-dma.yaml        | 26 ++++++++++++++++---
> >  1 file changed, 23 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
> > index c9b9a5490826..f619e395cf0d 100644
> > --- a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
> > +++ b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
> > @@ -37,15 +37,30 @@ properties:
> >      maxItems: 16
> >
> >    '#dma-cells':
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
> 
> Add header file for such defination.

Ack, in v4, the header will be include/dt-bindings/dma/brcm,bcm2835-dma.h, used
by both the driver and the device trees.

Thanks,
Andrea

> 
> Frank
> 
> >      const: 1
> >
> > +  dma-channel-mask:
> > +    maxItems: 1
> > +
> >    brcm,dma-channel-mask:
> >      $ref: /schemas/types.yaml#/definitions/uint32
> > +    deprecated: true
> >      description:
> >        Bitmask of available DMA channels in ascending order that are
> >        not reserved by firmware and are available to the
> >        kernel. i.e. first channel corresponds to LSB.
> > +      Use the generic dma-channel-mask property instead.
> >
> >  unevaluatedProperties: false
> >
> > @@ -54,7 +69,12 @@ required:
> >    - reg
> >    - interrupts
> >    - "#dma-cells"
> > -  - brcm,dma-channel-mask
> > +
> > +anyOf:
> > +  - required:
> > +      - dma-channel-mask
> > +  - required:
> > +      - brcm,dma-channel-mask
> >
> >  examples:
> >    - |
> > @@ -96,7 +116,7 @@ examples:
> >                          "dma14",
> >                          "dma-shared-all";
> >          #dma-cells = <1>;
> > -        brcm,dma-channel-mask = <0x7f35>;
> > +        dma-channel-mask = <0x7f35>;
> >      };
> >
> >  ...
> > --
> > 2.51.0
> >
