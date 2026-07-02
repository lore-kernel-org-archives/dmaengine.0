Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5180044BCAA;
	Thu,  2 Jul 2026 12:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782996429; cv=none; b=L+qFGkbfNoW7UTjn5/dxNJXr7vf6ngEDcz8s8BRpV0oosRRe+JqLJ4vXQvGdvVkImsnd9pvSNarLpAnRlJkVfG5D8U2//easJybszaeyzYdnpvhqJyuj1xPU1nFKAoWlqxDA4F9VJAhDh2sWrHtNrLMvlIzpf9vO9MBU69gnyzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782996429; c=relaxed/simple;
	bh=1BD/b54BoBmDWT7cFAkhrSZ8aUMnzAqqRuAvrT9mhVk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LqY2u9/xyrsCq2HEw9CYB2RLFvrhdjoinS1lKf3RBxtgYduCC8tJ6s4l0xB6dqQAv3eLqGgYGj3CHAomOXwKhV2AkKOebIHAXiaZY0dGKowJzJTvFdy8pHvznx4khf2Re7CeN0P2Q5BI7o4QIFIAHvhg2KUmyRnFcwMP6HFhFd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kjCF6Yzv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kjCF6Yzv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC4871F000E9;
	Thu,  2 Jul 2026 12:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782996428;
	bh=ConbLvxRVi/y6YBQKzyYQZ8iKW8Fq54nPoI5dlGhJ2c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kjCF6YzvxahYCSNdLtDSvUpga9208zI8ridkOwBR9G85CfNsasNqEjCwHWM+t2UwE
	 w6fQmbL/MPqch9l+hVrh7N0JZxhSpm9pYZF0/PrA0aJ6xMtPG28tnwbO2FmFWzMFf9
	 u8At4pLAW+bx3veWTsTD+7xJHeHCNuk8zT4L7LsBnBop5bjivjldykMHj0trG4pVTZ
	 nF64XgbKzARePlC7xHHYFbJQqw02WXJ2UQi+HndIDsQsftQbLQyK2v45ZUDE/p5ULz
	 Hx0wDMnwJz2/wZrBhRdf0aXz0yzZ4sviOyDT7F8dC11kxfnwKQzxd8LwtYplxUBNXj
	 qFVXzjTD06CDg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/2] dmaengine: fsl-edma: Implement
 device_prep_peripheral_dma_vec
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QmVub8OudCBNb25pbg==?= <benoit.monin@bootlin.com>
Cc: dmaengine@vger.kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org, vkoul@kernel.org
In-Reply-To: <20260702-fsl-edma-dyn-sg-v5-1-16787185be49@bootlin.com>
References: <20260702-fsl-edma-dyn-sg-v5-0-16787185be49@bootlin.com>
 <20260702-fsl-edma-dyn-sg-v5-1-16787185be49@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 12:47:07 +0000
Message-Id: <20260702124707.AC4871F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver is vulnerable to divide-by-zero kernel panics during DM=
A preparation, primarily when handling unaligned DMA_DEV_TO_DEV transfers o=
r when slave configuration attributes are uninitialized (zero).
- [High] Passing a zero-length array (`nb =3D=3D 0` or `sg_len =3D=3D 0`) l=
eads to a zero-length allocation for a flexible array, causing an out-of-bo=
unds read/write during descriptor submission and transfer execution.
- [High] Multi-FIFO configuration is ignored for offsets in SG/vec transfer=
s, leading to negative address progression and hardware state corruption.
--

commit 19b9121b085ec8ee890fa0c25990d53b2a25758c
Author: Beno=C3=AEt Monin <benoit.monin@bootlin.com>

dmaengine: fsl-edma: Implement device_prep_peripheral_dma_vec

Add implementation of .device_prep_peripheral_dma_vec() callback to setup
a scatter/gather DMA transfer from an array of dma_vec structures. Setup
a cyclic transfer if the DMA_PREP_REPEAT flag is set.

> diff --git a/drivers/dma/fsl-edma-common.c b/drivers/dma/fsl-edma-common.c
> index bb7531c456dfa..c10190164926a 100644
> --- a/drivers/dma/fsl-edma-common.c
> +++ b/drivers/dma/fsl-edma-common.c
[ ... ]
> @@ -673,6 +673,115 @@ struct dma_async_tx_descriptor *fsl_edma_prep_dma_c=
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
> +
> +	fsl_desc =3D fsl_edma_alloc_desc(fsl_chan, nb);

