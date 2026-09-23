Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3134156DF
	for <dmaengine@vger.kernel.org>; Wed, 23 Sep 2026 05:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790139725; cv=none; b=gOVTLSG8XiGvPX8A0JENMFEpQ9Ca5vc355rFvaPQZPrCUyLlUg6M9/uFZjwTJynLao3gb37B5wABqLOhykmbK4sk6pgip7EcMLSEMrpEAVCREyjg29kCKr0mfpaAzFbROb9G5MAarZYZsq5YmT3I8pZBR1TCbBexSGOjna9qsao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790139725; c=relaxed/simple;
	bh=T+1WP/9QXpOK2sebXOcucRwnpsFtWn3Kfs4dJd4XSLQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JzsCKMHBGBCwMVI3/UyNEhWdgAX26UjA5Q4DPjjl11m3xBgak7Bie9xXGrrc0Rs9eOV++7WgqQongZFYM9gg6F/Hq3GRhs3JQV3StpJBufKzlcspwCJvDTymzRBL6qZYSz4ZmyN04fTX2tloimzJyaYxo80R/zCbeYkOKxa6v58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kR1FTnqE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kR1FTnqE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89B1A1F00893;
	Wed, 23 Sep 2026 05:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790139723;
	bh=9OvdbnmNE0cQR5BO9A4OgXfn2FLBF33FcS6AiHYBS3E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kR1FTnqEvDYBE9ZY7IvQC8MxYOw78O6SLhjJ+yuqxltE97xxvlGKyHVKFwpuPjOxh
	 WPiBi4Te7b6BInscZ4CypEL3RJf5ulxeDqiYKoFIjMgPwE78bV1hlXw+qsP41Jom3w
	 3INqhzl8YQT0bwysPkPi0bunAIG24Bb8TGvjGYmJUzq31oiv72PzCGGSrVTWEoWTZg
	 FkUyvwBbdiXYZOVgCqfjCBampLT5XqWYru8Mv7P/MEbozM9VvchX1PoLpVAUyr1q4x
	 LdBz5tcU+sjwsr0cDVD8bcSWlIb/gPR/5CHZUUGH15OGr3SzU9xXJgcn4FpcTGAoKe
	 hmOY1Rq3HyT4g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] dmaengine: dw-axi-dmac: report paused state and
 residue in tx_status
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rui Wang" <wr574332525@163.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260923044104.3234-1-wr574332525@163.com>
References: <20260923044104.3234-1-wr574332525@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 05:02:03 +0000
Message-Id: <20260923050203.89B1A1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dmaengine: dw-axi-dmac: false 0 residue for queued descriptors due=
 to stale HW pointers
--

commit 1fb45501ae16a4b2f841216b130cbe2ef95cb7a3
Author: Rui Wang <wr574332525@163.com>

dmaengine: dw-axi-dmac: report paused state and residue in tx_status

The driver implements device_pause/device_resume, but device_tx_status
keeps reporting DMA_IN_PROGRESS for a paused channel, so clients cannot
tell a paused channel apart from a running one. This patch addresses
this by properly reporting DMA_PAUSED and updating the residue calculation
to read the hardware pointers directly instead of relying on completed
blocks.

> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma=
/dw-axi-dmac/dw-axi-dmac-platform.c
> index eebed2474210d..5653a57126d66 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> @@ -352,33 +352,120 @@ static void vchan_desc_put(struct virt_dma_desc *v=
desc)

[ ... ]

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
> +		if (chan->cyclic) {
> +			completed_length =3D desc->completed_blocks *
> +					   desc->hw_desc[0].len;
> +		} else if (vdesc =3D=3D vchan_next_desc(&chan->vc)) {
> +			/*
> +			 * The descriptor is on the hardware: read the progress
> +			 * from its pointer. If the transfer has just finished
> +			 * but the interrupt has not reaped the descriptor yet,
> +			 * the pointer sits at the end and the residue reads 0.
> +			 *
> +			 * The hardware clears the channel enable bit when the
> +			 * transfer completes, so a still-enabled channel cannot
> +			 * be done: right after the start its pointer may still
> +			 * hold the value of a previous transfer, which aliases
> +			 * the end of the new one when the buffer is reused.
> +			 * Never report full completion while the channel runs.
> +			 */
> +			completed_length =3D axi_chan_get_xferred(chan, desc);
> +			if (completed_length =3D=3D length &&
> +			    axi_chan_is_hw_enable(chan))
> +				completed_length =3D length - 1;
                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

[Severity: High]
Does this code handle the case where the descriptor is at the head of
desc_issued but hasn't actually been started on the hardware?

If a transfer completes and a new transfer is queued reusing the same memory
buffer, the new transfer will be at the head of desc_issued. Because the
hardware is idle, axi_chan_is_hw_enable(chan) will be false.

When dma_chan_tx_status() is called, vchan_next_desc() matches this new
unstarted transfer. The hardware pointers CH_SAR and CH_DAR still hold the
stale end-addresses from the previous transfer, which match the new
transfer's boundaries.

This causes axi_chan_get_xferred() to return length, and because the
hardware is idle, the mitigation here is bypassed. Could this result in an
unstarted transfer falsely reporting a residue of 0, indicating full
completion?

> +		} else {
> +			/* Still queued, nothing transferred yet */
> +			completed_length =3D 0;
> +		}
> +
> +		bytes =3D length - min_t(u32, completed_length, length);
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923044104.3234=
-1-wr574332525@163.com?part=3D1
