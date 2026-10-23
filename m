Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792749504;
	b=a/yLcG9v6OTGQTqoaJ0/mI2/v2xhe0JsPwXRR+EJOYQjPLvyWe3KrCe8QJiU/z7AgGw/
	 bflXyXbTZSK5KoRweozWxap054B8a7aJRKdbaFV6bbMV1Xeo6ammVaK72YBJ26r7YHVte
	 3yCUG3sMFA3OIWu8WjidlAV0Ef/0e06nFuN3BqhwB+gDzQ29pdGzty5UqsXp0hNYEsgmn
	 NRTx/K4psNV2seWyPqK/tuCoPXcyJsKUzX8onT49wrR1vgptocfAlWLjOjHTd+pHtBmuG
	 +K9OQjOEsV3OJNH/7UAhrMy3z0Xc+GFRkNwEtkrA83shy6rA2uT0bvjAdQgeJF7lWUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792749504;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=F7z54Mm7JzDI3a3Zv0NiLmWi5pxlTQCT46xlX2O/ufE=;
	b=lnsmvg5CLNlwg4CeqDuGlUbp5SKt3AtNXyy7FIU0ECBC2KWuzqjXRkKe/gWdTl2ij2E3
	 7de+erGpwGVNUHo4jkhhzB8Mo3PPz1Pmoc8VEXK+Z3nKk/Wb7p4oGfSve499MsyczefeJ
	 7sLQchhnv3SFJPP5mXVFo20rltqt6livVukYF8dcE5vvPOdCubsyz6fq5tjsiUHgbGcbs
	 I4zoXhTThYPswKK9NqlPwJWKOuwVKFOl8weB9kqvVp61WfSuZsgMJT5nnsbuQkfHnOhX1
	 8T3hgeX3lsnK02IFptltvPmLbS/oTJ2b0JpAboR/Xg4+8ScDTaI56Z1vlUSuJ68ts8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NwZXFNhU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2836A606A31A;
	Fri, 23 Oct 2026 09:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NwZXFNhU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A97691F01825;
	Fri, 23 Oct 2026 09:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792749504;
	bh=F7z54Mm7JzDI3a3Zv0NiLmWi5pxlTQCT46xlX2O/ufE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NwZXFNhUtUeSIApRJ/8z9X1BGhZJHS4zCDD/O8/46OxNULFn7gMikcaU/hVFC5yH1
	 1GeFkw4wsFbwWCRLI20G9VnkYTm20fAEYEDHCUTi9LklmewQG+0dEA0oxkYPTgnd6X
	 M95YpKdBOq1d52RJgZtK/Uk/ayFETBxu8hiLwb0Ca1oGb/UWKaIO/lumzA49BZbTVx
	 Dx0qYr8QntKLjhmHQYxlE3rAt3snMnHiHCDGziAw5Pv9d0vTDArwh0Qgc8qLng2q1T
	 zEakOm0sQQBP8PBjiyCoQx6T2bIsv/u4+iurd200mj1w0M5SdsRfOp/RXloJwMdJla
	 nDeYZJhJBMccA==
Message-ID: <sashiko-outbox-182650@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/5] dmaengine: arm-dma350: Add slave and cyclic
 transfer support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jelly Jia" <Jelly.Jia@cixtech.com>
Cc: devicetree@vger.kernel.org, dmaengine@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261023093017.3248454-3-Jelly.Jia@cixtech.com>
References: <20261023093017.3248454-1-Jelly.Jia@cixtech.com>
 <20261023093017.3248454-3-Jelly.Jia@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 09:58:23 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] dmaengine: arm-dma350: unlocked sconfig read and -EBUSY in d350_co=
nfig()
- [High] dmaengine: arm-dma350: cyclic residue desync in d350_get_cyclic_re=
sidue()
- [High] dmaengine: arm-dma350: unchecked has_trig/tsz and BIT(0) in addr_w=
idths
- [High] dmaengine: arm-dma350: missing stop wait in d350_start_next() and =
stop race
- [Medium] dmaengine: arm-dma350: race in d350_irq() and d350_terminate_all=
() on CH_STATUS
--

commit 7ea8f6c5155871b057296b78b296628ea4bd9bcc
Author: Jelly Jia <Jelly.Jia@cixtech.com>

dmaengine: arm-dma350: Add slave and cyclic transfer support

This commit adds peripheral scatter-gather and cyclic DMA transfer support =
to
the Arm DMA-350 driver, including trigger configuration, coherent command p=
ool
allocation, period callbacks, and residue calculation. It also adds slave
configuration validation, OF DMA controller registration, and bounded chann=
el
stop polling during teardown.

> diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
> index 4e17130de6c87..f62ff6a9f4909 100644
> --- a/drivers/dma/arm-dma350.c
> +++ b/drivers/dma/arm-dma350.c

[ ... ]

> @@ -207,14 +254,452 @@ static inline struct d350_chan *to_d350_chan(struc=
t dma_chan *chan)

[ ... ]

> +static int d350_config(struct dma_chan *chan, struct dma_slave_config *c=
onfig)
> +{
> +	struct d350_chan *dch =3D to_d350_chan(chan);
> +	struct dma_device *dma =3D chan->device;
> +	unsigned long flags;
> +	int ret;
> +
> +	ret =3D d350_check_slave_config(dma, config);
> +	if (ret) {
> +		dev_err(dma->dev, "invalid slave configuration\n");
> +		return ret;
> +	}
> +
> +	spin_lock_irqsave(&dch->vc.lock, flags);
> +	if (dch->desc || !list_empty(&dch->vc.desc_allocated) ||
> +	    !list_empty(&dch->vc.desc_submitted) ||
> +	    !list_empty(&dch->vc.desc_issued)) {
> +		spin_unlock_irqrestore(&dch->vc.lock, flags);
> +		return -EBUSY;
> +	}
> +	memcpy(&dch->sconfig, config, sizeof(dch->sconfig));
> +	spin_unlock_irqrestore(&dch->vc.lock, flags);
> +
> +	return 0;
> +}

[ ... ]

> +static int d350_slave_params(struct d350_chan *dch,
> +			     enum dma_transfer_direction direction,
> +			     phys_addr_t *dev_cpu_addr,
> +			     enum dma_data_direction *dev_dir,
> +			     enum dma_slave_buswidth *width, u32 *maxburst)
> +{
> +	struct dma_slave_config *config =3D &dch->sconfig;
> +
> +	if (direction =3D=3D DMA_MEM_TO_DEV) {
> +		*dev_cpu_addr =3D config->dst_addr;
> +		*dev_dir =3D DMA_FROM_DEVICE;
> +		*width =3D config->dst_addr_width;
> +		*maxburst =3D config->dst_maxburst;
> +	} else if (direction =3D=3D DMA_DEV_TO_MEM) {
> +		*dev_cpu_addr =3D config->src_addr;
> +		*dev_dir =3D DMA_TO_DEVICE;
> +		*width =3D config->src_addr_width;
> +		*maxburst =3D config->src_maxburst;
> +	} else {
> +		return -EINVAL;
> +	}
> +
> +	return *width && *maxburst ? 0 : -EINVAL;
> +}

[Severity: High]
Does rejecting d350_config() with -EBUSY when descriptors are present break
pipelined slave transfers and descriptor reuse, while still leaving
d350_slave_params() unlocked against concurrent d350_config() calls?

In d350_prep_slave_sg() and d350_prep_dma_cyclic(), all slave configuration
fields are snapshotted via d350_slave_params() into the newly allocated
struct d350_desc when preparing a descriptor, so updating dch->sconfig does
not affect already-prepared descriptors.

However, d350_config() returns -EBUSY whenever dch->desc is set or any of
desc_allocated, desc_submitted, or desc_issued is non-empty. That prevents
clients from reconfiguring the channel for a subsequent transfer while an
earlier one is allocated or in flight. In addition, because
dmac->dma.descriptor_reuse is true, vchan_vdesc_fini() places completed
DMA_CTRL_REUSE descriptors back onto dch->vc.desc_allocated, causing all
subsequent dmaengine_slave_config() calls to fail with -EBUSY until the
reusable descriptor is freed or terminated.

At the same time, d350_prep_slave_sg() and d350_prep_dma_cyclic() call
d350_slave_params() before vchan_tx_prep() acquires dch->vc.lock and inserts
the descriptor onto dch->vc.desc_allocated:

  d350_prep_slave_sg() / d350_prep_dma_cyclic()
    d350_slave_params()   <-- reads dch->sconfig without dch->vc.lock
    ...
    vchan_tx_prep()       <-- acquires dch->vc.lock and adds to desc_alloca=
ted

If dmaengine_slave_config() -> d350_config() runs concurrently with
d350_prep_slave_sg() or d350_prep_dma_cyclic(), d350_slave_params() can rea=
d a
partially updated dch->sconfig while memcpy() is executing under
dch->vc.lock. Should d350_config() allow updating dch->sconfig while
descriptors exist, and should d350_slave_params() read dch->sconfig under
dch->vc.lock?

[ ... ]

