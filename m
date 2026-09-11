Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F534A8FC0
	for <dmaengine@vger.kernel.org>; Fri, 11 Sep 2026 17:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789148387; cv=none; b=V+tmbgz4oMTkk6Po62GF/afjdU684CMxGlY+YOySy5Vm/S8/psOAVMFhM541RySA7n8jjWhjvJMXjLy/oMMVyZ4hgfguZ6gQOai6/e+TQaV9gjV/wZX3zoKormlCe/dBzfxzLZqv6Gih41Z94x2SlTNTf+JyWCUMV7SK7UksXWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789148387; c=relaxed/simple;
	bh=lUBhyIm6jaPfxni7ZiF/rei3LqTYwATucXyRW4x5oyI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=p3VndMZtphMK6eFl78VQtjHK+Vtbec29L+wEbxNRohMXIK7wi54UyTIipHZ/aqfchq+pEZouXcbldEQPaERYOlUXDLCUZx1oQSqvqhBDmGCH15J3Ak6Sb/M9468px9Bu022l5mx2C2fitiyFQ5WcLyQFKe97/NE0G/m5NOUJ5PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WTceBBsS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WTceBBsS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B05371F000FF;
	Fri, 11 Sep 2026 17:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789148385;
	bh=GgZrnPLRTQ5Acf4dkvAt4om3yIuEO0BklJYB4dHzhi0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WTceBBsS+BEqes8o87dbmwsyErBz0IFyKMtp7nqqSBkZdLKhcItmMfEh3XRFcaNZW
	 4qOZZBvSWzg8jyzbzYdzW15Dno2cfJH43CrGtHhSPaX1iDf1H7hF0emHAla8EBktKD
	 nh0VzmcAHAUJToSfZK/xLqHsholtmqfKO2nvlyNzTnvks0QLsvWg+RZcN9GgSD3QOD
	 Cbq9LhbADBw8U2ULCg27XOf31jRD8y9t6FjTbCR2gTAl4uGIxkMoqmee9OBUSbUWkR
	 vjmWMbdHtLz9YcsmFEuzfVXpeyBg9Xz+HxgPKl0ZjqsaUujHi/GoCIfQqW0wLTgDBv
	 KClygdgA7+OCQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 03/10] dmaengine: dma-axi-dmac: Use bus width
 capability helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TnVubyBTw6E=?= <nuno.sa@analog.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260911-dmaengine-support-wider-dma-masks-v4-3-72b8fd4cc78e@analog.com>
References: <20260911-dmaengine-support-wider-dma-masks-v4-0-72b8fd4cc78e@analog.com>
 <20260911-dmaengine-support-wider-dma-masks-v4-3-72b8fd4cc78e@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 17:39:44 +0000
Message-Id: <20260911173944.B05371F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incorrect assignment of byte alignment to log2 alignment shift fie=
ld (copy_align)
--

commit 0bfee90ef28dc903c00f72e9bd5881ba53dcd68f
Author: Nuno S=C3=A1 <nuno.sa@analog.com>

dmaengine: dma-axi-dmac: Use bus width capability helpers

This commit updates the dma-axi-dmac driver to use the new
dma_bus_width_set() helper instead of open-coding the legacy BIT() mask for
source and destination bus widths. It also updates the channel width members
to use the proper enum dma_slave_buswidth type, allowing the driver to
express widths of 32 bytes and above.

> diff --git a/drivers/dma/dma-axi-dmac.c b/drivers/dma/dma-axi-dmac.c
> --- a/drivers/dma/dma-axi-dmac.c
> +++ b/drivers/dma/dma-axi-dmac.c
[ ... ]
> @@ -1262,8 +1263,13 @@ static int axi_dmac_probe(struct platform_device *=
pdev)
>  	dma_dev->device_terminate_all =3D axi_dmac_terminate_all;
>  	dma_dev->device_synchronize =3D axi_dmac_synchronize;
>  	dma_dev->dev =3D &pdev->dev;
> -	dma_dev->src_addr_widths =3D BIT(dmac->chan.src_width);
> -	dma_dev->dst_addr_widths =3D BIT(dmac->chan.dest_width);
> +	ret =3D dma_bus_width_set(dma_dev->src_bus_widths, dmac->chan.src_width=
);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D dma_bus_width_set(dma_dev->dst_bus_widths, dmac->chan.dest_widt=
h);
> +	if (ret)
> +		return ret;
>  	dma_dev->directions =3D BIT(dmac->chan.direction);
>  	dma_dev->residue_granularity =3D DMA_RESIDUE_GRANULARITY_DESCRIPTOR;
>  	dma_dev->max_sg_burst =3D 31; /* 31 SGs maximum in one burst */

[Severity: High]
This isn't a bug introduced by this patch, but while evaluating bus width
capabilities in axi_dmac_probe(), is there an existing issue with how
copy_align is assigned further down in the function?

Looking at axi_dmac_probe(), we have this assignment:

	dma_dev->copy_align =3D (dmac->chan.address_align_mask + 1);

The copy_align field requires an enum dmaengine_alignment, which represents
the base-2 logarithm of the byte alignment (e.g. DMAENGINE_ALIGN_8_BYTES =
=3D 3).

By assigning it the exact byte count instead of the log2 shift, any
subsystem evaluating 1 << copy_align will compute excessively large
alignment constraints (for example, 1 << 8 =3D 256 bytes instead of 8).

For a 32-byte bus width, could this lead to undefined behavior in C since
the shift count equals or exceeds the width of the default integer type?
This might cause zero alignment enforcement and subsequent hardware excepti=
ons
when unaligned buffers are passed to the DMA controller.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-dmaengine-=
support-wider-dma-masks-v4-0-72b8fd4cc78e@analog.com?part=3D3
