Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1D241684F
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 09:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784798077; cv=none; b=JXO1gsX91Qf1W1KZQGdYxjikd2PkkXP1i42J2Wlkuw09/h0LwoQUecUIVXKHzXXjg2WiSBY8u0rNkDW0vAD7qoo8w25NbHzjjulJXz38ycopm0xHFZdvlrYZfVlzL3xELAYTfp3R54YCLqdS4rKBxP0cR8RRgRJMtGaUeGEEOJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784798077; c=relaxed/simple;
	bh=JqCedYB+mE35Smi/HsSBC4qHxcReecjF9vWZhsGcKJE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qVZe8yIGwkUVmwne0hOBjm9YeHufhicsJcQpJXKIQgqH28tRiPUK7eY7cTiknv+tyWM5KRQy7+2FG+JG6W/KXGZ+uMV+mQmzCxfqgK+tJahNNQhGwjc7qGpeuzu4SRKn7DXLVM8umXHgjJIqngeqndj0nqNUIutoSDh64UwpRJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xdjb7WBF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xdjb7WBF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0A131F000E9;
	Thu, 23 Jul 2026 09:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784798075;
	bh=BFaYYXxSKaknGFkXIvY9aLl6mxtgrl8G1XGhL8CdnxY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Xdjb7WBFsZB9UlYRtLRAMcTDvouliJVfVI33799UtJZ+wuGyr3AwXrSb0aSZUyHzG
	 /HR1AUQEYA04t9UNqLJhYjw39y4U9O9q3qiIrdahnit6ft8RA9E8FtDRG0q5KpE3ff
	 K53AX7+DNQgfBrcOqZA49D5oTe9/mn7ppPFTyRujKTKrJgSFSWPp8qTFzBOoo2g1oI
	 9SkNB9lAgsuBUiqeCvQ0C0lthH9X5IJPKTYmGR7LzBKVTubmvOQdwjhzQH2qq+n1EA
	 ZttDtzOitGeP1QDRHi29GHsaz7GFBWeSvEPMkuiUtolzfY5PY976C6DSojYbCjfxWZ
	 f6TWcc8zb0INQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 16/19] dmaengine: dw-edma: Add engine recovery
 infrastructure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260723084150.521366-17-den@valinux.co.jp>
References: <20260723084150.521366-1-den@valinux.co.jp>
 <20260723084150.521366-17-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 09:14:28 +0000
Message-Id: <20260723091434.F0A131F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] Hardware interrupts are disabled via free_irq() before the hardwar=
e engine is stopped, risking an interrupt storm.
- [High] Passive stall detection will fail to trigger recovery for sleeping=
 clients, leading to indefinite hangs.
- [High] Queueing work on a destroyed workqueue during driver removal leads=
 to a kernel crash.
- [Low] Mixing goto-based cleanup labels with guard()/scoped_guard() declar=
ations in the same function.

Pre-existing issues:
- [High] IRQs are requested before channels are fully initialized, leading =
to potential crashes from early interrupts.
--

--- Patch [16]: [PATCH v2 16/19] dmaengine: dw-edma: Add engine recovery in=
frastructure ---
commit 348674e8eed041726892cbce36b8d539a278c6d1
Author: Koichiro Den <den@valinux.co.jp>
Subject: dmaengine: dw-edma: Add engine recovery infrastructure

This commit adds a worker to coordinate engine recovery in the dw-edma
driver. It gates publication and doorbells, waits for channels to stop,
and rebuilds linked-list contexts after resetting the engine.

> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-=
edma-core.c
> index 9305137f85f67..14cd0038dbd27 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c

[ ... ]

