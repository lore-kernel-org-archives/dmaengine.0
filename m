Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E621A3E639E
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 21:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785186446; cv=none; b=GedC658ADf+KgWGkVMjmr0n/qxo73y8XtxukEjK4QU+/H6daDFj3SmLdge/AGc9hqGDxv/Hdf3rKbTQL3UKubbjzKVAqsksMiTlP37bP85Y8MWtdj7ExI9340b5YQ1ydLvCj7cRCDpY68gY4jhVSiGjY3eIluDI/Oi2s+gTbB6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785186446; c=relaxed/simple;
	bh=4Ryw0YWv8Ih3QcRIbaR96ydwA0Le8DA+Z9xVK8ZZBZM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eUde4EVzaeE/pPqgP1OQHtK4yFh1v+GgnYIpDNEu4PjAxGaj701KDKJNoeFpnhw3TWFMeKSWAY0oWZgljvqa/e3DWVgCalffjwSdTsN3hOBw9WA5cVKbhLOvVPx3RfjTuAZA5WQLHGuoPqIz5Dtq2JUUngPgEvFpvRi4gkE7tv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TTDoJX1P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TTDoJX1P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ADA71F00A3D;
	Mon, 27 Jul 2026 21:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785186444;
	bh=d8IXgpIfU2T23O+AGWWf0YJsfPrbZsGkBco+VEW9DM0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TTDoJX1PZqf/1kbzjGrMqg7/j8Hp6QNySA1UVdENCJN2d8gn9Q37Zap8xMxw5cz5k
	 tuBS2UIit9z2eQkA5iamHV7dC6+omNAsPFosrgYcIJpq57oMr9GsLMmn8NeBBrEUPH
	 VrGZ3vHlQPv09zARUv5T9iV2Bm6Qked5Am5CGW7jA5/scFD96pIyNqzjFNnpoP030K
	 YcukrYiR82Cy/IGnPdqKXV0YniLbtIBfPRNBGEc5bPrnCJ8uD3sOTHgK823Vx/8No5
	 bl5WYhhJn0X0CUnC4veR9X+s4/Vvatk8CLfM1fXIhs6MH9GL98ltZJciIlgqTpggRi
	 yT/cWyPCwjAYw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 31/64] dmaengine: pl330: route callbacks via channel
 BH
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <6043500b5b32bf53eb0cfc4d68e82d5822ac8f60.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <6043500b5b32bf53eb0cfc4d68e82d5822ac8f60.1785183549.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 21:07:24 +0000
Message-Id: <20260727210724.9ADA71F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Calling dma_chan_init_bh() in the dynamic channel allocation path =
triggers a kernel WARN_ON when a channel is freed and subsequently re-alloc=
ated.

Pre-existing issues:
- [High] Concurrent channel error processing can schedule the bottom-half w=
ork after the channel thread is set to NULL during channel release, leading=
 to a NULL pointer dereference.
- [High] The `desc_pool` list in the DMA controller structure is modified w=
ithout holding `pool_lock` in `pl330_tasklet`, leading to linked list corru=
ption.
- [High] Calling `pl330_tasklet` directly from `pl330_issue_pending` causes=
 completed DMA callbacks to run synchronously in the caller's context, lead=
ing to deadlocks.
--

--- Patch [31]: [PATCH v2 31/64] dmaengine: pl330: route callbacks via chan=
nel BH ---
commit 03f651c688fce11fe6da583209843570b5a94019
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: pl330: route callbacks via channel BH

Convert the per-channel tasklet to dma_chan_*_bh while keeping the
controller tasklet for non-callback events.

> diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
> index 25ba84b187041..f4940bd1ab849 100644
> --- a/drivers/dma/pl330.c
> +++ b/drivers/dma/pl330.c
[ ... ]
> @@ -2060,14 +2057,15 @@ static inline void fill_queue(struct dma_pl330_ch=
an *pch)
>  			desc->status =3D DONE;
>  			dev_err(pch->dmac->ddma.dev, "%s:%d Bad Desc(%d)\n",
>  					__func__, __LINE__, desc->txd.cookie);
> -			tasklet_schedule(&pch->task);
> +			dma_chan_schedule_bh(&pch->chan);
>  		}
>  	}
>  }
> =20
> -static void pl330_tasklet(struct tasklet_struct *t)
> +static void pl330_tasklet(struct dma_chan *chan)
>  {
> -	struct dma_pl330_chan *pch =3D from_tasklet(pch, t, task);
> +	struct dma_pl330_chan *pch =3D container_of(chan, struct dma_pl330_chan,
> +						  chan);
>  	struct dma_pl330_desc *desc, *_dt;

[Severity: High]
This is a pre-existing issue, but can this function crash due to a NULL
pointer dereference if it races with a concurrent channel release?

When pl330_free_chan_resources() kills the bottom-half, it sets pch->thread
to NULL:

pl330_free_chan_resources()
    dma_chan_kill_bh(&pch->chan);
    ...
    pl330_release_channel(pch->thread);
    pch->thread =3D NULL;

If a concurrent DMAC tasklet calls dma_pl330_rqcb(), it unconditionally
queues the bottom-half again:

dma_pl330_rqcb()
    dma_chan_schedule_bh(&pch->chan);

Since dma_chan_schedule_bh() is not blocked after kill_bh, the workqueue
could execute pl330_tasklet() on the freed channel. Later in this function,
we acquire a lock via the thread pointer:

pl330_tasklet()
    spin_lock(&pch->thread->dmac->lock);

Would this dereference the NULL thread pointer?

[Severity: High]
This is also a pre-existing issue, but does moving descriptors to the global
desc_pool here corrupt the linked list?

Later in pl330_tasklet(), completed non-cyclic descriptors are moved back to
the global pool:

pl330_tasklet()
    list_move_tail(&desc->node, &pch->dmac->desc_pool);

The pch->dmac->desc_pool list is shared across the controller and normally
protected by pool_lock, but pl330_tasklet() only holds the channel-specific
pch->lock here. Could concurrent modifications to desc_pool from multiple
channels or allocations cause list corruption?

[ ... ]
> @@ -2173,7 +2171,7 @@ static int pl330_alloc_chan_resources(struct dma_ch=
an *chan)
>  		return -ENOMEM;
>  	}
> =20
> -	tasklet_setup(&pch->task, pl330_tasklet);
> +	dma_chan_init_bh(&pch->chan, pl330_tasklet);
> =20
>  	spin_unlock_irqrestore(&pl330->lock, flags);

[Severity: High]
Does initializing the bottom-half work structure here trigger a warning on
subsequent channel allocations?

pl330_alloc_chan_resources() is called each time a DMA client dynamically
requests a channel. When the client releases the channel, dma_chan_kill_bh()
flushes the workqueue but does not clear the bh_work_initialized flag.

If a client requests this same channel again, calling dma_chan_init_bh()
will hit the WARN_ON(chan->bh_work_initialized) guard in the DMA engine cor=
e.
Should this initialization be moved to driver probe time instead?

[ ... ]
> @@ -2490,7 +2488,7 @@ static void pl330_issue_pending(struct dma_chan *ch=
an)
>  	list_splice_tail_init(&pch->submitted_list, &pch->work_list);
>  	spin_unlock_irqrestore(&pch->lock, flags);
> =20
> -	pl330_tasklet(&pch->task);
> +	pl330_tasklet(&pch->chan);
>  }

[Severity: High]
This is a pre-existing issue, but does calling the bottom-half worker
directly from the issue_pending path risk deadlocks?

Clients of the DMA engine API typically call dma_async_issue_pending()
while holding their own spinlocks. By invoking pl330_tasklet() synchronously
here:

pl330_issue_pending()
    pl330_tasklet(&pch->chan);

If any descriptors were marked as DONE by a concurrent IRQ before the
scheduled bottom-half could run, pl330_tasklet() will immediately process
them and invoke their registered client DMA callbacks inline.

If the client callback attempts to acquire the same spinlock the client
already holds, will this cause an AB-BA or AA deadlock?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785183549.gi=
t.allen.lkml@gmail.com?part=3D31
