Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794340270;
	b=YqQSnXyUBo8aTo7Nj8xeUDDJchgdCkL3y6ZRCTOb9bqBj4viX38bciM9rFyuw+iTuzhd
	 B3iu+S23Ewjw84uS5ZEnFOSKhOwjhb3jYbnyNG99On4PEkr/gBpTQZB/ctryp9dfDvLcN
	 5Q8VSBaLQkWlfY0J8sFjuzF+HjgPG6fArI8V1yASy2T0oKut4y+DUpJX66V+vM8mOvtO5
	 /TSPLT8LKvyIdMlpJgP5mM4s4e3mGXN/A+vyc0TIpyZx/ZX7qt6QlJrmtDLp9+gsH6CQx
	 jEO4yAxEOigmgDLfHGmgItPvLl9ZkfUvbgT7tXHOyUzjcxvL4+MhxVNcUPV9ObWFnrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794340270;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=O2dy0ZIbFtbGfAB53j3/632YMh57P+mFuoDGOtXa/NQ=;
	b=vQBtNoqEi2C1j36HO9Xtl9r7BBUxsz9MYv5YafKT7u1WQZAeuSG7zn4o5hv2fiHymQpP
	 Rzep9K4g+K9SgtsYegnb1Qr8YFxM8Tlf+IHwDQTFBimfdcj5cLPRQP8GAwI4SzHGhaWDj
	 7wcLRjDgXnjA87ZCsrlzAeI3ko5Ezt44pAmFSlDjSRE84DkXx96BAPiEHC2IXoqqTQhi6
	 HBXzE6WKAHYfJ+3k9uXYpFKCSZfREkM8Rt+oW51gDG811bMkNLxI4kD7UKJVpvR1mTmT+
	 9YDZSJV4lzbwrkM9umQkUw4pMyZ7I16kO6Em1IPy+b/0zYk99zzusJI6gJb5aw2DcZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ePqBY+cp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA749606A320
	for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 19:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ePqBY+cp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24CBE1F0089F;
	Tue, 10 Nov 2026 19:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794340269;
	bh=O2dy0ZIbFtbGfAB53j3/632YMh57P+mFuoDGOtXa/NQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ePqBY+cpHrtTDPEA3SWnuebyAR/iajxnoTCJ4V6z3VIvFYzHMM8K4UHMSVT6rYvxm
	 /1ktYTq+vm3QsmQd8aGNfe63JSwuigXJ7rx6KYiBTBkJwmwm6/WVR9iCqwDOPb5VAk
	 jG4TET6vv0Io+ivN8ly/GSuOy23rLJZGmMWrwutB9j2e0qmq/6CbOi+iwmYdZMJqNY
	 mUk14ky99kXrN7NdW6kRuAZ1GW/StNX6mPiXnhnyU/jGrwQVSGCItv7XazffhQQdpO
	 /Ta+iYforobyel+fWS/Jbrf9u/3KiXVZOsRQmo1MBbobRtwA4kwhx+4hJt3olnAP/3
	 XY+I1eQOYEkYg==
Message-ID: <sashiko-outbox-207685@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 31/33] dmaengine: hidma: defer callbacks via channel
 BH
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <1654bf0a77be77ccf3a2775a838d1accf604ac4e.1794315350.git.allen.lkml@gmail.com>
References: <cover.1794315350.git.allen.lkml@gmail.com>
 <1654bf0a77be77ccf3a2775a838d1accf604ac4e.1794315350.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 19:51:08 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [High] dmaengine: hidma: missing lldev tasklet kill before
  dmaengine_kill_bh()
- [High] dmaengine: hidma: race between hidma_chan_bh() and
  hidma_terminate_channel()
- [Medium] dmaengine: hidma: unconditional BH schedule in
  hidma_callback()
--

commit 2833f6ace610118cc0f61079464819e2cd18fc0f
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: hidma: defer callbacks via channel BH

This commit defers HIDMA descriptor completion processing from
hidma_callback() to per-channel BH work and drains the BH during channel
synchronization, resource freeing, and device removal.

> diff --git a/drivers/dma/qcom/hidma.c b/drivers/dma/qcom/hidma.c
> index 85844965f0d8c..2cde0cd08b1f5 100644
> --- a/drivers/dma/qcom/hidma.c
> +++ b/drivers/dma/qcom/hidma.c

[ ... ]

