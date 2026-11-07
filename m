Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794091418;
	b=Rer7v8eYkX5mTQFHFI8DUbSJTidanH4Ckc2GQ4P/aq2d3g9xasyIg53AyC+ATg8QVAH0
	 LlbszJuN5ePiOo3ZBKvK+ZPxxcNFhPdxrmArnztoPkPkJPi2tTsz/QGea91WthseFsoUj
	 jkyyAlEQECz23mFbjLaDDWNIxGO76ozML7Z6Img/UiRpw2evYfe05+B7Gz1e9tRDsRkmt
	 8SRq/KJDuLqqbzqpPqsDBw1cWM/xYlQqGs3B6ZkcZQk/JBLHmvmswDjiN45emUAf9kSSi
	 dboEdh1FqjWQtNnCtDLg1qbAVAfFngfy5XBx6fyRhgMx9rDjJ7IC6/EtU+ry4F3g4HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794091418;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+hcYI/bpAooFVE+vWiFApfOpXwGF4jtepx4NjpJ1tnQ=;
	b=NBlV07xlOH1gocQJihCoYaATo6fmOmf5I3qhsId56JPy/vxsmmOxMSrWqxeTRWmgWWuv
	 U/GW2zSLsD+OAFG1ou13tddk368HiN00gF3RcKFUhbrryxf5jfggnoTTzMJXWQtsB9E99
	 RaB42i+RkVrqpB2xVobtEod/pAYMm2ZEHa7ltBpom5I4I6x6yUiZMOgVn9uqwu6C1pAHg
	 SKptOfntkj1CP+ftUBYIhBIjpF+rQWOZIYjJf0mXGO2M6OeNR5w6kSH9k6O9i43H9Qm59
	 1Qm3bHpipCCYkkKNR43+uzWTuReX6srV5OJ5etPgr5vuO5hd2omx0MAQmIcj8xlqj4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yo4DuOmw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F947606A326;
	Sat,  7 Nov 2026 22:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yo4DuOmw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9242A1F0089F;
	Sat,  7 Nov 2026 22:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794091417;
	bh=+hcYI/bpAooFVE+vWiFApfOpXwGF4jtepx4NjpJ1tnQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Yo4DuOmwOxE7M3b947MR03jhsVbuh1IMqH1ca/eyC5F0cUei0HY6wsiR0muI5uNzP
	 QmqSVxpQ+RS6a0eR2Qd641eGCcquNTo4AtLxEIkYA6CeYsjpjLwXbImhB1AnesBDg6
	 +tj4cXKaCYrKDXQ2ZtHBfXTCSSKH1u5+oyNx8fHlB1yB72+kRFJRwTuZHsnytt12Bn
	 CcJ7bvAKE9WZwChjbzJIKCZjSQJUHF3pwiAh7Dg4zJjFuvqeqUdR4bMXT/kDuc+SLA
	 OOmQO65Cw3fwnuKmZbVjFPRNfrKUhPq4fHvoGsOCK6j330/nCq9qkhCht2uCXacJ1B
	 JD+sNFeozRZOA==
Message-ID: <sashiko-outbox-203371@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] net: xilinx: axienet: use
 dmaengine_prep_slave_sg_context()
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: dmaengine@vger.kernel.org, linux-sound@vger.kernel.org, imx@lists.linux.dev, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261106-rio_sg-v1-2-bc54b4bd8c95@nxp.com>
References: <20261106-rio_sg-v1-0-bc54b4bd8c95@nxp.com>
 <20261106-rio_sg-v1-2-bc54b4bd8c95@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 22:43:37 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] net: xilinx: axienet: unused dma_dev left in
  axienet_start_xmit_dmaengine()
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [Critical] net: axienet: use-after-free in axienet_stop() [1]
--

commit b4bb968eb4c8d380631e7d9eb4acd99d61288c16
Author: Frank Li <Frank.Li@nxp.com>

net: xilinx: axienet: use dmaengine_prep_slave_sg_context()

This commit replaces the direct call to dma_dev->device_prep_slave_sg() in
axienet_start_xmit_dmaengine() with dmaengine_prep_slave_sg_context().

> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/=
net/ethernet/xilinx/xilinx_axienet_main.c
> index 8a50cad1c104f..fff3530d9359d 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> @@ -1006,9 +1006,10 @@ axienet_start_xmit_dmaengine(struct sk_buff *skb, =
struct net_device *ndev)
>  		app_metadata[0] |=3D 2; /* Tx Full Checksum Offload Enabled */
>  	}
> =20
> -	dma_tx_desc =3D dma_dev->device_prep_slave_sg(lp->tx_chan, skbuf_dma->s=
gl,
> -			sg_len, DMA_MEM_TO_DEV,
> -			DMA_PREP_INTERRUPT, (void *)app_metadata);
> +	dma_tx_desc =3D dmaengine_prep_slave_sg_context(lp->tx_chan, skbuf_dma-=
>sgl,
> +						      sg_len, DMA_MEM_TO_DEV,
> +						      DMA_PREP_INTERRUPT,
> +						      (void *)app_metadata);
>  	if (!dma_tx_desc)
>  		goto xmit_error_unmap_sg;

[Severity: Low]
Does replacing dma_dev->device_prep_slave_sg() leave dma_dev unused in
axienet_start_xmit_dmaengine()?

Earlier in axienet_start_xmit_dmaengine(), dma_dev is still declared and
assigned from lp->tx_chan->device:

drivers/net/ethernet/xilinx/xilinx_axienet_main.c:axienet_start_xmit_dmaeng=
ine() {
	...
	struct dma_device *dma_dev;
	...
	dma_dev =3D lp->tx_chan->device;
	...
}

With its only reader removed, this triggers a -Wunused-but-set-variable
compiler warning and keeps a direct reference to struct dma_device and
lp->tx_chan->device.

[Severity: Critical]
This problem wasn't introduced by this patch, but can axienet_stop() cause
a use-after-free on lp->tx_skb_ring [1] while
axienet_start_xmit_dmaengine() is running?

When lp->use_dmaengine is enabled, axienet_stop() frees lp->tx_skb_ring and
its entries without quiescing the transmit path:

drivers/net/ethernet/xilinx/xilinx_axienet_main.c:axienet_stop() {
	...
	if (!lp->use_dmaengine) {
		WRITE_ONCE(lp->stopping, true);
		flush_work(&lp->dma_err_task);

		napi_disable(&lp->napi_tx);
		napi_disable(&lp->napi_rx);
	}
	...
		for (i =3D 0; i < TX_BD_NUM_MAX; i++) {
			skbuf_dma =3D lp->tx_skb_ring[i];
			...
			kfree(skbuf_dma);
		}
		kfree(lp->tx_skb_ring);
	...
}

CPU0                              CPU1
axienet_stop()
                                  axienet_start_xmit_dmaengine()
  kfree(skbuf_dma)
  kfree(lp->tx_skb_ring)
                                    axienet_get_tx_desc()
                                      <-- use-after-free

A concurrent transmit on CPU1 can fetch and use a descriptor from
lp->tx_skb_ring after CPU0 has freed it, corrupting memory or crashing the
kernel.

[1] https://sashiko.dev/#/bug/linux-6b22a4e9-355d-4ab5-829f-c56ef38ce667

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-rio_sg-v1-=
0-bc54b4bd8c95@nxp.com?part=3D2
