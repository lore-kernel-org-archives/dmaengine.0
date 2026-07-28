Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E7841E6A6;
	Tue, 28 Jul 2026 14:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785248436; cv=none; b=V/Afl2ev9vjv03ovPn6OBvvIXXkTpd/gA1g9Bh6KPWbMv4ooE/TwZo2EQi39g/6jaa+lgqqw9XP6kRS8CR3A7kFf+4Q8F6wisucaXlHOm/je5BKI61mQARlLzLUdyHeuzKVnnsYMURROk+K+DhJ3IBFjhsdB0cP/K3Zss89HThA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785248436; c=relaxed/simple;
	bh=7+PqeMDwRb4540K3g9EdLpGiNsd0PHpxjapBcr3KioE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=S52ABC95kIqFNR4iHEV9nKi2vn6+jSrFo79roOILl0KeqhvCh57+ZwvOSEpODccSJPxxXrYyAlV36mWjOrU/yDAoBX4pSfdmhB3ksfitWgUo+DqwmcQD0InK4h4gRUCZJj+C0ArSyRbsK7FMtJbRtK6Zcpme3ztGdZZcQad1OeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ed252qea; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ed252qea"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA9131F00A3A;
	Tue, 28 Jul 2026 14:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785248435;
	bh=KHTxb0TNdIubUb1iioaods+AIpEz5XwNF2F9a7KTuc0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ed252qeaOO4d6Oi69n3mBZEVmHr3BpMvdrNekTyfd/u1FBDwbKk4MV+GW/xKTdD3P
	 4IFxpB0HYQ1nwHraQpEDvP8HWsQn3LR6J91EvakFVoj5qp6ZqtSX/EjZI5+Ly8q28L
	 hMA8IJNeT2cDMfucJjeoCOCPh/NljTiFvS9vmFgbJiwl+jRPM11XzDvDIROLgm2ka+
	 Z/HVeeQ0d3vGmnQlQ9/ikynSPzqPU0KfkyoEvd8iAUGjR3k/qlmOJ0p35sNH3deuKu
	 /2qMc5o70YNRvGakUadCTeDQ/uic9FP86L/Kmo2QE0QqnCze1dG78DdVeAzozSYHzx
	 q4FP9B4Pk7ilg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/2] dmaengine: fsl-edma: Implement
 device_prep_peripheral_dma_vec
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QmVub8OudCBNb25pbg==?= <benoit.monin@bootlin.com>
Cc: dmaengine@vger.kernel.org, imx@lists.linux.dev, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260728-fsl-edma-dyn-sg-v7-1-10dffb4167c2@bootlin.com>
References: <20260728-fsl-edma-dyn-sg-v7-0-10dffb4167c2@bootlin.com>
 <20260728-fsl-edma-dyn-sg-v7-1-10dffb4167c2@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 14:20:34 +0000
Message-Id: <20260728142034.BA9131F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

New issues:
- [High] Divide-by-zero kernel panic on DMA_DEV_TO_DEV transfers with unali=
gned vector lengths.
- [High] Silent truncation and massive buffer overflow when vector length i=
s smaller than peripheral width.
- [High] Missing multi-fifo and port window offset handling corrupts DMA ad=
dresses.
- [High] Out-of-bounds access and crash when called with an empty vector ar=
ray (nb =3D=3D 0).
- [Medium] State leak of the `nbytes` variable permanently degrades burst p=
erformance for subsequent vectors.

Pre-existing issues:
- [High] Remapping a channel for DMA_DEV_TO_DEV triggers a BUG_ON crash in =
dma_map_resource.
--

--- Patch [1]: [PATCH v7 1/2] dmaengine: fsl-edma: Implement device_prep_pe=
ripheral_dma_vec ---
commit 25e53feb330d50919440f251efabfde609bc03f3
Author: Beno=C3=AEt Monin <benoit.monin@bootlin.com>

dmaengine: fsl-edma: Implement device_prep_peripheral_dma_vec

This commit implements the .device_prep_peripheral_dma_vec() callback for
the fsl-edma driver. It configures a scatter/gather DMA transfer using an
array of dma_vec structures and supports cyclic transfers.

> diff --git a/drivers/dma/fsl-edma-common.c b/drivers/dma/fsl-edma-common.c
> --- a/drivers/dma/fsl-edma-common.c
> +++ b/drivers/dma/fsl-edma-common.c

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

