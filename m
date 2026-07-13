Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010194499A4;
	Mon, 13 Jul 2026 19:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783972285; cv=none; b=L8Bc8sPIOIb1KKvW8LT1S1WPsjOZtJ60OP1o3VNLOAt2wQYNkZDByq095vFGRGFpLHSCmWVYlOJPOjviyjnEVJ5509CUyjLhQVadevb4gGpeCOjf4EMj/bLbBtoxljK9dKUSU1rI+Sr7E3ocAOZbhZauMizEx6+JbtU4uWjVjDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783972285; c=relaxed/simple;
	bh=Y8+GDZyMybUJbw7FH4Rl0oXu6IQttcfQWnsiLRO6ZiE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XKQNNt8rtgmerKjwBdSLfhqhDxLfFDYIer2rCvgdDlRYkZ20EelnzTAOc5+0cuNS9BTihIgcY+cIW0eOb2MDWYY+EW69YEtVJ7FvPVH+68S73KU5PZ15kEUZhRbC4TRMUWF4IQMohX1KfU36CWI6jTbRNwHG4B7Qd1i3cvC7+ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P6B7gS95; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P6B7gS95"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 271331F000E9;
	Mon, 13 Jul 2026 19:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783972283;
	bh=BTht70AoKaaPnZMR/5PdA+uv/53nI9ziV1QMOvPtFeY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P6B7gS95BvJMnJvHCcOHQoJl7/sE4stWJ488Owdt8PS+DqQAMQ3Ph5GZLDjyRHlBM
	 hXV6/AdhuYEhWw1mrwUNsl+9H2YuYFYp7qAzAMsrDLguHzbV7uTlQ+4oymbxKbkXM+
	 h/eH4hNsDNDTGCjrgBwl0kDfD8+xuCzx2hEa7A/fSGU63wuj7cPj9rejSOnDIahfo0
	 HDMlcufg4Anc+PtoNC1/xEFfkJmxcts2uq7vwv1Xh30yT1KibAR19CXQ4WBO+MwDkS
	 MtO3/V1orHN6epQ29PiqLU94V7SwqleJhTHgG+hs5YleKyUSuf4kxIMOoPCFtfdZja
	 YiaUPh4uO1Pgw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 02/11] arm64: dts: qcom: Add QUPv3 configuration for
 Shikra
Reply-To: sashiko-reviews@lists.linux.dev
To: "Komal Bajaj" <komal.bajaj@oss.qualcomm.com>
Cc: robh@kernel.org, Frank.Li@kernel.org, vkoul@kernel.org, conor+dt@kernel.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260714-shikra-dt-m1-v6-2-bee265d3499b@oss.qualcomm.com>
References: <20260714-shikra-dt-m1-v6-0-bee265d3499b@oss.qualcomm.com>
 <20260714-shikra-dt-m1-v6-2-bee265d3499b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 19:51:22 +0000
Message-Id: <20260713195123.271331F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing `interrupts` property for the `uart0` (qcom,geni-debug-uar=
t) node.
- [Medium] The wakeup interrupt for uart2 on the RX pin (GPIO 9) is configu=
red as IRQ_TYPE_LEVEL_HIGH instead of IRQ_TYPE_EDGE_FALLING.
--

--- Patch [2]: [PATCH v6 02/11] arm64: dts: qcom: Add QUPv3 configuration f=
or Shikra ---
commit 1c9c89a1544a0e5440dc4a0a7e665dfb65d85dc8
Author: Xueyao An <xueyao.an@oss.qualcomm.com>

arm64: dts: qcom: Add QUPv3 configuration for Shikra

This commit adds device tree support for QUPv3 serial engine protocols on
the Qualcomm Shikra platform. It defines 10 QUP serial engines under a sing=
le
wrapper, with support for GPI DMA engines.

> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/q=
com/shikra.dtsi
> index 4e5bc9e17c8ed..f0fb55b9deb90 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
[ ... ]
> @@ -613,10 +896,75 @@ qupv3_0: geniqup@4ac0000 {
[ ... ]
>  			uart0: serial@4a80000 {
>  				compatible =3D "qcom,geni-debug-uart";
>  				reg =3D <0x0 0x04a80000 0x0 0x4000>;

[Severity: High]
Does this node need an interrupts property? The qcom,geni-debug-uart binding
requires it, and qcom_geni_serial will fail to probe if it's missing (it ca=
lls
platform_get_irq(pdev, 0)). Since it shares SE0 with i2c0 and spi0, should
this be <GIC_SPI 527 IRQ_TYPE_LEVEL_HIGH 0>?

[ ... ]
> @@ -638,6 +986,609 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
[ ... ]
> +			uart2: serial@4a88000 {
> +				compatible =3D "qcom,geni-uart";
> +				reg =3D <0x0 0x04a88000 0x0 0x4000>;
> +
> +				interrupts-extended =3D <&intc GIC_SPI 529 IRQ_TYPE_LEVEL_HIGH 0>,
> +						      <&tlmm 9 IRQ_TYPE_LEVEL_HIGH>;

[Severity: Medium]
Is IRQ_TYPE_LEVEL_HIGH correct for the tlmm 9 wakeup interrupt? UART RX lin=
es
idle HIGH and transition LOW on the start bit. Using a level high trigger
could cause an interrupt storm when the line is idle, or prevent low-power
states. Should this be IRQ_TYPE_EDGE_FALLING instead?

> +
> +				clocks =3D <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
> +				clock-names =3D "se";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714-shikra-dt-=
m1-v6-0-bee265d3499b@oss.qualcomm.com?part=3D2
