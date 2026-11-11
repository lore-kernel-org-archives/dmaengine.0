Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794413878;
	b=4q4rg8kU8kyjxH3SGiLFLvjffrh7Zij1KRfXz2DB+r5aoUUH1lJPI1mBp0i4R9zpgRiV
	 +O1vMPAIG6bFVgDkRCHy3zfvaMjK/nUs+FpO/EOMlVsot+JRW2mgIY8X+SbtEHbMVDaVY
	 XnEzS9prH+kC9yyS65yxDA/7hrohb2+95LQ+KqYYDAmHo9/iW/cB2BzPcGV1l3fnYlRdW
	 i+J+aoh1vffl8atKHbsu0mUjyVqximY3jZaf8mbU2MQOwAmfgWWUt9uZ71HwdrdGWjK8b
	 m5Ru81gT9LhRF97IyEMABtNj9202hlB7UQySvrncKB+8R4bENCmdMXbXBUt165GbFLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794413878;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=BJpPLIbmeucN+vIkxcj/0mgsBZYsQdTQIzOJjcy5+4s=;
	b=bUfjjf0rhE9aPQmGfwXIF58dZaVOZk/sDdf2OJ5Qr1JkgOgd5Lm9Hd7DpnFC4nZcaiv4
	 812dRS4oIxe7n6InH8l0D5er9Mv72v8ZUGQuaZAUbl17yLZP8ATE4hzc0ogPMlOM9sKep
	 SksRgSG0R7JE+/XBvmR4/y6ALSjkFhlX4XoBPIrSVDaJaDOojbCrBWugQ0/TW7y999eeu
	 oGNFISLhhJMrwvzUFmy+VERpW2fGB2vkFuF+l4egG9purpaG3MMLt6x14XBqOYuAoHfIl
	 epRLIcRpRD0vcJKobS/rUuyRt2wv6VFGOvMxpVPJBussxIHbDW27XI7kUkwW064axGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b1mfb8Y6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B095A606A321
	for <dmaengine@vger.kernel.org>; Wed, 11 Nov 2026 16:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b1mfb8Y6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 226531F00A05;
	Wed, 11 Nov 2026 16:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794413878;
	bh=BJpPLIbmeucN+vIkxcj/0mgsBZYsQdTQIzOJjcy5+4s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b1mfb8Y6509YLR04MzWJUQGCtBpzcyJw3ndi3uIil7T+O2erOGnTztUuqq4jM5BJk
	 S/ROqZ6FjYFjWByZMkPqnHpySLQTThTKHkRXziHwwb2ViQOW1SAqwGgET3UQb6XtXU
	 6xACxu74JqMVWIN0DP/84ODkrdbP1TQN84ZIwxTvH51i2vh2oEjfuTj5mpGlgNWPUD
	 tEzBtRc26H9HXAfoujJNGLzArNz2j677+uv1VJDt2VAcRIb/h1XJYpUz+L9ejhpm7g
	 AZvwY4hqkqP1WooccOF+p1sF/mxAQCifczVTtVIdmwwdaopKommFK9f2UiqJzLWIPj
	 kQAcqRcE0JV+A==
Message-ID: <sashiko-outbox-209270@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: pl330: report a failed transfer through
 callback_result
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sungho Kim" <sungho.kim@furiosa.ai>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261111152109.1551738-1-sungho.kim@furiosa.ai>
References: <20261111152109.1551738-1-sungho.kim@furiosa.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 16:17:57 +0000
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
- [Medium] dmaengine: pl330: out-of-order completion in fill_queue()
  corrupts pch->result
It also noticed 2 related pre-existing issues this patch does not
introduce:
- [High] dmaengine: pl330: synchronous pl330_tasklet() call in
  pl330_issue_pending() [1]
- [Critical] dmaengine: pl330: desc_pool list corruption in
  pl330_terminate_all() [2]
--

