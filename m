Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7F83D5229
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785185677; cv=none; b=M+gwUYMkEE5aYmcPUOln1mHupb9tOVaErRl5b+wvflIWpm8Wt37dPvGgQTW8YWX4l1lkDWdR9m4r50U463LiwplIDXM7EbPic29Z+HkWsdY0D32DIdiw7RpvfFfOJHNv99e/lR8SghGAiZm387XZmKwB+Yo4Kg845GcGsJ6zKIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785185677; c=relaxed/simple;
	bh=2oS14C4kCVEVkI+DLLm98SY5HhsLy5xA/aPGL8IDv2w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DE22Fbu4LjfKh4NVa873lRGXDG3kgk4UZDvlhp3fUAiVZdOyFhALpeqESi4Q6qJfc01t9eLhLwBniMturMm1VU6zNLPV7mQddyaTsFRLQ119/vJgNlQPxJly78007IuVnOt5JTvRJm14gS2BzrlTzWrVRpdPKQdL9nwE+0bc74Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MFru0xMq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MFru0xMq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD1F61F000E9;
	Mon, 27 Jul 2026 20:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785185676;
	bh=+lkFgj/bZB8F8P8rFxbXbx/z9GpnspUQhktbKJk9XAc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MFru0xMqBUY1qIMFuLNrtTU++VPeYyxiK2hB2bMTBp02qG9+//M/wvhwRwaZ4Wvvy
	 uf8VLWH6bwcb7s6bB4ZCXr1SrRdi8RhQgIaeXExCg8yxXB50Y2p1e9zp/BgQLICRVw
	 Jt/lOsd1cADXaT2xs27FcGKsSK1hipGgMdjEbY/lAzund4b7nCCX9cWbQWysRUv8n6
	 0FmvEadAzBFrUvZyyiVZgkmjxgr9qVNf85uVGYaJb2HPEOZdxReUUqDX3L8iRE4EVK
	 SHhM2nQLPqv/K2+UXeuJBYHZYL9I7DtBe5z1uSqZGx3B/UCfF8lXKagDYZCDn3r/Vb
	 dgbyVzmqn0J9A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 10/64] dmaengine: mmp_pdma: replace per-chan tasklet
 with dma_chan BH
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <feaa4d0c6c7c9a3be4fe8202d91abe66f2555034.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <feaa4d0c6c7c9a3be4fe8202d91abe66f2555034.1785183549.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 20:54:35 +0000
Message-Id: <20260727205435.AD1F61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unconditional dereference of phy->vchan in the interrupt handler r=
aces with channel teardown.
- [High] Missing cancellation of scheduled bottom-half work during channel =
teardown and device removal causes UAF and NULL pointer dereferences.
- [High] Terminating cyclic transfers frees descriptors but leaves a dangli=
ng pointer in `chan->cyclic_first`, causing UAF in the bottom-half handler.
--

--- Patch [10]: [PATCH v2 10/64] dmaengine: mmp_pdma: replace per-chan task=
let with dma_chan BH ---
commit 7ee6ebc1ebbe207f60ed8c3f6afa81414e0802c3
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: mmp_pdma: replace per-chan tasklet with dma_chan BH

This commit replaces the per-channel tasklet with the shared dma_chan BH
helper. The handler continues to run in softirq context while delegating
scheduling to the dmaengine's mechanism.

> diff --git a/drivers/dma/mmp_pdma.c b/drivers/dma/mmp_pdma.c
> index 386e85cd4882a..3fd9ef59a1420 100644
> --- a/drivers/dma/mmp_pdma.c
> +++ b/drivers/dma/mmp_pdma.c
[ ... ]
> @@ -374,7 +373,7 @@ static irqreturn_t mmp_pdma_chan_handler(int irq, voi=
d *dev_id)
>  	if (clear_chan_irq(phy) !=3D 0)
>  		return IRQ_NONE;
> =20
> -	tasklet_schedule(&phy->vchan->tasklet);
> +	dma_chan_schedule_bh(&phy->vchan->chan);

[Severity: High]
This is a pre-existing issue, but does this race with channel teardown?

If mmp_pdma_free_phy() sets phy->vchan to NULL while the shared physical
interrupt remains active:

drivers/dma/mmp_pdma.c:mmp_pdma_free_phy() {
    ...
    pchan->phy->vchan =3D NULL;
    ...
}

Could a pending interrupt be serviced immediately afterwards?

If clear_chan_irq() successfully clears the hardware interrupt and returns
zero, it appears this code will unconditionally dereference the NULL pointer
in phy->vchan when scheduling the bottom half.

>  	return IRQ_HANDLED;
>  }
[ ... ]
> @@ -1047,13 +1046,11 @@ static void mmp_pdma_issue_pending(struct dma_cha=
n *dchan)
>  }
> =20
>  /*
> - * dma_do_tasklet
> - * Do call back
> - * Start pending list
> + * dma_do_tasklet - BH worker to process completions and kick pending wo=
rk
>   */
> -static void dma_do_tasklet(struct tasklet_struct *t)
> +static void dma_do_tasklet(struct dma_chan *c)
>  {
> -	struct mmp_pdma_chan *chan =3D from_tasklet(chan, t, tasklet);
> +	struct mmp_pdma_chan *chan =3D container_of(c, struct mmp_pdma_chan, ch=
an);

[Severity: High]
This is a pre-existing issue, but is the bottom half properly synchronized
against device removal and channel teardown?

Looking at mmp_pdma_free_chan_resources(), the descriptor pool is destroyed
and chan->desc_pool is set to NULL:

drivers/dma/mmp_pdma.c:mmp_pdma_free_chan_resources() {
    ...
    dma_pool_destroy(chan->desc_pool);
    chan->desc_pool =3D NULL;
    ...
}

Since there isn't a device_synchronize() or explicit cancellation of the
pending bottom-half work during teardown or mmp_pdma_remove(), could this
background work execute asynchronously?

If it does, it looks like it would invoke dma_pool_free() on a NULL or
destroyed pool further down in this function, or access a chan structure
that was already freed by devres.

[Severity: High]
This isn't a bug introduced by this patch, but can this function access a
freed descriptor during cyclic transfers?

In mmp_pdma_terminate_all(), the driver correctly frees running descriptors
back to the DMA pool by calling mmp_pdma_free_desc_list(), but it doesn't
appear to clear chan->cyclic_first:

drivers/dma/mmp_pdma.c:mmp_pdma_terminate_all() {
    ...
    mmp_pdma_free_desc_list(chan, &chan->chain_running);
    ...
}

If a delayed or spurious bottom-half execution triggers this function,
could it evaluate chan->cyclic_first as non-null and subsequently
use-after-free the memory to invoke the callback?

>  	struct mmp_pdma_desc_sw *desc, *_desc;
>  	LIST_HEAD(chain_cleanup);
>  	unsigned long flags;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785183549.gi=
t.allen.lkml@gmail.com?part=3D10
