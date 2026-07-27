Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB43831D381
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 21:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785186410; cv=none; b=C+g1lyIlrtl7H8zx2HJlKj4O+Y7MzwbWqCcZB/jpj0WhpoaFP5lpdzRJB5fG9ykUCFYOc3SWCcw4tkstzvqx88j2qkDGyqjusTiZN/q5mjiyiQEO7YUjdZkgtqdAqchRYnh0zynYAa1i/l7Jr1ly8pIVtEBrQ0hAjfNqyF57JQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785186410; c=relaxed/simple;
	bh=9zWBEU8/jY8ua46DaCpUVI74fMMf5Q9fE5WLPmLIdNI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=J8YsQUqGlkeRpiYLD25eiotBDsnlchnNdZCIoTqg7FC1xXYicjdbbkwAcqhYtUxfUk5W3Qd/1ZFaJHzYyLAnkL1HRNZ1karpediTpswx1DWrSljbpAAM8Fy1tll176K52IGDMQ/3EwvkNbWO3SNw6yapGsvjWYRC7aUyCVaSmuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i2rpP+y7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i2rpP+y7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 456271F000E9;
	Mon, 27 Jul 2026 21:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785186409;
	bh=ftyUTSYGshnmTETX3yqoh8gcuo3CbXMj2FSeGVUwmg0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i2rpP+y78E+aB1q650PsSEjkGvquvp3WkFdNdoWK6Tuw0+z+K8sFXqhahda0wMJWg
	 IJngZWjMgw4Zp4OTslvHo0+fXGVpIOIskNx9uU7EPOSnqIYBjaZqXI5/4k8S4tb6vK
	 f7iv8TQxVg7HyFGDeezUFcWVFvxU8enoKpWp1J/26cUf1kteMiLhEGil99XyiELdAS
	 bCVK8ARTV5jU03UcRcck96eUoqVqQifkaoSKrYITZcDIP9PHfUAtwR0LyNTB5O/QOL
	 gitIk0uPY1ROi4ZcxNuPhCXHRodiJWNYsFZQgkZgipZGjxtPTYb5ldKCeURQa+/CUF
	 4Ha+dV9fVxVzg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 29/64] dmaengine: sf-pdma: route error callbacks
 through channel BH
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <cb95b5e1f0970fde25ab542047d3aecbb41ce653.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <cb95b5e1f0970fde25ab542047d3aecbb41ce653.1785183549.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 21:06:48 +0000
Message-Id: <20260727210649.456271F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:

New issues:
- [Critical] Concurrent execution of errbh_tasklet and donebh_tasklet cause=
s the driver to corrupt the active DMA hardware state.
- [High] Race condition between errbh_tasklet and donebh_tasklet causes a k=
ernel panic via BUG_ON() during descriptor completion.

Pre-existing issues:
- [High] Double free of the active descriptor during channel termination or=
 resource cleanup.
- [High] Memory and resource leak in `sf_pdma_remove` due to premature chan=
nel list removal.
- [High] Lockless read of `chan->desc` in `sf_pdma_errbh_tasklet` leads to =
use-after-free and virt-dma list corruption.
- [High] Missing NULL pointer check on `chan->desc` causes a kernel panic o=
n concurrent termination or stray interrupts.
- [Medium] Residue reporting always returns 0 for actively running transfer=
s.
--

--- Patch [29]: [PATCH v2 29/64] dmaengine: sf-pdma: route error callbacks =
through channel BH ---
commit 4199e17e8ac9bf5b639472caa463955dc33436b1
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: sf-pdma: route error callbacks through channel BH

This patch modifies the error handling path for SF-PDMA to route completions
through the virt-dma per-channel bottom half instead of invoking callbacks
directly from the error tasklet. It updates the error tasklet to complete
the aborted descriptor using virt-dma primitives and start the next transfe=
r.
It also attempts to ensure tasklets are killed before the channel BH during
removal.

> diff --git a/drivers/dma/sf-pdma/sf-pdma.c b/drivers/dma/sf-pdma/sf-pdma.c
> index 6f79cc28703e6..a6c2f53f005ed 100644
> --- a/drivers/dma/sf-pdma/sf-pdma.c
> +++ b/drivers/dma/sf-pdma/sf-pdma.c
> @@ -328,7 +328,17 @@ static void sf_pdma_errbh_tasklet(struct tasklet_str=
uct *t)

[Severity: High]
This is a pre-existing issue, but is there a risk of a use-after-free
here? At the beginning of sf_pdma_errbh_tasklet(), we read the descriptor
pointer outside of any lock:

sf_pdma_errbh_tasklet() {
    ...
    struct sf_pdma_desc *desc =3D chan->desc;
    unsigned long flags;

    spin_lock_irqsave(&chan->lock, flags);
}

