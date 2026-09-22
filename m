Received: from Atcsqr.andestech.com (atcsqr.andestech.com [220.128.198.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01698522F12
	for <dmaengine@vger.kernel.org>; Tue, 22 Sep 2026 07:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.128.198.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790063805; cv=none; b=UVPK/HJ/9Y0wx408OF1FMO9DOGpUQc9bhzpSxZN+FerOj+sG6htoQ3jdVXqmRC52bB5U1Qw8vjXryBpo6ga2b6Q8PBd/OmuJb+eJtjKxkZbYv0VdzeMGkGz93qenxEMtDjRxfI1zdo6cMZ2pZpc+OMYhnlGcjJc8lcO8v4AQkpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790063805; c=relaxed/simple;
	bh=UoDkm3gOOO7PAidsy67hbx+7JNKcjk/PhCqyQtSfZFg=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yj4xVcNHw+R+bmNsAKXu3yLRkEmOhzT/0jCFvSp/kYMIp2Rrb/hoVGWJP5sts5yYcWr8DHjZzMbK9TQNwBns77Ale7D/2uwbIHbR9raLwlK1p7oLfjk8UYqa6T1FYr9Jszq4QdfeKARLwRY5EnoCthCzg5HgCCKzpHIry2gkO30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=220.128.198.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (atcpcs55.andestech.com [10.0.1.155])
	by Atcsqr.andestech.com with ESMTPS id 68M7uEdZ048257
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Sep 2026 15:56:14 +0800 (+08)
	(envelope-from cl634@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs55.andestech.com
 (10.0.1.155) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.43; Tue, 22 Sep
 2026 15:56:14 +0800
Received: from swlinux02 (10.0.15.183) by ATCPCS34.andestech.com (10.0.1.134)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Sep
 2026 15:56:14 +0800
Date: Tue, 22 Sep 2026 15:56:10 +0800
From: CL Wang <cl634@andestech.com>
To: Frank Li <Frank.li@oss.nxp.com>
CC: <sashiko-reviews@lists.linux.dev>, <dmaengine@vger.kernel.org>,
        <vkoul@kernel.org>, <robh@kernel.org>, <Frank.Li@kernel.org>,
        <conor+dt@kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v7 2/2] dmaengine: atcdmac300: Add driver for Andes
 ATCDMAC300 DMA controller
Message-ID: <arI0moAjFUudQW4J@swlinux02>
References: <20260916134258.2178081-1-cl634@andestech.com>
 <20260916134258.2178081-3-cl634@andestech.com>
 <20260916140120.3112D1F000FF@smtp.kernel.org>
 <aqq62tSqUHvBkRs4@SMW015318>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aqq62tSqUHvBkRs4@SMW015318>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs55.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 68M7uEdZ048257

Hi Frank,

Thanks for looking at this, and thanks to the bot for a careful pass.

Five of the eight are fixed for v8. Three do not apply to this driver
and I have tried to say why rather than just assert it.

> - [High] dmaengine: atcdmac300: UAF on driver unbind due to devres
> lifecycle mismatch
Fixed.

> - [High] dmaengine: atcdmac300: permanent controller halt if suspend
> times out
Fixed.

> - [High] dmaengine: atcdmac300: NULL pointer dereference mixing cyclic
> and non-cyclic transfers
Fixed.

> - [High] dmaengine: atcdmac300: cross-transfer corruption on
> simultaneous TC and ERR interrupts
I do not think this one can happen. The data sheet defines the terminal
count bit of the interrupt status register at offset 0x30 as

	The terminal count status is set when a channel transfer
	finishes without the abort or error event.

so for one transfer the two are mutually exclusive. Chained transfers do
not widen the window either: the same document says that with IntTCMask=0
an interrupt is "only be generated when data transfer of the last linked
descriptor is complete", so a chain raises one terminal count rather than
one per link.

> - [Medium] dmaengine: atcdmac300: memory leak of unsubmitted
> descriptors
The desc_free half of this does not apply. The callback is reachable
only through dmaengine_desc_free(),

	static inline int dmaengine_desc_free(struct dma_async_tx_descriptor *desc)
	{
		/* this is supported for reusable desc, so check that */
		if (!dmaengine_desc_test_reuse(desc))
			return -EPERM;

		return desc->desc_free(desc);
	}:w

and a client can only set DMA_CTRL_REUSE through dmaengine_desc_set_reuse(),
which fails unless the channel advertises descriptor_reuse. This driver
does not set dma_device.descriptor_reuse, so the callback can never be
invoked and adding it would be dead code. Documentation/driver-api/
dmaengine/provider.rst puts it the same way: dmaengine_desc_free() "can
succeed only when DMA_CTRL_REUSE is already set".

I looked at closing that properly and do not think the API allows it.
There is no unprepare, so a client that abandons a descriptor makes no
call the driver could hook. Tracking every descriptor handed out would
move the recovery point from teardown to terminate or free_chan_resources
but not remove it, at the cost of a list operation on prep and submit.
Implementing DMA_CTRL_REUSE does not help either: dmaengine_desc_free()
requires the client to have set that flag first, and a client that intends
to abandon a descriptor is not one that asked to reuse it.

No in-tree client of this driver prepares a transfer it does not submit,
so I have left it. Say if you would rather have the tracking anyway.

> - [Medium] dmaengine: atcdmac300: silent truncation of DT req_num
> exceeding 15
Fixed.

> - [Medium] dmaengine: atcdmac300: transfers queued during suspend are
> stranded on resume
Fixed.

> - [Low] dmaengine: atcdmac300: missing endianness conversions for DMA
> descriptors
This one cannot bite. The driver depends on ARCH_ANDES and Linux has no
big-endian RISC-V: arch/riscv/Kconfig offers neither CPU_BIG_ENDIAN nor
CPU_LITTLE_ENDIAN, so the conversions would be no-ops wherever this can
be built.

If here are no further comments, I will submit v8 with the five fixes.

Thanks,
CL Wang


On Wed, Sep 16, 2026 at 10:50:50AM -0500, Frank Li wrote:
> [EXTERNAL MAIL]
> 
> On Wed, Sep 16, 2026 at 02:01:19PM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 8 potential issue(s) to consider:
> > - [High] dmaengine: atcdmac300: UAF on driver unbind due to devres lifecycle mismatch
> > - [High] dmaengine: atcdmac300: permanent controller halt if suspend times out
> > - [High] dmaengine: atcdmac300: NULL pointer dereference mixing cyclic and non-cyclic transfers
> > - [High] dmaengine: atcdmac300: cross-transfer corruption on simultaneous TC and ERR interrupts
> > - [Medium] dmaengine: atcdmac300: memory leak of unsubmitted descriptors
> > - [Medium] dmaengine: atcdmac300: silent truncation of DT req_num exceeding 15
> > - [Medium] dmaengine: atcdmac300: transfers queued during suspend are stranded on resume
> > - [Low] dmaengine: atcdmac300: missing endianness conversions for DMA descriptors
> > --
> 
> Please fix these problem or provide explain.
> 
> Frank
> 
> >
> > commit 94fd62b6d9e6afc2cf50f8dff89eedcdc57f24c9
> > Author: CL Wang <cl634@andestech.com>
> > Subject: dmaengine: atcdmac300: Add driver for Andes ATCDMAC300 DMA controller
> >
> > This patch adds support for the Andes ATCDMAC300 DMA controller. It provides
> > scatter-gather, cyclic, and slave transfer capabilities.
> >
> > > diff --git a/drivers/dma/atcdmac300.c b/drivers/dma/atcdmac300.c
> > > index 0000000000000..e0a8a980e2fe8
> > > --- /dev/null
> > > +++ b/drivers/dma/atcdmac300.c
> > [ ... ]
> > > @@ -82,9 +82,6 @@ static struct atcdmac_desc *atcdmac_alloc_desc(struct dma_chan *chan,
> > >             INIT_LIST_HEAD(&desc->desc_node);
> > >             INIT_LIST_HEAD(&desc->tx_list);
> > >             dma_async_tx_descriptor_init(&desc->txd, chan);
> > >             desc->txd.flags = DMA_CTRL_ACK;
> > >             desc->txd.tx_submit = atcdmac_tx_submit;
> > >             desc->txd.phys = phys;
> > >     }
> >
> > [Severity: Medium]
> > The desc_free callback is omitted from the transaction descriptor here.
> > If a client prepares a descriptor but aborts and frees it before
> > submission, the DMA engine core won't be able to free it.
> >
> > [ ... ]
> > > @@ -494,11 +494,11 @@ static irqreturn_t atcdmac_irq_thread(int irq, void *dev_id)
> > >     for (i = 0; i < dmac->num_ch; i++) {
> > >             dmac_chan = &dmac->chan[i];
> > >
> > >             if (test_and_clear_bit(ATCDMAC_STA_TC, &dmac_chan->status)) {
> > >                     atcdmac_advance_work(dmac_chan);
> > >                     handled = true;
> > >             }
> > >
> > >             if (test_and_clear_bit(ATCDMAC_STA_ERR, &dmac_chan->status)) {
> > >                     atcdmac_handle_error(dmac_chan);
> > >                     handled = true;
> > >             }
> >
> > [Severity: High]
> > The lack of mutual exclusivity allows both conditions to execute if both
> > status bits are asserted simultaneously by the hardware. In this case,
> > atcdmac_advance_work() would complete the current descriptor and start the
> > next one, followed immediately by atcdmac_handle_error() wrongly aborting
> > the newly started, innocent descriptor. Should these checks be mutually
> > exclusive?
> >
> > [ ... ]
> > > @@ -911,10 +911,8 @@ atcdmac_prep_dma_cyclic(struct dma_chan *chan,
> > >             if (!desc)
> > >                     goto err_desc_get;
> > >             atcdmac_chain_desc(&first, &prev, desc, true);
> > >     }
> > >
> > >     first->txd.flags = flags;
> > >     dmac_chan->cyclic = true;
> >
> > [Severity: High]
> > This modifies the channel-wide state during descriptor preparation.
> > If a client prepares a cyclic transfer, does not submit it, and
> > subsequently prepares and submits a non-cyclic transfer, this global
> > flag remains set. When the non-cyclic transfer completes, could this
> > cause atcdmac_advance_work() to treat it as cyclic and attempt to
> > dereference dma_desc->at->next in atcdmac_start_next_trans(), leading
> > to a kernel panic?
> >
> > [ ... ]
> > > @@ -1144,10 +1144,8 @@ static void atcdmac_free_chan_resources(struct dma_chan *chan)
> > >     spin_lock_irqsave(&dmac_chan->lock, flags);
> > >     list_for_each_entry_safe(desc,
> > >                              desc_next,
> > >                              &dmac_chan->free_list,
> > >                              desc_node) {
> > >             list_del(&desc->desc_node);
> > >             dma_pool_free(dmac->dma_desc_pool, desc, desc->txd.phys);
> > >     }
> >
> > [Severity: Medium]
> > This loop only frees descriptors currently sitting in the free_list.
> > Combined with the missing desc_free callback above, does this mean any
> > prepared but unsubmitted descriptors are permanently leaked and never
> > returned to the dma_desc_pool?
> >
> > [ ... ]
> > > @@ -1189,8 +1189,8 @@ static struct dma_chan *atcdmac_dma_xlate_handler(struct of_phandle_args *dmac,
> > >     if (!chan)
> > >             return NULL;
> > >
> > >     dmac_chan = atcdmac_chan_to_dmac_chan(chan);
> > >     dmac_chan->dev_chan = true;
> > >     dmac_chan->req_num = dmac->args[0] & 0xff;
> >
> > [Severity: Medium]
> > The request number is extracted and masked to 8 bits. However, the hardware
> > request selection registers (SRC_REQ_SEL_MASK, DST_REQ_SEL_MASK) are only
> > 4 bits wide. Since FIELD_PREP silently truncates values, a device tree
> > req_num of 16 will be programmed into hardware as 0 without warning.
> > Should this value be explicitly validated against the 4-bit maximum?
> >
> > [ ... ]
> > > @@ -1305,9 +1305,9 @@ static int atcdmac_init_ioremap_and_regmap(struct platform_device *pdev,
> > >     regmap_read(regmap, REG_CFG, &val);
> > >     num_ch = val & CH_NUM;
> > >     size = sizeof(*dmac) + num_ch * sizeof(struct atcdmac_chan);
> > >     dmac = devm_kzalloc(&pdev->dev, size, GFP_KERNEL);
> > >     if (!dmac)
> > >             return -ENOMEM;
> >
> > [Severity: High]
> > The DMA controller structure is allocated using devres, tying its
> > lifetime to the device binding rather than the dma_device refcount.
> > If a client driver still holds a channel reference when the device is
> > unbound, could this lead to a use-after-free when the client later
> > releases the channel and atcdmac_free_chan_resources() accesses the
> > freed dmac structure?
> >
> > [ ... ]
> > > @@ -1543,9 +1543,8 @@ static int atcdmac_resume(struct device *dev)
> > >     list_for_each_entry_safe(chan,
> > >                              chan_next,
> > >                              &dmac->dma_device.channels,
> > >                              device_node) {
> > >             dmac_chan = atcdmac_chan_to_dmac_chan(chan);
> > >             spin_lock_irqsave(&dmac_chan->lock, flags);
> > >             if (!list_empty(&dmac_chan->active_list))
> > >                     atcdmac_start_next_trans(dmac_chan);
> >
> > [Severity: Medium]
> > This condition actively prevents queue_list items from being serviced if
> > the active_list is empty during resume. Since transfers submitted during
> > suspend are placed into queue_list (because stop_mask prevents them from
> > starting), won't they remain stranded indefinitely unless issue_pending
> > is also called here?
> >
> > [ ... ]
> > > @@ -1568,9 +1568,9 @@ static int atcdmac_suspend(struct device *dev)
> > >     synchronize_irq(dmac->irq);
> > >
> > >     ret = atcdmac_wait_chan_idle(dmac,
> > >                                  chan_mask,
> > >                                  ATCDMAC_CHAN_TIMEOUT_US * dmac->num_ch);
> > >
> > >     return ret;
> > >  }
> >
> > [Severity: High]
> > If atcdmac_wait_chan_idle() times out, the function returns the error code
> > without reverting dmac->stop_mask back to 0. Since the PM core would abort
> > the system suspend and resume normal operations, wouldn't this permanently
> > prevent any new transfers from starting?
> >
> > > diff --git a/drivers/dma/atcdmac300.h b/drivers/dma/atcdmac300.h
> > > index 0000000000000..3d2d07effc26d
> > > --- /dev/null
> > > +++ b/drivers/dma/atcdmac300.h
> > [ ... ]
> > > @@ -148,10 +148,10 @@ enum dma_sta {
> > >   * @ll_ptr_hi: Linked List Pointer Register (high 32-bit).
> > >   */
> > >  struct atcdmac_regs {
> > >     unsigned int ctrl;
> > >     unsigned int trans_size;
> >
> > [Severity: Low]
> > The hardware descriptor layout uses native unsigned int instead of
> > explicitly sized __le32 types. When these fields are populated in
> > atcdmac_build_desc(), values are assigned directly without cpu_to_le32().
> > Does this lack of endianness conversion break portability if this driver
> > is ever used on a big-endian system?
> >
> > --
> > Sashiko AI review · https://sashiko.dev/#/patchset/20260916134258.2178081-1-cl634@andestech.com?part=2
