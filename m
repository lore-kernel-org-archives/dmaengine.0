Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A942225332E
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785185991; cv=none; b=GF6HgQKDmgs0CGOi8PZOgMHJsvWlxJPHv1qyM2TjCcGcnj4M4VwlsjdSMVVDX0/NODrBzhgj9Y3LRt87JHB+miOiy+niecx4HyVETp8QqqB5iziBSJJU98zM+9o2FxclFeG9EC35wK3Z6ZN+4a9FJLK6kdX8JxJ1mArQWzWhHnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785185991; c=relaxed/simple;
	bh=F+6yqofcfXHMo+zhMlzN8aCJjhxZub5+I+9i5s7PC9M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AiqL5nNwMYC6fUfP8e6WWIgXv6jooae1O+5DEf/TINjzN69nKGIlEZA3TeoN/gFTxAW2gMecKCyvvkHCRI3RSuyiOeCId1VOiiqO3oPauo3NEW3aW6+PYKnH/ozqWocw11QN8FLXyhYcH05vfkmBA1VTAVpYcdk5u7eq6767ZZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DqIU6qD1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DqIU6qD1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48AEB1F000E9;
	Mon, 27 Jul 2026 20:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785185990;
	bh=uigywkhralSYjWKZl+FMirhChWpa7QWSmalSC0X0Qrs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DqIU6qD1cWl4Wl/Bn0e/5Jo33Lvb237od+LsEEf0OzM8jhW4jqh6PQB5kkxeWy6y4
	 +hbeShAyz3UwMmYZpLNx7Bb3XwXjW3YURHJgU6ztJry+BzPZqgBVujhAJ2RyMyN7wU
	 9RWrrHClzMtYqjzfR1D6t+gQu+iEfWpg/ERhbH8gMxE/RjBY+KaKhXnNbODleBmC4B
	 WMGOr/VY9jUsXdgh4ULyW/8GdJ1l4LnI9KQvxLR5cqqq0XGa706awfip+qzicddkCq
	 1rlgpIhPofkfW0dA1G1Mg6LFhxDjV2cHnAVooCMO+eZuLts2TaMK+bKAAPRXS9nx7k
	 GzQrRQfjZlrfg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 18/64] dmaengine: xgene-dma: wire descriptor cleanup
 to dma_chan BH
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <b50997a5ce2cd59ccf056513d123f37f3b23932e.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <b50997a5ce2cd59ccf056513d123f37f3b23932e.1785183549.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 20:59:49 +0000
Message-Id: <20260727205950.48AEB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [High] During device teardown, the driver frees the IRQ before flushing t=
he bottom half workqueue. This results in the bottom half handler calling `=
enable_irq()` on a freed IRQ descriptor, which violates the API and can cau=
se warnings or oopses in the IRQ subsystem.
- [High] Potential spinlock recursion deadlock in `xgene_dma_cleanup_descri=
ptors()` when called from process context via `xgene_dma_free_chan_resource=
s()`.
- [High] Hardware interrupts are unmasked before the bottom halves are init=
ialized in the probe sequence, allowing an early interrupt to permanently h=
ang the channel.
- [High] In the probe error path, bottom halves are flushed before hardware=
 interrupts are masked, leading to a race condition that can result in a Us=
e-After-Free of driver structures when the workqueue later executes.
- [High] The driver returns ring slots to the hardware before clearing the =
descriptor completion signature, risking permanently lost completions.
--

--- Patch [18]: [PATCH v2 18/64] dmaengine: xgene-dma: wire descriptor clea=
nup to dma_chan BH ---
commit 3558adb2da1479ded074f1f3135c3903cdea9f57
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: xgene-dma: wire descriptor cleanup to dma_chan BH

Replace the per-channel tasklet with the shared dma_chan BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

