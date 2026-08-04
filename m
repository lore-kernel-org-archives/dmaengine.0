Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B972C46AA81
	for <dmaengine@vger.kernel.org>; Tue,  4 Aug 2026 15:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785859019; cv=none; b=OClez/heb/PXH9gJSioNto/cx3RFFNoWmvK7r65eO1x9hHNbaI9SqsBnfvgYjpVnG9eZxYsKXhzuHPPOrt1Qf6Tz1hVE9mWxhlsIcKxzRytMM5v4Gfuw35l+2bb8f+GRXgMqKQqbZrY+IEfHvVXcogGhOLXLeZuasqli+91NMBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785859019; c=relaxed/simple;
	bh=80oZzkRdvKw9MDr3oLrfs8yGgzgmm3BnxiwccgS2pYI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aNfqG5w4UpTxQIKOeSwVdiMimrF2PhC32uCLRSgmCnr5ROx8F7v2PmqpxHveRN9ZhczM2GpgmqHgoj3i9cSi/wRj4sB979/mVmUydASofrb0cT57E7xxve9QLcSImaiG49EU8ln4IgTCLFQ0Wpt6C2PnXa6my2WPQUFoyFoyiWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jeI/Al+L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jeI/Al+L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 503921F000E9;
	Tue,  4 Aug 2026 15:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785859018;
	bh=E1Cpnc4DsK2RGe6BhCsHNgysmnQLG3gcgVK6x1u3aNw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jeI/Al+LeZBRnWtaLtj8Hku4HRUM2GGv3yAkONQG2pI+VjwzMDlxRyeL5Eby6Y94j
	 Td57RkbvAaeXRWYxV0vtYhJTH7LT50FzIGNlhbSuQVxTCKwqJvjz7um259FWZIjcMP
	 1Y2YlqDLnIErb5NwkMrhaLrG6vHTVAeF8v0+7vtXo8VrLx5Vkg7eCwFo7WqfuN8Au9
	 4/440hNNZ6Wz4P99WBQwSN+psM22AQrycnAYdpWDBljn/j95Lhv4T2TeQi1X5Il3jv
	 EUiqYd/HZb3k3sv/oGOZOep5ZQq04Q/nDUfPu4ksEBkd2D01jz2e2CsfvmfkIu9CzX
	 TZ4bidMhmbqjw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 RESEND] dmaengine: mediatek: hsdma: fix runtime PM
 leak on init failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Myeonghun Pak" <mhun512@gmail.com>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260804153924.49627-1-mhun512@gmail.com>
References: <aj1RSj5ZXvc-9yu7@lizhi-Precision-Tower-5810>
 <20260804153924.49627-1-mhun512@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 15:56:57 +0000
Message-Id: <20260804155658.503921F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Premature DMA device registration exposes uninitialized hardware, =
leading to a kernel panic.
- [High] Devm-managed IRQ causes a race condition during remove, leading to=
 bus faults.
- [High] Missing tasklet cleanup on probe failure leads to potential use-af=
ter-free.
--

--- Patch [1]: [PATCH v2 RESEND] dmaengine: mediatek: hsdma: fix runtime PM=
 leak on init failure ---
commit 51dcb76c3dfae4c384b90e41e90bc15393906d0e
Author: Myeonghun Pak <mhun512@gmail.com>

dmaengine: mediatek: hsdma: fix runtime PM leak on init failure

This commit uses devm_pm_runtime_enable and pm_runtime_resume_and_get to fix
runtime PM usage count leaks on init failures. It also propagates hardware
init errors out of the probe function.

> diff --git a/drivers/dma/mediatek/mtk-hsdma.c b/drivers/dma/mediatek/mtk-=
hsdma.c
> index a43412ff5eddc..27cb370106c77 100644
> --- a/drivers/dma/mediatek/mtk-hsdma.c
> +++ b/drivers/dma/mediatek/mtk-hsdma.c
[ ... ]
> @@ -983,7 +992,9 @@ static int mtk_hsdma_probe(struct platform_device *pd=
ev)
>  		goto err_unregister;
>  	}
> =20
> -	mtk_hsdma_hw_init(hsdma);
> +	err =3D mtk_hsdma_hw_init(hsdma);
> +	if (err)
> +		goto err_free;

[Severity: High]
This isn't a bug introduced by this patch, but does the registration order
expose uninitialized hardware to clients?

In mtk_hsdma_probe(), dma_async_device_register() and=20
of_dma_controller_register() are called before mtk_hsdma_hw_init().
This exposes the DMA channels to client drivers before the device clocks
are enabled. If a client accesses the controller before it is initialized,
could this trigger a bus fault and a kernel panic?

Similarly, in mtk_hsdma_remove(), mtk_hsdma_hw_deinit() powers down the
hardware before dma_async_device_unregister() is called, allowing active
clients to access powered-off hardware.

> =20
>  	err =3D devm_request_irq(&pdev->dev, hsdma->irq,
>  			       mtk_hsdma_irq, 0,

[Severity: High]
This is a pre-existing issue, but does using devm_request_irq() here create
a race condition during remove?

The IRQ is managed by devres, meaning it remains active throughout the enti=
re
mtk_hsdma_remove() function until devres cleanup runs.

However, mtk_hsdma_remove() disables the hardware via mtk_hsdma_hw_deinit():

drivers/dma/mediatek/mtk-hsdma.c:mtk_hsdma_remove() {
    ...
    mtk_hsdma_hw_deinit(hsdma);
    ...
}

If a spurious interrupt fires after the hardware has been disabled,
mtk_hsdma_irq() will invoke mtk_dma_clr() and access unclocked registers.
Could this trigger an external abort and a kernel panic?

> @@ -991,7 +1002,7 @@ static int mtk_hsdma_probe(struct platform_device *p=
dev)
>  	if (err) {
>  		dev_err(&pdev->dev,
>  			"request_irq failed with err %d\n", err);
> -		goto err_free;
> +		goto err_deinit;
>  	}
> =20
>  	platform_set_drvdata(pdev, hsdma);
> @@ -1000,8 +1011,9 @@ static int mtk_hsdma_probe(struct platform_device *=
pdev)
> =20
>  	return 0;
> =20
> -err_free:
> +err_deinit:
>  	mtk_hsdma_hw_deinit(hsdma);
> +err_free:
>  	of_dma_controller_free(pdev->dev.of_node);
>  err_unregister:
>  	dma_async_device_unregister(dd);

[Severity: High]
This isn't a bug introduced by this patch, but does the error unwinding path
miss tasklet cleanup?

Earlier in mtk_hsdma_probe(), vchan_init() initializes a tasklet for each
virtual channel. Because the DMA controller is registered before=20
mtk_hsdma_hw_init(), a client can request a channel and start a transfer,
scheduling the tasklet.=20

If probe subsequently fails (e.g. devm_request_irq() fails) and takes this
error path, it unregisters the device but fails to call tasklet_kill().
Devres will then free the hsdma and vc memory while the tasklets may still
be active or pending. Could this lead to a use-after-free when the tasklet
executes?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804153924.4962=
7-1-mhun512@gmail.com?part=3D1