If a client concurrently calls sf_pdma_terminate_all(), it frees chan->desc.
Since the tasklet later unconditionally dereferences this cached pointer,
could this corrupt memory?

>  	if (chan->retries <=3D 0) {
>  		/* fail to recover */
>  		spin_unlock_irqrestore(&chan->lock, flags);
> -		dmaengine_desc_get_callback_invoke(desc->async_tx, NULL);
> +
> +		spin_lock_irqsave(&chan->vchan.lock, flags);
> +		list_del(&desc->vdesc.node);
> +		desc->vdesc.tx_result.result =3D DMA_TRANS_ABORTED;
> +		desc->vdesc.tx_result.residue =3D desc->xfer_size;
> +		vchan_cookie_complete(&desc->vdesc);

[Severity: High]
If both sf_pdma_donebh_tasklet() and sf_pdma_errbh_tasklet() run concurrent=
ly
due to rapid sequential interrupts, can they race on this completion?

If the done tasklet acquires the lock first, it completes the descriptor
and clears its cookie. When this error tasklet acquires the lock next, it
will attempt to complete the exact same descriptor again. Will this double
completion trigger a BUG_ON() in the core dmaengine code?

> +
> +		chan->desc =3D sf_pdma_get_first_pending_desc(chan);
> +		if (chan->desc)
> +			sf_pdma_xfer_desc(chan);

[Severity: Critical]
Could this hardware re-triggering logic corrupt the DMA state if the done
tasklet is executing simultaneously?

If this error tasklet completes the current descriptor and starts the next
one in hardware, the done tasklet might still assume the original descriptor
is active. Will the done tasklet then incorrectly complete the actively
running descriptor and start a third one, corrupting the DMA registers
during an active transfer?

> +		spin_unlock_irqrestore(&chan->vchan.lock, flags);
>  	} else {
>  		/* retry */

[ ... ]

> @@ -602,9 +612,9 @@ static void sf_pdma_remove(struct platform_device *pd=
ev)
>  		devm_free_irq(&pdev->dev, ch->txirq, ch);
>  		devm_free_irq(&pdev->dev, ch->errirq, ch);
>  		list_del(&ch->vchan.chan.device_node);

[Severity: High]
This is a pre-existing issue, but does removing this device node early
break the dmaengine core cleanup?

When sf_pdma_remove() calls list_del() here, it empties the channels list.
Later in the removal process, dma_async_device_unregister() iterates over
the channels list to free resources like per-cpu memory and IDAs. Since
the list is already empty, will those resources be permanently leaked?

> -		tasklet_kill(&ch->vchan.task);
>  		tasklet_kill(&ch->done_tasklet);
>  		tasklet_kill(&ch->err_tasklet);
> +		dma_chan_kill_bh(&ch->vchan.chan);
>  	}


[Severity: High]
This is a pre-existing issue, but can sf_pdma_terminate_all() trigger
a double free of the active descriptor?

sf_pdma_terminate_all() explicitly frees the descriptor:

sf_pdma_terminate_all() {
    ...
    kfree(chan->desc);
    chan->desc =3D NULL;
    ...
    vchan_get_all_descriptors(&chan->vchan, &head);
    ...
    vchan_dma_desc_free_list(&chan->vchan, &head);
}

Because the active descriptor isn't removed from the virt-dma desc_issued
list before being freed, won't vchan_get_all_descriptors() collect it
again, causing vchan_dma_desc_free_list() to free the same pointer a
second time?


[Severity: High]
This is a pre-existing issue, but is there a missing NULL pointer check
when handling partial completions?

If a concurrent client terminates the channel, chan->desc is set to NULL.
However, the done ISR unconditionally dereferences it:

sf_pdma_done_isr() {
    ...
    struct sf_pdma_desc *desc =3D chan->desc;

    desc->src_addr +=3D desc->xfer_size - residue;
    ...
}

Could this cause a kernel panic if the ISR fires right after the channel
is terminated?


[Severity: Medium]
This is a pre-existing issue, but does sf_pdma_desc_residue() fail to
report accurate remaining bytes for actively running transfers?

sf_pdma_desc_residue() only searches the submitted list:

sf_pdma_desc_residue() {
    ...
    list_for_each_entry(vd, &chan->vchan.desc_submitted, node)
        if (vd->tx.cookie =3D=3D cookie)
            tx =3D &vd->tx;

    if (!tx)
        goto out;
    ...
}

Since actively running descriptors are moved to the desc_issued list,
won't this always fail to find the active transfer and incorrectly return
0 remaining bytes?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785183549.gi=
t.allen.lkml@gmail.com?part=3D29
