Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B642547F3DA;
	Wed, 16 Sep 2026 14:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789567282; cv=none; b=OaisuVk6Zr1cfZUeIbh4a2TSp5eWec0qrpyVYhy4husiOTssOP8OimiE4kNH/xrjMEoJmi7U6+COngHuZVCEKf94wBKYBE2lWSyHRDmhXpPnDkkh9Q4R/2iGWhR28JBPt2mpt70zyigmEpfDMYdo6Zkk3EwpKsg16eTpwObKyuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789567282; c=relaxed/simple;
	bh=35WvrnphmQ+0YDenDXBRONafnNX0qIaqsdvHsoZDA/M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Zct/TICz/576DINSpoMZMRMZ3CbC/b4uv+f7eoMNrk9zx1iTF6wc/QpKyTrt8hPqc6+NywaZI+IF77pBG3nt4jQRukksjvJ5+bE4N7SwrfUfgoDYyZLQ565baoxhhTC81pB36tsBV18KqcP4954OR2CEnrpXMkpsQtKDln846+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=owoEpIp0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="owoEpIp0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3112D1F000FF;
	Wed, 16 Sep 2026 14:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789567280;
	bh=FIupthtjkkJAVGCVvE/mrlhzHpdxDVIyJydDd7xHHEk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=owoEpIp0SByxMDJry2bC9DPFVXKINRgdLj6AeNW3nIU5AdXeKGI/s99MgMNvU5A1p
	 GxuwDcMfaqX1pDUUN1NK7RadyiTjg8ts1bPK2C1lFs3Ri4hDj3kPUnaVTQzMpRqX+Y
	 RQUpSUXX/94NztTfIWrwv0vnY8Ups1dWZcHGIIUI1Uoc/RLzRXXAT4A6XzuqhVgJQH
	 r+dCnHsgG0LJDQSXkAq3uZ5syAv/TKbomIq4a848ZxRg0ixC8h1zbWgOw1MCKNWbjh
	 88Er4ylnMbZX8ZWL5GEx4Dzw7qP8PZa2/TP0TgwPyK7bmfbe2XEa6Cas2W/8InY2aw
	 QRdOmChhNUPMA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/2] dmaengine: atcdmac300: Add driver for Andes
 ATCDMAC300 DMA controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "CL Wang" <cl634@andestech.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, robh@kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260916134258.2178081-3-cl634@andestech.com>
References: <20260916134258.2178081-1-cl634@andestech.com>
 <20260916134258.2178081-3-cl634@andestech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 14:01:19 +0000
Message-Id: <20260916140120.3112D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] dmaengine: atcdmac300: UAF on driver unbind due to devres lifecycl=
e mismatch
- [High] dmaengine: atcdmac300: permanent controller halt if suspend times =
out
- [High] dmaengine: atcdmac300: NULL pointer dereference mixing cyclic and =
non-cyclic transfers
- [High] dmaengine: atcdmac300: cross-transfer corruption on simultaneous T=
C and ERR interrupts
- [Medium] dmaengine: atcdmac300: memory leak of unsubmitted descriptors
- [Medium] dmaengine: atcdmac300: silent truncation of DT req_num exceeding=
 15
- [Medium] dmaengine: atcdmac300: transfers queued during suspend are stran=
ded on resume
- [Low] dmaengine: atcdmac300: missing endianness conversions for DMA descr=
iptors
--

commit 94fd62b6d9e6afc2cf50f8dff89eedcdc57f24c9
Author: CL Wang <cl634@andestech.com>
Subject: dmaengine: atcdmac300: Add driver for Andes ATCDMAC300 DMA control=
ler

This patch adds support for the Andes ATCDMAC300 DMA controller. It provides
scatter-gather, cyclic, and slave transfer capabilities.

> diff --git a/drivers/dma/atcdmac300.c b/drivers/dma/atcdmac300.c
> index 0000000000000..e0a8a980e2fe8
> --- /dev/null
> +++ b/drivers/dma/atcdmac300.c
[ ... ]
> @@ -82,9 +82,6 @@ static struct atcdmac_desc *atcdmac_alloc_desc(struct d=
ma_chan *chan,
>  		INIT_LIST_HEAD(&desc->desc_node);
>  		INIT_LIST_HEAD(&desc->tx_list);
>  		dma_async_tx_descriptor_init(&desc->txd, chan);
>  		desc->txd.flags =3D DMA_CTRL_ACK;
>  		desc->txd.tx_submit =3D atcdmac_tx_submit;
>  		desc->txd.phys =3D phys;
>  	}

[Severity: Medium]
The desc_free callback is omitted from the transaction descriptor here.
If a client prepares a descriptor but aborts and frees it before
submission, the DMA engine core won't be able to free it.

[ ... ]
> @@ -494,11 +494,11 @@ static irqreturn_t atcdmac_irq_thread(int irq, void=
 *dev_id)
