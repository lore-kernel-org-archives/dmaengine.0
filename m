Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793611373;
	b=YJEWfc5bhwSfBDnE9L2A+Xqj4xMctBwSK4YtnVkqB57gycBTnfDfdtr4+2GQk5kix+wd
	 EIo5t8syhmPJbIZdNnwJkPIwaq9L0wedzcTyL6yRqhNMXik7VBpal0LIo0ON4HkuvicAi
	 8Altb+8i/vACqW09dt1+mNZ0UGybUW6Bg2PyHGFry68CkRz9SXMvx/NnXPheGRizGACBJ
	 1t4C/iilY+Xp++zG7wYv7LGrLYbGZvjdhU04Rg9LUpi7hiUQvSCEuLV2uRrALlh4sTMQp
	 g7NWrrA1DSsPLyfvXxgEMasPchQkV6PRhGWxZkf3h1KWxDz8D7AQ9gqJKqRfV8QwVoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793611373;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wupSt6qcV7DAB2KtSUf+pY3nETPzBO/lM5NPw/qkjhc=;
	b=SbBkK7gSod+NxbPXelLe5biZpXwaBHGXIavGd9Rdvs53vqNW9D8XtYIwcEyYbXfquzbA
	 MI2m6SsLSG2fna5tbSRU2hlLyXzb2b1kJ3Dx1hGwpI0vN4CuxebIR50qgjCm6jHCgg7TU
	 /FSiieEuIFQZoBJsWE5k3fIyXjQKsUmKZEpLITys0glyHch2sW4C8XKVEOK3b2G5KQsEm
	 dONx89AItL4mKQsxhyC3lcJAF99zaCxxN4DPv9boKOkb9c0sNsZRmPcO+p2NZ2WWRNIGc
	 XdhH4taPiECnwyPOJjmMF1OZ3PilJMYenbadhjLeRK6SM3j+o5URPXHHvW7jG4Wcs2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HEzxvJ7F;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F378C606A324;
	Mon,  2 Nov 2026 09:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HEzxvJ7F
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F66C1F0093A;
	Mon,  2 Nov 2026 09:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793611372;
	bh=wupSt6qcV7DAB2KtSUf+pY3nETPzBO/lM5NPw/qkjhc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HEzxvJ7F2XboNysPcvzrG7AB5BBllZtOuUOSKY44PtE+1LsRfj2r36/TkYJZmpQKP
	 iqg0Pms/QQ+uQm6hyLjbToIK2tFZLOgCXv/n5M2/mHIsWpb7AukXCoZA7ktZvS8ntJ
	 yGoqPFSWn499k75csQd4Srsl4dLLikYmpq591k8Pn/ztKyawA7pI+l6H2iNh2/nNol
	 u82b53TZYynz/8xN8ZFk+63Vf1t+yHx/ijSJV6yfY4oVQR+mKf6QnqALx6ieMtrXxj
	 dK/v/GtUwzCo40gZcnLSY/LEMeGbUbM2lhpB63J3zy8orkd5rdWW/UNtY4T/D0LF7p
	 1q6OzYR0BivtA==
Message-ID: <sashiko-outbox-193168@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 7/9] ARM: dts: bcm2711-rpi: Use 40-bit DMA for HDMI
 audio
Reply-To: sashiko-reviews@lists.linux.dev
To: "Peter Robinson" <pbrobinson@gmail.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261102090713.896324-8-pbrobinson@gmail.com>
References: <20261102090713.896324-1-pbrobinson@gmail.com>
 <20261102090713.896324-8-pbrobinson@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 09:22:51 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] ARM: dts: bcm2711: hdmi audio dma40 truncates FIFO address on =
!LPAE
--

commit 849f01a77c8d05d1bc02c231948e58143158b712
Author: Peter Robinson <pbrobinson@gmail.com>

ARM: dts: bcm2711-rpi: Use 40-bit DMA for HDMI audio

This commit enables the 40-bit DMA controller (dma40) on the Raspberry Pi 4
and switches hdmi0 and hdmi1 audio DMA to use dma40 channels 10 and 17.

