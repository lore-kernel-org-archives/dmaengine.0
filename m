Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A366D38E5C5;
	Mon,  3 Aug 2026 11:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785757745; cv=none; b=LScmKxcjAVQ00eaJ3JzRg5S1CPE9vR9JEhL/E4Tt4bVyDNd8ZvWEzQRh48jsRsNzwxs8p1a21URfg8kb0KUWIUmSFbkkWICyf/vtF3Ou2u2SBpvUNA+Pz4age4oHU55ArctI9cjGY+2ho/qdep6ZeYGqybzWso/DZt2vNBG6rj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785757745; c=relaxed/simple;
	bh=qyolqh7f6KRNIbLf9tdd7+tpzpJU3N31mzBG55W/j44=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nvOVekARCr238am9svjlXE4Qyx+ebCgmPdy0VNqU5FFKgnNqiMhSNP/y1wXjowNEqM8ataXPeZR22QY08RbuoyAPNUIyY0tBSKFwwBn8iyVUp9SDa34sMiFzg0CHM1/CVVk1f2HqChIqItslLR7Q6Vxn4uiV/xfYwdSy0La6a1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AxnIc12M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AxnIc12M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A59751F00A3A;
	Mon,  3 Aug 2026 11:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785757744;
	bh=ZVztUxkNMNVWRcRuTWihqv1opv9N7dt9FCDyL9qjZ2I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AxnIc12MpBj6MT+alKHgOe/dDRjif+jGXi6GOpi046yFg6xwvBk01zAMhGesBmjRo
	 4uNQygF5McXySgduHoLMgjyuN9HxLmv/RBVocDNYkCi9QTBFkir8eyGmxNKsMWuatb
	 heTJuFw9d8zOpCHovPnTKBVnTO3ga1Fvy9Svyy+3OybKsJrtfraEB+e0J3MZjAuU+/
	 QraFlZ+7jpnQSj5mbzxQVUf1Eb0zrfyFDiVYKCwQTykaoenV6PwzQ8dcYnFXPdg5EZ
	 NnEyMtL9/uSwe6L6U9XawzJcVv2DiBYPFeChLEoHlWTOskLMkh1CSE2CDnVY1OOoal
	 0DpEwgAEm2NZQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v7 09/10] arm64: dts: qcom: shikra: Enable
 WiFi/BT on SoMs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Komal Bajaj" <komal.bajaj@oss.qualcomm.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260803-shikra-dt-m1-v7-9-7fec8e777076@oss.qualcomm.com>
References: <20260803-shikra-dt-m1-v7-0-7fec8e777076@oss.qualcomm.com>
 <20260803-shikra-dt-m1-v7-9-7fec8e777076@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 11:49:02 +0000
Message-Id: <20260803114903.A59751F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The 0.8V WiFi core voltage (VDD_CX_MX) and the 1.8V PMU IO voltage=
 (VDDIO) are incorrectly assigned to the same regulator on both SoMs, causi=
ng severe overvoltage or undervoltage.
- [Low] The device tree uses undocumented compatible strings 'qcom,wcn3988-=
bt' and 'qcom,wcn3988-pmu'.
--

--- Patch [9]: [PATCH RESEND v7 09/10] arm64: dts: qcom: shikra: Enable WiF=
i/BT on SoMs ---
commit 30ae129f7cfc5fecf1be133f1d9e0c8ef423f904
Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

arm64: dts: qcom: shikra: Enable WiFi/BT on SoMs

This patch enables WCN3988 WiFi and Bluetooth on Shikra SoM cards. It adds
the pmu, wifi, and bluetooth device tree nodes with their corresponding
regulator supplies and calibration data.

> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/bo=
ot/dts/qcom/shikra-cqm-som.dtsi
> index dc3861489f64d..2fff5fe9f6d2f 100644
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

[Severity: High]
Will this cause a severe undervoltage for the IO domain?

The vddio-supply typically requires 1.8V. However, it is assigned here to
pm4125_l7, which is also mapped to the 0.8V vdd-0.8-cx-mx-supply in the wifi
node later in this file.

> +		vddxo-supply =3D <&pm4125_l13>;
> +		vddrf-supply =3D <&pm4125_l10>;
> +		vddch0-supply =3D <&pm4125_l22>;
[ ... ]
> +&uart8 {
> +	status =3D "okay";
> +
> +	bluetooth {
> +		compatible =3D "qcom,wcn3988-bt";

[Severity: Low]
This isn't a bug, but are the qcom,wcn3988-bt and qcom,wcn3988-pmu
compatibles missing from the dt-bindings?

They do not appear to be documented in Documentation/devicetree/bindings/,
which might trigger device tree schema validation warnings.

> +		max-speed =3D <3200000>;
> +
> +		vddio-supply =3D <&vreg_pmu_io>;
[ ... ]
> diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi b/arch/arm64/bo=
ot/dts/qcom/shikra-iqs-som.dtsi
> index 73945bf42112d..657a14ca96067 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
[ ... ]
> +	wcn3988-pmu {
> +		compatible =3D "qcom,wcn3988-pmu";
> +
> +		pinctrl-0 =3D <&sw_ctrl_default>;
> +		pinctrl-names =3D "default";
> +
> +		swctrl-gpios =3D <&tlmm 88 GPIO_ACTIVE_HIGH>;
> +
> +		vddio-supply =3D <&pm8150_s4>;
> +		vddxo-supply =3D <&pm8150_l12>;
> +		vddrf-supply =3D <&pm8150_l8>;
[ ... ]
> +&wifi {
> +	vdd-0.8-cx-mx-supply =3D <&pm8150_s4>;

[Severity: High]
Could this cause hardware damage by overvolting the 0.8V WiFi core logic?

This maps the 0.8V vdd-0.8-cx-mx-supply to pm8150_s4. However, in the
wcn3988-pmu node above, pm8150_s4 is mapped to the 1.8V vddio-supply.

If pm8150_s4 has a physical minimum of 1.08V (as is common for this 1.8V
buck), will the regulator framework fail to set the 0.8V request,
leaving the 0.8V core rail subjected to over 35% overvoltage?

> +	vdd-1.8-xo-supply =3D <&vreg_pmu_xo>;
> +	vdd-1.3-rfa-supply =3D <&vreg_pmu_rf>;
> +	vdd-3.3-ch0-supply =3D <&vreg_pmu_ch0>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-shikra-dt-=
m1-v7-0-7fec8e777076@oss.qualcomm.com?part=3D9
