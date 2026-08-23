Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B2D1A682A
	for <dmaengine@vger.kernel.org>; Sun, 23 Aug 2026 05:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787462189; cv=none; b=L5LmjV7if59+NBb1/1A8bI9pk9kTFZqzu3Wrce9+ymQjk3YdLYrduXTRGHg7jirlhja19xn4XpsN9XbMg9eezN55Z78UUCWLdg8SDF0fxoWDWVzfaJH9UUJvSZjFso0syx/QLBykagCR37A81ypw5GlQ8V75cZGJSKC2i5P25Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787462189; c=relaxed/simple;
	bh=SlXXMeFU428lOr3jdFCgh8flLhcrq2OGjdhSN3wnRlg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eo13H5LF2paaqzWgj1+LJdBiALWlToVlADsTozGMbyk1pbaXr8erCrwGzsGRo4pVsBEJapWbRS7Px1SvgsDvpXilNYhatlT/5hUKWFH3IkPMGW6ULOqz70GHDGGVqR0euaO1T0F51WX5Jbv9I6NlVdJdAcYT9oh2wBs9kuPU8Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DNqJSMXF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DNqJSMXF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 257531F000E9;
	Sun, 23 Aug 2026 05:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787462188;
	bh=ZmffA46ouCZxUj7q5mrt8Fkg/ZSwTqtBR9J251o766c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DNqJSMXFmzlDHL9DB8CbU/SqXn04aulWX5mFdeh1H9PsXjqrc3R51KV4dxhn4Zym0
	 o1pxuHaUdHN0YR2IrC8PQuSvy9A4sKsikwrGIAbZN6BpEqpdoMy4VF20f7tVE9bbB6
	 ZrdNarphTKDVeYHO1m0pNiJduqnKnIW2VRFp6S/P8xWS6ibEOtx8wzZlldwPen32NH
	 q31/Yc4+2TygIor/TaDKDZ5Zsu+kRkdSXcMqRK03E6e+++lmBBVbhktyPY0tYBN6Ey
	 Y/UdP0tVlmsIrE618f8sYh+o8mTTsCrOjkiWCv4VEZkXZo50uEC80cm2E0COJecAXa
	 zoVtLm4K6/ttQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv4] dmaengine: at_hdmac: use devm APIs in at_dma_probe()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Frank.Li@kernel.org, vkoul@kernel.org
In-Reply-To: <20260823050303.17725-1-rosenp@gmail.com>
References: <20260823050303.17725-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 23 Aug 2026 05:16:27 +0000
Message-Id: <20260823051628.257531F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Pending virtual channel tasklets are not explicitly killed before =
freeing driver resources during module unload or error paths.
- [High] Incorrect teardown order destroys DMA pools before freeing the IRQ=
, risking a use-after-free during concurrent IRQ handling.
--

--- Patch [1]: [PATCHv4] dmaengine: at_hdmac: use devm APIs in at_dma_probe=
() ---
commit 5e07523a5a1740589f78ad9b3692760b7a57f76e
Author: Rosen Penev <rosenp@gmail.com>

dmaengine: at_hdmac: use devm APIs in at_dma_probe()

Convert resource allocation and setup in probe() to use devm-managed APIs.
Simplify the error handling path and remove explicit cleanup code.

> diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
> index e5b30a57c477a..f16cf29ca5487 100644
> --- a/drivers/dma/at_hdmac.c
> +++ b/drivers/dma/at_hdmac.c
> @@ -1980,40 +1980,34 @@ static int __init at_dma_probe(struct platform_de=
vice *pdev)
>  	atdma->dma_device.cap_mask =3D plat_dat->cap_mask;
>  	atdma->all_chan_mask =3D (1 << plat_dat->nr_channels) - 1;
> =20
> -	atdma->clk =3D devm_clk_get(&pdev->dev, "dma_clk");
> +	atdma->clk =3D devm_clk_get_enabled(&pdev->dev, "dma_clk");
>  	if (IS_ERR(atdma->clk))
>  		return PTR_ERR(atdma->clk);
> =20
> -	err =3D clk_prepare_enable(atdma->clk);
> -	if (err)
> -		return err;
> -
>  	/* force dma off, just in case */
>  	at_dma_off(atdma);
> =20
> -	err =3D request_irq(irq, at_dma_interrupt, 0, "at_hdmac", atdma);
> +	err =3D devm_request_irq(&pdev->dev, irq, at_dma_interrupt, 0, "at_hdma=
c", atdma);
>  	if (err)
> -		goto err_irq;
> +		return err;
> =20
>  	platform_set_drvdata(pdev, atdma);
> =20
>  	/* create a pool of consistent memory blocks for hardware descriptors */
> -	atdma->lli_pool =3D dma_pool_create("at_hdmac_lli_pool",
> +	atdma->lli_pool =3D dmam_pool_create("at_hdmac_lli_pool",
>  					  &pdev->dev, sizeof(struct at_lli),
>  					  4 /* word alignment */, 0);
>  	if (!atdma->lli_pool) {
>  		dev_err(&pdev->dev, "Unable to allocate DMA LLI descriptor pool\n");
> -		err =3D -ENOMEM;
> -		goto err_desc_pool_create;
> +		return -ENOMEM;
>  	}
> =20
>  	/* create a pool of consistent memory blocks for memset blocks */
> -	atdma->memset_pool =3D dma_pool_create("at_hdmac_memset_pool",
> +	atdma->memset_pool =3D dmam_pool_create("at_hdmac_memset_pool",
>  					     &pdev->dev, sizeof(int), 4, 0);
>  	if (!atdma->memset_pool) {
>  		dev_err(&pdev->dev, "No memory for memset dma pool\n");
> -		err =3D -ENOMEM;
> -		goto err_memset_pool_create;
> +		return -ENOMEM;
>  	}

[Severity: High]
This isn't a bug introduced by this patch, but converting to devres APIs
highlights a pre-existing issue with the teardown order.

In at_dma_probe(), devm_request_irq() is called before dmam_pool_create().
Because devres actions execute in reverse order, dmam_pool_destroy() will be
invoked before the IRQ is freed during unbind.

While at_dma_remove() calls at_dma_off() to disable hardware interrupts,
this doesn't synchronize with an already-executing IRQ handler on another
CPU. If an IRQ handler is actively running when unbind is initiated, devres
will destroy the descriptor pools while the handler might still attempt to
access them.

Should the IRQ be requested after the pools are created, or perhaps use a
manual devm_add_action() to ensure the IRQ is freed before the pools are
destroyed?

[ ... ]

> @@ -2121,22 +2103,12 @@ static void at_dma_remove(struct platform_device =
*pdev)
>  	struct dma_chan		*chan, *_chan;
> =20
>  	at_dma_off(atdma);
> -	if (pdev->dev.of_node)
> -		of_dma_controller_free(pdev->dev.of_node);
> -	dma_async_device_unregister(&atdma->dma_device);
> -
> -	dma_pool_destroy(atdma->memset_pool);
> -	dma_pool_destroy(atdma->lli_pool);
> -	free_irq(platform_get_irq(pdev, 0), atdma);
> =20
>  	list_for_each_entry_safe(chan, _chan, &atdma->dma_device.channels,
>  			device_node) {
>  		/* Disable interrupts */
>  		atc_disable_chan_irq(atdma, chan->chan_id);
> -		list_del(&chan->device_node);
>  	}
> -
> -	clk_disable_unprepare(atdma->clk);
>  }

[Severity: High]
This is a pre-existing issue, but does this function need to kill the virtu=
al
channel tasklets before driver teardown completes?

The driver uses vchan_init(), which sets up a completion tasklet. During
module unload or unbind, neither the explicit remove path nor the devres
cleanup calls tasklet_kill() (e.g., via vchan_free()).

If a DMA interrupt fires and schedules a tasklet just before at_dma_remove()
executes (or before the IRQ is finally freed by devres), the tasklet can
remain pending. When the devres cleanup ultimately frees the atdma memory
structure, the pending tasklet could execute and access the freed memory,
leading to a use-after-free.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260823050303.1772=
5-1-rosenp@gmail.com?part=3D1
