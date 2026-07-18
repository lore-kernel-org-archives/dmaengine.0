Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E5838945A
	for <dmaengine@vger.kernel.org>; Sat, 18 Jul 2026 09:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784365771; cv=none; b=l4pr1WqCdOtwh6aRgC6qr+qBsn21nPdIsULfLMjnDIWoWtKi10nZx30rGtUW746Gmhf0covLUHKATHPwW8IdFyZac/dEwE3QkKV8E80KjXI6yVyUz7eTFJKvDuSF1bNId3AZ6fbZejd+qpm1lzLDat1NOMLvJtnoegSQWE1uwGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784365771; c=relaxed/simple;
	bh=IQ0xQTc0T6nfjDEeOfQLr3Wss4gQGS7NCYvC5w0B7V0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bnT58PByCUogOyCchzQlwnKl0B4HJ2/DcjvIW/QYX+KqC0q16hjOp/Xnb5XNymF8nuP4dcvEwZMSMx6FG2We+G9ykfXd3bSIRqdodlIfVv50dlyuN7IJ/pboRhhyO+vTwPEF+bga65pzhmkIPKDKggpTpcF/xcC2Ju4UwvMHtp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zr2uiyRj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zr2uiyRj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41A611F000E9;
	Sat, 18 Jul 2026 09:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784365769;
	bh=BOX/uLBXf0JRnj4wx4XejUJxKvjU5hx1oO9HjJXck/U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Zr2uiyRjpph0A/fm2m99s4uWNBEVhD9D/k+AGwRgdJU5SjvyF/e4wUOoK4Di+y1s1
	 6I315EwJ3xiN0TFlFnlc7s0DWSJJJ63PNSz6gL7+6Rg6r/3NFgfGmv/qBbGWnK7U3M
	 Ufl/EzSp9R0hC+SbW2c0k2YMuyUY+YlHPLozOw1ROv/DR+AWOG6cYRpYjBzvBdg2VW
	 xvjdDt9ipS3vsVRYemDlMvJF0bx067SWRNZwcyYmkNx7W8IkbXogflHEmH0FjO19mA
	 ENE76TCEd+RaxTsZ1w5RGaZR7zhhL0wDWqiU1acg/vWOsqYm7+x6BjerrjXBhU4XM+
	 UECfZnMAVQ25g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/4] dmaengine: xilinx_dma: Move descriptors to done
 list based on completion bit
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Neeli" <srinivas.neeli@amd.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260717090824.2364230-3-srinivas.neeli@amd.com>
References: <20260717090824.2364230-1-srinivas.neeli@amd.com>
 <20260717090824.2364230-3-srinivas.neeli@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 18 Jul 2026 09:09:28 +0000
Message-Id: <20260718090929.41A611F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] The interrupt handler incorrectly marks the channel as idle when `=
active_list` is not empty, causing subsequent transfers to break the hardwa=
re descriptor chain and corrupt the DMA channel.

Pre-existing issues:
- [High] Missing validation of `sg_len` in DMA prep functions leads to a NU=
LL pointer dereference or out-of-bounds access.
--

--- Patch [2]: [PATCH v5 2/4] dmaengine: xilinx_dma: Move descriptors to do=
ne list based on completion bit ---
commit 6a1e482408e190cbb8d2fe62069fd7dcc3b7565e
Author: Srinivas Neeli <srinivas.neeli@amd.com>

dmaengine: xilinx_dma: Move descriptors to done list based on completion bit

The patch adds a check for the descriptor completion bit before moving entr=
ies
from the active list to the done list for AXI MCDMA. This prevents descript=
ors
that have not been fully processed by the hardware from being falsely repor=
ted
as completed during early interrupt coalescing fires.

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

[Severity: High]
This isn't a bug introduced by this patch, but does the lack of sg_len
validation lead to out-of-bounds accesses here?

If a client driver passes sg_len =3D=3D 0 to xilinx_mcdma_prep_slave_sg() (=
or
xilinx_dma_prep_slave_sg()), the for_each_sg() loop is entirely skipped,
leaving desc->segments empty.=20

When this empty descriptor later reaches the newly added list_last_entry()
call, it yields a misaligned pointer into the desc structure, resulting in
an out-of-bounds read and memory corruption.

Additionally, back in the preparation functions, skipping the loop causes
immediate problems. In xilinx_mcdma_prep_slave_sg(), an empty segments
list causes an out-of-bounds dereference right away:

drivers/dma/xilinx/xilinx_dma.c:xilinx_mcdma_prep_slave_sg() {
    ...
    for_each_sg(sgl, sg, sg_len, i) { ... }

    segment =3D list_first_entry(&desc->segments,
                               struct xilinx_aximcdma_tx_segment, node);
    desc->async_tx.phys =3D segment->phys;
   =20
    if (chan->direction =3D=3D DMA_MEM_TO_DEV) {
        segment->hw.control |=3D XILINX_MCDMA_BD_SOP;
    ...
}

> +			status =3D (chan->direction =3D=3D DMA_DEV_TO_MEM) ?
> +				seg->hw.s2mm_status : seg->hw.mm2s_status;
> +			if (!(status & XILINX_DMA_BD_COMP_MASK))
> +				break;

[Severity: High]
Does this early break cause a hardware state corruption when combined with
the interrupt handler logic?

Because this patch intentionally leaves uncompleted descriptors in
chan->active_list by breaking early, xilinx_mcdma_irq_handler() will then
unconditionally set chan->idle to true and call start_transfer():

drivers/dma/xilinx/xilinx_dma.c:xilinx_mcdma_irq_handler() {
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

Because chan->idle is now true, start_transfer() takes pending descriptors
and writes their physical address to the Current Descriptor (CDESC) registe=
r.
Writing to CDESC while the hardware is still actively processing the
remainder of active_list violates the AXI MCDMA specification and can break
the descriptor chain.

>  		}
>  		if (chan->has_sg && chan->xdev->dma_config->dmatype !=3D
>  		    XDMA_TYPE_VDMA)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717090824.2364=
230-1-srinivas.neeli@amd.com?part=3D2
