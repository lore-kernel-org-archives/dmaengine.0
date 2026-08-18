Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DF537FF70;
	Tue, 18 Aug 2026 14:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787063751; cv=none; b=WMoAmUGvJuFCln0eTxlSyFw75G7Gnjydc9QDsu98ohb4jelfWEeu7Exq00LU3toPx6QAfxF8qc/af7REpBvwqwDlGCEntGtQvLIbcttygczcyE0xCKJqxeJAbYKEgsUPGM7DXb9jHGn1hBqJluN+kaBkR3JZJToFWVJXccyQ2VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787063751; c=relaxed/simple;
	bh=1rcjz9ODtWAA1RxHvn2Ov42kIOTHRR/N3GanX0R9dO4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mOfwu74r3S9AePSfGLRxJzOBoeXirG/CR/emKrhAFiERmX6Z5qfSQvrAOQURECyYGCH7nrSZivVfs+sWSHDbbjrpf5jSKGJJj8ZMVpS8GxogWDsohRG3fh6iEdYPYofHlwWbLJvAmuJHMxtqsPplCMFILHA1T+rsgC25h+Dt21s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=icRAha+G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="icRAha+G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 941D81F000E9;
	Tue, 18 Aug 2026 14:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787063750;
	bh=JB3LTQdUzexXJbGLFEoPVsFN3Sk3Yfq0VeSSpzHMggs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=icRAha+Gi55pC9f7y5416UaAT6IaQup9VLsBBexRgXIF8f0y9pi5M9MIPE1rqPvAi
	 Fj/HDikzsAdZhBoiu0+9rR2z3lJ66zMhHJ1T12g8PZqryv5WVunpmzx1PurwLv/k2h
	 4ysvs2wVoPo7x9jsJ75wVjm+EokTGSZ6GYyzCdYKJVECXVfPtn0KbkpSY81y6yUNgR
	 vFdTp+uCTb1J1enfJdkFXIbRD5ta2r8e/XpoXtPNCL4YadTuQa8ksA8luEf9FY7zBV
	 dSZbGI/lYxZ0s4OayfICmdBEk9XcCrnEowLWX/kGxzukeLpXvyLrWFp1GekrbYzktj
	 asP5ML/hYuabQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/7] dt-bindings: usb: ti,am33xx-usb: Convert to DT
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bhargav Joshi" <j.bhargav.u@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, linux-phy@lists.infradead.org, dmaengine@vger.kernel.org, conor+dt@kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260818-ti-am33-usb-v2-6-66fd44d66824@gmail.com>
References: <20260818-ti-am33-usb-v2-0-66fd44d66824@gmail.com>
 <20260818-ti-am33-usb-v2-6-66fd44d66824@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 14:35:49 +0000
Message-Id: <20260818143549.941D81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The YAML example contains unresolved phandle references (`&ctrl_mod=
` and `&usb0_phy`), which will cause `dt_binding_check` compilation to fail.
--

--- Patch [6]: [PATCH v2 6/7] dt-bindings: usb: ti,am33xx-usb: Convert to D=
T schema ---
commit e44cab46abc4f9978c722895c49e454a5ad807d6
Author: Bhargav Joshi <j.bhargav.u@gmail.com>

dt-bindings: usb: ti,am33xx-usb: Convert to DT schema

This commit converts the TI AM33xx USB Wrapper text binding to DT schema.
It drops the USB control module from child nodes, allows standard phy node
names alongside legacy ones, and deprecates the ti,hwmods property.

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
Will this cause a compilation failure during make dt_binding_check?

The example references the &ctrl_mod phandle here, but since the control
module node was removed from the child nodes during the conversion, this
reference appears to be undefined.

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
Does this also leave an undefined reference in the example?

The phys property references &usb0_phy, but the usb0_phy label was dropped
from the usb-phy@47401300 node in this example schema.

> +        };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818-ti-am33-us=
b-v2-0-66fd44d66824@gmail.com?part=3D6
