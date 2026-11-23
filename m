Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446553;
	b=oFnhpwStIinLd3a2rQSzIasG8x8aTcJbL3L6vBGdsALAHhFe0sNLegkD3CLleON6dzpF
	 FA/zBWfcoW0hHhZT9Bit8chiXzeBjE7fJXHxPGWSHcD75TiBX+3wOzGRozJLyHrxoss2i
	 4Y6hl8jLtqWIe1cigyOF2yAFADT1CT+bWEGEafOTmfAzjjuar4yRpw+y88yRPFGImk4yB
	 06nSUlisAKa6hClefe1wyUeNp1DEJyRSFRpVydeQbzd90nJaDUXgpr46+cjFo0jmG9RdP
	 kuhR3pQpi7sJympjgxec41iCKbSK1s8C9QkarG1KOAy++/SGhr2wyXYC7pD95HkVoDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446553;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=O0I3oMMaLQevDn9qj5uUVhPOD4pkBQxviqxeY0uv2SQ=;
	b=U5bd9r84wc1zpN2l/MkeZzXCRA7B9weEDPdyq8zLQsIEY+8duz0EVk2UtluyDUvILtxz
	 Qttzl/8nec+wGR3/vlqErlKfdTmqvehRf7xLJs3uEoD8NXIs6/9/rNwJUr0M8oRLFHh4R
	 W5y5aeyW8bLC8Os9FGxhDTL/Hwr2Cyg5Wp6CCd1qy+sGGfaDlEeYG05Ea/bPVbvtqOpYq
	 HE9JqunN0NAU7r3dzOOe//vLn9sUH8D394Esz3EpLU+baWFrbNJEA5RkVYZ57YncMD+1a
	 yrVstTQFtrJmKDfGvWWCZgBU4gZCyB2l2QA5d8AQJGYlyzJgy6nUb46/wkX+kRzSZ1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="oRE/1sli";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C864B606A31A;
	Mon, 23 Nov 2026 15:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oRE/1sli
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D6721F000C4;
	Mon, 23 Nov 2026 15:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795446552;
	bh=O0I3oMMaLQevDn9qj5uUVhPOD4pkBQxviqxeY0uv2SQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oRE/1slizhkOhT6KJyTWqO/k5QGBs+uHsazP/8znsXZefGW4jbtVbzSmXeaq8N5BZ
	 YhmWMorNhxfERWqp+lMs2dLHHggSmH8oZcCBMVHRgiYRlBeb7zLQ8KMD21cjYd4X58
	 KdjuJp2HCuVqwxTGVxctxIthvK2lvvi9zvRURFNw35UvWn/JLqgJO/mGJ32sZkuuqu
	 hltbBChKBY5iaX8Az7zPF4rXjSL/j6GGw2M/5dGAmpl0O00QKT2d7D99znmqIi77Rb
	 p6/bIPwOY3+zbd1sueKpLeIgTzZyh4KB+g+ZZucPFrR++Ln8nnbJrWzpDMcAFIRRAt
	 U0AT6BEduX9KA==
Message-ID: <sashiko-outbox-229498@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 22/28] dmaengine: bcm2835: Add BCM2711 40-bit DMA
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrea della Porta" <andrea.porta@suse.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261123145728.29082-23-andrea.porta@suse.com>
References: <20261123145728.29082-1-andrea.porta@suse.com>
 <20261123145728.29082-23-andrea.porta@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 15:09:12 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] dmaengine: bcm2835: missing BCM2711_DMA40_IGNORE in
  to_bcm2711_srci()
--

commit 43d03cc19b62f4a54ac975aa54643cf367639895
Author: Andrea della Porta <andrea.porta@suse.com>

dmaengine: bcm2835: Add BCM2711 40-bit DMA support

This commit adds support for the BCM2711 40-bit DMA channels, which use a
different register layout and control block format than the legacy BCM2835
DMA channels.

> diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
> index 0ea903274286f..a98ea67d3406e 100644
> --- a/drivers/dma/bcm2835-dma.c
> +++ b/drivers/dma/bcm2835-dma.c

[ ... ]

> @@ -487,6 +564,199 @@ static u32 bcm2835_dma_cs_flags(struct bcm2835_chan=
 *c)
>  	return BCM2835_DMA_CS_FLAGS(c->dreq);
>  }
> =20
> +static inline u32 to_bcm2711_ti(u32 info)
> +{
> +	return ((info & BCM2835_DMA_INT_EN) ? BCM2711_DMA40_INTEN : 0) |
> +		((info & BCM2835_DMA_WAIT_RESP) ? BCM2711_DMA40_WAIT_RESP : 0) |
> +		((info & BCM2835_DMA_S_DREQ) ?
> +		 (BCM2711_DMA40_S_DREQ | BCM2711_DMA40_WAIT_RD_RESP) : 0) |
> +		((info & BCM2835_DMA_D_DREQ) ? BCM2711_DMA40_D_DREQ : 0) |
> +		BCM2711_DMA40_PER_MAP((info >> 16) & 0x1f);
> +}
> +
> +static inline u32 to_bcm2711_srci(u32 info)
> +{
> +	return ((info & BCM2835_DMA_S_INC) ? BCM2711_DMA40_INC : 0) |
> +	       ((info & BCM2835_DMA_S_WIDTH) ? BCM2711_DMA40_SIZE_128 : 0) |
> +	       BCM2711_DMA40_BURST_LEN(BCM2835_DMA_GET_BURST_LENGTH(info));
> +}

[Severity: Medium]
Should to_bcm2711_srci() also translate BCM2835_DMA_S_IGNORE into
BCM2711_DMA40_IGNORE?

bcm2711_dma_cb_init() calls bcm2835_dma_prepare_cb_info(), which sets
BCM2835_DMA_S_IGNORE in info when zero_page is true, and passes info to
to_bcm2711_srci().  Because to_bcm2711_srci() drops that bit,
BCM2711_DMA40_IGNORE is left unused and zero-page transfers on 40-bit
channels will read from DRAM instead of letting the hardware synthesize
zeroes.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123145728.2908=
2-1-andrea.porta@suse.com?part=3D22