>  	for (i =3D 0; i < dmac->num_ch; i++) {
>  		dmac_chan =3D &dmac->chan[i];
> =20
>  		if (test_and_clear_bit(ATCDMAC_STA_TC, &dmac_chan->status)) {
>  			atcdmac_advance_work(dmac_chan);
>  			handled =3D true;
>  		}
> =20
>  		if (test_and_clear_bit(ATCDMAC_STA_ERR, &dmac_chan->status)) {
>  			atcdmac_handle_error(dmac_chan);
>  			handled =3D true;
>  		}

[Severity: High]
The lack of mutual exclusivity allows both conditions to execute if both
status bits are asserted simultaneously by the hardware. In this case,
atcdmac_advance_work() would complete the current descriptor and start the
next one, followed immediately by atcdmac_handle_error() wrongly aborting
the newly started, innocent descriptor. Should these checks be mutually
exclusive?

[ ... ]
> @@ -911,10 +911,8 @@ atcdmac_prep_dma_cyclic(struct dma_chan *chan,
>  		if (!desc)
>  			goto err_desc_get;
>  		atcdmac_chain_desc(&first, &prev, desc, true);
>  	}
> =20
>  	first->txd.flags =3D flags;
>  	dmac_chan->cyclic =3D true;

[Severity: High]
This modifies the channel-wide state during descriptor preparation.
If a client prepares a cyclic transfer, does not submit it, and
subsequently prepares and submits a non-cyclic transfer, this global
flag remains set. When the non-cyclic transfer completes, could this
cause atcdmac_advance_work() to treat it as cyclic and attempt to
dereference dma_desc->at->next in atcdmac_start_next_trans(), leading
to a kernel panic?

[ ... ]
> @@ -1144,10 +1144,8 @@ static void atcdmac_free_chan_resources(struct dma=
_chan *chan)
>  	spin_lock_irqsave(&dmac_chan->lock, flags);
>  	list_for_each_entry_safe(desc,
>  				 desc_next,
>  				 &dmac_chan->free_list,
>  				 desc_node) {
>  		list_del(&desc->desc_node);
>  		dma_pool_free(dmac->dma_desc_pool, desc, desc->txd.phys);
>  	}

[Severity: Medium]
This loop only frees descriptors currently sitting in the free_list.
Combined with the missing desc_free callback above, does this mean any
prepared but unsubmitted descriptors are permanently leaked and never
returned to the dma_desc_pool?

[ ... ]
> @@ -1189,8 +1189,8 @@ static struct dma_chan *atcdmac_dma_xlate_handler(s=
truct of_phandle_args *dmac,
>  	if (!chan)
>  		return NULL;
> =20
>  	dmac_chan =3D atcdmac_chan_to_dmac_chan(chan);
>  	dmac_chan->dev_chan =3D true;
>  	dmac_chan->req_num =3D dmac->args[0] & 0xff;

[Severity: Medium]
The request number is extracted and masked to 8 bits. However, the hardware
request selection registers (SRC_REQ_SEL_MASK, DST_REQ_SEL_MASK) are only
4 bits wide. Since FIELD_PREP silently truncates values, a device tree
req_num of 16 will be programmed into hardware as 0 without warning.
Should this value be explicitly validated against the 4-bit maximum?

[ ... ]
> @@ -1305,9 +1305,9 @@ static int atcdmac_init_ioremap_and_regmap(struct p=
latform_device *pdev,
>  	regmap_read(regmap, REG_CFG, &val);
>  	num_ch =3D val & CH_NUM;
>  	size =3D sizeof(*dmac) + num_ch * sizeof(struct atcdmac_chan);
>  	dmac =3D devm_kzalloc(&pdev->dev, size, GFP_KERNEL);
>  	if (!dmac)
>  		return -ENOMEM;

[Severity: High]
The DMA controller structure is allocated using devres, tying its
lifetime to the device binding rather than the dma_device refcount.
If a client driver still holds a channel reference when the device is
unbound, could this lead to a use-after-free when the client later
releases the channel and atcdmac_free_chan_resources() accesses the
freed dmac structure?

[ ... ]
> @@ -1543,9 +1543,8 @@ static int atcdmac_resume(struct device *dev)
>  	list_for_each_entry_safe(chan,
>  				 chan_next,
>  				 &dmac->dma_device.channels,
>  				 device_node) {
>  		dmac_chan =3D atcdmac_chan_to_dmac_chan(chan);
>  		spin_lock_irqsave(&dmac_chan->lock, flags);
>  		if (!list_empty(&dmac_chan->active_list))
>  			atcdmac_start_next_trans(dmac_chan);

[Severity: Medium]
This condition actively prevents queue_list items from being serviced if
the active_list is empty during resume. Since transfers submitted during
suspend are placed into queue_list (because stop_mask prevents them from
starting), won't they remain stranded indefinitely unless issue_pending
is also called here?

[ ... ]
> @@ -1568,9 +1568,9 @@ static int atcdmac_suspend(struct device *dev)
>  	synchronize_irq(dmac->irq);
> =20
>  	ret =3D atcdmac_wait_chan_idle(dmac,
>  				     chan_mask,
>  				     ATCDMAC_CHAN_TIMEOUT_US * dmac->num_ch);
> =20
>  	return ret;
>  }

[Severity: High]
If atcdmac_wait_chan_idle() times out, the function returns the error code
without reverting dmac->stop_mask back to 0. Since the PM core would abort
the system suspend and resume normal operations, wouldn't this permanently
prevent any new transfers from starting?

> diff --git a/drivers/dma/atcdmac300.h b/drivers/dma/atcdmac300.h
> index 0000000000000..3d2d07effc26d
> --- /dev/null
> +++ b/drivers/dma/atcdmac300.h
[ ... ]
> @@ -148,10 +148,10 @@ enum dma_sta {
>   * @ll_ptr_hi: Linked List Pointer Register (high 32-bit).
>   */
>  struct atcdmac_regs {
>  	unsigned int ctrl;
>  	unsigned int trans_size;

[Severity: Low]
The hardware descriptor layout uses native unsigned int instead of
explicitly sized __le32 types. When these fields are populated in
atcdmac_build_desc(), values are assigned directly without cpu_to_le32().
Does this lack of endianness conversion break portability if this driver
is ever used on a big-endian system?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916134258.2178=
081-1-cl634@andestech.com?part=3D2
