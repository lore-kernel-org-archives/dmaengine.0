Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794336246;
	b=Yqq8XzppRBeVvcxveHK5EQFpq3PMwxnA+l6EBPZd3fEeTZT993nkBs+/fX30B82vB9A8
	 4DKGk15Gv0d8ft84zm+lf7bzBSH9avGZEiWJ7RHgVlmZxwqZ08uMAvVU6JgruwrNAe/EL
	 wveLSorxW2cNqAD/xa2Acx/dx3tJ7i4Oq2AHTAHmHwi629EBABF4L9qiXw1wsvX+5bojX
	 8KhvULgJCAq4p3Za9jAJ/48xHWn5f5Kt3gQa8yYzC95hKSmnmNFItcwBxD5DjgEg+fQnl
	 aWKf4Uf0nH7Z/kl0Gmc8xKQ6h7SgF+5VAgTB9ANmcIRB3KNbdoWkpiqjfJH9cFaPltg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794336246;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=eVtuTVbvNeheIF1MbvTX7bbkFlRrVXVzdwy/UnuvXuQ=;
	b=zdtYLhe2OwlcadG6aqkCdx7M1M4MwcWNVOunFMi82uQGukaji8Z+cxVj+ojAOlGlC6SW
	 XjwndmCAPgQXC9ywWmx3Ots51xi4Wvm8dxuDLsgF+AQm64cgQ6JkxakOzi9FE6RQXEvB0
	 UaGrQf1yIM63NM3c+iOEj11gg2+mVEV5lFywAIsjWOzq2oqJs1yJqPOD+rZUqqowLbx6L
	 +XeVWQxPgPRNHuCXvJ+Daqodjyvo9Q19LTeMeBmUJq6kg4FxDH8I4onJ/Yts4+9V6T7o0
	 1OxPhIar2r6Uu2OG37FElyVF000GaGltc/W/q7NC+OR0hdZBHkiYmroYHL8L7nr9EJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GB7p3nIx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE00606A31C
	for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 18:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GB7p3nIx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 911C51F0089F;
	Tue, 10 Nov 2026 18:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794336245;
	bh=eVtuTVbvNeheIF1MbvTX7bbkFlRrVXVzdwy/UnuvXuQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GB7p3nIxop9kIdtG5hyjjYGgdEngvJHqIhz2P+NCDPgTsfaH/zrYJVBn4ftKStSc/
	 DP1ZbiAx3nnIZLarAfh4nRCxkv7mvQlgytuhyvUgq9pnB1jfBYC7uxJM2rpYda5Ki/
	 UJzryhQjbBZNnutgiO4MC3AQEA+ZUrRovhaTwqOT02ediFgO6/yAOZHHgN474GyJ5v
	 YUgumUdiEjmnrVjhnnCEoHPJiZDHf3gk5HcQllrmsI9TCPX84dwHeZEMmKQgm4PSMo
	 fUfe9hxT/ce6P/Nh8LsJBMXopQoM1Pr6v7gdUpMUMf/ODWizVMuSCC2xp19TH4GRuO
	 3ztoxkZTF065g==
Message-ID: <sashiko-outbox-207602@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 26/33] dmaengine: mpc512x: route callbacks via
 channel BH
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <051bf57158a5c5ae82d0b7babeefd951c3ba85a7.1794315350.git.allen.lkml@gmail.com>
References: <cover.1794315350.git.allen.lkml@gmail.com>
 <051bf57158a5c5ae82d0b7babeefd951c3ba85a7.1794315350.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 18:44:05 +0000
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
- [High] dmaengine: mpc512x: race with mdma->tasklet in
  mpc_dma_free_chan_resources()
- [High] dmaengine: mpc512x: unsynchronized completion processing in
  prep paths
- [Medium] dmaengine: mpc512x: missing tasklet and BH cleanup in
  mpc_dma_probe()
--

commit d182185a8446cc183109b376f9fcf9d84e3788ed
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: mpc512x: route callbacks via channel BH

This commit moves completed descriptor processing and callback execution
from the controller tasklet into per-channel BH work items, and drains
those BH work items during channel resource teardown and driver removal.

