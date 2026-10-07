Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28EE4483BF2;
	Wed,  7 Oct 2026 10:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791370728; cv=none; b=SWp8Nw4KzP+OUxXfOhlYdhOIblU2yA5y+kL04wmhldnw8MfhxqhPhJ+lNpsSUb50VRIAVttm8sgTJMwN4LngSJDdvCMBe3tpsotdEzzL1yLn2m/JA8zMCs9itZYGC78qgAqPaZJqvZ44ejOWM/gIeKinjDMOsFlLDR18kw0naY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791370728; c=relaxed/simple;
	bh=QFXIXB99Hc4xAfCNIJmNcvK6MG8czMABWZ6vPX4mx4o=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Wmp37pBpLHW2whkCnRUoYbvgL3rO12HreMYAgZgVbe+ty2WlNc3iCbVbzk25U98eQ2xNFEFg4VtWyfAlN37pGz/XH9xKXsnCtPuBBNmn7w8x3ITVlMAavj9IVrt7V7/E0RC0s9S3WEm0shetrBaiI8saMXm/1s8tbgdZx1QPwCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NNXBPlPd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NNXBPlPd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18D0A1F0089B;
	Wed,  7 Oct 2026 10:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791370700;
	bh=FmP+pubLQ6p2PYKYBHUnSMCXOIFoWoeub9J35/iNso8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NNXBPlPdMAlvNLmd9x3ER1h6ZaGEp1S8QtAz+o1vqdX391w5xEA3vb/B3fYVzWnqn
	 gqtBVqQDl8itNIgv18X4eGGDfeIbHNKpBqKg+ZWRNw3TU503FtCPNpt+nV8Hn8LyTX
	 U5nHS03R2368Ef4fOmZ/3vinLwulnfJbLetiqmzjwCcm5+6iwr1bgiL37riluKXqX+
	 Ffqxz6YTXE1fW2l0D1Bm5Yp2akkKlKgdtKKerKbrJT4+Kxn5oSLWs+E/M8Klj2So0C
	 MTjjYUV0E6Qthc0fJazUGOBSeLMGIgiye9WMqMlstK+rWFmDIKcPbqH6kHajgIXC3R
	 5DiNGhClMMYcw==
Message-ID: <sashiko-outbox-162896@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 14/20] dt-bindings: dma: ti: Add K3 BCDMA V2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Sree Kartheek Adivi" <s-adivi@ti.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, robh@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20261007102936.2402427-15-s-adivi@ti.com>
References: <20261007102936.2402427-1-s-adivi@ti.com>
 <20261007102936.2402427-15-s-adivi@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 10:58:19 +0000
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: dma: ti: am62l-bcdma missing power-domains/clocks p=
roperties
--

commit 7cc1465076fec744d409700a2f52d2abf1725b87
Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>

dt-bindings: dma: ti: Add K3 BCDMA V2

This commit introduces a new binding document for the Texas Instruments K3
Block Copy DMA (BCDMA) V2. It is intended for AM62L and describes block copy
and split channels.

> diff --git a/Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-bcdma=
.yaml b/Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-bcdma.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-bcdma.yaml
[ ... ]
> +allOf:
> +  - $ref: /schemas/dma/dma-controller.yaml#
> +
> +properties:
> +  compatible:
> +    const: ti,am62l-dmss-bcdma
> +
> +  reg:
> +    items:

[Severity: Medium]
Since the AM62L transitions to standard ARM SCMI and drops the proprietary
ti,sci properties, should the standard "power-domains" and "clocks"
properties be explicitly declared in this properties block?

The AM64 variant utilized an independent "ti,sci-dev-id =3D <26>", indicati=
ng
independent resource management in firmware distinct from the DMSS parent
bus.

If a device tree author adds "power-domains =3D <&scmi_pds X>;" to the
ti,am62l-dmss-bcdma node to describe this hardware, it appears schema
validation will falsely reject it because unevaluatedProperties is set to
false further down in the schema.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007102936.2402=
427-1-s-adivi@ti.com?part=3D14
