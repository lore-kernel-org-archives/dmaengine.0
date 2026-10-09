Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303A4320CD3;
	Fri,  9 Oct 2026 05:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791523708; cv=none; b=BLBbt/u59rRz643wQEVkDOA8AHYsUWmOXdjViylwcQQ7iAUoYM2Jt7u6qU8YjfouUdqvVs762t2iKIq5C4282zrxsytgZpxGRYH3Olrslt6uY3nAvvuuB7Y8WAu74vLxpOENNJUUivAzCcDLEa+MYpKCD5NN1ISy37UTL1A55qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791523708; c=relaxed/simple;
	bh=dCqN7IidVdyImq4DLhUQxTczFTHEL4WryjM85b6vbyk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=tzT2qgEPsxrQjoIpQwEHzkVR/1XgybzrFrms/D50Z4zrJo6uhvulc5TwFSvBbqxHlgBPYgeauOS1HPoCUa7pedjoP8ATFV7sBNPtMlMlexhl8X1+iFyPuKCFT0GR/5GwHfCgAIZ005cKoC2/gmGciNNb9SeBJzszjcLqi30eKVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZNzDS/cn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZNzDS/cn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0154F1F000FF;
	Fri,  9 Oct 2026 05:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791523699;
	bh=dDcyO267NDgzAaGcMH0/8G/Wxobc6CGnQvrCzZLTHgc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZNzDS/cnDL17cZfM96FnTISKJQmSDT+iZ9NeivcrOnBNKr2awWKAfTCJyDs/5v0vo
	 +x9o6GRciQLYoa58e5RavOyN2LJXzUxvQJUd2439fNypERkB0GIQVsgbWc3DyjqqtT
	 lnohpzxVlRNh13E30L+t/20Nany143UyztB97ugay807CpbatKcb4iJmwhpfW2Cc37
	 YzWW7ZXkf+lYxRc1hyHKIW4mCLWFSJnkPJk5d6IdVoy8EehmUdFDZwygM1k8w13alN
	 UxPa3pqZaDnwRoqOQbbezaSH0mEKT7t6g+vsyizRafWgsjCRP3n5yzxhUC+9+X/S3W
	 XZm4mHMJq04Gg==
Message-ID: <sashiko-outbox-164894@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/6] arm64: dts: cix: Describe the Sky1 DMA-350 bus
 integration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jelly Jia" <Jelly.Jia@cixtech.com>
Cc: Frank.Li@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20261009051846.1115962-7-Jelly.Jia@cixtech.com>
References: <20260907033404.596839-1-Jelly.Jia@cixtech.com>
 <20261009051846.1115962-1-Jelly.Jia@cixtech.com>
 <20261009051846.1115962-7-Jelly.Jia@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 05:28:18 +0000
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] dt_bindings: audss_cru syscon lacks 'syscon' compatible string, =
causing regmap lookup failure
- [Medium] dts: cix: invalid generic fallback compatible due to custom irq =
routing
- [Low] dt_bindings: bus node has unit address without reg or non-empty ran=
ges, triggering dtc warning
--

commit ba64255159af2e234a904fd8fbccd0e1066fbfb5
Author: Jelly Jia <Jelly.Jia@cixtech.com>

arm64: dts: cix: Describe the Sky1 DMA-350 bus integration

This commit describes the integration of the FCH and AUDSS DMA-350 controll=
ers
behind interconnect windows in the Sky1 devicetree. It introduces wrapper b=
us
nodes with identity ranges; and specific dma-ranges, and configures clocks,
interrupts, and reset lines for the DMA blocks.

> - The same shape is used in mainline: the Agilex5 DMA bus
>   (dma-bus@10db0000, a simple-bus with dma-ranges whose controller
>   carries "altr,agilex5-axi-dma", "snps,axi-dma-1.01a") and the Marvell
>   AC5 buses (bus@80500000 with "ranges;" and "dma-ranges", and
>   behind-32bit-controller@7f000000, whose only purpose is the DMA
>   mapping of the devices below it).

[Severity: Low]
Is this description accurate regarding mainline usage without a reg propert=
y?

The Marvell AC5 bus (bus@80500000) explicitly defines a reg property, and t=
he
Agilex5 bus (dma-bus@10db0000) has a non-empty ranges property.

> diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/=
sky1.dtsi
> index 0a820f45feb96..e3bd6c0e383fb 100644
> --- a/arch/arm64/boot/dts/cix/sky1.dtsi
> +++ b/arch/arm64/boot/dts/cix/sky1.dtsi
> @@ -518,18 +518,29 @@ iomuxc: pinctrl@4170000 {
[ ... ]
> +		bus@4190000 {
> +			compatible =3D "simple-bus";
> +			#address-cells =3D <2>;
> +			#size-cells =3D <2>;
> +			ranges;

[Severity: Low]
Does this node trigger a dtc warning for having a unit address without a re=
g or
non-empty ranges property?

Compiling the devicetree will generate the warning "node has a unit name, b=
ut
no reg or ranges property" for the wrapper buses. The dtc compiler specific=
ally
ignores empty ranges; properties (length 0) when evaluating the
unit_address_vs_reg check.

To fix this, the nodes must either omit the @4190000 suffix or add a dummy =
reg
property.

> +			dma-ranges =3D <0x0 0x040a0000 0x0 0x040b0000 0x0 0x00040000>,
> +				     <0x0 0x80000000 0x0 0x80000000 0x8 0x00000000>,
> +				     <0x80 0x00000000 0x80 0x00000000 0x80 0x00000000>;
> +
> +			fch_dmac: dma-controller@4190000 {
[ ... ]
> @@ -576,6 +587,37 @@ mbox_pm2ap: mailbox@65a0080 {
[ ... ]
> +		bus@7010000 {
> +			compatible =3D "simple-bus";
> +			#address-cells =3D <2>;
> +			#size-cells =3D <2>;
> +			ranges;

[Severity: Low]
Does this node also trigger a dtc warning for the same reason?  It uses a u=
nit
address with an empty ranges property and no reg property.

> +			dma-ranges =3D <0x0 0x20000000 0x0 0x07010000 0x0 0x00100000>,
> +				     <0x0 0x30000000 0x0 0xc0000000 0x0 0x20000000>;
> +
> +			audss_dmac: dma-controller@7010000 {
> +				compatible =3D "cix,sky1-dma350", "arm,dma-350";

[Severity: Medium]
Is the "arm,dma-350" generic fallback compatible valid here, given the cust=
om
IRQ routing below?

Devicetree rules dictate that a fallback compatible must only be used if the
generic driver can fully drive the hardware without vendor extensions. A ge=
neric
driver binding to "arm,dma-350" will ignore cix,irq-router, fail to ungate =
the
interrupts, and thus the hardware will be non-functional (e.g., interrupt
timeouts).

The custom routing should either be modeled using a standard interrupt-pare=
nt /
interrupt-map so the IRQ subsystem handles it transparently, or the generic
fallback compatible must be removed.

> +				reg =3D <0x0 0x07010000 0x0 0x10000>;
> +				clocks =3D <&audss_cru CLK_DMAC_AXI>;
> +				resets =3D <&audss_cru AUDSS_DMAC_SW_RST>;
> +				/*
> +				 * The AUDSS CRU gates each DMAC channel interrupt
> +				 * before it reaches the GIC. AUDSS_DMAC_INFO_AP_IRQ
> +				 * is at CRU offset 0x54.
> +				 */
> +				cix,irq-router =3D <&audss_cru>;

[Severity: Medium]
Will this syscon lookup fail because the audss_cru node below lacks the
"syscon" compatible string?

The DMA controller references the CRU via cix,irq-router =3D <&audss_cru>;.=
 The
DMA driver resolves this using syscon_regmap_lookup_by_phandle(), which rel=
ies
on syscon_node_to_regmap().

This core function only instantiates a regmap if
of_device_is_compatible(np, "syscon") is true. Occurs unconditionally on de=
vice
boot: the audss_dmac DMA controller will fail to probe, receiving -EPROBE_D=
EFER
indefinitely.

> +				interrupts =3D <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH 0>,
[ ... ]
> +		audss_cru: clock-controller@7110000 {
> +			compatible =3D "cix,sky1-audss-cru";

[Severity: Medium]
Can the "syscon" compatible string be added here?

Because audss_cru only has compatible =3D "cix,sky1-audss-cru"; and omits t=
he
standard "syscon" fallback compatible, the regmap lookup will fail.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009051846.1115=
962-1-Jelly.Jia@cixtech.com?part=3D6