> diff --git a/drivers/dma/mpc512x_dma.c b/drivers/dma/mpc512x_dma.c
> index f67421f2d6d3e..b6a1b3c94da41 100644
> --- a/drivers/dma/mpc512x_dma.c
> +++ b/drivers/dma/mpc512x_dma.c
> @@ -372,45 +372,47 @@ static irqreturn_t mpc_dma_irq(int irq, void *data)
>  	return IRQ_HANDLED;
>  }
> =20
> -/* process completed descriptors */
> -static void mpc_dma_process_completed(struct mpc_dma *mdma)
> +static void mpc_dma_process_chan_completed(struct mpc_dma_chan *mchan)
>  {
>  	dma_cookie_t last_cookie =3D 0;
> -	struct mpc_dma_chan *mchan;
>  	struct mpc_dma_desc *mdesc;
>  	struct dma_async_tx_descriptor *desc;
>  	unsigned long flags;
>  	LIST_HEAD(list);
> -	int i;
> =20
> -	for (i =3D 0; i < mdma->dma.chancnt; i++) {
> -		mchan =3D &mdma->channels[i];
> +	/* Get all completed descriptors */
> +	spin_lock_irqsave(&mchan->lock, flags);
> +	if (!list_empty(&mchan->completed))
> +		list_splice_tail_init(&mchan->completed, &list);
> +	spin_unlock_irqrestore(&mchan->lock, flags);
> =20
> -		/* Get all completed descriptors */
> -		spin_lock_irqsave(&mchan->lock, flags);
> -		if (!list_empty(&mchan->completed))
> -			list_splice_tail_init(&mchan->completed, &list);
> -		spin_unlock_irqrestore(&mchan->lock, flags);
> +	if (list_empty(&list))
> +		return;
> =20
> -		if (list_empty(&list))
> -			continue;
> +	/* Execute callbacks and run dependencies */
> +	list_for_each_entry(mdesc, &list, node) {
> +		desc =3D &mdesc->desc;
> =20
> -		/* Execute callbacks and run dependencies */
> -		list_for_each_entry(mdesc, &list, node) {
> -			desc =3D &mdesc->desc;
> +		dmaengine_desc_get_callback_invoke(desc, NULL);
> =20
> -			dmaengine_desc_get_callback_invoke(desc, NULL);
> +		last_cookie =3D desc->cookie;
> +		dma_run_dependencies(desc);
> +	}
> =20
> -			last_cookie =3D desc->cookie;
> -			dma_run_dependencies(desc);
> -		}
> +	/* Free descriptors */
> +	spin_lock_irqsave(&mchan->lock, flags);
> +	list_splice_tail_init(&list, &mchan->free);
> +	mchan->chan.completed_cookie =3D last_cookie;
> +	spin_unlock_irqrestore(&mchan->lock, flags);
> +}
> =20
> -		/* Free descriptors */
> -		spin_lock_irqsave(&mchan->lock, flags);
> -		list_splice_tail_init(&list, &mchan->free);
> -		mchan->chan.completed_cookie =3D last_cookie;
> -		spin_unlock_irqrestore(&mchan->lock, flags);
> -	}
> +/* process completed descriptors */
> +static void mpc_dma_process_completed(struct mpc_dma *mdma)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < mdma->dma.chancnt; i++)
> +		mpc_dma_process_chan_completed(&mdma->channels[i]);
>  }

[Severity: High]
Can calling mpc_dma_process_completed() from mpc_dma_prep_memcpy() and
mpc_dma_prep_slave_sg() race with mpc_dma_chan_bh()?

When mchan->free is empty, both prep functions call
mpc_dma_process_completed(mdma) synchronously across all channels:

drivers/dma/mpc512x_dma.c:mpc_dma_prep_memcpy() {
    ...
	if (!mdesc) {
		/* try to free completed descriptors */
		mpc_dma_process_completed(mdma);
		return NULL;
	}
    ...
}

Because mpc_dma_process_chan_completed() drops mchan->lock while running
callbacks and only returns descriptors to mchan->free afterwards, a
concurrent prep call (or a callback itself) can enter
mpc_dma_process_chan_completed() for a second batch of completed
descriptors:

CPU0 (kworker)                        CPU1
mpc_dma_chan_bh()
  mpc_dma_process_chan_completed()
    spin_lock_irqsave(&mchan->lock)
    list_splice_tail_init(...)
    /* batch 1, cookie N */
    spin_unlock_irqrestore(...)
    dmaengine_desc_get_callback_invoke()
                                      mpc_dma_prep_memcpy()
                                        /* mchan->free is empty */
                                        mpc_dma_process_completed()
                                          mpc_dma_process_chan_completed()
                                            /* splices batch 2, cookie N+1 =
*/
                                            dmaengine_desc_get_callback_inv=
