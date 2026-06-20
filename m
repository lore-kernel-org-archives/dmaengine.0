Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E008A18A92F
	for <dmaengine@vger.kernel.org>; Sat, 20 Jun 2026 20:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781988460; cv=none; b=rElmclHJbxNAYoR2mHDtqFk+2AvtWzee54Bxq56jyTjkIL/jktoilo556+q8Da7x1IAgvCdkkYa3DTH27GHkh1pPPbW28OkPCPhJw5ESsR9JwPVLKGO7+S+IQ7GJ6NPdbTbhjbUU8hpo1uLEGSCoJTEzOP9c3vwHTGHsRh6Ppbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781988460; c=relaxed/simple;
	bh=D2FazJvQ4DdaBbZqQE6QDyr4aIvd8PN8XprpZ2TE2y0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aYq7g9Xfr4UEkO0JvG88so+ucTYEvHMBgvFeRa/1lK/BHm/s9/Hdge4ZUQi3ogmbm7MN9MuqAj7UhCgYtl7hUU6NSk+6QFmbRAxOn1qgv076tq+SWU7ba4JenXLIfTqyp3flPklardFHqGTVYxqvO9YpX9anZG5T17CLmx/J5ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XAIRB+iQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XAIRB+iQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 462EE1F000E9;
	Sat, 20 Jun 2026 20:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781988458;
	bh=1FFeNlvV9Fef8dVVOsJEUXpFjNZ+SoZvBk36H8T0zCw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XAIRB+iQ1cVcT7u9nU814s7rUaYD7Qe5ElwMGpz/tyVWKxZtbbEJ7MZjz1Uf4I8No
	 /j1UYuwyZhz4edgzDssnT3FzA6c3SBl4/Z7K5IywwFpDqJNnhj9YUAuGlcpA+8SPTQ
	 uUT9OhW8VuByQ9SlYv2ZYLgYxj1344kxVY7Vu+ue+HS9u8zCsInwCPD3SWxbl2n3vm
	 X5Sotd7VbF0xQXTYJ0/QzGxojy7DG5bVpKNaGnj2ACJmFD5M8At84SxI2tqMhRGPF2
	 qnTG/DgZVGvYmnNZPHNlQ456uo2XblBaREifi9AdTFzUPellN+BE7/cBSeg3wqDX1V
	 Kpq4RRDLkvDBw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND 2/3] dmaengine: xilinx_dma: Enable transfer
 chaining for AXIDMA and MCDMA by removing idle restriction
Reply-To: sashiko-reviews@lists.linux.dev
To: "Suraj Gupta" <suraj.gupta2@amd.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260620203417.4000360-3-suraj.gupta2@amd.com>
References: <20260620203417.4000360-1-suraj.gupta2@amd.com>
 <20260620203417.4000360-3-suraj.gupta2@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 20 Jun 2026 20:47:37 +0000
Message-Id: <20260620204738.462EE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Critical] Removing the channel idle check unconditionally overwrites har=
dware registers in Direct (non-SG) mode, corrupting active transfers.
- [Critical] Appending new transfers to a running Scatter-Gather chain brea=
ks the hardware descriptor chain, as new descriptors are never physically l=
inked in memory.
- [High] Updating the interrupt coalesce threshold while the channel is act=
ive uses a partial descriptor count, disrupting interrupt generation.
--

commit 59ccde00ae0d672019658b79ee8d2055ebb8fa7a
Author: Suraj Gupta <suraj.gupta2@amd.com>

dmaengine: xilinx_dma: Enable transfer chaining for AXIDMA and MCDMA by rem=
oving idle restriction

This commit removes the idle check in xilinx_dma_start_transfer() and
xilinx_mcdma_start_transfer() to allow queuing new transfers while the
channel is busy. It also updates the CURDESC register only when the active
list is empty in scatter-gather mode, relying on the hardware tail pointer
extension mechanism to handle chaining.

> diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_=
dma.c
> index ca396b7097427..35b553ee3205c 100644
> --- a/drivers/dma/xilinx/xilinx_dma.c
> +++ b/drivers/dma/xilinx/xilinx_dma.c
> @@ -1580,9 +1580,6 @@ static void xilinx_dma_start_transfer(struct xilinx=
_dma_chan *chan)
>  		return;
>  	}
> =20
> -	if (!chan->idle)
> -		return;
> -

[Severity: Critical]
Does removing this early return cause active transfers to be corrupted in
Direct (non-SG) mode?

Without the idle check, xilinx_dma_start_transfer() can proceed while a
transfer is running. In Direct DMA mode (has_sg is false), the code falls
through and executes:

    xilinx_write(chan, XILINX_DMA_REG_SRCDSTADDR,
                 xilinx_prep_dma_addr_t(hw->buf_addr));

    dma_ctrl_write(chan, XILINX_DMA_REG_BTT,
                   hw->control & chan->xdev->max_buffer_len);

Could this unconditionally overwrite the active hardware registers if a
transfer is already in progress?

