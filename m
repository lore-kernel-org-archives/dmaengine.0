Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3A12BE65B;
	Thu,  1 Oct 2026 02:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790821625; cv=none; b=ut9dSWwh2RETc5nhbzih1xAVTBRir5On0H7Tb4oKjhAhxzveb5aHx7wIW2bHMKWb2NQDLbpYghVKNFtNQixmRrFoFZgcNRjJ/jhDs1IFCp1YhZolLEfAGk0ykCi9ixUeTa/nP4XXcZFbaCs1xPueBUAtEs/oYtAvr8iG4wSSrco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790821625; c=relaxed/simple;
	bh=wjEkSfPLR5AbPObzHHsx6514bU5eP4k2N1CzrD7zrGs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BuDfbb4eRdJq4kUmCquSRfe/qF/7cGLZXjxRsFWI1oVGK7qHieBFp9tKJmqRV5NTdWG0LoJuVIz8boQO835EV9JGOgXlguLraO/xeJdRVUpv0gL9PkGHhDYbe++wZINvaS80QGeY5EEdjXXOiaqDwVW01h/Utj3j2q8klZauAZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i/30DzZZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i/30DzZZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73EFF1F000FF;
	Thu,  1 Oct 2026 02:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790821623;
	bh=ZvkHyD4TCH8rfhvs9kb8V6R7w1GZj0ldIFzhzfiF1AQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i/30DzZZsi4iIuCAeGxl+vHlCLG1kbQguVhkc+wf6tQGzv0wHM9q4TZdORlk+BN+6
	 /W0JNpuIfVIbj1EBGLPDHL9YHOFHIb4nshnqQ1iSoh6bmPOsjABoYhZFSPC6RvTDq1
	 5UBtsMXl/w/rusAF4sQFgiFshZf2fwqWiPi4YxlnZTuVg908UicX3GyBJea4J7WGhP
	 qDHBNQp28TN3tOVG9bbn04p6W+rDuIyTcXMcByRFp4hTjnVhIKW2L4O1kScqVAL4Y6
	 lg8HNK9zq236CJ4aW5X0nlEroFZLOHZ1tVdC1aMw7GEupm609AzfED/GTZBZUToLGN
	 WtTDCbWuGQKKw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/2] dmaengine: atcdmac300: Add driver for Andes
 ATCDMAC300 DMA controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "CL Wang" <cl634@andestech.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, robh@kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261001014503.786490-3-cl634@andestech.com>
References: <20261001014503.786490-1-cl634@andestech.com>
 <20261001014503.786490-3-cl634@andestech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 02:27:02 +0000
Message-Id: <20261001022703.73EFF1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 11 potential issue=
(s) to consider:
- [High] dmaengine: atcdmac300: missing interrupt enable flags in channel c=
ontrol
- [High] dmaengine: atcdmac300: start unissued pending transfers in atcdmac=
_resume()
- [High] dmaengine: atcdmac300: integer overflow of cyclic period variable
- [High] dmaengine: atcdmac300: missing status clearing in atcdmac_terminat=
e_all()
- [High] dmaengine: atcdmac300: fail to reset chan_used flag during suspend
- [High] dmaengine: atcdmac300: unhandled pending interrupt causes IRQ storm
- [Medium] dmaengine: atcdmac300: ignore client transfer flags in atcdmac_p=
rep_dma_memcpy()
- [Medium] dmaengine: atcdmac300: memory leak of unsubmitted descriptors
- [Medium] dmaengine: atcdmac300: integer truncation of len in atcdmac_prep=
_dma_memcpy()
- [Medium] dmaengine: atcdmac300: integer truncation of sizes in atcdmac_pr=
ep_dma_cyclic()
- [Medium] dmaengine: atcdmac300: missing args_count check in atcdmac_dma_x=
late_handler()
--

commit 0b5c5b75d701997e0656ae1d35e0499a595165ad
Author: CL Wang <cl634@andestech.com>

dmaengine: atcdmac300: Add driver for Andes ATCDMAC300 DMA controller

This patch adds support for the Andes ATCDMAC300 DMA controller.
The ATCDMAC300 is a memory-to-memory and peripheral DMA controller
that provides scatter-gather, cyclic, and slave transfer capabilities.

