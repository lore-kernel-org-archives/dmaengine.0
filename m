Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E45928643A
	for <dmaengine@vger.kernel.org>; Tue, 14 Jul 2026 07:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784013764; cv=none; b=Xcp1JfzlfrgbOyioVd1qz+9+Rb59iVVs1QH2JvmgM1SN9vBmbA9/8rWHFzMAGtnenU70RjwuIX9zPVjpsT9Nw7uaZX47nCzFbXeJQaq6PpbHZtnU1mnaenEM5g/amUrR5EGQS2L53sMTvJpsfMgm+dXYuGmucyaZFfOhn6hA3d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784013764; c=relaxed/simple;
	bh=G1rmEB7n78BtoIjhDECShH2vk3lnDwLctfNC8yfZRlU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PHFY2+FQ7H7oxUfGrQLV8tpFu4ixLLhQ59eKufhbe68oz4G3rxoPkSQq4rvmFgiDj3VmwobXXO5fFe6UD36bvQeceCcwC6hAUT9kVcAR/GGMG3j8ScBRnmPkVBnrU8LPvraqAvErqMWpND1Vtyev8dh2XGD/A9Cj5tlg0jnEaX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GigJ0Mkr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GigJ0Mkr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACE7D1F000E9;
	Tue, 14 Jul 2026 07:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784013762;
	bh=kdHP1MVkuDIYMrWRGS7wnCNcPPB3a060BbbgUB/5Lus=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GigJ0MkrPqRM5Mh60mQSDk5WyN0uyZ9SLBCDdiMG0lVVcG5n3w3vgF+E5XxSsRgds
	 aobiqXmXLfqVlaBxi98X9pwteEOj1ivfBEC++k2WgSQ9726ypP9sO/+5YTUobrqtxH
	 sV+B9EOFd9d86ivVan518L0OwUuYaKOP7cTEB4aAk5jUx383c9ulvYDOX9KEnPUfQI
	 x30LC9MQVjkSUFj9+zK8oKmitGJI6hTtwb0gpfB3hw8yjj2mu+u0NYrc/sAN76lB+e
	 WmuA41OXGchQYGCNtAxnq9Sy3tLhRA3ic5VzG+iovo8ZctCWmC/bXsGoH0pevRoKs4
	 t2w4kZPYdBtyA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/4] dmaengine: xilinx_dma: Move descriptors to done
 list based on completion bit
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Neeli" <srinivas.neeli@amd.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260713072146.45269-3-srinivas.neeli@amd.com>
References: <20260713072146.45269-1-srinivas.neeli@amd.com>
 <20260713072146.45269-3-srinivas.neeli@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 07:22:42 +0000
Message-Id: <20260714072242.ACE7D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Unconditionally setting `chan->idle =3D true` after an early loop =
break causes the driver to incorrectly assume the DMA hardware has stopped,=
 leading to channel corruption.
- [High] Missing read memory barrier (`dma_rmb()`) after polling the DMA de=
scriptor completion bit from coherent memory.

Pre-existing issues:
- [High] MCDMA delay interrupt does not complete descriptors, causing descr=
iptors stranded on `active_list` to hang indefinitely.
--

--- Patch [2]: [PATCH v4 2/4] dmaengine: xilinx_dma: Move descriptors to do=
ne list based on completion bit ---
commit 8891a603d60f283d523f7e4fb993dc400bd9bd8e
Author: Srinivas Neeli <srinivas.neeli@amd.com>
Subject: dmaengine: xilinx_dma: Move descriptors to done list based on comp=
letion bit

This commit modifies the MCDMA completion logic to check the descriptor
completion bit before moving entries from the active list to the done list.
This addresses an issue where interrupt coalescing could cause descriptors
to be reported as completed prematurely.

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
Does this code need a read memory barrier (dma_rmb()) here?

Since the status is read from coherent memory, weakly-ordered CPU
architectures might speculatively reorder the reads of the segment payloads
and status fields to occur before the completion bit check resolves. This
could lead to reading stale, pre-transfer data from the descriptor or the
actual DMA buffer, causing incorrect residue reporting or corrupted network
packets.

[Severity: High]
Also, when this breaks early, unfinished descriptors are left in active_lis=
t.
Will this cause a DMA channel hang? Looking at xilinx_mcdma_irq_handler():

xilinx_mcdma_irq_handler() {
    ...
    if (status & XILINX_MCDMA_IRQ_IOC_MASK) {
        spin_lock(&chan->lock);
        xilinx_dma_complete_descriptor(chan);
        chan->idle =3D true;
        chan->start_transfer(chan);
        spin_unlock(&chan->lock);
    }
    ...
}

The interrupt handler unconditionally sets chan->idle =3D true and calls
chan->start_transfer(), even if active descriptors are still running due to
the early break.

Since chan->idle is true, start_transfer() attempts to program the CDESC
and TDESC registers with new, unlinked descriptors from pending_list while
the hardware is actively processing active_list, which seems invalid and
likely to cause a complete hardware desynchronization.

[Severity: High]
This is a pre-existing issue, but this patch highlights a fatal flaw for sm=
all
transfers. Unlike the standard AXI DMA handler, xilinx_mcdma_irq_handler() =
does
not invoke xilinx_dma_complete_descriptor() on a delay interrupt:

xilinx_mcdma_irq_handler() {
    ...
    if (status & XILINX_MCDMA_IRQ_DELAY_MASK) {
        /*
         * Device takes too long to do the transfer when user requires
         * responsiveness.
         */
        dev_dbg(chan->dev, "Inter-packet latency too long\n");
    }
    ...
}

If the number of submitted descriptors is below the interrupt coalescing
threshold, the hardware triggers a delay interrupt instead of an IOC interr=
upt.
Since the delay interrupt doesn't complete descriptors, trailing segments w=
ill
remain stranded in active_list indefinitely because they are never processe=
d,
causing a channel hang.

>  		}
>  		if (chan->has_sg && chan->xdev->dma_config->dmatype !=3D
>  		    XDMA_TYPE_VDMA)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713072146.4526=
9-1-srinivas.neeli@amd.com?part=3D2
