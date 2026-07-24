Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D06142BC29;
	Fri, 24 Jul 2026 10:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784890735; cv=none; b=mk5gQmC9/I5hozB1HnALkLUEvRnLPZeWfO5IZDXDRtjacTYIPC1x62BSYpf5J46PatwXynVpr1+dT4dfSuQS8a//X2HWoBg27LfgSuWQhLBicz0UHR3D4GjMx+zVqeYmz7iikn3qyRksU2e9nm1xd3pVimuiEEuIUXh349Qg2Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784890735; c=relaxed/simple;
	bh=7KO5AY6/xP42HS8Mb98WVjS44eN8pa4IPDgR2rz7UD0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=D7d0u9ZJMafVUS1A3eWDh6+HNb02AmkPxX6b3T+rmSbgZ+bVqKDTdbF08HFTQDwTckFlpScf1pV4HHzo5RAanqqtBX0JPOGmupb1qFDdeIxHWplzHHYKNWGRBC/aGCOkcxyKvnD8K5cq/O97J88zZzpTvlpEzehWO0ViyXjczN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h+UytFzp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h+UytFzp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 090191F01566;
	Fri, 24 Jul 2026 10:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784890710;
	bh=yMc7gyDK0r0NtkLua7NhcNVnaEzxalhklvUr2E+GHCU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h+UytFzp0//uhc/FltHnzwkFHvPf6KHbo8foSLPNR58LlozbNcPqd3d/tGtBx9E2y
	 rDHFkiIVGe7h9l1+8oBTTadli3rygOJTpdxjR/e0nNzPEb+QsLOrvfeTV0bHfQ3OjT
	 bJKFaxnpX5zFlIDTOPotCYkWLuU0QsMYITFlF+SoTC+00dCA8rrbadu5AHCcJ3mzDQ
	 AsLOIBCuv0ztZTsHOtkyLvZUTUNDUWaWPxUnX324yLVLsJY523q9U/PCdvqlV1PU22
	 Dx+L1Z/tZeE9FHVsvs9hqQhoR4kgT1EkIKaaVaMUt3FQJb3UdmFeMNE0DwNqE+SyEr
	 cKDlkiXKhqCRw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 17/19] dmaengine: ti: k3-udma-v2: Add support for
 PKTDMA V2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Sree Kartheek Adivi" <s-adivi@ti.com>
Cc: conor+dt@kernel.org, vkoul@kernel.org, robh@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260724102115.2854-18-s-adivi@ti.com>
References: <20260724102115.2854-1-s-adivi@ti.com>
 <20260724102115.2854-18-s-adivi@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 10:58:29 +0000
Message-Id: <20260724105830.090191F01566@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Unconditional replacement of msi_get_virq() with platform_get_irq_=
byname() breaks PKTDMA V1 support.
- [High] udma_v2_stop unconditionally writes to UDMA_CHAN_RT_PEER_REG(8), v=
iolating PKTDMA V2 constraints.
- [High] Incorrect num_rings initialization and fd_ring_id calculation for =
PKTDMA V2 causes out-of-bounds array access and RX ring RT register aliasin=
g.
- [High] The IRQ handler is registered with IRQF_SHARED before the channel'=
s work structure is initialized, creating a race condition.
- [Medium] Missing cleanup on error path when platform_get_irq_byname() fai=
ls in pktdma_v2_alloc_chan_resources().
- [Medium] Invalid use of INIT_DELAYED_WORK_ONSTACK for heap-allocated dela=
yed work object.
--

--- Patch [17]: [PATCH v7 17/19] dmaengine: ti: k3-udma-v2: Add support for=
 PKTDMA V2 ---
commit f4058832544fa5fe72bb0caead7472593369f2f4
Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>

dmaengine: ti: k3-udma-v2: Add support for PKTDMA V2

The PKTDMA V2 is different than the existing PKTDMA supported by the
k3-udma driver. It introduces autopairing, static channel mapping,
direct IRQs, and unified channel space.

>     - Remote side configuration handled by DMA. So no need to write to
>       PEER registers to START / STOP / PAUSE / TEARDOWN.

[Severity: High]
The commit message notes that there is no need to write to PEER registers
for operations like STOP. However, does the existing udma_v2_stop() function
still unconditionally write to UDMA_CHAN_RT_PEER_REG(8)?

If PKTDMA V2 hardware does not implement these registers, could this trigger
an asynchronous external abort or bus fault when stopping the channel?

> diff --git a/drivers/dma/ti/k3-udma-private.c b/drivers/dma/ti/k3-udma-pr=
ivate.c
> index 44c097fff5ee6..41299d3c3d91a 100644
> --- a/drivers/dma/ti/k3-udma-private.c
> +++ b/drivers/dma/ti/k3-udma-private.c
> @@ -174,16 +174,20 @@ EXPORT_SYMBOL(xudma_is_pktdma);
> =20
>  int xudma_pktdma_tflow_get_irq(struct udma_dev *ud, int udma_tflow_id)
>  {
> -	const struct udma_oes_offsets *oes =3D &ud->soc_data->oes;
> +	struct platform_device *pdev =3D to_platform_device(ud->dev);
> +	char irq_name[10];
> =20
> -	return msi_get_virq(ud->dev, udma_tflow_id + oes->pktdma_tchan_flow);
> +	snprintf(irq_name, sizeof(irq_name), "tflow%u", udma_tflow_id);
> +	return platform_get_irq_byname(pdev, irq_name);
>  }

