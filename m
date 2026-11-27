Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779945;
	b=EkWBj0MgQ5zylOJyVx2YoW/zihNftQuupU2V7NguCrnbVbYBnNrUjEQ7EzHlUgSIhGgb
	 tlZlkP+IYS1MPXCJgxz+1NrlaCRekjuAHYl3udKGYcn+S6RllZgGqGZoo6poTS9dkRr2M
	 bkjbOS4BWhFrtHBN2ly5hByWECKNjZRK/kT785ZnlmD2FO9H0IQ82BbVN5Z8mHY8LLQe0
	 yX7lb8YBGSBVLyzeZQ+kNsw+jMjYUaEJVRZWjLZ+P318o3yO6chqGirhikc8GfxF9E9zi
	 T+W4vNlLF4bKO3GplBs74iIKaHzoT/15jqjCaMqqhLCg4YQo/i91VHlqGyCeCZHMtOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779945;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=w0fq+LyiUOA1lK6aPGmSoWesdVQy1TQUROSQxtT/Aho=;
	b=ckBCg3I5yaSbxEN+TWHbAvwk1wV3WVLPJte9IeyCke7IH4/pf0f1L/c7GBv4mlK6Snq9
	 Quy+RSX+0E1lmPrJ2Oz5ULDzMkQSuNtECa2TMRHHO4CxO+3ookG159oUQDIpnSW44+5n/
	 T8fCoTAYNy/rRM8+lx5xByw7xCDty/vn4pRnabMsYbQjbfpIl47+Zjz2nMRosg2LoWAbX
	 26B3xOot48r4MVqALNV+qV7RoM0vV6qWa3fdEJ5zvPOcBUxmADJlWp58tOwyVPI97cZid
	 hDXzrtVcwj18anmszLqOWsdueyDqHBV1FzYplRUwZSyqyxAzim0GgL1NCMBbiIX6LMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jLcWDIcX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A22606A31C
	for <dmaengine@vger.kernel.org>; Fri, 27 Nov 2026 11:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jLcWDIcX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C66F1F00899;
	Fri, 27 Nov 2026 11:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795779945;
	bh=w0fq+LyiUOA1lK6aPGmSoWesdVQy1TQUROSQxtT/Aho=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jLcWDIcXemnuV312qrQ2S6dKB1fmmMCJzAJR/Di8r9a28v2b8kXozfVqZYFZz7mce
	 +zDnnl0wQZ0r72xgRhooiAT12NvRh3DW5WjbSq7AzdiSBO9qvwwzgoZ9D9K1rH5GoV
	 GcihoLRtubLr+xR9LEUiNf87Df1SQOlzEURJOrShneGpVHIR6nnctNBWZczWM8dGVr
	 4RoLFOnxNOznUgZAghrbUS06/ZqUgcvB4qlWS3QUlKyY5tE76T4t/W3IVz0qSpVGrh
	 Fo/Hy+/SnFPCL4/r+JRx9woHXxY5GVhSRWRev2yx/c/ofQFgi6nlToOQ8efnWFnNGR
	 w62z2RBrsqcaQ==
Message-ID: <sashiko-outbox-237272@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] dmaengine: stm32-dma: Unregister the OF controller
 and DMA device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tian Xuechen" <202300460064@mail.sdu.edu.cn>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261127113332.390552-3-202300460064@mail.sdu.edu.cn>
References: <20261127113332.390552-1-202300460064@mail.sdu.edu.cn>
 <20261127113332.390552-3-202300460064@mail.sdu.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 11:45:44 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] dmaengine: stm32-dma: UAF on chan_dev and active tasklets in
  stm32_dma_remove()
- [Medium] dmaengine: stm32-dma: missing runtime PM and clk cleanup in
  stm32_dma_remove()
--

commit 30243559befe605128a60fd875a8d108b7d34bc8
Author: Tian Xuechen <202300460064@mail.sdu.edu.cn>

dmaengine: stm32-dma: Unregister the OF controller and DMA device

This commit adds a platform driver remove callback to unregister the OF
DMA controller and the DMA engine device upon driver removal.

> diff --git a/drivers/dma/stm32/stm32-dma.c b/drivers/dma/stm32/stm32-dma.c
> index ba8121d37f51d..6392c15b43175 100644
> --- a/drivers/dma/stm32/stm32-dma.c
> +++ b/drivers/dma/stm32/stm32-dma.c
> @@ -1761,6 +1761,14 @@ static const struct dev_pm_ops stm32_dma_pm_ops =
=3D {
>  			   stm32_dma_runtime_resume, NULL)
>  };
> =20
> +static void stm32_dma_remove(struct platform_device *pdev)
> +{
> +	struct stm32_dma_device *dmadev =3D platform_get_drvdata(pdev);
> +
> +	of_dma_controller_free(pdev->dev.of_node);
> +	dma_async_device_unregister(&dmadev->ddev);

[Severity: High]
Does unregistering dmadev->ddev here cause a use-after-free on each
channel's chan_dev while the devm-managed channel IRQs and vchan tasklets
are still active?

In stm32_dma_probe(), dma_async_device_register() allocates each channel's
chan_dev and its kobject name, and devm_request_irq() then passes
vchan_chan_name(&chan->vchan) directly as the IRQ action name without
copying it:

drivers/dma/stm32/stm32-dma.c:stm32_dma_probe() {
	...
		vchan_init(&chan->vchan, dd);
	...
	ret =3D dma_async_device_register(dd);
	if (ret)
		goto clk_free;

	for (i =3D 0; i < STM32_DMA_MAX_CHANNELS; i++) {
		...
		ret =3D devm_request_irq(&pdev->dev, chan->irq,
				       stm32_dma_chan_irq, 0,
				       vchan_chan_name(&chan->vchan), chan);
	...
}

When stm32_dma_remove() calls dma_async_device_unregister(),
__dma_async_device_channel_unregister() unregisters and frees each
chan_dev and its kobj.name before devres_release_all() frees the IRQs.
Until devres tears down the IRQs, every channel's irqaction->name is a
dangling pointer (exposed via /proc/interrupts), and any interrupt firing
in stm32_dma_chan_irq() dereferences freed chan_dev memory via
vchan_chan_dev(&chan->vchan).  In addition, nothing stops active channels
or kills chan->vchan.task before devres frees dmadev.

> +}

[Severity: Medium]
Should stm32_dma_remove() also disable runtime PM and balance the clock
prepared and enabled in stm32_dma_probe()?

stm32_dma_probe() enables dmadev->clk with unmanaged clk_prepare_enable()
and enables runtime PM with unmanaged pm_runtime_enable(), relying on
stm32_dma_runtime_suspend() to disable the clock.  Without
pm_runtime_disable() and clk_disable_unprepare() in stm32_dma_remove(),
unbinding the driver when the device is runtime-active (or when CONFIG_PM
is disabled) leaks the clock prepare and enable references.  Leaving
runtime PM enabled also skips the runtime PM barrier during unbind, so
pending asynchronous runtime suspend work can race with devres freeing
dmadev and cause a subsequent re-probe to fail pm_runtime_set_active()
and trigger an unbalanced pm_runtime_enable() warning.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127113332.3905=
52-1-202300460064@mail.sdu.edu.cn?part=3D2
