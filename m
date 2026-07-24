Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FA441DE1F;
	Fri, 24 Jul 2026 11:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784891144; cv=none; b=Fw17471Npf4BWqOudQuiOnJApAYfvuR5+miUVpcXmWCZvhzcNt2pWMlH4KYh/K4HbSoPIUHubwYtbjhDvU5bfrMoXY0af/jxIDSaiYO5cTPkCrXJBp/bS15iC3zsAsFRzHC+uUiuspDTpK2UhtfBkm3gnvic7A3DFZ9mSY2nmUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784891144; c=relaxed/simple;
	bh=pVdCnNhDOGojPHYfkAdLyFB2+p3gNQJ8yQFJyTWZdBs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YtHx3xOGMP/1u7K7eGkxbEGZizQvQpvTJ08TbhYQLc0v6gQubioUHdXr3c4/tgEICT13AYtI0htLHu9CXUx8XHqGA6EAHAfOb/tj8Dxt4hZg/fxs3RTEAPRkKV+qAtmtN79Kt1H+ipOr+HFfuZ3V5cEPJTWWYaC8V9Thswd7wRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BJMT1hw3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BJMT1hw3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF4DE1F031D9;
	Fri, 24 Jul 2026 11:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784891142;
	bh=cAy2F9yBD/uIM/zmHh1rlq0iHpvl+IXMITj3uZ8hC74=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BJMT1hw3xnbsfi7yCm75WuV+X7evvIx73J0hNvZCddg2Z1O0M3loN8LD399dgYoXb
	 j3OZzRoXqvq1hRICtJMlqRnFefCYpVuSEo0DODmkiJAdzT9z2BPCf6dFDQdBJ5pqaV
	 aEjdcMfVGsUpevxxT83aaUam3qDpPK2bKm7/p0Iu+TpskwBa5kXtoXX/Yx1kY7w6rk
	 c0M16Qo1mG43U0krri20vsTpyEdOM64mvh7yfkGQsYdv1n2hg9/mFqHJ1JQWEY0zIU
	 y0+EOVWLh57wCnrdyX5qGGZNzJ73VuCkFXkROWfpNpx3dhHd3Lng/goV72jNSR54aE
	 NXNtblgK/s6Qw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 16/19] dmaengine: ti: k3-udma-v2: New driver for K3
 BCDMA_V2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Sree Kartheek Adivi" <s-adivi@ti.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260724102115.2854-17-s-adivi@ti.com>
References: <20260724102115.2854-1-s-adivi@ti.com>
 <20260724102115.2854-17-s-adivi@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 11:05:41 +0000
Message-Id: <20260724110541.AF4DE1F031D9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Out-of-bounds array access and channel allocation failure in `bcdm=
a_v2_get_bchan()`.
- [High] Unconditional PEER register access in `udma_v2_stop()` for block c=
opy channels (BCHAN).
- [High] Ignored completion ring events due to an early return in `udma_v2_=
ring_irq_handler()`.
- [High] Protocol violation by asserting EOP on every TR in a scatter-gathe=
r list in `udma_prep_slave_sg_tr()`.
- [Medium] Missing locking in `udma_v2_pause()` and `udma_v2_resume()` caus=
es a read-modify-write race on `UDMA_CHAN_RT_CTL_REG`.
- [Low] Hardcoded register offset used instead of predefined macro in `udma=
_v2_tx_status()`.
--

--- Patch [16]: [PATCH v7 16/19] dmaengine: ti: k3-udma-v2: New driver for =
K3 BCDMA_V2 ---
commit 4f5633caae3e5cd709118b7e0fd5b3865c70a1dc
Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>
Subject: dmaengine: ti: k3-udma-v2: New driver for K3 BCDMA_V2

This commit adds support for the BCDMA_V2 hardware found in SoCs like AM62L.
It introduces a new driver file tailored to the differences in V2, including
direct IRQs, static channel mapping, and a unified channel space.

> diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-com=
mon.c
> --- a/drivers/dma/ti/k3-udma-common.c
> +++ b/drivers/dma/ti/k3-udma-common.c
[ ... ]
> @@ -342,6 +348,11 @@ udma_prep_slave_sg_tr(struct udma_chan *uc, struct s=
catterlist *sgl,
>  	else
>  		asel =3D (u64)uc->config.asel << K3_ADDRESS_ASEL_SHIFT;
> =20
> +	if (uc->ud->match_data->type =3D=3D DMA_TYPE_BCDMA &&
> +	    uc->ud->match_data->version =3D=3D K3_UDMA_V2 &&
> +	    dir =3D=3D DMA_MEM_TO_DEV)
> +		extra_flags =3D CPPI5_TR_CSF_EOP;
> +
>  	tr_req =3D d->hwdesc[0].tr_req_base;
>  	for_each_sg(sgl, sgent, sglen, i) {
>  		dma_addr_t sg_addr =3D sg_dma_address(sgent);
> @@ -358,7 +369,7 @@ udma_prep_slave_sg_tr(struct udma_chan *uc, struct sc=
atterlist *sgl,
> =20
>  		cppi5_tr_init(&tr_req[tr_idx].flags, CPPI5_TR_TYPE1, false,
>  			      false, CPPI5_TR_EVENT_SIZE_COMPLETION, 0);
> -		cppi5_tr_csf_set(&tr_req[tr_idx].flags, CPPI5_TR_CSF_SUPR_EVT);
> +		cppi5_tr_csf_set(&tr_req[tr_idx].flags, CPPI5_TR_CSF_SUPR_EVT | extra_=
flags);

[Severity: High]
Does this code inadvertently assert the End Of Packet (EOP) flag on every
Transfer Request (TR) in the scatter-gather list?

In udma_prep_slave_sg_tr(), extra_flags is initialized with CPPI5_TR_CSF_EOP
for DMA_MEM_TO_DEV transfers. By bitwise-ORing it into every TR generated
within the for_each_sg loop, the packet becomes artificially fragmented on
the hardware bus.

Should the EOP bit be reserved exclusively for the final TR of the final SG
segment to avoid protocol violations where peripherals expect a continuous
payload?

[ ... ]
> diff --git a/drivers/dma/ti/k3-udma-v2.c b/drivers/dma/ti/k3-udma-v2.c
> new file mode 100644
> index 0000000000000..e7989b0b34cac
> --- /dev/null
> +++ b/drivers/dma/ti/k3-udma-v2.c
[ ... ]
> +static int udma_v2_stop(struct udma_chan *uc)
> +{
> +	uc->state =3D UDMA_CHAN_IS_TERMINATING;
> +	reinit_completion(&uc->teardown_completed);
> +
> +	if (uc->config.dir =3D=3D DMA_DEV_TO_MEM) {
> +		if (!uc->cyclic && !uc->desc)
> +			udma_push_to_ring(uc, -1);
> +	}
> +
> +	udma_chanrt_write(uc, UDMA_CHAN_RT_PEER_REG(8), UDMA_CHAN_RT_PEER_REG8_=
FLUSH);

[Severity: High]
Can this unconditional PEER register write cause a kernel panic when stoppi=
ng
block copy channels?

In udma_v2_stop(), there is an MMIO write to UDMA_CHAN_RT_PEER_REG(8). Since
block copy channels (which handle DMA_MEM_TO_MEM transfers) do not have this
PEER register region mapped, this write may trigger an asynchronous external
abort (SError).

Could this be guarded with a check like if (uc->config.ep_type !=3D
PSIL_EP_NATIVE), similar to how it was handled in the V1 driver?

> +	udma_chanrt_update_bits(uc, UDMA_CHAN_RT_CTL_REG,
> +				UDMA_CHAN_RT_CTL_EN | UDMA_CHAN_RT_CTL_TDOWN,
> +				UDMA_CHAN_RT_CTL_EN | UDMA_CHAN_RT_CTL_TDOWN);
> +
> +	return 0;
> +}
[ ... ]
> +static irqreturn_t udma_v2_ring_irq_handler(int irq, void *data)
> +{
[ ... ]
> +	if (!intr_status)
> +		return IRQ_NONE;	/* Not this channel's interrupt */
> +
> +	reg =3D udma_chanrt_read(uc, UDMA_CHAN_RT_CTL_REG);
> +
> +	if (intr_status & K3_RINGACC_RT_INT_STATUS_TR) {
> +		/* check teardown status */
> +		if ((reg & UDMA_CHAN_RT_CTL_TDOWN) && !(reg & UDMA_CHAN_RT_CTL_EN))
> +			complete_all(&uc->teardown_completed);
> +		return udma_v2_udma_irq_handler(irq, data);
> +	}
> +
> +	if (udma_pop_from_ring(uc, &paddr) || !paddr)
> +		return IRQ_NONE;

[Severity: High]
Is there a risk of missing completion ring events if both the TR interrupt
and the completion ring interrupt are asserted simultaneously?

If the hardware asserts both interrupts, intr_status will have both bits se=
t.
The handler processes the TR event and then returns early, completely
bypassing the udma_pop_from_ring() logic.

This could leave stale descriptors stuck in the completion ring indefinitel=
y,
potentially causing ring slot leaks and channel stalls. Would it be safer to
process the TR event without returning immediately, allowing the completion
ring to be serviced as well?

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
> +	uc->bchan =3D __udma_reserve_bchan(ud, tpl, uc->id);

[Severity: High]
Could passing uc->id to __udma_reserve_bchan() lead to out-of-bounds array
accesses and allocation failures?

The driver creates a single logical pool of virtual channels. If a client
requests a DMA_MEM_TO_MEM channel and receives a virtual channel index
(uc->id) that is greater than or equal to the hardware block copy channel
count (e.g., 16), __udma_reserve_bchan() will use this out-of-bounds ID to
test and set bits in ud->bchan_map.

Should this use -1 to dynamically allocate a free hardware channel, as was
done in the V1 driver?

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

[Severity: High]
Does calculating the ring IDs using uc->id instead of the hardware channel
ID (uc->bchan->id) violate the ring pool limits?

Since uc->id is the software virtual channel index, using it here may result
in requesting ring pairs outside the allocated hardware boundaries.

[ ... ]
> +static enum dma_status udma_v2_tx_status(struct dma_chan *chan,
> +					 dma_cookie_t cookie,
> +					 struct dma_tx_state *txstate)
> +{
[ ... ]
> +		if (uc->desc->dir =3D=3D DMA_MEM_TO_DEV) {
> +			bcnt =3D udma_chanrt_read(uc, UDMA_CHAN_RT_SBCNT_REG);
> +
> +			if (uc->config.ep_type !=3D PSIL_EP_NATIVE) {
> +				peer_bcnt =3D udma_chanrt_read(uc, 0x810);
> +
> +				if (bcnt > peer_bcnt)
> +					delay =3D bcnt - peer_bcnt;
> +			}
> +		} else if (uc->desc->dir =3D=3D DMA_DEV_TO_MEM) {
> +			bcnt =3D udma_chanrt_read(uc, UDMA_CHAN_RT_BCNT_REG);
> +
> +			if (uc->config.ep_type !=3D PSIL_EP_NATIVE) {
> +				peer_bcnt =3D udma_chanrt_read(uc, 0x810);

[Severity: Low]
Is there a reason this hardcodes the register offset 0x810 instead of using
the UDMA_CHAN_RT_PERIPH_BCNT_REG macro?

Using the predefined macro would improve code maintainability and keep it
consistent with other parts of the driver.

[ ... ]
> +static int udma_v2_pause(struct dma_chan *chan)
> +{
> +	struct udma_chan *uc =3D to_udma_chan(chan);
> +
> +	/* pause the channel */
> +	udma_chanrt_update_bits(uc, UDMA_CHAN_RT_CTL_REG,
> +				UDMA_CHAN_RT_CTL_PAUSE, UDMA_CHAN_RT_CTL_PAUSE);

[Severity: Medium]
Could this read-modify-write operation on the channel control register
silently corrupt state due to missing locks?

In udma_v2_pause() and udma_v2_resume(), udma_chanrt_update_bits() accesses
UDMA_CHAN_RT_CTL_REG without holding uc->vc.lock. Since the IRQ handler or
tasklet might hold the lock and concurrently invoke udma_v2_start() or
udma_v2_stop() (which also modify this register), it appears there is a
race condition.

Can a concurrent update cause the driver to drop channel enable or teardown
flags, potentially locking the channel state?

> +
> +	return 0;
> +}
> +
> +static int udma_v2_resume(struct dma_chan *chan)
> +{
> +	struct udma_chan *uc =3D to_udma_chan(chan);
> +
> +	/* resume the channel */
> +	udma_chanrt_update_bits(uc, UDMA_CHAN_RT_CTL_REG,
> +				UDMA_CHAN_RT_CTL_PAUSE, 0);

[Severity: Medium]
Could this register update face the same concurrent read-modify-write race
as mentioned above due to the absence of uc->vc.lock?

> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724102115.2854=
-1-s-adivi@ti.com?part=3D16
