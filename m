Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8210364953;
	Mon, 10 Aug 2026 16:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786378194; cv=none; b=dsz3T0+IE//XwYleBNakMtjSe/Rf8Sl2tLncAkOelBSVU++e8e3tg7l5xgXvV2iamSdySSdVYYI8H57eQEk0VzvklYjp23qvgEU7GeQ82QBpKLKimscwawoAma7ncfTnbv+eFdw8SfsR8zj/lX5vcgHjChO81WdY8VA1EVkIUBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786378194; c=relaxed/simple;
	bh=0jN6MsgP9m9sFk0wnTQZUzMMkrRMA69mjgE3W7g1gn8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AkRoA0W8XCDuwrWVIcoS2lOoTo+Q/CWwtkkRDVTiQoo/DFHugX31oQa1icI2tPSuucsouIC4YLaDbZXEXXIIxJ21Wz/0iEjDJ4tw8GgB+adDHb9m8znlbbQZQCMGAvC1RsMXKTcqKsbRv9V69u+Hky8GIpYCRD/ft4e+qpYOAa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J1eZc8vl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J1eZc8vl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 377F61F00A3A;
	Mon, 10 Aug 2026 16:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786378192;
	bh=ObdY6Wb8Suj21i9byp+s/sxgwO35yvPsy/lxocRD8+U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J1eZc8vlerk3pdcaKD814rAAfhTW4h0EcafNOYdMjatFRQboW7N1rITc9tyKSBBSm
	 JXS2m7sd8T41rSwYDKiQHH61lMVjtHLC7YiRLVnmtxtCvOfj9KNjqZkZDHyE7CYA+Q
	 jxcxxcsjNP83O7tmjR6rvD9LBu7y7FIwHvwO7acqZIML+MOOYi+L3+p+9k0fBjDJrr
	 rpMg396PVxiM+aq46trjMF7nX2yxDy9OKLSKNz1GKWjir18sQBqMt9ejQFIYuxlQFd
	 ARSJqxb5cbloEl4SdqaKbWwN/0B4JwaYfwks2AIBIx6BtJ7w+7oBvprYZLwq2Y58Eq
	 8tGxRyC4iK/EA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 08/19] dmaengine: ti: k3-udma: move udma utility
 functions to k3-udma-common.c
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Sree Kartheek Adivi" <s-adivi@ti.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260810151423.1948224-9-s-adivi@ti.com>
References: <20260810151423.1948224-1-s-adivi@ti.com>
 <20260810151423.1948224-9-s-adivi@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 16:09:51 +0000
Message-Id: <20260810160952.377F61F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Infinite loop in `udma_check_tx_completion` when channel is termin=
ated concurrently.
- [High] DMA mappings are permanently leaked in `udma_setup_rx_flush` on er=
ror paths and during normal teardown.
- [High] RX flush buffer is mapped with `DMA_TO_DEVICE` instead of `DMA_FRO=
M_DEVICE`, causing IOMMU faults.
- [High] Double free of `uc->terminated_desc` due to a TOCTOU race conditio=
n between `udma_ring_irq_handler` and `udma_reset_rings`.
--

--- Patch [8]: [PATCH v8 08/19] dmaengine: ti: k3-udma: move udma utility f=
unctions to k3-udma-common.c ---
commit 1751c5be6aa08d5072c4cebf22d4b8c37ab58711
Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>
Date:   Mon Aug 10 15:14:02 2026 +0000

    dmaengine: ti: k3-udma: move udma utility functions to k3-udma-common.c
   =20
    Relocate udma utility functions from k3-udma.c to k3-udma-common.c file.
   =20
    The implementation of these functions is largely shared between K3 UDMA
    and K3 UDMA v2. This refactor improves code reuse and maintainability
    across multiple variants.
   =20
    No functional changes intended.

> diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-com=
mon.c
> index 3ec5cc932280c..892b88a220f18 100644
> --- a/drivers/dma/ti/k3-udma-common.c
> +++ b/drivers/dma/ti/k3-udma-common.c

