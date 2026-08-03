Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E60341062;
	Mon,  3 Aug 2026 11:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785757612; cv=none; b=d5UnvaZyqFZJDa52DTYPhzb3N6aGLJ2Dp46gG02/Tzbh3p2ArcIguxPTBYeirC+K4EOZF3RzVDIOyEpXyF8jsSTXzSI9SYe8im+VEVHuUdau4UNOIZolc0QyHTofph6908G0zXah+/xWuNNSEh2lbue9x/Xq/98Mw2ZkeZ2H1/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785757612; c=relaxed/simple;
	bh=6bcT2EVhP5fqnMrfN66dKJfnkbuNDydY0wRGvNBMisQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=B5BSlSbiVf/bs2jwgKpTXiM8M7XiixYl5ZD95+10BBkHIKYa9gCVmqAExQ3xSs4dgvaK6kdkrBnYmHv8N1T8PHT0tTHQ9R2AdYl6Rhfzq/R/WegccbxjIqEHTcaE4HqIym9m2+a1RYKZGlOmu1vd1D2XDmuAqMmtnnYfl5DM+K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ecB+DFzq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ecB+DFzq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27C311F00A3F;
	Mon,  3 Aug 2026 11:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785757610;
	bh=OFuTX5qn5Wz5lmlLuFwGH6+S1+vKHWO/bLV/HTkJjh4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ecB+DFzqkKzITg3cGweUymUcc+qFF4MIh9cLx+L4CZZRsKgCzxaxxqg3zfw9fzJPz
	 TATEIBchyNUS/Wlh0f96LsBsftRfn9YCV1qB32Qfj4JafD68uNvWj45WXSI5J3z7f4
	 n1qxQILwNwz+/VaPjGxPfJZhdYAn1CBb+rb6nbE8lFH4m8Y5xXTkHSE8TDOO3iwaFV
	 B3wTYHpxEVGlQIlvtMoXYzE+5KoELdSEyH2zcuTq6LztEsRqupFWUt8e7CD7/KT8va
	 PiOJ5lx72Ff/oNfl7kFnwnBmE5wLl3XxL4F4oF2R1s1hcNGW3HC/IWq44Z7Ja4QwNe
	 0qS+h8OI4/U9w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v7 05/10] arm64: dts: qcom: shikra: Add CDSP,
 LPAICP, MPSS remoteproc PAS nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Komal Bajaj" <komal.bajaj@oss.qualcomm.com>
Cc: robh@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260803-shikra-dt-m1-v7-5-7fec8e777076@oss.qualcomm.com>
References: <20260803-shikra-dt-m1-v7-0-7fec8e777076@oss.qualcomm.com>
 <20260803-shikra-dt-m1-v7-5-7fec8e777076@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 11:46:49 +0000
Message-Id: <20260803114650.27C311F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] Both `remoteproc_mpss` and `remoteproc_cdsp` incorrectly use `MA=
STER_AMPSS_M0` (the Application Processor) as the source master for their i=
nterconnect paths.
- [Low] The `remoteproc_lpaicp` node configures its `smp2p_in` interrupts w=
ith `IRQ_TYPE_NONE` instead of `IRQ_TYPE_EDGE_RISING`.
- [Low] The `power-domains` property for `remoteproc_mpss` and `remoteproc_=
cdsp` uses the undefined macro `RPMHPD_CX`.
--

--- Patch [5]: [PATCH RESEND v7 05/10] arm64: dts: qcom: shikra: Add CDSP, =
LPAICP, MPSS remoteproc PAS nodes ---
commit d887c029e52194e73c0d6673eaad6485dc1a7361
Author: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

arm64: dts: qcom: shikra: Add CDSP, LPAICP, MPSS remoteproc PAS nodes
   =20
Add nodes for remoteproc PAS loader for CDSP, LPAICP, MPSS subsystem.

> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/q=
com/shikra.dtsi
> index 42a17ffc040f8..570505c927bb3 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -1813,6 +1813,170 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
>  			};
>  		};
> =20
> +		remoteproc_mpss: remoteproc@6080000 {
[ ... ]
> +			clocks =3D <&rpmcc RPM_SMD_XO_CLK_SRC>;
> +			clock-names =3D "xo";
> +
> +			interconnects =3D <&mem_noc MASTER_AMPSS_M0 RPM_ALWAYS_TAG
> +					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;

[Severity: Medium]
Does this interconnect path incorrectly use the CPU's master endpoint for t=
he
modem DSP?=20

Voting for bandwidth using MASTER_AMPSS_M0 inflates the CPU's memory bandwi=
dth
requirements and fails to configure the actual hardware path the DSP uses to
access memory.

> +
> +			power-domains =3D <&rpmpd RPMHPD_CX>;

[Severity: Low]
Is this the correct macro for the older SMD RPM power controller?=20

It looks like RPMHPD_CX belongs to the RPMh header, which causes a dtc
compilation syntax error when left unresolved by the preprocessor.

> +
> +			memory-region =3D <&mpss_wlan_mem>;
[ ... ]
> +		remoteproc_cdsp: remoteproc@b300000 {
[ ... ]
> +			clocks =3D <&rpmcc RPM_SMD_XO_CLK_SRC>;
> +			clock-names =3D "xo";
> +
> +			interconnects =3D <&mem_noc MASTER_AMPSS_M0 RPM_ALWAYS_TAG
> +					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;

[Severity: Medium]
Should this interconnect path use the compute DSP hardware path instead of =
the
application processor master (MASTER_AMPSS_M0)?

> +
> +			power-domains =3D <&rpmpd RPMHPD_CX>;

[Severity: Low]
Is it intentional to use the unresolved RPMHPD_CX macro here?=20

This produces a build error because it belongs to the unincluded RPMh header
rather than the older SMD RPM bindings.

> +
> +			memory-region =3D <&cdsp_mem>;
[ ... ]
> +		remoteproc_lpaicp: remoteproc@b800000 {
> +			compatible =3D "qcom,shikra-lpaicp-pas";
> +			reg =3D <0x0 0x0b800000 0x0 0x200000>;
> +
> +			interrupts-extended =3D <&intc GIC_SPI 257 IRQ_TYPE_EDGE_RISING 0>,
> +					      <&lmcu_smp2p_in 0 IRQ_TYPE_NONE>,
> +					      <&lmcu_smp2p_in 1 IRQ_TYPE_NONE>,
> +					      <&lmcu_smp2p_in 2 IRQ_TYPE_NONE>,
> +					      <&lmcu_smp2p_in 3 IRQ_TYPE_NONE>;

[Severity: Low]
Does this configuration incorrectly define the trigger type for the SMP2P
interrupts?=20

The smp2p inbound interrupts represent software-triggered edges, so using
IRQ_TYPE_NONE instead of an edge trigger violates the binding expectations.
Even though the driver happens to mask the failure by explicitly passing
IRQF_TRIGGER_RISING, the Device Tree configuration appears factually
incorrect.

> +
> +			interrupt-names =3D "wdog",
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-shikra-dt-=
m1-v7-0-7fec8e777076@oss.qualcomm.com?part=3D5