> diff --git a/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi b/arch/arm/boot/=
dts/broadcom/bcm2711-rpi.dtsi
> index 1eb6406449d19..a49a732d3f64e 100644
> --- a/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
> +++ b/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
> @@ -42,6 +42,12 @@ i2c0_1: i2c@1 {
>  	};
>  };
> =20
> +&dma40 {
> +	/* The VPU firmware uses DMA channel 11 for VCHIQ */
> +	brcm,dma-channel-mask =3D <0x7000>;
> +	status =3D "okay";
> +};
> +
>  &firmware {
>  	expgpio: gpio {
>  		compatible =3D "raspberrypi,firmware-gpio";
> @@ -59,12 +65,14 @@ reset: reset {
>  &hdmi0 {
>  	clocks =3D <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 0>, <&cl=
k_27MHz>;
>  	clock-names =3D "hdmi", "bvb", "audio", "cec";
> +	dmas =3D <&dma40 10>;
>  	wifi-2.4ghz-coexistence;
>  };
> =20
>  &hdmi1 {
>  	clocks =3D <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 1>, <&cl=
k_27MHz>;
>  	clock-names =3D "hdmi", "bvb", "audio", "cec";
> +	dmas =3D <&dma40 17>;

[Severity: Critical]
Will switching hdmi0 and hdmi1 in arch/arm/boot/dts/broadcom/bcm2711-rpi.dt=
si
to dma40 cause a regression on 32-bit ARM kernels built without
CONFIG_ARM_LPAE (such as bcm2835_defconfig or multi_v7_defconfig)?

When playing HDMI audio, vc4_hdmi_audio_init() configures
dma_slave_config.dst_addr with the VPU bus address of the MAI_DATA FIFO
(0x7ef200xx). With hdmi0 and hdmi1 moved to dma40,
bcm2835_dma_prep_dma_cyclic() calls bcm2835_dma_periph_addr() to translate =
the
0x7c000000..0x7fffffff peripheral window to the 35-bit SCB bus window
(0x4_7c000000..0x4_7fffffff) by adding c->periph_offset (0x400000000ULL):

drivers/dma/bcm2835-dma.c:bcm2835_dma_periph_addr() {
	if (addr >=3D BCM2835_DMA_PERIPH_BASE && addr < BCM2835_DMA_PERIPH_END)
		addr +=3D c->periph_offset;

	return addr;
}

However, CONFIG_ARCH_BCM2835 does not select CONFIG_ARM_LPAE or
CONFIG_ARCH_DMA_ADDR_T_64BIT, so dma_addr_t is a 32-bit u32 on non-LPAE 32-=
bit
ARM builds. Because bcm2835_dma_periph_addr() takes and returns dma_addr_t
(and dst in bcm2835_dma_prep_dma_cyclic(), bcm2835_dma_prep_slave_sg(),
bcm2835_dma_create_cb_chain(), bcm2835_dma_cb_init(), and
bcm2835_dma_cb_set_dst() is also typed as dma_addr_t rather than u64), addi=
ng
0x400000000ULL truncates the upper 32 bits, leaving addr as 0x7ef200xx.

When bcm2835_dma_cb_set_dst() then programs the 40-bit control block:

drivers/dma/bcm2835-dma.c:bcm2835_dma_cb_set_dst() {
	if (c->is_40bit_channel) {
		e->cb40->dst =3D lower_32_bits(addr);
		FIELD_MODIFY(BCM2711_DMA40_ADDR_HI, &e->cb40->dsti,
			     upper_32_bits(addr));
		return;
	}

upper_32_bits(addr) evaluates to 0 instead of 0x4. Doesn't this program the
DMA40 engine to write HDMI audio samples to SCB address 0x0_7ef200xx (physi=
cal
SDRAM around the 2 GiB mark) instead of the HDMI MAI FIFO at 0x4_7ef200xx,
breaking HDMI audio and corrupting system memory?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102090713.8963=
24-1-pbrobinson@gmail.com?part=3D7
