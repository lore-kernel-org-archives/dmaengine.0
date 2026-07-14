Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1E7381B02;
	Tue, 14 Jul 2026 11:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784030339; cv=none; b=FiH8grfmEj+lizST815Tog3ORgVUWZ82qi1ToAlSqqOL3aBBFmorJXcDB7JopZhlJMs/eldWZzCtsQt3TDLEmzMagu6luGQRcA34Gysv+Jn+RINUYubeYsOQcka2N5a8Lg/L40kxik5kXHcybKsztB8FLQ5H1fb9/GdlvLCusqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784030339; c=relaxed/simple;
	bh=kmdAeC8hOQ6BVZgDdZfmzE1BGMi4JMkVnWEtsYc6Kg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=APY6sm8CZNQQFTnRbk9jjwNSlYhDNoun0OYRUNFB0mHC4ACRwK19J9sJhM9kLn8iddBZlDBEQG3dDeT6dOoduh2OU1daeKywZR0es1yRTa7GwAdmGeHvGq9XUurNUGwCO+FC/OIBUt3m7IBYOPLv/nd0R/3ZAmzV3QbZIfXhGpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=otdtft7k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="otdtft7k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F09801F000E9;
	Tue, 14 Jul 2026 11:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784030337;
	bh=giljRTyf1/GeNOSQzfIPJUop85WcABknb2AO0qQE6u8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=otdtft7koRJ9KTpp8Lc1Kbd0yTLVGKldNWh2Pgdgbxv8Vhn1tQWMLDJynabMil1As
	 IrLVwudKY43tMQ9K6lC2xCblgiQpsMzzIu8kyX5MB1Pq4tQwGM2VRaFypD5LmPW27m
	 uOTxcSvsUa0iJZynDx6ZFSBUFGAZQlplKAV+jiOZ+JNcad24LpbxRVDVUSP+N9TyW+
	 d6Tm20PG90euvR1VHnSL3YbTZoIopdrLYRDoKH/5I651gQlF+115Hm3m5qube0LMct
	 VFIQrwY6uFGKPdKbvNaoIwRdEJulEZsufvfX3wsCqFDI45tmf1B7KgR6qRIVC3+aRZ
	 951wTJfKaMlmQ==
Date: Tue, 14 Jul 2026 17:28:54 +0530
From: Vinod Koul <vkoul@kernel.org>
To: sashiko-bot@kernel.org
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>, neil.armstrong@linaro.org,
	robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v11 1/3] dt-bindings: dma: Add Amlogic A9 SoC DMA
Message-ID: <alYkfmsBU0UqI6Hz@vaman>
References: <20260714-amlogic-dma-v11-0-de79c2394282@amlogic.com>
 <20260714-amlogic-dma-v11-1-de79c2394282@amlogic.com>
 <20260714081942.2E0B91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714081942.2E0B91F000E9@smtp.kernel.org>

On 14-07-26, 08:19, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The macros DMA_TX and DMA_RX in the global DT binding header lack an Amlogic/SoC specific prefix, leading to namespace pollution and potential build conflicts.
> --
> 
> --- Patch [1]: [PATCH v11 1/3] dt-bindings: dma: Add Amlogic A9 SoC DMA ---
> commit 093f368eaa67418008421d43d724ce2e98651039
> Author: Xianwei Zhao <xianwei.zhao@amlogic.com>
> dt-bindings: dma: Add Amlogic A9 SoC DMA
> 
> This commit adds device tree binding documentation for the Amlogic A9 SoC
> general-purpose DMA controller. It introduces the YAML schema and a header
> file defining the channel type macros.
> 
> > diff --git a/Documentation/devicetree/bindings/dma/amlogic,a9-dma.yaml b/Documentation/devicetree/bindings/dma/amlogic,a9-dma.yaml
> > new file mode 100644
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/dma/amlogic,a9-dma.yaml
> [ ... ]
> > +  '#dma-cells':
> > +    const: 2
> > +    description:
> > +      The first cell is the DMA channel type(DMA_TX or DMA_RX).
> > +      The second cell is the DMA channel index.
> [ ... ]
> > diff --git a/include/dt-bindings/dma/amlogic,a9-dma.h b/include/dt-bindings/dma/amlogic,a9-dma.h
> > new file mode 100644
> > --- /dev/null
> > +++ b/include/dt-bindings/dma/amlogic,a9-dma.h
> > @@ -0,0 +1,8 @@
> > +/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
> > +
> > +#ifndef __DT_BINDINGS_DMA_AMLOGIC_DMA_H__
> > +#define __DT_BINDINGS_DMA_AMLOGIC_DMA_H__
> > +
> > +#define DMA_TX			0
> > +#define DMA_RX			1
> 
> [Severity: Low]
> Are these macro names too generic for a global dt-bindings header?
> 
> Since headers in include/dt-bindings/ are globally visible and frequently
> included by C drivers, unprefixed names like DMA_TX and DMA_RX could lead
> to namespace pollution and macro redefinition build failures if a driver
> includes this alongside other headers that use the same common names.
> 
> Would it be safer to add a vendor or SoC prefix, such as AMLOGIC_A9_DMA_TX?

I think this makes sense to add here

-- 
~Vinod
