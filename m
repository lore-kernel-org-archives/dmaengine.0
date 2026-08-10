Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07BD42EEA1;
	Mon, 10 Aug 2026 17:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786381791; cv=none; b=O+N1MSt7ajY4QrX0YswZdoTtm9Ft9OwAGtg4pQ0V8ljirR46hNi+8RWFJhqykSOSLc2+39RH4LDbMVmum2TjcQCSqIgI+wU55Rw+O8lNInz6K+yW8DPK4JgcZOeDsMbbaBUIanCShDm6Ck2KAUhGVxNBgjLDQuBGIgBwc3fLM8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786381791; c=relaxed/simple;
	bh=teYVyBJnfnzdbrTSCFofSpTx6o+AD1GJwCsfGSZnVfg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ETaccq9xCC2IlXxYns073orB0PampxYiGMK3L5yBoTkSiqMzlkVEUB9CfFdJgSYj4b2iDLpLgYXg36i1lPXVGXoZy9SujhfXiCULhIipdw+VlAjnC5pNR5wFGaGjYKL0JmOwghxU4q5153S5AWvy65vuX26Gjfh8syxX6MVxOzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CnPA5+L/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CnPA5+L/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77B801F000E9;
	Mon, 10 Aug 2026 17:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786381785;
	bh=Q7BcbJgjrwpc1DZNrLjMd6TZ2vR2qVz0sDtkmaFk5a4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CnPA5+L/spRE6JrMl0Oe8hPGCeJ21i5ym/DSd1qLNjocJ/evJAWrwbsvetOH2zVHY
	 kc7pIPSYU6FbyJj1Fg+oMNYEpkj2d+ODIsl0rPZ5LzzfdgDrbEX9ya3EuabGR6qkgh
	 gLC2V5PnziwRAIjx6ro5hP/zKZo/CIBx893+3ZQ68NAgYoWU6b7dfpoN7okIV21Gmm
	 RtOxDXfPr/y32vCSELTol7J3dNXSv8pcgop718B6uZImybAKYGz5BmCXXNCqM1ncE3
	 qcbjhJjSrdIPupy0U3Or0BM5dFTiWf6dvJNC3rQxtEB76WaMWXBdNSaFh4mAXKQAcj
	 Bfh+MJBR9JG/w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 17/19] dmaengine: ti: k3-udma-v2: Add support for
 PKTDMA V2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Sree Kartheek Adivi" <s-adivi@ti.com>
Cc: conor+dt@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org, vkoul@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260810151423.1948224-18-s-adivi@ti.com>
References: <20260810151423.1948224-1-s-adivi@ti.com>
 <20260810151423.1948224-18-s-adivi@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 17:09:43 +0000
Message-Id: <20260810170944.77B801F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [Critical] Unconditional replacement of MSI interrupt fetching breaks exi=
sting V1 PKTDMA devices.
- [High] Unconditional dma_pool_destroy in error path causes a double-free =
of a dangling pointer.
- [High] udma_v2_stop writes to PEER registers on PKTDMA V2, violating hard=
ware spec.
- [Low] Uninitialized static platform_driver used in DMA filter function.

Pre-existing issues:
- [High] DMA Use-After-Free if channel refuses to stop during allocation.
--

--- Patch [17]: [PATCH v8 17/19] dmaengine: ti: k3-udma-v2: Add support for=
 PKTDMA V2 ---
commit 97b7da552f385a68cda5edae3dfd22d57863e91d
Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>

dmaengine: ti: k3-udma-v2: Add support for PKTDMA V2
   =20
The PKTDMA V2 is different than the existing PKTDMA supported by the
k3-udma driver.

The changes in PKTDMA V2 are:
[ ... ]
> - Direct IRQs: There is no INT-A and interrupt lines from DMA are
>   directly connected to GIC.
> - Remote side configuration handled by DMA. So no need to write to
>   PEER registers to START / STOP / PAUSE / TEARDOWN.

[Severity: High]
Does the implementation match this description? udma_v2_stop() is used by
PKTDMA V2 through the udma_v2_probe() assignment, but it unconditionally
writes to UDMA_CHAN_RT_PEER_REG for all non-MEM_TO_MEM transfers.=20

Will writing to these PEER registers on PKTDMA V2 hardware cause any
unexpected hardware exceptions?

> diff --git a/drivers/dma/ti/k3-udma-private.c b/drivers/dma/ti/k3-udma-pr=
ivate.c
> index 44c097fff5ee6..92d44ef9593d1 100644
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
> +	snprintf(irq_name, sizeof(irq_name), "tx-%u", udma_tflow_id);
> +	return platform_get_irq_byname(pdev, irq_name);
>  }

