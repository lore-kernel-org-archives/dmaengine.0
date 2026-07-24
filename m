Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B253E4756B9
	for <dmaengine@vger.kernel.org>; Fri, 24 Jul 2026 23:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784934501; cv=none; b=Zt06ezDxAb80pn9z+TeXmcLO6yhbNEloK5C+WKArgIIwurF7b+7aBU2PXorvo+nZui3d6rp4K1qZscXYayOctSunXJ9IOx90EdQVLY4dOrqjO/dhClPjugFUAZjgZrg5b8XXBCch4kD8G3r/PGdHiPFsb3lNe0mJOmsXEXBXeTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784934501; c=relaxed/simple;
	bh=793ZjjvHT+LHVNhYPF+RN4h0Qqd9eZuf4CtugYIyHzc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=R10kRj0gGAwIlqFfdSW9jMwCEKvmoqd35DiYGnxHYjTxd/EhzTYeA5+FvGoyNQaU3YQp9KTuEXX3pgqnsej+lbvmio2ZzdkvF+8g/VZD8EvT8Edu3Zx7XzGVVSy7mNdilv+G+IprQxSyVFvs/1TGyGdHCbjBjGpuNtQ+UbQFBFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TgkWdObj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TgkWdObj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D4AA1F000E9;
	Fri, 24 Jul 2026 23:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784934497;
	bh=r4GJcwp9mfEYHfMcSL/2QYNYT/E2P/j6G39Ri9MsRbQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TgkWdObj04WO2yDrrZtLvKqx0JDQtjWcv1pODgBj0olFZKSO9GBZYfToe8oATXw8b
	 EA821SiL/oVtbS6uFvQKMxpebxvKfPS5LDX6s3qbejpZLzEFM7yPHpnX28pchX0mab
	 McZC79Kh8xxfsDT8kLd5bmno16YCRN1a1c8amGifHgira0dOtHr+7pZpGjXmlLuKgs
	 ol/6iTwSEiIX2+xkqJ3tViheBpVrwy2OSAc7N+UgsaWD0yzwuVsEnPkphHGod5b8kp
	 49BWwQydUzCRoBfUCacEnHS0X9q3FY/k4V2lV1ub9cMACBIGysMuLcLO8IHfUt0OqV
	 CiTt2kplaq30A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv2] dmaengine: at_hdmac: use more devm in _probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260724225720.43410-1-rosenp@gmail.com>
References: <20260724225720.43410-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 23:08:16 +0000
Message-Id: <20260724230817.2D4AA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing tasklet_kill() for vchan tasklets during device removal le=
ads to a potential use-after-free.
- [High] The driver does not implement the device_synchronize callback requ=
ired for vchan.
--

--- Patch [1]: [PATCHv2] dmaengine: at_hdmac: use more devm in _probe ---
commit 4a21134962b742ca7876c61c580dce0a0982f3d7
Author: Rosen Penev <rosenp@gmail.com>

dmaengine: at_hdmac: use more devm in _probe

As devm is already used in _probe, complete the conversion so that everythi=
ng
unwinds in proper order.

> diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
> index e5b30a57c477a..f16cf29ca5487 100644
> --- a/drivers/dma/at_hdmac.c
> +++ b/drivers/dma/at_hdmac.c
[ ... ]
> @@ -2080,10 +2074,10 @@ static int __init at_dma_probe(struct platform_de=
vice *pdev)
>  	  dma_has_cap(DMA_SLAVE, atdma->dma_device.cap_mask)  ? "slave " : "",
>  	  plat_dat->nr_channels);
> =20
> -	err =3D dma_async_device_register(&atdma->dma_device);
> +	err =3D dmaenginem_async_device_register(&atdma->dma_device);

[Severity: High]
This is a pre-existing issue, but I noticed that atdma->dma_device does not
implement the device_synchronize callback.

Client drivers call dmaengine_synchronize() to ensure all transfers and the=
ir
callbacks have completed before freeing buffers. Because at_hdmac defers
descriptor completion to a tasklet via vchan but omits the device_synchroni=
ze
callback, dmaengine_synchronize() becomes a no-op.

Could this lead to client drivers freeing memory while the tasklet is still
actively running or queued, causing a use-after-free or data corruption?
Should device_synchronize be mapped to vchan_synchronize?

>  	if (err) {
>  		dev_err(&pdev->dev, "Unable to register: %d.\n", err);
> -		goto err_dma_async_device_register;
> +		return err;
>  	}
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

[Severity: High]
This is a pre-existing issue, but it seems there is no tasklet_kill() called
for the vchan tasklets during device removal in at_dma_remove().

If a DMA channel tasklet is scheduled by an interrupt just before device
removal (for example, via sysfs unbind), at_dma_remove() might execute and
return without killing the vchan tasklets. Devres would then subsequently
destroy the lli_pool and free the at_dma structure.

If the pending softirq tasklet executes after this, could it access the fre=
ed
pool and cause a use-after-free?

>  	}
> -
> -	clk_disable_unprepare(atdma->clk);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724225720.4341=
0-1-rosenp@gmail.com?part=3D1