[Severity: High]
This is a pre-existing issue, but does calling fsl_edma_prep_slave_dma() wi=
th
DMA_DEV_TO_DEV trigger a crash in the DMA mapping core?

When fsl_edma_prep_slave_dma() processes DMA_DEV_TO_DEV, it sets the local
variable dma_dir to DMA_NONE. If the channel is being repurposed and needs
remapping, it unmaps and then calls:

    fsl_chan->dma_dev_addr =3D dma_map_resource(dev, addr, size, DMA_NONE, =
0);

The DMA mapping core strictly forbids DMA_NONE and will trigger a BUG_ON if
the direction is not valid.

> +
> +	fsl_desc =3D fsl_edma_alloc_desc(fsl_chan, nb);

[Severity: High]
Can this code crash if the caller passes an empty vector array where nb =3D=
=3D 0?

If nb is 0, fsl_edma_alloc_desc() will allocate a descriptor with a 0-eleme=
nt
flexible array. When the transfer is later initiated, fsl_edma_xfer_desc()=
=20
appears to unconditionally access the first element:

    fsl_edma_set_tcd_regs(fsl_chan, fsl_chan->edesc->tcd[0].vtcd);

Could this result in an out-of-bounds read and subsequent kernel panic?

> +	if (!fsl_desc)
> +		return NULL;
> +	fsl_desc->iscyclic =3D flags & DMA_PREP_REPEAT;
> +	fsl_desc->dirn =3D direction;

[ ... ]

> +	for (i =3D 0; i < nb; i++) {
> +		if (direction =3D=3D DMA_MEM_TO_DEV) {
> +			src_addr =3D vecs[i].addr;
> +			dst_addr =3D fsl_chan->dma_dev_addr;
> +			soff =3D fsl_chan->cfg.dst_addr_width;
> +			doff =3D 0;

[Severity: High]
Are we missing the multi-fifo and port window offset handling here that is
present in fsl_edma_prep_dma_cyclic()?

In fsl_edma_prep_dma_cyclic(), doff is conditionally set to 4 if
fsl_chan->is_multi_fifo is true, or to dst_addr_width if a port window is
configured.=20

Here, doff and soff are hardcoded to 0 for the memory endpoints. When
fsl_edma_fill_tcd() applies a minor loop offset (-burst) for multi-fifo or
port window configurations, it expects the address to have incremented duri=
ng
the minor loop. With a 0 offset, wouldn't the address increment backwards on
each loop?

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

[Severity: Medium]
Will this permanently reduce the burst size for all remaining vectors in the
array if an early vector has an unaligned length?

nbytes is initialized outside the vector loop to the maximum burst size.
If vecs[i].len is unaligned, nbytes is reduced to a smaller value here.
Because nbytes is not restored to the optimal width * maxburst at the start=
 of
the next iteration, won't subsequent perfectly-aligned vectors be forced to=
 use
the reduced burst size?

> +			u32 width =3D (direction =3D=3D DMA_DEV_TO_MEM) ? doff : soff;
> +			u32 burst =3D (direction =3D=3D DMA_DEV_TO_MEM) ?
> +						fsl_chan->cfg.src_maxburst :
> +						fsl_chan->cfg.dst_maxburst;
> +			int j;
> +
> +			for (j =3D burst; j > 1; j--) {
> +				if (!(vecs[i].len % (j * width))) {

[Severity: High]
Can this modulo operation result in a divide-by-zero panic for DMA_DEV_TO_D=
EV
transfers?

For a DMA_DEV_TO_DEV transfer, the direction is not DMA_DEV_TO_MEM, so width
is set to soff. However, soff is explicitly hardcoded to 0 for DMA_DEV_TO_D=
EV
transfers just above this block.

This would result in j * width evaluating to 0, causing a divide-by-zero
exception when calculating the modulo.

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
> +
> +		iter =3D vecs[i].len / nbytes;

[Severity: High]
Could iter be evaluated to 0 if the vector length is smaller than the
peripheral width?

If vecs[i].len < width, the earlier fallback loop leaves nbytes =3D width.
The integer division vecs[i].len / nbytes will drop the remainder, resulting
in iter =3D 0.

Programming the eDMA TCD iteration count to 0 usually causes undefined
hardware behavior, sometimes executing the maximum possible iterations. Sho=
uld
there be a check to ensure iter > 0?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-fsl-edma-d=
yn-sg-v7-0-10dffb4167c2@bootlin.com?part=3D1
