Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC6F2FDC20
	for <dmaengine@vger.kernel.org>; Wed, 23 Sep 2026 03:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790133531; cv=none; b=W38syaM3eB0Nv7WsmxzcXXJtInh5EYdMcVV17n0BNnMU1HemaQr9aFucKBAuBbwh3nh+JC+K7Xs8H6pEN0EHJScl+JyTGlgjcY9/mwBHLD1l2Q7tle4rmqve4I0jH+G5fusX2jwZC1XBycZSb04YsM02gf6l6nJ/BeEwhGE6Ews=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790133531; c=relaxed/simple;
	bh=0by6I0xGaSZpUBXT6Dc+lxKWqYO5TYLOjRHP+yNQI/8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pz3lqsJjpJ+ZFGbyPxdZiiKybYJ7wSxaHKkVY1QeUqMNAW1ObZI1IuaCHJA3kgoDiBKurWme2nmTd/m4ut+sbm6WjrcOUG764zM63DHwo0k4L/cCWExWuD7eICUfkzP1g5pwz7Q6Jc+f3iO2rugySoDYJn/4Ze+d/0D1oxp4S+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V9raexdj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V9raexdj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AFF81F000FF;
	Wed, 23 Sep 2026 03:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790133530;
	bh=eBK/BI+0wfdk/yicnRRDmXOn5WKFZOV/McqrmxZ5ly4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V9raexdj07u4W9kxjZoVIBHA/pPLyCbZTO5FjcSOrZ8FCeBGvLx2DlZzLV3UU7M/r
	 cgQCptgldZ6Cm/c01RI65d12X4DDEkvSdhMUV49vJZLfe7cm9z2RPk69tDy6xXCCpZ
	 j0EQE/+QvHr7raJh8yKKPhWjAkne9EmdHW7v+63aEqAu0LG1BowD+sbl3AMfcz0mdy
	 WpIKRrP7CqAUWB/IVZF+1+nLxTkMTKg+xZWQAgzNAmJnvQvB0djqR1sBt0KXqo0cwN
	 B0fw98PFUFDZPu5kaoKO4aHTY6KNOqDMcHXEGq2f+nCJBVfW6r+18VkFK0zn6zOgiH
	 80aznaokR+G8g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: dw-axi-dmac: report paused state and residue
 in tx_status
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rui Wang" <wr574332525@163.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260923030201.859-1-wr574332525@163.com>
References: <20260923030201.859-1-wr574332525@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 03:18:49 +0000
Message-Id: <20260923031850.0AFF81F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] dmaengine: dw-axi-dmac: torn read of active 64-bit counters usin=
g lo_hi_readq()
- [Medium] dmaengine: dw-axi-dmac: completed_length zeroed before IRQ handl=
ing
--

commit 00e157d9ceffe7d7b5238031118199d3b1fa0eca
Author: Rui Wang <wr574332525@163.com>

dmaengine: dw-axi-dmac: report paused state and residue in tx_status

The driver implements device_pause/device_resume, but device_tx_status
keeps reporting DMA_IN_PROGRESS for a paused channel, so clients cannot
tell a paused channel apart from a running one. Report DMA_PAUSED when
the channel is paused and the cookie is still in flight, and clear the
stale is_paused flag in dma_chan_terminate_all(), which disables the
channel and thus implicitly cancels the paused state.

Also, the residue of an in-flight transfer is currently derived from
the number of completed LLI blocks. Read the current hardware pointer
and walk the descriptor's LLIs to compute how many bytes have actually
been transferred.

> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma=
/dw-axi-dmac/dw-axi-dmac-platform.c
> index eebed2474210d..4e1b8654a332e 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
[ ... ]
> @@ -352,19 +352,51 @@ static void vchan_desc_put(struct virt_dma_desc *vd=
esc)
>  	axi_desc_put(vd_to_axi_desc(vdesc));
>  }
> =20
> +/*
> + * Return the number of bytes already transferred by the in-flight
> + * non-cyclic descriptor, based on the current hardware read or write
> + * position: CH_SAR for MEM_TO_DEV and MEM_TO_MEM, CH_DAR for
> + * DEV_TO_MEM. Must be called with vc.lock held and the channel
> + * running or paused.
> + */
> +static u32 axi_chan_get_xferred(struct axi_dma_chan *chan,
> +				struct axi_dma_desc *desc)
> +{
> +	struct axi_dma_hw_desc *hw_desc;
> +	bool dst =3D chan->direction =3D=3D DMA_DEV_TO_MEM;
> +	u64 pos, start;
> +	u32 xferred =3D 0;
> +	int i;
> +
> +	pos =3D lo_hi_readq(chan->chan_regs + (dst ? CH_DAR : CH_SAR));

[Severity: Medium]
Does this reading of an active 64-bit hardware counter lead to word tearing?

lo_hi_readq() unconditionally performs two separate 32-bit readl() calls on
all architectures. If the DMA transfer crosses a 32-bit boundary (e.g.,
crossing a 4GB address boundary) between the two reads, the combined 64-bit
value will tear, creating a massively corrupted address.

This corrupted address can fail the descriptor bounds check (pos >=3D start=
 &&
pos <=3D start + hw_desc->len) later in this function, causing
axi_chan_get_xferred() to conservatively return 0.

This would result in a spurious backward jump in the reported residue back
to the full transfer size, breaking monotonic progress expectations for any
polling client.

[ ... ]
> @@ -374,13 +406,26 @@ dma_chan_tx_status(struct dma_chan *dchan, dma_cook=
ie_t cookie,
> =20
>  	vdesc =3D vchan_find_desc(&chan->vc, cookie);
>  	if (vdesc) {
> -		length =3D vd_to_axi_desc(vdesc)->length;
> -		completed_blocks =3D vd_to_axi_desc(vdesc)->completed_blocks;
> -		len =3D vd_to_axi_desc(vdesc)->hw_desc[0].len;
> -		completed_length =3D completed_blocks * len;
> -		bytes =3D length - completed_length;
> +		desc =3D vd_to_axi_desc(vdesc);
> +		length =3D desc->length;
> +
> +		if (chan->cyclic)
> +			completed_length =3D desc->completed_blocks *
> +					   desc->hw_desc[0].len;
> +		else if (vdesc =3D=3D vchan_next_desc(&chan->vc) &&
> +			 (axi_chan_is_hw_enable(chan) || chan->is_paused))
> +			/* In-flight descriptor: read progress from hardware */
> +			completed_length =3D axi_chan_get_xferred(chan, desc);
> +		else
> +			/* Still queued, nothing transferred yet */
> +			completed_length =3D 0;

[Severity: Medium]
Could this condition incorrectly zero out the completed length before IRQ
handling finishes, causing the residue to spike?

For non-cyclic transfers, the AXI DMA hardware automatically clears the
channel enable bit (DMAC_CHEN) when a transfer finishes.

If a client polls dma_chan_tx_status() during the small window after
hardware completion but before the interrupt handler acquires vc.lock to
reap the descriptor, vdesc =3D=3D vchan_next_desc(&chan->vc) remains true.

However, axi_chan_is_hw_enable(chan) evaluates to false because the hardware
disabled the channel. The logic incorrectly falls through to the else branc=
h,
setting completed_length =3D 0.

This causes the reported residue to instantaneously jump from nearly 0 back
to the full transfer length, breaking monotonic progress expectations.

> +
> +		bytes =3D length - min_t(u32, completed_length, length);
>  	}
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923030201.859-=
1-wr574332525@163.com?part=3D1