> --- /dev/null
> +++ b/drivers/dma/atcdmac300.c
> @@ -0,0 +1,1759 @@
[ ... ]
> +static void atcdmac_start_transfer(struct atcdmac_chan *dmac_chan,
> +				   struct atcdmac_desc *first_desc)
> +{
> +	struct atcdmac_dmac *dmac =3D dmac_chan->dma_dev;
> +	struct regmap *reg =3D dmac_chan->regmap;
> +	unsigned long flags;
> +
> +	raw_spin_lock_irqsave(&dmac->lock, flags);
> +	dmac->owned_chan |=3D BIT(dmac_chan->chan_id);
> +	raw_spin_unlock_irqrestore(&dmac->lock, flags);
> +
> +	regmap_write(reg, REG_CH_CTL_OFF, first_desc->regs.ctrl);

[Severity: High]
Since INT_TC_MASK, INT_ERR_MASK, and INT_ABT_MASK are missing from the ctrl
bitmask written here (and constructed in functions like
atcdmac_build_slave_desc()), won't the hardware fail to assert interrupts
upon completion, error, or abort? This appears to cause silent transfer
timeouts.

[ ... ]
> +static void atcdmac_advance_work(struct atcdmac_chan *dmac_chan)
> +{
[ ... ]
> +	if (dma_desc->cyclic) {
> +		if (!stop)
> +			atcdmac_start_next_trans(dmac_chan);
[ ... ]
> +	} else {
> +		if (list_is_singular(&dmac_chan->active_list)) {
[ ... ]
> +		if (!stop)
> +			atcdmac_start_next_trans(dmac_chan);

[Severity: High]
If stop_mask is active during atcdmac_suspend(), this code skips calling
atcdmac_start_next_trans(), which bypasses the internal reset of chan_used
back to 0. Does this leave chan_used permanently stuck at 1?

[ ... ]
> +static int atcdmac_terminate_all(struct dma_chan *chan)
> +{
[ ... ]
> +	spin_lock_irqsave(&dmac_chan->lock, flags);
> +	atcdmac_abort_chan(dmac_chan);
> +	atcdmac_enable_chan(dmac_chan, 0);
> +	list_splice_init(&dmac_chan->queue_list,  &list);
> +	list_splice_init(&dmac_chan->active_list, &list);
> +	dmac_chan->chan_used =3D 0;
> +	spin_unlock_irqrestore(&dmac_chan->lock, flags);

[Severity: High]
Does this code fail to clear the software state dmac_chan->status before
dropping the lock? If an asynchronous abort interrupt fires as the channel
is terminated, the threaded handler may process a stale ATCDMAC_STA_TC bit.
If a client immediately queues and issues a new transfer, could
atcdmac_advance_work() prematurely complete it?

[ ... ]
> +static void atcdmac_free_chan_resources(struct dma_chan *chan)
> +{
[ ... ]
> +	atcdmac_terminate_all(chan);
> +
> +	/*
> +	 * Give up ownership only after the abort raised by the termination
> +	 * above has been serviced.  Dropping the bit first would mask that
> +	 * status out of the acknowledge and leave the interrupt asserted.
> +	 */
> +	atcdmac_synchronize(chan);
> +
> +	raw_spin_lock_irq(&dmac->lock);
> +	dmac->owned_chan &=3D ~BIT(dmac_chan->chan_id);
> +	raw_spin_unlock_irq(&dmac->lock);

[Severity: High]
Since atcdmac_synchronize() only flushes executing handlers and not pending
hardware interrupts, does clearing owned_chan immediately afterward mask
out a pending ABORT interrupt in the top-half handler? It seems this would
leave the level-triggered interrupt line permanently asserted, causing an
IRQ storm.

> +
> +	spin_lock_irqsave(&dmac_chan->lock, flags);
> +	list_for_each_entry_safe(desc,
> +				 desc_next,
> +				 &dmac_chan->free_list,
> +				 desc_node) {
> +		list_del(&desc->desc_node);
> +		dma_pool_free(dmac->dma_desc_pool, desc, desc->txd.phys);
> +	}

[Severity: Medium]
In the cleanup loop above, unsubmitted descriptors that were allocated but
never submitted via dmaengine_submit() are unlinked from tracking lists.
Will these unsubmitted descriptors leak since this loop only reclaims from
free_list?

[ ... ]
> +static struct dma_async_tx_descriptor *
> +atcdmac_prep_dma_memcpy(struct dma_chan *chan,
> +			dma_addr_t dst,
> +			dma_addr_t src,
> +			size_t len,
> +			unsigned long flags)
> +{
[ ... ]
> +	desc =3D atcdmac_build_desc(dmac_chan, src, dst, ctrl,
> +				  len >> src_width);

[Severity: Medium]
When len is a 64-bit size_t value exceeding 4GB, does shifting it by
src_width and passing it as a 32-bit unsigned int to atcdmac_build_desc()
cause silent integer truncation, resulting in a partial transfer?

> +	if (!desc)
> +		goto err_desc_get;
> +
> +	return &desc->txd;

[Severity: Medium]
Is there a missing assignment for the client transfer flags? The flags
parameter is never assigned to desc->txd.flags, which ignores client
intents like DMA_PREP_INTERRUPT or DMA_CTRL_REUSE.

[ ... ]
> +static struct dma_async_tx_descriptor *
> +atcdmac_prep_dma_cyclic(struct dma_chan *chan,
> +			dma_addr_t buf_addr,
> +			size_t buf_len,
> +			size_t period_len,
> +			enum dma_transfer_direction direction,
> +			unsigned long flags)
> +{
[ ... ]
> +	unsigned int period;
[ ... ]
> +	for (period =3D 0; period < buf_len; period +=3D period_len) {
> +		struct atcdmac_desc *desc;
> +		dma_addr_t mem =3D buf_addr + period;
> +		unsigned int len =3D min_t(unsigned int, period_len,
> +					 buf_len - period);

[Severity: High]
Since buf_len is a 64-bit size_t, does using a 32-bit unsigned int period
cause an integer overflow for buffer lengths exceeding 4GB? This appears
to create an infinite loop of descriptor allocations until the pool is
exhausted.

[Severity: Medium]
Does the use of min_t(unsigned int, period_len, buf_len - period) silently
truncate 64-bit size_t sizes over 4GB, programming a malformed transfer
size?

[ ... ]
> +static struct dma_chan *atcdmac_dma_xlate_handler(struct of_phandle_args=
 *dmac,
> +						  struct of_dma *of_dma)
> +{
> +	struct platform_device *dmac_pdev;
> +	struct atcdmac_chan *dmac_chan;
> +	struct dma_chan *chan;
> +	dma_cap_mask_t mask;
> +
> +	if (dmac->args[0] > FIELD_MAX(SRC_REQ_SEL_MASK)) {

[Severity: Medium]
Does this code access dmac->args[0] without first verifying
dmac->args_count? If #dma-cells =3D <0>, this may read uninitialized or
out-of-bounds memory.

[ ... ]
> +static int atcdmac_resume(struct device *dev)
> +{
[ ... ]
> +	list_for_each_entry_safe(chan,
> +				 chan_next,
> +				 &dmac->dma_device.channels,
> +				 device_node) {
> +		dmac_chan =3D atcdmac_chan_to_dmac_chan(chan);
> +		spin_lock_irqsave(&dmac_chan->lock, flags);
> +		if (!list_empty(&dmac_chan->active_list) ||
> +		    !list_empty(&dmac_chan->queue_list))
> +			atcdmac_start_next_trans(dmac_chan);
> +		spin_unlock_irqrestore(&dmac_chan->lock, flags);
> +	}

[Severity: High]
If a client has queued descriptors but not yet called
dma_async_issue_pending() (leaving chan_used =3D=3D 0), does unconditionally
starting the next transaction from queue_list violate the API contract by
starting pending transfers prematurely?

[Severity: High]
Additionally, if both active_list and queue_list are empty, this bypasses
atcdmac_start_next_trans(). Coupled with the issue in
atcdmac_advance_work() above, does this solidify the leaked chan_used =3D=
=3D 1
state from suspend, permanently locking out the channel?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001014503.7864=
90-1-cl634@andestech.com?part=3D2
