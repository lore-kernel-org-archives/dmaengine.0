Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CDAC569F1A;
	Wed,  9 Sep 2026 15:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788968136; cv=none; b=KPkrOIIcWMbZKNB+UYJKMll5k1vuDHzUVVfLKRfHsKaA73+hH3y0LIB43DQU+l3Jh5969n0M9lIkgv8Xc0o5f8HM7ihsCMyCZ6AKtvCJB11MaIXJYSzJKLCPODJXOMkE8xq8088DWekERvtqqR3nbdRg0wKYC5FwxVXMHrPFT18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788968136; c=relaxed/simple;
	bh=oVfTCXRG6PIlXP1Q7/pUi/azraL8GraEp29p8DFmo8A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZC55kGXsHEtiOsMIojY5kF+JVvMZCFRbOiK5QMJvQXuIOf+Qh72rZErf+w2eFb2bGZcgX3xPmWN5tutHxylVVbnZBIDM6NPAIj/9QL5Jcu3kZJzJjeS1n4T+nFxw5esn4p4cExOVhgNOL7f1EucV+MzmRgTTv3uZR9g6PJ9g0cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B4Q+l+8Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B4Q+l+8Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A97A1F00A3A;
	Wed,  9 Sep 2026 15:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788968134;
	bh=yCFgjji8MWSCuafdhu2FV2mbPIvOwThLLSaxoSUpYtc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B4Q+l+8QsQen3SgPYT0E5aq/YggMDf4ST5p7vD/fer5/p0uNCmnfslMXyLQGxGMce
	 eN3zrEFoHZCJNgj9eQw6ywNGiS/ROZNsEPyP3A6jRwDkoFSNd8dy4RKntZk2vlNlXF
	 NrCyJOT+ZPUVi3BD/Q50hhlPvUvv5wNwaeebw+XyJ+OsvxQZ7INljznHybVu25UMxs
	 fQUZWrO4Nb1Al5W2ZwcOo639+RibVcnxSQvFyF558kzv5Jf3+YjnHbq2mKMEb2OF1E
	 LBwYt5yoqo4atR7rtmj2MBz4B+GqVXhqFMyodLeAV+71Mi1E0al1OK4rW2tl6Gy4gM
	 w3xNXsizOS8+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 1/2] dmaengine: fsl-edma: Implement
 device_prep_peripheral_dma_vec
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QmVub8OudCBNb25pbg==?= <benoit.monin@bootlin.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, imx@lists.linux.dev, vkoul@kernel.org
In-Reply-To: <20260909-fsl-edma-dyn-sg-v9-1-60bb2e678e8f@bootlin.com>
References: <20260909-fsl-edma-dyn-sg-v9-0-60bb2e678e8f@bootlin.com>
 <20260909-fsl-edma-dyn-sg-v9-1-60bb2e678e8f@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 15:35:33 +0000
Message-Id: <20260909153534.5A97A1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Kernel panic due to division by zero when adjusting the burst =
length for unaligned DMA_DEV_TO_DEV transfers.
- [Critical] Missing parameter validation for `nb =3D=3D 0` (or `sg_len =3D=
=3D 0`) allows the allocation of an empty descriptor, leading to critical o=
ut-of-bounds access.
- [Critical] Kernel panic (BUG_ON) triggered in `dma_map_phys` when mapping=
 a DMA_DEV_TO_DEV resource because the driver passes `DMA_NONE` to `dma_map=
_resource()`.
- [High] The local `nbytes` variable is permanently reduced during vector l=
ength alignment, affecting all subsequent vectors.
- [High] Lockless modification of shared channel state during descriptor pr=
eparation causes race conditions and resource leaks.
--

commit bc7a9931f6cf0321b75f8853ea3938f42947649d
Author: Beno=C3=AEt Monin <benoit.monin@bootlin.com>

    dmaengine: fsl-edma: Implement device_prep_peripheral_dma_vec
   =20
    Add implementation of .device_prep_peripheral_dma_vec() callback to set=
up
    a scatter/gather DMA transfer from an array of dma_vec structures. Setup
    a cyclic transfer if the DMA_PREP_REPEAT flag is set.

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

[Severity: Critical]
This is a pre-existing issue, but if the direction is DMA_DEV_TO_DEV, does
fsl_edma_prep_slave_dma() eventually pass DMA_NONE to dma_map_resource()?

drivers/dma/fsl-edma-common.c:fsl_edma_prep_slave_dma() {
    ...
    switch (dir) {
    ...
    default:
        dma_dir =3D DMA_NONE;
        break;
    }
    ...
    fsl_chan->dma_dev_addr =3D dma_map_resource(dev, addr, size, dma_dir, 0=
);
    ...
}

Will passing DMA_NONE to dma_map_resource() trigger a BUG_ON() panic in the
core DMA mapping subsystem?

> +
> +	fsl_desc =3D fsl_edma_alloc_desc(fsl_chan, nb);
> +	if (!fsl_desc)
> +		return NULL;

[Severity: Critical]
This is a pre-existing issue, but does this allow the creation of an empty
descriptor if nb =3D=3D 0?

If nb =3D=3D 0, a descriptor with a 0-length flexible array is allocated.
When the DMA engine later issues the transfer, for example in
fsl_edma_xfer_desc():

    fsl_edma_set_tcd_regs(fsl_chan, fsl_chan->edesc->tcd[0].vtcd);

could this unconditionally access the nonexistent zeroth element tcd[0],
leading to out-of-bounds access?

> +	fsl_desc->iscyclic =3D flags & DMA_PREP_REPEAT;
> +	fsl_desc->dirn =3D direction;
> +
> +	if (direction =3D=3D DMA_MEM_TO_DEV) {
> +		if (!fsl_chan->cfg.src_addr_width)
> +			fsl_chan->cfg.src_addr_width =3D fsl_chan->cfg.dst_addr_width;
> +		fsl_chan->attr =3D
> +			fsl_edma_get_tcd_attr(fsl_chan->cfg.src_addr_width,
> +					      fsl_chan->cfg.dst_addr_width);

[Severity: High]
This isn't a bug introduced by this patch, but does this code modify the
shared channel state fsl_chan->cfg.src_addr_width without holding the chann=
el
lock?

If multiple threads concurrently call fsl_edma_prep_peripheral_dma_vec() on
the same channel, could they race when mutating fsl_chan->cfg.src_addr_width
and when calling dma_map_resource() in fsl_edma_prep_slave_dma() earlier,
causing a resource leak or use-after-free of active hardware mappings?

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
This is a pre-existing issue, but if the transfer direction is DMA_DEV_TO_D=
EV,
both soff and doff are 0. Since width evaluates to 0, does the modulo
operation vecs[i].len % (j * width) cause a division by zero and kernel pan=
ic?

> +					nbytes =3D j * width;

[Severity: High]
This is a pre-existing issue, but does setting nbytes =3D j * width
permanently reduce nbytes for all subsequent vectors in the loop?

If the transfer contains an unaligned vector followed by a very large vecto=
r,
the first unaligned vector permanently downgrades nbytes for the rest of the
loop since it is never reset to its original value. Could this cause the
iteration count iter to exceed hardware limits FIELD_MAX(EDMA_TCD_ITER_MASK=
),
rejecting valid transfers?

> +					break;
> +				}
> +			}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909-fsl-edma-d=
yn-sg-v9-0-60bb2e678e8f@bootlin.com?part=3D1