oke()
                                            /* callbacks run out of order */
                                            mchan->chan.completed_cookie =
=3D N+1
    spin_lock_irqsave(&mchan->lock)
    mchan->chan.completed_cookie =3D N  <-- completed_cookie moves backward
    spin_unlock_irqrestore(...)

When completed_cookie regresses to N, dma_cookie_status() reports cookie
N+1 as DMA_IN_PROGRESS indefinitely.  In addition, because
mpc_dma_process_completed() iterates over all channels outside the BH
workqueue, a prep call on one channel can run
mpc_dma_process_chan_completed() on another channel concurrently with
mpc_dma_free_chan_resources() after dmaengine_kill_bh() has returned.

[ ... ]

> @@ -551,6 +568,8 @@ static void mpc_dma_free_chan_resources(struct dma_ch=
an *chan)
>  	unsigned long flags;
>  	LIST_HEAD(descs);
> =20
> +	dmaengine_kill_bh(&mchan->chan);
> +
>  	spin_lock_irqsave(&mchan->lock, flags);
> =20
>  	/* Channel must be idle */

[Severity: High]
Can mpc_dma_free_chan_resources() race with mdma->tasklet because
mpc_dma_irq() schedules mdma->tasklet first rather than scheduling
mchan->chan.bh_work directly?

When a transfer completes, mpc_dma_irq_process() moves descriptors onto
mchan->completed and mpc_dma_irq() calls tasklet_schedule(&mdma->tasklet);
mchan->chan.bh_work is only queued later when mpc_dma_tasklet() runs.  Note
that mpc_dma_device_terminate_all() only splices prepared, queued, and
active into mchan->free, leaving mchan->completed untouched.

CPU0                                  CPU1
<hardirq>
  mpc_dma_irq()
    mpc_dma_irq_process()
      /* moves desc to mchan->completed */
    tasklet_schedule(&mdma->tasklet)
                                      mpc_dma_free_chan_resources()
                                        dmaengine_kill_bh(&mchan->chan)
                                        /* bh_work not scheduled yet */
                                        spin_lock_irqsave(&mchan->lock)
                                        BUG_ON(!list_empty(&mchan->complete=
d))
                                          <-- kernel BUG

Alternatively, if mpc_dma_tasklet() schedules mchan->chan.bh_work right
after dmaengine_kill_bh() returns and mpc_dma_process_chan_completed()
splices mchan->completed into its local list before
mpc_dma_free_chan_resources() takes mchan->lock,
mpc_dma_free_chan_resources() frees mchan->tcd and the descriptors while
mpc_dma_process_chan_completed() runs callbacks and splices the freed
descriptors back onto mchan->free.

> @@ -1007,6 +1026,7 @@ static int mpc_dma_probe(struct platform_device *op)
>  		INIT_LIST_HEAD(&mchan->completed);
> =20
>  		spin_lock_init(&mchan->lock);
> +		dmaengine_init_bh(&mchan->chan, mpc_dma_chan_bh);
>  		list_add_tail(&mchan->chan.device_node, &dma->channels);
>  	}
> =20

[Severity: Medium]
If dma_async_device_register() fails in mpc_dma_probe(), can a pending
tasklet or channel BH work item run after mdma is freed?

mpc_dma_probe() requests mdma->irq and mdma->irq2 before initializing the
channels and mdma->tasklet, and dma_async_device_register() can invoke
mpc_dma_alloc_chan_resources() (enabling channel error interrupts) before
failing on a later step:

drivers/dma/mpc512x_dma.c:mpc_dma_probe() {
    ...
	retval =3D dma_async_device_register(dma);
	if (retval)
		goto err_free2;
    ...
err_free2:
	if (mdma->is_mpc8308)
		free_irq(mdma->irq2, mdma);
err_free1:
	free_irq(mdma->irq, mdma);
err_dispose2:
	if (mdma->is_mpc8308)
		irq_dispose_mapping(mdma->irq2);
err_dispose1:
	irq_dispose_mapping(mdma->irq);
err:
	return retval;
}

Unlike mpc_dma_remove(), the err_free2 error path does not call
tasklet_kill() or dmaengine_kill_bh() before devres unmaps mdma->regs and
frees mdma, which can cause a use-after-free if an interrupt scheduled the
tasklet or BH work before free_irq() completed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794315350.gi=
t.allen.lkml@gmail.com?part=3D26