[ ... ]

> @@ -1342,5 +1365,531 @@ void udma_reset_rings(struct udma_chan *uc)
> +void udma_check_tx_completion(struct work_struct *work)
> +{
> +	struct udma_chan *uc =3D container_of(work, typeof(*uc),
> +					    tx_drain.work.work);
> +	bool desc_done =3D true;
> +	u32 residue_diff;
> +	ktime_t time_diff;
> +	unsigned long delay;
> +	unsigned long flags;
> +
> +	while (1) {
> +		spin_lock_irqsave(&uc->vc.lock, flags);
> +
> +		if (uc->desc) {
> +			/* Get previous residue and time stamp */
> +			residue_diff =3D uc->tx_drain.residue;
> +			time_diff =3D uc->tx_drain.tstamp;
> +			/*
> +			 * Get current residue and time stamp or see if
> +			 * transfer is complete
> +			 */
> +			desc_done =3D udma_is_desc_really_done(uc, uc->desc);
> +		}
> +
> +		if (!desc_done) {
> +			/*
> +			 * Find the time delta and residue delta w.r.t
> +			 * previous poll
> +			 */
> +			time_diff =3D ktime_sub(uc->tx_drain.tstamp,
> +					      time_diff) + 1;
> +			residue_diff -=3D uc->tx_drain.residue;
> +			if (residue_diff) {
> +				/*
> +				 * Try to guess when we should check
> +				 * next time by calculating rate at
> +				 * which data is being drained at the
> +				 * peer device
> +				 */
> +				delay =3D (time_diff / residue_diff) *
> +					uc->tx_drain.residue;
> +			} else {
> +				/* No progress, check again in 1 second  */
> +				schedule_delayed_work(&uc->tx_drain.work, HZ);
> +				break;
> +			}
> +
> +			spin_unlock_irqrestore(&uc->vc.lock, flags);
> +
> +			usleep_range(ktime_to_us(delay),
> +				     ktime_to_us(delay) + 10);
> +			continue;

[Severity: High]
This is a pre-existing issue, but can this worker thread spin indefinitely
if the channel is terminated concurrently?

If udma_terminate_all() executes while this worker is sleeping, it sets
uc->desc =3D NULL. When the worker wakes up and reacquires the lock, it
skips the if (uc->desc) block, leaving the local variable desc_done as
false.

It then enters the if (!desc_done) block, repeatedly subtracting the
now-stale uc->tx_drain.residue from the local residue_diff. Because the
state is never refreshed, does the loop repeat endlessly until an eventual
integer underflow allows it to break millions of iterations later?

> +		}
> +
> +		if (uc->desc) {
> +			struct udma_desc *d =3D uc->desc;
> +
> +			uc->ud->decrement_byte_counters(uc, d->residue);
> +			uc->ud->start(uc);
> +			vchan_cookie_complete(&d->vd);
> +			break;
> +		}
> +
> +		break;
> +	}
> +
> +	spin_unlock_irqrestore(&uc->vc.lock, flags);
> +}

[ ... ]

