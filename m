Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DB92F8EB3;
	Mon, 20 Jul 2026 11:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784546157; cv=none; b=SoiWzUK1ybP4KatFBPLCgaNto8IThx8717M+U+x3xFqiDMHZfodYvrXuAq295NS/R8j8RtDDfjbEVoFYQBlD+3kkiDi0HHeR+xf0/VamAgNJdG8P98olvwOIPb/IBNPYtt95pr+BDgnSg2b6xUyPlu/C45IpmXpiF73hIyKrHto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784546157; c=relaxed/simple;
	bh=GZ3VB5I5eMMIydP29/PWeT1/RYr4dL61VhWBRzmh02I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XsVztbzMadO7x+2uiMMBI9YSRtEe7+266hwx+ONeIt9YO/7EctaPN6qDtgg5bI2DnaaLtUTwPNj6ebTyR2VLqVXiVjY12Zn5BIsddOk3DH/xCsBDBdqmK5fYv0CJ0A6o3tl9ETVL2BERNOhS4njAW9GyoYYcDy+3XskzoKbdOhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oem5/H7h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oem5/H7h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59EC41F000E9;
	Mon, 20 Jul 2026 11:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784546155;
	bh=Ad6SwdNjmGQvzXrdo/oooGPabPjdb9xNcJcB2l6JIb4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Oem5/H7hM99C7OHyDAAedAHkHnjWWJGs5+T9MxBUJ4Rg1o3QUN9dQUS/gETm5dO0V
	 3Ys+BKrBIdga9/tCtKdCqPCsqaxCm0r/QLAQ97kedPbK/DpBicpRIsTNseq6U0bHtj
	 j5HRF5A0gRHWggRfP9W9DgCVnZCrajKuZ2aU0dbwtS95bJcONhqHvfAkQ9BL9puQW6
	 HmCTWo0CdKX7DfwSUn57vhrfDB+ImPkBu/aQP5UFr3WrPp+b4bUy8mdBr3QdhUCvQh
	 2Dle6fCwdlV6huW9LNYBSXGfZ11FJZNyyr8coWhvQ47eTIAx2bPpU2CNmu/DeVAtMb
	 SNbvTxsUFY+Ow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 09/10] arm64: dts: qcom: shikra: Enable WiFi/BT on
 SoMs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Komal Bajaj" <komal.bajaj@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260720-shikra-dt-m1-v7-9-7dc99100c6dd@oss.qualcomm.com>
References: <20260720-shikra-dt-m1-v7-0-7dc99100c6dd@oss.qualcomm.com>
 <20260720-shikra-dt-m1-v7-9-7dc99100c6dd@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 11:15:54 +0000
Message-Id: <20260720111555.59EC41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] Incorrect voltage regulators are assigned to the WCN3988 PMU `=
vddio-supply` and WiFi `vdd-0.8-cx-mx-supply` rails, leading to severe unde=
r- and over-voltage risks.
--

--- Patch [9]: [PATCH v7 09/10] arm64: dts: qcom: shikra: Enable WiFi/BT on=
 SoMs ---
commit 7b0dbc06276bce121a4707dc81431f18358503c8
Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

arm64: dts: qcom: shikra: Enable WiFi/BT on SoMs

Shikra SoM cards include WCN3988 WiFi/Bluetooth chip, with supplies provided
by on-card PMICs. Enable both interfaces and provide the required supply and
calibration data.

> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/bo=
ot/dts/qcom/shikra-cqm-som.dtsi
> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi

[ ... ]

> @@ -27,6 +31,42 @@ key-volume-up {
>  			linux,can-disable;
>  		};
>  	};
> +
> +	wcn3988-pmu {
> +		compatible =3D "qcom,wcn3988-pmu";
> +
> +		pinctrl-0 =3D <&sw_ctrl_default>;
> +		pinctrl-names =3D "default";
> +
> +		swctrl-gpios =3D <&tlmm 88 GPIO_ACTIVE_HIGH>;
> +
> +		vddio-supply =3D <&pm4125_l7>;

[Severity: Critical]
Does this code assign a 0.664V regulator to a 1.8V supply in wcn3988-pmu?

The WCN3988 PMU's vddio-supply expects 1.8V, but pm4125_l7 is typically 0.6=
64V.
Could this regression cause an undervoltage that prevents digital I/O
communication?

> +		vddxo-supply =3D <&pm4125_l13>;
> +		vddrf-supply =3D <&pm4125_l10>;

[ ... ]

> diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi b/arch/arm64/bo=
ot/dts/qcom/shikra-iqs-som.dtsi
> --- a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi

[ ... ]

> +&wifi {
> +	vdd-0.8-cx-mx-supply =3D <&pm8150_s4>;

[Severity: Critical]
Does this assignment cause an overvoltage regression in the wifi node?

The vdd-0.8-cx-mx-supply requires ~0.8V, but pm8150_s4 has a 1.08V to 2.04V
range (typically 1.8V), which could lead to hardware damage on the IQS SoM.

> +	vdd-1.8-xo-supply =3D <&vreg_pmu_xo>;
> +	vdd-1.3-rfa-supply =3D <&vreg_pmu_rf>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720-shikra-dt-=
m1-v7-0-7dc99100c6dd@oss.qualcomm.com?part=3D9