commit 5e7b59c03f80710bfb7ee7db9e4f312f02ac2fb2
Author: Sungho Kim <sungho.kim@furiosa.ai>

dmaengine: pl330: report a failed transfer through callback_result

This commit records descriptor transfer failures in the PL330 driver and
reports DMA_TRANS_ABORTED through callback_result when the last descriptor
of a transaction completes.

> diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
> index 977a9fde80adb..72e83dfdcecbb 100644
> --- a/drivers/dma/pl330.c
> +++ b/drivers/dma/pl330.c

[ ... ]

> @@ -2059,6 +2069,7 @@ static inline void fill_queue(struct dma_pl330_chan=
 *pch)
>  		} else {
>  			/* Unacceptable request */
>  			desc->status =3D DONE;
> +			desc->result =3D DMA_TRANS_ABORTED;
>  			dev_err(pch->dmac->ddma.dev, "%s:%d Bad Desc(%d)\n",
>  					__func__, __LINE__, desc->txd.cookie);
>  			tasklet_schedule(&pch->task);
> @@ -2101,12 +2112,26 @@ static void pl330_tasklet(struct tasklet_struct *=
t)
> =20
>  	while (!list_empty(&pch->completed_list)) {
>  		struct dmaengine_desc_callback cb;
> +		struct dmaengine_result res =3D { .residue =3D 0 };
> =20
>  		desc =3D list_first_entry(&pch->completed_list,
>  					struct dma_pl330_desc, node);
> =20
>  		dmaengine_desc_get_callback(&desc->txd, &cb);
> =20
> +		/*
> +		 * callback_result is only on the last descriptor of a transaction
> +		 * (tx_submit copies just callback to the periods of a cyclic
> +		 * one), so a failure of an earlier descriptor is held on the
> +		 * channel until the last one completes.
> +		 */
> +		if (pch->result =3D=3D DMA_TRANS_NOERROR)
> +			pch->result =3D desc->result;
> +		res.result =3D pch->result;
> +		if (desc->last)
> +			pch->result =3D DMA_TRANS_NOERROR;
> +		desc->result =3D DMA_TRANS_NOERROR;

[Severity: Medium]
Can an out-of-order failure in fill_queue() misattribute pch->result across
descriptors?

When pl330_submit_req() fails with an error other than -EAGAIN (for example
-ENOMEM when a request exceeds the microcode buffer), fill_queue() marks
that descriptor DONE with DMA_TRANS_ABORTED while earlier descriptors on
pch->work_list are still BUSY in the hardware thread:

drivers/dma/pl330.c:pl330_tasklet() {
	list_for_each_entry_safe(desc, _dt, &pch->work_list, node)
		if (desc->status =3D=3D DONE) {
			if (!pch->cyclic)
				dma_cookie_complete(&desc->txd);
			list_move_tail(&desc->node, &pch->completed_list);
		}
}

pl330_tasklet() moves DONE descriptors to pch->completed_list ahead of
earlier BUSY descriptors.  If an earlier transaction's last descriptor is
still BUSY when the first descriptor of the next transaction is rejected by
fill_queue(), the rejected descriptor completes first and sets
pch->result =3D DMA_TRANS_ABORTED, which is then reported and cleared when
the earlier transaction finishes without error.  Similarly, within a
multi-descriptor transaction, if the last descriptor is rejected while an
earlier descriptor is BUSY, callback_result runs before the hardware stops
and resets pch->result to DMA_TRANS_NOERROR; if the in-flight descriptor
later faults, pch->result is left stuck at DMA_TRANS_ABORTED for the next
transaction.

>  		if (pch->cyclic) {
>  			desc->status =3D PREP;
>  			list_move_tail(&desc->node, &pch->work_list);
> @@ -2126,7 +2151,7 @@ static void pl330_tasklet(struct tasklet_struct *t)
> =20
>  		if (dmaengine_desc_callback_valid(&cb)) {
>  			spin_unlock_irqrestore(&pch->lock, flags);
> -			dmaengine_desc_callback_invoke(&cb, NULL);
> +			dmaengine_desc_callback_invoke(&cb, &res);
>  			spin_lock_irqsave(&pch->lock, flags);
>  		}
>  	}

[Severity: High]
This problem wasn't introduced by this patch, but pl330_issue_pending()
calls pl330_tasklet() directly in the caller's context [1], running
completion callbacks synchronously inside dma_async_issue_pending():

drivers/dma/pl330.c:pl330_issue_pending() {
	...
	list_splice_tail_init(&pch->submitted_list, &pch->work_list);
	spin_unlock_irqrestore(&pch->lock, flags);

	pl330_tasklet(&pch->task);
}

If a descriptor on pch->work_list was marked DONE by dma_pl330_rqcb() or
rejected by fill_queue(), a client calling dma_async_issue_pending() under
its own lock deadlocks when its completion callback re-acquires that lock:

  spin_lock(&client->lock)
  <hardirq>
    dma_pl330_rqcb()
      desc->status =3D DONE
      tasklet_schedule(&pch->task)
  dma_async_issue_pending()
    pl330_issue_pending()
      pl330_tasklet(&pch->task)
        dmaengine_desc_callback_invoke()
          client_complete_cb()
            spin_lock(&client->lock)  <-- deadlock

The direct pl330_tasklet() call also races with the scheduled tasklet when
pch->work_list becomes empty, allowing both contexts to set
power_down =3D true and call pm_runtime_put_autosuspend(), underflowing the
controller's runtime PM usage counter.

[ ... ]

> @@ -2295,6 +2321,7 @@ static int pl330_terminate_all(struct dma_chan *cha=
n)
> =20
>  	power_down =3D pch->active;
>  	pch->active =3D false;
> +	pch->result =3D DMA_TRANS_NOERROR;
> =20
>  	/* Mark all desc done */
>  	list_for_each_entry(desc, &pch->submitted_list, node) {

[Severity: Critical]
This problem wasn't introduced by this patch, but pl330_terminate_all() and
pl330_free_chan_resources() splice descriptors back into pl330->desc_pool
without holding pl330->pool_lock [2]:

drivers/dma/pl330.c:pl330_terminate_all() {
	...
	list_splice_tail_init(&pch->submitted_list, &pl330->desc_pool);
	list_splice_tail_init(&pch->work_list, &pl330->desc_pool);
	list_splice_tail_init(&pch->completed_list, &pl330->desc_pool);
	spin_unlock_irqrestore(&pch->lock, flags);
	...
}

drivers/dma/pl330.c:pl330_free_chan_resources() {
	...
	spin_lock_irqsave(&pl330->lock, flags);
	...
	if (pch->cyclic)
		list_splice_tail_init(&pch->work_list, &pch->dmac->desc_pool);

	spin_unlock_irqrestore(&pl330->lock, flags);
	...
}

Can this corrupt pl330->desc_pool when another channel concurrently
allocates or frees descriptors under pl330->pool_lock via pluck_desc() or
add_desc()?

CPU0                              CPU1
pl330_terminate_all()             pl330_get_desc()
  spin_lock_irqsave(&pch->lock)     pluck_desc(&pl330->desc_pool,
                                               &pl330->pool_lock)
                                      spin_lock_irqsave(&pl330->pool_lock)
  list_splice_tail_init(...,          list_del_init(&desc->node)
    &pl330->desc_pool)                  <-- concurrent list mutation
                                      spin_unlock_irqrestore(&pl330->pool_l=
ock)
  spin_unlock_irqrestore(&pch->lock)

[1] https://sashiko.dev/#/bug/linux-130356b0-b34d-4ec8-b462-9a2ed651bcf4
[2] https://sashiko.dev/#/bug/linux-ecddac4a-242e-4dfb-895d-8ed9e5e87844

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111152109.1551=
738-1-sungho.kim@furiosa.ai?part=3D1
