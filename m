Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7376157487
	for <dmaengine@vger.kernel.org>; Thu, 10 Sep 2026 20:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789072210; cv=none; b=btyAmeiIbw+eRXwIlC2oDHwxpDgRSRC8flZGOBG+y/sBPCvH3SGQ5/Gth9OAyfONQhMcGs8ebweC5EeGpfhx+2PJRITwz0rgyfKiLf3AHpbVKyxjHCCraC87wLE0MVD7OcV9niyDtJKNPS6MfPBPCW8ARCo/zeDPhOvcEHXWnzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789072210; c=relaxed/simple;
	bh=UeQKoyhNKaMi6QB9eDFyojCKs0djlA/J4MGJ3z91OSk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FffnSb04VTL20A5LeXsB5H5WnVe16gAqHRHGFIQoFDbm0vJ0loqBkXbKiBuy3h3pBRJkLt0EG3VLTlPa0QO6SO4xb2NKSnu1kKXMh+vZtYp9MS8jJX2Eeu4LF4a5L3PvE+sVLCDYVsnEW8iZda0irolK2JnZdLa3/a8vNtZVYeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cnM4/roA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cnM4/roA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F22801F000FF;
	Thu, 10 Sep 2026 20:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789072208;
	bh=tx/IPtpt4JveICIbMnaWrl/AwERaLa8LOqoGCyuj24c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cnM4/roAdP1pMaPkFgEImySY5J86f59pb67dCd5eli0ZJWhlbB3d3V3jAygH/GUU3
	 cK1dDO+fY91m+xdpimpPhUO9BICFz4gTnZFUjtTc7m92Dvo/VBRad8DsY19YEHqyzm
	 68cZv/h120gTCi4RrXQm8sKKBbahAvwEYGcddbahFN3JUaE5+JPv4EcliFzzExpjCA
	 jmyC46acA7/AU3HfLXgkueEI6vC7SmqQsnc0a0itnj6t2Fw6aYDNvmleyaugJ4Jgah
	 K8DL08piMEeLiFgO7DRHP1sgzBAjTw4XjGqaKoKorpu8pIgIWZu3+JQeUZXoMZ4IPl
	 8AGayHhy3qljg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv3] dmaengine: fsl_raid: free resources in probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260910201556.44207-1-rosenp@gmail.com>
References: <20260910201556.44207-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 20:30:07 +0000
Message-Id: <20260910203007.F22801F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:

New issues:
- [High] Double-Free of IRQ and Use-After-Free of platform device due to ig=
nored error unwind path.
- [High] Incorrect error unwind order creates a Use-After-Free race conditi=
on.

Pre-existing issues:
- [Critical] Resource Leak and Use-After-Free on subsequent channel probe f=
ailure.
- [Critical] Inverted High/Low physical address programming for DMA rings.
- [High] NULL Pointer Dereference during teardown if channel probe fails ea=
rly.
- [High] Premature IRQ enablement leading to uninitialized lock and list us=
age.
- [High] Deadlock in DMA callback execution.
- [High] Use-After-Free due to destroying resources before unregistering th=
e DMA device.
- [High] Missing DMA channel registration renders the driver completely use=
less.
--

