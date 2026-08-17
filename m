Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894633DB63A;
	Mon, 17 Aug 2026 21:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787003918; cv=none; b=pICK/dXOVgRJ+non/dqty+Cm2VuhrwQaOFPRtBMoveKn2Ufa7WnlpPywtcuRULlDcW0G/I91WgW/K30iIV6CaECC9D8pbUcp/e+vLlBBYEuekF+mPe1MnV6y3cANXgjyeeuMtfD+TFMQAc/2oTS3OQ263WQNaEEkmiN4RHDJ8mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787003918; c=relaxed/simple;
	bh=HVDZK6e0pZGg90O4ZyoaAS2w25liISUYb8k8QM4NWIQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AkRNGBic51WN7EB53vtlrRDLy3puq18/KfzT5DWOU9+hNnQ/Vvv2+wJ5yvs/28kk5rZsB3PRc0+XEHXq3e/KO4wEFnpEmugve4hzLgDpKAB9nHd/TTJy7KsMrq0XafYzYRxWK9HlRt/6SS24GOAkA6RBXgGQ78vEQP4uEY9u+ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KlCASnJr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KlCASnJr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 978C41F000E9;
	Mon, 17 Aug 2026 21:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787003909;
	bh=38Jkm+lbu72apfTZ4s/tQeHyRRr/ttGUwGlE0DYprTw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KlCASnJrcuXRGEGdwXVd4LvLPs9iJB8xMu4NZeDh07PuaEmpMt9M5TBnQo205BPWw
	 70PpFoowjRZvJwL2mwqWyxVQQRN4zgPNNCpt5b+B2QomYludriRP9lfVnyvUCAY08H
	 AhG/0KcY7i+5Sg+iR4CVk9PXsrTe6VSJb9KYugRdGqEuYaY8DlhofxqUiRwgVNPWU3
	 a6Bt/OwNm3NF19r9kmXUwk6a+nvXv8vUFcppWZUB/T2IHte1nBCUg7iRJn4mwMaTN9
	 QDMbwUQzf0qnhn9CfvpjS9z7iJ2e6zN6S0VQbmi8FOrMt1H3y6vCE+ArY0Y3D03wka
	 ycIsbFgz5P8Dg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/7] dt-bindings: usb: ti,musb-am33xx: Convert to DT
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bhargav Joshi" <j.bhargav.u@gmail.com>
Cc: neil.armstrong@linaro.org, dmaengine@vger.kernel.org, olteanv@gmail.com, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, vkoul@kernel.org, devicetree@vger.kernel.org, linux-phy@lists.infradead.org
In-Reply-To: <20260818-ti-am33-usb-v1-4-69ac5f92df45@gmail.com>
References: <20260818-ti-am33-usb-v1-0-69ac5f92df45@gmail.com>
 <20260818-ti-am33-usb-v1-4-69ac5f92df45@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 21:58:28 +0000
Message-Id: <20260817215828.978C41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The custom vendor-specific property `mentor,ram-bits` is missing a =
type definition reference (`$ref`), which will cause device tree schema val=
idation to fail.
--

--- Patch [4]: [PATCH 4/7] dt-bindings: usb: ti,musb-am33xx: Convert to DT =
schema ---
commit 8d75d797452b1f785af4636b0cd55212a95b505a
Author: Bhargav Joshi <j.bhargav.u@gmail.com>

dt-bindings: usb: ti,musb-am33xx: Convert to DT schema

This commit converts the TI AM33xx MUSB text bindings to DT schema format.
It includes modifications to support optional vbus interrupts and natively
supported multipoint setups, as well as adding hardware-specific properties.

> diff --git a/Documentation/devicetree/bindings/usb/ti,musb-am33xx.yaml b/=
Documentation/devicetree/bindings/usb/ti,musb-am33xx.yaml
> new file mode 100644
> index 0000000000000..05909d5ca3d2d
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
Does this property need a type definition reference?=20

Unlike its sibling properties (such as mentor,num-eps and mentor,power),=20
mentor,ram-bits is missing a $ref to a standard DT type. Because it is a=20
custom vendor-specific property, lacking a type reference like=20
$ref: /schemas/types.yaml#/definitions/uint32 typically causes=20
dt_binding_check to fail with a missing type definition error.

> +
> +  mentor,power:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Controller supply capacity (in mA) when operating in ho=
st mode.
> +    const: 500

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818-ti-am33-us=
b-v1-0-69ac5f92df45@gmail.com?part=3D4