[Severity: High]
Does this unconditional change to platform_get_irq_byname() break PKTDMA V1
hardware?

V1 devices rely on MSI interrupts and their device tree nodes might not
contain named interrupt properties like "tflowX", causing interrupt lookups
to fail for all V1 platforms.

>  int xudma_pktdma_rflow_get_irq(struct udma_dev *ud, int udma_rflow_id)
>  {
> -	const struct udma_oes_offsets *oes =3D &ud->soc_data->oes;
> +	struct platform_device *pdev =3D to_platform_device(ud->dev);
> +	char irq_name[10];
> =20
> -	return msi_get_virq(ud->dev, udma_rflow_id + oes->pktdma_rchan_flow);
> +	snprintf(irq_name, sizeof(irq_name), "rflow%u", udma_rflow_id);
> +	return platform_get_irq_byname(pdev, irq_name);
>  }

[Severity: High]
As with xudma_pktdma_tflow_get_irq() above, will this also break V1 hardware
that depends on msi_get_virq() for interrupt lookups?

> diff --git a/drivers/dma/ti/k3-udma-v2.c b/drivers/dma/ti/k3-udma-v2.c
> index e7989b0b34cac..879042bff79a6 100644
> --- a/drivers/dma/ti/k3-udma-v2.c
> +++ b/drivers/dma/ti/k3-udma-v2.c
[ ... ]
> +static int pktdma_v2_alloc_chan_resources(struct dma_chan *chan)
> +{
[ ... ]
> +	if (uc->config.dir =3D=3D DMA_MEM_TO_DEV)
> +		snprintf(irq_name, sizeof(irq_name), "tflow%u", irq_ring_idx);
> +	else
> +		snprintf(irq_name, sizeof(irq_name), "rflow%u", irq_ring_idx);
> +	uc->irq_num_ring =3D platform_get_irq_byname(pdev, irq_name);
> +	if (uc->irq_num_ring < 0)
> +		return uc->irq_num_ring;

[Severity: Medium]
If platform_get_irq_byname() fails here, the direct return bypasses the
err_res_free cleanup block. Does this leak the descriptor pool
(uc->hdesc_pool) and the DMA rings allocated earlier in this function?

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
> +
> +	INIT_DELAYED_WORK_ONSTACK(&uc->tx_drain.work,
> +				  udma_check_tx_completion);

[Severity: High]
Because request_irq() is called with IRQF_SHARED prior to initializing
the delayed work structure, could a pending spurious interrupt or shared
IRQ cause udma_v2_ring_irq_handler() to run concurrently?

If the handler processes a descriptor and calls schedule_delayed_work(),
it would operate on uninitialized memory before INIT_DELAYED_WORK_ONSTACK()
is executed.

[Severity: Medium]
Additionally, is INIT_DELAYED_WORK_ONSTACK() the correct macro to use here?

The uc object is part of ud->channels which is allocated on the heap via
devm_kcalloc() during setup. Using the _ONSTACK variant registers the
object with lockdep's object tracker as a stack object, which could corrupt
lockdep state tracking and leak memory in the tracker since there is no
matching destroy_delayed_work_on_stack() on teardown. This pattern also
appears in bcdma_v2_alloc_chan_resources().

[ ... ]
> @@ -1101,7 +1274,17 @@ static int udma_v2_probe(struct platform_device *p=
dev)
> =20
>  	struct k3_ringacc_init_data ring_init_data =3D {0};
> =20
> -	ring_init_data.num_rings =3D ud->bchan_cnt + ud->chan_cnt;
> +	if (ud->match_data->type =3D=3D DMA_TYPE_BCDMA) {
> +		ring_init_data.num_rings =3D ud->bchan_cnt + ud->chan_cnt;
> +	} else if (ud->match_data->type =3D=3D DMA_TYPE_PKTDMA) {
> +		ring_init_data.num_rings =3D ud->rflow_cnt;
> +
> +		ud->rflow_rt =3D devm_platform_ioremap_resource_byname(pdev, "ringrt");
> +		if (IS_ERR(ud->rflow_rt))
> +			return PTR_ERR(ud->rflow_rt);
> +
> +		ring_init_data.base_rt =3D ud->rflow_rt;
> +	}

[Severity: High]
Is ring_init_data.num_rings incorrectly sized here for PKTDMA V2?

It is currently set to only ud->rflow_cnt. If this should be
ud->tflow_cnt + ud->rflow_cnt, later calculations for fd_ring_id
in udma_v2_alloc_rx_resources() (which computes ud->tflow_cnt + rflow->id)
will generate IDs that exceed the allocated rings. Passing these
out-of-bounds IDs to k3_ringacc_request_rings_pair() could read and write
past the end of the ring arrays.

Furthermore, does initializing ud->rflow_rt at offset 0 cause the RX flows
to alias exactly over the TX flows' register space in hardware when
rflow->reg_rt is configured during probe?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724102115.2854=
-1-s-adivi@ti.com?part=3D17
