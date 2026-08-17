Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F263AC0DE;
	Mon, 17 Aug 2026 21:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787003648; cv=none; b=j/DjzB86if1ubVf4e9h2WYETJMIrT4k+lcWLAfRjun53NCq7tt86q9O8EzJ5B/X3XWVo8XddD/TV1PyH5wpMX4azUYuAsumqjyMz1ARelaixKH92oQq7WIu/7uM45WVoGGNfuymJB2P+gaQEMiYCRx3qB0icaN7/+4PVsOAY1bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787003648; c=relaxed/simple;
	bh=qT8JrrVncQQov/umD/LD7zDYZfQ5VcOxlPetELGYJ7I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dUuViq/LS9tjPbtqQ2luVttYFRrlIYA9WcQ8qrP44KQ5soHxlJwZMkl6ocz8lGOMZrJodCJTQoucFb1cSgkHhke2/npMMV7GqchosFCi78vpQBtyaPHO0+/a5hH4L3BoBarrWZ3IHWVEbL7kzIDeC7LQqSQRP8pTbuh+fVkKC0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JFN6++1X; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JFN6++1X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BC3F1F000E9;
	Mon, 17 Aug 2026 21:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787003645;
	bh=CWt4jK6RvOuPsdEwJA2WUw/FmL3gYdLpe/qBfCgPbvU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JFN6++1XwQ9cYVyfYKRBdaFvWItN+iGE+mXrA6y5D9XpColOFzN890iRZTa1ngmFv
	 XwCSCraD7TOKp7afWLdAeRCibyKKORuc0QbYDY2n9+5lDvcVNt6uzYTKFjd4iCSkam
	 +ckzi5uEptvXT/M6/lQ8WTiR9FCJk1+nnOMf34Tpgjj5g6aO14wpoUMoNmKv2c1cpU
	 mJSPKajLWzoCRQSEXAAFbPnVzHh6L93KLi6i2eQOwn9tke/rKDt9bcNgU0J8fzBcXx
	 PQVWXKentxYfiCqwXJOULssHtl/U95MkHoIlIE/ybC2bXEfzHhoBOC4/tBu1X9BHnt
	 1+ZCpaigY4Cvw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/7] dt-bindings: usb: ti,am33xx-usb: Convert to DT
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bhargav Joshi" <j.bhargav.u@gmail.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, robh@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, Frank.Li@kernel.org, conor+dt@kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <20260818-ti-am33-usb-v1-6-69ac5f92df45@gmail.com>
References: <20260818-ti-am33-usb-v1-0-69ac5f92df45@gmail.com>
 <20260818-ti-am33-usb-v1-6-69ac5f92df45@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 21:54:04 +0000
Message-Id: <20260817215405.5BC3F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The schema explicitly marks `ti,hwmods` as deprecated but simult=
aneously mandates it in the `required` array, creating an inescapable valid=
ation conflict.
- [Medium] Unresolved phandle references (`&ctrl_mod` and `&usb0_phy`) in t=
he binding example will cause a fatal dtc compilation error.
--

--- Patch [6]: [PATCH 6/7] dt-bindings: usb: ti,am33xx-usb: Convert to DT s=
chema ---
commit e8e58c2d48bc9c752ca62d3c7e0ea6fd5cff0b12
Author: Bhargav Joshi <j.bhargav.u@gmail.com>

dt-bindings: usb: ti,am33xx-usb: Convert to DT schema
   =20
Convert the TI AM33xx USB Wrapper text binding to DT schema.
Changes during conversion:
- Drop the USB control module from child nodes, as it physically resides
  within the System Control Module address space, not the USB wrapper.
- Allow standard phy@[0-9a-f]+$ child node names alongside the legacy
  usb-phy@[0-9a-f]+$.
- Mark the legacy ti,hwmods property as deprecated.
- Document required #address-cells, #size-cells, and ranges property
  missing from text binding.

> diff --git a/Documentation/devicetree/bindings/usb/ti,am33xx-usb.yaml b/D=
ocumentation/devicetree/bindings/usb/ti,am33xx-usb.yaml
> new file mode 100644
> index 0000000000000..889190431c9a0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/ti,am33xx-usb.yaml
> @@ -0,0 +1,104 @@

[ ... ]

> +  ti,hwmods:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: Name of the hwmod associated with the USB module.
> +    const: usb_otg_hs
> +    deprecated: true

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +  - ranges
> +  - "#address-cells"
> +  - "#size-cells"
> +  - ti,hwmods

[Severity: Medium]
Will this cause a validation conflict? The schema explicitly marks ti,hwmods
as deprecated but simultaneously mandates it in the required array.

Any device tree validating against this schema will emit warnings or errors:
omitting the property violates the required list, while including it trigge=
rs
the deprecated warning. This prevents the creation of cleanly validating
device trees.

[ ... ]

> +examples:
> +  - |
> +    usb@47400000 {
> +        compatible =3D "ti,am33xx-usb";

[ ... ]

> +        usb-phy@47401300 {
> +            compatible =3D "ti,am335x-usb-phy";
> +            reg =3D <0x47401300 0x100>;
> +            reg-names =3D "phy";
> +            ti,ctrl_mod =3D <&ctrl_mod>;

[Severity: Medium]
Does this reference an undefined label? The ctrl_mod label was dropped duri=
ng
the conversion. Referencing it here will cause dtc to fail with a Reference
to non-existent node or label error during make dt_binding_check.

> +            #phy-cells =3D <0>;
> +        };
> +
> +        usb@47401000 {
> +            compatible =3D "ti,musb-am33xx";
> +            reg =3D <0x47401400 0x400>,
> +                  <0x47401000 0x200>;
> +            reg-names =3D "mc", "control";
> +            interrupts =3D <18>;
> +            interrupt-names =3D "mc";
> +            dr_mode =3D "otg";
> +            mentor,multipoint =3D <1>;
> +            mentor,num-eps =3D <16>;
> +            mentor,ram-bits =3D <12>;
> +            mentor,power =3D <500>;
> +            phys =3D <&usb0_phy>;

[Severity: Medium]
Similarly, does this reference the undefined label usb0_phy? The label was
removed from the example, which will also result in a dtc compilation error
when building the example.

> +        };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818-ti-am33-us=
b-v1-0-69ac5f92df45@gmail.com?part=3D6