> @@ -347,6 +897,7 @@ static int d350_terminate_all(struct dma_chan *chan)
> =20
>  	spin_lock_irqsave(&dch->vc.lock, flags);
>  	writel_relaxed(CH_CMD_STOP, dch->base + CH_CMD);
> +	dch->stopping =3D true;
>  	if (dch->desc) {
>  		if (dch->status !=3D DMA_ERROR)
>  			vchan_terminate_vdesc(&dch->desc->vd);
> @@ -360,16 +911,105 @@ static int d350_terminate_all(struct dma_chan *cha=
n)
>  	return 0;
>  }
> =20
> +static int d350_wait_for_stop(struct d350_chan *dch)
> +{
> +	u32 cmd;
> +	int ret;
> +
> +	if (!READ_ONCE(dch->stopping))
> +		return 0;
> +
> +	/* STOPCMD clears only after the channel has stopped using commands. */
> +	ret =3D readl_poll_timeout(dch->base + CH_CMD, cmd,
> +				 !(cmd & CH_CMD_STOP), 10,
> +				 D350_STOP_TIMEOUT_US);
> +	if (ret)
> +		dev_warn(dch->vc.chan.device->dev,
> +			 "channel %d failed to stop\n", dch->vc.chan.chan_id);
> +	else
> +		WRITE_ONCE(dch->stopping, false);
> +
> +	return ret;
> +}

[Severity: High]
What happens if a client calls dmaengine_terminate_async() ->
d350_terminate_all() and then issues a new transfer via
dma_async_issue_pending() -> d350_issue_pending() -> d350_start_next() befo=
re
calling dmaengine_synchronize()?

In d350_terminate_all(), CH_CMD_STOP is written to CH_CMD, dch->stopping is
set to true, and dch->desc is cleared to NULL under dch->vc.lock without
waiting for CH_CMD_STOP to clear. If d350_issue_pending() is called next,
d350_start_next() sees dch->desc =3D=3D NULL and immediately writes the new
descriptor's registers and CH_CMD_ENABLE while CH_CMD_STOP may still be act=
ive
in hardware, and without clearing dch->stopping.

Additionally, in d350_wait_for_stop(), WRITE_ONCE(dch->stopping, false) runs
outside dch->vc.lock. If d350_terminate_all() runs on another CPU after
readl_poll_timeout() finishes polling CH_CMD but before
WRITE_ONCE(dch->stopping, false) executes, dch->stopping is overwritten with
false. A subsequent d350_synchronize() for that second termination will then
see dch->stopping =3D=3D false and skip waiting for CH_CMD_STOP before
vchan_synchronize() frees the descriptor's command pool buffers and unmaps
peripheral resources.

> +
>  static void d350_synchronize(struct dma_chan *chan)
>  {
>  	struct d350_chan *dch =3D to_d350_chan(chan);
> =20
> +	/* A stop timeout must not skip callback synchronization. */
> +	d350_wait_for_stop(dch);
>  	vchan_synchronize(&dch->vc);
>  }
> =20
>  static u32 d350_desc_bytes(struct d350_desc *desc)
>  {
> -	return ((u32)desc->xsizehi << 16 | desc->xsize) << desc->tsz;
> +	return desc->bytes;
> +}
> +
> +static u32 d350_get_cyclic_residue(struct d350_chan *dch)
> +{
> +	struct d350_desc *desc =3D dch->desc;
> +	u32 period_residue =3D desc->bytes - desc->period * desc->period_len;
> +	u32 linkaddr;
> +	u32 linkaddrhi;
> +	u32 hi_new;
> +	u32 lo_new;
> +	u64 next_cmd;
> +	int retries =3D 3;
> +
> +	/*
> +	 * desc->period counts the completed periods, so period_residue is the
> +	 * residue at the last period boundary. Subtract the progress made in
> +	 * the running period, read from CH_XSIZE: CH_LINKADDR points at the
> +	 * command after the one executing, so while the channel is still on the
> +	 * command of the running period it names the first command of the next
> +	 * period.
> +	 */
> +	hi_new =3D readl_relaxed(dch->base + CH_LINKADDRHI);
> +	do {
> +		linkaddrhi =3D hi_new;
> +		linkaddr =3D readl_relaxed(dch->base + CH_LINKADDR);
> +		hi_new =3D readl_relaxed(dch->base + CH_LINKADDRHI);
> +	} while (linkaddrhi !=3D hi_new && --retries);
> +
> +	next_cmd =3D (linkaddr & ~CH_LINKADDR_EN) | ((u64)linkaddrhi << 32);
> +	if (next_cmd !=3D desc->cmds[(desc->period + 1) % desc->periods].dma)
> +		return dch->residue;
> +
> +	period_residue -=3D desc->period_len - d350_get_residue(dch);
> +
> +	/*
> +	 * If the channel stepped to the next period while CH_XSIZE was read,
> +	 * the size belongs to a command of the next period and mixing it with
> +	 * the current one would overstate the residue: keep the last reported
> +	 * value instead.
> +	 */
> +	hi_new =3D readl_relaxed(dch->base + CH_LINKADDRHI);
> +	lo_new =3D readl_relaxed(dch->base + CH_LINKADDR);
> +	if (hi_new !=3D linkaddrhi || lo_new !=3D linkaddr)
> +		return dch->residue;
> +
> +	return period_residue;
> +}

