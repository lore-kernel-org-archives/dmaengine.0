Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5445E44162B
	for <dmaengine@vger.kernel.org>; Thu, 30 Jul 2026 14:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785422608; cv=none; b=HtqBjoQzLg60wFuB1x/E3oRI7UcZ8qf2n36iTq+o8qccGe60o+tPiBQjnvKUIMlP0Hr+8/cU39fwOJHT24Z3kWBewSxkC3Ncqev3IPvEpVhIFNi7DBoytohAkVQRSQ3zZgnktNcofoecIpvVQ3/WujjVnhi6PGxzsyxY0wuTKAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785422608; c=relaxed/simple;
	bh=SmmwN9Mrr+m5aLCdPM8KtrLjET0IY8e1n5KKZ7QEAL4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BEyFCMoX2ZuKCueIVxGIu+aJHAQhxdDJQLSQkB7pkP1fhnKJF0P3VU2FEAzrkuMhUzjuuMX4jdFgJ2gV/RNaeWScu9PKmi8wmVt6hSitZ1DlEcRdH4HIteiOqws0qd8/MTK9VuRqY3++CnDdzm6zT53MMEviNZAJ6z9DLQiflUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FNjIbimg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FNjIbimg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B70621F00A3D;
	Thu, 30 Jul 2026 14:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785422607;
	bh=8liKSUzMDNLvt5cphy6te0Q6hU7oF8DoAZKkB07cRD8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FNjIbimghiiwxT7zrmF5uBLtBabYiq2BW0A0pjnimbyUwKECiyaJyxesbmiP5tDXv
	 iu+rhUsV9vZ995zWrGZqXQo5zRT+GF6hnMAZu9pKfCUF75fiEfSYUlYbpvJA2O8JvD
	 W+KQ5Jl9RRDjShxu8NGiV+vzlndK7m2v6v2ecwDNjoeB4di8T1Jn9ixcF9zX8odgJE
	 ydVVb/n2w2JUcNp9zyraNmYX/0cRANnhCNsKTAZbHemWCqAQ72vwNZFHvuHKyy5Bdb
	 OJFouh9H187brmAR/MnsDQEQdEl9VRJIKCF2A7IKiiY/qJ3ClXeseN9RgfhufOwUJM
	 euCJgQMpMHLdw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 8/9] spi: dw: Use dma_slave_caps bus width helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TnVubyBTw6E=?= <nuno.sa@analog.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260730-dmaengine-support-wider-dma-masks-v1-8-3732f1f9d9ca@analog.com>
References: <20260730-dmaengine-support-wider-dma-masks-v1-0-3732f1f9d9ca@analog.com>
 <20260730-dmaengine-support-wider-dma-masks-v1-8-3732f1f9d9ca@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 14:43:26 +0000
Message-Id: <20260730144326.B70621F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] `dw_spi_can_dma` relies on a stale `dws->n_bytes` value, which may=
 cause incorrect DMA fallback or unsupported DMA configuration.
--

--- Patch [8]: [PATCH 8/9] spi: dw: Use dma_slave_caps bus width helpers ---
commit cd2773a5f68d147fd25b2ce32d4b2dd68d630ea4
Author: Nuno S=C3=A1 <nuno.sa@analog.com>

spi: dw: Use dma_slave_caps bus width helpers

Store the common TX destination and RX source bus widths in a driver-owned
DMA bus width bitmap and populate it through the dma_slave_caps helper.
This avoids depending on the legacy addr_widths masks.

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

[Severity: High]
This is a pre-existing issue, but does dw_spi_can_dma() rely on a stale
dws->n_bytes value here?

The dws->n_bytes field holds the word size of the previous transfer. Should
dw_spi_can_dma() compute the bus width directly from xfer->bits_per_word to
correctly evaluate the DMA capability for the current transfer?

If a device uses different bus widths for successive SPI transfers, an
earlier transfer might use a bus width supported by the DMA controller, but
a later transfer uses an unsupported width. This would cause
dw_spi_can_dma() to incorrectly allow the second transfer to be DMA mapped
because it checks the stale dws->n_bytes from the first transfer.

When the SPI core later executes dw_spi_transfer_one() for the second
transfer, dws->n_bytes is updated to the actual unsupported width, and
dw_spi_dma_setup() attempts to configure the DMA engine with it, causing
dmaengine_slave_config() to fail and aborting the transfer.

> -	return dws->dma_addr_widths & BIT(dma_bus_width);
> +	return test_bit(dma_bus_width, dws->dma_bus_widths);
>  }
> =20
>  static int dw_spi_dma_wait(struct dw_spi *dws, unsigned int len, u32 spe=
ed)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-dmaengine-=
support-wider-dma-masks-v1-0-3732f1f9d9ca@analog.com?part=3D8
