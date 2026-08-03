Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EA030F526;
	Mon,  3 Aug 2026 16:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785774205; cv=none; b=b71yXXf33QTi4L15c/wrfyX/+OZcq7jn6EoYeqrIs9hAhUUORs4IXDSUEK9BK3q2eN2GapwmaMgLFS5mdtozB6R9GipBfGIoAKRu2uu3Zz6/wN4wbiKdRCPjtuD+AbyaQhpBRApno1j2YDuSDPjM83l2517QI/9g7zeBpVjFYek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785774205; c=relaxed/simple;
	bh=qyPIyHbYwUBTfUGB48o5U6VtHLXe64fA+4wO1fZWUJA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VzOJfa+bOv/c339Yys5zyt1h0i7gjrhIqH4ANwjQiV202C0qMIQ26Ts2RQGTOuEen2lT7wkgqIbGkHAqqBMNDwX/HmujgP0my0kqyH8LU9o1qcXFYdExkfCQ8FjhPhnzjHa5oopRpTA4uwKV+gd9/4xV87lSjQDSSDCQy80CVXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AqYYMXge; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AqYYMXge"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0060D1F00A3A;
	Mon,  3 Aug 2026 16:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785774204;
	bh=qMaI4ERBnaXQoC26RI0ePUCOdqUQ4mZUnKyGS6idS5o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AqYYMXge0nQmk56ediqPQXtInuRmDzP22XWylbd10OwiCOH2VZjuUsohqnDa70xM6
	 SlWR/tbahzAI+TTbeE3uZFHw3PaTERs8Mg/SkDIKH/B4AcF023sj+AqtTUXekFijrG
	 igEo2Rrn0P53dVOjQiE7tR1Os51HIZ6M0aGOkpauyCPw0bpk/4lmsNb2MjRgXrkiu6
	 lqF58/UhhEp+OEn24xI/habepYSqezYP7/9N+YfQlgDrwBxSR6GuTUBBfqxamXB+5w
	 7ExFeUqNwTISRNka07CGjoGFY8FvgvFT6oaun9U2cZyNyV1cLg0kWaOSkRhUPcfosX
	 0RPGT/u0N4rkw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 1/2] dmaengine: fsl-edma: Implement
 device_prep_peripheral_dma_vec
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QmVub8OudCBNb25pbg==?= <benoit.monin@bootlin.com>
Cc: dmaengine@vger.kernel.org, Frank.Li@kernel.org, vkoul@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260803-fsl-edma-dyn-sg-v8-1-dc2b0317206d@bootlin.com>
References: <20260803-fsl-edma-dyn-sg-v8-0-dc2b0317206d@bootlin.com>
 <20260803-fsl-edma-dyn-sg-v8-1-dc2b0317206d@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 16:23:23 +0000
Message-Id: <20260803162324.0060D1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Out-of-bounds memory access when the caller passes a 0-length vect=
or array.
- [High] Division by zero kernel panic when processing unaligned DMA_DEV_TO=
_DEV transfers.
- [High] BUG_ON kernel panic when mapping a resource for DMA_DEV_TO_DEV tra=
nsfers on a reused channel.
- [High] Silent truncation of unaligned DMA transfers leads to data corrupt=
ion.
- [Medium] State leakage of the burst size (`nbytes`) reduces performance a=
nd can cause transfer rejection for subsequent vectors.
--

--- Patch [1]: [PATCH v8 1/2] dmaengine: fsl-edma: Implement device_prep_pe=
ripheral_dma_vec ---
commit eeea1310bfd4138f851a3a95d72a197b35c5d579
Author: Beno=C3=AEt Monin <benoit.monin@bootlin.com>

dmaengine: fsl-edma: Implement device_prep_peripheral_dma_vec

This patch adds the .device_prep_peripheral_dma_vec() callback to the Frees=
cale
eDMA driver. It sets up a scatter/gather DMA transfer from an array of dma_=
vec
structures and supports cyclic transfers when DMA_PREP_REPEAT is set.

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
This is a pre-existing issue, but if this channel is reused and reconfigured
from DMA_MEM_TO_DEV to DMA_DEV_TO_DEV, fsl_edma_prep_slave_dma() will evalu=
ate
dma_dir as DMA_NONE. This causes it to bypass the early return, unmap the o=
ld
resource, and call dma_map_resource() with DMA_NONE:

fsl_edma_prep_slave_dma()
    dma_dir =3D DMA_NONE;
    ...
    fsl_chan->dma_dev_addr =3D dma_map_resource(dev, addr, size, dma_dir, 0=
);

Since DMA_NONE is not a valid mapping direction, does this trigger the
BUG_ON(!valid_dma_direction(dir)) in the DMA mapping core and crash the ker=
nel?

> +
> +	fsl_desc =3D fsl_edma_alloc_desc(fsl_chan, nb);

[Severity: High]
This isn't a bug introduced by this patch, but if nb is 0, does
fsl_edma_alloc_desc() allocate a descriptor with a 0-length tcd flexible
array?

If so, later when the hardware transfer is initiated in fsl_edma_xfer_desc(=
),
would the unconditional access to fsl_chan->edesc->tcd[0].vtcd cause an
out-of-bounds memory access?

> +	if (!fsl_desc)
> +		return NULL;

[ ... ]

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

[Severity: High]
This is a pre-existing issue, but for DMA_DEV_TO_DEV transfers, both the
source offset (soff) and destination offset (doff) are initialized to 0,
resulting in width being assigned 0.

Does this check evaluate to a modulo-by-zero operation and cause a kernel
panic?

> +					nbytes =3D j * width;

[Severity: Medium]
This isn't a bug introduced by this patch, but nbytes is modified here for =
an
unaligned vector and never restored to its optimal maximum value at the sta=
rt
of the next iteration.

Could this cause subsequent aligned vectors to incorrectly inherit this
reduced burst size, potentially degrading performance or causing the transf=
er
to be rejected if the iteration count exceeds the hardware maximum?

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
> +
> +		iter =3D vecs[i].len / nbytes;

[Severity: High]
This is a pre-existing issue, but if a vector's length cannot be perfectly
divided by any suitable burst size, nbytes is set to width.

When iter is calculated using integer division here, are any remaining
unaligned bytes silently discarded, causing the hardware to transfer fewer
bytes than requested and leading to silent data corruption?

> +		if (i < nb - 1) {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-fsl-edma-d=
yn-sg-v8-0-dc2b0317206d@bootlin.com?part=3D1
