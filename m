Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E223839B7;
	Tue, 22 Sep 2026 07:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790061768; cv=none; b=EG4EbxdPgjgayeWAi1QD0PVaeTONbgeoWkS8vSTqUz0Tm9RBFOYlnTvZCghvVNGXoLicXig1dMKdSZnaBEsrySE55nmo1Q+Ewr40I9t06Ccu0lqP+WuvtSOCBhDLUxgHKRq4+ZaBrBhXGhjB7cL5zQSeoNCtpI8D5QC5VNCFLII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790061768; c=relaxed/simple;
	bh=jFXbOvV1XkqfIfGlbVDmaVMWCKW9dRvGw3tw0keKxfQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Tu6YIojsMj1iVD1B/4WKl4AFiyrqgVWme4GjANSFl98JXiDD1TCszvxyiOFP/8S9kUQs41RNaAdrUpgUl2nrlGd7kZUXBXye6GC5kad9rw5KpKICS0ClgZ6NyF1RLPKrK2tWpbIIG67Fb0qoAyZ09H7HBC9/k4jzYjHyj1dyNAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NDCn6opb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NDCn6opb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C8D01F00893;
	Tue, 22 Sep 2026 07:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790061766;
	bh=UOKYh74cBYqQKkOP48mOwQp81+BIfXrsRyOjOSYV7Po=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NDCn6opbs+P5mlfvv0b6GbWNQ7eujsQs82K9BNoN7U+MTudvh/hRG1B63SZzXbRDJ
	 f1vPLmiNu4N84MzMyEm50L+rmmde2FKfU7ss9EIeFRNNko+hLvWA6N0Uuh4nKpfrYd
	 xYJl/sXWpJXYc/W2IXm1ZLGah7ZqPLAq41gh6367sQ7MCHjx+8B/bPMJ2TDvMYh1jb
	 GrePHx6jEBCoe600rMEhaEPyqcpVl2V8U4Pb/0ils/Ebi9AeKhrHxMqTpfVvorYLoi
	 ghp5MVAub/1W+Jize3oyR1oWYHd3NIjhX/S25qiq4dJo0nqzQjVKBKxF6A4J6a+4tS
	 3Ni0BXogND9jw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 16/19] dmaengine: ti: k3-udma-v2: New driver for K3
 BCDMA_V2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Sree Kartheek Adivi" <s-adivi@ti.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, robh@kernel.org, vkoul@kernel.org
In-Reply-To: <20260922064902.2719979-17-s-adivi@ti.com>
References: <20260922064902.2719979-1-s-adivi@ti.com>
 <20260922064902.2719979-17-s-adivi@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 07:22:46 +0000
Message-Id: <20260922072246.7C8D01F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] Missing NULL check for devm_kasprintf() return value in channel in=
itialization
- [High] Dangling pointer uc->chan causes use-after-free register corruption
- [High] Missing driver remove function causes resource leaks and UAF on mo=
dule unload
- [Medium] Kconfig unmet direct dependency for TI_K3_RINGACC
- [Medium] Ring IRQ handler erroneously returns IRQ_NONE after servicing TR=
 interrupt
- [Low] Returning a negative errno (-ENOENT) from an irqreturn_t function
- [Low] Redundant consecutive MMIO writes to channel control register
--

commit 9332700324e4002eaf2d2700e1d64d1763905a6e
Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>
Subject: dmaengine: ti: k3-udma-v2: New driver for K3 BCDMA_V2

This commit adds a new driver for the TI BCDMA_V2 controller. It supports
autopairing, static channel mapping, direct IRQs, and a unified channel
register space where Tx and Rx channels share indices.

> diff --git a/drivers/dma/ti/Kconfig b/drivers/dma/ti/Kconfig
> --- a/drivers/dma/ti/Kconfig
> +++ b/drivers/dma/ti/Kconfig

[ ... ]

> @@ -49,6 +49,18 @@ config TI_K3_UDMA
>  	  Enable support for the TI UDMA (Unified DMA) controller. This
>  	  DMA engine is used in AM65x and j721e.
> =20
> +config TI_K3_UDMA_V2
> +	tristate "Texas Instruments K3 UDMA v2 support"
> +	depends on ARCH_K3
> +	select DMA_ENGINE
> +	select DMA_VIRTUAL_CHANNELS
> +	select TI_K3_UDMA_COMMON
> +	select TI_K3_RINGACC

[Severity: Medium]
Will selecting TI_K3_RINGACC without inheriting its direct dependency on
TI_SCI_INTA_IRQCHIP cause an unmet direct dependencies warning during the
build? It seems Kconfig could force TI_K3_RINGACC on without the required
IRQ chip infrastructure.

> +	select TI_K3_PSIL
> +        help
> +	  Enable support for the TI UDMA (Unified DMA) v2 controller. This
> +	  DMA engine is used in AM62L.

[ ... ]

> diff --git a/drivers/dma/ti/k3-udma-v2.c b/drivers/dma/ti/k3-udma-v2.c
> --- /dev/null
> +++ b/drivers/dma/ti/k3-udma-v2.c

[ ... ]

