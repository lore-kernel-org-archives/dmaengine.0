Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D84C3CB552
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 21:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785186562; cv=none; b=aTrVX/0fr2UMmdSp+tIV4sTgCXDu+DgAyLDvHl+NltOQc/uwMOyD1eEe5XEJ/V1wubRSkzuSZPQNRCpMjmZsJoFHdUhM1C3g+dLygyMBqGRSue0MS0Q2FxQHatdWIMVZM2cpRPZLt1S7lUZYv7+hjLnZ6zcbWLDBoLJJ8HtwBBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785186562; c=relaxed/simple;
	bh=+sk6mMYrESkDx31BMTBGdZ9jtiospBWiu0Bvx1zL2/k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=azApytRp4acK1TXsvIctakFhhEksBPXL8lnrkFiBV79YjjQJDWPBWg1VYFwmqGl5yGr+x29RKM2JdHByNIlyJy+SinL6yUzGAgyl1+7XsQ8b24n4vU5/4Y40Eqt3UvkEVqfiSjtOjmt5pc+ZX0Hwo5Q3EzG7RHGcUQ+kHHnU+7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E3DT546H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E3DT546H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39E351F000E9;
	Mon, 27 Jul 2026 21:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785186561;
	bh=/UCgz5WdkhxJGRxtkz8f01BFLWaVw7ju6eVwwj2xGVE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E3DT546Hn34H3LgMXYiFjnXcXPgEddpUezLADoiSScmkLXx4VvJdtYBv6bdSozGI0
	 zkPYNWhmOSQUqkeiyycF+FyEixWCU63HDW+wJmzlUNAk3Jd2JgdMkuFgPJVBjNktH4
	 jdUWYxtAhdXiAnEQ5Y2m8vXYcD//1+S45AON+97DyQOWG7IXgTZCJkZpS6OkDQKvUX
	 VKSfXuuoEjqiP0IOETQiMXb3zceRXCIM/72zpknXcRZ7Zn5gbBO1Y+RiurOG1nMW7f
	 CiPmuB1ceLtNf3pvbWjNW+ZnDx+ulR6izHFi6E5v45hnymPU2nkGnfnJmSU82EGBzW
	 p9ibvgoniu9BQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 28/64] dmaengine: plx_dma: use channel BH helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <f2aa736ef2d9422717ab798cd38bcc405eefa94b.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <f2aa736ef2d9422717ab798cd38bcc405eefa94b.1785183549.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 21:09:20 +0000
Message-Id: <20260727210921.39E351F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Deadlock risk due to invoking DMA client callbacks with a spinlock=
 held.
- [High] Deadlock risk due to inadequate lock context (plain spin_lock inst=
ead of spin_lock_bh) exposing the lock to softirq preemption.
- [High] Unbounded spinning (1000ms busy-wait) inside an RCU read-side crit=
ical section.
- [High] plx_dma_prep_memcpy() acquires a spinlock and returns with it held=
, violating locking and API rules.
- [High] The device IRQ is requested before the MMIO base pointer (`plxdev-=
>bar`) is initialized, causing a potential NULL pointer dereference.
--

--- Patch [28]: [PATCH v2 28/64] dmaengine: plx_dma: use channel BH helpers=
 ---
commit 978a06c861c9b53f0d972a684863de23c7d55eb8
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: plx_dma: use channel BH helpers

Replace the device tasklet with the per-channel BH helper so completion
callbacks run via dma_chan_*_bh.

> diff --git a/drivers/dma/plx_dma.c b/drivers/dma/plx_dma.c
> index 84941a918b01f..9d6bbdfa5a698 100644
> --- a/drivers/dma/plx_dma.c
> +++ b/drivers/dma/plx_dma.c
[ ... ]
> @@ -241,9 +240,10 @@ static void plx_dma_stop(struct plx_dma_dev *plxdev)
>  	rcu_read_unlock();
>  }

[Severity: High]
This isn't a bug introduced by this patch, but can this busy-wait loop
cause issues within the RCU read-side critical section?

plx_dma_stop() initiates an RCU read-side critical section and then calls
__plx_dma_stop():

