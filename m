Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C55D3803C3
	for <dmaengine@vger.kernel.org>; Tue, 14 Jul 2026 02:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783996172; cv=none; b=i/r+2BKUavhCwE0TVZmwOuumWSxRBOHAQ09TMl3hcN8hvwe27ZjnpYDdU6ACPRL5+OJww0icpQ8Tc+G8oiYUOLaiA8zpB+FZk7wNyEOjID/zQ1uvbNGpcVrQoywQfqc94fz0JWX7HLe3WJApxEfpYv6VqyNt4AG819UZ8DWjnLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783996172; c=relaxed/simple;
	bh=O0X5TL5H5XG5ZJMC+TxJR8ccFwbNHB8c8bBnNhyeJQg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WSJ6G0aHeJ9tn6/dA8UP5l3Bf4IFu7Cafr88C+TsmwEvXZ4a1p3hGGvj47Pd2SHpHCCPUiQiP/bIPMZjtpLNzWC7scazx7yUdhnY4iUTHJ3tCWXB6LGgCnEUsvy0i6ptuBtBa1/KFcKJ8J5Gj8zctc5bioFJaPGSfU7Rd+yu/Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KKl10l5H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KKl10l5H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27FD41F00A3A;
	Tue, 14 Jul 2026 02:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783996171;
	bh=AHnejMFwW7/MLol1nVrPrWVMyC/k4env1GvU+a/fR9o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KKl10l5HueRxY4N5XpJHWM/6yErAr09orFVEiUJuy0Vp+WQ/oDENbX1mxLUUz+4Sy
	 RJDKjxzG4tcVf1ndWf6H/Qfir94EKtCpHbPyIZFXeE63oFlTMimS9FrdCXuJeJj35Q
	 j8a8rkUkLATdggDMrPSS4rXei38QlaAvJg/Zj6tfzQpa2jI+yBJjA2eDKrOSI8J2Y8
	 wimf65/fjGVr3sBioyxcDsGs75wAEJeauAPFlb94L0pea3deFlXckSILewQZWtXxgZ
	 zY3Q/K6rS35qSjiJi75bv/aSFRoWfd5xKmpgMwOPodg/al/Z2Me6cJNQAYiLevIb6T
	 gRD9cFOOYGFiA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: moxart: Fix use-after-free by proper tasklet
 cleanup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongling Zeng" <zenghongling@kylinos.cn>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260714021858.642473-1-zenghongling@kylinos.cn>
References: <20260714021858.642473-1-zenghongling@kylinos.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 02:29:29 +0000
Message-Id: <20260714022930.27FD41F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Calling list_del() on channel nodes in moxart_dma_free_channels() =
causes dma_async_device_unregister() to silently skip channel cleanup, perm=
anently leaking sysfs entries, IDA tags, and per-cpu memory.

Pre-existing issues:
- [High] The DMA hardware is not halted during device removal, which can le=
ad to memory corruption.
--

--- Patch [1]: [PATCH] dmaengine: moxart: Fix use-after-free by proper task=
let cleanup ---
commit 17dd1a2edfd46732b7bad62b5a03240b9b705283
Author: Hongling Zeng <zenghongling@kylinos.cn>

dmaengine: moxart: Fix use-after-free by proper tasklet cleanup

This commit attempts to fix a use-after-free vulnerability in the moxart
DMA driver by explicitly killing tasklets before freeing the memory. It
introduces a helper to stop tasklets and reorganizes the remove and probe
error paths.

> diff --git a/drivers/dma/moxart-dma.c b/drivers/dma/moxart-dma.c
> index 442f5aa16031f..d01eaa6b964bc 100644
> --- a/drivers/dma/moxart-dma.c
> +++ b/drivers/dma/moxart-dma.c
> @@ -553,6 +553,22 @@ static irqreturn_t moxart_dma_interrupt(int irq, voi=
d *devid)
>  	return IRQ_HANDLED;
>  }
> =20
> +static void moxart_dma_free_channels(struct moxart_dmadev *mdc)
> +{
> +	struct moxart_chan *ch;
> +	int i;
> +
> +	for (i =3D 0; i < APB_DMA_MAX_CHANNEL; i++) {
> +		ch =3D &mdc->slave_chans[i];
> +		/*
> +		 * Wait for any scheduled tasklet to complete before channel
> +		 * memory is freed by devres.
> +		 */
> +		tasklet_kill(&ch->vc.task);
> +		list_del(&ch->vc.chan.device_node);

[Severity: High]
Does this code skip channel cleanup in the core DMA engine?

By calling list_del() on the channel nodes here, the channels are removed
from the DMA controller's device->channels list. When
dma_async_device_unregister() is called later in moxart_remove(), it
iterates over an empty list and silently skips calling
__dma_async_device_channel_unregister().

Won't this permanently leak sysfs entries, IDA tags, and per-cpu memory
for every DMA channel?

> +	}
> +}
> +

[ ... ]

> @@ -627,10 +647,12 @@ static int moxart_probe(struct platform_device *pde=
v)
>  static void moxart_remove(struct platform_device *pdev)
>  {
>  	struct moxart_dmadev *m =3D platform_get_drvdata(pdev);

[Severity: High]
This is a pre-existing issue, but does this remove sequence leave the DMA
hardware running?

The moxart_remove() callback does not appear to explicitly stop ongoing
hardware transfers before tearing down the driver. If a transfer is active
when the driver is unbound, the IRQ is freed and the client driver might
time out and free its DMA buffer.

Without explicitly clearing the enable bits (like APB_DMA_ENABLE) in the
hardware control registers, won't the runaway DMA hardware continue writing
asynchronously and potentially corrupt memory?

> =20
>  	devm_free_irq(&pdev->dev, m->irq, m);
> =20
> -	dma_async_device_unregister(&m->dma_slave);
> +	moxart_dma_free_channels(m);
> =20
>  	if (pdev->dev.of_node)
>  		of_dma_controller_free(pdev->dev.of_node);
> +
> +	dma_async_device_unregister(&m->dma_slave);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714021858.6424=
73-1-zenghongling@kylinos.cn?part=3D1
