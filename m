Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A37A1E47C5
	for <dmaengine@vger.kernel.org>; Sat, 18 Jul 2026 23:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784417300; cv=none; b=D1JV5Cud93rAU9ZGp8aMN9Pnl5j5zQWSfdclxFJPQrApM9k9ycS0mErGIspZhQ3tE07YP2cfXouqFO/I553TQ/EdHzPHjjYBXLRd3ssbymozJi5bdv+bmo5R4K0PfsIuO5g1V3vUKEgh3u/seI9vM/02L2KmDTdXsrf7xwfLMZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784417300; c=relaxed/simple;
	bh=oGa6p4ggHl7Vz+JPC4BmkL8haNolSOiaRvCGXWxytbM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cRXVJz95YN7yGi4Ocp0CnDc5JsBm8JYQnZIBo6E95L8JWNJkpynU0d1VDKLQChbExJtLOYqEALG4ZX5w6PdiGCgM8yTEr+AtVSj512qPtPstmdVtYIgubdH5rACW/4XReMGN+cB4xmIIt9Ut776WsdoO2N6vRYeX6JTmMwfeF1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GtW3JQKT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GtW3JQKT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04ECF1F000E9;
	Sat, 18 Jul 2026 23:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784417299;
	bh=QRrPoL6dmJ6yB9nLNCdLpz1Y14fCaQiSDfzOpYf14gA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GtW3JQKTnYmNxy4zv+ma+djk3gIUWdgNZCyECEGZbsX2kMpgFS26gGcr13pQ8ADA1
	 MyXBRDyQEB8L7iKUSp2yl4ZcT7IYzhkTyl77bziEpFDLbdphDeuvzJTW/jWbOGEp6r
	 +0l4ycfUw13mzbh91ntlezzjN5WtMig+UPAkr9vsqdkzX0kyj8nJIxGXRSDMLbhHyW
	 gR3YuCUKMgp4cwW8nL6kfv9u1LTcVFyt1/CXVJz1CqV595162zIsB4Yt1Lg5A/SoPN
	 ndcYk/hDyPbG8abexIDGZVL8MEVBf5Yc40OHCJV/KSxyWQFgGtvHkLdm860i1OR9jU
	 YdCSvcMw3syTw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: fsl_raid: free resources in probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260718231716.230144-1-rosenp@gmail.com>
References: <20260718231716.230144-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 18 Jul 2026 23:28:18 +0000
Message-Id: <20260718232819.04ECF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:

New issues:
- [High] Improper Device Cleanup / List Corruption
- [High] Race Condition / Teardown Order resulting in Use-After-Free
- [High] Double-Free / NULL Pointer Dereference due to Ignored Probe Error

Pre-existing issues:
- [High] Race Condition / Uninitialized Data in ISR
- [High] Resource Leak and Kernel Panic on JQ Node Parse Failure
- [High] Concurrency / Use-After-Free during DMA Unregistration
- [High] Buffer Overflow / Out-of-Bounds Write from Device Tree
--

--- Patch [1]: [PATCH] dmaengine: fsl_raid: free resources in probe ---
commit 6b03aff77ef1f481579072d2caa275fbf35f0665
Author: Rosen Penev <rosenp@gmail.com>

dmaengine: fsl_raid: free resources in probe

This patch adds resource cleanup in the error unwind path of
fsl_re_chan_probe and in fsl_re_remove_chan. It adds free_irq, tasklet_kill,
and platform_device_put, while switching to platform_get/set_drvdata.

> diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
> index 99945845d8b5e..5f9c92c86593e 100644
> --- a/drivers/dma/fsl_raid.c
> +++ b/drivers/dma/fsl_raid.c

[ ... ]

> @@ -672,17 +672,18 @@ static int fsl_re_chan_probe(struct platform_device=
 *ofdev,
>  	chandev =3D &chan_ofdev->dev;
>  	tasklet_setup(&chan->irqtask, fsl_re_dequeue);
> =20
> -	ret =3D request_irq(chan->irq, fsl_re_isr, 0, chan->name, chandev);
> +	ret =3D request_irq(chan->irq, fsl_re_isr, 0, chan->name, chan_ofdev);

[Severity: High]
This isn't a bug introduced by this patch, but by requesting the IRQ here, =
is
there a window where the interrupt can fire before platform_set_drvdata() is
called later in this function?

If the ISR runs immediately, it will read a NULL pointer from
platform_get_drvdata() and dereference it when reading the interrupt status.

>  	if (ret) {
>  		dev_err(dev, "Unable to register interrupt for JR %d\n", q);
>  		ret =3D -EINVAL;
> -		goto err_free;
> +		goto err_free_tasklet;
>  	}

[ ... ]

> @@ -738,7 +739,12 @@ static int fsl_re_chan_probe(struct platform_device =
*ofdev,
>  err_free_1:
>  	dma_pool_free(chan->re_dev->hw_desc_pool, chan->inb_ring_virt_addr,
>  		      chan->inb_phys_addr);
> +err_free_irq:
> +	free_irq(chan->irq, chan_ofdev);
> +err_free_tasklet:
> +	tasklet_kill(&chan->irqtask);
>  err_free:
> +	platform_device_put(chan_ofdev);

[Severity: High]
Does platform_device_put() correctly clean up the device created by
of_platform_device_create()?

Since of_platform_device_create() allocates and registers the device with
the system bus, the initial reference belongs to the device core. Does call=
ing
platform_device_put() here drop a reference the driver doesn't own, leading
to a reference count underflow and a subsequent use-after-free?

Would of_platform_device_destroy() or platform_device_unregister() be the
correct teardown function to use instead?

[Severity: High]
If fsl_re_chan_probe() fails and executes these new destructors, does the
driver handle the failure correctly in fsl_re_probe()?

Looking at fsl_re_probe(), the return value of fsl_re_chan_probe() is ignor=
ed
and total_chans is incremented anyway:

fsl_re_probe() {
    ...
    for_each_child_of_node(np, child) {
        ...
        if (rc) {
            fsl_re_chan_probe(ofdev, child, ridx++, off);
            re_priv->total_chans++;
        }
    }
}

Since total_chans is still incremented, fsl_re_remove() will eventually
iterate over this failed channel and call fsl_re_remove_chan(). Does this
result in a double free of the IRQ and device, or a NULL pointer dereference
since the cleanup already happened in the probe error path?

>  	return ret;
>  }

[ ... ]

> @@ -819,7 +825,7 @@ static int fsl_re_probe(struct platform_device *ofdev)
>  		return -ENOMEM;
>  	}
> =20
> -	dev_set_drvdata(dev, re_priv);
> +	platform_set_drvdata(ofdev, re_priv);

