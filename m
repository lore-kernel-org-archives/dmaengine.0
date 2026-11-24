Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795522645;
	b=mqHvmEC/N6bkfLtSWTbdLMRsbUI4yDD0sUdGlmrX6b8548mdTDQXMvtsMsK0xanVFS6w
	 g1lv14LB7FeuguutXHN/7G80ufIMwdPfUr5s+X7Md567D0QTECt4YAp6XijvKz4pV8TGs
	 COE2lDC9UoJWYqBCLk/U+90qaXxO+OyUr14NrJJx8aPPKIMKImvfQdlVVDW7uJBHN48qL
	 5YbS4RDXCXdH6L/Ne5PI9fZPy6LkLlx3oriwriBf51gclDncrtSQJufkO5Gh//JxFZ5Se
	 bwRd38Gop2tGXMp0f/7Q8U00neE/0dVCaamOtIuAke4oRElSPlkUEXSFbFVHA6weq1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795522645;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=iQDtwKLSY6XGNsCnBAWAOm/FMWrmNW/P5tcn2XTRPbQ=;
	b=H3uN5xVfDm8zQnzhPJsXBs4yBcOnLgyCJMsI8Jkv8mo0LPeyL2u0DcPigS9WR9Lshq0g
	 h3HNH/w9fnnaRkaowfPaubYz+TlkjCK+T9hpDhv/7zEgaSUkj6SdAdhtPqjxxSdlqsK7b
	 UySpe/Er8Sn90A8ut/jg1i9087DMCNdTlCRsqNfhkL+E3b8falroOX1+EV6h6jZEcBVlO
	 m+7mMiyk14WyblWfTgdggIC+x+Q+zdva6fpgzLYrVltM4/FFNalQi5bMO2QBxHKz4TzSH
	 dUR3lfBybtLgCzsgES0ngtSR75Rd+V5I8GNqZUiwiwkiy4BF6jsZ4RoF3P4V/WsGwIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ksr4//NC";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50AE606A321;
	Tue, 24 Nov 2026 12:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ksr4//NC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8EAD1F000F0;
	Tue, 24 Nov 2026 12:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795522645;
	bh=iQDtwKLSY6XGNsCnBAWAOm/FMWrmNW/P5tcn2XTRPbQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ksr4//NC4iSszOgInHzgVV1sh1wbHiecOHHqGbBzFGwmb0oxatX+T6h5eYFr/dmAV
	 DvsxSXIMu9FeI6yrzrvtjUFhkqHeRSLRPtCUZ76GBLVL/TfEeiciiSTizRr3UEEPCx
	 Tk7PS+bFavA2l9Lir3RTJBegUqvl6yCvjvcm5UWRSPdMtT0p33CNYnoSmhLZ0GqUt1
	 9W0b+pjB73dr+FjsskIXF2SqnPmlbtHooRrX5KfHi80uVsppwY8zw1czmNkQPKW+ok
	 8kFiYewjzA5A6E66GzHeHMJUZEHSCRGvS0APCuhJhunN9uNmy3xGcvihxKdX2r/Nfs
	 +GnszqcUMrRmg==
Message-ID: <sashiko-outbox-231120@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 17/20] dmaengine: ti: k3-udma-v2: New driver for K3
 BCDMA_V2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Sree Kartheek Adivi" <s-adivi@ti.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261124-dma-upstream-v13-v13-17-bd4251fdc6d4@ti.com>
References: <20261124-dma-upstream-v13-v13-0-bd4251fdc6d4@ti.com>
 <20261124-dma-upstream-v13-v13-17-bd4251fdc6d4@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 12:17:24 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 11 potential
issues to consider:
- [High] dmaengine: ti: k3-udma-v2: out-of-bounds bchan access in
  bcdma_v2_get_bchan()
- [High] dmaengine: ti: k3-udma-v2: silent descriptor drop on autopair
  timeout in udma_v2_start()
