Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123344EC66E;
	Thu,  1 Oct 2026 09:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790846319; cv=none; b=CBeaxWOErYB26+m5eXx6vDhxs7F3uToAjScw5IukFjm3rlaB1HKLnDPFICYm2ZcOEChbxmgt7H34lBMrZcTqJEYRGEPxIkQjIcGECzDA6Ke+RPw9ghp1wwzyRNzg5lw+Rl6omISyLfJECPQzQnwP/ujVVDrj8Uw2CnW/1+NMFxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790846319; c=relaxed/simple;
	bh=ufzIjXGjqxBcAd/a0e9rg4UB79Wk/9Ftbbxo2adPjmw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Wu9jCOUMZHLw+5QngVcdUUmUykg9yLiwU7lnK+kjZiafHTz83T6pO6u5E8dTdrF+49ZEW569JznLWIFSit05j8nnKbjt8h1ZBiAhAVbDQIYC10VFu8tyo+nb4oRUAQc3DQQADWNjwyAX2GXsEQPq0H3O0pjB91vEY91Ve90ohSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JREyhQML; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JREyhQML"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C10A51F000FF;
	Thu,  1 Oct 2026 09:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790846317;
	bh=Kd9//3BpLiLq09ydCIsbelDafF4MS+byhd2+3OBy4W4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JREyhQMLLsd0qWowfVqWr7lnMc2hZLZF9dKE8n9fbD7qlpjT4Uk84LiQxgxuz+2xY
	 GjKHVjGmFiL2N9FigBwIDBJ/DbysHfl6AaRv0dIfasosSIqlk/8jMEXmwEIiBRJHvx
	 xX3lRUalPylc/qJ50tKUTyFmBo6eb2kdj2SBQAmgk4wTRZK0/M1QtLa1TRXAxj6gXs
	 sXSBTlvk3ctRgjK7jmNt6DS7g/e/t2C/InxrmKKrmJy+PGzSF0zB9J6u7/N8eUufoi
	 QoTpQaGmPW7+y1pe7TFGn1Qt7GVFpLoX8+rL7u3XjqKCqLDXR8jVC/q3lKsAYtJmqu
	 X4R5O84sPJ+dA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 16/19] dmaengine: ti: k3-udma-v2: New driver for K3
 BCDMA_V2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Sree Kartheek Adivi" <s-adivi@ti.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20261001084105.1692228-17-s-adivi@ti.com>
References: <20261001084105.1692228-1-s-adivi@ti.com>
 <20261001084105.1692228-17-s-adivi@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 09:18:36 +0000
Message-Id: <20261001091836.C10A51F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] dmaengine: ti: missing of_dma_controller_free() in udma_v2_remove()
- [High] dmaengine: ti: use-after-free due to missing cancel_work_sync() fo=
r purge_work
- [High] dmaengine: ti: sleep in atomic context via udma_reset_rings() in u=
dma_v2_start()
- [High] dmaengine: ti: invalid pointer assignment for BCDMA rflow->reg_rt
- [Medium] dmaengine: ti: missing dma_unmap_single() for rx_flush buffers
- [Medium] dmaengine: ti: missing k3_configure_chan_coherency() cleanup on =
error
- [Low] dmaengine: ti: unnecessary Kconfig dependency on TI_SCI_INTA_IRQCHIP
--

commit e8e40f1e4b5f21e6fd35ecdd799e94a5c516bcb6
Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>

dmaengine: ti: k3-udma-v2: New driver for K3 BCDMA_V2

This commit introduces support for the K3 BCDMA_V2 driver. It handles
architectural changes like static channel mapping, autopairing without PSIL
pair, and directly connected GIC interrupts. It also unifies Tx and Rx chan=
nel
configurations and modifies the match_data structure.

