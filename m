Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005E0472068;
	Fri, 11 Sep 2026 13:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789133278; cv=none; b=KNGTx9G6wlNeXBUHs2bItvHKR1HXAiLIaidhTpav/bM0up84WknNcCaDrB2wxsBWX+hhrlpWGFxslQRxq57BlIw4sqpIHgVl01Kn75OE9P9rRFDE3PZfN50sIUaL/QoVpN4SQMvWtgSwlagNHzO1EEasszzp0nxCZBWo40n4oxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789133278; c=relaxed/simple;
	bh=bb6254xgmnei3js2vLHLK4MFg1wcNIcHE7bFdEPvxDk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=myD0iS0FlCyf5HnuWoazH7Ss/JzJfIt5sB+CEvi/bFUI96+BMLGP7zvZymsxHO+VEID9tFHijBYCiPe4NqMw3nEl3RMI+wnVe67WE/QVRdKzjcoq3tnsvrAqqKeoXF81mW6oC4sqxnxpoJhfeKWIKLcw1YMFwm+pPcKmbt4QpQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G60mzJvf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G60mzJvf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B36F1F000FF;
	Fri, 11 Sep 2026 13:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789133276;
	bh=AJ9tjRqEMdSdtFBQhF1d3Qho63O4SNqmDyHex4MFdhI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G60mzJvfAF4BQKVx0EVnASsCGPHdG04pNGTG2wjYWQ1by8s89DXhtLYkjVq4oxG71
	 aQNjL5qKLfJZUdn0RRwoGZ6hqf4fRYin4csGNaRFiJZvwoT6xHJ1skxmJEgiyuKP1q
	 7BlsnyfTisBsLMU5t8xgaRFJHZ+M+UK7mEa79EVRrvh7D80JNAu/KDevrLv1DNnbP4
	 OiAGFWQU/QmYPlohLldIu6Mxq7WLVWU86iuNE+ucgkhZfVwf/tMthFStOUpyLQdjHl
	 8W/DCVX204+pUXWDMv/v0AB47ofVHwmAqcCey5zY6V1UT6/vArJoYFU5eoaK0qE9FC
	 eCBS4ZA4CRm7Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 1/2] dmaengine: fsl-edma: Implement
 device_prep_peripheral_dma_vec
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QmVub8OudCBNb25pbg==?= <benoit.monin@bootlin.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260911-fsl-edma-dyn-sg-v10-1-700eb72def57@bootlin.com>
References: <20260911-fsl-edma-dyn-sg-v10-0-700eb72def57@bootlin.com>
 <20260911-fsl-edma-dyn-sg-v10-1-700eb72def57@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 13:27:56 +0000
Message-Id: <20260911132756.8B36F1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [Critical] Kernel panic: Modulo by zero during unaligned DMA_DEV_TO_DEV b=
urst calculation.
- [Critical] Arbitrary DMA Execution: 0-length vector triggers out-of-bound=
s read at tcd[0].
- [High] Data corruption: Missing multi-FIFO offset causes negative address=
 drift.
- [Medium] Logic Error: Unreset burst size artificially breaches FIELD_MAX =
limit.

Pre-existing issues:
- [High] Kernel panic: DMA_NONE direction mapping triggers BUG_ON.
--

commit 084b4b0f402eb171d6adefd8fa18c7fa25e129fb
Author: Beno=C3=AEt Monin <benoit.monin@bootlin.com>

dmaengine: fsl-edma: Implement device_prep_peripheral_dma_vec

This commit adds the implementation of the .device_prep_peripheral_dma_vec()
callback to setup a scatter/gather DMA transfer from an array of dma_vec
structures. It also supports cyclic transfers if the DMA_PREP_REPEAT flag
is set.

