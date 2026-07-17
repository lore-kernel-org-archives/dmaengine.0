Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81F437B015
	for <dmaengine@vger.kernel.org>; Fri, 17 Jul 2026 05:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784265657; cv=none; b=Wh4tB3ev1Eqsl9FARHA74bNTj+zfPY7Yr0A82pDkKfB0TrbuqQYvsCpgLZu4g2Z5kU42CpfloP+bdFyP8zQ9sxMNDfcpc3cd+o0tZX89JGnGRD3QqXEn320ip31c2OEeNblt6QCmhNZ4JvYOBGUMjvMGeYGhO028r3T7M434vJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784265657; c=relaxed/simple;
	bh=IswLOOEbkghZfCcsmZFk6ZVjkKwAi6P9EUTpSq1qZw4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ppMHo9iALNC4RSNxz8dsLPSs2l+d2V3USiK5cLl0B6vJ/BZkkAEmrmYDl8jGn6vRLbmgo6jbtKbnt2jNdVXspjitQ6F/jeKZ1E0D1OS9Y4iVg9fVSQ5JWj7WcUMkgyNp/TFSr4E0OqSqi/yzR6esWB8Z7xlTpC9mpVllWAKMIoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A3062KR8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A3062KR8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FFBC1F000E9;
	Fri, 17 Jul 2026 05:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784265653;
	bh=vZAuAHV6KGG9fiir+Vp2HC8RFeuSPFF5Iz6LAeDaDcY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A3062KR8aVp0dpDSjxxIWeoS2BxosfhKHVDEe+sFUYBHpsTkI25r3aJwOUh4wQmK8
	 HdMxcXf+MRWiIVxYQEPUA7GiVUszW04M/lHtFlxBXsX0OyuHtf/h/fvE25BZy0A/3O
	 qfASHr3o4Fj2zuZPutaaa7oMYTMserZy8yayHHCQDb5/5vw6FbP4mymoKNnMTu6FA5
	 6WnZ36AEsqreVricDOy/Q4Y/9LxDOT4+7xYQH901DpmYuQNLmVXqDL/JBTdDq/6/0t
	 0+t0Qf3uxtnHaKKLSvV1bsmnyw0V2nagjT4Nig1apN+6NnGiBVJhtvovZ4SLWwlWml
	 FUb0kLDN3BewA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 05/14] dmaengine: dw-edma: Add partial channel
 ownership mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260717050308.2144108-6-den@valinux.co.jp>
References: <20260717050308.2144108-1-den@valinux.co.jp>
 <20260717050308.2144108-6-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 05:20:53 +0000
Message-Id: <20260717052053.6FFBC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incorrect teardown order in dw_edma_remove() causes a race conditi=
on by freeing IRQs and disabling hardware before unregistering the DMA devi=
ce.
- [High] The driver requests shared IRQs before initializing its channel da=
ta structures, creating a race window where an early interrupt could access=
 uninitialized memory.
--

--- Patch [5]: [PATCH v5 05/14] dmaengine: dw-edma: Add partial channel own=
ership mode ---
commit 430bec8da60538800159c6651e2aa6c04e375a54
Author: Koichiro Den <den@valinux.co.jp>

dmaengine: dw-edma: Add partial channel ownership mode

This commit introduces a partial ownership flag for DesignWare eDMA instanc=
es
to preserve controller-wide state owned by another OS instance. It skips the
initial core reset, using a limited quiesce path instead of the full core-o=
ff
path during probe and remove.

> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-=
edma-core.c
> index 392981f3b7bb5..cef75da3f2f6b 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c

[ ... ]

> @@ -1039,8 +1084,18 @@ int dw_edma_probe(struct dw_edma_chip *chip)
>  	snprintf(dw->name, sizeof(dw->name), "dw-edma-core:%s",
>  		 dev_name(chip->dev));
> =20
> -	/* Disable eDMA, only to establish the ideal initial conditions */
> -	dw_edma_core_off(dw);
> +	if (chip->flags & DW_EDMA_CHIP_PARTIAL) {
> +		/*
> +		 * Do not reset the shared controller, but drain stale state
> +		 * from resources represented by this instance.
> +		 */
> +		err =3D dw_edma_core_quiesce(dw);
> +		if (err)
> +			return err;
> +	} else {
> +		/* Disable eDMA only when this instance owns the controller. */
> +		dw_edma_core_off(dw);
> +	}
> =20
>  	/* Request IRQs */
>  	err =3D dw_edma_irq_request(dw, &wr_alloc, &rd_alloc);

[Severity: High]
This is a pre-existing issue, but does requesting shared IRQs before
initializing channel data structures open a race window?

In dw_edma_probe(), dw_edma_irq_request() installs an IRQF_SHARED handler.
Following this, dw_edma_channel_setup() begins initializing channels and
exposes them to the interrupt handler by setting the mask bit:

irq->wr_mask |=3D BIT(chan->id);

If a peer device on the shared IRQ line triggers an interrupt before
vchan_init() has initialized the channel's spinlocks and list heads, could
the handler execute dw_edma_done_interrupt() and attempt to acquire
uninitialized locks or dereference uninitialized lists?

[ ... ]

> @@ -1078,14 +1133,16 @@ int dw_edma_remove(struct dw_edma_chip *chip)
>  	struct dw_edma_chan *chan, *_chan;
>  	struct device *dev =3D chip->dev;
>  	struct dw_edma *dw =3D chip->dw;
> -	int i;
> +	int i, err =3D 0;
> =20
>  	/* Skip removal if no private data found */
>  	if (!dw)
>  		return -ENODEV;
> =20
> -	/* Disable eDMA */
> -	dw_edma_core_off(dw);
> +	if (chip->flags & DW_EDMA_CHIP_PARTIAL)
> +		err =3D dw_edma_core_quiesce(dw);
> +	else
> +		dw_edma_core_off(dw);
> =20
>  	/* Free irqs */
>  	for (i =3D (dw->nr_irqs - 1); i >=3D 0; i--)
>  		free_irq(chip->ops->irq_vector(dev, i), &dw->irq[i]);
>  	dw_edma_emul_irq_free(dw);
> =20
>  	/* Deregister eDMA device */
>  	dma_async_device_unregister(&dw->dma);

[Severity: High]
This is a pre-existing issue, but does disabling the hardware and freeing
IRQs before unregistering the DMA device create a race condition?

If a client DMA driver holds a reference to the eDMA channel and submits a
new DMA request after dw_edma_remove() powers down the hardware, but before
dma_async_device_unregister() removes the device from the subsystem, could
the client access powered-down hardware registers and cause a bus fault?

Would it be safer to reverse this teardown order so the public interface is
unregistered before freeing the underlying resources?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717050308.2144=
108-1-den@valinux.co.jp?part=3D5