[Severity: High]
This is a pre-existing issue, but does this allocation lack a check for nb =
> 0?

If nb is 0, fsl_edma_alloc_desc() allocates a descriptor with a 0-length
flexible array for tcd. Later, when the descriptor is submitted and execute=
d:

drivers/dma/fsl-edma-common.c:fsl_edma_xfer_desc() {
    ...
    fsl_edma_set_tcd_regs(fsl_chan, fsl_chan->edesc->tcd[0].vtcd);
    ...
}

This unconditionally accesses tcd[0], resulting in an out-of-bounds read.

Also, fsl_edma_link_sg() accesses prev_desc->tcd[prev_desc->n_tcds - 1], wh=
ich
would evaluate to index -1. Could this cause memory corruption or a crash if
nb is 0?

> +	if (!fsl_desc)
> +		return NULL;
> +	fsl_desc->iscyclic =3D flags & DMA_PREP_REPEAT;
> +	fsl_desc->dirn =3D direction;
> +
> +	if (direction =3D=3D DMA_MEM_TO_DEV) {
> +		if (!fsl_chan->cfg.src_addr_width)
> +			fsl_chan->cfg.src_addr_width =3D fsl_chan->cfg.dst_addr_width;
> +		fsl_chan->attr =3D
> +			fsl_edma_get_tcd_attr(fsl_chan->cfg.src_addr_width,
> +					      fsl_chan->cfg.dst_addr_width);
> +		nbytes =3D fsl_chan->cfg.dst_addr_width * fsl_chan->cfg.dst_maxburst;
> +	} else {
> +		if (!fsl_chan->cfg.dst_addr_width)
> +			fsl_chan->cfg.dst_addr_width =3D fsl_chan->cfg.src_addr_width;
> +		fsl_chan->attr =3D
> +			fsl_edma_get_tcd_attr(fsl_chan->cfg.src_addr_width,
> +					      fsl_chan->cfg.dst_addr_width);
> +		nbytes =3D fsl_chan->cfg.src_addr_width * fsl_chan->cfg.src_maxburst;
> +	}
> +
> +	for (i =3D 0; i < nb; i++) {
> +		if (direction =3D=3D DMA_MEM_TO_DEV) {
> +			src_addr =3D vecs[i].addr;
> +			dst_addr =3D fsl_chan->dma_dev_addr;
> +			soff =3D fsl_chan->cfg.dst_addr_width;
> +			doff =3D 0;

[Severity: High]
This is a pre-existing issue, but does hardcoding doff to 0 break multi-FIFO
devices?

In fsl_edma_prep_dma_cyclic(), doff is set to 4 if fsl_chan->is_multi_fifo =
is
true. Here it is hardcoded to 0. When fsl_edma_fill_tcd() calculates a
negative minor loop offset for multi-FIFO configurations:

drivers/dma/fsl-edma-common.c:fsl_edma_fill_tcd() {
    ...
    nbytes |=3D EDMA_V3_TCD_NBYTES_MLOFF(-burst);
    ...
}

Since doff is 0, the address does not advance during the minor loop, and the
negative offset continually rewinds the DMA address backwards in memory.
Can this corrupt adjacent memory or hardware registers?

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
> +		if (vecs[i].len % nbytes) {
> +			u32 width =3D (direction =3D=3D DMA_DEV_TO_MEM) ? doff : soff;
> +			u32 burst =3D (direction =3D=3D DMA_DEV_TO_MEM) ?
> +						fsl_chan->cfg.src_maxburst :
> +						fsl_chan->cfg.dst_maxburst;
> +			int j;
> +
> +			for (j =3D burst; j > 1; j--) {
> +				if (!(vecs[i].len % (j * width))) {

[Severity: High]
This is a pre-existing issue, but can this code cause a divide-by-zero pani=
c?

If direction is DMA_DEV_TO_DEV, both doff and soff are hardcoded to 0, which
makes width evaluate to 0. Then, the fallback loop calculates:
    vecs[i].len % (j * width)
resulting in a modulo by zero.

Additionally, if the vector length is perfectly aligned and the block is
skipped, the later calculation:
    iter =3D vecs[i].len / nbytes;
could divide by zero if nbytes evaluates to 0 due to uninitialized slave
address width configuration.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702-fsl-edma-d=
yn-sg-v5-0-16787185be49@bootlin.com?part=3D1
