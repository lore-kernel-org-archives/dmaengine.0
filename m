Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170077;
	b=sUYAQgV3pzcyOQt+JGZi8hs7dPSaDUpjUAfXfDix9STxWvFvEGph6X0IgW9Oxw0FkRQG
	 FpFJB+Q0XQ9dEfTKs+ZLuB13mX1o8ALm8qDx1fKCs8uHYUbnIJQomLvC5PCE5Ahjm4F9H
	 Vj2uOjOYpe7TeiX3KTy58pbSCozDVRtMo/yfWCnGh32A12V0zD9xWgTXz7c/q6cOMSiuJ
	 1cU9r5Zk/z2+TAMgzqNQh2JsUeipIKw4uZga0KPxXHTzR/VO00uZB4FGM3L17yUmdHdqM
	 bLyKVUeNFCTcqoJRl1P+pjp17SRka4LAF13yf2h7zQhqvsJCk9l0IzwIugsJZs7XPzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170077;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=JLSfz6AN0DcIuVFwXX0GESStQlTO4cLd3pTias0gyuo=;
	b=erY6Imt7WOW4/jrIIfVDSBZc9US3I5RKq9+6SAwz8urg3VwyoqepFT9+UrxlPOUt5v5r
	 uscT85nFMpHSJOjl92pKKOed1wMm5u6+DwOnU57B242RGq4M3EbFScaHfW9Mfr/q8Gnzm
	 v2FKiGr1BaFJirFYIgI16I+dHuKzEINwudJ0x4Zvs0YdGid6SHhruCzWb522OyQm0wkMV
	 7YWEpVSv7k+R+4N143nOKs0VrFhmU0E1jiDqjhMgSctR98ECstipu4AtirdTNnp+nuqMU
	 sacTJ1Q/w9SumAoSnpn6+sBmOwGgSzm/EfLoqVNg3C0e+UN8j/wRU47HXd7IjE4vwaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bNoYjaSi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9094A606A32C
	for <dmaengine@vger.kernel.org>; Fri, 20 Nov 2026 10:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bNoYjaSi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3CC01F000D2;
	Fri, 20 Nov 2026 10:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795170077;
	bh=JLSfz6AN0DcIuVFwXX0GESStQlTO4cLd3pTias0gyuo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bNoYjaSiw6MqcYOHDmNvWEitnMoLDYaB5MmUN3kNMQYrXzjTT6zI+QM3W6eP+JyrW
	 KcG1WXDvPXmgowsOvrp6abVgtrCRfr2bOfgHIGvorSdaJhbFkUIwLe+EGu45K/U8sP
	 W9XPANprytEnqqj7GpVoeWD2k78FgXRjF3WwR0fslDXiMCAh/pxeSWqo4ypIcHG1tI
	 /A3dHUO/V3NlY0A5VxFOtkayQei/dbPolCE2AFGREyRXuSCyyrekMjSE4WAPegty0p
	 44Wv8UckjBd7DsJDZmi8lbmjOuAJt9csUOgw8Y9t5VukcuiGSNTm/BFEL8TkviCBCX
	 wzYKe64740Tjg==
Message-ID: <sashiko-outbox-224921@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7] dmaengine: dw-axi-dmac: report paused state and
 residue in tx_status
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rui Wang" <wr574332525@163.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261120101012.1789-1-wr574332525@163.com>
References: <20261120101012.1789-1-wr574332525@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 10:21:16 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] dmaengine: dw-axi-dmac: wrong block match in
  axi_chan_get_xferred()
- [Low] dmaengine: dw-axi-dmac: missing Fixes trailer for commit
  8e55444da65c
--

commit c8d0c69cc29c111365ef5036a266d8a0e8d86f5b
Author: Rui Wang <wr574332525@163.com>