[Severity: Critical]
Does this unconditional replacement break existing V1 PKTDMA devices?

Client drivers for V1 devices that share this exported function will now ca=
ll
platform_get_irq_byname() instead of msi_get_virq().

Since V1 device tree nodes do not define named "tx-%u" interrupts, will this
cause backward compatibility breakage and failures for V1 hardware?

>  EXPORT_SYMBOL(xudma_pktdma_tflow_get_irq);
> =20
>  int xudma_pktdma_rflow_get_irq(struct udma_dev *ud, int udma_rflow_id)
>  {
> -	const struct udma_oes_offsets *oes =3D &ud->soc_data->oes;
> +	struct platform_device *pdev =3D to_platform_device(ud->dev);
> +	char irq_name[10];
> =20
> -	return msi_get_virq(ud->dev, udma_rflow_id + oes->pktdma_rchan_flow);
> +	snprintf(irq_name, sizeof(irq_name), "rx-%u", udma_rflow_id);
> +	return platform_get_irq_byname(pdev, irq_name);
>  }

[Severity: Critical]
Similarly, does this break the RX flow interrupt fetching for V1 devices
that rely on the older MSI approach?

> diff --git a/drivers/dma/ti/k3-udma-v2.c b/drivers/dma/ti/k3-udma-v2.c
> index b9ce58d1934a9..c46341e768cdc 100644
> --- a/drivers/dma/ti/k3-udma-v2.c
> +++ b/drivers/dma/ti/k3-udma-v2.c
> @@ -764,6 +764,146 @@ static int bcdma_v2_alloc_chan_resources(struct dma=
_chan *chan)
>  	return ret;
>  }
> =20
> +static int pktdma_v2_alloc_chan_resources(struct dma_chan *chan)
> +{
[ ... ]
> +	if (udma_is_chan_running(uc)) {
> +		dev_warn(ud->dev, "chan%d: is running!\n", uc->id);
> +		ud->reset_chan(uc, false);
> +		if (udma_is_chan_running(uc)) {
> +			dev_err(ud->dev, "chan%d: won't stop!\n", uc->id);
> +			ret =3D -EBUSY;
> +			goto err_res_free;
> +		}
> +	}

[Severity: High]
This is a pre-existing issue, but can this lead to a DMA use-after-free
if the channel refuses to stop?=20

The error path frees the newly allocated DMA rings, but the hardware ring
was already configured to point to this memory earlier in the function via
udma_v2_alloc_tx_resources() or udma_v2_alloc_rx_resources().=20

If the hardware is still running, could it continue writing to the freed
memory?

[ ... ]
> +err_res_free:
> +	udma_free_tx_resources(uc);
> +	udma_free_rx_resources(uc);
> +
> +	udma_reset_uchan(uc);
> +
> +	dma_pool_destroy(uc->hdesc_pool);
> +	uc->use_dma_pool =3D false;
> +
> +	return ret;
> +}

[Severity: High]
Can this cause a double-free of a dangling pointer?=20

Unlike the BCDMA equivalent, the dma_pool_destroy() call here is
unconditional. If the error path is taken early (e.g., from the
udma_is_chan_running() check above) before a new pool is allocated,
uc->hdesc_pool might still point to an already destroyed pool.

Should this be guarded with a check for uc->use_dma_pool?

> @@ -864,6 +1004,7 @@ static int udma_v2_resume(struct dma_chan *chan)
>  }
> =20
>  static struct platform_driver bcdma_v2_driver;
> +static struct platform_driver pktdma_v2_driver;
> =20
>  static bool udma_v2_dma_filter_fn(struct dma_chan *chan, void *param)
>  {
> @@ -873,7 +1014,8 @@ static bool udma_v2_dma_filter_fn(struct dma_chan *c=
han, void *param)
>  	struct udma_chan *uc;
>  	struct udma_dev *ud;
> =20
> -	if (chan->device->dev->driver !=3D &bcdma_v2_driver.driver)
> +	if (chan->device->dev->driver !=3D &bcdma_v2_driver.driver &&
> +	    chan->device->dev->driver !=3D &pktdma_v2_driver.driver)
>  		return false;

[Severity: Low]
Is pktdma_v2_driver intentionally left uninitialized here?

It is declared as a static struct platform_driver, but doesn't appear to be
defined anywhere in this patch, making this pointer comparison potentially
meaningless.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810151423.1948=
224-1-s-adivi@ti.com?part=3D17
