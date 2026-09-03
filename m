Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1AC375F88;
	Thu,  3 Sep 2026 07:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788422069; cv=none; b=Bpov6wfVp5Q5WvPJ1rEiMZ/aAbgMVD0dbqPOkBJNnb7oSco1M69DangtTI4hhFhRt9TwV7cl3miUxjpp3ddAkQ6IY6ZDLQ74eeI+U+oh9158X6Yp3TOt1YS90MzXloG1jvqfuL0hGWHq4WDMiWtDTHywZ7G5PPaDBjTq7EXF1mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788422069; c=relaxed/simple;
	bh=5teIvxg5u9K0ClCWiNOyZr1F6owUQ7BEZazX5JMuq/8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TZBbGkomxuZ1hm6HUu0mwT/X7A7lWrOQgWcFjb6RZk58UvvfmMlgqTE85VIT3Nb8moVcv9mmgXtyXreqWf3OpmTuz7yk6Vlb4SUaxnvSpzFWn8Nn2FMl3zk5TLMqDCNKEMeZMLbXhg/TviYV9LPa8M74seHcHa5fMytEA5GX2b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=epOJbXew; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="epOJbXew"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D582A1F000E9;
	Thu,  3 Sep 2026 07:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788422067;
	bh=qf9Tn+bVBs74GFd2TUZ1Wsh5sBVkHOm+fXWdGHGqv9Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=epOJbXewM2oIGJOfQXzUoAdm4SBtuIgW4+jz9lSKy2UT1+8pmxh5k+9PMaXBze3Ep
	 cQc+qiwXogyuPLG8nn3YrOClAPt9aMsDZZg1o0xnJv0tjNtiYl135/O3hTIWZ7hvaQ
	 SNECD/RcFg3uGfUMTQjrH3DiHeF/hJGEVUyUCcTK7vyay6FTHt7fi96YHZ2nqPflfo
	 Irae/ZyzB71gRQqAAC+MZ8o69ddzy0dwY+liXOKOLfiir1QkJkQOjmh/ZAJXqoStec
	 vfYyu5rMo/5Kw9UJjvO2N6KuxfU7pYAIADbeDM/0Wwa5Ak2MVNIefnZg1StbSFgS+u
	 /FYceF5PJRkFA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 2/3] dmaengine: amlogic: Add general DMA driver for
 A9
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xianwei Zhao" <xianwei.zhao@amlogic.com>
Cc: conor+dt@kernel.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, robh@kernel.org, dmaengine@vger.kernel.org, linux-amlogic@lists.infradead.org, vkoul@kernel.org
In-Reply-To: <20260903-amlogic-dma-v12-2-f769bc344056@amlogic.com>
References: <20260903-amlogic-dma-v12-0-f769bc344056@amlogic.com>
 <20260903-amlogic-dma-v12-2-f769bc344056@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 07:54:26 +0000
Message-Id: <20260903075426.D582A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] Unmanaged workqueue `free_wq` leaks on probe errors, and premature=
 tasklet termination in `remove()` causes Use-After-Free due to devres orde=
ring.
- [High] Bitwise ORing a host-endian constant into a little-endian (`__le32=
`) variable causes data corruption on big-endian architectures.
- [High] Failure to check `platform_get_irq()` return value breaks deferred=
 probing.
- [High] `aml_chan->status` and `aml_chan->err_num` are updated outside the=
 channel lock in `aml_dma_terminate_all()`.
- [High] `aml_dma_chan_resume()` fails to start descriptors that were issue=
d while the channel was paused.
- [Medium] `aml_dma_tx_status()` fails to check the `desc_submitted` list, =
leading to false errors and incorrect residue.
- [Medium] The interrupt handler unconditionally returns `IRQ_HANDLED`, def=
eating spurious interrupt detection.
- [Low] Taking the address of a member of a potentially NULL pointer in `am=
l_dma_terminate_all()`.
--

commit 038e372b66227ebb6d24a3849c98d588ff0edcd7
Author: Xianwei Zhao <xianwei.zhao@amlogic.com>

dmaengine: amlogic: Add general DMA driver for A9

Amlogic A9 SoCs include a general-purpose DMA controller that can be used
by multiple peripherals, such as I2C PIO and I3C. Each peripheral group
is associated with a dedicated DMA channel in hardware.

> diff --git a/drivers/dma/amlogic-dma.c b/drivers/dma/amlogic-dma.c
> new file mode 100644
> index 0000000000000..b6687d98096c3
> --- /dev/null
> +++ b/drivers/dma/amlogic-dma.c

