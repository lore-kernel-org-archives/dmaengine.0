Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940C13BC685
	for <dmaengine@vger.kernel.org>; Thu,  9 Jul 2026 10:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783591885; cv=none; b=ad0TqbxCDWtQ0Ldj7ANPk/dpZOQ///laYOKPERETimro2q/dWzO/nml9/ae1/EgH/0iP+kf+Q1JW8eJzSPDrO5du3/WI5Z6kGktV9hoNlqcamcVAGsRUpA1EWGqcgiWmPfhEZ3hmlf2F/ExanBnarDz8Ge+LGsKEPfuDSgRRb1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783591885; c=relaxed/simple;
	bh=xsgd8JpadUKWXJXXai+LA14bXnjQA6ykFoyt/TbfZj0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dJf//pugmpByyQTlQoyKocd+tqP0Tb4n1ne7fOWJiZZazzh36mff5mVMg1DQCR2XSnDqHJl46ex25vnkYi/Rod7aLOZqCcD/veOU1e+j56vcYhGV9KllpDOX623xiEm7rBUzjUzkkTzCy2vUYmllkW3Rw2Mx6lIS8HNYO+7vkSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eK277kL4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eK277kL4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2F9E1F00A3D;
	Thu,  9 Jul 2026 10:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783591884;
	bh=XBy38IpjuaWtrQK/YWYoMKvQS0uQnrFonQMIVR2BESY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eK277kL4ow8ILSekRD4EKJt/HEhZ65mo7mfBksz7kUe7mWQ19WJvL45yegkHx8QdY
	 FYMEvnGUPg4rq6ujbJE5MKw+NbnqVm75Uwy6o2R+5MTzy4FxUnMhMt6iykJIDfowYs
	 OOdoTdhhkkstZ8YUJFgIB1DIQn6wPNpFIj3dztOQs1r1aToQ+SRfuZz9t99Bbcz+3A
	 +ez7Uw2TxaoyLbNfYoPXW30W7HifJ1UXVaoGvQlRhyzwjtemKc39DUL9lfIjla2mIp
	 SKizp6b09uImIxuUtplMQsCgFBoC1hvXzZUjDtH+OY5RXbwYmXS9VcGFmPDr/bzlF9
	 IpMXRjGVdU7iw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V3 2/4] dmaengine: xilinx_dma: Move descriptors to done
 list based on completion bit
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Neeli" <srinivas.neeli@amd.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260708100652.603074-3-srinivas.neeli@amd.com>
References: <20260708100652.603074-1-srinivas.neeli@amd.com>
 <20260708100652.603074-3-srinivas.neeli@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 10:11:23 +0000
Message-Id: <20260709101123.F2F9E1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Software state mismatch leading to hardware corruption and channel=
 hang in AXI MCDMA.
- [Medium] Missing read memory barrier (`dma_rmb()`) after checking the DMA=
 completion flag in coherent memory.
--

--- Patch [2]: [PATCH V3 2/4] dmaengine: xilinx_dma: Move descriptors to do=
ne list based on completion bit ---
commit d59255ad1a6d4a4beb643022da1f9820716a0752
Author: Srinivas Neeli <srinivas.neeli@amd.com>

dmaengine: xilinx_dma: Move descriptors to done list based on completion bit

In AXI MCDMA scatter-gather mode, xilinx_dma_complete_descriptor() previous=
ly
moved all active descriptors to the done list unconditionally. This commit =
adds
a check for the descriptor completion bit before moving entries, handling
scenarios where interrupt coalescing causes interrupts before all queued
descriptors are processed.

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

[Severity: Medium]
Is a read memory barrier needed after checking this completion status?

The CPU polls the s2mm_status or mm2s_status field in coherent memory to
check the completion bit. Without a dma_rmb() here, could weakly ordered
architectures speculatively execute subsequent descriptor reads out of
order?

This might result in stale reads of the descriptor fields later on
(for instance, during residue calculation) before the hardware has
actually confirmed completion.

> +				break;

[Severity: High]
Does breaking out early here create a state mismatch with the IRQ handler?

If this check breaks out leaving descriptors in the active list, the
channel is technically still running. However, looking at the call chain,
xilinx_mcdma_irq_handler() immediately forces the channel idle and
starts a new transfer:

xilinx_mcdma_irq_handler() {
    ...
    xilinx_dma_complete_descriptor(chan);
    chan->idle =3D true;
    chan->start_transfer(chan);
    ...
}

This appears to bypass the idle safety check in
xilinx_mcdma_start_transfer() and overwrite the CDESC hardware register
while the DMA engine is actively processing the remaining active list.
Could this software-splice new descriptors without establishing hardware
links, leading to a permanent channel hang?

> +		}
>  		if (chan->has_sg && chan->xdev->dma_config->dmatype !=3D
>  		    XDMA_TYPE_VDMA)
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708100652.6030=
74-1-srinivas.neeli@amd.com?part=3D2
