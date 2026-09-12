Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D677F361DA6
	for <dmaengine@vger.kernel.org>; Sat, 12 Sep 2026 16:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789228874; cv=none; b=mdd32WkO+LXUhS80Km8jZFUFd0epEIyimBB0AR5PD0doe48d6B73fpb4E4Tfu9R4fdF9BNePh6E7M/mbwRVVGjbcehalf0uKFT8D7KRPs3bA4p0/c842Kkx52iH/9T+QNJcDmRDK907aAgYCZ7pmHQ3vNz7mXxM9lQcSWsXmXFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789228874; c=relaxed/simple;
	bh=wnCIyZrUUlPZPy707iKJXGVUwDhIqKhNyuB/62tvx+U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iD6Qy/zVH+PQPrzb17lhTfPhroizK2KY5OG/kvWGIcQzK+U3ju90Gsa3Q0U5+gdk2e5vCGf4VRYLvwGYItvsHO9OamSnzoed/jLVR14QhSeUHI84BiC2updSLvONAyX/d1wGvKWq953XRKlzbQldgyR/jHSV0uIp02S6F4zCCnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hd+oXs6g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hd+oXs6g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61E091F00893;
	Sat, 12 Sep 2026 16:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789228872;
	bh=m/l0RD8cpUD7/R5A5yQozaHrGYGbuc3+/dpESj9fxro=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Hd+oXs6gtxnVy+e2g6bKcqtrsXgQPioo37QeTUB/DiCcmw8f2udVQzyARrKKzVvCf
	 QSnANzxKDLUZXnI3elKdS4eytnMQ8oSwr68L9RHeohD9FK8lQJTJqHhIxdnwUZ2RHO
	 9DWVFPbOwYC6RDvJlqrWVtGINOLfiqi1BwkG0CcaCeC1VfHUgm7ADdBpCrizEhT5Gz
	 r5IOoS+/58gP+gQaJZ3tm/WICjLSdS7eURRGizUHKQ4V9oxrQKdw2Yf/m1F2K9cbS4
	 ybHonQ2D229PAA7JwjgK7CAiW7FB0+/MNS71PNGW+ytHmJhToiAIZWyDB62crYWLsE
	 xnec0+V1OqPKQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: st_fdma: fix potential use-after-free in
 vchan tasklets
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guangshuo Li" <lgs201920130244@gmail.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260912154629.1021632-1-lgs201920130244@gmail.com>
References: <20260912154629.1021632-1-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2026 16:01:11 +0000
Message-Id: <20260912160112.61E091F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Eager hardware teardown in `st_fdma_remove()` before the devres-ma=
naged DMA engine is unregistered leads to Use-After-Free.
- [High] Devres allocation of the kref-counted `struct dma_device` leads to=
 a Use-After-Free upon driver unbind.
- [High] Missing `vchan_free_chan_resources()` in `st_fdma_free_chan_res()`=
 causes memory leaks, pool corruption, and potential UAF via tasklets.
- [High] NULL pointer dereference in `st_fdma_desc_residue()` when computin=
g residue for idle channels.
- [Medium] Manual list deletion in `st_fdma_free()` during the probe error =
path prevents devres from cleaning up DMA channel resources.
--

commit 90c2db247c98ba2439c84ab05bf6b528e44ffdf2
Author: Guangshuo Li <lgs201920130244@gmail.com>

dmaengine: st_fdma: fix potential use-after-free in vchan tasklets

The commit updates st_fdma_remove to kill all vchan tasklets after freeing
the IRQ. This prevents new interrupt handlers from scheduling them and
waits for any pending tasklet to finish before the channel storage is
released.

> diff --git a/drivers/dma/st_fdma.c b/drivers/dma/st_fdma.c
> index d9547017f3bd6..23071cbf18663 100644
> --- a/drivers/dma/st_fdma.c
> +++ b/drivers/dma/st_fdma.c
> @@ -846,8 +846,13 @@ static int st_fdma_probe(struct platform_device *pde=
v)
>  static void st_fdma_remove(struct platform_device *pdev)
>  {
>  	struct st_fdma_dev *fdev =3D platform_get_drvdata(pdev);
> +	int i;
> =20
>  	devm_free_irq(&pdev->dev, fdev->irq, fdev);
> +
> +	for (i =3D 0; i < fdev->nr_channels; i++)
> +		tasklet_kill(&fdev->chans[i].vchan.task);
> +
>  	st_slim_rproc_put(fdev->slim_rproc);

[Severity: High]
This isn't a bug introduced by this patch, but does tearing down the
hardware backing the DMA engine here cause a use-after-free?

st_slim_rproc_put() synchronously tears down the hardware before
returning. However, unregistration of the DMA engine itself via
dma_async_device_unregister() happens later via devres.

During this window, or if clients hold channel references longer, any
interaction like st_fdma_terminate_all() will dereference the freed
slim_rproc. For example, in st_fdma_free_chan_res():

drivers/dma/st_fdma.c:st_fdma_free_chan_res() {
	struct st_fdma_chan *fchan =3D to_st_fdma_chan(chan);
	struct rproc *rproc =3D fchan->fdev->slim_rproc->rproc;
	[ ... ]
}

>  	of_dma_controller_free(pdev->dev.of_node);
>  }

