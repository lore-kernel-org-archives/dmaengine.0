Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353E844604E;
	Fri, 11 Sep 2026 07:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789113434; cv=none; b=JC/4mHzmQKwJ8xOnwX76u5+XIAKsa70o849S9ilcGFwaG8i/xrsDh2vgKk0AjFuderA3aybeE4vAV9X+FpDlW29um1DDwzGhUJeiBabrFgF7z3MyWLq6lTsaUpxG4oGQq0ml1S/q7jbw6+LsQZtXM09uOrUEqom1hTqG4UD79+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789113434; c=relaxed/simple;
	bh=0cp+PvBCs5qPPeHzgDsTw+ZwZshDjpAYWxpaFS8t/kY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fX+4ebo/jP+wj8Ps8HCc4ySLleajX51rsaWw54/Awl2+vVc1+EH2VMjQBwwL2wewwttvdeKHAefWfcAmp7nJZ42uf1NL4U01WXN+xrIIf9GSnMwg+pQbdaRpdDBoqqt0htgf41yTbgHLLzOTxNn2q7WVBA/dG07BT7sjW5Iw3tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KpAZGAvA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KpAZGAvA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4D361F000FF;
	Fri, 11 Sep 2026 07:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789113433;
	bh=hSZMb2gXwWsuxKewleo6zecix3FTzm0+APYyphtpIgI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KpAZGAvAfL5cenzZrBbc8s9A6qOF4+q5cPdz/IXSMV3X1hiVQDd7ZICExx4fywOtL
	 /SeaoIu5gzmqUe/ZRozBXdD+SD9VyCn0llXTHw8qM54dMmVQ7P7ZXbJ1nHorAHbmho
	 1QClwpSzAtpFAbfTOY4hTlO1VSQSozbLtY0PfHUzNVeQw/C60c876zjOv1e31tD+kr
	 /PISCffRjYsjyuAxrJq4x8aaBZxix3L8wgDFs/tH4n5IzSi30VnErO+QqT1G1hgRj7
	 2abP4TQeuIhSoB8vBQVGDwLhLUsSbU05eaeKTMVK3RwudQ9Ym8tsjDdp31DZJOQstD
	 bq8zXAfgqd0eg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/2] dmaengine: atcdmac300: Add driver for Andes
 ATCDMAC300 DMA controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "CL Wang" <cl634@andestech.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org, robh@kernel.org, vkoul@kernel.org
In-Reply-To: <20260911072524.1297406-3-cl634@andestech.com>
References: <20260911072524.1297406-1-cl634@andestech.com>
 <20260911072524.1297406-3-cl634@andestech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 07:57:12 +0000
Message-Id: <20260911075712.A4D361F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 11 potential issue=
(s) to consider:
- [Critical] Double-callback and Use-After-Free race in cyclic transfer com=
pletion during channel termination.
- [High] Masking pending hardware interrupts with software state (`used_cha=
n`) causes an unacknowledged IRQ storm.
- [High] The DMA device is exposed to clients before its IRQ handler and ca=
che coherency (IOCP) are fully initialized.
- [High] Polling for up to 100ms with interrupts disabled in `atcdmac_termi=
nate_all` causes soft lockups.
- [High] The channel-wide `cyclic` flag is sticky, and unconditional resume=
 restarts cause arbitrary DMA execution or kernel panics.
- [High] Suspend/resume race with the threaded IRQ causes transfer desynchr=
onization and hardware corruption.
- [High] dmaengine API violation in `atcdmac_terminate_all`: invoking compl=
etion callbacks for aborted transfers.
- [High] System suspend times out and fails if a slave DMA channel is activ=
ely waiting for peripheral data.
- [High] Sleep-in-atomic bug on PREEMPT_RT due to using `spinlock_t` in har=
dirq context.
- [High] Kernel panic due to list_del_init() on an uninitialized list_head =
in error paths.
- [Medium] Writing a blanket clear mask to `REG_INT_STA` clears unhandled i=
nterrupts, permanently losing them.
--

commit e06d7bd262ebaa03646e2e3ac2876918f25083d4
Author: CL Wang <cl634@andestech.com>

dmaengine: atcdmac300: Add driver for Andes ATCDMAC300 DMA controller

This patch adds support for the Andes ATCDMAC300 DMA controller.
The ATCDMAC300 is a memory-to-memory and peripheral DMA controller
that provides scatter-gather, cyclic, and slave transfer capabilities.

