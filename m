Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B040D3C198D
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 15:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786375711; cv=none; b=cKZbm5lwkqlWyjpncrJKnJPfMiT1X/mhoiZ8ZHs0pfhUXILEC+wKxr7heLcoMROlMbA3L0EI2WQlEzMhnLbhB/249Wx+/e9/Cun4/ubateINIX/qQsBWxXQHSK5bUlb6FqmHJsySye9y0pvU7BtJ5viver7o8AXlByHdOjKz/s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786375711; c=relaxed/simple;
	bh=hmT7GzbTlUAgh1nNF7bmKdKOzfh0n0UnxuOD4v3k0cc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kqzNTFmr4OaAZQImmJ7H671H5GMzHLM8o0hz03VxXtH6QRdtbrFyz4HIXxPhygjEIf5X1O9iK3f7hrjGsuCnsuM+knp2Z6/Y+5hnPAqEIw7I3U1ix3MPMO497n/fdzQG2WAbNPFma/cPqfM/0eMyjhiX3kyh/zUrexrQp2OipcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MXaySDKP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MXaySDKP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC2971F000E9;
	Mon, 10 Aug 2026 15:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786375710;
	bh=C5+TNLsWBr933MgMidpc1gNPp37vArJnpERfWIqQBGQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MXaySDKPvCtjNRf6MK3SChdiF5994kS8TSbZ8HrpM/NgNqIFtqy6O3ABFCAkkMjzj
	 wqd9hvnEgSSQQxG8hFdzloMtBaVNK7Gh6jBi3sBfNRX+LCfogUwC81uRboG2YI2JYp
	 e8Rct5vLm/nfzcW8897F6MrWP555WDCh9tUnK3yHo0LU0PFL3B2IhJ3uoQif/ufhZD
	 FxYmkzWOEVewTDy+gAAPlWwDCDCtEo5MQJNGYfyKIRda4zP8WHmihLe7xnSx2A5ODe
	 vEFTORFBY2N3+5is3YjJ1eLGGrE9d+X6OZuNbL64GU+2z2qWJ6TRRrjzgRLf3fJyIp
	 ZNHm6RvRN4GDg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 8/9] spi: dw: Use dma_slave_caps bus width helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TnVubyBTw6E=?= <nuno.sa@analog.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260810-dmaengine-support-wider-dma-masks-v2-8-1f7b798d035f@analog.com>
References: <20260810-dmaengine-support-wider-dma-masks-v2-0-1f7b798d035f@analog.com>
 <20260810-dmaengine-support-wider-dma-masks-v2-8-1f7b798d035f@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 15:28:28 +0000
Message-Id: <20260810152829.BC2971F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] `dw_spi_can_dma()` evaluates DMA capabilities using a stale or uni=
nitialized `dws->n_bytes` value, which can incorrectly accept or reject DMA=
 mapping.
--

--- Patch [8]: [PATCH v2 8/9] spi: dw: Use dma_slave_caps bus width helpers=
 ---
commit 4458885866ffec3718df2694d83959e2e55d8975
Author: Nuno S=C3=A1 <nuno.sa@analog.com>

spi: dw: Use dma_slave_caps bus width helpers
   =20
Store the common TX destination and RX source bus widths in a driver-owned
DMA bus width bitmap and populate it through the dma_slave_caps helper.

> diff --git a/drivers/spi/spi-dw-dma.c b/drivers/spi/spi-dw-dma.c
> index fe726b9b1780d..2e23ead4a94f9 100644
> --- a/drivers/spi/spi-dw-dma.c
> +++ b/drivers/spi/spi-dw-dma.c
[ ... ]
> @@ -253,7 +253,7 @@ static bool dw_spi_can_dma(struct spi_controller *ctl=
r,
> =20
>  	dma_bus_width =3D dw_spi_dma_convert_width(dws->n_bytes);
> =20
> -	return dws->dma_addr_widths & BIT(dma_bus_width);
> +	return test_bit(dma_bus_width, dws->dma_bus_widths);
>  }

[Severity: High]
This is a pre-existing issue, but does evaluating the DMA capabilities here
rely on a stale or uninitialized value for dws->n_bytes?

The SPI core calls spi_map_msg(), which invokes the can_dma callback for
each transfer before any transfer_one callbacks are executed. However, it
looks like dws->n_bytes is not updated based on the current transfer's
bits_per_word until later:

drivers/spi/spi-dw-core.c:dw_spi_transfer_one() {
    ...
    dws->n_bytes =3D spi_bpw_to_bytes(transfer->bits_per_word);
    ...
}

Because of this sequence, dw_spi_can_dma() appears to use the n_bytes value
left over from the last transfer of the previous message (or 0 for the first
message).

If the previous message used a supported bus width (e.g., 1 byte) but the
current message uses an unsupported one (e.g., 4 bytes), will
dw_spi_can_dma() incorrectly return true? This seems like it could force an
unsupported DMA setup and fail the transfer entirely, rather than gracefully
falling back to PIO mode.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810-dmaengine-=
support-wider-dma-masks-v2-0-1f7b798d035f@analog.com?part=3D8
