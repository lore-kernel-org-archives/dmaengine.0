Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794330495;
	b=un6cTfpdpC4lItFziaLwA1+gowwwzkWyl/eyy55P6Haw2tjde1LiV9kwRpjBnf3rxeKB
	 9R3Ngz+5vipF10ZRqqEo/krpuIcsDrcfDC7p4Du+Pz4tKhjJ1NUHlF/xZX8kb9ZAbXQFk
	 F1QCtCyp8ZcrgdaraYTrdLF9MOUUGTmrshSsuMu9knXz0sS94fUEyf466HigbybyPNejC
	 tDzAxaOFhQgf/LGxu5vLtM5uzZiStOjVUIWqKg1s7LtT2ZE4Tp1R4NNmqVviDIwvMFlm1
	 avUsUUyoFhOc67PK7mPwFpOvwq05IHPn0LJpEPyC2iCsjhJBVRSIhpQjWJwJPE1JBrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794330495;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9OSa3hztso1VuZiZBkt4Ji5dmiJxSJPOfDR1ph3wrV4=;
	b=UUQdRVsS831V+dR3Pi/GzyepxLhEvIU7gaE8YC7M+M+Hu23HbRNEWs8MdSReTT4gBUSZ
	 aoV6W2JZ/cS9YmM8L7RsJYe+mBgmBjWJHlyB+xoM2nqAgoy2wp+cT/OSbeyM7VCgtoOgh
	 VHCU9Zgc5V8UDA0jkOY9YaJnckPtSPKh3HU2mRF6HrZFNHWVW7gPOBmxVhr5QCArrdPXc
	 IWChBGzju7n7timvvnvyIAWwDCGRzVhIbpoRsudCvbI8RTM/U3I5JsS29Xke+veni7Ufq
	 qhT6Vh1kcKO8JPJm+o1jZZP/Fiilzc4/pPXUK6K/CzkfC+iG71vDFE2Vmrzw3xsyTkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XY7igea+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F824606A31C
	for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 17:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XY7igea+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09A831F008A1;
	Tue, 10 Nov 2026 17:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794330495;
	bh=9OSa3hztso1VuZiZBkt4Ji5dmiJxSJPOfDR1ph3wrV4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XY7igea+pI3F7aTf7ORFuAJqWYsZ+ZxpvYCWoI0DPoqOM4krxXUyOQlWcT4qnuQqZ
	 02QOzNSrJbzbUmYhLneS2orI1agAG7cibHnvoKXJJ4eZsBYs7+TNa81XHXlXKiO9Qj
	 exiQJuER01JRO6RGm8S5rABdKcIUFfiu4ohuzWfhBmFONmgSm6im262l46CtRPyUXZ
	 M+iL90ugfO5h5mZjHp5tHqwQZYz3TI/7YR8UuKYwQPcZ4YMJms+uBzwq2no41j1/4i
	 qgeh4YK2A16+d1heUQPSz8GAkwiBclC6ktSWjalQOj6QD4s79AZ1LF4fQeWdioj0NY
	 X6UBTl1dmhGpw==
Message-ID: <sashiko-outbox-207449@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 17/33] dmaengine: ste_dma40: convert per-channel
 tasklet to dmaengine BH
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <33ed46c14f6be61dd5c839b3b307512749e0d067.1794315350.git.allen.lkml@gmail.com>
References: <cover.1794315350.git.allen.lkml@gmail.com>
 <33ed46c14f6be61dd5c839b3b307512749e0d067.1794315350.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 17:08:14 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] dmaengine: ste_dma40: incomplete BH teardown in d40_kill_bh()
  on self-requeue
--

commit 04d3037c70d29e8460f8499e686daa8b7686fd6c
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: ste_dma40: convert per-channel tasklet to dmaengine BH

This commit replaces the per-channel tasklet in ste_dma40 with the shared
dmaengine bottom-half helper.

> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index 8b89d44f9b0d3..a06008d8dd275 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c

[ ... ]

