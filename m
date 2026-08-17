Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58CF3DD503;
	Mon, 17 Aug 2026 21:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787003917; cv=none; b=J3lZlfeyJiJ4FuyAC1pEIZcU80OvFTZQHekiZ8WivhXOrPl+hD4dozSRsi7//1eXqAUdDShFS9wThbgg9wA1081EfNrFEKqQYtGVMkz2vkPbOqYYHjlst5e98OvI8DveR59SxaL9HwtZ/nXQ3jtTaN2w+jVuWlPyKFR8P0Yhscw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787003917; c=relaxed/simple;
	bh=Onzlf6qslFqKuzddoodp9wcFYpliUXVBgICD2dnhBRk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=b8iFbnN6qJoSxQl37uUDXPv2BXyU7xGqHajMUosEP6OXpxs62otP1G5vXQNYscP0PtHKrx/SBnxcD48/37toR8tCKQCfcgxX/IEzbEHc7pCOneV2jFPnYeXKCnvwlQa3VLnzvfODJOfIJGEcQ6I9fQFmLV/FYa4qIx8NlfFO2MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EAvrzshI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EAvrzshI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB4321F00A3A;
	Mon, 17 Aug 2026 21:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787003910;
	bh=QHYXFmEpUZml9PNH+fpjpeMsB7eYNHyBmr+snfwmDfM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EAvrzshIzOPe9IQUTkpW0qM4GhZyKrxbB4Ao95UWzwHLBxV8XzziV/0yLd0Z3/kbY
	 xdHSJsEI4RUGEhPQq53PkfyWsToj85op28cnJoqFh0ec6aHS8djJ5lux+h0frKlyHA
	 A0LKdBGpLvqabCK67NSo7AiaPtKxJDECpK861U4LdK6qVTTYlJk7ycuqrddKuoWwqd
	 6rtgb+SuRus5ec42ctfDcj4DhE+LttzKW9SA/J9N/B/aRvO1x7lEB5IZeFS/LBIOZm
	 AcrRLgCL6C7qw6+h3GHetuoL+R+ccfbe6SStihouBiVc5lo04ePTIZHFJWILJ9DyTI
	 aiZ42ctJyWefg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: dma: ti,cppi41: Convert to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bhargav Joshi" <j.bhargav.u@gmail.com>
Cc: conor+dt@kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, robh@kernel.org, olteanv@gmail.com, Frank.Li@kernel.org
In-Reply-To: <20260818-ti-am33-usb-v1-1-69ac5f92df45@gmail.com>
References: <20260818-ti-am33-usb-v1-0-69ac5f92df45@gmail.com>
 <20260818-ti-am33-usb-v1-1-69ac5f92df45@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 21:58:29 +0000
Message-Id: <20260817215829.AB4321F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The newly added deprecated properties `#dma-channels` and `#dma-=
requests` lack a type reference, which will cause `dt_binding_check` to fai=
l.
- [Medium] The `interrupts` property is strictly required by the hardware a=
nd driver but is missing from the global or variant-specific `required` lis=
ts, while `interrupt-names` is required without `interrupts`.
--

--- Patch [1]: [PATCH 1/7] dt-bindings: dma: ti,cppi41: Convert to DT schem=
a ---
commit 9d239577372b14253a6bd9fcf116eef3c7b58ad3
Author: Bhargav Joshi <j.bhargav.u@gmail.com>

dt-bindings: dma: ti,cppi41: Convert to DT schema

Convert TI CPPI 4.1 DMA controller text bindings to DT schema. Add
ti,am3359-cppi41 and ti,da830-cppi41 into single schema since they share
the same hardware IP block and driver. Add undocumented dma-requests
and power-domains properties to match existing DTS usage.

> diff --git a/Documentation/devicetree/bindings/dma/ti/ti,cppi41.yaml b/Do=
cumentation/devicetree/bindings/dma/ti/ti,cppi41.yaml
> new file mode 100644
> index 0000000000000..110cf62c66d20
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/ti/ti,cppi41.yaml
> @@ -0,0 +1,108 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/dma/ti/ti,cppi41.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#

[ ... ]

> +  power-domains:
> +    maxItems: 1
> +
> +  "#dma-channels":
> +    description: Deprecated, use dma-channels instead.
> +    deprecated: true
> +
> +  "#dma-requests":
> +    description: Deprecated, use dma-requests instead.
> +    deprecated: true

[Severity: Medium]
Do these deprecated properties need an explicit type reference, such as
$ref: /schemas/types.yaml#/definitions/uint32? Without a type reference,
will dt_binding_check fail with a missing type definition error for these
custom properties?

> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - "#dma-cells"
> +  - dma-channels

[Severity: Medium]
Should interrupts be included in this top-level required list? Since the
hardware and driver unconditionally fail probing without it, omitting
interrupts here might allow incomplete device trees to silently pass schema
validation.

> +
> +allOf:
> +  - $ref: /schemas/dma/dma-controller.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: ti,am3359-cppi41
> +    then:
> +      properties:
> +        reg:
> +          minItems: 4
> +        reg-names:
> +          items:
> +            - const: glue
> +            - const: controller
> +            - const: scheduler
> +            - const: queuemgr
> +        power-domains: false
> +      required:
> +        - interrupt-names
> +        - dma-requests

[Severity: Medium]
Does requiring interrupt-names here also imply that interrupts should be
required? It seems logically inconsistent to mandate the names but not the
interrupts property itself.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818-ti-am33-us=
b-v1-0-69ac5f92df45@gmail.com?part=3D1
