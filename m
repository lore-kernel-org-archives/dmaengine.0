Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32022F8EA1;
	Mon, 28 Sep 2026 03:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790565712; cv=none; b=NgSrBCz7Qaos+rBRvfUr1SorskEkmMAoDk7LVic0T8DAphqD0sONDjA2uyvbmojWxHndMC55DHaCGkz/N+hMEgXmAdMXk04zScv5AuTZM6brYc7i5lTxHM4q08+TFDgV1APR7E4dLhL3iuibAOgTiEzNMfKlDQmzuSbRRugIGgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790565712; c=relaxed/simple;
	bh=qd4i876AwlDiuj/o+pjS+4zTFW8FbMUJdLH9a+IgGtc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Srb8juXii4CKLFpsv64zTGD4yU/kJBXW+rp1ynHaMh13GT0BKnIDaW3BPduoDjwwz2hWbDvD2PosY5T/mDHcKKVT4jUeygENP8qOvt1yQRZLx8t9Zqw4yIM53Xn4eDaJcL/Q5wRb19BVhUifT2XwGB3CpzuIpUXt5UPy8j20f00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NwlCDs3P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NwlCDs3P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 486851F000FF;
	Mon, 28 Sep 2026 03:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790565710;
	bh=NW1Xj2d8BY+XT49pMA1sRLaSycufD353P7JQSFeB19Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NwlCDs3PsluZKJGim0lwbslEiyHfyHYuCPyr4AaiK2rzoFyF96SjLBc7LzHv9myIK
	 foiuMfOVLf63yT9Y7I2t6WzECvpoFrJ0WmX2jpKOcE3+um908Gb154QEBue8EOGFiL
	 ajh5XeKPz3PFIxbPsM3Yf21uF1wX5RuG5AOW+qDjp8NIEohOAhZLcltjYQFcz5DQOi
	 ScHkColA9DX7kDeVJJsx3tyohqEky16ZlR5ATmR6BJSD3LkNt8XbbFnh8SOtnqRDbY
	 qBXgbv/bD8mbjqH0I2RVZWdyMpuRVSa/BCp5iKH0QrVCcmQ9vVf3IFiMkrckFvwWSh
	 ehpW2yNF40UFQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 17/19] dmaengine: ti: k3-udma-v2: Add support for
 PKTDMA V2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Sree Kartheek Adivi" <s-adivi@ti.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260928025749.1055383-18-s-adivi@ti.com>
References: <20260928025749.1055383-1-s-adivi@ti.com>
 <20260928025749.1055383-18-s-adivi@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 03:21:49 +0000
Message-Id: <20260928032150.486851F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] dmaengine: ti: k3-udma: inconsistent IRQ lookup keys for PKTDMA V2
- [High] dmaengine: ti: k3-udma: ring reset races with interrupt handler
--

commit 9f976c6183eaa9059066ffde518addf6969bc382
Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>
Subject: dmaengine: ti: k3-udma-v2: Add support for PKTDMA V2

The PKTDMA V2 is different than the existing PKTDMA supported by the
k3-udma driver.

> diff --git a/drivers/dma/ti/k3-udma-private.c b/drivers/dma/ti/k3-udma-pr=
ivate.c
> index 44c097fff5ee6..525155d3bb513 100644
> --- a/drivers/dma/ti/k3-udma-private.c
> +++ b/drivers/dma/ti/k3-udma-private.c
> @@ -174,16 +174,30 @@ EXPORT_SYMBOL(xudma_is_pktdma);
> =20
>  int xudma_pktdma_tflow_get_irq(struct udma_dev *ud, int udma_tflow_id)
>  {
> -	const struct udma_oes_offsets *oes =3D &ud->soc_data->oes;
> +	if (ud->match_data->version =3D=3D K3_UDMA_V1) {
> +		const struct udma_oes_offsets *oes =3D &ud->soc_data->oes;
> =20
> -	return msi_get_virq(ud->dev, udma_tflow_id + oes->pktdma_tchan_flow);
> +		return msi_get_virq(ud->dev, udma_tflow_id + oes->pktdma_tchan_flow);
> +	}
> +	struct platform_device *pdev =3D to_platform_device(ud->dev);
> +	char irq_name[10];
> +
> +	snprintf(irq_name, sizeof(irq_name), "tx-%u", udma_tflow_id);

[Severity: High]
Does this cause an inconsistent IRQ lookup? In
pktdma_v2_alloc_chan_resources(), the driver formats the interrupt name
using mapped_channel_id. However, here in the glue layer helper, the same
string format is used with the flow ID (udma_tflow_id).

Since flow ID and mapped channel ID can differ in PKTDMA V2 (for example,
tflow_cnt=3D112 vs chan_cnt=3D97), they could look up different strings for=
 the
exact same device node, leading to either the DMA engine or the glue layer
client acquiring the wrong interrupt.

> +	return platform_get_irq_byname(pdev, irq_name);
>  }
>  EXPORT_SYMBOL(xudma_pktdma_tflow_get_irq);

[ ... ]

> diff --git a/drivers/dma/ti/k3-udma-v2.c b/drivers/dma/ti/k3-udma-v2.c
> index ba3042e866cac..a71471aa7707a 100644
> --- a/drivers/dma/ti/k3-udma-v2.c
> +++ b/drivers/dma/ti/k3-udma-v2.c

[ ... ]

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
> +
> +	if (ret) {
> +		dev_err(ud->dev, "chan%d: ring irq request failed\n", uc->id);
> +		goto err_irq_free;
> +	}
> +
> +	uc->irq_num_udma =3D 0;
> +
> +	udma_reset_rings(uc);

[Severity: High]
Does this create a race condition where the interrupt handler might execute
before the ring state is fully reset?

If the shared IRQ line fires early or a stale interrupt is already pending,
udma_v2_ring_irq_handler() could be called before udma_reset_rings()
completes. Would it be safer to reset the hardware state before requesting
the IRQ?

> +
> +	if (uc->tchan)
> +		dev_dbg(ud->dev,
> +			"chan%d: tchan%d, tflow%d, Remote thread: 0x%04x\n",
> +			uc->id, uc->tchan->id, uc->tchan->tflow_id,
> +			uc->config.remote_thread_id);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928025749.1055=
383-1-s-adivi@ti.com?part=3D17
