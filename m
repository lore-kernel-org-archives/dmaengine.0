Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E82C3C0608
	for <dmaengine@vger.kernel.org>; Wed, 19 Aug 2026 17:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787161639; cv=none; b=uMI39Mao/qCnZqFCElrQdUXrDlN2YmzUU3sLZCpgeuLmIKgYUWSYULsoZ9eTS1tAC7KMHFiFKIWrfa1n9sgcPtUEcCFj+t/1ytiK17HSIKnjOwr24LB522LkG4IfIBZUYIKEbSISjHpQ4hmMbmdS13DvJZRfcjncqtPcY+3+JMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787161639; c=relaxed/simple;
	bh=JmHTzKeNLIYK1f222vf58G+I4LjnZ1/vxuEkHiXonOc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sapqlQNx5uYU5xEzC72hbRFBtp15UDOZ4fSWCQfPpd0ieKsnNIGFiT9Zt1qjprSsWu+SnUI0tAH761d69agUatEaYl7fVGjMCfbLzVg4N9NRzWw6jQ6IFad+ZFpOnh2UYTl56SsVpJyqsjJ+15bFezvUJCPGYLhxt6nphZuWHh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dy0VNYcc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dy0VNYcc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D90571F000E9;
	Wed, 19 Aug 2026 17:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787161638;
	bh=/LjujVPN7Nn8BRxtuBCHq9Z+yOJbM9VqWdVtH5tJ8/g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dy0VNYcc01OJrXjWDm01yjkxCidEJ7UuPSRXW9tZJu8Wertm3LNqkh2z29wUM4051
	 MjaTEuA3iGXCLmE0I9WoZxvDxYy9gYLSFSlOYvSSeXIKyFHteBUuznHuCsrufncKjj
	 RcThLcyngY+7sbW95SLTd+eHUJ+zxFoNomryX36AHagBDmoeO4L3Jt7AlCmRTeVMOr
	 oJKaT4AAc1g8fWZ82lHInjI9L10CYl9dy6bMp8qT60BD5kI27RE0fkuMRO5lbgbFEm
	 QzDR7OFGPT/S8FvgwegP/XcTfJLsFgprgvxtgWIK7hrhuMms2p/auBG6iKcvhe1hx4
	 t5+/YWhMPTiQw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V6 3/4] net: xilinx: axienet: Derive RX frame length
 from residue in dmaengine path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Neeli" <srinivas.neeli@amd.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260818174151.1608971-4-srinivas.neeli@amd.com>
References: <20260818174151.1608971-1-srinivas.neeli@amd.com>
 <20260818174151.1608971-4-srinivas.neeli@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 17:47:17 +0000
Message-Id: <20260819174717.D90571F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The DMA engine TX submission path fails to decrement `tx_ring_head=
` on error, corrupting the ring state and causing use-after-free and double=
-free on subsequent TX completions.
- [High] The `axienet_stop()` function leaks pending `sk_buff` structures a=
nd their DMA mappings when using the DMA engine.
--

--- Patch [3]: [PATCH V6 3/4] net: xilinx: axienet: Derive RX frame length =
from residue in dmaengine path ---
commit 86c32a60f9e05880f70cba98d261769dec79ad80
Author: Srinivas Neeli <srinivas.neeli@amd.com>

net: xilinx: axienet: Derive RX frame length from residue in dmaengine path

The dmaengine RX path derived the received frame length from the descriptor
APP metadata. That only works when the optional AXI4-Stream status/control
interface is present, because the hardware populates the APP fields solely
when that interface is enabled. On designs without it the length read back
is invalid.

> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/=
net/ethernet/xilinx/xilinx_axienet_main.c
> index fcf517069d161..67d1b8e91d683 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing the DMA ring
management, I noticed an issue in axienet_start_xmit_dmaengine() where the
ring state can become corrupted on error.

If an error occurs during mapping, tx_ring_head remains incremented while t=
he=20
SKB is freed:

drivers/net/ethernet/xilinx/xilinx_axienet_main.c:axienet_start_xmit_dmaeng=
ine() {
	lp->tx_ring_head++;
	sg_init_table(skbuf_dma->sgl, sg_len);
	ret =3D skb_to_sgvec(skb, skbuf_dma->sgl, 0, skb->len);
	if (ret < 0)
		goto xmit_error_drop_skb;
...
xmit_error_drop_skb:
	dev_kfree_skb_any(skb);
	return NETDEV_TX_OK;
}

When the next valid packet is successfully submitted and completes, will
axienet_dma_tx_cb() fetch the descriptor using lp->tx_ring_tail++ and read
the freed skb?

drivers/net/ethernet/xilinx/xilinx_axienet_main.c:axienet_dma_tx_cb() {
...
	skbuf_dma =3D axienet_get_tx_desc(lp, lp->tx_ring_tail++);
	len =3D skbuf_dma->skb->len;
	txq =3D skb_get_tx_queue(lp->ndev, skbuf_dma->skb);
	...
	dev_consume_skb_any(skbuf_dma->skb);
}

Does this out-of-sync ring state lead to a use-after-free and double-free
of the SKB?

[Severity: High]
This is a pre-existing issue, but I also noticed a potential memory and DMA
mapping leak in axienet_stop() when the interface is brought down.

The teardown loops free the wrapper structures, but do they fail to unmap
and free the associated SKBs?

drivers/net/ethernet/xilinx/xilinx_axienet_main.c:axienet_stop() {
...
		for (i =3D 0; i < TX_BD_NUM_MAX; i++)
			kfree(lp->tx_skb_ring[i]);
		kfree(lp->tx_skb_ring);
		for (i =3D 0; i < RX_BUF_NUM_DEFAULT; i++)
			kfree(lp->rx_skb_ring[i]);
		kfree(lp->rx_skb_ring);
...
}

The SKBs and DMA mappings were allocated in axienet_rx_submit_desc():

drivers/net/ethernet/xilinx/xilinx_axienet_main.c:axienet_rx_submit_desc() {
...
	addr =3D dma_map_single(lp->dev, skb->data, lp->max_frm_size, DMA_FROM_DEV=
ICE);
	...
	skbuf_dma->skb =3D skb;
	skbuf_dma->dma_address =3D sg_dma_address(skbuf_dma->sgl);
...
}

Can this cause a permanent leak of SKBs and mappings each time the
interface is stopped?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818174151.1608=
971-1-srinivas.neeli@amd.com?part=3D3
