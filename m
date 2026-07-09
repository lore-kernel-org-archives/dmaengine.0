Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDB236DA0F
	for <dmaengine@vger.kernel.org>; Thu,  9 Jul 2026 02:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783565966; cv=none; b=H22tSKZKtbZnch2X1Mpbychm96zArFA8ksuRp/zZ8sNwgLH75l1e92D0eyCMJJ4bq4CJ1p73cMMWEfDiI8QQwA4Bx7+ABJaBkHaQFJHUZ9NFkrcIUcJKAJzZ2/STXFwhk4u7sAl+3+SaSVyiGFYOzLbEhqIuechBA3MxvqF8ajw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783565966; c=relaxed/simple;
	bh=Y1fl6HI4gAOL9SILq0gtdGcrC0O+6Dmrxs9vzlumJ14=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VCfnIB5HcMCVWzHnGUaNgDgNXCpcRxxrMIj5rCweCdxLkH60TqLYWMfT7W61DY9TAxxOWrTOey5SXyQt48D/T1OBzbzPqrj6ivq7DpC38NuVYP63ugqpKFeNN3212gc4OqzFfHi88tc8ycGV1Oh60VomzU33X6O0xVNXKDB6k1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d1AC6/OI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d1AC6/OI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDE901F000E9;
	Thu,  9 Jul 2026 02:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783565965;
	bh=AQ8xkupMMymqUNTt60FTRpifcQh5D0l3KjbehZ91vuM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d1AC6/OIv0dsqFD8GBqSnku5XA0HFGNwrCuPAivSDZYF0SaCbTHi2uu5n7/ba6D2j
	 0UgnBXGqTOwHHeofig8i2db3xFEr5h4zOMskTIoRX4VxbL5vq1wT1BdVo1+SjIXeeO
	 ReTWASYZhcK+JBvSCxsOHEPTS4Xd9z59n3BsjWmONM8o/Z7NIxIxc9qF1WR997kera
	 Msc05W7LLGHM5NvoC/mUGyHkJuT/KlO+3aEfv9bdL8x86VqZSVOo0U0nFgI0IcTbEQ
	 8GDtOkQiii5oBw9JhVF2M9FulI9bPwDtEFalL21RWfQkj+gTcEIat+OuY7qrt+GIej
	 JHjRdXbJyHRxA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6] dma: at_hdmac: Fix use-after-free by proper tasklet
  cleanup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongling Zeng" <zenghongling@kylinos.cn>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260709023922.645413-1-zenghongling@kylinos.cn>
References: <20260709023922.645413-1-zenghongling@kylinos.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 02:59:24 +0000
Message-Id: <20260709025924.CDE901F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Use-After-Free of `chan->dev` in `at_dma_interrupt()` due to impro=
per cleanup ordering.
- [High] Hardware polling loops without timeouts can cause infinite kernel =
hangs.
--

--- Patch [1]: [PATCH v6] dma: at_hdmac: Fix use-after-free by proper taskl=
et  cleanup ---
commit 7d3c8db7581644f08893dedd5b27d08992a22d00
Author: Hongling Zeng <zenghongling@kylinos.cn>

dma: at_hdmac: Fix use-after-free by proper tasklet cleanup

Current cleanup paths have a use-after-free vulnerability where vchan_init()
creates tasklets that access at_dma_chan memory. The fix requires careful
ordering, such as calling free_irq() first to synchronize with running IRQ
handlers, and killing tasklets before freeing other resources.

Closes: https://lore.kernel.org/all/20260604073945.54B311F00898@smtp.kernel=
.org/

> diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
> index e5b30a57c477a..09b1aedefb458 100644
> --- a/drivers/dma/at_hdmac.c
> +++ b/drivers/dma/at_hdmac.c
> @@ -1940,6 +1940,20 @@ static void at_dma_off(struct at_dma *atdma)
>  		cpu_relax();

[Severity: High]
This is a pre-existing issue, but does this loop risk an infinite hang if t=
he
hardware becomes unresponsive?=20

If dma_readl(atdma, CHSR) always returns a value with atdma->all_chan_mask
bits set, the loop in at_dma_off() might never exit.

Is it possible to add a timeout or limit to prevent a potential CPU lockup
here and in similar polling loops like the one for EBCISR in at_dma_probe()?

>  }
> =20
> +static void at_dma_cleanup_channels(struct at_dma *atdma)

[ ... ]

> @@ -2118,23 +2134,17 @@ static int __init at_dma_probe(struct platform_de=
vice *pdev)
>  static void at_dma_remove(struct platform_device *pdev)
>  {
>  	struct at_dma		*atdma =3D platform_get_drvdata(pdev);
> -	struct dma_chan		*chan, *_chan;
> =20
>  	at_dma_off(atdma);
>  	if (pdev->dev.of_node)
>  		of_dma_controller_free(pdev->dev.of_node);
>  	dma_async_device_unregister(&atdma->dma_device);
> =20
> -	dma_pool_destroy(atdma->memset_pool);
> -	dma_pool_destroy(atdma->lli_pool);
>  	free_irq(platform_get_irq(pdev, 0), atdma);

[Severity: High]
This isn't a bug introduced by this patch, but does the current cleanup ord=
er
still leave a window for a use-after-free?

In at_dma_remove(), dma_async_device_unregister() unregisters the device and
its channels, freeing chan->dev. Because free_irq() is called after this
unregister, can a concurrent interrupt arrive, get processed by
at_dma_interrupt(), and trigger atc_handle_error() which accesses the
already freed chan->dev via chan2dev()?

Could free_irq() or disable_irq() be moved earlier in the teardown path to
safeguard against this?

> =20
> -	list_for_each_entry_safe(chan, _chan, &atdma->dma_device.channels,
> -			device_node) {
> -		/* Disable interrupts */
> -		atc_disable_chan_irq(atdma, chan->chan_id);
> -		list_del(&chan->device_node);
> -	}
> +	at_dma_cleanup_channels(atdma);
> +	dma_pool_destroy(atdma->memset_pool);
> +	dma_pool_destroy(atdma->lli_pool);
> =20
>  	clk_disable_unprepare(atdma->clk);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709023922.6454=
13-1-zenghongling@kylinos.cn?part=3D1
