Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793611540;
	b=vcJqywhpLJO4BWz+PbXCpsW5s/BGr0Pb4yvcXk8URtq+ily3xvBR02tRneFMB+WxO9v2
	 MZQhaPyXghVfYPbPuBjzyNf8Mb2wALCHYxoTV0Uzfezn7DbrvwP30BSdaInpF3shaiS6a
	 /dks9gVoC9N7nPbpP8ZZMUrsl2QVvBgJ/hrwlRWavmIe6CtcbITJcuxe937DrmKhjR34j
	 K2CB7+L8kESObtq0L8wq3aLcMRQDPLDoZltSjpFkCqMKacCYxV636pLDpwVTz08VFcJqB
	 d2Y9PGThnxxvlcaHHK+K+oZxTHb3K3odn2h0Tk+t7RPypN3knkYU0usjwUciR1W7XhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793611540;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Y4NbtLYaFP4E0Lljt2qlK+DkXnQdfw5VgiOhYb0xXFA=;
	b=DFBU5K2UQ8vvfyjfNVifc58IftPdfPCNMjzRA5bXIXBCCxfIOdsW3uVkZ4xge81BDRTw
	 LRgof90dPPArdZc/7EFGnCVbQCLj5s7/dpJgQ20y1JI2gBd+H72GiNSBrPcUxJUIxMAaP
	 qOMMvSozbx9Y8Q9I+YHU9+A+HoVD3IO4FKuGEsg4fSeyOOBEbvvKaecH1LiHTCJlQUs6b
	 IP+31n9z0cVblsKr6sGyaZxl3hqxyIHpPcLEfz6kfixK/gVFCIe0O8cpiHpdt2WWovZOe
	 HL9u3tC6Dh/J8ZCjnD4UuzU7Bg2hbK0JS2cFI66VajPQmMIAGDvA2fpqCZbYOnS8opw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XMdnBVjq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F174060A260B;
	Mon,  2 Nov 2026 09:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XMdnBVjq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D6F41F01803;
	Mon,  2 Nov 2026 09:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793611539;
	bh=Y4NbtLYaFP4E0Lljt2qlK+DkXnQdfw5VgiOhYb0xXFA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XMdnBVjqsM/sixDf0cIPrACMKC549gzGwAcwvn0GSF0if8NjyPzHD/ggZKM8TnPYa
	 MmQ1X+xX7fAsckXvLshb1T44kwYg9FIHKCXFLwRTVFVR4qC3v2k/BDtCjZ0mX46Ovk
	 mKsj7V4PtUub9VyZmsmdUyVL5LqPBogJ26zGeY/mBJA4O8TMfYMnMmK2VoJTOLpyXM
	 PQXp5dQSp9iYKLshoEaduNtzxj1i6lUkpzZVGj1msa/U84TO+Lgy4Gndzb1cxFONnc
	 3fqtIULxl13UA8OPkjaXb4IX9wvAZAnBUCPk8xPhnY3rQHOmMQvS5YtB4+J0Eue8hh
	 XJR0KlkSufo1w==
Message-ID: <sashiko-outbox-193172@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/9] dmaengine: bcm2835: Add BCM2712 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Peter Robinson" <pbrobinson@gmail.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261102090713.896324-6-pbrobinson@gmail.com>
References: <20261102090713.896324-1-pbrobinson@gmail.com>
 <20261102090713.896324-6-pbrobinson@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 09:25:38 +0000
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
- [Medium] dmaengine: bcm2835: missing STRIDE high bits in residue address =
helpers
--

commit 036b8292dd25c0046b851159c80cd9142c283fa1
Author: Peter Robinson <pbrobinson@gmail.com>

dmaengine: bcm2835: Add BCM2712 support

This commit adds support for the BCM2712 DMA controller with a 40-bit DMA
mask, configuring channels 6-11 as 40-bit DMA4 engines and setting
ext_addr for legacy layout channels so that address bits [39:32] are
stored in the control block STRIDE field.

> diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
> index 35f8c47dea89f..f06609b04a098 100644
> --- a/drivers/dma/bcm2835-dma.c
> +++ b/drivers/dma/bcm2835-dma.c
[ ... ]
> @@ -349,6 +363,9 @@ static void bcm2835_dma_cb_set_src(struct bcm2835_cha=
n *c,
>  	}
> =20
>  	e->cb->src =3D lower_32_bits(addr);
> +	if (c->ext_addr)
> +		FIELD_MODIFY(BCM2712_DMA_STRIDE_SRC_HI, &e->cb->stride,
> +			     upper_32_bits(addr));
>  }
> =20
>  static void bcm2835_dma_cb_set_dst(struct bcm2835_chan *c,
> @@ -362,6 +379,9 @@ static void bcm2835_dma_cb_set_dst(struct bcm2835_cha=
n *c,
>  	}
> =20
>  	e->cb->dst =3D lower_32_bits(addr);
> +	if (c->ext_addr)
> +		FIELD_MODIFY(BCM2712_DMA_STRIDE_DST_HI, &e->cb->stride,
> +			     upper_32_bits(addr));
>  }

[Severity: Medium]
Should bcm2835_dma_cb_mem_addr() and bcm2835_dma_get_pos() also account for
the upper address bits [39:32] stored in the STRIDE field when c->ext_addr
is set on legacy layout channels?

In drivers/dma/bcm2835-dma.c, bcm2835_dma_cb_set_src() and
bcm2835_dma_cb_set_dst() place upper_32_bits(addr) into e->cb->stride under
BCM2712_DMA_STRIDE_SRC_HI and BCM2712_DMA_STRIDE_DST_HI when c->ext_addr is
true on non-40-bit channels (such as channels 0-5 on BCM2712).

However, bcm2835_dma_cb_mem_addr() and bcm2835_dma_get_pos() only check
c->is_40bit_channel and otherwise return only the lower 32 bits:

drivers/dma/bcm2835-dma.c:bcm2835_dma_cb_mem_addr() {
	if (c->is_40bit_channel) {
		if (dir =3D=3D DMA_DEV_TO_MEM)
			return bcm2711_dma40_addr(e->cb40->dst, e->cb40->dsti);
		return bcm2711_dma40_addr(e->cb40->src, e->cb40->srci);
	}

	return dir =3D=3D DMA_DEV_TO_MEM ? e->cb->dst : e->cb->src;
}

drivers/dma/bcm2835-dma.c:bcm2835_dma_get_pos() {
	...
	if (dir =3D=3D DMA_DEV_TO_MEM)
		return readl(base + BCM2835_DMA_DEST_AD);
	return readl(base + BCM2835_DMA_SOURCE_AD);
}

When bcm2835_dma_tx_status() calls bcm2835_dma_get_pos() and
bcm2835_dma_desc_size_pos() to compute transfer residue:

drivers/dma/bcm2835-dma.c:bcm2835_dma_desc_size_pos() {
	for (size =3D i =3D 0; i < d->frames; i++) {
		struct bcm2835_cb_entry *e =3D &d->cb_list[i];
		size_t this_size =3D bcm2835_dma_cb_get_len(d->c, e);
		dma_addr_t dma =3D bcm2835_dma_cb_mem_addr(d->c, e, d->dir);

		if (size)
			size +=3D this_size;
		else if (addr >=3D dma && addr < dma + this_size)
			size +=3D dma + this_size - addr;
	}
	return size;
}

If a transfer on a BCM2712 legacy layout channel crosses a 4 GiB boundary,
dma + this_size exceeds 0xffffffff while addr wraps in the 32-bit
BCM2835_DMA_SOURCE_AD or BCM2835_DMA_DEST_AD register, causing the range
check (addr >=3D dma && addr < dma + this_size) to fail and report zero
residue while the transfer is still running. Similarly, if scatter-gather
segments in different 4 GiB regions have overlapping low 32-bit addresses,
bcm2835_dma_desc_size_pos() can match the wrong control block.

Could bcm2835_dma_cb_mem_addr() and bcm2835_dma_get_pos() reconstruct the
full 40-bit address from the STRIDE field when c->ext_addr is true?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102090713.8963=
24-1-pbrobinson@gmail.com?part=3D5