[ ... ]

> +static enum dma_status aml_dma_tx_status(struct dma_chan *chan,
> +					 dma_cookie_t cookie,
> +					 struct dma_tx_state *txstate)
> +{
> +	struct aml_dma_chan *aml_chan =3D to_aml_dma_chan(chan);
> +	struct aml_dma_dev *aml_dma =3D aml_chan->aml_dma;
> +	struct aml_dma_desc *aml_desc =3D NULL;
> +	struct virt_dma_desc *vd;
> +	u32 residue =3D 0, done =3D 0;
> +	unsigned long flags;
> +	enum dma_status ret;
> +
> +	ret =3D dma_cookie_status(chan, cookie, txstate);
> +	if (ret =3D=3D DMA_COMPLETE)
> +		return ret;
> +
> +	if (aml_chan->status =3D=3D DMA_PAUSED)
> +		ret =3D DMA_PAUSED;
> +	if (!txstate)
> +		return ret;
> +
> +	spin_lock_irqsave(&aml_chan->vchan.lock, flags);
> +	vd =3D vchan_find_desc(&aml_chan->vchan, cookie);
> +	if (vd) {
> +		aml_desc =3D to_aml_dma_desc(vd);
> +		residue =3D aml_desc->data_len;
> +	} else if (aml_chan->cur_desc && aml_chan->cur_desc->vd.tx.cookie =3D=
=3D cookie) {

[Severity: Medium]
Does this skip checking the desc_submitted list?

When a DMA client submits a descriptor via tx_submit() but has not yet
issued it via issue_pending(), the descriptor resides in desc_submitted.
Since vchan_find_desc() only searches the desc_issued list, calling
dma_tx_status() during this window will fail to find the descriptor.
This causes the driver to incorrectly log a "cookie error" and return a
residue of 0 instead of the full transfer length.

> +		aml_desc =3D aml_chan->cur_desc;
> +		regmap_read(aml_dma->regmap, aml_chan->reg_offs + RCH_RD_LEN, &done);
> +		residue =3D aml_desc->data_len - done;
> +	} else {
> +		dev_err(aml_dma->dma_device.dev, "cookie error\n");
> +	}
> +	spin_unlock_irqrestore(&aml_chan->vchan.lock, flags);
> +	dma_set_residue(txstate, residue);
> +
> +	return ret;
> +}

[ ... ]

> +static struct dma_async_tx_descriptor *aml_dma_prep_slave_sg
> +		(struct dma_chan *chan, struct scatterlist *sgl,
> +		unsigned int sg_len, enum dma_transfer_direction direction,
> +		unsigned long flags, void *context)
> +{

[ ... ]

> +		/* set dma address and len to sglink*/
> +		sg_link->addr_low =3D cpu_to_le32(lower_32_bits(paddr));
> +		sg_link->addr_high =3D cpu_to_le32(upper_32_bits(paddr));
> +		sg_link->ctl =3D cpu_to_le32(FIELD_PREP(LINK_LEN, avail));
> +
> +		aml_desc->data_len +=3D sg_dma_len(sg);
> +		sg_link++;
> +	}
> +
> +	/* the last sg set eoc flag */
> +	sg_link--;
> +	sg_link->ctl |=3D LINK_EOC;

[Severity: High]
Can this cause data corruption on big-endian architectures?

The sg_link->ctl field is populated as an __le32, but the LINK_EOC flag
(which evaluates to a host-endian BIT(28)) is bitwise OR'd directly into it.
On big-endian systems, this will set the wrong bit in the memory-backed
descriptor, meaning the hardware won't see the End-Of-Chain flag and may
fetch uninitialized memory. Wrapping it with cpu_to_le32(LINK_EOC) would
prevent this.

> +
> +	return vchan_tx_prep(&aml_chan->vchan, &aml_desc->vd, flags);
> +}

[ ... ]

> +static int aml_dma_chan_resume(struct dma_chan *chan)
> +{
> +	struct aml_dma_chan *aml_chan =3D to_aml_dma_chan(chan);
> +	struct aml_dma_dev *aml_dma =3D aml_chan->aml_dma;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&aml_chan->vchan.lock, flags);
> +	regmap_clear_bits(aml_dma->regmap, aml_chan->reg_offs + RCH_CFG, CFG_PA=
USE);
> +	aml_chan->status =3D aml_chan->pre_status;
> +	spin_unlock_irqrestore(&aml_chan->vchan.lock, flags);