commit 201959b3fc32827578294d7c04cb951e0865cc39
Author: Rosen Penev <rosenp@gmail.com>

    dmaengine: fsl_raid: free resources in probe
   =20
    Add free_irq() in the error unwind of fsl_re_chan_probe() and in
    fsl_re_remove_chan() so the interrupt is always released.
   =20
    Also add tasklet_kill(). Present in _remove but not _probe.
   =20
    Also add of_platform_device_destroy() on failure as
    of_platform_device_create() increases the reference count and needs
    of_platform_device_destroy() on failure. Requires placing the pointer in
    the struct for the _remove function.
   =20
    Fixes: ad80da658bbc ("dmaengine: Driver support for FSL RaidEngine devi=
ce.")
    Assisted-by: opencode:hy3-free
    Signed-off-by: Rosen Penev <rosenp@gmail.com>

> diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
> index 2d86f61105e52..a5b9325028f5f 100644
> --- a/drivers/dma/fsl_raid.c
> +++ b/drivers/dma/fsl_raid.c
> @@ -669,14 +668,13 @@ static int fsl_re_chan_probe(struct platform_device=
 *ofdev,
> =20
>  	snprintf(chan->name, sizeof(chan->name), "re_jr%02d", q);
> =20
> -	chandev =3D &chan_ofdev->dev;
>  	tasklet_setup(&chan->irqtask, fsl_re_dequeue);
> =20
> -	ret =3D request_irq(chan->irq, fsl_re_isr, 0, chan->name, chandev);
> +	ret =3D request_irq(chan->irq, fsl_re_isr, 0, chan->name, chan);

[Severity: High]
This is a pre-existing issue, but does requesting the IRQ here make the
interrupt handler live before subsequent initialization steps?

These important structures are initialized too late:

drivers/dma/fsl_raid.c:fsl_re_chan_probe() {
    ...
	spin_lock_init(&chan->desc_lock);
	INIT_LIST_HEAD(&chan->ack_q);
	INIT_LIST_HEAD(&chan->active_q);
    ...
}

Can this cause a kernel crash due to uninitialized spinlock and list
operations if the hardware has a pending interrupt from a previous boot or
kexec when the driver probes?

>  	if (ret) {
>  		dev_err(dev, "Unable to register interrupt for JR %d\n", q);
>  		ret =3D -EINVAL;
> -		goto err_free;
> +		goto err_free_tasklet;
>  	}
> =20
>  	re_priv->re_jrs[q] =3D chan;

[Severity: High]
If fsl_re_chan_probe() fails after this assignment, the channel pointer is
stored in the driver's private array before the final allocations occur. If
those allocations fail, doesn't this leave a dangling pointer?

Later in fsl_re_probe(), the return value of fsl_re_chan_probe() is ignored:

drivers/dma/fsl_raid.c:fsl_re_probe() {
    ...
				fsl_re_chan_probe(ofdev, child, ridx++, off);
				re_priv->total_chans++;
    ...
}

So the driver commits the failed channel to the active channel count.

When the driver is subsequently removed, fsl_re_remove_chan() will be called
again for the already freed channel. Since this patch adds free_irq() and
of_platform_device_destroy() to the error unwind path, will this result in a
double-free of the IRQ and a use-after-free of the platform device?


[Severity: High]
This is a pre-existing issue, but while the driver properly assigns the
framework device pointers:

drivers/dma/fsl_raid.c:fsl_re_chan_probe() {
    ...
	chan->chan.device =3D dma_dev;
	chan->chan.private =3D chan;
    ...
}

It seems to fail to link the channel into the framework's channels list.
Does this missing DMA channel registration render the driver completely use=
less
by silently failing to register any channels into the dmaengine framework?


[Severity: Critical]
This is a pre-existing issue, but does this misconfigure the DMA engine?

drivers/dma/fsl_raid.c:fsl_re_chan_probe() {
    ...
	out_be32(&chan->jrregs->inbring_base_h,
		 chan->inb_phys_addr & FSL_RE_ADDR_BIT_MASK);
	out_be32(&chan->jrregs->oubring_base_h,
		 chan->oub_phys_addr & FSL_RE_ADDR_BIT_MASK);
	out_be32(&chan->jrregs->inbring_base_l,
		 chan->inb_phys_addr >> FSL_RE_ADDR_BIT_SHIFT);
	out_be32(&chan->jrregs->oubring_base_l,
		 chan->oub_phys_addr >> FSL_RE_ADDR_BIT_SHIFT);
    ...
}

It appears the lower 32 bits are written into the high address register and
the upper 32 bits into the low address register. Can this result in invalid
physical memory accesses by the hardware, leading to silent memory corrupti=
on
or IOMMU faults?

[ ... ]

> @@ -738,7 +736,12 @@ static int fsl_re_chan_probe(struct platform_device =
*ofdev,
>  err_free_1:
>  	dma_pool_free(chan->re_dev->hw_desc_pool, chan->inb_ring_virt_addr,
>  		      chan->inb_phys_addr);
> +err_free_irq:
> +	free_irq(chan->irq, chan);
> +err_free_tasklet:
> +	tasklet_kill(&chan->irqtask);
>  err_free:
> +	of_platform_device_destroy(chandev, NULL);
>  	return ret;
>  }

[Severity: High]
The patch added free_irq() and tasklet_kill() after freeing the DMA memory =
in
err_free_1.

If an interrupt fires during this window, could the handler schedule the
tasklet which then accesses the freed or unallocated DMA rings? Does this
incorrect error unwind order create a use-after-free race condition?

[ ... ]

> @@ -844,6 +847,8 @@ static int fsl_re_probe(struct platform_device *ofdev)
> =20
>  static void fsl_re_remove_chan(struct fsl_re_chan *chan)
>  {
> +	free_irq(chan->irq, chan);
> +

[Severity: High]
This is a pre-existing issue, but if fsl_re_chan_probe() fails early in its
execution, re_priv->re_jrs[q] is left as NULL.

Because total_chans is unconditionally incremented on early error in
fsl_re_probe():

drivers/dma/fsl_raid.c:fsl_re_probe() {
    ...
				fsl_re_chan_probe(ofdev, child, ridx++, off);
				re_priv->total_chans++;
    ...
}

Will this dereference the channel pointer without checking if it is NULL,
causing an immediate kernel crash?


[Severity: Critical]
This is a pre-existing issue, but if the device tree has multiple job queues
and a subsequent one fails validation:

drivers/dma/fsl_raid.c:fsl_re_probe() {
    ...
		rc =3D of_property_read_u32(np, "reg", &off);
		if (rc) {
			dev_err(dev, "Reg property not found in JQ node\n");
			return -ENODEV;
		}
    ...
}

Returning an error here abandons previously successful channels without tea=
ring
down their active resources. Because re_priv is managed by devres, it will =
be
freed, leaving the active IRQ handler pointing to freed memory. Can this le=
ad
to a resource leak and use-after-free memory corruption if an interrupt fir=
es?


[Severity: High]
This is a pre-existing issue, but is there a potential deadlock in the DMA
callback execution?

The spinlock is acquired to protect the descriptor queues:

drivers/dma/fsl_raid.c:fsl_re_dequeue() {
    ...
	spin_lock_irqsave(&re_chan->desc_lock, flags);
    ...
}

Then the client callback is invoked synchronously without dropping the spin=
lock
first:

drivers/dma/fsl_raid.c:fsl_re_desc_done() {
    ...
	dmaengine_desc_get_callback_invoke(&desc->async_tx, NULL);
    ...
}

Could this lead to an ABBA deadlock if the client attempts to allocate or
submit a new descriptor from its completion callback?


[Severity: High]
This is a pre-existing issue, but are the underlying channel resources (IRQ=
s,
tasklets, DMA pools) completely destroyed here:

drivers/dma/fsl_raid.c:fsl_re_remove() {
    ...
	for (i =3D 0; i < re_priv->total_chans; i++)
		fsl_re_remove_chan(re_priv->re_jrs[i]);
    ...
}

Before the framework unregistration occurs?

drivers/dma/fsl_raid.c:fsl_re_remove() {
    ...
	dma_async_device_unregister(&re_priv->dma_dev);
}

Does this leave a window for active clients to use freed resources if the
driver is unloaded or unbound while a concurrent DMA client is still active?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910201556.4420=
7-1-rosenp@gmail.com?part=3D1