[Severity: High]
Can d350_get_cyclic_residue() permanently freeze dch->residue or return sta=
le
residue from a previous period when comparing next_cmd against the
software-tracked desc->period?

Unlike d350_get_sg_residue(), which locates the active command by matching
next_cmd against desc->cmds[i].dma, d350_get_cyclic_residue() requires
next_cmd to equal desc->cmds[(desc->period + 1) % desc->periods].dma, where
desc->period is incremented once per interrupt in d350_irq():

  if (desc->cyclic) {
          desc->period =3D (desc->period + 1) % desc->periods;
          dch->residue =3D d350_get_cyclic_residue(dch);
          vchan_cyclic_callback(vd);
  }

This can fail in several ways:

1. If interrupt latency causes two periods to complete before d350_irq() re=
ads
and clears CH_STATUS (when desc->periods > 1), the hardware link pointer
advances by two commands while desc->period only increments by one. Because
subsequent interrupts advance both hardware and desc->period by one,
next_cmd !=3D desc->cmds[(desc->period + 1) % desc->periods].dma remains tr=
ue on
every subsequent call, freezing dch->residue for the rest of the cyclic
transfer.

2. In d350_irq(), desc->period is incremented before calling
d350_get_cyclic_residue(dch), without first updating dch->residue to the new
period boundary (desc->bytes - desc->period * desc->period_len). If
d350_get_cyclic_residue() takes either early return to dch->residue (or if
d350_tx_status() runs after hardware steps to the next period but before
d350_irq() takes dch->vc.lock), it returns the stale dch->residue from an
earlier period.

3. If buf_len =3D=3D period_len (desc->periods =3D=3D 1), desc->cmds[0] lin=
ks to
itself, so CH_LINKADDR never changes when the period wraps around while
CH_XSIZE is being read. Also, if a cyclic descriptor is reused,
d350_start_next() does not reset desc->period to 0.

Could d350_get_cyclic_residue() match next_cmd against desc->cmds[i].dma to
determine the active period directly from hardware, similar to
d350_get_sg_residue()?

[ ... ]

