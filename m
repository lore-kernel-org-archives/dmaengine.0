Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955D03DBD65;
	Mon, 27 Jul 2026 20:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785185954; cv=none; b=EdhoeVCGcgfptZIeltWHl7ZIlw72KAQxn7N8O7OAI9WpcctXG1qYnhIPB6ONglS8EkpOrtmF8qcMnV8k9F6zdaUUkabJMd47yo6O42UF4RgfcYoF6yjIYejlrtbaDneB++edcmFnGvTtrofU96R4VO5fksyaSfBYR4WeJ8IxeKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785185954; c=relaxed/simple;
	bh=kQM9LYioD+pSE4bGOS4V0aU2hD/p6H+KPfcbpYHz6sk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hP1OYDD++yDPPKBEgUr81W3lohhZiSaUyhrNb9O+KszC2qtrparQwVQu9NLIV0R+GceMV0U6SGE+y6Y4xov9ODxGf6SxE/QsW1/vhBsabSa34f9QKnwOEC2IMkR6vfoo8Rc7odubcS+RlNgEIE3HwCGVEpKdrAuz5hnwYmvtaXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OQP7dpnG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OQP7dpnG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B48821F000E9;
	Mon, 27 Jul 2026 20:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785185953;
	bh=y/hiIp2GSgBmSf/TAX198rGpXYVxXCAsJEHY/4/gD6Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OQP7dpnG756hL6kmlL3vBX9nPpnh4xNiQujUgKGcbZQVjLDRNKYCn8FDPESNjZJEz
	 FMOMljMw+0OIUNCzb5ORnmyR0+rUw2r/PYOYQTLciRNpSe80HgSgs46uio9mn09/gS
	 E7XoCFbScaom/uqH0pxJQ4fRGfETbbJBPC02MUj/EjyzDPndwreLxkJNel9A4TIKTa
	 XhuX5qaeRTAkGOmTz0HLxds3tNfGGYoCDkrSfbvBuwfioqF30rcQ1T5sw6ras2AH4T
	 /yrNahZgNC/PfUuNj3E6dfzo7FSHVphgmSuuwUb2aOoQTXTDNKjCD0OHBeLbPDUYCc
	 m3jUBMBNpZWZg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 13/64] dmaengine: mxs-dma: use dma_chan BH scheduling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: dmaengine@vger.kernel.org, Frank.Li@kernel.org, vkoul@kernel.org, imx@lists.linux.dev
In-Reply-To: <e0499d943001c6ef2142bfdc910f584dd575e8bc.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <e0499d943001c6ef2142bfdc910f584dd575e8bc.1785183549.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 20:59:12 +0000
Message-Id: <20260727205912.B48821F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing synchronization/flushing of bottom-half work during channe=
l teardown leads to a use-after-free of client resources.
- [High] Requesting IRQ before clock enable and descriptor initialization c=
auses a kernel panic on pending interrupt.
- [High] The driver allocates the DMA engine state with devm_kzalloc but la=
cks a device_release callback, risking UAF on unbind.
--

--- Patch [13]: [PATCH v2 13/64] dmaengine: mxs-dma: use dma_chan BH schedu=
ling ---
commit cc33b3c421743dc24481c221e9955791a7689087
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: mxs-dma: use dma_chan BH scheduling

Replace the per-channel tasklet with the shared dma_chan BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

> The handler continues to run in softirq context while dmaengine owns
> the common scheduling and teardown mechanism.

[Severity: High]
This is a pre-existing issue, but since the commit message notes that the
teardown mechanism is being updated, does mxs_dma_free_chan_resources()
need to call dma_chan_kill_bh() to prevent use-after-free conditions?

If a client releases the channel concurrently with an interrupt,
mxs_dma_free_chan_resources() currently returns without flushing pending
work:

drivers/dma/mxs-dma.c:mxs_dma_free_chan_resources() {
	...
	mxs_dma_disable_chan(chan);

	free_irq(mxs_chan->chan_irq, mxs_dma);
}

Could this allow the asynchronous work to outlive the channel allocation
and dereference a freed client callback when mxs_dma_tasklet() runs?

> diff --git a/drivers/dma/mxs-dma.c b/drivers/dma/mxs-dma.c
> index 7acb3d29dad30..8cecc0add82dc 100644
> --- a/drivers/dma/mxs-dma.c
> +++ b/drivers/dma/mxs-dma.c

[ ... ]

> @@ -385,8 +385,8 @@ static irqreturn_t mxs_dma_int_handler(int irq, void =
*dev_id)
>  		dma_cookie_complete(&mxs_chan->desc);
>  	}
> =20
> -	/* schedule tasklet on this channel */
> -	tasklet_schedule(&mxs_chan->tasklet);
> +	/* schedule BH on this channel */
> +	dma_chan_schedule_bh(&mxs_chan->chan);
> =20
>  	return IRQ_HANDLED;
>  }

[Severity: High]
This is a pre-existing issue, but can this handler be triggered before the
hardware clock is enabled and the descriptor is initialized?

Looking at mxs_dma_alloc_chan_resources(), the IRQ is requested before the
clock is enabled:

drivers/dma/mxs-dma.c:mxs_dma_alloc_chan_resources() {
	...
	ret =3D request_irq(mxs_chan->chan_irq, mxs_dma_int_handler,
			  0, "mxs-dma", mxs_dma);
	if (ret)
		goto err_irq;

	ret =3D clk_prepare_enable(mxs_dma->clk);
	...
}

If a spurious or bootloader-pending interrupt fires immediately, could
mxs_dma_int_handler() process a DMA_COMPLETE status and hit a BUG_ON when
it calls dma_cookie_complete(&mxs_chan->desc) because the cookie is
still 0?

[ ... ]

> @@ -780,7 +780,7 @@ static int mxs_dma_probe(struct platform_device *pdev)
>  		mxs_chan->chan.device =3D &mxs_dma->dma_device;
>  		dma_cookie_init(&mxs_chan->chan);
> =20
> -		tasklet_setup(&mxs_chan->tasklet, mxs_dma_tasklet);
> +		dma_chan_init_bh(&mxs_chan->chan, mxs_dma_tasklet);
> =20
> =20
>  		/* Add the channel to mxs_chan list */

[Severity: High]
This is a pre-existing issue, but is the driver state vulnerable to a
use-after-free if the device is unbound?

The driver allocates mxs_dma using devm_kzalloc() but appears to register
the async device without providing a device_release callback:

drivers/dma/mxs-dma.c:mxs_dma_probe() {
	...
	mxs_dma =3D devm_kzalloc(dev, sizeof(*mxs_dma), GFP_KERNEL);
	if (!mxs_dma)
		return -ENOMEM;
	...
	ret =3D dmaenginem_async_device_register(&mxs_dma->dma_device);
	...
}

If the driver is unbound via sysfs while a client still holds a reference
to a DMA channel, will devres immediately free mxs_dma, causing a panic
when the client later accesses the channel?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785183549.gi=
t.allen.lkml@gmail.com?part=3D13
