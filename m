Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2543423EB9;
	Fri, 24 Jul 2026 10:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784889782; cv=none; b=TG/6kvLqm+wzg3OuFuumiaV561v9sAxPS45KmwEXQFMHhzeI4l9Elc63IPu2FMXZ7ZAFPjDvR4iWSIsZDn27yUnzwH1NOrsmhHgI1pmq6QuOx2/CvguXS4osyVIzxBgu5crkbHf+DuUgyoldQNnGmf27Hhjazn94I2hF6jh+6jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784889782; c=relaxed/simple;
	bh=gye+MEsct0+5BGbQ54xdXsyRU6WZK2rDYaWANUNNCMw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=R1O5W/duat2KAT1bcPLnjfV/OeDXoRNnQhINm6s0yOM8cSbEEHONv/k+GwNhvqHw5aPP/trzkX1x6KUiJ3xE9+g9F3hfMXU/IOubW3dcHK6XkITq5QC1UaJzKg8rmGv3Ll1ZorMoYNDIOp0gxraKZyd4101gshO7CWqWCoqAG+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dLQjMRRf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dLQjMRRf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8F591F00A3A;
	Fri, 24 Jul 2026 10:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784889778;
	bh=EmkK83BaoWlMRVA7vqkIhlQ3vKgYswDz9g7ZNLthUGc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dLQjMRRf4/3Zn+dnOymVrTTSJ0UoSJK4LVmCnzU938RXM+ZBPxzYJzp2XO+8qjYWk
	 FMbszluIKlH/PvCbNKwj5eJImdBOF8nQm2dNtONigsT0/4vFdhFaVp2Cd8bYZ2CbP9
	 gt5XNclLyPtfPL0PKVeJz4CUvD/QptsGnYlD4kxDnUDFlFD6GkmwGMrGevl/1kJFpo
	 OWLUnufKCTEkMoOdwAXZIhpGyuEJu/I09f3e+SHm4Ykyg2Qt1T82SWxmQ/kf7ze/a/
	 wDiqCs+R/Y59YqYDw/O46S31Qy7tC+Y+c6/JNpucKzeDWvSJEgWTzh7zd0xoaU48QF
	 3ZdyksXudTSaQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 08/19] dmaengine: ti: k3-udma: move udma utility
 functions to k3-udma-common.c
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Sree Kartheek Adivi" <s-adivi@ti.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260724102115.2854-9-s-adivi@ti.com>
References: <20260724102115.2854-1-s-adivi@ti.com>
 <20260724102115.2854-9-s-adivi@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 10:42:57 +0000
Message-Id: <20260724104257.A8F591F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Unprotected access to `uc->terminated_desc` in `udma_reset_rin=
gs` races with `udma_ring_irq_handler`, causing a potential double-free or =
use-after-free.
- [High] The delayed work `udma_check_tx_completion` can enter a runaway lo=
op and incorrectly reschedule itself if its channel is terminated concurren=
tly, leaving a rogue timer active.
--

--- Patch [8]: [PATCH v7 08/19] dmaengine: ti: k3-udma: move udma utility f=
unctions to k3-udma-common.c ---
commit a1188aac2ed37ae50666251d86303353027b5fbb
Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>
Subject: dmaengine: ti: k3-udma: move udma utility functions to k3-udma-com=
mon.c

This commit relocates several utility functions from k3-udma.c to
k3-udma-common.c to improve code reuse and maintainability between K3 UDMA
and K3 UDMA v2 variants. There are no intended functional changes.

diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-commo=
n.c
index fc5e2c99ee28a..01aea77c25715 100644
--- a/drivers/dma/ti/k3-udma-common.c
+++ b/drivers/dma/ti/k3-udma-common.c
[ ... ]
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

[Severity: High]
This isn't a bug introduced by this patch, but is a pre-existing logic
issue. If uc->desc becomes NULL during the worker's sleep (e.g., if
udma_terminate_all() is called concurrently):

udma_terminate_all() {
	if (uc->desc) {
		uc->terminated_desc =3D uc->desc;
		uc->desc =3D NULL;
...

could the worker wake up, bypass the if (uc->desc) check, and see
desc_done still false from the previous iteration?

It seems this would use stale residue_diff values on every subsequent loop
iteration, continually sleeping until residue_diff wraps around to 0:

[ ... ]
> +			} else {
> +				/* No progress, check again in 1 second  */
> +				schedule_delayed_work(&uc->tx_drain.work, HZ);
> +				break;
> +			}

and then incorrectly reschedule itself, leaving a rogue delayed work armed
despite the channel being terminated?

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
[ ... ]
> +	}
> +
> +	uc->ud->reset_chan(uc, false);
> +	if (udma_is_chan_running(uc))
> +		dev_warn(uc->ud->dev, "chan%d refused to stop!\n", uc->id);
> +
> +	cancel_delayed_work_sync(&uc->tx_drain.work);
> +	udma_reset_rings(uc);
> +}

[Severity: Critical]
This is a pre-existing issue, but does udma_reset_rings() race with
udma_ring_irq_handler() and potentially cause a double-free?

When a DMA channel is terminated, udma_synchronize() waits for the teardown
completion. The hardware raises an interrupt, and udma_ring_irq_handler()
signals completion before it finishes clearing uc->terminated_desc:

drivers/dma/ti/k3-udma.c:udma_ring_irq_handler() {
	if (cppi5_desc_is_tdcm(paddr)) {
		complete_all(&uc->teardown_completed);

		if (uc->terminated_desc) {
			udma_desc_free(&uc->terminated_desc->vd);
			uc->terminated_desc =3D NULL;
		}
...

This immediately wakes up udma_synchronize(), which proceeds to call
udma_reset_rings() without holding uc->vc.lock:

drivers/dma/ti/k3-udma-common.c:udma_reset_rings() {
...
	if (uc->terminated_desc) {
		udma_desc_free(&uc->terminated_desc->vd);
		uc->terminated_desc =3D NULL;
	}
}

If the awakened thread reaches udma_reset_rings() while the IRQ handler
is still executing udma_desc_free(), couldn't both threads invoke
udma_desc_free() on the same descriptor?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724102115.2854=
-1-s-adivi@ti.com?part=3D8