> @@ -469,17 +1112,32 @@ static void d350_issue_pending(struct dma_chan *ch=
an)
>  static irqreturn_t d350_irq(int irq, void *data)
>  {
>  	struct d350_chan *dch =3D data;
> -	struct device *dev =3D dch->vc.chan.device->dev;
> -	struct virt_dma_desc *vd =3D &dch->desc->vd;
> +	struct virt_dma_desc *vd;
> +	struct d350_desc *desc;
> +	u32 residue =3D 0;
>  	u32 ch_status;
> +	u32 irq_status;
> +	u32 errinfo =3D 0;
> =20
>  	ch_status =3D readl(dch->base + CH_STATUS);
> -	if (!ch_status)
> +	irq_status =3D ch_status & (CH_STAT_INTR_DONE | CH_STAT_INTR_ERR);
> +	if (!irq_status)
>  		return IRQ_NONE;
> =20
> -	if (ch_status & CH_STAT_INTR_ERR) {
> -		u32 errinfo =3D readl_relaxed(dch->base + CH_ERRINFO);
> +	if (irq_status & CH_STAT_INTR_ERR)
> +		errinfo =3D readl_relaxed(dch->base + CH_ERRINFO);
> +
> +	writel_relaxed(ch_status, dch->base + CH_STATUS);
> +
> +	spin_lock(&dch->vc.lock);
> +	desc =3D dch->desc;
> +	if (!desc) {
> +		spin_unlock(&dch->vc.lock);
> +		return IRQ_HANDLED;
> +	}

[Severity: Medium]
Can an interrupt from a terminated transfer be misattributed to a newly
started descriptor in d350_irq()?

In d350_irq(), CH_STATUS and CH_ERRINFO are read and cleared before acquiri=
ng
dch->vc.lock. Meanwhile, d350_terminate_all() stops the channel and sets
dch->desc =3D NULL under dch->vc.lock without clearing CH_STATUS, and
d350_start_next() also does not clear stale status bits in CH_STATUS before
enabling the next descriptor.

If d350_terminate_all() and a subsequent d350_issue_pending() ->
d350_start_next() run on another CPU after d350_irq() reads CH_STATUS but
before d350_irq() acquires dch->vc.lock (or if CH_STAT_INTR_DONE /
CH_STAT_INTR_ERR was latched just before d350_terminate_all() +
d350_issue_pending() ran with local IRQs disabled), d350_irq() will see the
newly started dch->desc under dch->vc.lock and complete or advance the wrong
descriptor.

Should CH_STATUS be read and cleared under dch->vc.lock, and also cleared in
d350_terminate_all() / d350_start_next()?

[ ... ]

> @@ -568,23 +1243,32 @@ static int d350_probe(struct platform_device *pdev)
>  	dev_dbg(dev, "DMA-350 r%dp%d with %d channels, %d requests\n", r, p, dm=
ac->nchan, dmac->nreq);
> =20
>  	dmac->dma.dev =3D dev;
> +	dmac->dma.src_addr_widths =3D BIT(DMA_SLAVE_BUSWIDTH_UNDEFINED);
> +	dmac->dma.dst_addr_widths =3D BIT(DMA_SLAVE_BUSWIDTH_UNDEFINED);
>  	for (int i =3D min(dw, 16); i > 0; i /=3D 2) {
>  		dmac->dma.src_addr_widths |=3D BIT(i);
>  		dmac->dma.dst_addr_widths |=3D BIT(i);
>  	}
> -	dmac->dma.directions =3D BIT(DMA_MEM_TO_MEM);
> +	dmac->dma.directions =3D BIT(DMA_MEM_TO_MEM) |
> +			BIT(DMA_MEM_TO_DEV) |
> +			BIT(DMA_DEV_TO_MEM);
>  	dmac->dma.descriptor_reuse =3D true;
>  	dmac->dma.residue_granularity =3D DMA_RESIDUE_GRANULARITY_BURST;
>  	dmac->dma.device_alloc_chan_resources =3D d350_alloc_chan_resources;
>  	dmac->dma.device_free_chan_resources =3D d350_free_chan_resources;
>  	dma_cap_set(DMA_MEMCPY, dmac->dma.cap_mask);
> +	dma_cap_set(DMA_SLAVE, dmac->dma.cap_mask);
> +	dma_cap_set(DMA_CYCLIC, dmac->dma.cap_mask);

[Severity: High]
Does setting BIT(DMA_SLAVE_BUSWIDTH_UNDEFINED) in src_addr_widths and
dst_addr_widths break dma_get_slave_caps() callers, and should slave/cyclic
transfers also check per-channel dch->has_trig and dch->tsz capabilities?

There are a few related capability issues here:

1. DMA_SLAVE_BUSWIDTH_UNDEFINED is 0, so setting
BIT(DMA_SLAVE_BUSWIDTH_UNDEFINED) sets bit 0 in dmac->dma.src_addr_widths a=
nd
dmac->dma.dst_addr_widths. Because dma_get_slave_caps() exports these bitma=
sks
directly to clients, callers that compute minimum address alignment via
__ffs(caps.src_addr_widths) (such as iio_dmaengine_buffer_alloc()) will get
align =3D 0 instead of 1 and fail transfers with -EINVAL. Could
d350_buswidth_supported() handle DMA_SLAVE_BUSWIDTH_UNDEFINED explicitly
instead of advertising BIT(0) in dma.src_addr_widths and dma.dst_addr_width=
s?

2. Unlike d350_of_xlate(), neither d350_config(), d350_prep_slave_sg(), nor
d350_prep_dma_cyclic() checks dch->has_trig (and d350_probe() advertises
DMA_SLAVE and DMA_CYCLIC unconditionally even if no channels support trigge=
rs
or dmac->nreq =3D=3D 0). If a channel without trigger support is obtained v=
ia a
non-OF path, d350_fill_slave_cmd() will program CH_SRCTRIGINCFG /
CH_DESTRIGINCFG on hardware that lacks trigger support.

3. Each channel reads its own data width into dch->tsz from CH_BUILDCFG0
(which d350_prep_memcpy() and d350_prep_memset() respect), whereas
d350_check_slave_config() only checks the controller-wide widths from
DMA_BUILDCFG0. If a channel has a narrower data width than the controller
maximum, d350_fill_slave_cmd() can program desc->tsz =3D __ffs(width) excee=
ding
dch->tsz.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023093017.3248=
454-1-Jelly.Jia@cixtech.com?part=3D2