> dmaengine: dw-axi-dmac: report paused state and residue in tx_status
>
> The driver implements device_pause/device_resume, but device_tx_status
> keeps reporting DMA_IN_PROGRESS for a paused channel, so clients cannot
> tell a paused channel apart from a running one. Report DMA_PAUSED when
> the channel is paused and the cookie is still in flight, including for
> callers that pass a NULL dma_tx_state, and clear the stale is_paused
> flag in dma_chan_terminate_all(), which disables the channel and thus
> implicitly cancels the paused state.
>
> Also, the residue of an in-flight transfer is currently derived from
> the number of completed LLI blocks, so it only advances in block-size
> steps and stays stale for the duration of a large block. Read the
> current hardware pointer (CH_SAR for MEM_TO_DEV and MEM_TO_MEM, CH_DAR
> for DEV_TO_MEM) and walk the descriptor's LLIs to compute how many
> bytes have actually been transferred. The 64-bit pointer is sampled
> with a tearing-safe double read, as the transfer may be running
> concurrently. The pointer is only consulted for the descriptor most
> recently programmed into the hardware, tracked in the previously
> unused chan->desc field; any other descriptor has not been started yet
> and keeps reporting its full length. When the transfer has just
> completed but the descriptor has not been reaped yet, the pointer sits
> at the end of the last block and the residue naturally reads as 0. The
> pointer registers are pre-loaded with the first block's addresses when
> the channel is programmed, so a stale pointer left by a previous
> transfer (e.g. when its buffer is reused) can never be observed before
> the first LLI fetch completes. Cyclic descriptors keep the
> block-granular accounting.
>
> Tested on an FPGA platform.
>
> Signed-off-by: Rui Wang <wr574332525@163.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

[Severity: Low]
This restores the DMA_PAUSED check and fixes the burst-granularity residue
reporting in dma_chan_tx_status().  Should this include:

  Fixes: 8e55444da65c ("dmaengine: dw-axi-dmac: Support burst residue granu=
larity")

> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma=
/dw-axi-dmac/dw-axi-dmac-platform.c
> index 7520c78f55ccf..5e90d7d6c3282 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> @@ -355,33 +355,110 @@ static void vchan_desc_put(struct virt_dma_desc *v=
desc)
>  	axi_desc_put(vd_to_axi_desc(vdesc));
>  }
> =20
> +/*
> + * Read a 64-bit channel address register while the transfer may be
> + * running. The two 32-bit halves cannot be read atomically on all
> + * platforms, so sample the high half before and after the low half
> + * and retry if it moved (the low half wrapped in between).
> + */
> +static u64 axi_chan_readq(struct axi_dma_chan *chan, u32 reg)
> +{
> +	u32 hi, lo, hi2;
> +
> +	do {
> +		hi =3D readl(chan->chan_regs + reg + 4);
> +		lo =3D readl(chan->chan_regs + reg);
> +		hi2 =3D readl(chan->chan_regs + reg + 4);
> +	} while (unlikely(hi !=3D hi2));
> +
> +	return (u64)hi << 32 | lo;
> +}
> +
> +/*
> + * Return the number of bytes already transferred by the descriptor
> + * currently on the hardware (running, paused or just completed), based
> + * on the current read or write position: CH_SAR for MEM_TO_DEV and
> + * MEM_TO_MEM, CH_DAR for DEV_TO_MEM. Must be called with vc.lock held.
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
> +	pos =3D axi_chan_readq(chan, dst ? CH_DAR : CH_SAR);
> +
> +	for (i =3D 0; i < desc->nr_hw_descs; i++) {
> +		hw_desc =3D &desc->hw_desc[i];
> +		start =3D le64_to_cpu(dst ? hw_desc->lli->dar : hw_desc->lli->sar);
> +
> +		/* Current position is inside this block: partial progress */
> +		if (pos >=3D start && pos <=3D start + hw_desc->len)
> +			return xferred + (u32)(pos - start);

[Severity: Medium]
Can axi_chan_get_xferred() match the wrong LLI block when a scatter-gather
transfer reuses the same physical buffer across multiple SG entries (such
as SPI dummy transfers using a shared zero or scratch page) or when a later
SG block sits immediately below an earlier one in physical memory so its
end address equals the earlier block's start?

Because the loop checks only the address range without consulting CH_LLP to
identify the active LLI, pos matches the earlier entry in desc->hw_desc[]
and reports a smaller transferred byte count, causing the reported DMA
residue to jump backwards.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120101012.1789=
-1-wr574332525@163.com?part=3D1