[Severity: High]
Does aml_dma_chan_resume() fail to start descriptors that were issued while
the channel was paused?

When a channel is paused, aml_chan->status is set to DMA_PAUSED. Any
subsequent calls to aml_dma_issue_pending() append descriptors to the
desc_issued list but return immediately from aml_dma_start() without
triggering the hardware.

Because aml_dma_chan_resume() restores aml_chan->status to DMA_COMPLETE but
does not check if the pending queue is non-empty, descriptors queued during
the pause will stall indefinitely.

> +
> +	return 0;
> +}
> +
> +static int aml_dma_terminate_all(struct dma_chan *chan)
> +{
> +	struct aml_dma_chan *aml_chan =3D to_aml_dma_chan(chan);
> +	struct aml_dma_dev *aml_dma =3D aml_chan->aml_dma;
> +	int chan_id =3D aml_chan->chan_id;
> +	struct virt_dma_desc *cur_vd;
> +	unsigned long flags;
> +	LIST_HEAD(head);
> +
> +	spin_lock_irqsave(&aml_chan->vchan.lock, flags);
> +	regmap_set_bits(aml_dma->regmap, aml_chan->reg_offs + RCH_CFG, CFG_PAUS=
E);
> +	regmap_set_bits(aml_dma->regmap, aml_chan->reg_offs + RCH_CFG, CFG_CLEA=
R);
> +
> +	if (aml_chan->direction =3D=3D DMA_MEM_TO_DEV)
> +		regmap_set_bits(aml_dma->regmap, RCH_INT_MASK, BIT(chan_id));
> +	else if (aml_chan->direction =3D=3D DMA_DEV_TO_MEM)
> +		regmap_set_bits(aml_dma->regmap, WCH_INT_MASK, BIT(chan_id));
> +
> +	regmap_clear_bits(aml_dma->regmap, aml_chan->reg_offs + RCH_CFG, CFG_PA=
USE);
> +	regmap_clear_bits(aml_dma->regmap, aml_chan->reg_offs + RCH_CFG, CFG_CL=
EAR);
> +
> +	vchan_get_all_descriptors(&aml_chan->vchan, &head);
> +	cur_vd =3D &aml_chan->cur_desc->vd;
> +	aml_chan->cur_desc =3D NULL;
> +	spin_unlock_irqrestore(&aml_chan->vchan.lock, flags);

[Severity: Low]
Is this taking the address of a member from a potentially NULL pointer?

If there is no active transfer, aml_chan->cur_desc is NULL. Calculating
&aml_chan->cur_desc->vd before checking for NULL is undefined behavior in
standard C. While it safely evaluates to NULL in the kernel because vd is
at offset 0 and GCC is invoked with -fno-delete-null-pointer-checks, this
diverges from the correct pattern used elsewhere in the driver.

> +	if (cur_vd)
> +		aml_dma_free_desc(cur_vd);
> +
> +	vchan_dma_desc_free_list(&aml_chan->vchan, &head);
> +
> +	aml_chan->status =3D DMA_COMPLETE;
> +	aml_chan->err_num =3D 0;

[Severity: High]
Is there a race condition here since aml_chan->status and err_num are
updated outside of the vchan.lock?

If a concurrent aml_dma_issue_pending() acquires the lock immediately after
it is dropped here, it will see the stale aml_chan->status (e.g.,
DMA_PAUSED). aml_dma_start() will then return without touching the hardware.
terminate_all will subsequently set the status to DMA_COMPLETE, but the
newly queued transfer will be permanently stuck.

> +
> +	return 0;
> +}

[ ... ]

> +static irqreturn_t aml_dma_interrupt_handler(int irq, void *dev_id)
> +{

[ ... ]

> +		vchan_cookie_complete(&aml_desc->vd);
> +		aml_chan->cur_desc =3D NULL;
> +		aml_dma_start(aml_chan);
> +		spin_unlock(&aml_chan->vchan.lock);
> +	}
> +
> +	return IRQ_HANDLED;

[Severity: Medium]
Does this unconditionally return IRQ_HANDLED even when no hardware bits
were set?

If the interrupt handler is invoked but the hardware did not assert the
interrupt, the processing loops are skipped, but the function still returns
IRQ_HANDLED. This violates the IRQ API contract (which requires returning
IRQ_NONE) and prevents the core IRQ subsystem from detecting and disabling
spurious interrupt storms.

> +}

[ ... ]

