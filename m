Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D002330567D
	for <dmaengine@vger.kernel.org>; Wed, 19 Aug 2026 17:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787161640; cv=none; b=Bfq7K0xP3R8Bq+IH8zunPBrvkmd/9zhlj8YNFARsPY0EjHfg+gFL5t6+onBahFBQImk/TC7c84J9nPLkRTHiHsDYBq0nKit0Pbri5N5QpL+s0oYOHCCdsgFruCbhG2YxuHk2z9vCPhyXXUha6Tl2vBL5KdmxnPTQUTtBvyrv/Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787161640; c=relaxed/simple;
	bh=09SG728n2ptTkehLlxn9LgNj1ep4YwfYfnZi4POtWMI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YjGNnuuAwLWkq/m9aR22CoPfhap9uzBasvYVcwoy1F8cVP66GWw8ynSVHWfPY/FlieJk1O4fkfPQrzMqwcV53FH0svD0ybF3DM68Y5L4kkWD+WPlmCgTeT3lVr/bYI6TC6nPO5FXgJ6dAop5QJu+lr5eKOYpQ1hgFZNC2D70eYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VcnwyTCt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VcnwyTCt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 892A91F00A3A;
	Wed, 19 Aug 2026 17:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787161638;
	bh=RXDF7g9hL6zKpSGJgaIQubr+9k0MXP1Rf0K2fvg8cv0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VcnwyTCtaGqrPJ6Hw49f8p7mxmuzswa2lLYAQcTPZPyeSLuBU2it/AKFWyVzqteDd
	 ST2HXg2MuSZufQcCK2qFd2yK+rpScJTyH4ewkHdEEJjSW72j+zI2jSZQsHhqIPmgBt
	 ModFCxtg33faQezPKX7rQIFFO/ExRSUOiPN25E489G4lPdTcyLrH5oGnHcDaEqdo8P
	 nK/rZw5oix2fQjqe/3hrIHa6QVJOIIyeCkdejMjOSTja7UKpjd04OHpsl/XvylYmUB
	 KnIt9fp7B22nIu9iwlJS/aJfqY6VQbEQEl3DUG2SibEzT6FZDRIOH2rxUSPVyB4X1A
	 o8Hys3vK7bDSw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V6 2/4] dmaengine: xilinx_dma: Move descriptors to done
 list based on completion bit
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Neeli" <srinivas.neeli@amd.com>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260818174151.1608971-3-srinivas.neeli@amd.com>
References: <20260818174151.1608971-1-srinivas.neeli@amd.com>
 <20260818174151.1608971-3-srinivas.neeli@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 17:47:18 +0000
Message-Id: <20260819174718.892A91F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Unconditional transition to `chan->idle =3D true` while `active_li=
st` is not empty causes a permanent DMA stall and unsafe writes to active h=
ardware registers.
- [High] Missing `dma_rmb()` after reading the hardware descriptor completi=
on bit allows speculative reads of stale descriptor fields.
--

--- Patch [2]: [PATCH V6 2/4] dmaengine: xilinx_dma: Move descriptors to do=
ne list based on completion bit ---
commit f3afd1d99816a230e330fe49141913c537fd8bc9
Author: Srinivas Neeli <srinivas.neeli@amd.com>

dmaengine: xilinx_dma: Move descriptors to done list based on completion bit

This commit updates the descriptor completion logic to check the completion
bit before moving MCDMA descriptors from the active list to the done list.
This addresses an issue where interrupt coalescing could cause uncompleted
descriptors to be erroneously reported as complete.

> diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_=
dma.c
> index 965fb69a2a3ad..9b8b6f1acd4ea 100644
> --- a/drivers/dma/xilinx/xilinx_dma.c
> +++ b/drivers/dma/xilinx/xilinx_dma.c
> @@ -1773,6 +1773,17 @@ static void xilinx_dma_complete_descriptor(struct =
xilinx_dma_chan *chan)
>  					      struct xilinx_axidma_tx_segment, node);
>  			if (!(seg->hw.status & XILINX_DMA_BD_COMP_MASK) && chan->has_sg)
>  				break;
> +		} else if (chan->xdev->dma_config->dmatype =3D=3D XDMA_TYPE_AXIMCDMA) {
> +			struct xilinx_aximcdma_tx_segment *seg;
> +			u32 status;
> +
> +			seg =3D list_last_entry(&desc->segments,
> +					      struct xilinx_aximcdma_tx_segment,
> +					      node);
> +			status =3D (chan->direction =3D=3D DMA_DEV_TO_MEM) ?
> +				seg->hw.s2mm_status : seg->hw.mm2s_status;
> +			if (!(status & XILINX_DMA_BD_COMP_MASK))
> +				break;

[Severity: High]
If this breaks early and leaves uncompleted descriptors in the active list,=
 does
it cause issues with the interrupt handler?

Looking at xilinx_mcdma_irq_handler(), it unconditionally calls
start_transfer():

	xilinx_dma_complete_descriptor(chan);
	chan->idle =3D true;
	chan->start_transfer(chan);

If xilinx_mcdma_start_transfer() is called while the DMA is still actively
processing the old chain, it will write the new descriptor chain to the CDE=
SC
register:

	/* Program current descriptor */
	xilinx_write(chan, XILINX_MCDMA_CHAN_CDESC_OFFSET(chan->tdest),
		     head_desc->async_tx.phys);

Could writing to the CDESC register while the channel is still running caus=
e a
permanent DMA stall or corrupt the hardware state?

[Severity: High]
Is a read memory barrier needed after reading the hardware descriptor
completion bit?

If the completion mask is set, the code may proceed to calculate the transf=
er
residue in xilinx_dma_get_residue():

	residue -=3D aximcdma_hw->s2mm_status & chan->xdev->max_buffer_len;

Without a dma_rmb() between checking the completion bit and reading the
preceding segments' status fields, is it possible for weakly ordered
architectures to speculatively read stale values, leading to incorrect
residue calculations?

>  		}
>  		if (chan->has_sg && chan->xdev->dma_config->dmatype !=3D
>  		    XDMA_TYPE_VDMA)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818174151.1608=
971-1-srinivas.neeli@amd.com?part=3D2