[Severity: Medium]
This is a pre-existing issue, but can the error path in probe leak channel
resources?

Looking at st_fdma_probe() and st_fdma_free():

drivers/dma/st_fdma.c:st_fdma_probe() {
	[ ... ]
	ret =3D dma_async_device_register(&fdev->dma_device);
	if (ret) {
		dev_err(&pdev->dev,
			"Failed to register dma device (%d)\n", ret);
		goto err_rproc;
	}
	[ ... ]
err_rproc:
	st_fdma_free(fdev);
	st_slim_rproc_put(fdev->slim_rproc);
err:
	return ret;
}

drivers/dma/st_fdma.c:st_fdma_free() {
	[ ... ]
	for (i =3D 0; i < fdev->nr_channels; i++) {
		fchan =3D &fdev->chans[i];
		list_del(&fchan->vchan.chan.device_node);
	[ ... ]
}

If a failure occurs during probe, st_fdma_free() removes the channels from
fdev->dma_device.channels via list_del().

When devres subsequently runs dma_async_device_unregister(), it sees an
empty list and silently skips tearing down the channels in sysfs, which may
leak channel IDAs, sysfs nodes, and memory.

[Severity: High]
This is a pre-existing issue, but will embedding the kref-counted
struct dma_device in a devm_kzalloc() allocation lead to a use-after-free
upon driver unbind?

drivers/dma/st_fdma.c:st_fdma_probe() {
	[ ... ]
	fdev =3D devm_kzalloc(&pdev->dev, sizeof(*fdev), GFP_KERNEL);
	if (!fdev)
		return -ENOMEM;
	[ ... ]
}

struct dma_device is dynamically kref-counted by the dmaengine core to
ensure its lifetime exceeds that of any active client references. By
allocating it via devm_kzalloc(), the driver guarantees the memory will be
indiscriminately freed by devres when remove() completes.

If a user unbinds the driver via sysfs while a client retains a reference
to a DMA channel, this might cause a use-after-free when clients later drop
their references.

[Severity: High]
This isn't a bug introduced by this patch, but might the omission of
vchan_free_chan_resources() here result in memory leaks and pending
tasklets executing after the client module is unloaded?

drivers/dma/st_fdma.c:st_fdma_free_chan_res() {
	[ ... ]
	if (fchan->cfg.type !=3D ST_FDMA_TYPE_FREE_RUN)
		st_fdma_dreq_put(fchan);

	spin_lock_irqsave(&fchan->vchan.lock, flags);
	fchan->fdesc =3D NULL;
	spin_unlock_irqrestore(&fchan->vchan.lock, flags);

	dma_pool_destroy(fchan->node_pool);
	fchan->node_pool =3D NULL;
	[ ... ]
}

The driver relies on the virt-dma framework but omits the required
vchan_free_chan_resources() call during channel cleanup.

This could leave virtual descriptors allocated, stranding their pool memory,
and fail to kill any pending tasklets that might fire later.

[Severity: High]
This is a pre-existing issue, but could computing the residue for idle
channels in this way trigger a NULL pointer dereference?

drivers/dma/st_fdma.c:st_fdma_desc_residue() {
	struct st_fdma_desc *fdesc =3D fchan->fdesc;
	size_t residue =3D 0;
	dma_addr_t cur_addr =3D 0;
	int i;

	if (in_progress) {
		[ ... ]
	}

	for (i =3D fchan->fdesc->n_nodes - 1 ; i >=3D 0; i--) {
		[ ... ]
	}
	[ ... ]
}

drivers/dma/st_fdma.c:st_fdma_tx_status() {
	[ ... ]
	if (fchan->fdesc && cookie =3D=3D fchan->fdesc->vdesc.tx.cookie)
		txstate->residue =3D st_fdma_desc_residue(fchan, vd, true);
	else if (vd)
		txstate->residue =3D st_fdma_desc_residue(fchan, vd, false);
	[ ... ]
}

If a client calls dmaengine_tx_status() on a pending transfer cookie
before it has been issued to the hardware, the channel may be idle
(fchan->fdesc is NULL).

Calling st_fdma_desc_residue(fchan, vd, false) ignores the passed vd
parameter and unconditionally dereferences fchan->fdesc.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260912154629.1021=
632-1-lgs201920130244@gmail.com?part=3D1
