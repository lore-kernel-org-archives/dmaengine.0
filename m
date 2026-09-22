Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E382B3F8891;
	Tue, 22 Sep 2026 07:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790061257; cv=none; b=pXN3XYZniQFuDfG8eWuBlOp9L+eeeH0S+axoI3ohbw1Z6REKcE8Tm6MthDV6mLrjKUU+ZbN/ErnUVyX7jTbxa1FSkKr8QzF8Ge01Hcm5CvcduFLE2LbtHPNHVO4TRB55LY7pemnFwu+vSUkRmLYf+/UZQOjcEeMhnpSnLM0M1ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790061257; c=relaxed/simple;
	bh=4ZVyXz6SHiLpbhe28V/OzygcfIdI5Tb2Cda8+NiEYSQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iDTwsmTGaQ8h/I8czZe9bI2KMwU4eV5inAD8Lo7OkD1LHoT9Cauw2nYcs635FVPp2WczCqpN6OSATk/sej8HlX0E3Hnih3uQOLHvR6QUMKeFFsX09nVJ8jrbwV3rJDq7FenVZ7gm1DacRukJei0w6oRuitrTxLk03Qkobq6yMhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DAbS6x8P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DAbS6x8P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CA2A1F000FF;
	Tue, 22 Sep 2026 07:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790061255;
	bh=aI06oI3UupUtss03KSUlJe1ny9XAks3A2UFfUY29z4s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DAbS6x8PJ4d7ZgF81X+Ki7oUK7GWy6UMdVEIdmqGoyftKKJ+vQqw1UuQvUyVYfDZ2
	 hu4/hLe7GH+Prr5Kji/8E3KhKSkRHWOJ+uz8Inyv3qNZCICHSRoidrGJ7qeby17zJq
	 KlvcbPgvcFsGEITaZGxw/ByxSHw8pwTSo+Etl3JtniphscCiDQVbWIcNBelebsQlPm
	 fKh4ONUhFST4HIWxpndtN5fAqj16SO0SDnmnEE5jweMxhL2bDsPqp3vMJ5A2i/vF6Y
	 e1uI1agMI0l+BsbZIu+ox8NFg/SQZ4kx/XJm/tn1wMxVPm3LK8UH0/OeIuUEFCDunU
	 evHQR/mRlSVeQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 17/19] dmaengine: ti: k3-udma-v2: Add support for
 PKTDMA V2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Sree Kartheek Adivi" <s-adivi@ti.com>
Cc: vkoul@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260922064902.2719979-18-s-adivi@ti.com>
References: <20260922064902.2719979-1-s-adivi@ti.com>
 <20260922064902.2719979-18-s-adivi@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 07:14:14 +0000
Message-Id: <20260922071415.3CA2A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] dmaengine: ti: k3-udma-v2: IRQ name mismatch for PKTDMA mapped c=
hannels
- [Low] dmaengine: ti: k3-udma-v2: uninitialized pktdma_v2_driver check
- [Low] dmaengine: ti: k3-udma-glue: enum passed as boolean parameter
--

commit 0e040285780e7048563c2c5482644c2f9d9fa82b
Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>
Subject: dmaengine: ti: k3-udma-v2: Add support for PKTDMA V2

This commit adds support for PKTDMA V2, which differs from V1 in that it
uses unified channel spaces, direct IRQs, and static channel mapping instead
of PSIL pairs. It also implements the allocation of TX and RX resources for
the new PKTDMA V2 hardware.