> diff --git a/drivers/dma/fsl-edma-common.c b/drivers/dma/fsl-edma-common.c
> index bb7531c456dfa..c5f5951c988be 100644
> --- a/drivers/dma/fsl-edma-common.c
> +++ b/drivers/dma/fsl-edma-common.c
> @@ -673,6 +673,122 @@ struct dma_async_tx_descriptor *fsl_edma_prep_dma_c=
yclic(
>  	return vchan_tx_prep(&fsl_chan->vchan, &fsl_desc->vdesc, flags);
>  }
> =20
> +struct dma_async_tx_descriptor *
> +fsl_edma_prep_peripheral_dma_vec(struct dma_chan *chan, const struct dma=
_vec *vecs,
> +				 size_t nb, enum dma_transfer_direction direction,
> +				 unsigned long flags)
> +{
> +	struct fsl_edma_chan *fsl_chan =3D to_fsl_edma_chan(chan);
> +	dma_addr_t src_addr, dst_addr, last_sg;
> +	struct fsl_edma_desc *fsl_desc;
> +	u16 soff, doff, iter;
> +	u32 nbytes;
> +	int i;
> +
> +	if (!is_slave_direction(direction))
> +		return NULL;
> +
> +	if (!fsl_edma_prep_slave_dma(fsl_chan, direction))
> +		return NULL;

[Severity: High]
This is a pre-existing issue, but does passing DMA_DEV_TO_DEV to
fsl_edma_prep_slave_dma() cause a kernel panic?

If a driver requests a DMA_DEV_TO_DEV transfer, fsl_edma_prep_slave_dma()
handles it by mapping the resource with dma_dir =3D DMA_NONE. The core DMA
mapping API (dma_map_phys via dma_map_resource) asserts
BUG_ON(!valid_dma_direction(dir)), which leads to an intentional kernel
crash.

> +
> +	fsl_desc =3D fsl_edma_alloc_desc(fsl_chan, nb);
> +	if (!fsl_desc)
> +		return NULL;

[Severity: Critical]
Is it possible for a caller to pass nb =3D=3D 0 here?

If nb is 0, fsl_edma_alloc_desc() allocates an empty descriptor with
n_tcds =3D 0. When the transfer is subsequently submitted via
fsl_edma_xfer_desc(), the engine unconditionally dereferences
fsl_chan->edesc->tcd[0].vtcd. Since tcd[0] is out-of-bounds, this will
result in a heap out-of-bounds read, potentially leading to arbitrary
DMA programming or a crash.

[ ... ]

> +	for (i =3D 0; i < nb; i++) {
> +		if (direction =3D=3D DMA_MEM_TO_DEV) {
> +			src_addr =3D vecs[i].addr;
> +			dst_addr =3D fsl_chan->dma_dev_addr;
> +			soff =3D fsl_chan->cfg.dst_addr_width;
> +			doff =3D 0;

[Severity: High]
Can this hardcoded offset cause memory corruption for multi-FIFO endpoints?

When fsl_chan->is_multi_fifo is true, fsl_edma_fill_tcd() automatically
applies a negative Minor Loop Offset (MLOFF) equal to -burst. Because doff
is set to 0 here, the destination address does not advance during the minor
loop, but is still incorrectly pulled backwards by -burst at the end of
each minor loop. This causes the destination address to drift negatively.

[ ... ]

> +		} else {
> +			/* DMA_DEV_TO_DEV */
> +			src_addr =3D fsl_chan->cfg.src_addr;
> +			dst_addr =3D fsl_chan->cfg.dst_addr;
> +			soff =3D 0;
> +			doff =3D 0;
> +		}
> +
> +		/*
> +		 * Choose the suitable burst length if dma_vec length is not
> +		 * multiple of burst length so that the whole transfer length is
> +		 * multiple of minor loop(burst length).
> +		 */
> +		if (nbytes && vecs[i].len % nbytes) {
> +			u32 width =3D (direction =3D=3D DMA_DEV_TO_MEM) ? doff : soff;
> +			u32 burst =3D (direction =3D=3D DMA_DEV_TO_MEM) ?
> +						fsl_chan->cfg.src_maxburst :
> +						fsl_chan->cfg.dst_maxburst;
> +			int j;
> +
> +			for (j =3D burst; j > 1; j--) {
> +				if (!(vecs[i].len % (j * width))) {

[Severity: Critical]
Could this result in a modulo by zero for DMA_DEV_TO_DEV transfers?

For DMA_DEV_TO_DEV, both soff and doff are 0, which means width evaluates
to 0. If the vector length is unaligned, the modulo operator will evaluate
vecs[i].len % 0, causing an immediate kernel panic via division by zero.

> +					nbytes =3D j * width;
> +					break;
> +				}
> +			}
> +			/* Set burst size as 1 if there's no suitable one */
> +			if (j =3D=3D 1)
> +				nbytes =3D width;
> +		}
> +
> +		if (!nbytes || vecs[i].len / nbytes > FIELD_MAX(EDMA_TCD_ITER_MASK))
> +			goto err_free_desc;

[Severity: Medium]
Will this erroneously reject valid transfers if nbytes is shrunk during an
earlier loop iteration?

When a vector length isn't a multiple of nbytes, nbytes is reduced to a
suitable factor. However, nbytes is never restored to its optimal value at
the start of the loop for the next vector. If a later vector in the array
is large, it will be divided by this artificially reduced nbytes, causing
the calculation to exceed FIELD_MAX(EDMA_TCD_ITER_MASK) and falsely aborting
the transfer setup.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-fsl-edma-d=
yn-sg-v10-0-700eb72def57@bootlin.com?part=3D1