- [Medium] dmaengine: ti: k3-udma-v2: udma_v2_ring_irq_handler() returns
  IRQ_NONE on flush
- [Medium] dmaengine: ti: k3-udma: missing BCDMA V2 EOP flag in
  udma_prep_dma_cyclic_tr()
- [Medium] dmaengine: ti: k3-udma-v2: leak of RX flush DMA mappings on
  probe failure
- [Medium] dmaengine: ti: k3-udma-v2: stale channel state in
  bcdma_v2_alloc_chan_resources() and udma_get_tchan()
- [Medium] dmaengine: ti: k3-udma-v2: descriptor leak in
  udma_v2_remove() when cancelling purge_work
- [Medium] dmaengine: ti: k3-udma-v2: DMA mapping leak on
  udma_v2_probe() error paths
- [Low] dmaengine: ti: k3-udma-v2: missing select SOC_TI in config
  TI_K3_UDMA_V2
- [Low] dmaengine: ti: k3-udma: udma_get_tchan() leaves uc->chan set on
  tflow error
- [Low] dmaengine: ti: k3-udma-v2: dead check in udma_v2_dma_filter_fn()
  and unused trigger_param
--

commit 613c4655807ce30177b428151a0dff0e431dafb4
Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>

dmaengine: ti: k3-udma-v2: New driver for K3 BCDMA_V2

This commit adds the k3-udma-v2 driver to support the TI K3 BCDMA_V2
controller used on AM62L and updates k3-udma-common to handle V1 and V2
differences.

> diff --git a/drivers/dma/ti/Kconfig b/drivers/dma/ti/Kconfig
> index a389ae04ec930..e6a2cf37062e7 100644
> --- a/drivers/dma/ti/Kconfig
> +++ b/drivers/dma/ti/Kconfig
> @@ -49,6 +49,19 @@ config TI_K3_UDMA
>  	  Enable support for the TI UDMA (Unified DMA) controller. This
>  	  DMA engine is used in AM65x and j721e.
> =20
> +config TI_K3_UDMA_V2
> +	tristate "Texas Instruments K3 UDMA v2 support"
> +	depends on ARCH_K3 || COMPILE_TEST
> +	depends on TI_SCI_INTA_IRQCHIP
> +	select DMA_ENGINE
> +	select DMA_VIRTUAL_CHANNELS
> +	select TI_K3_UDMA_COMMON
> +	select TI_K3_RINGACC
> +	select TI_K3_PSIL

[Severity: Low]
Should TI_K3_UDMA_V2 also select SOC_TI (like TI_K3_UDMA does)?
TI_K3_RINGACC is inside an "if SOC_TI" block in drivers/soc/ti/Kconfig, so
enabling TI_K3_UDMA_V2 under COMPILE_TEST with SOC_TI=3Dn triggers a Kconfig
unmet direct dependencies warning.

[ ... ]

> diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-com=
mon.c
> index ff5c9aedaecf3..42d918c6ba168 100644
> --- a/drivers/dma/ti/k3-udma-common.c
> +++ b/drivers/dma/ti/k3-udma-common.c

[ ... ]

