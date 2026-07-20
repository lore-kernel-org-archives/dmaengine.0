Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072EB3537D0;
	Mon, 20 Jul 2026 11:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784547679; cv=none; b=GVlyQy9iQuIhrsnUj+ok4aWGkyGRVWkR1eH0PloCbzi93/paBSo28UqG961h6Z9kf1uU0Smdcdd8QpQY+vI4y2cNqI7mFun//fsP8sIeebQ7MEolqmIcYBqKeqc+B/oAahNIBAVIVoXENEPCgvrLrF52MhZxvI3Hd520UoCT7J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784547679; c=relaxed/simple;
	bh=+sE86A1JmBIk3TLzHviuN6VKlUUkzvCSYo24T7G/3tI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Qjt7YFkzjnYgL70Jwqk93Bsmk7yOYZEASHEw1/IXWxO/xWZgkL52cj2Gjmw7NxmLK5PCZl1AugZLrMeIQ91aP+LPVpXlxP6yQ/j1isqVhM3FCFceAsEqPJPauCrjHYjhTveg5Sk6LQFJg8T7wuKwTmHMgJ6tiIVJggX8O0C9gJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B/xlF9M8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B/xlF9M8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 295081F00A3E;
	Mon, 20 Jul 2026 11:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784547675;
	bh=vMxmsDFkaDi84bNrmHAUIWOgXegHAb7SFrIiJqs6gNw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B/xlF9M86LaB0/Rciksnq7vTFKlmNZF9Y1clS5s4hyBNJTcQMc9/CBQjtrkF5Wu2m
	 1Ehh+0VkSN8FpuMXmss8BSk4ehnds9b4VdRByBNOEVDsa08hxngQqpuog0eHmOhFnQ
	 gjnf1XoREgH7S0HCGIHqooOeLJZOIUtKWUs7peLdpg02UQXA/I16AqZM8nBhLQMuUa
	 zS5JZY9F8pToem563vniVeVoBG8H6LEl42wU2lMa0hzNCEEwvzYZzc/YcxgYJ/Xy+4
	 hlpDQ7iqERTCaoi7+A+msOJxAXE/LEQNfZzkq9N1ZweRqqnqj6UwC9Ufzuvl5YYJwf
	 k3QN9XX3Rs8MA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 05/10] arm64: dts: qcom: shikra: Add CDSP, LPAICP,
 MPSS remoteproc PAS nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Komal Bajaj" <komal.bajaj@oss.qualcomm.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, vkoul@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260720-shikra-dt-m1-v7-5-7dc99100c6dd@oss.qualcomm.com>
References: <20260720-shikra-dt-m1-v7-0-7dc99100c6dd@oss.qualcomm.com>
 <20260720-shikra-dt-m1-v7-5-7dc99100c6dd@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 11:41:14 +0000
Message-Id: <20260720114115.295081F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] Incorrect IRQ type `IRQ_TYPE_NONE` specified for SMP2P interrupts i=
n `remoteproc_lpaicp` node.
- [Low] Semantic API Violation: Usage of RPMh macro `RPMHPD_CX` with an RPM=
 SMD power controller (`rpmpd`).
--

--- Patch [5]: [PATCH v7 05/10] arm64: dts: qcom: shikra: Add CDSP, LPAICP,=
 MPSS remoteproc PAS nodes ---
commit 65c0930ecad74d3ed9ab1c696c97ce9cf5c374b0
Author: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

arm64: dts: qcom: shikra: Add CDSP, LPAICP, MPSS remoteproc PAS nodes
   =20
Add nodes for remoteproc PAS loader for CDSP, LPAICP, MPSS subsystem.

> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/q=
com/shikra.dtsi
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
[ ... ]
> @@ -1813,6 +1813,170 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
>  			};
>  		};
> =20
> +		remoteproc_mpss: remoteproc@6080000 {
> +			compatible =3D "qcom,shikra-mpss-pas";
> +			reg =3D <0x0 0x06080000 0x0 0x100>;
[ ... ]
> +			power-domains =3D <&rpmpd RPMHPD_CX>;

[Severity: Low]
Is this using the correct power domain macro? The Shikra SoC uses an RPM SM=
D=20
power controller (rpmpd), not RPMh, so shouldn't this be RPMPD_VDDCX instea=
d of
RPMHPD_CX?

> +
> +			memory-region =3D <&mpss_wlan_mem>;
[ ... ]
> +		remoteproc_cdsp: remoteproc@b300000 {
> +			compatible =3D "qcom,shikra-cdsp-pas";
> +			reg =3D <0x0 0x0b300000 0x0 0x100000>;
[ ... ]
> +			power-domains =3D <&rpmpd RPMHPD_CX>;

[Severity: Low]
Similar to the remoteproc_mpss node, shouldn't this use RPMPD_VDDCX instead=
 of
the RPMh macro RPMHPD_CX?

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
Are these lmcu_smp2p_in interrupts correctly defined as IRQ_TYPE_NONE? The=
=20
hardware SMP2P interrupts are edge-triggered, so should these be specified =
as=20
IRQ_TYPE_EDGE_RISING instead?

> +
> +			interrupt-names =3D "wdog",
> +					  "fatal",
> +					  "ready",
> +					  "handover",
> +					  "stop-ack";
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720-shikra-dt-=
m1-v7-0-7dc99100c6dd@oss.qualcomm.com?part=3D5
