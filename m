Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A4B3A5E84;
	Fri,  9 Oct 2026 05:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791523828; cv=none; b=cXUGt/8e8QlruOZHqvBSx+zwrKPlIJNPcWHa7+vYn0qKhxUoKvCr0xvS7U2Pe241iIIRVgGHcl+UxIlSDQ3XlAPYThj9RvhlZE0AciL56G5onDqrNj6kFLlIT8Zixz7+nyBjf5mGqD+dvu6Sf9P1+KdXXMQHSdmTjqvj0fZa8Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791523828; c=relaxed/simple;
	bh=UpBCzpOLGJK745do5vgT+btC0auP5yAIq6Xz82g5fIM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=XlCBr9CifiYJNBSdiOCZN7JJVQjH8YXW28DBwR5DmcfvrwQc44Lb97jUHs28DjRl8rBeS/ZVb1Wyj91X52a7i+WqSZ/jcUY5zcxyR2xB7jFcResfNtMBwxvuWWCwmPYBK1Amcm3e/cg3sjdIb1+U/uGuvmGhOwseRgWTbvNXDy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pg8KEaD+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pg8KEaD+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 611EC1F000FF;
	Fri,  9 Oct 2026 05:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791523826;
	bh=5C8VIy6q64JkdnLVpfm8PY0pugBmVq4YmlL7XGyLTKg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Pg8KEaD+3jVG2istfX+hZ1StGkaBTNjjod50SFtMq57An2y5kBwx8d1zP/45AoRVV
	 RKVb7EDZ8D/zUk9GjKsGAF09Lbl4pNfVSXZ6NISjnWZ6kZM4XJ/b242TWWdosx73RT
	 GdgmwjTL71TrF5pNO3ZW4ugi0PtBruUUJ6KIaw6A9pTZgoNX4vTfunxephnFsB9An+
	 9AIctN5kfuxoW37BFqABKfK40jhMNo3hEblAdpxSsbt/+n3McmwVIBRsNXGX6+u6aV
	 zutohasQry+nKgg9KuYjA/TAYnGBoW4TtaQqjdy4UcUtA7Ck5K1qcmO7hndAGeJEsK
	 NZ37EPH4+RXbg==
Message-ID: <sashiko-outbox-164899@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/6] dmaengine: arm-dma350: Add slave and cyclic
 transfer support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jelly Jia" <Jelly.Jia@cixtech.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org, vkoul@kernel.org, robh@kernel.org
In-Reply-To: <20261009051846.1115962-3-Jelly.Jia@cixtech.com>
References: <20260907033404.596839-1-Jelly.Jia@cixtech.com>
 <20261009051846.1115962-1-Jelly.Jia@cixtech.com>
 <20261009051846.1115962-3-Jelly.Jia@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 05:30:25 +0000
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] dma: inaccurate cyclic residue reporting omits hardware progress
- [High] dmaengine: arm-dma350: Missing DMA sync for command list after CPU=
 writes
- [High] dmaengine: arm-dma350: TOCTOU race in SG residue calculation
- [Medium] dma: DEV_TO_MEM trigger block size ignores maxburst configuration
- [Medium] dmaengine: arm-dma350: false DMA_RESIDUE_GRANULARITY_BURST for c=
yclic transfers
--

commit 2323319884614c7159efde4dd0a7bd92ada52a37
Author: Jelly Jia <Jelly.Jia@cixtech.com>

dmaengine: arm-dma350: Add slave and cyclic transfer support

This commit adds DMA slave support to the Arm DMA-350 driver. It enables
scatter-gather and cyclic transfers, handles address translations and cachi=
ng,
and reworks the completion logic for the new descriptor types.

> diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
> index 4e17130de6c87..bbcf4071c3e75 100644
> --- a/drivers/dma/arm-dma350.c
> +++ b/drivers/dma/arm-dma350.c

[ ... ]

> @@ -212,9 +256,419 @@ static inline struct d350_desc *to_d350_desc(struct=
 virt_dma_desc *vd)
