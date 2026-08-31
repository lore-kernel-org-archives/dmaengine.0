Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F563B7B71;
	Mon, 31 Aug 2026 23:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788219137; cv=none; b=C7L2hlS2hLYGfh6js3OuxCvtLZD4aFrP33KK/0IJR9+gQ/gdYiO9UFFBMaeEzu5WP7lIbUCFy2537Niq/TkhEhRUJq8KtgloE81rTSGsGw++4fxbq9yB25ZxlOEe8OxMi0tt3kR2R02sULKvx4g+VEaCAOGA69WwxNlifD1hnh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788219137; c=relaxed/simple;
	bh=H8m7hLWKCW2lO8V5sUz/lIGy2s8rLSIV4Py4XcQzRqA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aF+zBVdGcQO6vAmHBkMb2JXhks2gtsPJYoRrOf7UsjieVBkAXtuIloDcibhvyji9Lqxay/SghB9Qo5PPexAPS9QgaBC5ArFhHDrP6hdx+6xGXhX8MJuPPt+GjsFA7GUYUfSjb+UnaK/ZIWn+dXI9XcKPic/k90AJ7/ZBgcyV1fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WC4S8XCw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WC4S8XCw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E43E41F000E9;
	Mon, 31 Aug 2026 23:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788219136;
	bh=j/VcSlVg/OvNiOWLEeg70xYa2uunFQ7jKdvNXkHVm2A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WC4S8XCwQDNLmJG2k4N6zfzyi2QPrmfXIh4HUJseFovinEbTF0Hs2axnITwP+60OI
	 aJ3Yh9i2+0ecExvF7j8uuUCCjN0QAV3PJfNUmu2lNsNhOqTbUPTo+FWPvMbNzK0anB
	 42i4mwrIJ/2zj5gZVH21irJ7Hbr0OpPiK3qoHUME515P5okuk8GBR+y5hDXVw61Llx
	 RUq7INwFXWurNwCVXNgyN0cOEJFKQrIpMrtM+BdR6DRKo7fXB0oXzfG7M6aNdgk00v
	 umCPEgZY4Djsv/JQTGyWCcgYwIEPIOt/S+5IHtvPsSjyWa5etu+lT7vKFgTs7591zs
	 DvSPOS6ftCDIA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/6] dt-bindings: usb: ti,am335x-usb-ctrl-module:
 Convert to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bhargav Joshi" <j.bhargav.u@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org, neil.armstrong@linaro.org, Frank.Li@kernel.org, linux-phy@lists.infradead.org, olteanv@gmail.com, devicetree@vger.kernel.org
In-Reply-To: <20260901-ti-am33-usb-v3-4-5e15c617d2e9@gmail.com>
References: <20260901-ti-am33-usb-v3-0-5e15c617d2e9@gmail.com>
 <20260901-ti-am33-usb-v3-4-5e15c617d2e9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 23:32:15 +0000
Message-Id: <20260831233215.E43E41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Documentation loss for `reg` property entries during dt-schema conv=
ersion.
--

commit c1a1061abb654fbffdeb37f5a8ae9d8c5c5596f0
Author: Bhargav Joshi <j.bhargav.u@gmail.com>

dt-bindings: usb: ti,am335x-usb-ctrl-module: Convert to DT schema

Convert the TI AM335x USB Control Module text bindings to DT schema. No
functional changes.

> diff --git a/Documentation/devicetree/bindings/usb/am33xx-usb.txt b/Docum=
entation/devicetree/bindings/usb/am33xx-usb.txt
> index 5973f88bcc65d..94312ad8ec8cd 100644
> --- a/Documentation/devicetree/bindings/usb/am33xx-usb.txt
> +++ b/Documentation/devicetree/bindings/usb/am33xx-usb.txt
> @@ -8,15 +8,6 @@ The glue layer contains multiple child nodes. It is requ=
ired to have
>  at least a control module node, USB node and a PHY node. The second USB
>  node and its PHY node are optional. The DMA node is also optional.
> =20
> -Reset module
> -~~~~~~~~~~~~
> -- compatible: ti,am335x-usb-ctrl-module
> -- reg: offset and length of the "USB control registers" in the "Control
> -  Module" block. A second offset and length for the USB wake up control
> -  in the same memory block.
> -- reg-names: "phy_ctrl" for the "USB control registers" and "wakeup" for
> -  the USB wake up control register.
> -

[ ... ]

> diff --git a/Documentation/devicetree/bindings/usb/ti,am335x-usb-ctrl-mod=
ule.yaml b/Documentation/devicetree/bindings/usb/ti,am335x-usb-ctrl-module.=
yaml
> new file mode 100644
> index 0000000000000..f8ac0af745c6c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/ti,am335x-usb-ctrl-module.yaml
> @@ -0,0 +1,38 @@

[ ... ]

> +properties:
> +  compatible:
> +    const: ti,am335x-usb-ctrl-module
> +
> +  reg:
> +    maxItems: 2

[Severity: Low]
Does this YAML conversion lose some of the documentation details from the
original text binding?

The previous text binding included explicit descriptions for the two reg
entries ("USB control registers" and "USB wake up control"). While reg-names
are provided below, should an items list under reg be included to preserve
these explicit descriptions?

> +
> +  reg-names:
> +    items:
> +      - const: phy_ctrl
> +      - const: wakeup

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-ti-am33-us=
b-v3-0-5e15c617d2e9@gmail.com?part=3D4
