Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DDF3BB12B;
	Tue, 25 Aug 2026 06:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787638578; cv=none; b=bV/8kDIrOiExd3kb6+awfixZKHLFFpAtK3TjV2kwFb0O9lC73RTZjCuxfRXunmRsBc4GyqMQTzsNWh9X0q5FtH2jeSpPtXVOWHmqOQKqu9YFY7SpEPPCs/JCd0VQ3p3wF9U4xsXF5/pyvhGX7hwqZm0ro4plQFIk1+adNtgx5dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787638578; c=relaxed/simple;
	bh=pxjJ3dTMABlBTHsEZk8AXhUIlwidBt/+K26bVxvRBPc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=k9+POJUPlutXJIxKylJWlTMXTZktYeAdB7PWve/dj8rDmIYRqm+HopxxpxH6a9WewsQb8cHDgCqStEqa0kh3ZvlmpdBItNlq8fvcQTnNbO2H98N5mHw/MCP2XHewRNeHEemgJeYaJUxxDAI6aU9h6tRcTPWjq3uT0RKHSFlR7Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ew59n7Cj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ew59n7Cj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 610111F000E9;
	Tue, 25 Aug 2026 06:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787638576;
	bh=x3yKx0Dqta8cbDIYi/n8+Omu3SgNR24W6NstoMdG08g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ew59n7CjfT63zf8RObjidvHEdF8BxXSgeL6cAdUbf2a+Yu3HW5P4HGzcSShcfuHjX
	 V0H8RwRWUbDX84CbOcmVAfCYuDLJkv8eLEIGjvTai8vERJ1nLTb/LVmY2mC2/IT9D9
	 9X6WUd/sOz8PcDzxXdYb9qVu/20k4yUUbOTj9r7hZLXZ8qcx+mTTgRDybPP0ZwZCiH
	 k6FlqFb/s93b3JgSYxss3mlrSRF3mS9q6Q7ZaY++Fk1StAmB6kPGG8pa1khlclDMWH
	 Qz7u4zMwIdDDpkApQKDcNExxSUJfIvy6AqzK431m4gC6HC5kKeJPg8tD4uP0HXpWVy
	 ZqhzTOlaPUtzA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 12/12] riscv: dts: ultrarisc: Add Milk-V Titan board
 device tree
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jia Wang" <wangjia@ultrarisc.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260824-ultrarisc-dts-v1-12-61ab7aebe9e5@ultrarisc.com>
References: <20260824-ultrarisc-dts-v1-0-61ab7aebe9e5@ultrarisc.com>
 <20260824-ultrarisc-dts-v1-12-61ab7aebe9e5@ultrarisc.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 06:16:16 +0000
Message-Id: <20260825061616.610111F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The comment explaining the `phy-mode =3D "rgmii"` configuration =
contradicts how the Realtek RTL8211F PHY driver actually behaves.
- [Low] The Ethernet PHY node is named `phy@0` instead of the standard `eth=
ernet-phy@0`.
--

--- Patch [12]: [PATCH 12/12] riscv: dts: ultrarisc: Add Milk-V Titan board=
 device tree ---
commit 3f673472054f18222d34b30ffbabd903e6df950c
Author: Jia Wang <wangjia@ultrarisc.com>

riscv: dts: ultrarisc: Add Milk-V Titan board device tree

This commit adds the device tree for the Milk-V Titan, an ITX motherboard
based on the UltraRISC DP1000 SoC.

Link: https://milkv.io/docs/titan/overview

> diff --git a/arch/riscv/boot/dts/ultrarisc/dp1000-milkv-titan.dts b/arch/=
riscv/boot/dts/ultrarisc/dp1000-milkv-titan.dts
> new file mode 100644
> index 0000000000000..f1a0efee3d746
> --- /dev/null
> +++ b/arch/riscv/boot/dts/ultrarisc/dp1000-milkv-titan.dts

[ ... ]

> +&ethernet {
> +	phy-handle =3D <&phy0>;
> +	/*
> +	 * RTL8211F: board timing uses PHY strap delays; keep plain "rgmii".
> +	 * Enabling PHY internal delays via "rgmii-id" breaks Ethernet traffic.
> +	 */
> +	phy-mode =3D "rgmii";

[Severity: Medium]
Does this comment accurately describe how the Realtek RTL8211F PHY driver
handles "rgmii"?

Looking at rtl8211f_config_rgmii_delay() in
drivers/net/phy/realtek/realtek_main.c, configuring an RTL8211F PHY with
phy-mode =3D "rgmii" causes the driver to explicitly zero out the internal
TX and RX delay registers, overriding and disabling any hardware strap dela=
ys.

If the board functions correctly with "rgmii", it actually requires the PHY
delays to be disabled. Could the comment be updated to prevent confusion
about the hardware configuration?

> +
> +	status =3D "okay";
> +
> +	mdio {
> +		compatible =3D "snps,dwmac-mdio";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		phy0: phy@0 {
> +			reg =3D <0>;

[Severity: Low]
Does this node name correctly follow the devicetree bindings for ethernet
PHYs?

The node name phy@0 does not match the regex pattern required by the Ethern=
et
PHY DT binding (Documentation/devicetree/bindings/net/ethernet-phy.yaml).
The standard name is ethernet-phy@0.

Because the name does not match the expected pattern, the schema validation
is bypassed for this node and its subnodes when running make dtbs_check.

> +
> +			leds {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824-ultrarisc-=
dts-v1-0-61ab7aebe9e5@ultrarisc.com?part=3D12
