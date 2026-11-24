Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795522514;
	b=JD38/ZLq8qVusDZKZjl8+Iwz8Q5ZxyfUeh+wrDFyH/t3VymRpwWAJExpMWnCfjDn+I8L
	 UGODZsHDvam3DdnxUNzuXcgNY2G7/GxQ4w5S7e3rD2NIzxQVlDTslu2uufFISmWlWyjUX
	 1hN0leeYCilYyc5ta9L8jOqOpb4H6VuSB84vqV7mmipKIM2ZLVY8f8rD5BkqnN94WR5R5
	 Qdvs8fM7FgnitYvaHcfdFKTpV3C+fR+qyI8MQID2nM3YXLyluAvzFQwkp4GRoebRSDfQp
	 KJY6xmxR0JpGAw6YmOHvve89V7v+JRXY92bU/iyWVhSkdSDCY3tsad9vZ34I6lFObPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795522514;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=E7EibK+hFKZvFk8w419/sL+3J3VXZe/67YoO5Ks2ArQ=;
	b=AW9WFKelnEhhfTKcamWxKTn674MIX0dAMUoFuCI6RdDiA4Tru49sCk7TEZnUCuBbnW1O
	 YB0hwwPLOmCw2mvLmCIGxrxciyuCqtAKqwFbwkzo9Y/bOkw4FZJOcZEZ0KLTSIWhBrkWG
	 nt9lyWLYPgacHB3weftcKvJz6XYCWLQH8zjDh+ieBXi4LIQXOD0PXGdUMZRHaOmtCcoAh
	 M6ptMfQBGf6lcYp/eGl2nR5A6fucAF5JZt1fqhsk9Q+HkIw9a86n4zCvDDn25CdDpPhCK
	 zKa4xpb/x9L3BgoO550+4//5utZSzZLzmyGlKXRzBcSQJwoJoyuznBs1B7TrON+07gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EjSeSYhC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2918A606A322;
	Tue, 24 Nov 2026 12:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EjSeSYhC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6980B1F000CA;
	Tue, 24 Nov 2026 12:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795522513;
	bh=E7EibK+hFKZvFk8w419/sL+3J3VXZe/67YoO5Ks2ArQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EjSeSYhCm8aMssDz3OmXselZUp5rPUWIDcTJfvHcj8hqBwnetQyfsdE0AwECR+byD
	 ftsAn9p7IrqGL+Rii0rk6wu0DYg0hGo+4w+F7Vv3fasEW8HJ+aWg8sAw4INUe1wApb
	 qAzh85GqFvvNQSG8dfn6wbgPTamCleVrI6OjFxBLJTskHopRuh5wCOMhok6x8xDO4c
	 StStYjw7P3fdL8j9+hUUNwp6wv9tTii/0odaoIZr2yo5+Awns1Jb9yVTK3G4tb/q2O
	 5fLHT16QZONttOcsDcoVQFnOdax6t7L3vm8htSi8oL6ZdaLoNUjeX72AgrrgD22r/w
	 LtX2EMZ5p3R6w==
Message-ID: <sashiko-outbox-231113@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 18/20] dmaengine: ti: k3-udma-v2: Add support for
 PKTDMA V2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Sree Kartheek Adivi" <s-adivi@ti.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261124-dma-upstream-v13-v13-18-bd4251fdc6d4@ti.com>
References: <20261124-dma-upstream-v13-v13-0-bd4251fdc6d4@ti.com>
 <20261124-dma-upstream-v13-v13-18-bd4251fdc6d4@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 12:15:13 +0000
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
- [Medium] dmaengine: ti: udma_v2_ring_irq_handler() returns IRQ_NONE on
  RX flush
- [Medium] dmaengine: ti: DMA mapping leaks in udma_setup_rx_flush() and
  udma_v2_probe()
--

commit 74ef5c8403c0ade47f8474143e24c79e84d3e99f
Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>

dmaengine: ti: k3-udma-v2: Add support for PKTDMA V2

This commit adds support for PKTDMA V2 to the k3-udma-v2 driver, glue
layer, and common resource setup code.

