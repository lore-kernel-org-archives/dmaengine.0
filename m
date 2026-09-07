Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B0444B693;
	Mon,  7 Sep 2026 10:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788775986; cv=none; b=iNH62CfhMsQIK7uFbCVwQW3EaPzTMEC9ui1xQCFMGZoUKcc3ksBs5KrTen60kzSDL7rP2fCQskR7c86s9S3/TLG+HYF+p5ffkOyMp6ap56j5w4snyprEeH77P13qr1j9jstaTDn7ZaYODzN9EGkJ9hf9IkjX5uxWI2V0OtJE78Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788775986; c=relaxed/simple;
	bh=VsMSKs07jjQKNvHdEi5/wkWWKICK7387GxfRzBGmcvo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qTAhdPseHmqvYJh4JcdY8H1UvGO0PspTAFONAqS6NGJmP3RSNLF1jlQyCJ6ag709j8tK5WqAnutEPgZ8eBAEfx/zm8Hp0KDU/AWYGXMQIyz5wuaRA7EwfinUGGxY4Ig/XnNZ57c5z67jSs/O1tjzg42lkG2z4xH+ygG+kOGFgP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DlJ09Aky; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DlJ09Aky"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 368E71F00A3A;
	Mon,  7 Sep 2026 10:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788775984;
	bh=KtE9gVw4ID+iHUF+CyobAPmJSfBdaSw7uwc9ta7KkiU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DlJ09Akypb1ZkX+e1vjTptp4vMBeDlnGwoCoVhQp6a9mP70HRr4PLcU+7+4zpMAUF
	 9pr2AEQ165n/4o2l7xAfqQWvQeiahdEl/rXXwcdRdLqaBnQWILJkCnB1B06Cd6Y4tC
	 acOsDnn3gdNLD4Z5HksmODN1oPNlBOXMGkPi6mx8h4mm6G0RXqHeAIu1IBY6N9HOl1
	 Rc4KEBFVSqfKMa/40v1I4zAhjiqulN7jpN/DLM+blsKGXeZrmmzMK6yLWWFAXBPLdy
	 GjE8X9m34r0K6VNcPjg+fn3FF8kiw2QI85SEdlDlolJXASEHmqXZl31IvomPzNCSE4
	 Gt7+EMMNzTt1A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 08/10] riscv: dts: ultrarisc: Add initial device tree
 for UltraRISC DP1000
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jia Wang" <wangjia@ultrarisc.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260907-ultrarisc-dts-v2-8-5eb4c97477c5@ultrarisc.com>
References: <20260907-ultrarisc-dts-v2-0-5eb4c97477c5@ultrarisc.com>
 <20260907-ultrarisc-dts-v2-8-5eb4c97477c5@ultrarisc.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 10:13:03 +0000
Message-Id: <20260907101304.368E71F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The DMAC `reg` size is too small for the configured number of DMA =
channels, causing out-of-bounds memory accesses.
--

commit ef5ee935e58a066d2f6001b254b02cd3ebe039d4
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
> index 0000000000000..5c51fddaeb2bb
> --- /dev/null
> +++ b/arch/riscv/boot/dts/ultrarisc/dp1000.dtsi
[ ... ]
> +		dmac: dma-controller@39000000 {
> +			compatible =3D "ultrarisc,dp1000-axi-dma", "snps,axi-dma-1.01a";
> +			reg =3D <0x0 0x39000000 0x0 0x400>;
> +			clocks =3D <&clkc DP1000_CLK_SYSPLL_DIV2>,
> +				 <&clkc DP1000_CLK_SUBSYS>;
> +			clock-names =3D "core-clk", "cfgr-clk";
> +			#dma-cells =3D <1>;
> +			dma-channels =3D <8>;

[Severity: High]
Does this reg size limit of 0x400 provide enough space for 8 DMA channels?

The Synopsys DW AXI DMA IP driver (dw-axi-dmac-platform.c) maps channel
registers starting at chip->regs + 0x100 + i * 0x100. For 8 channels, the
maximum base offset is 0x800 (channel 7).

In axi_dma_hw_init(), the driver iterates over these channels and writes to
their registers (e.g., CH_INTSTATUS_ENA at offset 0x080, hitting offset
0x880). Since the reg property defines a window of only 0x400 bytes,
accesses for channels 3 through 7 will fall completely outside the declared
memory region, leading to out-of-bounds memory accesses.

> +			interrupt-parent =3D <&plic>;
> +			interrupts =3D <152>, <153>, <154>, <155>,
> +				     <156>, <157>, <158>, <159>;
> +			snps,dma-masters =3D <1>;
> +			snps,data-width =3D <4>;
> +			snps,block-size =3D <512 512 512 512 512 512 512 512>;
> +			snps,priority =3D <0 1 2 3 4 5 6 7>;
> +			snps,axi-max-burst-len =3D <256>;
> +		};
> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907-ultrarisc-=
dts-v2-0-5eb4c97477c5@ultrarisc.com?part=3D8
