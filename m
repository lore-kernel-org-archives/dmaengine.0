Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D51379ECD
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 21:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785186427; cv=none; b=sRHdVDK7+vJ7zx/aWwYzxlSnJobIVIhTrU9sKzNKYWNuJ8pbqJnWGfBOczoc26Q6h7BcM1HeDfjjoDvuBr2n4fO5Y0x3PXs5jUbQDyx4z3gNSjvMFm9ArPsZpnwuohPF9l4PCLU+4PFU4q7ucdhLwwe6Z7j5UWFmlecHOGASELQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785186427; c=relaxed/simple;
	bh=Agw4edeb+iVeWs7dy1D7iZnIwe9vN+wVxJPlL4FqEQU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oe9z+/52AOPJcPrBCMJN1aVfqSndGPdY11c1keM/pDVctO7dBbMy0xj5nGgrS3J/zubWeDb9E7w3Xj3ckueRVR1aP11piA2vWJmH3/p3BWbGL7sXtXmsCC2fco6oCwHtP1okMltdWDKlK/2r1GUdcmbABfRLC9Qk4rhvI9qeSt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aPmX48Es; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aPmX48Es"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C84A1F000E9;
	Mon, 27 Jul 2026 21:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785186426;
	bh=9LxWFSfk8uNhYHX/lMME43sZ+ElQxjB5EufHX4DXSTI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aPmX48EsAENvIBJPQ8EQD8nMf6xX5+OM9c4s+lRad+IL+rAkINgfEmXe8YZMS9iBA
	 gI3XaG7Jy8qfm9M8mWeYhDTYP8q1wKuB+EC4CGX3ekJzMgrjuJaHMeR5UXxX7ct1JO
	 n4b5D11uVMXwDxlIHW0NVYK6tja7BRPiS3U/wCYJFksaU1wBoRehS5MvXozH5iMxnx
	 DYeUC2jRkvAkz8auk127lo4D6I1XsETj3ZTaFZ4FYQGrrAOoOGaPVmXeT5YWcfw6vH
	 mq7Rfwgq1rsMYYT7+h6Eet6xSeeY23B4JV3GKB+Av9geatuR5XdXPje4Xh//BUY7yu
	 ppz6keL+UJsjQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 26/64] dmaengine: mpc512x: route callbacks via
 channel BH
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <d2498dfc97d2b38d70ea4aee00126cfbf3b4dbb3.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <d2498dfc97d2b38d70ea4aee00126cfbf3b4dbb3.1785183549.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 21:07:05 +0000
Message-Id: <20260727210706.4C84A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:

New issues:
- [High] Missing dma_chan_kill_bh() in mpc_dma_remove() allows per-channel =
bottom-half workqueue items to outlive the device structures.

Pre-existing issues:
- [High] The error handling path in mpc_dma_probe() fails to cancel the tas=
klet and BH work after the IRQ is registered.
- [High] Concurrent execution of mpc_dma_process_chan_completed() can cause=
 a channel's completed_cookie to regress.
- [High] request_irq() is called before channel locks, lists, and tasklets =
are initialized.
- [High] Releasing a channel with pending completions triggers a BUG_ON() p=
anic due to missing device_synchronize().
- [High] mpc_dma_free_chan_resources() can race with the global fallback mp=
c_dma_process_completed(), leading to a Use-After-Free of DMA descriptors.
- [High] The driver state structure allocated with devm_kzalloc() is freed =
prematurely if the driver is unbound while clients hold channel references.
--

--- Patch [26]: [PATCH v2 26/64] dmaengine: mpc512x: route callbacks via ch=
annel BH ---
commit 57dd5b81d14732d0a29ee229ec6a57e6e3b79c4c
Author: Allen Pais <allen.lkml@gmail.com>
Subject: dmaengine: mpc512x: route callbacks via channel BH

This commit transitions the mpc512x DMA driver from processing completions
entirely in the controller tasklet to scheduling per-channel bottom-half (B=
H)
work. This leaves the tasklet strictly for IRQ and error handling.

> diff --git a/drivers/dma/mpc512x_dma.c b/drivers/dma/mpc512x_dma.c
> index 0adc8e01057e1..552ea72a9108e 100644
> --- a/drivers/dma/mpc512x_dma.c
> +++ b/drivers/dma/mpc512x_dma.c
[ ... ]
> +static void mpc_dma_process_chan_completed(struct mpc_dma_chan *mchan)
> +{
[ ... ]
> +	/* Free descriptors */
> +	spin_lock_irqsave(&mchan->lock, flags);
> +	list_splice_tail_init(&list, &mchan->free);
> +	mchan->chan.completed_cookie =3D last_cookie;
> +	spin_unlock_irqrestore(&mchan->lock, flags);
> +}

