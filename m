Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45181222597
	for <dmaengine@vger.kernel.org>; Mon, 17 Aug 2026 15:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786981014; cv=none; b=Ij+PHGDURUZucjLmnTC5Sbrk/pgOymkxZWAhfOneeVy2KxV0VKBy7E9KHcygSaihMP0fmW402BNSCJfh6oLWm74aXSuptPDMfCpVG3Vjz6jzQnGT4M6l9oWbbw/da1ChZ93VTMFDzOrD0wP1IMWNH+gXPNR982mkoyz3dJHwBWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786981014; c=relaxed/simple;
	bh=v6sM9VYakMI9NBrrvgAIKNZkcD7/23AqkJ+GVJLrj4Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bcu2AvBOzgNJu7gsg4DOUlJYFL/UOiyajKilt1M7dQpngq/6H1oOgOVWzF+wZF8wdpKCptSJigZKv+QRqP1HJUMAehlBdDDhFKDO2nYJohLX5UZEOqchpl3C1wu9AC2s7qFs2NEcC7AIG+hTRrthU0Kf+KcRuyifpeBj2PQVzlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=csjigmGE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="csjigmGE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FDFB1F000E9;
	Mon, 17 Aug 2026 15:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786981012;
	bh=3I6icxCBZmbThcVLd8xnKxHvjya6+pEHRFQBmMVkBqg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=csjigmGEKrpWLcMU0XfcUGjGkdnA5cQaoM4ZhukD/wXfu49PmazDLx3YU2twlPtrZ
	 HuPfbivxzLflDqsYKGpkahugFm0dYT9OklMpywUlAMoN2iG7ZPGSKWsaqJpawdXe8/
	 Jn3SGumUCFgGhgjGmsk8lO22JRYmGeWxnqXlRdcPzzxgFJRp/LMV3F/KB/vnM5mmXZ
	 EDvw16lijMwmVa/hwBUPrLyJcu4NVreq7SAOcQBPHlubInz2/ezdMypKigHVVUfVgy
	 xUECBeS+pvLhPmmSOHE1zV4YmhyppAb5ncbtxUDjQAiUFoZq/tn3Cf76OiKnR4+pzS
	 YIm4goKOlyy9A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: xilinx_dma: Fix hardware buffer descriptor
 chain after cyclic DMA
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Bereza" <alex@bereza.email>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260817-fix-hw-buf-desc-after-cyclic-mode-v1-1-1fe47e701d6c@bereza.email>
References: <20260817-fix-hw-buf-desc-after-cyclic-mode-v1-1-1fe47e701d6c@bereza.email>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 15:36:52 +0000
Message-Id: <20260817153652.9FDFB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Low] Fragile 64-bit division on `dma_addr_t` using `sizeof`.

Pre-existing issues:
- [Critical] Hardware descriptor ring desynchronization due to relying on `=
free_seg_list` ordering mapping exactly to physical continuity.
- [High] Unlocked modification of `chan->free_seg_list` in error paths and =
submission rejection paths causes list corruption.
--

--- Patch [1]: [PATCH] dmaengine: xilinx_dma: Fix hardware buffer descripto=
r chain after cyclic DMA ---
commit df3c4c6392659223fe0433932cd3afd45fdb012e
Author: Alex Bereza <alex@bereza.email>

dmaengine: xilinx_dma: Fix hardware buffer descriptor chain after cyclic DMA

Using the DMA in cyclic mode modifies the hardware buffer descriptor chain
so that the last descriptor points back to the first. This patch ensures
non-cyclic mode works after cyclic mode by restoring the original buffer
descriptor ring setup during segment cleanup.

> diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_=
dma.c
> index bef2b031dba19..6d00aa97c8fc9 100644
> --- a/drivers/dma/xilinx/xilinx_dma.c
> +++ b/drivers/dma/xilinx/xilinx_dma.c
> @@ -756,15 +756,25 @@ xilinx_aximcdma_alloc_tx_segment(struct xilinx_dma_=
chan *chan)

[ ... ]