> +static void dw_edma_engine_recovery_work(struct work_struct *work)
> +{
> +	struct dw_edma_engine_recovery *rec =3D
> +		container_of(work, struct dw_edma_engine_recovery, work);
> +	struct dw_edma *dw =3D rec->dw;
> +	const char *dir_name =3D str_write_read(rec->dir =3D=3D EDMA_DIR_WRITE);
> +	u16 off =3D rec->dir =3D=3D EDMA_DIR_WRITE ? 0 : dw->wr_ch_cnt;
> +	u16 cnt =3D rec->dir =3D=3D EDMA_DIR_WRITE ? dw->wr_ch_cnt : dw->rd_ch_=
cnt;
> +	unsigned long timeout =3D
> +		jiffies + msecs_to_jiffies(DW_EDMA_ENGINE_QUIESCE_TIMEOUT_MS);
> +	struct dw_edma_chan *chan;
> +	bool configured_ll;
> +	bool busy;
> +	u16 i;
> +
> +	if (!dw_edma_engine_recovery_needed(rec)) {
> +		if (READ_ONCE(rec->active))
> +			dw_edma_engine_recovery_release(rec);
> +		return;
> +	}
> +
> +	WRITE_ONCE(rec->active, true);
> +
> +	/* Gate each channel before inspecting or resetting the direction. */
> +	for (i =3D 0; i < cnt; i++) {
> +		chan =3D &dw->chan[off + i];
> +		guard(spinlock_irqsave)(&chan->vc.lock);

[Severity: Low]
Does this code violate the cleanup subsystem guidelines by mixing goto-based
cleanup labels with scope-based guards?

The cleanup subsystem guide explicitly states that functions must not mix
goto-based cleanup labels with guard() or scoped_guard() declarations. This
function uses a goto out_release; label further down, while declaring
guard(spinlock_irqsave) here in the loop.

[ ... ]

> +		if (moving) {
> +			dev_warn_ratelimited(dw->chip->dev,
> +					     "%s engine quiesce timed out with transfers still progressing,=
 retrying\n",
> +					     dir_name);
> +			queue_work(dw->wq, &rec->work);
> +			return;
> +		}
> +
> +		dev_warn(dw->chip->dev,
> +			 "%s engine reset with a channel frozen mid-element\n",
> +			 dir_name);
> +	}
> +
> +	if (!dw_edma_engine_recovery_needed(rec))
> +		goto out_release;

[ ... ]

> +	if (!dw->core->engine_reset(dw, rec->dir)) {
> +		/*
> +		 * Keep channels gated and do not re-enable the engine unless
> +		 * ENGINE_EN clears.
> +		 */
> +		if (++rec->fails >=3D DW_EDMA_ENGINE_RESET_MAX_FAILS) {
> +			dev_err(dw->chip->dev,
> +				"%s engine did not drain after %u attempts; leaving channels gated\n=
",
> +				dir_name, rec->fails);
> +			return;
> +		}
> +		queue_work(dw->wq, &rec->work);

[Severity: High]
Can passive stall detection fail to trigger this recovery for clients that
are sleeping?

The stall check relies on dw_edma_ll_stall_check() reading timeouts, but
it appears to only be invoked when dw_edma_core_ch_maybe_doorbell() is
called. If a hardware channel freezes and generates no further interrupts
while a client waits via wait_for_completion(), could the stall go
completely undetected because the status is never actively polled?

[ ... ]

> @@ -1640,6 +1905,13 @@ int dw_edma_probe(struct dw_edma_chip *chip)
> =20
>  	raw_spin_lock_init(&dw->lock);
> =20
> +	for (i =3D 0; i < ARRAY_SIZE(dw->eng_recovery); i++) {
> +		dw->eng_recovery[i].dw =3D dw;
> +		dw->eng_recovery[i].dir =3D i;
> +		INIT_WORK(&dw->eng_recovery[i].work,
> +			  dw_edma_engine_recovery_work);
> +	}
> +

[Severity: High]
This is a pre-existing issue, but does dw_edma_probe() register interrupts
before the driver's internal channel state is initialized?

In dw_edma_probe(), the interrupt handler is registered by calling
dw_edma_irq_request() before the channel structures and work items are
fully initialized via dw_edma_channel_setup().

If a spurious or shared interrupt fires immediately after registration:

dw_edma_probe()
   dw_edma_irq_request(dw, &wr_alloc, &rd_alloc);
   ...
   dw_edma_channel_setup(dw, wr_alloc, rd_alloc);

Could this attempt to access or queue work using zeroed memory, leading to
a kernel crash?

[ ... ]

> @@ -1738,11 +2010,6 @@ int dw_edma_remove(struct dw_edma_chip *chip)
>  	if (!dw)
>  		return -ENODEV;
> =20
> -	if (chip->flags & DW_EDMA_CHIP_PARTIAL)
> -		err =3D dw_edma_core_quiesce(dw);
> -	else
> -		dw_edma_core_off(dw);
> -
>  	/* Free irqs */
>  	for (i =3D (dw->nr_irqs - 1); i >=3D 0; i--)
>  		free_irq(chip->ops->irq_vector(dev, i), &dw->irq[i]);
> @@ -1751,6 +2018,16 @@ int dw_edma_remove(struct dw_edma_chip *chip)
>  	for (i =3D 0; i < dw->wr_ch_cnt + dw->rd_ch_cnt; i++)
>  		cancel_work_sync(&dw->chan[i].irq_work);
> =20
> +	/* Prevent a running recovery worker from requeueing itself. */
> +	disable_work_sync(&dw->eng_recovery[0].work);
> +	disable_work_sync(&dw->eng_recovery[1].work);
> +
> +	/* A recovery worker can re-enable the engine, so stop it last. */
> +	if (chip->flags & DW_EDMA_CHIP_PARTIAL)
> +		err =3D dw_edma_core_quiesce(dw);
> +	else
> +		dw_edma_core_off(dw);
> +

[Severity: High]
Will moving dw_edma_core_off() after free_irq() risk an interrupt storm?

By tearing down the interrupt handler before stopping the hardware, the
hardware remains fully active while its handler is unregistered. If the
engine generates an interrupt, a shared interrupt handler would return
IRQ_NONE. Because the hardware interrupt is never cleared, won't the CPU
get stuck in an interrupt loop until the kernel disables the shared IRQ
line completely?

>  	destroy_workqueue(dw->wq);
> =20
>  	/* Deregister eDMA device */

[Severity: High]
Could destroying the workqueue before unregistering the DMA device cause
a use-after-free crash?

Since destroy_workqueue() is called before dma_async_device_unregister(),
the device is still visible to clients. If a client software calls
dmaengine_tx_status() during driver unload, it can invoke
dw_edma_core_ch_maybe_doorbell(). With this patch, the doorbell logic now
eventually hits dw_edma_ll_stall_check(), which can call
queue_work(chan->dw->wq, &rec->work).=20

Could this attempt to queue work on the already-destroyed workqueue?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723084150.5213=
66-1-den@valinux.co.jp?part=3D16