Additionally, moving the newly queued descriptor into active_list appears to
cause xilinx_dma_complete_descriptor() to prematurely complete newly append=
ed
descriptors, because the loop break condition is skipped for non-SG mode:

    if (!(seg->hw.status & XILINX_DMA_BD_COMP_MASK) && chan->has_sg)
        break;

[Severity: Critical]
Can appending new transfers to a running Scatter-Gather chain break the
hardware descriptor chain?

When the idle check is removed, we update the TAILDESC register to append
transfers on-the-fly. However, the Xilinx AXI DMA engine requires SG
descriptors to be physically linked in memory via their next_desc pointers.

In the driver, descriptor linking occurs in append_desc_queue():

    if (list_empty(&chan->pending_list))
        goto append;
    ...
    tail_desc =3D list_last_entry(&chan->pending_list, ...);

Since start_transfer() moves all queued descriptors to chan->active_list and
leaves pending_list empty, a subsequent submission will find an empty
pending_list.

Will this cause it to skip linking its next_desc pointer to the tail of the
actively running descriptor chain in active_list?

When the DMA engine reaches the end of the original active chain, it might
follow a stale next_desc pointer instead of the physically unlinked new
descriptors.

>  	head_desc =3D list_first_entry(&chan->pending_list,
>  				     struct xilinx_dma_tx_descriptor, node);
>  	tail_desc =3D list_last_entry(&chan->pending_list,
> @@ -1599,7 +1596,7 @@ static void xilinx_dma_start_transfer(struct xilinx=
_dma_chan *chan)
>  		dma_ctrl_write(chan, XILINX_DMA_REG_DMACR, reg);
>  	}
> =20
> -	if (chan->has_sg)
> +	if (chan->has_sg && list_empty(&chan->active_list))

[Severity: High]
Does updating the interrupt coalesce threshold while the channel is active
disrupt interrupt generation?

The driver updates the hardware interrupt coalesce threshold using
chan->desc_pendingcount before writing to the DMACR register:

    if (chan->desc_pendingcount <=3D XILINX_DMA_COALESCE_MAX) {
        reg &=3D ~XILINX_DMA_CR_COALESCE_MAX;
        reg |=3D chan->desc_pendingcount << XILINX_DMA_CR_COALESCE_SHIFT;
    }

With the removal of the idle check, this function now executes while
descriptors are actively running. Since desc_pendingcount is reset to 0 at
the end of each start_transfer() call, it now only represents the number
of newly submitted descriptors in the latest pending_list batch.

Will overwriting the active coalesce threshold with this potentially much
smaller partial count disrupt the DMA engine's interrupt generation and cau=
se
erratic coalescing behavior?

>  		xilinx_write(chan, XILINX_DMA_REG_CURDESC,
>  			     head_desc->async_tx.phys);
>  	reg  &=3D ~XILINX_DMA_CR_DELAY_MAX;

[ ... ]

> @@ -1660,9 +1657,6 @@ static void xilinx_mcdma_start_transfer(struct xili=
nx_dma_chan *chan)
>  	if (chan->err)
>  		return;
> =20
> -	if (!chan->idle)
> -		return;
> -

[Severity: Critical]
Does MCDMA suffer from the same unlinked descriptor chain vulnerability when
TDESC is updated while active?

Like xilinx_dma_start_transfer(), appending new transfers to a running
Scatter-Gather chain might break the hardware descriptor chain because the
new descriptors are not physically linked in memory to the active list.

>  	if (list_empty(&chan->pending_list))
>  		return;
> =20
> @@ -1685,8 +1679,9 @@ static void xilinx_mcdma_start_transfer(struct xili=
nx_dma_chan *chan)
>  	dma_ctrl_write(chan, XILINX_MCDMA_CHAN_CR_OFFSET(chan->tdest), reg);
> =20
>  	/* Program current descriptor */
> -	xilinx_write(chan, XILINX_MCDMA_CHAN_CDESC_OFFSET(chan->tdest),
> -		     head_desc->async_tx.phys);
> +	if (chan->has_sg && list_empty(&chan->active_list))

[Severity: High]
Does this also overwrite the MCDMA CR coalesce field with a partial count
while the engine may be active?

    if (chan->desc_pendingcount <=3D XILINX_MCDMA_COALESCE_MAX) {
        reg &=3D ~XILINX_MCDMA_COALESCE_MASK;
        reg |=3D chan->desc_pendingcount << XILINX_MCDMA_COALESCE_SHIFT;
    }

Similar to the AXIDMA case, using desc_pendingcount here while active might
disrupt interrupt generation.

> +		xilinx_write(chan, XILINX_MCDMA_CHAN_CDESC_OFFSET(chan->tdest),
> +			     head_desc->async_tx.phys);
> =20
>  	/* Program channel enable register */
>  	reg =3D dma_ctrl_read(chan, XILINX_MCDMA_CHEN_OFFSET);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260620203417.4000=
360-1-suraj.gupta2@amd.com?part=3D2
