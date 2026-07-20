Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD883F1AB6;
	Mon, 20 Jul 2026 11:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784545696; cv=none; b=AxYoB3WcxruxGkjokcpIDlmXxVV8c6+A+a7jgZIfZWSIMS+pdCsGN08nrCn8mgdCvHQTtbTYdwy7Lxog51eNS/O0QBUluieLffpqA8ulI5eS0ydh0GYhdMJ5EW0WoSAq7bH6hJKB4rQ9TQ21Ek1SHsGW6JTLAqvYukT+2TKpshE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784545696; c=relaxed/simple;
	bh=dnt6/L5j9tMqtoLXZhL9A/Hc9ZNAxr3ewJLt0gR/U4s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uKz1ByGqNXsyuG+MY9Jv06NHffrNMh3uoaSop6sHfwFIntTYTyOtdHzppUmqWUYMIMFhjRxDfdkt7R5CK1HFjxvnw2xL9BwuQPy3IoxBAN17lQiUSYWwAN2d7Hk7Pusu3YXN1Z5k2XfQpLx8/24aI8aoaDmIJgLRy/5Oc564gMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RhYLBt+a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RhYLBt+a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9686E1F00A3A;
	Mon, 20 Jul 2026 11:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784545695;
	bh=ExlZthhWGvV/SDgnkxWiy5XuWh/K89GN5X34clAnWuE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RhYLBt+a18JgI+ccNkAN9V7HEutlWP4A0il03p5Ntz8/WKEoHipeoHEsIJvScKnfE
	 +wNizgPGC0gyZJ6JDtfLSwcxdil+aeJl0Y27jCgBLCH9Z1TeeDgww/z5Px9bthJDWS
	 N2e4P6NIcSnK2pT2j1EhfCeX9ieht6HjrNjkxKW2P13Z6JF+httJl1qI/spIPqRQs5
	 cOjTqcvSEIIY09SJvjtab6uznSylvrNIC11I4gh8HaQex8VjiV4pL8j8c5H33WSy6i
	 +8xAH8nLH5odGftToS9IDj0RotpIwhJTnHuojt+uPV240TbV6rK4ft8uALH8gUKUi5
	 nr9XR9NuW8FeA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 07/10] arm64: dts: qcom: shikra: Enable TSENS and
 thermal zones
Reply-To: sashiko-reviews@lists.linux.dev
To: "Komal Bajaj" <komal.bajaj@oss.qualcomm.com>
Cc: dmaengine@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260720-shikra-dt-m1-v7-7-7dc99100c6dd@oss.qualcomm.com>
References: <20260720-shikra-dt-m1-v7-0-7dc99100c6dd@oss.qualcomm.com>
 <20260720-shikra-dt-m1-v7-7-7dc99100c6dd@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 11:08:13 +0000
Message-Id: <20260720110814.9686E1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] TSENS uplow interrupt must be routed through the MPM for thermal=
 wakeup from sleep.
--

--- Patch [7]: [PATCH v7 07/10] arm64: dts: qcom: shikra: Enable TSENS and =
thermal zones ---
commit 5c7a177e376df4af941332f06d373b391bca3a3d
Author: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

arm64: dts: qcom: shikra: Enable TSENS and thermal zones

This commit adds the TSENS node and thermal zones for the Shikra SoC.
It configures 14 thermal sensors distributed across the SoC, with hot and
maximum trip points defined at 110=C2=B0C and 115=C2=B0C.

> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/q=
com/shikra.dtsi
> index 12e4281f7b358..3abd0a686d0e2 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi

[ ... ]

> @@ -998,6 +999,18 @@ spmi_bus: spmi@1c40000 {
>  			qcom,ee =3D <0>;
>  		};
> =20
> +		tsens0: thermal-sensor@4411000 {
> +			compatible =3D "qcom,shikra-tsens", "qcom,tsens-v2";
> +			reg =3D <0x0 0x04411000 0x0 0x1000>,
> +			      <0x0 0x04410000 0x0 0x1000>;
> +			interrupts =3D <GIC_SPI 275 IRQ_TYPE_LEVEL_HIGH 0>,

[Severity: Medium]
Will this interrupt mapping prevent thermal wakeups from deep sleep?

The TSENS0 uplow interrupt is mapped directly to the GIC here. However, sin=
ce
shikra.dtsi configures the MPM to handle this interrupt on pin 2, does this
need to be routed through the MPM instead?

It seems this should be defined using:
interrupts-extended =3D <&mpm 2 IRQ_TYPE_LEVEL_HIGH>

If mapped directly to the GIC, if the system heats up while suspended, it
will not wake up at the configured thermal trip points to perform thermal
mitigation or a graceful shutdown. It would eventually rely on the abrupt
hardware reset at 120=C2=B0C.

> +				     <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH 0>;
> +			interrupt-names =3D "uplow",
> +					  "critical";
> +			#qcom,sensors =3D <14>;
> +			#thermal-sensor-cells =3D <1>;
> +		};
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720-shikra-dt-=
m1-v7-0-7dc99100c6dd@oss.qualcomm.com?part=3D7
