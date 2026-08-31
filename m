Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F4E403E9D;
	Mon, 31 Aug 2026 23:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788219173; cv=none; b=J+tarGwc1TiEg6e0l6smtfix4HOyrqQObOwvIkvFIGGTu400eT65VPvR2ocTP/DbrDbeFw7Py1KSsM1MZ+5ByBlyoxKQtq7fZmuheSkwlURlhnPdls0vVRN431dEphnHjdNC/jdnNj/uuvramvWaYE2SRQi2z1zCd0H+ggTww5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788219173; c=relaxed/simple;
	bh=D6DrfbFOOShi5sITIAxgLWU1D0f/iCnYzwk8l83UPPg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BuKO6IHiW0z74hYcVfbI7UeJP5V2sTOpZx7WTNpIW2iCdL7oQ9czjhPVuxVWFIzUuzRDvVVqPiwc0FbT7zB0LEapsIFQHUQGubQfFTN0UsbCgSzQzaCxJWX7tyZaIaEgDwu8vg4KAmOkRQFyDizRNQBQuhc6+aJWD7DV4IQpTMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P+hekDVx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P+hekDVx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06E641F000E9;
	Mon, 31 Aug 2026 23:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788219172;
	bh=lQyxYlmb3LjYZ3gRjJuagcil65+GbU2cuD9LmcjTRtw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P+hekDVxcLKFdPgHx4OKZrnIecF4XYOiwKr2OdzV93UqNpnub6cC68izBtmkXgc9X
	 6QqEWLdfu0HPpmT3n7wP3ztmcOAkIk5QVb/1P6DsDK148/SfILppapMVsYq0Yw9Q9Y
	 dMYzJsfEefBbtJypbJj1VjM7HldJ3r3iL4JPF1MVZLCX0vaISzCRXmM4y1tZxp5Y7A
	 K/ROu6YonQsYFljkMl/BFGuRYF/vRFC+tQAgTniLFYuGTlDFw8L57QFYSdkxb0KIjP
	 qJ6OABtsI6QSi0ICe9URZV0ScJK+YM3zgTZinGQTLT63/RdCKoOOd9AQUYfhpNe9Px
	 WhYtuZA6vXE8w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/6] dt-bindings: usb: ti,am33xx-usb: Convert to DT
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bhargav Joshi" <j.bhargav.u@gmail.com>
Cc: vkoul@kernel.org, olteanv@gmail.com, dmaengine@vger.kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, robh@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org, linux-phy@lists.infradead.org
In-Reply-To: <20260901-ti-am33-usb-v3-5-5e15c617d2e9@gmail.com>
References: <20260901-ti-am33-usb-v3-0-5e15c617d2e9@gmail.com>
 <20260901-ti-am33-usb-v3-5-5e15c617d2e9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 23:32:51 +0000
Message-Id: <20260831233252.06E641F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Undefined labels in the YAML example cause `dtc` compilation to fai=
l during `make dt_binding_check`.
--

commit 8b02af2c630db204aabbcbc1828484db912830c0
Author: Bhargav Joshi <j.bhargav.u@gmail.com>

dt-bindings: usb: ti,am33xx-usb: Convert to DT schema

This commit converts the TI AM33xx USB Wrapper text binding to DT schema.
It drops the USB control module from child nodes, allows standard phy child
node names, and marks the legacy ti,hwmods property as deprecated.

> diff --git a/Documentation/devicetree/bindings/usb/ti,am33xx-usb.yaml b/D=
ocumentation/devicetree/bindings/usb/ti,am33xx-usb.yaml
> new file mode 100644
> index 0000000000000..0b36b9ddfb4a9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/ti,am33xx-usb.yaml

[ ... ]

> +examples:
> +  - |
> +    usb@47400000 {
> +        compatible =3D "ti,am33xx-usb";
> +        reg =3D <0x47400000 0x1000>;
> +        ranges;
> +        #address-cells =3D <1>;
> +        #size-cells =3D <1>;
> +        ti,hwmods =3D "usb_otg_hs";
> +
> +        usb-phy@47401300 {
> +            compatible =3D "ti,am335x-usb-phy";
> +            reg =3D <0x47401300 0x100>;
> +            reg-names =3D "phy";
> +            ti,ctrl_mod =3D <&ctrl_mod>;

[Severity: Low]
Does this reference to ctrl_mod cause a build failure during dtc compilatio=
n?
The control module node and its label appear to have been removed from the
example during the text-to-YAML conversion, which may result in a fatal
"Reference to non-existent node or label" error when running make
dt_binding_check.

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

[Severity: Low]
Will dtc compilation fail on this phandle reference? The usb0_phy label
was removed from the usb-phy@47401300 node in the example above, meaning
this reference is undefined and may break make dt_binding_check.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-ti-am33-us=
b-v3-0-5e15c617d2e9@gmail.com?part=3D5
