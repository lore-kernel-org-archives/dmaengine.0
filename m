Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13FA35A3BF
	for <dmaengine@vger.kernel.org>; Tue,  1 Sep 2026 06:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788244108; cv=none; b=Ixgmwc5GDu1fLZJR8IZc5gNQIaKZfHp6pdwCHm5dU2QtCJcGBQFkXgsppq2L0t0SRbO5OdkZKRszxzTHjdLkHiOFjFjeHNCGEyHBqZueVLEQSAgd4gtzb1dnkNgU/zcc60d3AyMEpAjgjkOlZUvyveC155c1OOdNNtPAn6yTosc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788244108; c=relaxed/simple;
	bh=Lk156jK7gZLq7xw7XRnykmIuEqIUj6+QyVr7nTwaI40=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MzVYsaV454e5bX7M+0E5CLed2ZT3RJ0bJ1tzU2FZNRTdXEtcw6kN7bXTm6UneD+xIBXketps86WlAuG6FsfDI0p1hR8vVDm2jS+nJ2r99YaB1y5IxJMw3znoUeUjHAD5LiztmfIdjSSt23jlKZua+ffU6e1ncdX2dWMrrgE8ytc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O4TOxytK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O4TOxytK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FDD61F00A3E;
	Tue,  1 Sep 2026 06:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788244106;
	bh=tTBZtvxCmqMGFQBZVyCTUoHKomQXVizXgN6Z40r4vBg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O4TOxytKHUl38o0fGTWOWt4uILBHbN4H1Fw5kl5IStDgLNT8mSdZ8sLigENRoP1qy
	 rAG72Icmu6MP+UkMnvnijTK1MxSEHObErdA6Qw7EeElcqtXmfmGAkwG3rrXf0bxvMw
	 f6ZEnxCbAruyM6Yx1trhPgy+kztiuRRqh4pA/edegaBjRTl5d2jDLLJemrFb2w3SH4
	 ZxvFnW/VOGBN5P1Y+0xWuMTB/w94WBsXLqDhoTd9eiTqyBst4pQnJg2CG+1ZyWlAAa
	 ok6WiLmbXF2HuVoI6J2LDI61YLBQHe2ydYmStYxHJdq6w8r08rqh2bLk6dm1ESrIed
	 jUHGu1FoWGcVw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] dmaengine: dw-axi-dmac: Fix CH_CFG2 channel
 priority position
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jia Wang" <wangjia@ultrarisc.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260901-dma-fix-v2-3-d7f0459ebb14@ultrarisc.com>
References: <20260901-dma-fix-v2-0-d7f0459ebb14@ultrarisc.com>
 <20260901-dma-fix-v2-3-d7f0459ebb14@ultrarisc.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 06:28:25 +0000
Message-Id: <20260901062826.3FDD61F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Spurious dev_err logs and potential duplicate execution of DMA des=
criptors due to active descriptors remaining on the `desc_issued` list.
- [High] Missing NULL check on the error path in axi_desc_put() leads to a =
dma_pool_free() crash and an atomic counter underflow.
--

commit ecdc36132aeb3706e71e4d58d69cbfe272b69e28
Author: Jia Wang <wangjia@ultrarisc.com>

dmaengine: dw-axi-dmac: Fix CH_CFG2 channel priority position

The driver currently shifts the priority value by 20, which programs the
wrong bits for the CH_CFG2 channel priority field. This commit corrects
the field position by using bit 15 instead.

> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h b/drivers/dma/dw-axi-d=
mac/dw-axi-dmac.h
> index 67cc199e24d1f..97451bb8b16a7 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
> @@ -327,7 +327,7 @@ enum {
>  #define CH_CFG2_H_TT_FC_POS		0
>  #define CH_CFG2_H_HS_SEL_SRC_POS	3
>  #define CH_CFG2_H_HS_SEL_DST_POS	4
> -#define CH_CFG2_H_PRIORITY_POS		20
> +#define CH_CFG2_H_PRIORITY_POS		15
> =20
>  /**
>   * DW AXI DMA channel interrupts

While reviewing this patch, I noticed a couple of pre-existing issues in
the dw-axi-dmac driver:

drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:dma_chan_issue_pending() {
...
	if (vchan_issue_pending(&chan->vc))
		axi_chan_start_first_queued(chan);
...
}

drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:axi_chan_start_first_queued(=
) {
...
	vd =3D vchan_next_desc(&chan->vc);
	if (!vd)
		return;

	desc =3D vd_to_axi_desc(vd);
...
	axi_chan_block_xfer_start(chan, desc);
}

drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:axi_chan_block_xfer_start() {
...
	if (unlikely(axi_chan_is_hw_enable(chan))) {
		dev_err(chan2dev(chan), "%s is non-idle!\n",
			axi_chan_name(chan));

		return;
	}
...
}

[Severity: High]
This isn't a bug introduced by this patch, but if a client queues a second
transfer and calls dma_chan_issue_pending() while the first is actively
running, does vchan_issue_pending() leave the active descriptor in the
issued list?

If vchan_next_desc() peeks at the head of the issued list without removing
it, does axi_chan_start_first_queued() fetch the already running first
descriptor?

If so, would axi_chan_block_xfer_start() detect the hardware is active and
print a spurious dev_err, or erroneously restart the already completed
descriptor if the hardware just finished but the interrupt hasn't fired yet?


drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:axi_desc_put() {
...
	for (descs_put =3D 0; descs_put < count; descs_put++) {
		hw_desc =3D &desc->hw_desc[descs_put];
		dma_pool_free(chan->desc_pool, hw_desc->lli, hw_desc->llp);
	}

	kfree(desc->hw_desc);
	kfree(desc);
	atomic_sub(descs_put, &chan->descs_allocated);
...
}

[Severity: High]
This is a pre-existing issue, but if memory is exhausted during allocation
and axi_desc_get() returns NULL and goes to the error path, could
hw_desc->lli be NULL when dma_pool_free() is called here?

Does dma_pool_free() safely handle a NULL virtual address, or could this
cause a crash when it tries to push the block onto the pool's free list?

Also, does subtracting descs_put (which reaches the full count) from
chan->descs_allocated cause an atomic counter underflow if only a partial
allocation succeeded?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-dma-fix-v2=
-0-d7f0459ebb14@ultrarisc.com?part=3D3