[Severity: High]
This isn't a bug introduced by this patch, but looking at fsl_re_probe(), is
there a risk of an out-of-bounds write if the device tree has too many child
nodes?

fsl_re_probe() {
    ...
    for_each_child_of_node(np, child) {
        ...
            fsl_re_chan_probe(ofdev, child, ridx++, off);
    }
}

fsl_re_chan_probe() uses this index to store the channel in re_jrs:
    re_priv->re_jrs[q] =3D chan;

Since re_jrs has a fixed size of 4, will this corrupt memory if more than 4=
=20
job rings are defined in the device tree?

[Severity: High]
This is another pre-existing issue, but does fsl_re_probe() leak resources =
if
a secondary Job Queue node fails to parse?

fsl_re_probe() {
    ...
    for_each_compatible_node_scoped(np, NULL, "fsl,raideng-v1.0-job-queue")=
 {
        rc =3D of_property_read_u32(np, "reg", &off);
        if (rc) {
            dev_err(dev, "Reg property not found in JQ node\n");
            return -ENODEV;
        }
        ...
}

If this early return is hit on a subsequent loop iteration, are the channels
probed in previous iterations leaked because fsl_re_remove() won't be calle=
d?

Could this also cause a kernel panic if an active IRQ fires and attempts to
access the unmapped re_regs since devres will clean up the mapped memory?

> =20
>  	/* Parse Device tree to find out the total number of JQs present */
>  	for_each_compatible_node_scoped(np, NULL, "fsl,raideng-v1.0-job-queue")=
 {

[ ... ]

> @@ -848,21 +854,23 @@ static void fsl_re_remove_chan(struct fsl_re_chan *=
chan)
>  {
>  	tasklet_kill(&chan->irqtask);
> =20
> +	free_irq(chan->irq, chan->ofdev);

[Severity: High]
Is there a race condition here by calling free_irq() after tasklet_kill()?

If a hardware interrupt fires between tasklet_kill() and free_irq(), the ISR
will execute and re-schedule the tasklet. Will this result in a pending
tasklet running after the channel memory has been freed, causing a
use-after-free?

Should free_irq() be called first to ensure no new tasklets can be schedule=
d?

> +
>  	dma_pool_free(chan->re_dev->hw_desc_pool, chan->inb_ring_virt_addr,
>  		      chan->inb_phys_addr);
> =20
>  	dma_pool_free(chan->re_dev->hw_desc_pool, chan->oub_ring_virt_addr,
>  		      chan->oub_phys_addr);
> +
> +	platform_device_put(chan->ofdev);

[Severity: High]
Similar to the probe error path, does platform_device_put() cause a referen=
ce
count underflow here?

Since the device was created with of_platform_device_create(), would
of_platform_device_destroy() or platform_device_unregister() be the correct
way to clean it up?

>  }
> =20
>  static void fsl_re_remove(struct platform_device *ofdev)
>  {
>  	struct fsl_re_drv_private *re_priv;
> -	struct device *dev;
>  	int i;
> =20
> -	dev =3D &ofdev->dev;
> -	re_priv =3D dev_get_drvdata(dev);
> +	re_priv =3D platform_get_drvdata(ofdev);
> =20
>  	/* Cleanup chan related memory areas */
>  	for (i =3D 0; i < re_priv->total_chans; i++)

[Severity: High]
This is a pre-existing issue, but does fsl_re_remove() tear down the
channels in the wrong order relative to unregistering the DMA device?

fsl_re_remove() {
    ...
    for (i =3D 0; i < re_priv->total_chans; i++)
        fsl_re_remove_chan(re_priv->re_jrs[i]);

    dma_async_device_unregister(&re_priv->dma_dev);
}

Since dma_async_device_unregister() is called after destroying the channels,
is there a window where the DMA engine core might still issue new requests =
or
query channel status after the DMA pools and IRQs have been freed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260718231716.2301=
44-1-rosenp@gmail.com?part=3D1
