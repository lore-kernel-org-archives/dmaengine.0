Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E643515E9;
	Mon, 31 Aug 2026 23:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788219271; cv=none; b=b8oz45eKCGmFC7mj5w8JGm6AImP+JVXIsAm2ZX+NSOpoTo64pRq8f6TmJgulGCrZ3wl+Uc1YBvu8bea0XiFAjrdgtcKGCvxaXRJo6xokFHV9zWVpoz4Ja6sKCuONbe/GTj9+CFrKBM5IFfqxqhNbGc6DtWABOt5y3r8QJRoP4Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788219271; c=relaxed/simple;
	bh=/nEDe9wlkY6bUugkggbHVa9uGbsAtppTXiXi1riYR+g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CldVEk4ExF60Jzr2+RNS058pwVyJOQWvi4tcPWiqzodD6HkCXa4rOxH3vszmwK3BDXgmseZMzVBYMwsVv6BnITBw7pJWFxAQ/v8BwNx3GW6RYw6Zd1D8wAK/2U2FO2dsy70fUIYFQKi6WNtQfLGHFt22KyT9x8GBSRDfVSKXRow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HDk12PfY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HDk12PfY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A606E1F000E9;
	Mon, 31 Aug 2026 23:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788219269;
	bh=3hUHG3ivPMOhp6I2g1WfIkXyPmqFRO3oZXtqy4IwaJw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HDk12PfYsbirnD7OLxaVsNFLCl3uHbmfUD+x9xRNIXcYYrgRYxptiAV7nyp4Oxax5
	 /fOWBWUFCbpGwivya3SKST+CmV9BPqf+fhbyHiSncUd2WI9AnWBiiTO0qnhIUvRY3x
	 PMbbD+QGaQe4bwfyKFJwR/0L9yTvkAdEk607ZEKOUM6cFSPfjS8vQNvycM1ld8852O
	 D/DmtKQLzuRj4dlPZyIAk+wMNOoVXsEjTbgmCF/2k+5XIaUTlRzCY6RYNJ7RxEmZP5
	 7MWrfFvfTEWgq1d1ruvegV7fEHajGYtSLj6HNenIN9oy6y2HkLDnZZ0MdclYy0Xg91
	 swMAc5By56s/w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/6] dt-bindings: usb: ti,musb-am33xx: Convert to DT
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bhargav Joshi" <j.bhargav.u@gmail.com>
Cc: olteanv@gmail.com, conor+dt@kernel.org, vkoul@kernel.org, robh@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org, linux-phy@lists.infradead.org
In-Reply-To: <20260901-ti-am33-usb-v3-3-5e15c617d2e9@gmail.com>
References: <20260901-ti-am33-usb-v3-0-5e15c617d2e9@gmail.com>
 <20260901-ti-am33-usb-v3-3-5e15c617d2e9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 23:34:28 +0000
Message-Id: <20260831233428.A606E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing type definition for vendor property `mentor,ram-bits`.
--

commit b18161dcce0d8d9c92432e06f2d6b68cc0d0e262
Author: Bhargav Joshi <j.bhargav.u@gmail.com>

dt-bindings: usb: ti,musb-am33xx: Convert to DT schema

This commit converts the TI AM33xx MUSB text bindings to DT schema. It also
allows an optional vbus interrupt and adds interface-type and phy-names
properties for dm816x hardware.

> diff --git a/Documentation/devicetree/bindings/usb/ti,musb-am33xx.yaml b/=
Documentation/devicetree/bindings/usb/ti,musb-am33xx.yaml
> new file mode 100644
> index 0000000000000..cc01edc75d11e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/ti,musb-am33xx.yaml

[ ... ]

> +  mentor,num-eps:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Specifies the number of endpoints.
> +    const: 16
> +
> +  mentor,ram-bits:
> +    description: Specifies the ram address size.
> +    const: 12

[Severity: Low]
Is mentor,ram-bits missing a type definition?

Without a type reference for a custom property, make dt_binding_check issues
a 'missing type definition' warning and fails constraint evaluation against
valid DTS usage. DT schema parses cell arrays like <12> as matrices like
[[12]] if not told they are scalar integers, failing the const: 12 check.

Does this need a type reference like
$ref: /schemas/types.yaml#/definitions/uint32 similar to mentor,num-eps and
mentor,power?

> +
> +  mentor,power:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Controller supply capacity (in mA) when operating in ho=
st mode.
> +    const: 500

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-ti-am33-us=
b-v3-0-5e15c617d2e9@gmail.com?part=3D3
