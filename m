Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53800480331
	for <dmaengine@vger.kernel.org>; Wed,  7 Oct 2026 15:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791386294; cv=none; b=Ij9WMUR3mT6BdXAA0OxN8Bl4anAUlSwd/bwcclObWEOk4GYdSK6LDSvqqVdA+enL87izCz89KblIb42qNSQXhhkDIv+XqHaxcbY18g8fWQK03rwshG3BZb8rY/ffKBXZeOJnIywEAdCG4GbfKozhP9Ri8PjtF2UED823vRNy4Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791386294; c=relaxed/simple;
	bh=auN9vXxQhA3MMEy9foMwJWgvxA2othPnkGXyo3l4UrA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=gv0LBWrqApIcq+EqvxkzNvBrUlweZpOSxv9Si2YM2HtyjuH1g7DvZ4oMcpNeJK8Vwjjl9uJAUi8e5nZ7kOHDKtpUtppTlUvKp1IuWJUTSVtznSkQurq1Z087Z22CmpXMgTz3D221aFOKMjLA7Ex8uwNN+77GdyN6vXkKD1ITgfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cu66S6Dh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cu66S6Dh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F1F91F00893;
	Wed,  7 Oct 2026 15:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791386291;
	bh=Y9LtRNeBEnhkFySrwghF//XReL2fXueXJ7oR5H6Vr9k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Cu66S6DhZ70pI7rh97mAHhNF5l/ii4hIWZJrCrqtwMcwbU6WRXkM7FWXJqdAPgJ6v
	 LENZR26FPY2t65VvWywo/O1UZKVlBGXq9jzDm329SHjo7wMrPPJqCtr9BRn+3RgpZ9
	 8WdvmR8Lu+5adRFE3gIFa8Sxltm6QgZucRXtuW8m8k+NpC0K6CiqLzYws1FkS/vkTe
	 iFahO+Bpcz3qJtkZK0cs30URQw+y+TaIeqZzLSib3PcMRVLuWpKCh0HSOkmWQCeGCR
	 Ir3W30COR53X3J+RLWoLSlsVtaFSFGvy+hzzCGQ1BCEnXOUv1b8e3/+Vi0B46r4YAG
	 xAtpu25wvyd1g==
Message-ID: <sashiko-outbox-163137@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: pl330: Fix lock-order inversion in the
 channel release path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ginger Li" <ginger.jzllee@gmail.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261007150104.38253-1-ginger.jzllee@gmail.com>
References: <20261007150104.38253-1-ginger.jzllee@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 15:18:10 +0000
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Critical] dmaengine: pl330: NULL pointer dereference in pl330_terminate_=
all() due to concurrent channel release
- [High] dmaengine: pl330: NULL pointer deref in tasklet if channel release=
d active
- [High] dmaengine: pl330: Data Race and Use-After-Free in pl330_release_ch=
annel()
- [High] dmaengine: pl330: TOCTOU race in pl330_release_channel() causes de=
scriptor corruption
--

commit bd2f2bca09f98fba1fc42efeff8f9f299c1f56dd
Author: Ginger Li <ginger.jzllee@gmail.com>

dmaengine: pl330: Fix lock-order inversion in the channel release path

This commit addresses a potential deadlock caused by taking the channel lock
and controller lock in different orders across the terminate, pause, and
channel release paths. It modifies pl330_release_channel() to manage the
controller lock internally. It also updates pl330_free_chan_resources() to
call the release function without holding the controller lock.

> diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
> index c2d0b473b8f48..a8d1e5749dc5e 100644
> --- a/drivers/dma/pl330.c
> +++ b/drivers/dma/pl330.c
[ ... ]
> @@ -1805,16 +1805,32 @@ static inline void _free_event(struct pl330_threa=
d *thrd, int ev)
> =20
>  static void pl330_release_channel(struct pl330_thread *thrd)
>  {
> +	struct pl330_dmac *pl330;
> +	unsigned long flags;
> +
>  	if (!thrd || thrd->free)
>  		return;

[Severity: High]
Can a time-of-check to time-of-use race happen here since thrd->free is
checked outside the pl330->lock?

If a dma client calls dma_release_channel() concurrently with the driver's
unbind path pl330_remove(), both paths could pass this check concurrently.
Both would sequentially execute _stop(thrd) and dma_pl330_rqcb() on the
same thread.

If the descriptor has already been returned to the global pool and plucked
by another active channel, the second execution could overwrite the
in-flight desc->status and erroneously schedule the new channel's tasklet.

> =20
> +	pl330 =3D thrd->dmac;
> +
> +	spin_lock_irqsave(&pl330->lock, flags);
>  	_stop(thrd);
> +	spin_unlock_irqrestore(&pl330->lock, flags);
> =20
> +	/*
> +	 * dma_pl330_rqcb() takes the channel lock, which is acquired before
> +	 * pl330->lock on the terminate/pause/tx_status paths.  Calling it with
> +	 * pl330->lock held would invert the lock order, so keep it outside the
> +	 * critical section - the same convention pl330_dotask() and
> +	 * pl330_update() already follow.
> +	 */
>  	dma_pl330_rqcb(thrd->req[1 - thrd->lstenq].desc, PL330_ERR_ABORT);
>  	dma_pl330_rqcb(thrd->req[thrd->lstenq].desc, PL330_ERR_ABORT);

[Severity: High]
Does dropping the lock here introduce a data race and use-after-free?

The descriptor pointers thrd->req[...].desc are protected by pl330->lock.
By reading them after unlocking pl330->lock, concurrent tasklets like
pl330_dotask() or pl330_update() can detach the same descriptor, pass it to
dma_pl330_rqcb(), and set the array pointer to NULL.

If cpu0 locklessly reads the pointer just before it is set to NULL by a
concurrent tasklet, cpu0 will hold a stale descriptor pointer. The tasklet
can then complete the descriptor and free it back to the dmac pool where
it gets reallocated to a new channel.

When cpu0 passes the stale pointer to dma_pl330_rqcb(), it could acquire
the new channel's lock, incorrectly mark the new transfer as DONE, and
prematurely schedule the new channel's tasklet.

Could we cache the descriptors in local variables and set the array entries
to NULL while still holding pl330->lock, then call dma_pl330_rqcb() on the
local variables outside the lock?

> =20
> +	spin_lock_irqsave(&pl330->lock, flags);
>  	_free_event(thrd, thrd->ev);
>  	thrd->free =3D true;
> +	spin_unlock_irqrestore(&pl330->lock, flags);
>  }
[ ... ]
> @@ -2358,9 +2374,15 @@ static void pl330_free_chan_resources(struct dma_c=
han *chan)
>  	tasklet_kill(&pch->task);
> =20
>  	pm_runtime_get_sync(pch->dmac->ddma.dev);
> -	spin_lock_irqsave(&pl330->lock, flags);
> =20
> +	/*
> +	 * pl330_release_channel() takes pl330->lock itself and calls
> +	 * dma_pl330_rqcb(), which takes the channel lock.  It must therefore
> +	 * not be called with pl330->lock held (see the comment there).
> +	 */
>  	pl330_release_channel(pch->thread);

[Severity: High]
Can calling pl330_release_channel() here cause the tasklet to be re-armed
after it was killed, leading to a NULL pointer dereference?

When a client calls dma_release_channel() on an active channel without first
calling dmaengine_terminate_sync(), the dma core invokes
pl330_free_chan_resources(). This first kills the tasklet, then invokes
pl330_release_channel(pch->thread).

Because there are active descriptors, pl330_release_channel() aborts them
via dma_pl330_rqcb():

drivers/dma/pl330.c:dma_pl330_rqcb() {
    ...
    desc->status =3D DONE;
    spin_unlock_irqrestore(&pch->lock, flags);

    tasklet_schedule(&pch->task);
}

This unconditionally re-arms the tasklet after it was killed.

Later in pl330_free_chan_resources(), pch->thread is set to NULL. When the
re-armed tasklet executes pl330_tasklet():

drivers/dma/pl330.c:pl330_tasklet() {
    ...
    if (list_empty(&pch->work_list)) {
        spin_lock(&pch->thread->dmac->lock);
        _stop(pch->thread);
    ...
}

Would this dereference the NULL pch->thread?

> +
> +	spin_lock_irqsave(&pl330->lock, flags);
>  	pch->thread =3D NULL;

[Severity: Critical]
Does setting pch->thread to NULL here while the lock is dropped around
pl330_release_channel() introduce a NULL pointer dereference in
pl330_terminate_all() or pl330_pause()?

The commit notes that pl330_free_chan_resources() and pl330_terminate_all()
can be called concurrently on the same channel. By dropping pl330->lock
around pl330_release_channel(), it is now possible for cpu2 running
pl330_free_chan_resources() to completely finish pl330_release_channel()
and set pch->thread =3D NULL while cpu1 running pl330_terminate_all() is
blocked waiting to acquire pl330->lock.

Once cpu1 acquires pl330->lock, it blindly dereferences pch->thread:

drivers/dma/pl330.c:pl330_terminate_all() {
    ...
    spin_lock(&pl330->lock);
    _stop(pch->thread);
    pch->thread->req[0].desc =3D NULL;
    ...
}

Because pch->thread was set to NULL by cpu2, would this cause an immediate
kernel crash? This seems to trade a deadlock for a NULL pointer dereference
under the same concurrency conditions.

> =20
>  	if (pch->cyclic)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007150104.3825=
3-1-ginger.jzllee@gmail.com?part=3D1
