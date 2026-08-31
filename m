Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DFA3438AD
	for <dmaengine@vger.kernel.org>; Mon, 31 Aug 2026 12:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788178113; cv=none; b=dko2IxAnRKpWN2x88RYPGrG2+1VMSb1Rd8zvCxUiRPP+F9zIRDnC3UDE5SRRUVcnr0vjAYdcwUrGjdrST1B0zmXi8dQ1k2LST/QXc6XkdpnErlbgjU3BqpGnTJ4j0NGMJnTl432hIXmQsUtuYkQ2NQwRkU//Q899D27QKr/pU8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788178113; c=relaxed/simple;
	bh=Wi3tVU8p+mqvQwkmjUpS8lHVHnWH0b8RPGt6IvdQep4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SLS84mGWD0fW0XgVk9CuhRAx8Lt8JDrZdRg6G/e3VZkng+XaY63+JXKBOUe7MTkGCxqsV9C3LLe92nKEYUMQgoOEt1W6tuFdbLXs0/9EeU9K2zGn1A8Vc3PfCen5XUzvd3EMVHHY9XeP+2xU7PQKMmB44m8Trm+STSg8hBhId5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NfgB357Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NfgB357Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C421F1F000E9;
	Mon, 31 Aug 2026 12:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788178112;
	bh=IXhPxITJI0+Me9pska9XdRMujQSxv+FvWXETtbTwZAw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NfgB357YT6tpgto3Hk5o4aJkczpplcKC4RDM7hMEY85HEnKEqDzJB30ncApYK9OPw
	 NLN4xfC7DQTNkZonoxDB1f5h7gHQOIfDSD97UAtkIkliAsvrzBzcXUJqfAkB/nzLjY
	 DFXrVCKenGOix3nwHuVM8WEkimK6cm0HAdjz5H/8FBd6OE8eXzvbyxa5klF8nH4OCA
	 +gsBB16F2NeoVTZI4fEMJdgKBL1edsVAyp3xy9tzyBaGZJISNQTCxCL7fLFfhSIQNR
	 +D30EUfvSx5SQcX1kxPDB6s6Nru0wDyPudSi/Bo99zmAT4o4Dh65qZH/28i5JR1QHl
	 qhmVpK8ju31IQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 8/9] spi: dw: Use dma_slave_caps bus width helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TnVubyBTw6E=?= <nuno.sa@analog.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260831-dmaengine-support-wider-dma-masks-v3-8-507d97496f2d@analog.com>
References: <20260831-dmaengine-support-wider-dma-masks-v3-0-507d97496f2d@analog.com>
 <20260831-dmaengine-support-wider-dma-masks-v3-8-507d97496f2d@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 12:08:31 +0000
Message-Id: <20260831120831.C421F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] `dw_spi_can_dma()` evaluates DMA capability using stale `dws->n_by=
tes` state from a previous transfer, leading to invalid DMA configurations.
--

commit a1e1fa79562141ff2997ca919b2572914bd4eb82
Author: Nuno S=C3=A1 <nuno.sa@analog.com>

spi: dw: Use dma_slave_caps bus width helpers

Store the common TX destination and RX source bus widths in a
driver-owned DMA bus width bitmap and populate it through the
dma_slave_caps helper.

> diff --git a/drivers/spi/spi-dw-dma.c b/drivers/spi/spi-dw-dma.c
> index fe726b9b1780d..bbd7ee884d0ec 100644
> --- a/drivers/spi/spi-dw-dma.c
> +++ b/drivers/spi/spi-dw-dma.c
[ ... ]
> @@ -253,7 +255,7 @@ static bool dw_spi_can_dma(struct spi_controller *ctl=
r,
> =20
>  	dma_bus_width =3D dw_spi_dma_convert_width(dws->n_bytes);
> =20
> -	return dws->dma_addr_widths & BIT(dma_bus_width);
> +	return dma_bus_width_test(dws->dma_bus_widths, dma_bus_width);
>  }

[Severity: High]
This is a pre-existing issue, but does dw_spi_can_dma() evaluate DMA capabi=
lity
using stale dws->n_bytes state from a previous transfer?

It appears spi_map_msg() invokes dw_spi_can_dma() before any transfer in the
message is executed. When dw_spi_can_dma() reads dws->n_bytes to determine =
the
DMA bus width, it gets the state from the last executed transfer.=20

The state is only updated later when the transfer actually starts:

drivers/spi/spi-dw-core.c:dw_spi_transfer_one() {
    ...
    dws->n_bytes =3D spi_bpw_to_bytes(transfer->bits_per_word);
    ...
}

If a SPI message contains transfers with different bits_per_word, or if the
current message differs from the previous one, can_dma() might incorrectly
return true for a transfer that requires an unsupported DMA bus width. This
could lead to dmaengine_slave_config() failures or DMA hardware malfunctions
and data corruption.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-dmaengine-=
support-wider-dma-masks-v3-0-507d97496f2d@analog.com?part=3D8
