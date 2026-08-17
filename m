Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4182235B631
	for <dmaengine@vger.kernel.org>; Mon, 17 Aug 2026 20:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786998310; cv=none; b=fUSNNQA56E6UekyK1V2twlxamOrgU91zZkMv2FoUQ8qZLshRSCdIVzA4D4apBlQWPIy9/q6UQWtrOBIP3LZG+dgz35CFP5K6va9pyXeTmkzuAYrvoxONy3CqqJaafV04BrmMFh/njLUJDcJUJoMSXDDwd5NyDlp5n22jPd9oTjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786998310; c=relaxed/simple;
	bh=txVCzu61sdHp5V2/RfZbTb4mznsvFUnORKG1elksQR8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RiLmczzHUiBDKKVq7XJIXs3a4KoudGAbsUJPoWRCrAiCZZnuPd0JKyqMiEKQ3GnQrjHwqZmIoMOtnrbHACLHl3Oeiji1ujFpGGg9xdgXYyqQgNNp+nH1UY1SWoZqdSRcr4GIMr94xWtqJXhYdNDGNWhokX/muPbx/nR8yQs1S58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fQa+D8up; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fQa+D8up"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98F8A1F000E9;
	Mon, 17 Aug 2026 20:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786998308;
	bh=cMomrpFyXL6gOoBUmAQ2hUj2WKLOj4HI0ZqcCAyFb5U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fQa+D8upkeGd9UQgM7fq7iQ0wa5iV50vCo4/pQeyh51pF9ZbW2crOESJljdK8Uxt8
	 l6YEjSafYC/XV/dcyg+gtzK3Eoj4C/lWE0SUEYTCJa0zz29YDMmJixb/8Ck4nPNx/L
	 dG7hXOBzH54Wd/sP+1yZ9oVAMZDjEHgFHCuWuLxYN4XdYk+vrdWSJHJMbTmcRduNIW
	 tAW8vcXFwlP3d+YFFg8V3Adm34klEuQU5s0f9DRcIiVpX8AE85lLskQDeFuTdgFLbg
	 6DKlJRa5eRNPZ9pui2zi1n2jMClIkBFpnpnSSwkcCjC+m8m0ZmLcCKmAswBQjMeD6+
	 30qHyqGy7oGpg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv3] dmaengine: at_hdmac: use devm APIs in probe()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260817201200.10952-1-rosenp@gmail.com>
References: <20260817201200.10952-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 20:25:08 +0000
Message-Id: <20260817202508.98F8A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver fails to kill `vchan` tasklets during driver removal an=
d probe error paths, risking a use-after-free.
- [High] Devres reverse-cleanup order destroys DMA pools before freeing the=
 IRQ, risking a use-after-free with concurrent ISRs.
--

--- Patch [1]: [PATCHv3] dmaengine: at_hdmac: use devm APIs in probe() ---
commit 100916adb459d4781232f09cf49ed4747fa5f88a
Author: Rosen Penev <rosenp@gmail.com>

dmaengine: at_hdmac: use devm APIs in probe()

Convert resource allocation and setup in probe() to use devm-managed APIs.
Simplify the error handling path and removes explicit cleanup code.

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

[Severity: High]
This isn't a bug introduced by this patch, but requesting the IRQ here befo=
re
the DMA pools are created establishes an unsafe devres cleanup order.

Because devres destroys resources in reverse order, devm will destroy the
DMA pools before freeing the IRQ.

If an ISR is actively running on another CPU during driver unbind and enters
an error path, could it dereference the already-freed pool memory, leading =
to
a use-after-free?

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

[Severity: High]
This is a pre-existing issue, but this driver unbind path does not synchron=
ously
kill pending vchan tasklets before returning.

If an interrupt fires during or just before unbind, the IRQ handler might
schedule the channel's tasklet.

While at_dma_remove() masks interrupts, it doesn't wait for or kill already
scheduled tasklets via tasklet_kill(). Is there a risk that devres will free
the memory while the tasklet continues executing, resulting in a use-after-=
free?

> -
> -	clk_disable_unprepare(atdma->clk);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817201200.1095=
2-1-rosenp@gmail.com?part=3D1