> -static void xilinx_dma_clean_hw_desc(struct xilinx_axidma_desc_hw *hw)
> +static void xilinx_dma_clean_hw_desc(struct xilinx_dma_chan *chan,
> +				     struct xilinx_axidma_tx_segment *segment)
>  {
> -	u32 next_desc =3D hw->next_desc;
> -	u32 next_desc_msb =3D hw->next_desc_msb;
> +	dma_addr_t next;
> +	u32 i;
> =20
> -	memset(hw, 0, sizeof(struct xilinx_axidma_desc_hw));
> +	/*
> +	 * Restore the buffer descriptor's next descriptor pointer to the value
> +	 * set up in xilinx_dma_alloc_chan_resources(). Otherwise using the DMA
> +	 * in cyclic mode leaves the next descriptor pointer altered and
> +	 * prevents subsequent non-cyclic transfers.
> +	 */
> +	i =3D (segment->phys - chan->seg_p) / sizeof(*chan->seg_v);

[Severity: Low]
Is this calculation relying on compiler optimization to avoid an unresolved
__udivdi3 build failure on 32-bit platforms?

Because segment->phys and chan->seg_p are dma_addr_t, which can be 64-bit
on 32-bit platforms with LPAE, this creates a 64-bit division. It currently
works because sizeof(*chan->seg_v) happens to be exactly 128 bytes due to
__aligned(64), allowing the compiler to optimize it into a bitwise right
shift.

If a field is added that pushes the alignment boundary to a non-power-of-2,
would this break 32-bit builds? Could we use native pointer arithmetic like
i =3D segment - chan->seg_v instead?

> +	next =3D chan->seg_p +
> +	       sizeof(*chan->seg_v) * ((i + 1) % XILINX_DMA_NUM_DESCS);
> =20
> -	hw->next_desc =3D next_desc;
> -	hw->next_desc_msb =3D next_desc_msb;
> +	memset(&segment->hw, 0, sizeof(segment->hw));
> +	segment->hw.next_desc =3D lower_32_bits(next);
> +	segment->hw.next_desc_msb =3D upper_32_bits(next);
>  }
> =20
>  static void xilinx_mcdma_clean_hw_desc(struct xilinx_aximcdma_desc_hw *h=
w)

[ ... ]

> @@ -786,7 +796,7 @@ static void xilinx_mcdma_clean_hw_desc(struct xilinx_=
aximcdma_desc_hw *hw)
>  static void xilinx_dma_free_tx_segment(struct xilinx_dma_chan *chan,
>  				struct xilinx_axidma_tx_segment *segment)
>  {
> -	xilinx_dma_clean_hw_desc(&segment->hw);
> +	xilinx_dma_clean_hw_desc(chan, segment);
> =20
>  	list_add_tail(&segment->node, &chan->free_seg_list);

[Severity: High]
This is a pre-existing issue, but could this unlocked modification of
chan->free_seg_list lead to list corruption?

In error paths like xilinx_dma_prep_slave_sg() on allocation failure, or
when xilinx_dma_tx_submit() rejects a submission,
xilinx_dma_free_tx_descriptor() is called locklessly. This invokes
xilinx_dma_free_tx_segment() which calls list_add_tail() on
chan->free_seg_list here.

If the interrupt tasklet concurrently calls xilinx_axidma_alloc_tx_segment()
and modifies the list while holding chan->lock, couldn't this cause
linked-list corruption and kernel panics?

[Severity: Critical]
This is a pre-existing issue, but will relying on free_seg_list ordering
cause hardware descriptor ring desynchronization?

In xilinx_dma_prep_slave_sg(), segments are allocated and queued:

drivers/dma/xilinx/xilinx_dma.c:xilinx_dma_prep_slave_sg() {
    ...
    segment =3D xilinx_axidma_alloc_tx_segment(chan);
    ...
    hw =3D &segment->hw;
    ...
    list_add_tail(&segment->node, &desc->segments);
    ...
}

This never dynamically updates hw->next_desc to link the transaction's
segments together. If the free_seg_list becomes out of order (for example,
due to xilinx_dma_tx_submit() rejecting and freeing segments), the segments
popped will not be physically contiguous.

Since hw->next_desc isn't updated, won't the hardware blindly follow the
statically-initialized next_desc pointers into unrelated physical segments,
potentially corrupting other active transactions?

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817-fix-hw-buf=
-desc-after-cyclic-mode-v1-1-1fe47e701d6c@bereza.email?part=3D1