>  	return container_of(vd, struct d350_desc, vd);
>  }
> =20
> +static void d350_free_cmds(struct device *dev, struct d350_desc *desc)
> +{
[ ... ]
> +static int d350_alloc_cmds(struct dma_chan *dchan, struct d350_desc *des=
c,
> +			   size_t ncmds)
> +{
[ ... ]
> +	desc->cmds =3D kmalloc(desc->cmds_size, GFP_NOWAIT);
> +	if (!desc->cmds)
> +		return -ENOMEM;
> +
> +	desc->cmds_dma =3D dma_map_single(dev, desc->cmds, desc->cmds_size,
> +					DMA_TO_DEVICE);

[Severity: High]
This code maps the command list memory for DMA (which performs a cache
clean) before any commands are actually written to it.

Later, in d350_prep_slave_sg() and d350_prep_dma_cyclic(), the CPU populates
desc->cmds:

> +static struct dma_async_tx_descriptor *
> +d350_prep_slave_sg(struct dma_chan *dchan, struct scatterlist *sgl,
[ ... ]
> +		if (sg_len > 1) {
> +			cmd =3D desc->cmds + i * D350_SLAVE_CMD_WORDS;
[ ... ]
> +		d350_fill_slave_cmd(dch, desc, cmd, mem, dev_dma_addr, len,
> +				    link, link_addr, direction, width, maxburst,
> +				    donetype);

Is a dma_sync_single_for_device() call missing after these writes?

Because the mapping and its associated cache flush occur before the CPU wri=
tes
the command data, the new commands may remain in the CPU cache. When the DMA
controller fetches subsequent commands from RAM, it could read stale memory.
I noticed this is intentionally fixed later in the patch series, but could
it be squashed here to prevent a broken intermediate state?

[ ... ]

> +static void d350_fill_slave_cmd(struct d350_chan *dch, struct d350_desc =
*desc,
> +				u32 *cmd, dma_addr_t mem, dma_addr_t dev_dma_addr,
> +				size_t len, bool link, dma_addr_t link_addr,
> +				enum dma_transfer_direction direction,
> +				enum dma_slave_buswidth width, u32 maxburst,
> +				enum ch_ctrl_donetype donetype)
> +{
> +	bool mem_to_dev =3D direction =3D=3D DMA_MEM_TO_DEV;
[ ... ]
> +	trigcfg =3D FIELD_PREP(CH_TRIGINCFG_BLKSIZE,
> +			     mem_to_dev ? maxburst - 1 : 0) |

[Severity: Medium]
For DEV_TO_MEM transfers (mem_to_dev =3D=3D false), the block size is
unconditionally hardcoded to 0, completely ignoring the requested maxburst.

The commit message states that the trigger input is programmed with a
"per-direction block size matching the configured maxburst." Does this
mismatch between the peripheral's FIFO watermark and the DMA controller's
fetch size degrade performance or stall the transfer?

[ ... ]

> @@ -339,6 +795,54 @@ static u32 d350_get_residue(struct d350_chan *dch)
>  	return res << dch->desc->tsz;
>  }
> =20
> +static u32 d350_get_sg_residue(struct d350_chan *dch)
> +{
[ ... ]
> +	/* The channel may step the link pointer between the two reads */
> +	hi_new =3D readl_relaxed(dch->base + CH_LINKADDRHI);
> +	do {
> +		linkaddrhi =3D hi_new;
> +		linkaddr =3D readl_relaxed(dch->base + CH_LINKADDR);
> +		hi_new =3D readl_relaxed(dch->base + CH_LINKADDRHI);
> +	} while (linkaddrhi !=3D hi_new && --retries);
> +
> +	next_cmd =3D (linkaddr & ~CH_LINKADDR_EN) | ((u64)linkaddrhi << 32);
> +
> +	if (!next_cmd) {
> +		cmd =3D desc->ncmds - 1;
> +	} else {
> +		for (i =3D 1; i < desc->ncmds; i++) {
> +			if (next_cmd =3D=3D desc->cmds_bus + i * cmd_size) {
> +				cmd =3D i - 1;
> +				break;
> +			}
> +		}
> +		if (i =3D=3D desc->ncmds)
> +			return dch->residue;
> +	}
> +
> +	residue =3D d350_get_residue(dch);
> +	for (i =3D cmd + 1; i < desc->ncmds; i++)
> +		residue +=3D desc->cmd_len[i];
> +
> +	return residue;
> +}

[Severity: High]
Could the DMA controller advance to the next command between the CH_LINKADDR
reads and the CH_XSIZE read in d350_get_residue()?

If the hardware advances, CH_XSIZE will reflect the new command's remaining
bytes, but the calculation here adds them to the previous command's length.
This would double-count the new command's bytes, causing the reported resid=
ue
to increase rather than remaining strictly monotonic decreasing.

Should the driver read CH_LINKADDR again after CH_XSIZE to verify it hasn't
changed?

[ ... ]

> @@ -369,7 +873,20 @@ static void d350_synchronize(struct dma_chan *chan)
> =20
>  static u32 d350_desc_bytes(struct d350_desc *desc)
>  {
> -	return ((u32)desc->xsizehi << 16 | desc->xsize) << desc->tsz;
> +	return desc->bytes;
> +}
> +
> +static u32 d350_get_cyclic_residue(struct d350_desc *desc)
> +{
> +	return desc->bytes - desc->period * desc->period_len;
> +}

[Severity: High]
Does this calculation omit the intra-period transferred bytes by entirely
ignoring the hardware transfer progress (CH_XSIZE)?

[Severity: Medium]
Because this relies solely on software period counters, it only provides
period-level granularity. The driver explicitly advertises
DMA_RESIDUE_GRANULARITY_BURST in d350_probe():

> @@ -568,23 +1107,32 @@ static int d350_probe(struct platform_device *pdev)
[ ... ]
>  	dmac->dma.residue_granularity =3D DMA_RESIDUE_GRANULARITY_BURST;

Does the omission of hardware progress cause audio pointer updates in ALSA
to jump in large discrete steps, leading to stuttering or underruns?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009051846.1115=
962-1-Jelly.Jia@cixtech.com?part=3D2
