Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE573ACF1E
	for <dmaengine@vger.kernel.org>; Wed, 23 Sep 2026 03:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790135913; cv=none; b=CBMpmzlhe3iOdQ6xnDp2iSz7dloj7ztO6SnNJINZahkw/q6OYg1C8Ds5kvtwZ/esw5uLfttwQ7+/8JbllX7wAw4GvDAlEWuXleIv4isn8WNiiZMZRLuJQ3xjwB8+DBTZ+LcwCgz3ZaOSMVqeCZuTQ+5YZnpRTJagLVRozcnWI8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790135913; c=relaxed/simple;
	bh=bWx+00K45Iedd+Swu/+zzIiRDDXCcqcPADReGYr4n9c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CBCR7AT13Yq12p6VZyLnrWOnMGv5ZLzWlY3AzRzZnY5/9lqgQiHv5U6Tl2hoy0LId3raJOuFi9NqvxCY5cjb4MXAoNtfUotZxVZcd8MxEaYNb2OYYDSv4+7Z3yTC+oEFUbArEHdlPl50OzN+pDa0WFV2t3h0/nxPMsKlICLhuyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MqTKbRdg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MqTKbRdg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 947531F000FF;
	Wed, 23 Sep 2026 03:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790135911;
	bh=2xBBZWO7HXnsC/uxNHRRAstLmYSh+6Bm+OwCAhTwpXo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MqTKbRdg5jcQXxp6xkCxPQIG+PnMJWjXW5s+8Z5js6XQXjP0qKoxkgBNju/mMTJNM
	 aZ5jP+I34vu3gV80ZxCb3t94gBuZ2t7suFbnGp/IOhpK94LKIhJCzuHZjjlp/WuIpq
	 +4Ln6kCPzy2fcN2iAYN7hKCZq1lkdf6BcqXuG010GGXFH/KTHN0JaIojQRwRpmtoS5
	 +segzTMk+yPOQygxP5qzWs2crcfGvHpa6AHY20c+z4w+xDdvsVlfCIr7N9uy+FiRqk
	 Lv5Lo80uhamPmT2TAWn8zMpDCCawWxPhb21q2k0r6RJIuQeE986+XBU6cBvJ0pDQjp
	 ghjCoC/hJk/5g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] dmaengine: dw-axi-dmac: report paused state and
 residue in tx_status
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rui Wang" <wr574332525@163.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260923034653.1413-1-wr574332525@163.com>
References: <20260923034653.1413-1-wr574332525@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 03:58:31 +0000
Message-Id: <20260923035831.947531F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] dmaengine: dw-axi-dmac: stale hardware pointer read causes false c=
ompletion report
- [Medium] dmaengine: dw-axi-dmac: dma_chan_tx_status() fails to report DMA=
_PAUSED when txstate is NULL
--

commit 86d9aaad60c5959fbf2d93a893cc5a6deb51ce52
Author: Rui Wang <wr574332525@163.com>

dmaengine: dw-axi-dmac: report paused state and residue in tx_status

This commit updates the device_tx_status callback to report DMA_PAUSED
when a channel is paused. It also improves residue calculation for
in-flight transfers by reading the hardware CH_SAR/CH_DAR pointer and
walking the descriptor LLIs instead of relying on block-granular progress.

Link: https://lore.kernel.org/dmaengine/20260923030201.859-1-wr574332525@16=
3.com/

> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma=
/dw-axi-dmac/dw-axi-dmac-platform.c
> index eebed2474210d..2475ff7875537 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
[ ... ]
> @@ -352,19 +352,73 @@ static void vchan_desc_put(struct virt_dma_desc *vd=
esc)
[ ... ]
> +static u32 axi_chan_get_xferred(struct axi_dma_chan *chan,
> +				struct axi_dma_desc *desc)
> +{
> +	struct axi_dma_hw_desc *hw_desc;
> +	bool dst =3D chan->direction =3D=3D DMA_DEV_TO_MEM;
> +	u64 pos, start;
> +	u32 xferred =3D 0;
> +	int i;
> +
> +	pos =3D axi_chan_readq(chan, dst ? CH_DAR : CH_SAR);
> +
> +	for (i =3D 0; i < desc->nr_hw_descs; i++) {
> +		hw_desc =3D &desc->hw_desc[i];
> +		start =3D le64_to_cpu(dst ? hw_desc->lli->dar : hw_desc->lli->sar);
> +
> +		/* Current position is inside this block: partial progress */
> +		if (pos >=3D start && pos <=3D start + hw_desc->len)
> +			return xferred + (u32)(pos - start);
> +
> +		xferred +=3D hw_desc->len;
> +	}
> +
> +	/* Position doesn't match any block, be conservative */
> +	return 0;
> +}
> +
>  static enum dma_status
>  dma_chan_tx_status(struct dma_chan *dchan, dma_cookie_t cookie,
>  		   struct dma_tx_state *txstate)
>  {
>  	struct axi_dma_chan *chan =3D dchan_to_axi_dma_chan(dchan);
>  	struct virt_dma_desc *vdesc;
> +	struct axi_dma_desc *desc;
>  	enum dma_status status;
>  	u32 completed_length;
>  	unsigned long flags;
> -	u32 completed_blocks;
>  	size_t bytes =3D 0;
>  	u32 length;
> -	u32 len;
> =20
>  	status =3D dma_cookie_status(dchan, cookie, txstate);
>  	if (status =3D=3D DMA_COMPLETE || !txstate)
>  		return status;

[Severity: Medium]
Will clients querying the channel status without passing a dma_tx_state
struct receive DMA_IN_PROGRESS instead of the newly added DMA_PAUSED state?

If a client driver calls dmaengine_tx_status(chan, cookie, NULL) on a
paused channel, this early return skips the DMA_PAUSED check added at
the end of this function.

> =20
> @@ -374,13 +428,30 @@ dma_chan_tx_status(struct dma_chan *dchan, dma_cook=
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
> +		else if (vdesc =3D=3D vchan_next_desc(&chan->vc))
> +			/*
> +			 * The descriptor is on the hardware: read the progress
> +			 * from its pointer. If the transfer has just finished
> +			 * but the interrupt has not reaped the descriptor yet,
> +			 * the pointer sits at the end and the residue reads 0.
> +			 */
> +			completed_length =3D axi_chan_get_xferred(chan, desc);

[Severity: High]
Could this logic falsely report a zero residue (full completion) for a
newly submitted transfer before the hardware has actually started it?

If a transfer completes (leaving SAR/DAR pointing to the end of the
buffer) and a new transfer is submitted reusing the same memory buffer,
it becomes the active descriptor in vchan_next_desc.=20

If dma_chan_tx_status() is called before the DMA controller fetches the
first LLI and overwrites SAR/DAR, axi_chan_get_xferred() might read the
stale register value.

Because the buffer is reused, the stale position can fall into the new
descriptor's block range, causing the driver to conservatively compute
that all bytes have been transferred.

> +		else
> +			/* Still queued, nothing transferred yet */
> +			completed_length =3D 0;
> +
> +		bytes =3D length - min_t(u32, completed_length, length);
>  	}
> =20
> +	if (chan->is_paused && status =3D=3D DMA_IN_PROGRESS)
> +		status =3D DMA_PAUSED;
> +
>  	spin_unlock_irqrestore(&chan->vc.lock, flags);
>  	dma_set_residue(txstate, bytes);
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923034653.1413=
-1-wr574332525@163.com?part=3D1