> +static int aml_dma_probe(struct platform_device *pdev)
> +{
> +	struct device_node *np =3D pdev->dev.of_node;
> +	struct dma_device *dma_dev;
> +	struct aml_dma_dev *aml_dma;
> +	int ret, i, len;
> +	u32 chan_nr;
> +
> +	const struct regmap_config aml_regmap_config =3D {
> +		.reg_bits =3D 32,
> +		.val_bits =3D 32,
> +		.reg_stride =3D 4,
> +		.max_register =3D 0x3000,
> +	};
> +
> +	ret =3D of_property_read_u32(np, "dma-channels", &chan_nr);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "failed to read dma-channels\n");
> +	if (chan_nr > (MAX_CHAN_ID * 2))
> +		return dev_err_probe(&pdev->dev, -EINVAL, "dma-channels unusual\n");
> +
> +	len =3D sizeof(struct aml_dma_dev) + sizeof(struct aml_dma_chan) * chan=
_nr;
> +	aml_dma =3D devm_kzalloc(&pdev->dev, len, GFP_KERNEL);
> +	if (!aml_dma)
> +		return -ENOMEM;
> +
> +	aml_dma->free_wq =3D alloc_ordered_workqueue("aml_dma_free", 0);
> +	if (!aml_dma->free_wq)
> +		return -ENOMEM;
> +
> +	aml_dma->chan_nr =3D chan_nr;
> +
> +	aml_dma->base =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(aml_dma->base))
> +		return PTR_ERR(aml_dma->base);

[Severity: High]
Does this leak free_wq on probe errors?

If devm_platform_ioremap_resource() or any subsequent registration fails
during probe, the function returns an error without calling
destroy_workqueue(aml_dma->free_wq), leaking the workqueue memory.

> +
> +	aml_dma->regmap =3D devm_regmap_init_mmio(&pdev->dev, aml_dma->base,
> +						&aml_regmap_config);
> +	if (IS_ERR_OR_NULL(aml_dma->regmap))
> +		return PTR_ERR(aml_dma->regmap);
> +
> +	aml_dma->clk =3D devm_clk_get_enabled(&pdev->dev, NULL);
> +	if (IS_ERR(aml_dma->clk))
> +		return PTR_ERR(aml_dma->clk);
> +
> +	aml_dma->irq =3D platform_get_irq(pdev, 0);
> +
> +	aml_dma->pdev =3D pdev;
> +	aml_dma->dma_device.dev =3D &pdev->dev;

[Severity: High]
Does this break deferred probing by missing a bounds check on the returned
IRQ value?

platform_get_irq() can return a negative error code such as -EPROBE_DEFER.
By unconditionally assigning it to aml_dma->irq and passing it to
devm_request_irq(), the IRQ core will reject the negative IRQ value and
return -EINVAL. This overwrites the -EPROBE_DEFER error and causes a
permanent failure to probe.

> +
> +	dma_dev =3D &aml_dma->dma_device;

[ ... ]

> +static void aml_dma_remove(struct platform_device *pdev)
> +{
> +	struct aml_dma_dev *aml_dma =3D platform_get_drvdata(pdev);
> +	struct aml_dma_chan *aml_chan =3D NULL;
> +	int i;
> +
> +	of_dma_controller_free((&pdev->dev)->of_node);
> +
> +	regmap_write(aml_dma->regmap, RCH_INT_MASK, INT_MASK);
> +	regmap_write(aml_dma->regmap, WCH_INT_MASK, INT_MASK);
> +
> +	for (i =3D 0; i < MAX_CHAN_ID; i++) {
> +		aml_chan =3D aml_dma->aml_rch[i];
> +		if (aml_chan)
> +			tasklet_kill(&aml_chan->vchan.task);
> +		aml_chan =3D aml_dma->aml_wch[i];
> +		if (aml_chan)
> +			tasklet_kill(&aml_chan->vchan.task);
> +	}
> +	destroy_workqueue(aml_dma->free_wq);
> +}

[Severity: High]
Is there a use-after-free race condition during driver unbind?

The tasklets are killed here, but because devm_request_irq() was used
during probe, the IRQ line remains active until devres runs after
aml_dma_remove() returns.

Without a call to synchronize_irq(), an in-flight interrupt on another CPU
could schedule the tasklet again after tasklet_kill() has finished. When
devres subsequently frees the driver's memory, the delayed tasklet will
execute on freed memory.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903-amlogic-dm=
a-v12-0-f769bc344056@amlogic.com?part=3D2