[Severity: High]
This is a pre-existing issue, but does this unconditional overwrite of the
completed cookie leave us vulnerable to race conditions?

Since mpc_dma_process_completed() can be called synchronously from
mpc_dma_prep_memcpy(), it can race with the asynchronous processing of the
same channel's completions.

If CPU 1 grabs an older batch of completed descriptors and CPU 2 grabs a
newer batch, CPU 2 might finish executing callbacks first. When CPU 1
finishes, it overwrites mchan->chan.completed_cookie with its older
last_cookie, causing the cookie to regress.

[Severity: High]
This is a pre-existing issue, but could this list splicing race with channel
freeing and cause a use-after-free?

When a client runs out of descriptors, mpc_dma_process_completed() iterates
globally and extracts completed descriptors for another channel.

While the callbacks are executing outside the lock, another client could
concurrently free that channel via mpc_dma_free_chan_resources(), freeing
the coherent TCD memory.

After callbacks finish, splicing the local list back into mchan->free puts
leaked descriptors pointing to freed memory back into circulation.

[ ... ]
> @@ -551,6 +568,8 @@ static void mpc_dma_free_chan_resources(struct dma_ch=
an *chan)
>  	unsigned long flags;
>  	LIST_HEAD(descs);
> =20
> +	dma_chan_kill_bh(&mchan->chan);
> +
>  	spin_lock_irqsave(&mchan->lock, flags);
> =20
>  	/* Channel must be idle */
>  	BUG_ON(!list_empty(&mchan->prepared));
>  	BUG_ON(!list_empty(&mchan->queued));
>  	BUG_ON(!list_empty(&mchan->active));
>  	BUG_ON(!list_empty(&mchan->completed));

[Severity: High]
This is a pre-existing issue, but can this trigger a kernel panic due to
missing synchronization?

When a client terminates a transfer, device_terminate_all() is called,
but it ignores mchan->completed. The core expects device_synchronize()
to wait for pending async tasks, but this driver doesn't implement it.

If mpc_dma_free_chan_resources() is called with pending completions,
the subsequent assertions like BUG_ON(!list_empty(&mchan->completed))
will trigger a panic.

[ ... ]
> @@ -1007,6 +1026,7 @@ static int mpc_dma_probe(struct platform_device *op)
>  		INIT_LIST_HEAD(&mchan->completed);
> =20
>  		spin_lock_init(&mchan->lock);
> +		dma_chan_init_bh(&mchan->chan, mpc_dma_chan_bh);
>  		list_add_tail(&mchan->chan.device_node, &dma->channels);
>  	}

[Severity: High]
Is there a missing cleanup step for these bottom-half work items when the
driver is removed?

The teardown function mpc_dma_remove() correctly calls tasklet_kill(),
but does not cancel or flush these newly added BH work items.

If the driver is unbound while active:

mpc_dma_irq()
  tasklet_schedule(&mdma->tasklet);

mpc_dma_remove()
  tasklet_kill(&mdma->tasklet);

The tasklet's new purpose is to schedule dma_chan_schedule_bh(). These
work items will remain queued and execute asynchronously after the function
returns. Since mdma is allocated via devm_kzalloc(), devres frees it
immediately upon remove returning, causing the orphaned BH work to access
freed memory.

[Severity: High]
This is a pre-existing issue, but does tying the controller structure
lifecycle to the device binding risk a use-after-free?

In mpc_dma_probe(), the struct mpc_dma is allocated using devm_kzalloc(). If
the driver is unbound (e.g., via sysfs), mpc_dma_remove() completes and
devres automatically frees the allocation.

If a DMA client driver is still holding a reference to a channel embedded
in this structure, any subsequent API calls or asynchronous callbacks on
that channel will dereference the freed memory.

[Severity: High]
This is a pre-existing issue, but does the error handling path in
mpc_dma_probe() need to cancel the scheduled tasklet and BH?

If a late initialization step (like dma_async_device_register) fails,
the code jumps to the error labels and frees the IRQ:

err_free2:
    if (mdma->is_mpc8308)
        free_irq(mdma->irq2, mdma);
err_free1:
    free_irq(mdma->irq, mdma);

However, it fails to call tasklet_kill() or dma_chan_kill_bh(). If an
interrupt fired and scheduled the tasklet or BH, they will continue to run
after probe returns and devres frees the mdma structure, leading to a
use-after-free.

[Severity: High]
This is a pre-existing issue, but is it safe to request IRQs before the
device structures are fully initialized?

In mpc_dma_probe(), request_irq() is invoked before the channel lists,
spinlocks, and tasklets are set up.

If the hardware asserts an interrupt immediately, mpc_dma_irq() will run
and attempt to lock mdma->error_status_lock (uninitialized), and schedule
mdma->tasklet (uninitialized), crashing the kernel.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785183549.gi=
t.allen.lkml@gmail.com?part=3D26
