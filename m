Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C673442FC1
	for <dmaengine@vger.kernel.org>; Thu, 30 Jul 2026 14:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785422391; cv=none; b=MNIm7bZcbxsCF49yZDJQoCffUKsc9Kp1H585EvmquaRQXFiOIQ6+MGfRzxUwnYqL3Oop8qos9uyX8qv5YtOosMEsoskMlzJDD4jDxHTbiv+oLa1mUX7I0X7YUG0DO7Aplylf4Ab5X04UZNYOSSE7Wx0vhP4cXMpfpl3OUtTasS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785422391; c=relaxed/simple;
	bh=QV5o6/Y58p2QYxFJMUFQOQsYwpGHG2ryO4q50nc+1jk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=l6vVlPdUHr9GjpO8DvOYctSTUOnGq08PY5FNflRsNz2/689wQkxbDAYnKbi6ARiCjx28bDbaj8ox1BIvc2VAfpwCj23Ti2IIqjKqk8WyuWiya9XkQG3IGE34fghm14Xx1PYsrAIIhsiCMs7ANGxNe/opcqdKWXSQcJYIkb6Pu6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fa4sOLyy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fa4sOLyy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3DF81F00A3A;
	Thu, 30 Jul 2026 14:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785422389;
	bh=aisTWR+1FNfyQlt5lOzJ0r4LDDDLQ6lsjvlwDChTFpE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fa4sOLyyzXT5aNjl5zDSHjAl6xzwgrtI33RkYXo+9sriIHMN/K4IwDZacvTv0DjlK
	 GdreseciAjdFBlD95+o1fffUlsn04SwN8jXnJZITyxScvr76JGkTAlJ2jdKyVrbZtu
	 KYfTDrj6eWqEqr/7Pw+1MZ0uwLCcH8KkeKq+2IxZM6z4LGSIzSRuEH9535+iLMpla4
	 ymzPPgPc7GZ7U7FKqM3ZxD5coKVJfJ1aSlqiiHDskVqpTpAxCVUr0+uABWMj37nfZC
	 g+cjYroMtdwxn4gNVHcRe+oF0JQt6J34BHfRIPLS1MKMJIjfsSepJC1uL4m8Y7vPQa
	 1bAAxBtPb1z+A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/9] dmaengine: dma-axi-dmac: Use bus width capability
 helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TnVubyBTw6E=?= <nuno.sa@analog.com>
Cc: dmaengine@vger.kernel.org, Frank.Li@kernel.org, vkoul@kernel.org
In-Reply-To: <20260730-dmaengine-support-wider-dma-masks-v1-2-3732f1f9d9ca@analog.com>
References: <20260730-dmaengine-support-wider-dma-masks-v1-0-3732f1f9d9ca@analog.com>
 <20260730-dmaengine-support-wider-dma-masks-v1-2-3732f1f9d9ca@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 14:39:48 +0000
Message-Id: <20260730143948.B3DF81F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] dma_dev->copy_align is incorrectly populated with a linear byte wi=
dth rather than a logarithmic one, causing undefined behavior for bus width=
s >=3D 32 bytes.
--

--- Patch [2]: [PATCH 2/9] dmaengine: dma-axi-dmac: Use bus width capabilit=
y helpers ---
commit 99138308c2fc808f6bee3d2ac55aef702ecbd98a
Author: Nuno S=C3=A1 <nuno.sa@analog.com>

dmaengine: dma-axi-dmac: Use bus width capability helpers

This patch updates the driver to use the dma_set_src_bus_width() and
dma_set_dst_bus_width() helpers instead of open-coding the legacy BIT()
mask. This allows the driver to express bus widths of 32 bytes and above
while keeping the legacy u32 fields populated.

> diff --git a/drivers/dma/dma-axi-dmac.c b/drivers/dma/dma-axi-dmac.c
> index d47ff27e1408f..26912330e3c83 100644
> --- a/drivers/dma/dma-axi-dmac.c
> +++ b/drivers/dma/dma-axi-dmac.c

[ ... ]

> @@ -1262,8 +1262,13 @@ static int axi_dmac_probe(struct platform_device *=
pdev)
>  	dma_dev->device_terminate_all =3D axi_dmac_terminate_all;
>  	dma_dev->device_synchronize =3D axi_dmac_synchronize;
>  	dma_dev->dev =3D &pdev->dev;
> -	dma_dev->src_addr_widths =3D BIT(dmac->chan.src_width);
> -	dma_dev->dst_addr_widths =3D BIT(dmac->chan.dest_width);
> +	ret =3D dma_set_src_bus_width(dma_dev, dmac->chan.src_width);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D dma_set_dst_bus_width(dma_dev, dmac->chan.dest_width);
> +	if (ret)
> +		return ret;

[Severity: High]
This is a pre-existing issue, but since this patch enables bus widths of 32
bytes and above, does it expose an undefined behavior in the generic DMA
framework?

Further down in axi_dmac_probe(), copy_align is assigned a linear byte widt=
h:

drivers/dma/dma-axi-dmac.c:axi_dmac_probe() {
    ...
    dma_dev->copy_align =3D (dmac->chan.address_align_mask + 1);
    ...
}

The copy_align field is expected to be a logarithmic value based on enum
dmaengine_alignment. When a bus width of 32 bytes or more is configured,
copy_align becomes 32 or greater.

Functions in the generic DMA framework use this value as a shift amount.
For example:

include/linux/dmaengine.h:dmaengine_check_align() {
    ...
    return !(((1 << align) - 1) & (off1 | off2 | len));
}

If align is 32 or greater, shifting a 32-bit integer by that amount causes
undefined behavior. Should copy_align be updated to use a logarithmic
value to avoid this issue now that larger bus widths are supported?

>  	dma_dev->directions =3D BIT(dmac->chan.direction);
>  	dma_dev->residue_granularity =3D DMA_RESIDUE_GRANULARITY_DESCRIPTOR;
>  	dma_dev->max_sg_burst =3D 31; /* 31 SGs maximum in one burst */

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-dmaengine-=
support-wider-dma-masks-v1-0-3732f1f9d9ca@analog.com?part=3D2
