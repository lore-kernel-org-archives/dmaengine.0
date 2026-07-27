Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C9B3E51FF
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 21:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785187031; cv=none; b=EypziZ/oUMnpvYzml58huX4miw9jvMZlcznsJdbbJImDgu4xrHvYddRl0Dy2FyHCPiol3v9CGTNlIzwRwKl/yMiknX0zE9hXOzIiVBRzbq3tD2/7o9L6F9Le0jFgBlBFjRiyfSA9wyztGrJfJ/fRsUMn1jdqPY/70Sjhk3nAkUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785187031; c=relaxed/simple;
	bh=GmBeIEWzPxxMAc3tJtwIXzALSaf6cuyuQA+vzs/rbYY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P4TiGNTeKW1DPpSSzifyHSgoihB3EbK36roUghVG6bKqeY6OVgtAt1OHC7FCFh4EV0yH0ePtnqQe+gmLHlkaB+0kZvC3rh0s8JFRJz/eD6vscSwHmkD6TmoHgVavUegBB5tzjgpdpQbJJSWrEbFqVooEd5awhj47VJYhf4kmdT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F6+HAAVl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F6+HAAVl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9831E1F000E9;
	Mon, 27 Jul 2026 21:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785187029;
	bh=gnMBXK3V5hiEtNlM5ektR75Mvi5Na1eH/wfrh3ixOHI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F6+HAAVlg0YWZwbJqruBimn01VF7fYMOBgXA+e0/6e+74Whz9Q/A4b357P81cf0/7
	 ESM3oa0C/7+T68Yezpd0jHdU3oCTCC6z11+CauY/upCYA6XimNqfN623Xv9QdkIbNb
	 QZpZ3c3VKiaGOvQ48MpwbQizosRyZ3WxkyDLgAh9DPvZAl9GOTIhN/3ePRua1SrkgM
	 5yUSlzFc0P6CEZ1zuMGh1EFWwPjsoDZJXTqwpU1/zHXq5Y8W5v3bCeYOKRl8tedLnC
	 xmnIandlnr3202yEHke+/2Fj1VFVmq+T3B88o3HJ3x2etf4DeN8eXbfamJA9IuT9Me
	 VBu4zQqZ7Y3Zw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 53/64] dmaengine: fsl-qdma: use dma_chan_kill_bh
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <bfcda179429c502ce7633b7858f07f8050999d8b.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <bfcda179429c502ce7633b7858f07f8050999d8b.1785183549.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 21:17:09 +0000
Message-Id: <20260727211709.9831E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Prematurely removing channels from the `dmadev->channels` list in =
`fsl_qdma_cleanup_vchan()` bypasses core DMA engine unregistration, leading=
 to resource leaks and Use-After-Free vulnerabilities.
- [High] The driver fails to halt the DMA engine during device removal and =
tears down IRQs before unregistering the DMA controller.
- [High] Unconditionally destroying shared DMA pools in `fsl_qdma_free_chan=
_resources()` causes a Use-After-Free for other active channels.
--

--- Patch [53]: [PATCH v2 53/64] dmaengine: fsl-qdma: use dma_chan_kill_bh =
---
commit 705da09605a777fa7dd32343007b9e054bcb5942
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: fsl-qdma: use dma_chan_kill_bh

virt-dma now dispatches completion callbacks through per-channel BH
work instead of its tasklet. Cancel that work during teardown before
channel storage is released.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>

> diff --git a/drivers/dma/fsl-qdma.c b/drivers/dma/fsl-qdma.c
> index df843fad0ece5..e0fb39fe821c9 100644
> --- a/drivers/dma/fsl-qdma.c
> +++ b/drivers/dma/fsl-qdma.c
> @@ -1255,7 +1255,7 @@ static void fsl_qdma_cleanup_vchan(struct dma_devic=
e *dmadev)
>  	list_for_each_entry_safe(chan, _chan,
>  				 &dmadev->channels, vchan.chan.device_node) {
>  		list_del(&chan->vchan.chan.device_node);

[Severity: High]
This is a pre-existing issue, but does removing this channel from the
dmadev->channels list here bypass the core DMA engine unregistration?

If the driver empties the channel list before the core DMA framework
unregisters it in fsl_qdma_remove():

drivers/dma/fsl-qdma.c:fsl_qdma_remove() {
        ...
        fsl_qdma_cleanup_vchan(&fsl_qdma->dma_dev);
        ...
        dma_async_device_unregister(&fsl_qdma->dma_dev);
}

The framework's cleanup loop will be silently skipped:

drivers/dma/dmaengine.c:dma_async_device_unregister() {
        ...
        list_for_each_entry_safe(chan, n, &device->channels, device_node)
                __dma_async_device_channel_unregister(device, chan);
        ...
}

Could this leave sysfs entries exposed and cause a use-after-free when
the underlying memory is freed?

> -		tasklet_kill(&chan->vchan.task);
> +		dma_chan_kill_bh(&chan->vchan.chan);
>  	}
>  }

[Severity: High]
This is also a pre-existing issue, but does the driver fail to halt the
DMA engine during device removal?

Looking at fsl_qdma_remove(), IRQs are destroyed while the controller
might still be active:

drivers/dma/fsl-qdma.c:fsl_qdma_remove() {
        ...
        fsl_qdma_irq_exit(pdev, fsl_qdma);
        fsl_qdma_cleanup_vchan(&fsl_qdma->dma_dev);
        ...
}

Since fsl_qdma_halt() is not called here, could the hardware continue
performing reads or writes against freed memory?

[Severity: High]
This is another pre-existing issue, but does destroying the shared DMA
pools in fsl_qdma_free_chan_resources() cause a use-after-free for
other active channels?

During initialization, multiple channels can share the same physical
queue structure and memory pools:

drivers/dma/fsl-qdma.c:fsl_qdma_probe() {
        ...
        fsl_chan->queue =3D fsl_qdma->queue + i % (fsl_qdma->n_queues *
                                        fsl_qdma->block_number);
        ...
}

However, when a channel is freed, the shared pools are unconditionally
destroyed:

drivers/dma/fsl-qdma.c:fsl_qdma_free_chan_resources() {
        ...
        dma_pool_destroy(fsl_queue->comp_pool);
        dma_pool_destroy(fsl_queue->desc_pool);
        ...
}

If another active channel shares this same queue, will it crash or
corrupt memory upon subsequent operations?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785183549.gi=
t.allen.lkml@gmail.com?part=3D53