> diff --git a/drivers/dma/ti/k3-udma-v2.c b/drivers/dma/ti/k3-udma-v2.c
> index b401d4ba17ded..7d3dd9c552c3a 100644
> --- a/drivers/dma/ti/k3-udma-v2.c
> +++ b/drivers/dma/ti/k3-udma-v2.c
[ ... ]
> @@ -803,6 +803,155 @@ static int bcdma_v2_alloc_chan_resources(struct dma=
_chan *chan)
>  	return ret;
>  }
> =20
> +static int pktdma_v2_alloc_chan_resources(struct dma_chan *chan)
> +{
[ ... ]
> +	if (uc->config.dir =3D=3D DMA_MEM_TO_DEV)
> +		snprintf(irq_name, sizeof(irq_name), "tx-%u", irq_ring_idx);
> +	else
> +		snprintf(irq_name, sizeof(irq_name), "rx-%u", irq_ring_idx);
> +	uc->irq_num_ring =3D platform_get_irq_byname(pdev, irq_name);
> +	if (uc->irq_num_ring < 0) {
> +		ret =3D uc->irq_num_ring;
> +		goto err_res_free;
> +	}
> +
> +	ret =3D request_irq(uc->irq_num_ring, udma_v2_ring_irq_handler,
> +			  IRQF_SHARED | IRQF_TRIGGER_HIGH, uc->name, uc);

[Severity: Medium]
Does udma_v2_ring_irq_handler() return IRQ_NONE after servicing an RX flush
descriptor on a PKTDMA V2 channel?

When udma_v2_stop() stops a non-cyclic DMA_DEV_TO_MEM channel with no
active descriptor, it pushes the packet-mode RX flush descriptor onto
uc->rflow->fd_ring.  When the hardware returns that descriptor on
uc->rflow->r_ring, udma_pop_from_ring() pops it and returns -ENOENT:

drivers/dma/ti/k3-udma-common.c:udma_pop_from_ring() {
    ...
	/* Check for flush descriptor */
	if (udma_desc_is_rx_flush(uc, *addr))
		return -ENOENT;

	return 0;
}

drivers/dma/ti/k3-udma-v2.c:udma_v2_ring_irq_handler() {
    ...
	if (udma_pop_from_ring(uc, &paddr) || !paddr)
		return IRQ_NONE;
    ...
}

Because the handler is registered with IRQF_SHARED, returning IRQ_NONE
after consuming the ring entry causes the spurious-IRQ detector to count an
unhandled interrupt on teardown, which can eventually disable the IRQ line.
Notice that the V1 udma_ring_irq_handler() returns IRQ_HANDLED when
udma_pop_from_ring() returns -ENOENT.

[ ... ]

> @@ -1181,8 +1381,18 @@ static int udma_v2_probe(struct platform_device *p=
dev)
>  	ud->ddev.dbg_summary_show =3D udma_dbg_summary_show;
>  #endif
> =20
> -	ud->ddev.device_alloc_chan_resources =3D
> -		bcdma_v2_alloc_chan_resources;
> +	switch (ud->match_data->type) {
> +	case DMA_TYPE_BCDMA:
> +		ud->ddev.device_alloc_chan_resources =3D
> +			bcdma_v2_alloc_chan_resources;
> +		break;
> +	case DMA_TYPE_PKTDMA:
> +		ud->ddev.device_alloc_chan_resources =3D
> +			pktdma_v2_alloc_chan_resources;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> =20
>  	ud->ddev.device_free_chan_resources =3D udma_free_chan_resources;

[Severity: Medium]
Do the error paths in udma_setup_rx_flush() and udma_v2_probe() leak the
RX flush DMA mappings?

udma_setup_rx_flush() maps rx_flush->buffer_paddr,
rx_flush->hwdescs[0].cppi5_desc_paddr, and
rx_flush->hwdescs[1].cppi5_desc_paddr with dma_map_single(), but if a later
devm_kzalloc() or dma_map_single() call in that function fails, it returns
-ENOMEM without unmapping the earlier buffers.

Similarly, in udma_v2_probe(), if devm_kasprintf(),
dma_async_device_register(), or of_dma_controller_register() fails after
udma_setup_rx_flush() succeeds, udma_v2_probe() returns without calling
udma_teardown_rx_flush(ud):

drivers/dma/ti/k3-udma-v2.c:udma_v2_probe() {
    ...
	ret =3D udma_setup_rx_flush(ud);
	if (ret)
		return ret;
    ...
	ret =3D of_dma_controller_register(dev->of_node, udma_v2_of_xlate, ud);
	if (ret) {
		dev_err(dev, "failed to register of_dma controller\n");
		dma_async_device_unregister(&ud->ddev);
	}

	return ret;
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-dma-upstre=
am-v13-v13-0-bd4251fdc6d4@ti.com?part=3D18