> +static int udma_v2_reset_chan(struct udma_chan *uc, bool hard)
> +{
> +	udma_chanrt_write(uc, UDMA_CHAN_RT_CTL_REG, 0);

[Severity: High]
Does the resource cleanup logic (like in bcdma_put_bchan) clear the newly
introduced V2 alias uc->chan? If the alias is left dangling after primary
pointers are set to NULL, would udma_chanrt_write() bypass the macro's safe=
ty
check and inadvertently write to a freed hardware register here?

> +
> +	/* Reset all counters */
> +	udma_v2_reset_counters(uc);

[ ... ]

> +static int udma_v2_start(struct udma_chan *uc)
> +{

[ ... ]

> +	case DMA_MEM_TO_MEM:
> +		udma_bchanrt_write(uc, UDMA_CHAN_RT_CTL_REG,
> +				   UDMA_CHAN_RT_CTL_EN);
> +		udma_bchanrt_write(uc, UDMA_CHAN_RT_CTL_REG,
> +				   UDMA_CHAN_RT_CTL_EN);
> +
> +		break;

[Severity: Low]
This isn't a bug, but is the duplicate write to UDMA_CHAN_RT_CTL_REG
intentional here? It looks like it might be a copy-paste artifact from the
V1 architecture where both tchan and rchan were separately enabled.

> +	default:
> +		return -EINVAL;
> +	}

[ ... ]

> +static irqreturn_t udma_v2_udma_irq_handler(int irq, void *data)
> +{
> +	struct udma_chan *uc =3D data;
> +	struct udma_dev *ud =3D uc->ud;
> +	struct udma_desc *d;
> +
> +	switch (uc->config.dir) {
> +	case DMA_DEV_TO_MEM:
> +		k3_ringacc_ring_clear_irq(uc->rflow->r_ring,
> +					  K3_RINGACC_RT_INT_STATUS_TR);
> +		break;
> +	case DMA_MEM_TO_DEV:
> +	case DMA_MEM_TO_MEM:
> +		k3_ringacc_ring_clear_irq(uc->tchan->tc_ring,
> +					  K3_RINGACC_RT_INT_STATUS_TR);
> +		break;
> +	default:
> +		return -ENOENT;

[Severity: Low]
This isn't a bug, but should this return IRQ_NONE instead of a negative err=
no?
Returning -ENOENT from a function returning irqreturn_t breaks kernel type
semantics.

> +	}

[ ... ]

> +static irqreturn_t udma_v2_ring_irq_handler(int irq, void *data)
> +{

[ ... ]

> +	if (intr_status & K3_RINGACC_RT_INT_STATUS_TR) {
> +		reg =3D udma_chanrt_read(uc, UDMA_CHAN_RT_CTL_REG);
> +
> +		/* check teardown status */
> +		if ((reg & UDMA_CHAN_RT_CTL_TDOWN) && !(reg & UDMA_CHAN_RT_CTL_EN))
> +			complete_all(&uc->teardown_completed);
> +		udma_v2_udma_irq_handler(irq, data);
> +
> +		if (!(intr_status & K3_RINGACC_RT_INT_STATUS_COMPLETE))
> +			return IRQ_HANDLED;
> +	}
> +
> +	if (udma_pop_from_ring(uc, &paddr) || !paddr)
> +		return IRQ_NONE;

[Severity: Medium]
If the handler successfully processes a TR interrupt in the block above
(because both TR and COMPLETE bits are set), could returning IRQ_NONE here
if the ring is empty violate IRQ subsystem semantics? Repeated occurrences
might cause the kernel to permanently disable the IRQ line as a spurious
interrupt.

> +
> +	spin_lock(&uc->vc.lock);

[ ... ]

> +static int udma_v2_probe(struct platform_device *pdev)
> +{

[ ... ]

> +	for (i =3D 0; i < ch_count; i++) {
> +		struct udma_chan *uc =3D &ud->channels[i];
> +
> +		uc->ud =3D ud;
> +		uc->vc.desc_free =3D udma_desc_free;
> +		uc->id =3D i;
> +		uc->bchan =3D NULL;
> +		uc->tchan =3D NULL;
> +		uc->rchan =3D NULL;
> +		uc->config.remote_thread_id =3D -1;
> +		uc->config.mapped_channel_id =3D -1;
> +		uc->config.default_flow_id =3D -1;
> +		uc->config.dir =3D DMA_MEM_TO_MEM;
> +		uc->name =3D devm_kasprintf(dev, GFP_KERNEL, "%s chan%d",
> +					  dev_name(dev), i);

[Severity: High]
Does this devm_kasprintf() return value need validation? If the allocation
fails and returns NULL, this is later passed to dma_pool_create() via
bcdma_v2_alloc_chan_resources(), which will unconditionally dereference it =
and
cause a kernel panic.

> +
> +		vchan_init(&uc->vc, &ud->ddev);

[ ... ]

> +static struct platform_driver bcdma_v2_driver =3D {
> +	.driver =3D {
> +		.name	=3D "ti-udma-v2",
> +		.of_match_table =3D udma_of_match,
> +		.suppress_bind_attrs =3D true,
> +		.pm =3D &udma_pm_ops,
> +	},
> +	.probe		=3D udma_v2_probe,
> +};

[Severity: High]
Since this driver is registered via module_platform_driver(), could the lack
of a .remove callback lead to resource leaks and a use-after-free on module
unload? Subsystems like dma_async_device_register() and requested DMA rings
will not be unregistered, leaving dangling pointers in the global
dma_device_list.

> +
> +module_platform_driver(bcdma_v2_driver);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922064902.2719=
979-1-s-adivi@ti.com?part=3D16