> diff --git a/drivers/dma/ti/Kconfig b/drivers/dma/ti/Kconfig
> index a389ae04ec930..e6a2cf37062e7 100644
> --- a/drivers/dma/ti/Kconfig
> +++ b/drivers/dma/ti/Kconfig
> @@ -49,6 +49,19 @@ config TI_K3_UDMA
>  	  Enable support for the TI UDMA (Unified DMA) controller. This
>  	  DMA engine is used in AM65x and j721e.
> =20
> +config TI_K3_UDMA_V2
> +	tristate "Texas Instruments K3 UDMA v2 support"
> +	depends on ARCH_K3 || COMPILE_TEST
> +	depends on TI_SCI_INTA_IRQCHIP

[Severity: Low]
Is the dependency on TI_SCI_INTA_IRQCHIP required here? The driver appears
to rely exclusively on directly connected GIC interrupts accessed via
platform_get_irq_byname() without using the INT-A router, so keeping this
might prevent the driver from being enabled on K3 architectures that lack t=
he
INT-A interrupt router.

> +	select DMA_ENGINE
> +	select DMA_VIRTUAL_CHANNELS
> +	select TI_K3_UDMA_COMMON
> +	select TI_K3_RINGACC
> +	select TI_K3_PSIL

[ ... ]

> diff --git a/drivers/dma/ti/k3-udma-v2.c b/drivers/dma/ti/k3-udma-v2.c
> new file mode 100644
> index 0000000000000..8465517e8d21a
> --- /dev/null
> +++ b/drivers/dma/ti/k3-udma-v2.c

[ ... ]