plx_dma_stop()
{
    rcu_read_lock();
    ...
    __plx_dma_stop(plxdev);
}

__plx_dma_stop() then executes a busy-wait loop for up to 1000ms:

__plx_dma_stop()
{
    while (!time_after(jiffies, timeout)) {
        if (val & PLX_REG_CTRL_GRACEFUL_PAUSE_DONE)
            break;
        cpu_relax();
    }
}

Executing a 1-second busy loop inside an RCU read-side critical section cou=
ld
lead to severe scheduling latency or RCU stalls.

> -static void plx_dma_desc_task(struct tasklet_struct *t)
> +static void plx_dma_desc_task(struct dma_chan *chan)
>  {
> -	struct plx_dma_dev *plxdev =3D from_tasklet(plxdev, t, desc_task);
> +	struct plx_dma_dev *plxdev =3D container_of(chan, struct plx_dma_dev,
> +						  dma_chan);
> =20
>  	plx_dma_process_desc(plxdev);
>  }

[Severity: High]
This isn't a bug introduced by this patch, but could plx_dma_process_desc()
lead to a deadlock?

A client DMA driver submitting a new DMA request from within its completion
callback might cause a self-deadlock. The callback is invoked in
plx_dma_process_desc() while holding the ring_lock:

plx_dma_process_desc()
{
    spin_lock(&plxdev->ring_lock);
    ...
    dmaengine_desc_get_callback_invoke(&desc->txd, &res);
}

If the client's callback calls dmaengine_prep_dma_memcpy(), it will invoke
plx_dma_prep_memcpy() which attempts to acquire the same ring_lock.

[Severity: High]
This is also a pre-existing issue, but does ring_lock need to be acquired
with bottom halves disabled?

If a process context function like plx_dma_tx_status() calls
plx_dma_process_desc() and acquires ring_lock without disabling bottom halv=
es:

plx_dma_process_desc()
{
    spin_lock(&plxdev->ring_lock);
}

A hardware interrupt could fire, and the softirq handler would then execute
plx_dma_desc_task() -> plx_dma_process_desc() on the same CPU, attempting
to acquire the already-held ring_lock, which could result in a hard deadloc=
k.

[ ... ]
> @@ -510,7 +510,7 @@ static int plx_dma_create(struct pci_dev *pdev)
>  		goto free_plx;
> =20
>  	spin_lock_init(&plxdev->ring_lock);
> -	tasklet_setup(&plxdev->desc_task, plx_dma_desc_task);
> +	dma_chan_init_bh(&plxdev->dma_chan, plx_dma_desc_task);
> =20
>  	RCU_INIT_POINTER(plxdev->pdev, pdev);
>  	plxdev->bar =3D pcim_iomap_table(pdev)[0];

[Severity: High]
This isn't a bug introduced by this patch, but is there a race condition
during initialization?

The interrupt handler is registered before the MMIO region pointer is
initialized:

plx_dma_create()
{
    rc =3D request_irq(pci_irq_vector(pdev, 0), plx_dma_isr, ...);
    ...
    plxdev->bar =3D pcim_iomap_table(pdev)[0];
}

If an interrupt fires immediately after request_irq(), plx_dma_isr() could
read from plxdev->bar, which would still be an uninitialized pointer:

plx_dma_isr()
{
    status =3D readw(plxdev->bar + PLX_REG_INTR_STATUS);
}

[Severity: High]
This is another pre-existing issue outside the diff context, but does
plx_dma_prep_memcpy() intentionally return with the ring_lock held?

plx_dma_prep_memcpy() acquires the lock but returns without releasing it:

plx_dma_prep_memcpy()
{
    spin_lock_bh(&plxdev->ring_lock);
    ...
    return &plxdesc->txd;
}

The lock appears to only be released later in plx_dma_tx_submit(). If a cli=
ent
prepares multiple descriptors before submitting, it might self-deadlock
trying to acquire the lock a second time. If it sleeps between prep and
submit, it would be sleeping in an atomic context.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785183549.gi=
t.allen.lkml@gmail.com?part=3D28
