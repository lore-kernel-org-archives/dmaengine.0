Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85EFE434E4A
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786387167; cv=none; b=NCrxA9eVWpDmzbgqgr4fH+JrJ6dPDzUOW20buFzaqAQgda4gmqbKRN68+01rZUHmcz92ZV/aJ8yBRHRjj8uRqYjrrjr+70l07aIpXVTDOeHGg/dCrGrTK99EIgrl56d8j6AszZyhToHQpeaZm6zOOBgOsdYbqWSlmxLIlcMGTgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786387167; c=relaxed/simple;
	bh=5Ot83jQadG9MTudYg2foPjZENd0XVNdcX7MFUIl+Jc4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nIv86sBL2qQ39J+vIrZf/iHPzmBBLTQyLgnD6qsgYa9+nGT47MtmwoTzxhmk4SRqRKC4Dp/qLVaxQvsL+MlmFN8sUuaOjxhC9fToZL1birpvAkSrB1YHuf616KqpZSYXX3W0d17IoXQkJDMM9TqFcB/IYhPscKfi9xXj3eU026E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SqAhTCYz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SqAhTCYz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3479B1F000E9;
	Mon, 10 Aug 2026 18:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786387166;
	bh=GE31Bvxac2gp+TheqSoQQ42XlRG/wu+DzUVXQjcrqp8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SqAhTCYzFIo2ZddKyTwtETd8tNDQ0p6/+3VGmrcY8w5GAb9DdZQE0aXvLJ0s0zvIH
	 Ht/nAmr2WgwjR/M1knroP0+RtWiCeglIOc1vzQdo8T/i4uY0Oqqj+qCgAmNK6nrUQl
	 CuWMDjhLQ/HG4yjyER+2jsmc7Ibc5/7toME+qPSQq7fYozsg6X3oIE7NW21VvgCzld
	 OYsO6SufQ7Itbf7qnj1tisazkB7MoruEz6nGhBsGzb2UYZZdKvI0xlIaoiOfOUzyIh
	 Ia90YTWx8rJRRdrJmVSzQYlOBTQQ+fzZV2vL6xcUxBh6HpUpGzQ+GT62tDHp31tu2n
	 LNVHz86I/QaSw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 29/34] dmaengine: pl330: route callbacks via channel
 BH
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <98b9e66a1ac9f866f36ecc60d287e479bae22f60.1786384169.git.allen.lkml@gmail.com>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <98b9e66a1ac9f866f36ecc60d287e479bae22f60.1786384169.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 18:39:25 +0000
Message-Id: <20260810183926.3479B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Calling dmaengine_init_bh() dynamically inside pl330_alloc_chan_re=
sources() causes a kernel WARN_ON when a channel is freed and requested aga=
in.

Pre-existing issues:
- [High] Re-issuing a DMA request from within a completion callback causes =
an unbalanced PM runtime counter, potentially suspending the device mid-tra=
nsfer.
--

--- Patch [29]: [PATCH v3 29/34] dmaengine: pl330: route callbacks via chan=
nel BH ---
commit 1ceab77643ee2c8f72930ed84f7872c29a5db235
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: pl330: route callbacks via channel BH

Convert the per-channel tasklet to dmaengine_*_bh while keeping the
controller tasklet for non-callback events.

> diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
> index 25ba84b187041..1b6069ba0d5e3 100644
> --- a/drivers/dma/pl330.c
> +++ b/drivers/dma/pl330.c
[ ... ]
> @@ -2060,14 +2057,15 @@ static inline void fill_queue(struct dma_pl330_ch=
an *pch)
>  			desc->status =3D DONE;
>  			dev_err(pch->dmac->ddma.dev, "%s:%d Bad Desc(%d)\n",
>  					__func__, __LINE__, desc->txd.cookie);
> -			tasklet_schedule(&pch->task);
> +			dmaengine_schedule_bh(&pch->chan);
>  		}
>  	}
>  }
> =20
> -static void pl330_tasklet(struct tasklet_struct *t)
> +static void pl330_tasklet(struct dma_chan *chan)
>  {

[Severity: High]
This is a pre-existing issue, but can the PM runtime counter become
unbalanced if a client re-issues a transfer from within the completion
callback?

In pl330_tasklet(), the local power_down variable is set to true if the
work_list is empty:

pl330_tasklet()
    if (list_empty(&pch->work_list)) {
        power_down =3D true;

The lock is then dropped before invoking the client callback:

        dmaengine_desc_callback_invoke(&cb, NULL);

If the client submits a new transfer and calls dma_async_issue_pending()
from this callback, it invokes pl330_issue_pending() which calls
pm_runtime_get_sync() and starts the transfer.

When the callback returns, the outer tasklet completes and unconditionally
calls pm_runtime_put_autosuspend():

    if (power_down)
        pm_runtime_put_autosuspend(pch->dmac->ddma.dev);

Since the local power_down is still true, wouldn't this incorrectly drop
the newly acquired PM reference, potentially causing the hardware to
autosuspend while the new transfer is actively running?

> -	struct dma_pl330_chan *pch =3D from_tasklet(pch, t, task);
> +	struct dma_pl330_chan *pch =3D container_of(chan, struct dma_pl330_chan,
> +						  chan);
>  	struct dma_pl330_desc *desc, *_dt;
>  	unsigned long flags;
>  	bool power_down =3D false;
[ ... ]
> @@ -2173,7 +2171,7 @@ static int pl330_alloc_chan_resources(struct dma_ch=
an *chan)
>  		return -ENOMEM;
>  	}
> =20
> -	tasklet_setup(&pch->task, pl330_tasklet);
> +	dmaengine_init_bh(&pch->chan, pl330_tasklet);
> =20
>  	spin_unlock_irqrestore(&pl330->lock, flags);

[Severity: High]
When a client driver requests a DMA channel, pl330_alloc_chan_resources()
calls dmaengine_init_bh(), which sets chan->bh_work_initialized =3D true.

If the client later frees the channel via pl330_free_chan_resources(),
dmaengine_kill_bh() is called, but this does not clear the initialized flag.

If any client requests the same channel again, wouldn't calling
dmaengine_init_bh() here trip the WARN_ON(chan->bh_work_initialized)
check in dmaengine_init_bh()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786384168.gi=
t.allen.lkml@gmail.com?part=3D29