> +static int udma_v2_start(struct udma_chan *uc)
> +{

[ ... ]

> +		udma_chanrt_write(uc, UDMA_CHAN_RT_CTL_REG,
> +				  UDMA_CHAN_RT_CTL_EN | UDMA_CHAN_RT_CTL_AUTOPAIR);
> +
> +		/* Poll for autopair completion */
> +		read_poll_timeout_atomic(udma_v2_check_chan_autopair_completion,
> +					 status, status !=3D 0, 100, 500, false, uc);
> +
> +		if (status <=3D 0) {
> +			udma_chanrt_write(uc, UDMA_CHAN_RT_CTL_REG, 0);
> +			/*
> +			 * udma_start_desc() above already pushed uc->desc to
> +			 * the hardware ring. Since the channel never actually
> +			 * started, no completion interrupt will ever arrive
> +			 * to free it - drain the ring and free it here to
> +			 * avoid leaking it.
> +			 */
> +			udma_reset_rings(uc);

[Severity: High]
Can this code sleep in atomic context? udma_v2_start() is called while
holding the uc->vc.lock raw spinlock (e.g. from udma_issue_pending()), but =
if
the autopair times out, it invokes udma_reset_rings(). This eventually calls
k3_ringacc_ring_reset_sci(), which uses the readl_poll_timeout macro that
attempts to sleep via usleep_range.

[ ... ]

> +static int udma_v2_alloc_tx_resources(struct udma_chan *uc)
> +{

[ ... ]

> +	k3_configure_chan_coherency(&uc->vc.chan, uc->config.asel);
> +	ring_cfg.asel =3D uc->config.asel;
> +	ring_cfg.dma_dev =3D dmaengine_get_dma_device(&uc->vc.chan);
> +
> +	ret =3D k3_ringacc_ring_cfg(tchan->t_ring, &ring_cfg);
> +	ret |=3D k3_ringacc_ring_cfg(tchan->tc_ring, &ring_cfg);
> +
> +	if (ret)
> +		goto err_ringcfg;
> +
> +	return 0;
> +
> +err_ringcfg:
> +	k3_ringacc_ring_free(uc->tchan->tc_ring);
> +	uc->tchan->tc_ring =3D NULL;
> +	k3_ringacc_ring_free(uc->tchan->t_ring);
> +	uc->tchan->t_ring =3D NULL;

[Severity: Medium]
Should k3_configure_chan_coherency(&uc->vc.chan, 0) be called here in the
error path? It appears the coherency state is configured earlier in the
function but isn't reverted on failure, potentially leaving the underlying
dma_parms structure incorrectly assigned for subsequent allocation attempts.

> +err_ring:
> +	udma_put_tchan(uc);
> +
> +	return ret;
> +}

[ ... ]

> +static int udma_v2_alloc_rx_resources(struct udma_chan *uc)
> +{

[ ... ]

> +	k3_configure_chan_coherency(&uc->vc.chan, uc->config.asel);
> +	ring_cfg.asel =3D uc->config.asel;
> +	ring_cfg.dma_dev =3D dmaengine_get_dma_device(&uc->vc.chan);
> +
> +	ret =3D k3_ringacc_ring_cfg(rflow->fd_ring, &ring_cfg);
> +
> +	ring_cfg.size =3D K3_UDMA_DEFAULT_RING_SIZE;
> +	ret |=3D k3_ringacc_ring_cfg(rflow->r_ring, &ring_cfg);
> +
> +	if (ret)
> +		goto err_ringcfg;
> +
> +	return 0;
> +
> +err_ringcfg:
> +	k3_ringacc_ring_free(rflow->r_ring);
> +	rflow->r_ring =3D NULL;
> +	k3_ringacc_ring_free(rflow->fd_ring);
> +	rflow->fd_ring =3D NULL;

[Severity: Medium]
Similarly, should k3_configure_chan_coherency(&uc->vc.chan, 0) be added to
this error path to revert the coherency configuration if k3_ringacc_ring_cf=
g()
fails?

> +err_ring:
> +	udma_put_rflow(uc);
> +err_rflow:
> +	udma_put_rchan(uc);
> +
> +	return ret;
> +}

[ ... ]

> +static int udma_v2_probe(struct platform_device *pdev)
> +{

[ ... ]

> +	for (i =3D 0; i < ud->rflow_cnt; i++) {
> +		struct udma_rflow *rflow =3D &ud->rflows[i];
> +
> +		rflow->id =3D i;
> +		rflow->reg_rt =3D ud->rflow_rt + i * 0x2000;
> +	}

[Severity: High]
Can this result in an invalid pointer assignment? For the DMA_TYPE_BCDMA
device type, the base address ud->rflow_rt is never mapped or initialized,
remaining NULL due to the devm_kzalloc allocation. When the K3 UDMA glue
interface configures the RX flow (e.g. via xudma_rflowrt_write()), wouldn't
this dereference an invalid memory-mapped I/O address and cause a kernel pa=
nic?

[ ... ]

> +static void udma_v2_remove(struct platform_device *pdev)
> +{
> +	struct udma_dev *ud =3D platform_get_drvdata(pdev);
> +
> +	dma_async_device_unregister(&ud->ddev);
> +}

[Severity: High]
Does this fail to deregister the OF DMA controller?
of_dma_controller_register() dynamically allocates memory for the of_dma
structure and adds it to the global of_dma_list during probe. Since
of_dma_controller_free() is not called here, could this leak the allocation
and leave a dangling pointer in the global list, risking a use-after-free
if another device requests a DMA channel via the Device Tree after the driv=
er
is unloaded?

[Severity: High]
Is it necessary to call cancel_work_sync(&ud->purge_work) here? The driver
uses an asynchronous workqueue (ud->purge_work) to free descriptors, and the
udma_dev structure is managed by devres (devm_kzalloc) and freed
automatically upon return. Any pending work item could continue to execute
after module unload and dereference the freed ud structure.

[Severity: Medium]
Should dma_unmap_single() be called for the rx_flush buffers?
udma_setup_rx_flush() maps memory buffers and descriptors during probe, but
this remove function does not release those mappings. This leaks IOMMU mapp=
ing
space and, because the memory itself is allocated via devm_kzalloc, it is
freed upon unload, leaving the DMA mapping active and pointing to freed mem=
ory.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001084105.1692=
228-1-s-adivi@ti.com?part=3D16
