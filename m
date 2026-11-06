Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793977925;
	b=U5Ugfx+F/TCVip1297Zrth41H7euUQmWVErA8x/kTW2mXNxWsCss4E3SriOh7/4FdSBl
	 2LWJ+sw44joHqQ8v9SVTTcu78/ef6KQKfg/6NhJ13TKohjxTtrGsBpaRhBCWVRnJj5E4Z
	 ZP3jL6wN6cj5lbPmhyskkeY5WiBWQVZTYAC2tMtv1EuyvYk9hROO3KToQ/QiGvsiiLCzb
	 Wmlm/ccfaIYulbQIzLRbgybHHmVFtBVQPpapbIoOyUYdclCLybvtU/sNX42Q4QCwb+0Ce
	 0A3ULgzjm/6w+knymqcSvhkZeLQaccI0c7WRBIOKhSGGPV3NU+CeUPAFxdi7/unsdXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793977925;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=IExecR95GL6CEgRTZc0PB/2m5kr3bovfeems4StM8/Y=;
	b=hOnORXJ3UAjKYC4Q2F8IFej2tTwRmFxrNxUZkL5D8DkCbgUSZs6C8VHnn5a3Ga1ngz2z
	 AJSh9SUhBeDui/IBprTSqzlFFbAkbaRtEXfBRbo0F1E3HRd4jjCReO9xqEV87Slp3cb9B
	 Th5IY3QOl7j0HqPzsqi2RIIXb8L7ZwzNgi/F2uRYSLpMczdMKkqzhvZe+JA7ePlnQ/tG0
	 4bHQpKPcg+fpjAXD//D3wMn+ONIfoJDVmbcAyjjcUd33gN7txQRnHDR/5RoOtxLh35cBj
	 9G0LrYcnIDrN3Z893s2IyKn+9g5zcoT3jpJVDOAAeIarQmKt0gcGeZKC/9lPE9ZbuLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PfggSSXA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33212606A330;
	Fri,  6 Nov 2026 15:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PfggSSXA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB9421F008A4;
	Fri,  6 Nov 2026 15:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793977925;
	bh=IExecR95GL6CEgRTZc0PB/2m5kr3bovfeems4StM8/Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PfggSSXAOW/Iug8fePy8ufly7jmdBG51rOiYr9dfaZldFG3XPhYx4U0QAPbNEBg/L
	 wqJf3WA2eMKE77kQJ+mL0nT7cNPFo5jeFxke11IiKEBRb+ULECyqDgMa0dGPI8nWAM
	 Uw3HURvMNnJH9S9T48mo2X+81vidWJ+WFvlyelrwD8n4CdRR0rX5qctx2aQE1mgh3T
	 iu/BuDTcblkk7IOUcqlL3bu8dzs4nxYW4Fb4GGsfjNBBjtvQNw77jr+sHZImIXAdr8
	 Qnn1XrzlnkxJ6EljgqcxNJtJkZjPUHhUE7CvGUr/ZScHYck6MA7kidwiCffeCqPzpF
	 zADdFtwWQxujw==
Message-ID: <sashiko-outbox-201650@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/6] dmaengine: qcom: gpi: Add QSPI protocol support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jyothi Kumar Seerapu" <jyothi.seerapu@oss.qualcomm.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261106-qspi_upstream_series-v1-5-21f43042dd60@oss.qualcomm.com>
References: <20261106-qspi_upstream_series-v1-0-21f43042dd60@oss.qualcomm.com>
 <20261106-qspi_upstream_series-v1-5-21f43042dd60@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 15:12:04 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [Critical] dmaengine: qcom: gpi: endianness bug in
  gpi_create_i2c_tre() [1]
--

commit 9cdfe35f34d7a7a0d6e8622961798e1c9733ec6f
Author: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>

dmaengine: qcom: gpi: Add QSPI protocol support

This commit adds QSPI protocol support to the Qualcomm GPI DMA driver,
including QSPI transfer modes, dummy cycles, and sequential TX-then-RX
transactions.

> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> index a5055a6273af6..487e023287aa1 100644
> --- a/drivers/dma/qcom/gpi.c
> +++ b/drivers/dma/qcom/gpi.c
[ ... ]
> @@ -1736,7 +1742,12 @@ static int gpi_create_spi_tre(struct gchan *chan, =
struct gpi_desc *desc,
>  		tre =3D &desc->tre[tre_idx];
>  		tre_idx++;
> =20
> -		tre->dword[0] =3D u32_encode_bits(spi->fragmentation, TRE_SPI_GO_FRAG);
> +		if (chan->protocol =3D=3D QCOM_GPI_QSPI) {
> +			tre->dword[0] =3D u32_encode_bits(spi->fragmentation, TRE_QSPI_GO_FRA=
G);
> +			tre->dword[0] |=3D u32_encode_bits(spi->qspi_mode, TRE_QSPI_GO_MODE);
> +		} else {
> +			tre->dword[0] =3D u32_encode_bits(spi->fragmentation, TRE_SPI_GO_FRAG=
);
> +		}
>  		tre->dword[0] |=3D u32_encode_bits(spi->cs, TRE_SPI_GO_CS);
>  		tre->dword[0] |=3D u32_encode_bits(spi->cmd, TRE_SPI_GO_CMD);

[Severity: Critical]
This problem wasn't introduced by this patch, but should tre->dword[] be
written with cpu_to_le32() in gpi_create_spi_tre() and gpi_create_i2c_tre()
[1]?

Both functions populate tre->dword[] using host-endian values from
u32_encode_bits(), lower_32_bits(), and upper_32_bits():

drivers/dma/qcom/gpi.c:gpi_create_spi_tre() {
    ...
		tre->dword[0] =3D lower_32_bits(address);
		tre->dword[1] =3D upper_32_bits(address);

		tre->dword[2] =3D u32_encode_bits(len, TRE_DMA_LEN);
		tre->dword[3] =3D u32_encode_bits(TRE_TYPE_DMA, TRE_FLAGS_TYPE);
    ...
}

On big-endian hosts, the hardware receives byte-swapped descriptors, causing
DMA transfers to use corrupted configuration fields and invalid physical
addresses.

[1] https://sashiko.dev/#/bug/linux-b28be1ac-c36c-4aa8-a76a-58a19eaef473

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-qspi_upstr=
eam_series-v1-0-21f43042dd60@oss.qualcomm.com?part=3D5
