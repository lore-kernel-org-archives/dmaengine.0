Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2172737F9
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 21:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785187234; cv=none; b=oqhkNYR9e3gpVdfiMLKcMbvfWAtPR0hFaYEYbLU/aHPKFC1XVaTBrqGyw62x/uGZr90Og3YSzBzNWqhYmpVY3IEwQXYNbazIJTX82/wvs5nOrTGJ3g2FbbXxOryRrAH3k12AkxiH+l6HYkg8m7il2r1ASjgceWzSJhFu2zIorJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785187234; c=relaxed/simple;
	bh=RL8vxfCGLv9tCPHEgPXgz1okGTiRzvr9L9iVr+/wjoY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=C5y3faotmJsPChDuIT2vXQha9oyKuabxV76/cpp6HDWo3HIaeB1cu9Rl+ViMtf5mdepGM0XVVRmYEZ2zgB1BupMjRP24+E5NjsnX2/8g442+4Dc9L6Tb6gbiEpR2ToBAy5P8DC4td4x4yNwBHG/7kMvC0Cn8ub09WUkDTjDm0Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nNwe4CLT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nNwe4CLT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 085E81F000E9;
	Mon, 27 Jul 2026 21:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785187233;
	bh=1DsovQe9xkLsWrmv3TOqXB/gSVzMuI4x8nd3dxAAlCc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nNwe4CLTh0MPUHEMa+KkHtVKKBlO6UoBIFMP0FIUZAyPuqWUUSsdp/3i0wvrKnJx7
	 hdvQXoSU2J9phbiKwuzU8M5NQgHqW7Ppc7cx6gRrG9RkQh3obq/SA+ILmijLSffbLf
	 vOav8/YvWsHsM7RgSIXAO1Jgq+FmpsWZZoqKNcCYSlYaLInVkRgGvuU7rmBCGAAQUq
	 O+GeI/dx6UM4QdY6CljjrNIloGgAM21rp4zwJ/ks0S6Gwbt+UZ/IATQjzN7uOpvPrh
	 XVavoCCHQ9f4c4ahGDevJXCBL5QpkM7KUzTAYY8OwDdu9ppX0yhRHFAAWs9QIuiugR
	 xvmZ/ff7QOojA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 51/64] dmaengine: bcm2835: kill vchan BH on teardown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <2079c09aba6b298cad25fb95b062ac370a65452b.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <2079c09aba6b298cad25fb95b062ac370a65452b.1785183549.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 21:20:32 +0000
Message-Id: <20260727212033.085E81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing of_dma_controller_free() in the probe error path and remov=
e function leaves a dangling pointer in the OF DMA list.
- [High] Force unbinding the driver while a client holds a DMA channel leak=
s the channel's IRQ and DMA pool, leading to a Use-After-Free when the IRQ =
fires.
--

--- Patch [51]: [PATCH v2 51/64] dmaengine: bcm2835: kill vchan BH on teard=
own ---
commit 922bf2cdbf2470f43f83cc2698c5817aa6b5f545
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: bcm2835: kill vchan BH on teardown

Use dma_chan_kill_bh() for virt-dma cleanup instead of tasklet_kill().

> diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
> index 06d830d368822..68e86c8d3d439 100644
> --- a/drivers/dma/bcm2835-dma.c
> +++ b/drivers/dma/bcm2835-dma.c
> @@ -829,7 +829,7 @@ static void bcm2835_dma_free(struct bcm2835_dmadev *o=
d)
>  	list_for_each_entry_safe(c, next, &od->ddev.channels,
>  				 vc.chan.device_node) {
>  		list_del(&c->vc.chan.device_node);
> -		tasklet_kill(&c->vc.task);
> +		dma_chan_kill_bh(&c->vc.chan);
>  	}
> =20
>  	dma_unmap_page_attrs(od->ddev.dev, od->zero_page, PAGE_SIZE,

[Severity: High]
This is a pre-existing issue, but I noticed a potential leak and use-after-=
free
if dma_async_device_register() fails in bcm2835_dma_probe() or if the driver
is forcefully unbound via sysfs.

In bcm2835_dma_probe(), if dma_async_device_register() fails, the error path
jumps to err_no_dma:

drivers/dma/bcm2835-dma.c:bcm2835_dma_probe() {
    ...
	rc =3D dma_async_device_register(&od->ddev);
	if (rc) {
		dev_err(&pdev->dev,
			"Failed to register slave DMA engine device: %d\n", rc);
		goto err_no_dma;
	}
    ...
err_no_dma:
	bcm2835_dma_free(od);
	return rc;
}

Since of_dma_controller_register() was called earlier in the probe function,
does this error path leave a dangling pointer in the OF DMA list?

If the devm-managed bcm2835_dmadev struct is freed automatically by devres,
any subsequent DMA channel request from another driver matching this device
tree node might dereference the freed pointer during the bcm2835_dma_xlate
callback.

Similarly, in bcm2835_dma_remove(), the OF DMA controller is not freed:

drivers/dma/bcm2835-dma.c:bcm2835_dma_remove() {
	struct bcm2835_dmadev *od =3D platform_get_drvdata(pdev);

	dma_async_device_unregister(&od->ddev);
	bcm2835_dma_free(od);
}

Should of_dma_controller_free() be called in both of these paths?

[Severity: High]
This is also a pre-existing issue, but I noticed another potential
use-after-free and memory leak if the driver is forcefully unbound via sysfs
while a client still holds a DMA channel.

When a client requests a channel, an IRQ and a DMA pool are dynamically
allocated:

drivers/dma/bcm2835-dma.c:bcm2835_dma_alloc_chan_resources() {
    ...
	return request_irq(c->irq_number, bcm2835_dma_callback,
			   c->irq_flags, "DMA IRQ", c);
}

If the driver is unbound via sysfs, bcm2835_dma_remove() executes and retur=
ns
without tearing down active channel resources, as the DMA engine core skips
forcefully releasing channel resources.

Since the IRQ was requested without devm_, it remains registered after the
driver memory (struct bcm2835_chan) is automatically freed by devres.

Could a subsequent hardware interrupt execute bcm2835_dma_callback() and
dereference the freed channel pointer?

drivers/dma/bcm2835-dma.c:bcm2835_dma_callback() {
    ...
	spin_lock_irqsave(&c->vc.lock, flags);
    ...
}

Should we ensure that free_irq() and dma_pool_destroy() are called when
cleaning up these resources during driver removal?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785183549.gi=
t.allen.lkml@gmail.com?part=3D51
