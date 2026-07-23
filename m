Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2C2392C5A
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 05:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784783805; cv=none; b=Tck45ZKwAHmefq6o06cf1xzJUN0k8I2AAs9Mozy2Op2hYqnCbKQRVkNeZU+WwsFWL/Aw6wByqGkZkwRKji3A/OZSfpnkxW3keAN4HTrHdVUx1Jc4Bp3tZFLdHUt+G1C+4VOgf7F50LY3aSg9HowxPOhM9RcTPUoZhyedu4xCl1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784783805; c=relaxed/simple;
	bh=J5ahrPAuGwulaesIKOKzEZGW81+oPEeSrNs1x+JX2zM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=alibaZkslpdfPAjqxHk99cVUDdq+6DbBSCYt3ZgDlKzO1piB+eSfn8x8SbmeBOYp7bB0NXfNgqscWaymEdWMwDP/e5kUwCkQINrUZxGe/28Dv4+zuI4lBeLfL5Nc4QKaT1T9jDRg3I1AD7xBHEoU028tWjgT0r0U3+2QlBn/MW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l1/qRslK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l1/qRslK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F34461F000E9;
	Thu, 23 Jul 2026 05:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784783804;
	bh=QKFUoqFLSEpOuGjqeIqc/kaYIOPYUzjVCFQ09aSLhoI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l1/qRslKVwt1TBQlrLbTdyIMC/Vd8WHYunCQppARY2BD4kAqM/jI7YUNwaRnH2jKG
	 uXIVTW1xpGVZaUBbiGgPo26y2QVK9qHr0DYe0yTobmZ6VL7gicmVNzs8K5VtU4bAuI
	 gHJkULbbXdg3wiwHTqLDGMVZb0ZLrM4DINx1zTjtLyNAZmEX1gSBf1CNxPH81KThE9
	 ipc2mPOIGggjThlM3HP0n5BZrMkwtXAADmjBbm6MzvBGB+PEc6H4YnDZq+pIVDLvTj
	 vt7h34B1CFml04vfudxRAO3+b4Z2FcPqnYU9u/Qy9r6u74k8Hc8NLzdzVfQB5f0OzR
	 GN7h1Jhj5vnXw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: at_hdmac: use more devm in _probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260723050732.290935-1-rosenp@gmail.com>
References: <20260723050732.290935-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 05:16:43 +0000
Message-Id: <20260723051643.F34461F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] DMA channels are manually unlinked from the device list before dev=
res executes `dmaenginem_async_device_unregister()`, leading to permanent m=
emory leaks and sysfs name conflicts that break driver reload.
--

--- Patch [1]: [PATCH] dmaengine: at_hdmac: use more devm in _probe ---
commit c530cb83f3773c6a30cecc88fcb10f7ec0a53e60
Author: Rosen Penev <rosenp@gmail.com>

dmaengine: at_hdmac: use more devm in _probe
   =20
As devm is already used in _probe, complete the conversion so that
everything unwinds in proper order.

> diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
> index e5b30a57c477a..25d846ed7a7bd 100644
> --- a/drivers/dma/at_hdmac.c
> +++ b/drivers/dma/at_hdmac.c

[ ... ]

> @@ -2121,13 +2103,6 @@ static void at_dma_remove(struct platform_device *=
pdev)
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
> @@ -2135,8 +2110,6 @@ static void at_dma_remove(struct platform_device *p=
dev)
>  		atc_disable_chan_irq(atdma, chan->chan_id);
>  		list_del(&chan->device_node);

[Severity: High]
Will unlinking the channels here prevent dmaenginem_async_device_unregister=
()
from cleaning them up?

Because devres handles dmaenginem_async_device_unregister() after
at_dma_remove() returns, the unregister function will iterate over the
now-empty &atdma->dma_device.channels list.

Does this skip the channel unregistration process, leaking the chan->local
per-CPU memory and chan->dev sysfs nodes?=20

If the sysfs nodes remain, won't reloading the driver fail due to sysfs name
conflicts?

>  	}
> -
> -	clk_disable_unprepare(atdma->clk);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723050732.2909=
35-1-rosenp@gmail.com?part=3D1
