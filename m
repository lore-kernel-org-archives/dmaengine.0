Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB383CEB9D;
	Wed, 30 Sep 2026 06:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790750082; cv=none; b=iz+etTLQMPgqaP/NycLV+OtRrqxtUZqByjodxzUGeFQBfQn/4axvZamlL1vPMFn0TBxYSZJFSCTZ2Aj9aimki5epS99YIiTs26PqQdv/+ykBbRM1ioXoR5dshfiiNXCEHejyXSsjQtZN1g6KbiBwFc1/3S59/NNX5HkUqN/+6jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790750082; c=relaxed/simple;
	bh=baQ+2tXY9cEz4taZYGCDQ1JZXZsqMhHzq7KSOzTiTE0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=G39lGmv3WCHtFr4Ji+y1cZ+k0yBU+efO7vgZh7PLlfAQJpaZjQaJwJFBHrB25NoTERiH9r+one8uvHkruYBKRFaEDwgltGNrffFfT0FckD/yFlMkdrsuXaoIbI2r3GCjHk+EHmbxl4o/cIuECV+239hfjPYjlRRIz7pJ88aFig4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VbkaXZQW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VbkaXZQW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93FF41F000FF;
	Wed, 30 Sep 2026 06:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790750075;
	bh=XNye/AAY2IkjKhZWXcc5Z9iQogATZlPfWecUkSrhHtM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VbkaXZQWgZflb66dTt9PZyYtNmMwiZaXsi3C4wFxv4Ay9MgVCap7AOB3MvP0BqX2y
	 V/ebEgBFHgR+by+xvu/c3SDJYCkprPLfwY3Wq05cfjQ+egH4MhlVAepLKuhrjjuTA3
	 dYwTmhqDD+PpNZhaxEQWF4D6Xm5PrEIYsAs4W8enoAJ1jnYJvn5LxWp93n1yUXiVGk
	 pqUyJ1FWHMhzygJZgS9ezz/xoQzc9qDzOHtCbk+eqhw5VFN89VdliT+TAiuTq7PqiC
	 eHvhxlARilSGSoSFAmWFLhg2zT7q4e0RYu6ayZuzcL01II7DVjJkrrv0Rn32kRKxqm
	 aGNLbftVS/Dpg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: dma: fsl,edma: add per-channel
 child node support
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, imx@lists.linux.dev, vkoul@kernel.org, robh@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260930-edma-iommu-v2-1-72a62bf44c74@nxp.com>
References: <20260930-edma-iommu-v2-0-72a62bf44c74@nxp.com>
 <20260930-edma-iommu-v2-1-72a62bf44c74@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 06:34:34 +0000
Message-Id: <20260930063434.93FF41F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: fsl,edma: missing required interrupts property vali=
dation
--

commit 4f1b5be8631d1a7b37208c50010390f6dfaf3925
Author: Peng Fan <peng.fan@nxp.com>

dt-bindings: dma: fsl,edma: add per-channel child node support

Add support for optional per-channel child nodes to the fsl,edma binding
to describe real per-channel MMIO regions. The interrupts property is
removed from the required list to accommodate these child nodes.

> diff --git a/Documentation/devicetree/bindings/dma/fsl,edma.yaml b/Docume=
ntation/devicetree/bindings/dma/fsl,edma.yaml
> index f609038e35ae1..19a103baccaf4 100644
> --- a/Documentation/devicetree/bindings/dma/fsl,edma.yaml
> +++ b/Documentation/devicetree/bindings/dma/fsl,edma.yaml
[ ... ]
> +patternProperties:
> +  "^dma-channel@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      reg:
> +        maxItems: 1
> +        description: Per-channel register region within the eDMA block.
> +
> +      interrupts:
> +        maxItems: 1
> +
> +      iommus:
> +        maxItems: 1
> +
> +      power-domains:
> +        maxItems: 1
> +
> +    required:
> +      - reg

[Severity: Medium]
Does this required list fail to enforce the interrupts property when the
new child node approach is used?

>  required:
>    - "#dma-cells"
>    - compatible
>    - reg
> -  - interrupts
>    - dma-channels

[Severity: Medium]
Does removing the interrupts property from the global required list break
schema validation for legacy device trees (e.g., fsl,vf610-edma or
fsl,imx7ulp-edma)?

Without this enforcement, invalid device trees that completely omit
interrupts might silently pass make dtbs_check. This could result in
incomplete device trees failing at runtime during driver probe. Is it
possible to preserve this in a conditional enforcement block for legacy
hardware instead of dropping it entirely?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930-edma-iommu=
-v2-0-72a62bf44c74@nxp.com?part=3D1
