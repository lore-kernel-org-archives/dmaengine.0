Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8087D31E822;
	Fri,  2 Oct 2026 14:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790951657; cv=none; b=kYyJy99CHerTXRcMaSM8lvMZ38YKPt5/jPHA+TI/FiHqr3cQaQVFqfzbtkYiX9zEf3QXreTPyDXwUPNr4YoLPxkxM24vRKn8TVqC93ZieNiBmLEenS5szmbdpCtjvlnlEzUUE7aBl5GQcqlj3lnsiBNKhCaDZ/6bEJi3nSLf//Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790951657; c=relaxed/simple;
	bh=K09tW2pZcLxhsKBNT47sOeuFv7KwpbpVm8Ajz6e3gHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LwmY4vtRuWiXt5k0nhcF3To2FXHYukxePQ7hnU42A9AwTJQhG1Wd1FBRF48ZOgHa57iLN9vcIgCgtPSe0zeGmSAIuvLh+B7cp5L6h1SpdeR+bb68P/wS/tvnTMspNhhbjvIG1BeVYfGuPl2SKkkGQscJwciXx7qNRvJ+1R/DO8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AuWRTkUc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AuWRTkUc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C34441F000FF;
	Fri,  2 Oct 2026 14:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790951656;
	bh=wWVwPgWL5oBQRMCus0Q2AVGcb6nOS2/6Uzl6DnxI/CU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AuWRTkUc0Jo7RsTaxO2mYdjU31Kcm4Q2bYFhxKyoOqwatFobS38r9kBrxsmEjQFvK
	 v4Tvt4RAw40+PGZXz0FLUKyf+VbX5k770OmDIVXJlBcPfIjoWaEiw7LiQRG1vgF/4M
	 H3mwRc8E2xWusB/ILfXwzneCxFxSySEiJH5UmHThSY4oFdj8DWvmUpVFyngMiK65Rn
	 MJJgsmn5qrriPKOPauRPVAse5dUT2qBDn5+zs1Ml4d9jOaqE/W1IPTEe+SG0KzhXxl
	 IQ5cVdyT7z5QJK7QGwQ7uK6dxLnCIN6NjZJi60/jSM6YPZF3VNuhVVZQFR1y02pb8k
	 FNGw2U0m65tTQ==
Date: Fri, 2 Oct 2026 09:34:14 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Wei Xu <xuwei5@hisilicon.com>,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: dma: Convert hisilicon,k3-dma-1.0 to DT
 schema
Message-ID: <20261002143414.GC1579700-robh@kernel.org>
References: <20260928124448.3754740-1-robh@kernel.org>
 <ar1jarw-WgVlq2_G@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ar1jarw-WgVlq2_G@lizhi-Precision-Tower-5810>

On Wed, Sep 30, 2026 at 03:30:50PM -0400, Frank Li wrote:
> On Mon, Sep 28, 2026 at 07:44:46AM -0500, Rob Herring (Arm) wrote:
> > Convert the hisilicon,k3-dma-1.0 binding to DT schema format.
> >
> > Add dma-channel-mask, dma-no-cci, dma-type and interrupt-names
> > properties which were not documented.
> >
> > The "hisilicon,hisi-pcm-asp-dma-1.0" doesn't have clocks, so make it
> > optional.
> >
> > Assisted-by: LLM
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> > v2:
> >  - Fix example node name to 'dma-controller'
> > ---
> >  .../bindings/dma/hisilicon,k3-dma-1.0.yaml    | 87 +++++++++++++++++++
> >  .../devicetree/bindings/dma/k3dma.txt         | 47 ----------
> >  2 files changed, 87 insertions(+), 47 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/dma/hisilicon,k3-dma-1.0.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/dma/k3dma.txt
> >
> > diff --git a/Documentation/devicetree/bindings/dma/hisilicon,k3-dma-1.0.yaml b/Documentation/devicetree/bindings/dma/hisilicon,k3-dma-1.0.yaml
> > new file mode 100644
> > index 000000000000..e60f2a572272
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/dma/hisilicon,k3-dma-1.0.yaml
> > @@ -0,0 +1,87 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/dma/hisilicon,k3-dma-1.0.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Hisilicon K3 DMA controller
> > +
> > +maintainers:
> > +  - Wei Xu <xuwei5@hisilicon.com>
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - hisilicon,k3-dma-1.0
> > +          - hisilicon,hisi-pcm-asp-dma-1.0
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  '#dma-cells':
> > +    const: 1
> > +
> > +  dma-channels:
> > +    description: Number of physical DMA channels supported.
> > +    maximum: 32
> > +
> > +  dma-requests:
> > +    description: Number of virtual DMA request lines supported.
> > +    maximum: 32
> > +
> > +  dma-channel-mask:
> > +    description: Bitmask of usable DMA channels.
> > +
> > +  dma-no-cci:
> > +    type: boolean
> > +    description: DMA is not coherent with the CCI.
> > +
> > +  dma-type:
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    description: SoC-specific DMA type name.
> > +    enum:
> > +      - hi3660_dma
> > +      - hi6220_dma
> > +
> > +  interrupt-names:
> > +    maxItems: 1
> 
> It'd better move interrupt-names after interrupts property.

Yes, but more importantly the name needs to be defined.

> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - '#dma-cells'
> > +  - dma-channels
> > +  - dma-requests
> > +
> > +allOf:
> > +  - $ref: dma-controller.yaml#
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: hisilicon,k3-dma-1.0
> > +    then:
> > +      required:
> > +        - clocks
> > +
> > +additionalProperties: false
> 
> there are $ref, should be unevaluatedProperties?

No, because every property used has constraints here.

Rob