> @@ -349,6 +355,16 @@ udma_prep_slave_sg_tr(struct udma_chan *uc, struct s=
catterlist *sgl,
>  	else
>  		asel =3D (u64)uc->config.asel << K3_ADDRESS_ASEL_SHIFT;
> =20
> +	/*
> +	 * BCDMA V2 stalls and stops processing further TRs if a TR's ICNT0
> +	 * is not a multiple of 16 bytes. Setting EOP on every TR (not just
> +	 * the last one) avoids that stall condition. Intentional, not a bug.
> +	 */
> +	if (uc->ud->match_data->type =3D=3D DMA_TYPE_BCDMA &&
> +	    uc->ud->match_data->version =3D=3D K3_UDMA_V2 &&
> +	    dir =3D=3D DMA_MEM_TO_DEV)
> +		extra_flags =3D CPPI5_TR_CSF_EOP;

[ ... ]

> @@ -958,7 +974,8 @@ udma_prep_dma_cyclic_tr(struct udma_chan *uc, dma_add=
r_t buf_addr,
>  	 * As we are in cyclic mode, we do not know which period might be the
>  	 * last one, so set the flag for each period.
>  	 */
> -	if (uc->config.ep_type =3D=3D PSIL_EP_PDMA_XY &&
> +	if ((uc->config.ep_type =3D=3D PSIL_EP_PDMA_XY ||
> +	    uc->config.ep_type =3D=3D PSIL_EP_PDMA_XYMF) &&
>  	    uc->ud->match_data->type =3D=3D DMA_TYPE_BCDMA) {
>  		period_csf =3D CPPI5_TR_CSF_EOP;
>  	}

[Severity: Medium]
Does udma_prep_dma_cyclic_tr() also need CPPI5_TR_CSF_EOP on the first TR
of a split period for BCDMA V2 DMA_MEM_TO_DEV transfers?

When period_len >=3D SZ_64K, udma_get_tr_counters() splits the period into
num_tr =3D=3D 2 TRs with tr0_cnt0 =3D SZ_64K - BIT(align_to) (at most 8-byte
aligned, so never a multiple of 16 bytes).  In the num_tr =3D=3D 2 branch of
udma_prep_dma_cyclic_tr(), the first TR only gets CPPI5_TR_CSF_SUPR_EVT
while period_csf is only applied to the second TR, hitting the BCDMA V2
stall condition described in udma_prep_slave_sg_tr().

[ ... ]

> @@ -2058,6 +2099,8 @@ int udma_get_tchan(struct udma_chan *uc)
>  		uc->tchan =3D NULL;
>  		return ret;
>  	}
> +	if (ud->match_data->version =3D=3D K3_UDMA_V2)
> +		uc->chan =3D uc->tchan;
> =20
>  	if (ud->tflow_cnt) {
>  		int tflow_id;

[Severity: Low]
If the tflow_map check right below fails, udma_get_tchan() clears
uc->tchan =3D NULL and returns -ENOENT, leaving uc->chan dangling (and
udma_put_tchan() will not clear uc->chan once uc->tchan is NULL):

drivers/dma/ti/k3-udma-common.c:udma_get_tchan() {
	...
		if (test_bit(tflow_id, ud->tflow_map)) {
			dev_err(ud->dev, "tflow%d is in use\n", tflow_id);
			clear_bit(uc->tchan->id, ud->tchan_map);
			uc->tchan =3D NULL;
			return -ENOENT;
		}
}

Should uc->chan be cleared on that error path, or set after the tflow_map
check succeeds?

[ ... ]

> diff --git a/drivers/dma/ti/k3-udma-v2.c b/drivers/dma/ti/k3-udma-v2.c
> new file mode 100644
> index 0000000000000..b401d4ba17ded
> --- /dev/null
> +++ b/drivers/dma/ti/k3-udma-v2.c

[ ... ]

> +		/* Poll for autopair completion */
> +		read_poll_timeout_atomic(udma_v2_check_chan_autopair_completion,
> +					 status, status !=3D 0, 100, 500, false, uc);
> +
> +		if (status <=3D 0) {
> +			udma_chanrt_write(uc, UDMA_CHAN_RT_CTL_REG, 0);
> +			/*
> +			 * udma_start_desc() above already pushed uc->desc to
> +			 * the hardware ring. Since the channel never actually
> +			 * started, no completion interrupt will ever arrive
> +			 * to free it - drain the ring and free it here to
> +			 * avoid leaking it.
> +			 */
> +			udma_reset_rings(uc);
> +			udma_desc_free(&uc->desc->vd);
> +			uc->desc =3D NULL;
> +			return -ETIMEDOUT;
> +		}
> +
> +		break;
> +	case DMA_MEM_TO_DEV:
> +		/* Config remote TR */
> +		if (uc->config.ep_type =3D=3D PSIL_EP_PDMA_XY ||
> +		    uc->config.ep_type =3D=3D PSIL_EP_PDMA_XYMF) {
> +			u32 val =3D PDMA_STATIC_TR_Y(uc->desc->static_tr.elcnt) |
> +				  PDMA_STATIC_TR_X(uc->desc->static_tr.elsize);
> +
> +			if (uc->config.enable_acc32)
> +				val |=3D PDMA_STATIC_TR_XY_ACC32;
> +			if (uc->config.enable_burst)
> +				val |=3D PDMA_STATIC_TR_XY_BURST;
> +
> +			udma_chanrt_write(uc,
> +					  UDMA_CHAN_RT_STATIC_TR_XY_REG,
> +					  val);
> +
> +			/* save the current staticTR configuration */
> +			memcpy(&uc->static_tr, &uc->desc->static_tr,
> +			       sizeof(uc->static_tr));
> +		}
> +
> +		if (uc->config.ep_type =3D=3D PSIL_EP_PDMA_XYMF)
> +			udma_chanrt_write(uc, UDMA_CHAN_RT_FIFO_SEL_REG, uc->config.fifo_id);
> +
> +		udma_chanrt_write(uc, UDMA_CHAN_RT_CTL_REG,
> +				  UDMA_CHAN_RT_CTL_EN | UDMA_CHAN_RT_CTL_AUTOPAIR);
> +
> +		/* Poll for autopair completion */
> +		read_poll_timeout_atomic(udma_v2_check_chan_autopair_completion,
> +					 status, status !=3D 0, 100, 500, false, uc);
> +
> +		if (status <=3D 0) {
> +			udma_chanrt_write(uc, UDMA_CHAN_RT_CTL_REG, 0);
> +			/*
> +			 * udma_start_desc() above already pushed uc->desc to
> +			 * the hardware ring. Since the channel never actually
> +			 * started, no completion interrupt will ever arrive
> +			 * to free it - drain the ring and free it here to
> +			 * avoid leaking it.
> +			 */
> +			udma_reset_rings(uc);
> +			udma_desc_free(&uc->desc->vd);
> +			uc->desc =3D NULL;
> +			return -ETIMEDOUT;
> +		}

[Severity: High]
When autopairing times out in either DMA_DEV_TO_MEM or DMA_MEM_TO_DEV,
won't freeing uc->desc directly with udma_desc_free() leave the DMA client
hanging forever?

uc->desc has already been unlinked from vc->desc_issued, and callers such
as udma_issue_pending() and udma_v2_ring_irq_handler() ignore the return
value of ud->start(uc).  Freeing the descriptor directly without completing
its cookie or invoking the virt-dma completion callback gives the client no
notification that the transfer finished or failed, and any remaining
descriptors queued on vc->desc_issued are never started.  It also bypasses
vchan_vdesc_fini(), freeing DMA_CTRL_REUSE descriptors instead of returning
them to vc->desc_allocated.

Could udma_start_desc() be called after autopairing succeeds (or could the
descriptor be put back on vc->desc_issued / completed with an error)?

[ ... ]

> +static irqreturn_t udma_v2_ring_irq_handler(int irq, void *data)
> +{
> +	struct udma_chan *uc =3D data;
> +	struct udma_dev *ud =3D uc->ud;
> +	struct udma_desc *d;
> +	dma_addr_t paddr =3D 0;
> +	u32 intr_status, reg;
> +
> +	switch (uc->config.dir) {
> +	case DMA_DEV_TO_MEM:
> +		intr_status =3D  k3_ringacc_ring_get_irq_status(uc->rflow->r_ring);
> +		break;
> +	case DMA_MEM_TO_DEV:
> +	case DMA_MEM_TO_MEM:
> +		intr_status =3D  k3_ringacc_ring_get_irq_status(uc->tchan->tc_ring);
> +		break;
> +	default:
> +		return IRQ_NONE;
> +	}
> +
> +	if (!intr_status)
> +		return IRQ_NONE;	/* Not this channel's interrupt */
> +
> +	if (intr_status & K3_RINGACC_RT_INT_STATUS_TR) {
> +		reg =3D udma_chanrt_read(uc, UDMA_CHAN_RT_CTL_REG);
> +
> +		/* check teardown status */
> +		if ((reg & UDMA_CHAN_RT_CTL_TDOWN) && !(reg & UDMA_CHAN_RT_CTL_EN))
> +			complete_all(&uc->teardown_completed);
> +		udma_v2_udma_irq_handler(irq, data);
> +
> +		/*
> +		 * Do not also process K3_RINGACC_RT_INT_STATUS_COMPLETE here
> +		 * even if it is set: udma_v2_udma_irq_handler() may already
> +		 * have completed uc->desc above, and falling through to the
> +		 * ring-pop completion path below would complete the same
> +		 * descriptor a second time. The COMPLETE bit is left pending
> +		 * and the (level-triggered) IRQ line re-fires on its own, so
> +		 * it gets handled on the next, separate invocation instead.
> +		 */
> +		return IRQ_HANDLED;
> +	}
> +
> +	if (udma_pop_from_ring(uc, &paddr) || !paddr)
> +		return IRQ_NONE;

[Severity: Medium]
Should this return IRQ_HANDLED (as udma_ring_irq_handler() in k3-udma.c
does) instead of IRQ_NONE?

intr_status was already confirmed non-zero for this ring above.  When a
non-cyclic RX channel is torn down while !uc->desc, udma_v2_stop() pushes
the RX flush descriptor; when that flush descriptor completes,
udma_pop_from_ring() pops and acknowledges it in the ring doorbell and
returns -ENOENT because udma_desc_is_rx_flush() is true.  Returning
IRQ_NONE here reports a serviced interrupt as spurious to the generic IRQ
layer.

[ ... ]

> +static int bcdma_v2_get_bchan(struct udma_chan *uc)
> +{
> +	struct udma_dev *ud =3D uc->ud;
> +	enum udma_tp_level tpl;
> +	int ret;
> +
> +	if (uc->bchan) {
> +		dev_dbg(ud->dev, "chan%d: already have bchan%d allocated\n",
> +			uc->id, uc->bchan->id);
> +		return 0;
> +	}
> +
> +	/*
> +	 * Use normal channels for peripherals, and highest TPL channel for
> +	 * mem2mem
> +	 */
> +	if (uc->config.tr_trigger_type)
> +		tpl =3D 0;
> +	else
> +		tpl =3D ud->bchan_tpl.levels - 1;
> +
> +	/*
> +	 * UDMA V2 uses a static 1:1 mapping between the virtual channel index
> +	 * (uc->id) and the hardware bchan/tchan/rchan index -- unlike V1, which
> +	 * dynamically allocates from a shared pool. Passing uc->id directly to
> +	 * __udma_reserve_*() is intentional, not a bug.
> +	 */
> +	uc->bchan =3D __udma_reserve_bchan(ud, tpl, uc->id);
> +	if (IS_ERR(uc->bchan)) {
> +		ret =3D PTR_ERR(uc->bchan);
> +		uc->bchan =3D NULL;
> +		return ret;
> +	}
> +	uc->chan =3D uc->bchan;
> +	uc->tchan =3D uc->bchan;
> +
> +	return 0;
> +}
> +
> +static int bcdma_v2_alloc_bchan_resources(struct udma_chan *uc)
> +{
> +	struct k3_ring_cfg ring_cfg;
> +	struct udma_dev *ud =3D uc->ud;
> +	int ret;
> +
> +	ret =3D bcdma_v2_get_bchan(uc);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D k3_ringacc_request_rings_pair(ud->ringacc, ud->match_data->chan=
_cnt + uc->id, -1,
> +					    &uc->bchan->t_ring,
> +					    &uc->bchan->tc_ring);

[Severity: High]
Can passing uc->id to __udma_reserve_bchan() and
k3_ringacc_request_rings_pair() access ud->bchan_map, ud->bchans, and
ud->ringacc->rings out of bounds?

udma_v2_probe() registers ch_count =3D ud->bchan_cnt + ud->tchan_cnt =3D 144
virtual channels (uc->id in 0..143), while ud->bchans and ud->bchan_map
only have ud->bchan_cnt (16) entries and ud->ringacc has 144 ring pairs
(128..143 for bchans 0..15).  When slave channels are requested first,
__dma_request_channel() assigns them virtual channels starting from
uc->id =3D 0 (while their hardware split channels are reserved via
uc->config.mapped_channel_id).  If a DMA_MEM_TO_MEM channel is then
requested after 16 virtual channels are already in use (or when
dmaengine_get() walks all 144 channels), uc->id is >=3D 16:

1. __udma_reserve_bchan(ud, tpl, uc->id) indexes past the 16-bit
   ud->bchan_map and 16-element ud->bchans array.
2. k3_ringacc_request_rings_pair() is called with
   fwd_id =3D ud->match_data->chan_cnt + uc->id >=3D 144, indexing past
   ringacc->rings_inuse and ringacc->rings[] and writing the ring pointers
   into the out-of-bounds uc->bchan.
3. Even when uc->id < 16, any slave peripheral that claimed virtual channel
   0..15 blocks that bchan ID from being used.

Note that a later patch in this series, commit "dmaengine: ti: k3-udma:
Validate resource ID and fix logging in reservation", adds an
id >=3D ud->res_cnt check in __udma_reserve_bchan(), which turns the
out-of-bounds access into -EINVAL, but bchan allocation will still fail
whenever uc->id >=3D 16.  Should bcdma_v2_get_bchan() pass -1 to
__udma_reserve_bchan() and use uc->bchan->id for the ring and IRQ index
(at line 683: irq_ring_idx =3D ud->match_data->chan_cnt + uc->bchan->id), as
V1 bcdma_get_bchan() does?

[ ... ]

> +static int bcdma_v2_alloc_chan_resources(struct dma_chan *chan)
> +{

[ ... ]

> +	switch (uc->config.dir) {
> +	case DMA_MEM_TO_MEM:
> +		/* Non synchronized - mem to mem type of transfer */
> +		dev_dbg(uc->ud->dev, "%s: chan%d as MEM-to-MEM\n", __func__,
> +			uc->id);
> +
> +		ret =3D bcdma_v2_alloc_bchan_resources(uc);
> +		if (ret)
> +			return ret;
> +
> +		irq_ring_idx =3D ud->match_data->chan_cnt + uc->id;
> +		break;
> +	case DMA_MEM_TO_DEV:
> +		/* Slave transfer synchronized - mem to dev (TX) transfer */
> +		dev_dbg(uc->ud->dev, "%s: chan%d as MEM-to-DEV\n", __func__,
> +			uc->id);
> +
> +		ret =3D udma_v2_alloc_tx_resources(uc);
> +		if (ret) {
> +			uc->config.remote_thread_id =3D -1;
> +			return ret;
> +		}
> +
> +		uc->config.src_thread =3D ud->psil_base + uc->tchan->id;
> +		uc->config.dst_thread =3D uc->config.remote_thread_id;
> +		uc->config.dst_thread |=3D K3_PSIL_DST_THREAD_ID_OFFSET;
> +
> +		irq_ring_idx =3D uc->tchan->id;
> +
> +		break;
> +	case DMA_DEV_TO_MEM:
> +		/* Slave transfer synchronized - dev to mem (RX) transfer */
> +		dev_dbg(uc->ud->dev, "%s: chan%d as DEV-to-MEM\n", __func__,
> +			uc->id);
> +
> +		ret =3D udma_v2_alloc_rx_resources(uc);
> +		if (ret) {
> +			uc->config.remote_thread_id =3D -1;
> +			return ret;
> +		}
> +
> +		uc->config.src_thread =3D uc->config.remote_thread_id;
> +		uc->config.dst_thread =3D (ud->psil_base + uc->rchan->id) |
> +					K3_PSIL_DST_THREAD_ID_OFFSET;
> +
> +		irq_ring_idx =3D uc->rchan->id;
> +
> +		break;
> +	default:
> +		/* Can not happen */
> +		dev_err(uc->ud->dev, "%s: chan%d invalid direction (%u)\n",
> +			__func__, uc->id, uc->config.dir);
> +		return -EINVAL;
> +	}
> +
> +	/* check if the channel configuration was successful */
> +	if (ret)
> +		goto err_res_free;

[Severity: Medium]
When bcdma_v2_alloc_bchan_resources(), udma_v2_alloc_tx_resources(), or
udma_v2_alloc_rx_resources() fails, returning directly skips err_res_free
and leaves uc->config modified by udma_v2_dma_filter_fn() (and makes the
"if (ret) goto err_res_free;" after the switch unreachable).

If a subsequent unfiltered request (such as DMA_MEMCPY via
dma_request_chan_by_mask()) picks that virtual channel, it will see stale
slave or triggered fields (such as uc->config.dir or tr_trigger_type)
instead of a clean DMA_MEM_TO_MEM configuration.  Should those failure
paths jump to err_res_free so udma_reset_uchan(uc) resets uc->config?

[ ... ]

> +	if (ucc->tr_trigger_type) {
> +		ucc->dir =3D DMA_MEM_TO_MEM;
> +		goto triggered_bchan;
> +	} else {
> +		u32 thread_id;
> +		bool dev_to_mem;
> +
> +		ep_config =3D psil_get_ep_config_by_id(filter_param->channel_id,
> +						      (ud->match_data->type =3D=3D DMA_TYPE_PKTDMA),
> +						      &thread_id, &dev_to_mem);
> +		if (IS_ERR(ep_config)) {
> +			dev_err(ud->dev, "No config for channel %u\n",
> +				filter_param->channel_id);
> +			ucc->atype =3D 0;
> +			ucc->asel =3D 0;
> +			return false;
> +		}
> +		ucc->remote_thread_id =3D thread_id;
> +		ucc->dir =3D dev_to_mem ? DMA_DEV_TO_MEM : DMA_MEM_TO_DEV;
> +	}
> +	if (IS_ERR(ep_config)) {
> +		dev_err(ud->dev, "No configuration for psi-l thread 0x%04x\n",
> +			ucc->remote_thread_id);
> +		ucc->dir =3D DMA_MEM_TO_MEM;
> +		ucc->remote_thread_id =3D -1;
> +		ucc->atype =3D 0;
> +		ucc->asel =3D 0;
> +		return false;
> +	}

[Severity: Low]
This second "if (IS_ERR(ep_config))" block is unreachable because the if
branch jumps to triggered_bchan and the else branch already returns false
when IS_ERR(ep_config).  Also, filter_param.trigger_param is populated in
udma_v2_of_xlate() below, but never read anywhere.

[ ... ]

> +	ret =3D udma_setup_rx_flush(ud);
> +	if (ret)
> +		return ret;
> +
> +	for (i =3D 0; i < ud->bchan_cnt; i++) {
> +		struct udma_bchan *bchan =3D &ud->bchans[i];
> +
> +		bchan->id =3D i;
> +		bchan->reg_rt =3D ud->mmrs[V2_MMR_BCHANRT] + i * 0x1000;
> +	}
> +
> +	for (i =3D 0; i < ud->tchan_cnt; i++) {
> +		struct udma_tchan *tchan =3D &ud->tchans[i];
> +
> +		tchan->id =3D i;
> +		tchan->reg_rt =3D ud->mmrs[V2_MMR_CHANRT] + i * 0x1000;
> +	}
> +
> +	for (i =3D 0; i < ud->rchan_cnt; i++) {
> +		struct udma_rchan *rchan =3D &ud->rchans[i];
> +
> +		rchan->id =3D i;
> +		rchan->reg_rt =3D ud->mmrs[V2_MMR_CHANRT] + i * 0x1000;
> +	}
> +
> +	for (i =3D 0; i < ud->rflow_cnt; i++) {
> +		struct udma_rflow *rflow =3D &ud->rflows[i];
> +
> +		rflow->id =3D i;
> +		/*
> +		 * BCDMA_V2 has no dedicated rflow register space, so
> +		 * ud->rflow_rt is never mapped for it; only compute reg_rt
> +		 * when a base address actually exists (PKTDMA_V2).
> +		 */
> +		rflow->reg_rt =3D ud->rflow_rt ? ud->rflow_rt + i * 0x2000 : NULL;
> +	}
> +
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
> +		if (!uc->name)
> +			return -ENOMEM;
> +
> +		vchan_init(&uc->vc, &ud->ddev);
> +		/* Use custom vchan completion handling */
> +		tasklet_setup(&uc->vc.task, udma_vchan_complete);
> +		init_completion(&uc->teardown_completed);
> +		INIT_DELAYED_WORK(&uc->tx_drain.work, udma_check_tx_completion);
> +	}
> +
> +	/* Configure the copy_align to the maximum burst size the device suppor=
ts */
> +	ud->ddev.copy_align =3D udma_get_copy_align(ud);
> +
> +	ret =3D dma_async_device_register(&ud->ddev);
> +	if (ret) {
> +		dev_err(dev, "failed to register slave DMA engine: %d\n", ret);
> +		return ret;
> +	}
> +
> +	platform_set_drvdata(pdev, ud);
> +
> +	ret =3D of_dma_controller_register(dev->of_node, udma_v2_of_xlate, ud);
> +	if (ret) {
> +		dev_err(dev, "failed to register of_dma controller\n");
> +		dma_async_device_unregister(&ud->ddev);
> +	}
> +
> +	return ret;
> +}

[Severity: Medium]
Do the error returns after udma_setup_rx_flush() leak the RX flush
dma_map_single() mappings?

udma_setup_rx_flush() creates three non-devm streaming DMA mappings on
devm_kzalloc() buffers (and also does not unmap earlier mappings if a later
allocation or mapping inside udma_setup_rx_flush() fails).  If
devm_kasprintf(), dma_async_device_register(), or
of_dma_controller_register() fails in udma_v2_probe(), devres frees the
buffers while the DMA mappings remain active because
udma_teardown_rx_flush(ud) is only called in udma_v2_remove().

[ ... ]

> +static void udma_v2_remove(struct platform_device *pdev)
> +{
> +	struct udma_dev *ud =3D platform_get_drvdata(pdev);
> +
> +	of_dma_controller_free(pdev->dev.of_node);
> +	dma_async_device_unregister(&ud->ddev);
> +	cancel_work_sync(&ud->purge_work);
> +	udma_teardown_rx_flush(ud);
> +}

[Severity: Medium]
Can cancel_work_sync(&ud->purge_work) leak descriptors still queued on
ud->desc_to_purge?

For channels with !uc->use_dma_pool (all slave and triggered channels),
udma_desc_free() queues freed descriptors onto ud->desc_to_purge and
schedules ud->purge_work to free their dma_alloc_coherent() TR buffers.
If ud->purge_work is pending when udma_v2_remove() runs,
cancel_work_sync() cancels the work without running udma_purge_desc_work().
Should this call flush_work(&ud->purge_work) (or drain ud->desc_to_purge)
instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-dma-upstre=
am-v13-v13-0-bd4251fdc6d4@ti.com?part=3D17