> @@ -1730,13 +1727,13 @@ static void dma_tc_handle(struct d40_chan *d40c)
>  	}
> =20
>  	d40c->pending_tx +=3D callbacks;
> -	tasklet_schedule(&d40c->tasklet);
> +	dmaengine_schedule_bh(&d40c->chan);
> =20
>  }
> =20
> -static void dma_tasklet(struct tasklet_struct *t)
> +static void dma_tasklet(struct dma_chan *chan)
>  {
> -	struct d40_chan *d40c =3D from_tasklet(d40c, t, tasklet);
> +	struct d40_chan *d40c =3D container_of(chan, struct d40_chan, chan);
>  	struct d40_desc *d40d;
>  	unsigned long flags;
>  	bool callback_active;
> @@ -1786,7 +1783,7 @@ static void dma_tasklet(struct tasklet_struct *t)
>  	d40c->pending_tx--;
> =20
>  	if (d40c->pending_tx)
> -		tasklet_schedule(&d40c->tasklet);
> +		dmaengine_schedule_bh(&d40c->chan);
> =20
>  	spin_unlock_irqrestore(&d40c->lock, flags);
> =20
> @@ -3076,14 +3073,14 @@ static void __init d40_chan_init(struct d40_base =
*base, struct dma_device *dma,
>  		INIT_LIST_HEAD(&d40c->client);
>  		INIT_LIST_HEAD(&d40c->prepare_queue);
> =20
> -		tasklet_setup(&d40c->tasklet, dma_tasklet);
> +		dmaengine_init_bh(&d40c->chan, dma_tasklet);
> =20
>  		list_add_tail(&d40c->chan.device_node,
>  			      &dma->channels);
>  	}
>  }
> =20
> -static void d40_kill_tasklets(void *data)
> +static void d40_kill_bh(void *data)
>  {
>  	struct dma_device *dma =3D data;
>  	struct d40_chan *d40c;
> @@ -3091,7 +3088,7 @@ static void d40_kill_tasklets(void *data)
> =20
>  	list_for_each_entry(chan, &dma->channels, device_node) {
>  		d40c =3D container_of(chan, struct d40_chan, chan);
> -		tasklet_kill(&d40c->tasklet);
> +		dmaengine_kill_bh(&d40c->chan);
>  	}
>  }

[Severity: Medium]
Can d40_kill_bh() return while d40c->chan.bh_work is still queued if
dma_tasklet() re-schedules itself?

dma_tasklet() processes a single transfer per invocation and calls
dmaengine_schedule_bh(&d40c->chan) when d40c->pending_tx remains non-zero
(for instance, after multiple elapsed cyclic periods in dma_tc_handle()).
Previously, tasklet_kill() held TASKLET_STATE_SCHED while waiting for
TASKLET_STATE_RUN to clear, preventing dma_tasklet() from re-scheduling
itself during teardown.

dmaengine_kill_bh() calls dmaengine_flush_bh_work(), which only runs
flush_work(&chan->bh_work).  Because process_one_work() clears
WORK_STRUCT_PENDING_BIT before invoking dma_tasklet(), a self-requeue in
dma_tasklet() queues chan->bh_work behind the flush barrier:

CPU0                                  CPU1 (dmaengine_bh_wq)
d40_kill_bh()
  dmaengine_kill_bh(&d40c->chan)
    flush_work(&chan->bh_work)
                                      process_one_work()
                                        dma_tasklet()
                                          d40c->pending_tx--;
                                          if (d40c->pending_tx)
                                            dmaengine_schedule_bh(...)
      /* flush barrier completes */
destroy_cache() / devres release
                                      process_one_work()
                                        dma_tasklet()  <-- use-after-free

When d40_kill_bh() runs during probe unwind, d40c->chan.bh_work can
execute after base->desc_slab, base->lcla_pool, and base have been freed,
causing a use-after-free.  Using disable_work_sync() or cancel_work_sync()
in dmaengine_kill_bh(), or draining all pending transfers inside
dma_tasklet() instead of re-scheduling, would avoid leaving bh_work queued
after teardown.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794315350.gi=
t.allen.lkml@gmail.com?part=3D17