> diff --git a/drivers/dma/ti/k3-udma-glue.c b/drivers/dma/ti/k3-udma-glue.c
> --- a/drivers/dma/ti/k3-udma-glue.c
> +++ b/drivers/dma/ti/k3-udma-glue.c
[ ... ]
> @@ -166,6 +166,29 @@ static int of_k3_udma_glue_parse_chn(struct device_n=
ode *chn_np,
>  		goto out_put_spec;
> =20
>  	thread_id =3D dma_spec.args[0];
> +
> +	/*
> +	 * V2 PKTDMA DT specifiers encode the hardware flow/channel ID in
> +	 * args[0] rather than the PSI-L thread ID used by V1. Resolve the
> +	 * PSI-L thread ID before the common path checks the direction bit.
> +	 */
> +	if (common->udmax->match_data->version =3D=3D K3_UDMA_V2 &&
> +	    xudma_is_pktdma(common->udmax)) {
> +		struct psil_endpoint_config *ep_cfg;
> +		u32 psil_thread_id;
> +		bool dev_to_mem;
> +
> +		ep_cfg =3D psil_get_ep_config_by_id(thread_id, DMA_TYPE_PKTDMA,

[Severity: Low]
Is it intentional to pass the DMA_TYPE_PKTDMA enum as the boolean is_pktdma
argument here? While the enum value evaluates to true and behaves correctly
by accident, this appears to be a type mismatch. Should this use
xudma_is_pktdma(common->udmax) or a boolean literal instead?

> +						  &psil_thread_id, &dev_to_mem);
> +		if (IS_ERR(ep_cfg)) {
> +			dev_err(common->dev,
> +				"No PSI-L config for flow %u\n", thread_id);
> +			ret =3D PTR_ERR(ep_cfg);
> +			goto out_put_spec;
> +		}
> +		thread_id =3D psil_thread_id;
> +	}
> +
>  	if (dma_spec.args_count =3D=3D 2) {
>  		if (dma_spec.args[1] > 2 && !xudma_is_pktdma(common->udmax)) {
>  			dev_err(common->dev, "Invalid channel atype: %u\n",

> diff --git a/drivers/dma/ti/k3-udma-private.c b/drivers/dma/ti/k3-udma-pr=
ivate.c
> --- a/drivers/dma/ti/k3-udma-private.c
> +++ b/drivers/dma/ti/k3-udma-private.c
[ ... ]
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

[Severity: Medium]
Does this cause an IRQ name mismatch for PKTDMA mapped channels?

In pktdma_v2_alloc_chan_resources() in k3-udma-v2.c, the DMA engine channel
allocation uses mapped_channel_id (via irq_ring_idx) to construct the "tx-%=
u"
IRQ name:

    if (uc->config.dir =3D=3D DMA_MEM_TO_DEV)
        snprintf(irq_name, sizeof(irq_name), "tx-%u", irq_ring_idx);

However, this exported accessor xudma_pktdma_tflow_get_irq() uses the flow =
ID
to construct the exact same prefix.

If mapped_channel_id differs from default_flow_id, will this cause
initialization to fail for one of the consumers because it cannot lookup the
expected IRQ name from the device tree?

> +	return platform_get_irq_byname(pdev, irq_name);
>  }

> diff --git a/drivers/dma/ti/k3-udma-v2.c b/drivers/dma/ti/k3-udma-v2.c
> --- a/drivers/dma/ti/k3-udma-v2.c
> +++ b/drivers/dma/ti/k3-udma-v2.c
[ ... ]
> @@ -870,6 +1012,7 @@ static int udma_v2_resume(struct dma_chan *chan)
>  }
> =20
>  static struct platform_driver bcdma_v2_driver;
> +static struct platform_driver pktdma_v2_driver;
> =20
>  static bool udma_v2_dma_filter_fn(struct dma_chan *chan, void *param)
>  {
> @@ -879,7 +1022,8 @@ static bool udma_v2_dma_filter_fn(struct dma_chan *c=
han, void *param)
>  	struct udma_chan *uc;
>  	struct udma_dev *ud;
> =20
> -	if (chan->device->dev->driver !=3D &bcdma_v2_driver.driver)
> +	if (chan->device->dev->driver !=3D &bcdma_v2_driver.driver &&
> +	    chan->device->dev->driver !=3D &pktdma_v2_driver.driver)

[Severity: Low]
Is pktdma_v2_driver intentionally left uninitialized here?

Since the device is probed by bcdma_v2_driver (which matches both the BCDMA
and PKTDMA compatible strings), this check against the unregistered driver
struct seems like it would always evaluate to false, leaving pktdma_v2_driv=
er
entirely unused in memory. Does this structure need to be registered
somewhere, or can this check be safely removed?

>  		return false;
> =20
>  	uc =3D to_udma_chan(chan);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922064902.2719=
979-1-s-adivi@ti.com?part=3D17