> +void udma_synchronize(struct dma_chan *chan)
> +{
> +	struct udma_chan *uc =3D to_udma_chan(chan);
> +	unsigned long timeout =3D msecs_to_jiffies(1000);
> +
> +	vchan_synchronize(&uc->vc);
> +
> +	if (uc->state =3D=3D UDMA_CHAN_IS_TERMINATING) {
> +		timeout =3D wait_for_completion_timeout(&uc->teardown_completed,
> +						      timeout);
> +		if (!timeout) {
> +			dev_warn(uc->ud->dev, "chan%d teardown timeout!\n",
> +				 uc->id);
> +			udma_dump_chan_stdata(uc);
> +			uc->ud->reset_chan(uc, true);
> +		}
> +	}
> +
> +	uc->ud->reset_chan(uc, false);
> +	if (udma_is_chan_running(uc))
> +		dev_warn(uc->ud->dev, "chan%d refused to stop!\n", uc->id);
> +
> +	cancel_delayed_work_sync(&uc->tx_drain.work);
> +	udma_reset_rings(uc);

[Severity: High]
This isn't a bug introduced by this patch, but is there a TOCTOU race
condition between udma_synchronize() calling udma_reset_rings() and the
udma_ring_irq_handler()?

In udma_ring_irq_handler(), when a teardown completion message is processed,
complete_all(&uc->teardown_completed) is called before uc->terminated_desc
is freed and cleared:

    if (cppi5_desc_is_tdcm(paddr)) {
        complete_all(&uc->teardown_completed);

        if (uc->terminated_desc) {
            udma_desc_free(&uc->terminated_desc->vd);
            uc->terminated_desc =3D NULL;
        }

Calling complete_all() immediately wakes up the thread waiting here in
udma_synchronize(). The woken thread then executes udma_reset_rings() which
performs an unlocked check of uc->terminated_desc.

In an SMP system, could the woken thread observe uc->terminated_desc as
non-NULL before the IRQ handler on the original CPU sets it to NULL, causing
both threads to concurrently attempt a double-free?

> +}

[ ... ]

> +int udma_setup_rx_flush(struct udma_dev *ud)
> +{
> +	struct udma_rx_flush *rx_flush =3D &ud->rx_flush;
> +	struct cppi5_desc_hdr_t *tr_desc;
> +	struct cppi5_tr_type1_t *tr_req;
> +	struct cppi5_host_desc_t *desc;
> +	struct device *dev =3D ud->dev;
> +	struct udma_hwdesc *hwdesc;
> +	size_t tr_size;
> +
> +	/* Allocate 1K buffer for discarded data on RX channel teardown */
> +	rx_flush->buffer_size =3D SZ_1K;
> +	rx_flush->buffer_vaddr =3D devm_kzalloc(dev, rx_flush->buffer_size,
> +					      GFP_KERNEL);
> +	if (!rx_flush->buffer_vaddr)
> +		return -ENOMEM;
> +
> +	rx_flush->buffer_paddr =3D dma_map_single(dev, rx_flush->buffer_vaddr,
> +						rx_flush->buffer_size,
> +						DMA_TO_DEVICE);

[Severity: High]
This is a pre-existing issue, but is DMA_TO_DEVICE the correct direction
for this mapping?

This buffer seems to act as a memory sink for discarded incoming data
when tearing down a DEV_TO_MEM channel. Because the DMA engine writes data
to this buffer, the IOMMU must grant write access to the device. However,
mapping it with DMA_TO_DEVICE configures the IOMMU to allow only device rea=
ds.

Will a strict IOMMU trap the write and trigger a fault?

> +	if (dma_mapping_error(dev, rx_flush->buffer_paddr))
> +		return -ENOMEM;
> +
> +	/* Set up descriptor to be used for TR mode */
> +	hwdesc =3D &rx_flush->hwdescs[0];
> +	tr_size =3D sizeof(struct cppi5_tr_type1_t);
> +	hwdesc->cppi5_desc_size =3D cppi5_trdesc_calc_size(tr_size, 1);
> +	hwdesc->cppi5_desc_size =3D ALIGN(hwdesc->cppi5_desc_size,
> +					ud->desc_align);
> +
> +	hwdesc->cppi5_desc_vaddr =3D devm_kzalloc(dev, hwdesc->cppi5_desc_size,
> +						GFP_KERNEL);
> +	if (!hwdesc->cppi5_desc_vaddr)
> +		return -ENOMEM;

[Severity: High]
This isn't a bug introduced by this patch, but does this error path permane=
ntly
leak the DMA mapping (IOVA space)?

If the allocation for hwdesc->cppi5_desc_vaddr fails, the function returns
-ENOMEM without calling dma_unmap_single() for rx_flush->buffer_paddr.
While devres frees the memory, IOVA space mapped via dma_map_single() must
be explicitly unmapped.

Additionally, is there a corresponding dma_unmap_single() invoked during
normal driver teardown?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810151423.1948=
224-1-s-adivi@ti.com?part=3D8