> @@ -181,7 +188,7 @@ static void hidma_callback(void *data)
>  	}
>  	spin_unlock_irqrestore(&mchan->lock, irqflags);
> =20
> -	hidma_process_completed(mchan);
> +	dmaengine_schedule_bh(&mchan->chan);
> =20
>  	if (queued) {
>  		pm_runtime_mark_last_busy(dmadev->ddev.dev);

[Severity: Medium]
Should dmaengine_schedule_bh(&mchan->chan) only be called when queued is
true?

During hidma_alloc_chan_resources(), hidma_ll_request() synchronously
invokes hidma_callback(mdesc) before mdesc->node is added to any list, so
mdesc->node.next is NULL and queued is false.  Scheduling the BH
unconditionally queues mchan->chan.bh_work during descriptor allocation; if
a later iteration in hidma_alloc_chan_resources() fails, the function
returns an error without calling dmaengine_kill_bh(), leaving
mchan->chan.bh_work pending after dma_chan_get() drops its device and
module references.

[ ... ]

> @@ -529,6 +537,11 @@ static int hidma_terminate_all(struct dma_chan *chan)
>  	return rc;
>  }
> =20
> +static void hidma_synchronize(struct dma_chan *dmach)
> +{
> +	dmaengine_kill_bh(dmach);
> +}
> +
>  static void hidma_free_chan_resources(struct dma_chan *dmach)
>  {
>  	struct hidma_chan *mchan =3D to_hidma_chan(dmach);

[Severity: High]
Can dmadev->lldev->task schedule the channel BH after dmaengine_kill_bh()
returns in hidma_synchronize() and hidma_free_chan_resources()?

In hidma_remove(), tasklet_kill(&dmadev->lldev->task) is called before
dmaengine_kill_bh() because the low-level completion tasklet
(hidma_ll_tre_complete()) is what invokes hidma_callback() and schedules
the BH.  However, neither hidma_synchronize() nor
hidma_free_chan_resources() kills lldev->task first.  If an interrupt fires
just before hidma_ll_disable() masks hardware interrupts in
hidma_terminate_channel(), lldev->task can still be scheduled:

CPU0                                  CPU1 (<softirq>)
hidma_free_chan_resources()
  hidma_terminate_channel()
    hidma_ll_disable()
  dmaengine_kill_bh(dmach)
  spin_lock_irqsave(&mchan->lock)
  list_for_each_entry_safe(...) {
    hidma_ll_free(..., mdesc->tre_ch)
    list_del(&mdesc->node)
    kfree(mdesc)
  }
  spin_unlock_irqrestore(&mchan->lock)
                                      hidma_ll_tre_complete()
                                        tre->callback(tre->data)
                                          hidma_callback(mdesc)
                                            if (mdesc->node.next)
                                              list_move_tail(&mdesc->node,
                                                &mchan->completed)
                                                  <-- use-after-free
                                            dmaengine_schedule_bh()

Because list_del() sets mdesc->node.next to LIST_POISON1 (non-NULL),
hidma_callback() dereferences the freed mdesc, corrupts mchan->completed,
and schedules hidma_chan_bh() on the freed descriptor.  In the
dmaengine_terminate_sync() path, hidma_callback() moves mdesc from
mchan->free to mchan->completed and runs completion callbacks after
hidma_synchronize() has returned.

> @@ -540,6 +553,9 @@ static void hidma_free_chan_resources(struct dma_chan=
 *dmach)
>  	/* terminate running transactions and free descriptors */
>  	hidma_terminate_channel(dmach);
> =20
> +	/* drain completion work before the descriptors go away */
> +	dmaengine_kill_bh(dmach);
> +
>  	spin_lock_irqsave(&mchan->lock, irqflags);
> =20
>  	/* Move data */

[Severity: High]
Can hidma_chan_bh() race with hidma_terminate_channel() and corrupt
mchan->free when dmaengine_kill_bh() is only called after
hidma_terminate_channel()?

Both dmaengine_terminate_sync() (which calls hidma_terminate_all() before
hidma_synchronize()) and hidma_free_chan_resources() enter
hidma_terminate_channel() while hidma_chan_bh() can still be running
hidma_process_completed():

CPU0 (kworker)                        CPU1
hidma_chan_bh()
  hidma_process_completed()
    spin_lock_irqsave(&mchan->lock)
    list_splice_tail_init(
      &mchan->completed, &list)
    spin_unlock_irqrestore(&mchan->lock)
                                      hidma_terminate_channel()
                                        ...
                                        list_for_each_entry_safe(...) {
                                          ...
                                          list_move(&mdesc->node,
                                                    &mchan->free)
    spin_lock_irqsave(&mchan->lock)
    list_move(&mdesc->node,
              &mchan->free)               <-- corrupts mchan->free
    spin_unlock_irqrestore(&mchan->lock)

hidma_terminate_channel() moves descriptors onto mchan->free without
holding mchan->lock:

drivers/dma/qcom/hidma.c:hidma_terminate_channel() {
    ...
	/* return all user requests */
	list_for_each_entry_safe(mdesc, tmp, &list, node) {
		struct dma_async_tx_descriptor *txd =3D &mdesc->desc;

		dma_descriptor_unmap(txd);
		dmaengine_desc_get_callback_invoke(txd, NULL);
		dma_run_dependencies(txd);

		/* move myself to free_list */
		list_move(&mdesc->node, &mchan->free);
	}
    ...
}

Previously hidma_process_completed() ran synchronously inside the tasklet,
Whereas now hidma_chan_bh() runs concurrently on the BH workqueue and can
also call hidma_process_completed() in parallel with the direct
hidma_process_completed() call at the top of hidma_terminate_channel() and
overwrite mchan->last_success after hidma_terminate_channel() resets it to
0.  Killing lldev->task and draining the channel BH inside
hidma_terminate_channel() after hidma_ll_disable() masks interrupts (and
before draining lists and moving descriptors to mchan->free) would avoid
these races.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794315350.gi=
t.allen.lkml@gmail.com?part=3D31