> diff --git a/drivers/dma/xgene-dma.c b/drivers/dma/xgene-dma.c
> index fa1173e499009..8d0428c2944ef 100644
> --- a/drivers/dma/xgene-dma.c
> +++ b/drivers/dma/xgene-dma.c
> @@ -975,9 +973,10 @@ static enum dma_status xgene_dma_tx_status(struct dm=
a_chan *dchan,
>  	return dma_cookie_status(dchan, cookie, txstate);
>  }
> =20
> -static void xgene_dma_tasklet_cb(struct tasklet_struct *t)
> +static void xgene_dma_tasklet_cb(struct dma_chan *c)
>  {
> -	struct xgene_dma_chan *chan =3D from_tasklet(chan, t, tasklet);
> +	struct xgene_dma_chan *chan =3D container_of(c, struct xgene_dma_chan,
> +						   dma_chan);
> =20
>  	/* Run all cleanup for descriptors which have been completed */
>  	xgene_dma_cleanup_descriptors(chan);

[Severity: High]
This is a pre-existing issue, but can this cause a spinlock recursion
deadlock?

Looking at xgene_dma_free_chan_resources(), it runs in process context and
calls xgene_dma_cleanup_descriptors(), which acquires chan->lock using
spin_lock() without disabling softirqs.

If a hardware interrupt occurs on the same CPU, it schedules the bottom hal=
f.
On interrupt exit, the softirq executes xgene_dma_tasklet_cb(), which also
calls xgene_dma_cleanup_descriptors() and attempts to acquire the
already-held chan->lock.

[Severity: High]
This is a pre-existing issue, but does this out-of-order execution risk
permanently losing DMA completions?

In xgene_dma_cleanup_descriptors(), the driver writes to ring->cmd to notify
the hardware that a descriptor slot is free, and then clears the descriptor=
's
completion signature in memory:

xgene_dma_cleanup_descriptors() {
    ...
    iowrite32(-1, ring->cmd);
    desc_hw->m0 =3D cpu_to_le64(XGENE_DMA_DESC_EMPTY_SIGNATURE);
    ...
}

Since the hardware engine is active, could it immediately write a new
completion signature into that slot before the CPU executes the assignment,
causing the CPU to unconditionally overwrite the valid completion signature
with the empty signature?

[ ... ]

> @@ -1539,7 +1538,7 @@ static int xgene_dma_async_register(struct xgene_dm=
a *pdma, int id)
>  	INIT_LIST_HEAD(&chan->ld_pending);
>  	INIT_LIST_HEAD(&chan->ld_running);
>  	INIT_LIST_HEAD(&chan->ld_completed);
> -	tasklet_setup(&chan->tasklet, xgene_dma_tasklet_cb);
> +	dma_chan_init_bh(&chan->dma_chan, xgene_dma_tasklet_cb);

[Severity: High]
This is a pre-existing issue, but can an early interrupt permanently hang
the channel during probe?

In xgene_dma_probe(), xgene_dma_init_hw() enables the DMA engine and unmasks
interrupts before xgene_dma_init_async() initializes the bottom halves.

If a pending or spurious interrupt fires, the ISR attempts to schedule the
uninitialized BH, which fails. Because the BH never runs, enable_irq() is
never called, leaving the channel's IRQ permanently disabled.

[ ... ]

> @@ -1579,7 +1578,7 @@ static int xgene_dma_init_async(struct xgene_dma *p=
dma)
>  		if (ret) {
>  			for (j =3D 0; j < i; j++) {
>  				dma_async_device_unregister(&pdma->dma_dev[j]);
> -				tasklet_kill(&pdma->chan[j].tasklet);
> +				dma_chan_kill_bh(&pdma->chan[j].dma_chan);
>  			}

[Severity: High]
This is a pre-existing issue, but could this error path lead to a
use-after-free of the driver structures?

If xgene_dma_init_async() fails, it calls dma_chan_kill_bh() to clean up
initialized channels, but does not mask hardware interrupts.

An interrupt could fire immediately after, re-queuing the BH. The probe
function then calls xgene_dma_free_irqs(), returns an error, and devm
frees the pdma memory.

Could the global workqueue subsequently execute the re-scheduled BH,
dereferencing the freed chan structure?

[ ... ]

> @@ -1790,7 +1789,7 @@ static void xgene_dma_remove(struct platform_device=
 *pdev)
> =20
>  	for (i =3D 0; i < XGENE_DMA_MAX_CHANNEL; i++) {
>  		chan =3D &pdma->chan[i];
> -		tasklet_kill(&chan->tasklet);
> +		dma_chan_kill_bh(&chan->dma_chan);
>  		xgene_dma_delete_chan_rings(chan);
>  	}

[Severity: High]
This is a pre-existing issue, but is there a risk of accessing a freed IRQ
descriptor during this teardown sequence?

xgene_dma_remove() calls xgene_dma_free_irqs() which frees chan->rx_irq, and
then calls dma_chan_kill_bh().

If the bottom half was already queued, it executes after the IRQ is freed
and unconditionally calls enable_irq(chan->rx_irq), which violates the API
and could cause an oops in the IRQ subsystem.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785183549.gi=
t.allen.lkml@gmail.com?part=3D18
