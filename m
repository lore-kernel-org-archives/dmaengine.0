Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794320139;
	b=cw2Yn/6hutQnB0jZ+lJIDsEPf1M4QvSMvyN2MYCjgsw89UV+4wCu3yk4NnPANmm0BYYF
	 MDvBg+HbFpjL31/TYsy06Yg2bUiscC7eyuA1TTQA8J1T+cIa55xgu7YM868CUuOT6kCGJ
	 EJouVdpcge0+M8pwoYNeTo4BIY8y1OWBxDBwQPIR8Mr6sFLrQtuKTcqaNXe3v90mNFSpX
	 ySxI9rV/shkWpBeiH1jHm2zYEC7asYMxo5LHkO8B53nFfxZosiF33dxm7NFqezZW26pDf
	 CX2kvSESADpKguFubScfRmdeZ25FieUadZ6kJX9BMPoFbVdMBghQDWlqqFP2iI0gYRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794320139;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=nw6s+fDrHO0AaEqaHh20eMoNuR5LHBINJWy33y+YkfE=;
	b=Msb+gVPQEcJACCp/eVLAWhOsklwhIgAYHfF8ZgTe2dkvGlzKfPWhiwYFCAhEQn3OvtL/
	 EfsgYOt5rgvIGg54qDV8x13Y68442CazDPcaSORZIFy5hgOw6d/1NI4J6kzw6bf+NZ1Wg
	 3oP9+ymJSk0v4/Fvgp6p/Ij6OtCCvk8Faib97Pqw6ULGbkawC4Yy1jsZDj1G6o97+MK9l
	 VuWkbssZngSuA1AcVwYeQnV8bVfzyZeFsUFclYIfo1JQw7LDqUjIUFtyJsyXh1tUitjw6
	 05MYnJMSfOL65ihvh2PjHw1J7Ey0eOMtPF+Gprd+8IdthHDv5Rhuau+oKNl0L+MHe9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ODIDrNIM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8153606A334
	for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 14:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ODIDrNIM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83FCE1F008A2;
	Tue, 10 Nov 2026 14:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794320138;
	bh=nw6s+fDrHO0AaEqaHh20eMoNuR5LHBINJWy33y+YkfE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ODIDrNIMPi2NOZ8OHgrhVSm4DenhTvOvr0Z8xnasecdWHVTQA714fTLPWlLc1SYDM
	 wNbuA8VBrUE65989iI2dQ+YyRNSnu+i0UqFiYlU/VmiNAWRSekqYpsqrt7U/odpAXJ
	 VpO/pNUnaau/eXlgJudbFeAuWlKAYmYmwiwDE35m7U0TguvxiFpDdSHmloQnbbAGn1
	 0Ob3L8Vpzq5m5x3qZ6VSrY4ESh9Z/rzncCHwVWfmvXyq9dLdrVk++6N7IYSkCdXH7X
	 JKnT13xlpsh9X1ejglEIrBkrFLlaLzAkTuCsxAM+R0JG0d4OkhE8uZgWjLPEjV8S+9
	 +pG35SuJFOFuA==
Message-ID: <sashiko-outbox-207180@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 02/33] dmaengine: back channel BH helpers with WQ_BH
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <717bb0b82658f1dd800f6b1bc06b9cf283f77361.1794315350.git.allen.lkml@gmail.com>
References: <cover.1794315350.git.allen.lkml@gmail.com>
 <717bb0b82658f1dd800f6b1bc06b9cf283f77361.1794315350.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 14:15:38 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] dmaengine: dmaengine_kill_bh() returns with bh_work still
  queued on re-schedule
- [Medium] dmaengine: flush_work() in dmaengine_kill_bh() triggers flush
  dependency warn
--

commit e183b161b65ac0da135cdea21e6916bb3483d703
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: back channel BH helpers with WQ_BH

This commit replaces the per-channel BH tasklet implementation with a
dedicated WQ_BH | WQ_PERCPU workqueue while keeping the dmaengine_*_bh() API
unchanged.

> diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
> index f3c1283b161b6..97d8f9667ae5f 100644
> --- a/drivers/dma/dmaengine.c
> +++ b/drivers/dma/dmaengine.c
[ ... ]
> @@ -1449,9 +1451,34 @@ static void dmaengine_destroy_unmap_pool(void)
[ ... ]
> +static void dmaengine_flush_bh_work(struct work_struct *work)
> +{
> +	if (!work)
> +		return;
> +
> +	flush_work(work);
> +}
> +
> +static void dma_chan_bh_entry(struct work_struct *work)
> +{
> +	struct dma_chan *chan =3D container_of(work, struct dma_chan, bh_work);
>  	dmaengine_bh_work_fn fn =3D READ_ONCE(chan->bh_work_fn);
> =20
>  	if (fn)
> @@ -1467,7 +1494,7 @@ void dmaengine_init_bh(struct dma_chan *chan, dmaen=
gine_bh_work_fn fn)
[ ... ]
> @@ -1487,7 +1513,7 @@ void dmaengine_kill_bh(struct dma_chan *chan)
>  	if (!chan->bh_work_initialized)
>  		return;
> =20
> -	tasklet_kill(&chan->bh_tasklet);
> +	dmaengine_flush_bh_work(&chan->bh_work);
>  }
>  EXPORT_SYMBOL_GPL(dmaengine_kill_bh);

[Severity: High]
Can dmaengine_kill_bh() return with chan->bh_work still queued on the
workqueue?

Unlike tasklet_kill(), which holds TASKLET_STATE_SCHED while waiting for a
running tasklet to finish so concurrent tasklet_schedule() calls cannot
re-queue it, process_one_work() clears WORK_STRUCT_PENDING_BIT before
invoking dma_chan_bh_entry().  When flush_work() runs while chan->bh_work is
executing, insert_wq_barrier() places the flush barrier on worker->schedule=
d,
ahead of pool->worklist:

CPU0                                  CPU1 (bh_worker)
                                      process_one_work(&chan->bh_work)
                                        set_work_pool_and_clear_pending()
                                        dma_chan_bh_entry()
dmaengine_kill_bh(chan)
  flush_work(&chan->bh_work)
    insert_wq_barrier()
                                          ...
                                            dmaengine_schedule_bh(chan)
                                              queue_work(..., &chan->bh_wor=
k)
                                        /* dma_chan_bh_entry() returns */
                                      process_scheduled_works()
                                        /* runs barrier from
                                         * worker->scheduled */
  /* flush_work() returns */
kfree(chan)
                                      /* processes pool->worklist */
                                      dma_chan_bh_entry()
                                        chan->bh_work_fn  <-- use-after-free

This is a regression when chan->bh_work is re-queued while
dma_chan_bh_entry() is running, for example when a BH callback reschedules
itself (such as dma_tasklet() in ste_dma40 or mv_chan_slot_cleanup() in
mv_xor) or when a driver calls dmaengine_kill_bh() before tearing down its
IRQ or timer (such as mtk_cqdma_remove() or tegra_adma_free_chan_resources(=
)).
Using cancel_work_sync(&chan->bh_work) or disable_work_sync(&chan->bh_work)
depending on whether the channel may be used again would wait for any
in-flight execution while preventing or draining concurrent re-schedules.

> @@ -1687,15 +1713,28 @@ EXPORT_SYMBOL_GPL(dma_run_dependencies);
> =20
>  static int __init dma_bus_init(void)
>  {
> -	int err =3D dmaengine_init_unmap_pool();
> +	int err;
> =20
> +	dmaengine_bh_wq =3D alloc_workqueue("dmaengine_bh",
> +					  WQ_BH | WQ_PERCPU, 0);

[Severity: Medium]
Does calling dmaengine_kill_bh() from a WQ_MEM_RECLAIM workqueue or a
PF_MEMALLOC task trigger a WARN_ONCE() in check_flush_dependency()?

dmaengine_bh_wq does not have WQ_MEM_RECLAIM set (and WQ_BH workqueues cann=
ot
set WQ_MEM_RECLAIM).  Because dmaengine_kill_bh() calls flush_work(), which
passes from_cancel =3D false to __flush_work() -> check_flush_dependency(),
flushing a pending or running chan->bh_work from a WQ_MEM_RECLAIM context
hits the dependency warning:

kernel/workqueue.c:check_flush_dependency() {
	if (from_cancel || target_wq->flags & WQ_MEM_RECLAIM)
		return;

	WARN_ONCE(current->flags & PF_MEMALLOC, ...);
	WARN_ONCE((worker && ((worker->current_pwq->wq->flags &
			       (WQ_MEM_RECLAIM | __WQ_LEGACY)) =3D=3D WQ_MEM_RECLAIM)), ...);
}

For example, sdhci allocates host->complete_wq with WQ_MEM_RECLAIM and runs
sdhci_complete_work() -> sdhci_request_done() -> dmaengine_terminate_sync()
-> dmaengine_synchronize() -> vchan_synchronize() -> dmaengine_kill_bh().
Using cancel_work_sync() or disable_work_sync() in dmaengine_kill_bh() sets
from_cancel =3D true and avoids this warning.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794315350.gi=
t.allen.lkml@gmail.com?part=3D2
