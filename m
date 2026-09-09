Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0602852FE5A
	for <dmaengine@vger.kernel.org>; Wed,  9 Sep 2026 23:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788998267; cv=none; b=PNQzDIrTmdZvn5apC2mMaGQeNBbKDLvoVz8AzB52h6oBS94ztzWUFezPQ4pUGvNmfWxYWvSB+gn+AcpocKaAwMAZ5Y/Pc/e7wz+VnveEuaXrKNOFbo59eDPCxNsdIlktHuDtcvYl/GOoZ4MuTSuxEE2hh0mmAkZF8h3xRkqLoWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788998267; c=relaxed/simple;
	bh=nRjqoLb9vWzJe0+NlhHh+N4TxOjwmZislJjsbZaMmhw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BxamwmERUX3660bupUWgqqp2ZyIxKfELWxMOnxohnI4EOckVmxBs+bhl36AFkz4ilpP2X37/qsBrPDdLpLrKUOSxrQLWGx1tmBcR6q7BLqx/MeoXXr7cSyyvGKlalSBRfqrdjApct3umef4TMywXPDj5jkLNKLe2RwyFgt5NB9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AqPAUXlE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AqPAUXlE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5798F1F00893;
	Wed,  9 Sep 2026 23:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788998265;
	bh=86AJbGAb6wbSm+ZmfcNsRVvNwtwNUBnP0F1lJENRLmI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AqPAUXlEFPxwJbY7fZvAuMNWJ7S29Pjt64cMl8e7a07GPJwYEbRROCY164uzVL5LB
	 siwHl4v2X+ygPEp4G4zLDtCFjc26jCDEftCvhhMwyohubr7iy5YO0Yb4eiS/LJKp85
	 26A3OKhpnJIzB5S2YGXMcPIwlwG1H6l2OId0odEb/7v8xioBld9d9mfjnG50enUKhb
	 4KiC/AjAZJ6fYFLruZQ3W4ioQ5uyUa+tifTtm4rKrunOOszI5vDBW5vmCrKVh3QH6D
	 xDKkCFPsOh6o8fDmVRmfLCcUtLEjTtsySP4IwKDU2S0UHtWWHyakBuuq1Bqhxmzdfh
	 5GL2YkTkBtKzw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: mv_xor: add missing dma_wmb() barriers
 before descriptor chain start
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260909234646.102344-1-rosenp@gmail.com>
References: <20260909234646.102344-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 23:57:44 +0000
Message-Id: <20260909235745.5798F1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] dma_wmb() is insufficient to enforce Store-Load ordering between t=
he memory write and MMIO read in mv_xor_tx_submit().
- [Medium] dma_wmb() is incorrectly used to order a coherent memory write a=
gainst a subsequent MMIO write in mv_chan_start_new_chain().

Pre-existing issues:
- [High] Missing memory barrier before linking a new descriptor to an activ=
e hardware chain in mv_xor_tx_submit().
--

commit a54d735383cc294f5f7387dfea7d5abca9cdec6f
Author: Rosen Penev <rosenp@gmail.com>

dmaengine: mv_xor: add missing dma_wmb() barriers before descriptor chain s=
tart

This commit adds dma_wmb() barriers in the DMA submission and chain starting
paths to ensure descriptor data written to coherent memory is visible to the
DMA engine before the hardware registers that trigger processing are writte=
n.

> diff --git a/drivers/dma/mv_xor.c b/drivers/dma/mv_xor.c
> index 25ed61f1b0899..8e7c7a6c5c5d0 100644
> --- a/drivers/dma/mv_xor.c
> +++ b/drivers/dma/mv_xor.c
> @@ -181,6 +181,7 @@ static void mv_chan_start_new_chain(struct mv_xor_cha=
n *mv_chan,
>  	dev_dbg(mv_chan_to_devp(mv_chan), "%s %d: sw_desc %p\n",
>  		__func__, __LINE__, sw_desc);
> =20
> +	dma_wmb();
>  	/* set the hardware chain */
>  	mv_chan_set_next_descriptor(mv_chan, sw_desc->async_tx.phys);

[Severity: Medium]
Does this incorrectly use the memory-to-memory barrier API here?

According to Documentation/memory-barriers.txt, dma_*() barriers do not
provide ordering guarantees for accesses to MMIO regions. Here, we are
trying to order a coherent memory write against a subsequent relaxed MMIO
write inside mv_chan_set_next_descriptor().

Should this use wmb() instead to properly enforce memory-to-MMIO ordering?

[ ... ]

> @@ -409,6 +410,7 @@ mv_xor_tx_submit(struct dma_async_tx_descriptor *tx)
> =20
>  		/* fix up the hardware chain */

[Severity: High]
This isn't a bug introduced by this patch, but does the descriptor link
pointer update need a preceding memory barrier?

Before this function is called, the descriptor is initialized with
operational parameters. The spin_lock_bh() acquired at the start of
mv_xor_tx_submit() only acts as an acquire barrier, which doesn't prevent
preceding stores from being reordered after the link write.

Should there be a dma_wmb() placed immediately before
mv_desc_set_next_desc() to guarantee that the hardware doesn't follow the
new next-descriptor pointer and read an uninitialized descriptor?

>  		mv_desc_set_next_desc(old_chain_tail, sw_desc->async_tx.phys);
> +		dma_wmb();
> =20
>  		/* if the channel is not busy */
>  		if (!mv_chan_is_busy(mv_chan)) {

[Severity: High]
Is dma_wmb() sufficient to enforce store-load ordering here?

The patch adds dma_wmb() after mv_desc_set_next_desc() to order the memory
store before the MMIO load in mv_chan_is_busy(), which uses readl_relaxed().

However, dma_wmb() strictly guarantees store-store ordering and does not
prevent the CPU from executing a subsequent load before a preceding store
is globally visible.

If the CPU reorders its MMIO load of the status register to happen before
its memory write is globally visible, it could incorrectly read 'busy',
causing the CPU to skip kicking the hardware. If the hardware simultaneously
fetches the next descriptor right before the CPU writes the new link, it
will see a null pointer and stop, leaving the channel stalled indefinitely.

Does this sequence require a full memory barrier like mb() instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909234646.1023=
44-1-rosenp@gmail.com?part=3D1
