Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA763AA19B;
	Tue, 25 Aug 2026 06:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787638576; cv=none; b=m4GLnFMLtTk5A/BbgMu4MrW/6mi8b7KBjhJ9xaBf6mJROWlI+frtKxf/Tal+Gx3NquqUeTq6oCmR3/3GlubIopIH9+qxGxoVL3CKgtZTYxHs05TJLyiX9Tp/6xhsES6fgaXdca4udlszh41b+jYN550TyrdwmA/SCTKjYd6boE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787638576; c=relaxed/simple;
	bh=oQNt/785+fnKRsRc9YXHaiTbd1VGvmrG4Bdj8jPRH4c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XCAe31tBlYp3aZyDKJ4JfJZAamvcQE5GfWRHj8cfVC4M0NbISM3XxwJ6XEw0gVv5/27hb5NlP+2p9mBy/gSWI+yWS/VJ3ubPi29AV+lcqfbt/6c+HKP8S7q4DXYqJyXd2so9lw/5ivZyje3OWBnx8k7W7Fq1NPYxSSyXPKgC5no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I/CdZjko; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I/CdZjko"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D3691F00A3A;
	Tue, 25 Aug 2026 06:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787638575;
	bh=vDpmy+dZgikZnS6rinlz8UfiI2aV9fGb3cEZ7vwr9Tg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=I/CdZjko9Fdof7wGXfGoP/SnIPxhMJ4XjlO1SPKfJzDtfqze/krQVSpmdbm8l/DNa
	 gaVxMvFy6l9NDCMyfdjOlO61+HJ8098ZBz42JAXiBVoxaIkBrLHggZxhPfhGrEKFdD
	 ElgG1R1oz4/YoATqiJ15iek5jacR3DJrJkSZ0AYUq5m1FxqqKY5IxdSoxFz6VVFQvk
	 jluDPgsah13MdZzcOuAJu/tpD4375JfOMQGPD0VoNWnOctZaGqDQ30/mADNTp4+c0B
	 4F0UrJbuFfk661fbc0JIIFOelIgTXdKUvPAHTA/l8g9LugdzZHkESrEox/QUJKXAlR
	 V6CqlB2FR3zcA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 10/12] riscv: dts: ultrarisc: Add initial device tree
 for UltraRISC DP1000
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jia Wang" <wangjia@ultrarisc.com>
Cc: devicetree@vger.kernel.org, dmaengine@vger.kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, robh@kernel.org, vkoul@kernel.org
In-Reply-To: <20260824-ultrarisc-dts-v1-10-61ab7aebe9e5@ultrarisc.com>
References: <20260824-ultrarisc-dts-v1-0-61ab7aebe9e5@ultrarisc.com>
 <20260824-ultrarisc-dts-v1-10-61ab7aebe9e5@ultrarisc.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 06:16:14 +0000
Message-Id: <20260825061614.8D3691F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing clock header and device tree binding for the clock controll=
er.
--

--- Patch [10]: [PATCH 10/12] riscv: dts: ultrarisc: Add initial device tre=
e for UltraRISC DP1000 ---
commit 5358a00c38b708f59bdaeb5f8358a7078053a24a
Author: Jia Wang <wangjia@ultrarisc.com>

riscv: dts: ultrarisc: Add initial device tree for UltraRISC DP1000
   =20
Add the base device tree for the UltraRISC DP1000 SoC. It describes
eight CP100 CPU cores, their cache topology, and essential peripherals
including CLINT, PLIC, the clock controller, pinctrl, GPIO, UART, SPI,
I2C, PCIe, GMAC, and the DMA controller.

> diff --git a/arch/riscv/boot/dts/ultrarisc/dp1000.dtsi b/arch/riscv/boot/=
dts/ultrarisc/dp1000.dtsi
> new file mode 100644
> index 0000000000000..470ab01e33b8a
> --- /dev/null
> +++ b/arch/riscv/boot/dts/ultrarisc/dp1000.dtsi
> @@ -0,0 +1,899 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright(C) 2026 UltraRISC Technology (Shanghai) Co., Ltd.
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/clock/ultrarisc,dp1000-clk.h>

[Severity: Low]
Does this header exist in the tree or this patch series?

Without this header file, compiling the device tree using make dtbs will
result in a preprocessor build failure.

[ ... ]

> +		clkc: clock-controller@11080000 {
> +			compatible =3D "ultrarisc,dp1000-clk";

[Severity: Low]
Is there a corresponding YAML binding schema for this compatible string?

Validating the device tree using make dtbs_check will fail due to the missi=
ng
schema for the clock controller.

> +			reg =3D <0x0 0x11080000 0x0 0x1000>;
> +			clocks =3D <&osc_24m>;
> +			#clock-cells =3D <1>;
> +		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824-ultrarisc-=
dts-v1-0-61ab7aebe9e5@ultrarisc.com?part=3D10