> diff --git a/drivers/dma/atcdmac300.c b/drivers/dma/atcdmac300.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/dma/atcdmac300.c
[ ... ]
> +static struct atcdmac_desc *atcdmac_alloc_desc(struct dma_chan *chan,
> +					       gfp_t gfp_flags)
> +{
> +	struct atcdmac_dmac *dmac =3D atcdmac_dev_to_dmac(chan->device);
> +	struct atcdmac_desc *desc;
> +	dma_addr_t phys;
> +
> +	desc =3D dma_pool_zalloc(dmac->dma_desc_pool, gfp_flags, &phys);
> +	if (desc) {
> +		INIT_LIST_HEAD(&desc->tx_list);
> +		dma_async_tx_descriptor_init(&desc->txd, chan);

[Severity: High]
Does this code leave desc_node uninitialized?

dma_pool_zalloc zeroes out the descriptor, leaving the pointers for desc_no=
de
as NULL since INIT_LIST_HEAD is not called for it. If a subsequent descript=
or
allocation fails (for instance, in atcdmac_prep_device_sg), the error path
calls atcdmac_put_desc on the first descriptor.

This descends into atcdmac_put_desc_nolock, which performs list_del_init on
desc_node, potentially causing a NULL pointer dereference on the
uninitialized list head.

[ ... ]
> +static void atcdmac_put_desc_nolock(struct atcdmac_chan *dmac_chan,
> +				    struct atcdmac_desc *desc)
> +{
[ ... ]
> +		list_del_init(&desc->desc_node);

[Severity: High]
Can this trigger a NULL pointer dereference as described above?

[ ... ]
> +static void atcdmac_start_next_trans(struct atcdmac_chan *dmac_chan)
> +{
> +	struct atcdmac_desc *next_tx =3D NULL;
> +	struct atcdmac_desc *dma_desc;
> +
> +	if (dmac_chan->cyclic) {
> +		/* Get the next DMA descriptor from tx_list. */
> +		dma_desc =3D atcdmac_get_active_head(dmac_chan);
> +		dma_desc->at =3D dma_desc->at->next;

[Severity: High]
Could this dereference an invalid pointer if the active_list is empty?

The channel-wide cyclic flag is sticky and is never cleared when a transfer
is terminated. If atcdmac_start_next_trans is called (for example, during
system resume) on a previously cyclic channel that is now idle, active_list
will be empty.

Using list_first_entry via atcdmac_get_active_head on an empty list returns
a bogus pointer, leading to a fault when dma_desc->at is accessed.

[ ... ]
> +static void atcdmac_advance_work(struct atcdmac_chan *dmac_chan)
> +{
[ ... ]
> +	if (dmac_chan->cyclic) {
> +		if (!stop)
> +			atcdmac_start_next_trans(dmac_chan);
> +
> +		spin_unlock_irqrestore(&dmac_chan->lock, flags);
> +		res.result =3D DMA_TRANS_NOERROR;
> +		dmaengine_desc_get_callback_invoke(&dma_desc->txd, &res);

[Severity: Critical]
Is there a use-after-free race here if atcdmac_terminate_all runs
concurrently?

dma_desc remains in the unlocked active_list while the channel lock is drop=
ped
to invoke the client callback. If another thread calls atcdmac_terminate_al=
l,
it will splice active_list, abort the channel, manually run the callback on
dma_desc again, and return it to the free_list.

Another CPU can then immediately reallocate the descriptor and overwrite the
callback pointers while the first CPU is still reading them to execute, whi=
ch
could lead to arbitrary code execution.

[Severity: High]
Can this delayed threaded IRQ cause a double-start race with system resume?

If a transfer finishes right before suspend, the hardware interrupt fires
but the threaded IRQ handler may not execute before the system freezes. On
resume, stop_mask is cleared and the transfer is restarted. When normal
operations resume, this delayed threaded IRQ runs, finds stop cleared, and
erroneously double-starts the transfer while it is already actively running.

[ ... ]
> +static irqreturn_t atcdmac_interrupt(int irq, void *dev_id)
> +{
> +	struct atcdmac_dmac *dmac =3D dev_id;
> +	struct atcdmac_chan *dmac_chan;
> +	unsigned int status;
> +	unsigned int int_ch;
> +	int ret =3D IRQ_NONE;
> +	int i;
> +
> +	regmap_read(dmac->regmap, REG_INT_STA, &status);
> +	int_ch =3D READ_ONCE(dmac->used_chan) & DMA_INT_ALL(status);

[Severity: High]
Does masking hardware interrupts with the software used_chan state risk an
unacknowledged IRQ storm?

If an interrupt fires for a channel where the software used_chan bit is 0
(such as an abort interrupt triggered by atcdmac_terminate_all on an idle
channel), int_ch evaluates to 0.

The handler bypasses the clear routine and returns without acknowledging the
hardware interrupt, potentially causing an infinite loop of interrupts.

> +
> +	while (int_ch) {
> +		spin_lock(&dmac->lock);

[Severity: High]
Is it safe to use a standard spinlock_t in hardirq context here?

On PREEMPT_RT kernels, spinlock_t is implemented as an RT mutex which can
sleep. Locks acquired in genuine hardware interrupt context typically need
to be typed as raw_spinlock_t to avoid scheduling while atomic.

> +		dmac->used_chan =3D READ_ONCE(dmac->used_chan) & ~int_ch;
> +		spin_unlock(&dmac->lock);
> +		regmap_write(dmac->regmap, REG_INT_STA, DMA_INT_CLR(int_ch));

[Severity: Medium]
Does writing a blanket clear mask erase unhandled interrupts?

The DMA_INT_CLR macro writes 1s to the TC, ABT, and ERR bits for the given
channel, regardless of which interrupts were actually set in the status rea=
d.
If a new interrupt (like ERR) asserts after the status read but before this
clear write, it gets cleared but never handled.

[ ... ]
> +static int atcdmac_terminate_all(struct dma_chan *chan)
> +{
[ ... ]
> +	spin_lock_irqsave(&dmac_chan->lock, flags);
> +	atcdmac_abort_chan(dmac_chan);
> +	atcdmac_enable_chan(dmac_chan, 0);
> +	ret =3D regmap_read_poll_timeout_atomic(dmac_chan->dma_dev->regmap,
> +					      REG_CH_EN,
> +					      val,
> +					      !(val & BIT(dmac_chan->chan_id)),
> +					      10,
> +					      ATCDMAC_CHAN_TIMEOUT_US);

[Severity: High]
Can this cause a soft lockup by polling for up to 100ms with interrupts
disabled?

Calling regmap_read_poll_timeout_atomic with a 100,000us timeout while
holding a spinlock in hardirq-disabled context can trigger the NMI watchdog
and create extreme system latency spikes.

[ ... ]
> +	list_for_each_entry_safe(desc_cur, desc_next, &list, desc_node) {
> +		atcdmac_run_tx_complete_actions(desc_cur, DMA_TRANS_ABORTED);

[Severity: High]
Is it permissible to invoke completion callbacks for aborted transfers?

The dmaengine API explicitly prohibits executing callbacks for aborted
descriptors because clients (such as ALSA) typically call terminate_all with
their own stream locks held. Invoking the callback here can cause a deadlock
when the client attempts to acquire the exact same lock.

[ ... ]
> +static int atcdmac_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	ret =3D dma_async_device_register(&dmac->dma_device);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D atcdmac_init_irq(pdev, dmac);
> +	if (ret)
> +		goto err_dma_async_register;
> +
> +	ret =3D atcdmac_init_iocp(pdev, dmac);

[Severity: High]
Are the DMA channels exposed to clients before the IRQ handler and cache
coherency (IOCP) are fully initialized?

dma_async_device_register makes the DMA channels immediately available to
kernel clients. If a client immediately requests a channel and starts a
transfer before atcdmac_init_irq and atcdmac_init_iocp execute, the transfer
will run without cache snooping configured, which could lead to memory
corruption.

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
> +		atcdmac_start_next_trans(dmac_chan);

[Severity: High]
Could this improperly restart idle cyclic channels?

This unconditionally calls atcdmac_start_next_trans for every channel
regardless of its active software state. If a channel was previously cyclic
but is currently idle, it will cause a fault as described earlier when
dereferencing the empty active_list.

[ ... ]
> +static int atcdmac_suspend(struct device *dev)
> +{
> +	struct atcdmac_dmac *dmac =3D dev_get_drvdata(dev);
> +	int ret;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&dmac->lock, flags);
> +	dmac->stop_mask =3D BIT(dmac->num_ch) - 1;
> +	spin_unlock_irqrestore(&dmac->lock, flags);
> +	ret =3D atcdmac_wait_chan_idle(dmac,
> +				     dmac->stop_mask,
> +				     ATCDMAC_CHAN_TIMEOUT_US * dmac->num_ch);

[Severity: High]
Will system suspend time out and fail if a slave DMA channel is actively
waiting for peripheral data?

The suspend sequence sets a stop_mask that prevents software from chaining =
the
next descriptor, but does not pause actively running transfers. It then blo=
cks
waiting for all channels to report idle.

If a DEV_TO_MEM slave channel is waiting for hardware flow control or
incoming data, it will never complete. The polling loop will eventually time
out, aborting the entire system sleep transition.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911072524.1297=
406-1-cl634@andestech.com?part=3D2
