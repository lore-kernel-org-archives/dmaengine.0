Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57AFA3F7A83;
	Wed, 30 Sep 2026 06:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790750549; cv=none; b=SG5FBOL4gvzYypzKm8gheJ73dIvxRAlqCICtlKoAl9NjABj//yht418foqtVp8yBhOYqv1HCsBz8vETDw7R0zNXNnsqTvimDTTG5XUEVwX1wIdFnVpe4FmfFiTUre4Rsd6YW2h4RVWJ946BkF7zLmIE+dlIuJaLE7OImjIoxnSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790750549; c=relaxed/simple;
	bh=74jGOKNy06GtoV2B2Fe7tOV/7d3Tk5HmIRlBTUhMmlg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EDQxVsGW9GXIf6SN27d1Mx89QpDUVriamoz3LMsR3hUPH2isR2Bqg25pJ8JDqrpgUDrVg7TQqYpQXHqg2gt0cpBr9OxjqZzHPu0SkljTD0uFNvIeRaRnPWVEAkTg2BPT0/Z0vTLnRGSbJqtthTh6ZI3T3euIBLrPscts6/ZIIHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kiyd+1mX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kiyd+1mX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59C941F00899;
	Wed, 30 Sep 2026 06:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790750544;
	bh=l5XnjuvfAn+K0WRne2CPMuzLBADBHhfM/FU0da6hkZ8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kiyd+1mXL7ZMXlHz/Pnkl0PyZAuW3WDGk7CtbOqj3kqJ5IPM/C8Wz+Dmju8k1ghUO
	 ViZ6edayajh0sYWfSgKvc9LYMBswSSCy+Y8i3zOQe52Ia86WHkDYmspbN+Hq4AmpOg
	 AtHd369DpPp5TgM6xP9f2XSqMmDugu9kprqPj4EeFbyirL9gEuUiXzDWkFJlF+sMjz
	 +SvNAosdocDDnfMGe7lxc//0zx5jZn8a2oSwLXPd1fTdn7wqxf6GRTcASip+RXyOhJ
	 8as2Jk+7meJVKd1MNqAakNnWHCQ6T46PMq+HBK+8zFw6uGPoTPosXvgdDlIhKGjKwp
	 awzwz4+M/vEHQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] dmaengine: fsl-edma: support per-channel DT
 child nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: imx@lists.linux.dev, vkoul@kernel.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260930-edma-iommu-v2-2-72a62bf44c74@nxp.com>
References: <20260930-edma-iommu-v2-0-72a62bf44c74@nxp.com>
 <20260930-edma-iommu-v2-2-72a62bf44c74@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 06:42:23 +0000
Message-Id: <20260930064224.59C941F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] dmaengine: fsl-edma: kernel panic due to post-registration dev->bu=
s modification
- [High] dmaengine: fsl-edma: probe deferral masked in DT IRQ lookup
- [Low] dmaengine: fsl-edma: compilation failure due to undefined function =
and member
--

commit 7b47892ce3017d20fbf0bc531e1531f30816d5d2
Author: Peng Fan <peng.fan@nxp.com>

    dmaengine: fsl-edma: support per-channel DT child nodes

This commit adds support for parsing per-channel child nodes from the
devicetree. It configures per-channel IRQs and IOMMUs based on the child
properties. Existing devicetrees without child nodes continue to work as
before.

> diff --git a/drivers/dma/fsl-edma-main.c b/drivers/dma/fsl-edma-main.c
> index d9fb717b5b53c..e7e5b33cfcb20 100644
> --- a/drivers/dma/fsl-edma-main.c
> +++ b/drivers/dma/fsl-edma-main.c
[ ... ]
> @@ -695,6 +699,133 @@ static int fsl_edma3_attach_pd(struct platform_devi=
ce *pdev, struct fsl_edma_eng
[ ... ]
> +static int fsl_edma_configure_chan_from_dt(struct platform_device *pdev,
> +					   struct fsl_edma_engine *fsl_edma)
> +{
[ ... ]
> +	for_each_available_child_of_node(np, child) {
> +		struct fsl_edma_chan *fsl_chan;
> +		int ch_id, irq;
[ ... ]
> +		fsl_chan =3D &fsl_edma->chans[ch_id];
> +
> +		irq =3D of_irq_get(child, 0);
> +		if (irq > 0) {
> +			fsl_chan->txirq =3D irq;
> +			fsl_chan->irq_handler =3D fsl_edma3_tx_handler;
> +		}

[Severity: High]
If of_irq_get() returns -EPROBE_DEFER because the interrupt controller
is not yet ready, it seems that error code is silently dropped since
only irq > 0 is checked.

Later in fsl_edma3_irq_init(), if fsl_chan->txirq <=3D 0, it tries to fall
back to platform_get_irq() which will fail because the interrupts are
defined in the child nodes.

Would this cause fsl_edma3_irq_init() to return -EINVAL, permanently failing
the probe instead of correctly deferring it?

> +	}
> +
> +	return 0;
> +}
> +
> +static int fsl_edma_configure_chan_iommu(struct platform_device *pdev,
> +					struct fsl_edma_engine *fsl_edma)
> +{
[ ... ]
> +	for_each_available_child_of_node(np, child) {
> +		struct fsl_edma_chan *fsl_chan;
> +		int ch_id;
[ ... ]
> +		list_for_each_entry(chan, &fsl_edma->dma_dev.channels,
> +				    device_node) {
> +			struct device *chdev;
> +
> +			if (to_fsl_edma_chan(chan) !=3D fsl_chan)
> +				continue;
> +
> +			chdev =3D dmaengine_chan_dev(chan);

[Severity: Low]
Does dmaengine_chan_dev() exist in the kernel?

It looks like this might cause a compilation failure because the function is
undefined.

> +			chdev->bus =3D pdev->dev.bus;

[Severity: High]
Is it safe to modify the bus of an already-registered device here?

Since fsl_edma_configure_chan_iommu() is called after
dmaenginem_async_device_register(), bus_add_device() has already seen a
NULL bus during registration and skipped incrementing the subsystem referen=
ce
count.

If probe fails or the driver unbinds later, device_del() will call
bus_remove_device(), which will see this newly assigned bus and attempt to
drop the reference twice.

Could this cause a use-after-free panic in the bus subsystem?

> +			if (fsl_edma->drvdata->flags & FSL_EDMA_DRV_TCD64)
> +				dma_coerce_mask_and_coherent(chdev,
> +					DMA_BIT_MASK(64));
> +			else
> +				dma_coerce_mask_and_coherent(chdev,
> +					DMA_BIT_MASK(32));
> +			ret =3D of_dma_configure(chdev, child, true);
> +			if (ret) {
> +				dev_err(&pdev->dev,
> +					"IOMMU config failed for channel %d: %d\n",
> +					ch_id, ret);
> +				of_node_put(child);
> +				return ret;
> +			}
> +
> +			chan->chan_dev->chan_dma_dev =3D true;

[Severity: Low]
Does struct dma_chan have a member named chan_dev?

This looks like it will cause another compilation failure.

> +			break;
> +		}
> +	}
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930-edma-iommu=
-v2-0-72a62bf44c74@nxp.com?part=3D2
