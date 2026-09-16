Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8889C477E53;
	Wed, 16 Sep 2026 08:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789547764; cv=none; b=H86wc04q238+/qKS6OQBw9oqXcN6Ccf/cWR1ejz+FeGBhy+nAr7uPZLx+GNyl9HxEuXpu9mjLFFuzKOqObwzfXOqVs5YbvOiHWoIVsyWobIJc469JgJlrBA6p339Tyj/NUmZNxvRdzAIfvV22H6WzrpAIUtKcoud9aVGgtAztKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789547764; c=relaxed/simple;
	bh=OVYsrsmEg6aUUgJqGbF1xeVRd7tVkNOihKNxPjVzHxo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IO4pv5su9e21KHVnFVXjlF7qLSdm6JCbPe+Gji2AY8AFLwpdhKAOY/pKbJ5E9G9EV6nscgG4aeh8Lyb6msacKvDwf4NG+JWo8000Vzkv7TmIAIpr8a3CFI+eqG00KMj+tsiuN9zTomp2Ym/EcFLauo4S7qsOkiY40mHuYGb/p38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G6mt1eBE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G6mt1eBE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D05C31F000FF;
	Wed, 16 Sep 2026 08:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789547763;
	bh=m9RSHPDoRADSXuYYrtqZZ+/+nektvtnx5CFsLRkEbV4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G6mt1eBEv7pxLkCEPtRpMWugLbDliG5wKvAlWgh3E0WdXeBN+iJIiPmSnoFKjC1pc
	 8l9uPs7WnTC9PA3uReN8rUbuKJha3zE1RkXbtLsW9h3j1XcBEJFOJUrJWQtaHRCAbT
	 fK8wk5ZCn9LoebpjE3Hza8vgCbTvnVquhNm75A/06G+y6NWb8kr85SWM9FdEgJYrAG
	 BpIXNQK9xW4Y3uO6vP87D6UgzBV76iIBw21uZMt07lgdx5+Qfy17cfhWFqmca255xm
	 kTWuO78BWmTEhWs+1An6AcEqN4T/OOAg+q+h54LGtoxtGS+i32A6xOzty5Ls6ray0W
	 MRHCs4q/nxgZw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 1/2] dmaengine: fsl-edma: Implement
 device_prep_peripheral_dma_vec
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QmVub8OudCBNb25pbg==?= <benoit.monin@bootlin.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260916-fsl-edma-dyn-sg-v11-1-02792de71b92@bootlin.com>
References: <20260916-fsl-edma-dyn-sg-v11-0-02792de71b92@bootlin.com>
 <20260916-fsl-edma-dyn-sg-v11-1-02792de71b92@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 08:36:02 +0000
Message-Id: <20260916083602.D05C31F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] dmaengine: fsl-edma: division by zero in unaligned DMA_DEV_TO_DEV =
transfers
- [High] dmaengine: fsl-edma: loop mutates shared nbytes causing spurious t=
ransfer failures
- [High] dmaengine: fsl-edma: missing nb =3D=3D 0 guard causes out-of-bound=
s heap read
--

commit 1a23f772b7926fbde5dc0fc2476442d47898d799
Author: Beno=C3=AEt Monin <benoit.monin@bootlin.com>

dmaengine: fsl-edma: Implement device_prep_peripheral_dma_vec

This commit adds the implementation of the .device_prep_peripheral_dma_vec()
callback to setup a scatter/gather DMA transfer from an array of dma_vec
structures. It also sets up a cyclic transfer if the DMA_PREP_REPEAT flag
is set.

> diff --git a/drivers/dma/fsl-edma-common.c b/drivers/dma/fsl-edma-common.c
> index bb7531c456dfa..8ba72b3d0e1af 100644
> --- a/drivers/dma/fsl-edma-common.c
> +++ b/drivers/dma/fsl-edma-common.c
[ ... ]
> @@ -673,6 +674,122 @@ struct dma_async_tx_descriptor *fsl_edma_prep_dma_c=
yclic(
[ ... ]
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
> +
> +	fsl_desc =3D fsl_edma_alloc_desc(fsl_chan, nb);
> +	if (!fsl_desc)
> +		return NULL;

[Severity: High]
Does this code allow an out-of-bounds heap read if `nb` is 0?

If `nb =3D=3D 0` is passed, fsl_edma_alloc_desc() will allocate a descripto=
r with a
0-length flexible array of TCDs. The setup loop `for (i =3D 0; i < nb; i++)=
` is
skipped entirely, and the empty descriptor is directly submitted to the vir=
tual
channel.

When the DMA engine tasklet processes this descriptor via
fsl_edma_xfer_desc(), it unconditionally executes fsl_chan->edesc->tcd[0].v=
tcd,
dereferencing an out-of-bounds heap address. Should there be a check for
`!nb` before allocating?

> +	fsl_desc->iscyclic =3D flags & DMA_PREP_REPEAT;
> +	fsl_desc->dirn =3D direction;
[ ... ]
> +	for (i =3D 0; i < nb; i++) {
> +		if (direction =3D=3D DMA_MEM_TO_DEV) {
> +			src_addr =3D vecs[i].addr;
> +			dst_addr =3D fsl_chan->dma_dev_addr;
> +			soff =3D fsl_chan->cfg.dst_addr_width;
> +			doff =3D 0;
> +		} else if (direction =3D=3D DMA_DEV_TO_MEM) {
> +			src_addr =3D fsl_chan->dma_dev_addr;
> +			dst_addr =3D vecs[i].addr;
> +			soff =3D 0;
> +			doff =3D fsl_chan->cfg.src_addr_width;
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

[Severity: High]
Can this result in a modulo by zero kernel panic?

During DMA_DEV_TO_DEV configuration, both `soff` and `doff` are explicitly
initialized to 0. The calculation here results in `width =3D 0`. Then the
loop below evaluates `vecs[i].len % (j * width)`, which performs modulo by
zero.

> +			u32 burst =3D (direction =3D=3D DMA_DEV_TO_MEM) ?
> +						fsl_chan->cfg.src_maxburst :
> +						fsl_chan->cfg.dst_maxburst;
> +			int j;
> +
> +			for (j =3D burst; j > 1; j--) {
> +				if (!(vecs[i].len % (j * width))) {
> +					nbytes =3D j * width;

[Severity: High]
Does this loop mutate the shared `nbytes` variable causing spurious transfer
failures?

The `nbytes` variable is used to define the optimal burst length for the en=
tire
transfer. Inside the loop, if an early vector is misaligned, the code
permanently shrinks `nbytes` (e.g., to 1 or a smaller factor) to fit that
specific vector without restoring it for the next loop iteration.

This degraded `nbytes` value leaks to all subsequent loop iterations. Large,
perfectly aligned vectors later in the array will incorrectly use the shrun=
ken
`nbytes`.

> +					break;
> +				}
> +			}
> +			/* Set burst size as 1 if there's no suitable one */
> +			if (j =3D=3D 1)
> +				nbytes =3D width;
> +		}
> +
> +		if (!nbytes || vecs[i].len / nbytes > FIELD_MAX(EDMA_TCD_ITER_MASK))

[Severity: High]
Does mutating `nbytes` above cause valid transfers to be rejected here?

As a result of permanently shrinking `nbytes` in a previous iteration,
`vecs[i].len / nbytes` can explode in magnitude and spuriously exceed
`FIELD_MAX(EDMA_TCD_ITER_MASK)` for perfectly valid DMA vectors.

> +			goto err_free_desc;
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916-fsl-edma-d=
yn-sg-v11-0-02792de71b92@bootlin.com?part=3D1
