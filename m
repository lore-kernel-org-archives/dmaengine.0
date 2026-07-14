Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E0935B63B
	for <dmaengine@vger.kernel.org>; Tue, 14 Jul 2026 03:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784000608; cv=none; b=gOC0HYnqKkoUsu4H4hwmPBYuy4dGT4jNEWvEt9OKsNnix+0S+6bKXve5oyqY2jPSCKmP7lJ3wTFWROhw/XWYbBJM1tJDFf3g7xWBZilH6I7zGw7y4A9saE+EYbWJWJ34XrjTgx4XQWeJAMWTFReGmNgSPeFuT1dXxKa6W4U1RfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784000608; c=relaxed/simple;
	bh=pyLdLwoPiUcRVYjuBWuJQhLnKMnjs//jqknBZiGZdY0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P9BIYn/IMTvGoLkcyBewdZexXZER7am5Y+oSDZ8wiNFSGu2og6GzfDcMeT18Bq6wVKFy1Zb5Ft9H3zMPKfyeUKIKrG8jjKejlsey7grPWnEcGapIr2m52KXF27FVgn7J/gXmbdRKuHaSKCrLXve+tb4jnGnG2Nc2BK1VHUm/4Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oGgcDQJs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oGgcDQJs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93D521F000E9;
	Tue, 14 Jul 2026 03:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784000606;
	bh=xu0XxwDQEHT/pWIFZeqV+upjICugftzL802KveMsXw0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oGgcDQJsOliEFDQ+qROBRZcSviHGKQ5pj6ZQkmsznNs6G+lUTqz8jhE4jE2d2H3vo
	 BCW8CtCC+ffIaFkYTygG3dC/6k+T+R9Fp6DNdm4Ci+r5LyyXPx7DSV331eA793+1Qu
	 CyYJEIABTg+LxnUtIHekZ8EUdM/zeV/d4oixQ5oGp7Jkk3Q1WXIuUFI8SMmlzVgW/8
	 cPdFkalWneIzHZwVnXKF7fmH2Q2WvuNd60bVgoQZJoVMCLmPq0/MTy9keyxSd5UrI5
	 e0N79IWuAWbNaktw8S1eDSBnWMIDUeOajGh+5HFmvN+msWe0+HObv5Fkzzxnj45Ot+
	 l7zEyiudQFPpw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] dmaengine: moxart: Fix use-after-free by proper
 tasklet cleanup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongling Zeng" <zenghongling@kylinos.cn>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260714033046.673677-1-zenghongling@kylinos.cn>
References: <20260714033046.673677-1-zenghongling@kylinos.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 03:43:26 +0000
Message-Id: <20260714034326.93D521F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Use-After-Free of DMA device structure (`mdc`) on driver unbind du=
e to `devm_kzalloc`.
- [High] Interrupt storm and system lockup due to unacknowledged pending in=
terrupts on unallocated channels.
- [High] NULL pointer dereference due to a Time-of-Check to Time-of-Use (TO=
CTOU) race condition in the interrupt handler.
- [High] Hardware DMA channels are not disabled during driver removal, risk=
ing silent memory corruption.
--

--- Patch [1]: [PATCH v2] dmaengine: moxart: Fix use-after-free by proper t=
asklet cleanup ---
commit 003a30b8eb52a034d5c70894b10d67c96c037dbb
Author: Hongling Zeng <zenghongling@kylinos.cn>

dmaengine: moxart: Fix use-after-free by proper tasklet cleanup

The moxart DMA driver has a use-after-free vulnerability:
- vchan_init() creates tasklets that access moxart_chan memory
- Neither probe error paths nor remove() call tasklet_kill()

> diff --git a/drivers/dma/moxart-dma.c b/drivers/dma/moxart-dma.c
> index 442f5aa16031f..a2481960e8700 100644
> --- a/drivers/dma/moxart-dma.c
> +++ b/drivers/dma/moxart-dma.c
> @@ -553,6 +553,21 @@ static irqreturn_t moxart_dma_interrupt(int irq, voi=
d *devid)
>  	return IRQ_HANDLED;
>  }

[Severity: High]
This isn't a bug introduced by this patch, but does the interrupt handler
potentially cause an interrupt storm?

If a hardware interrupt asserts on an unallocated channel, the handler skips
reading the control register and fails to clear the interrupt:

drivers/dma/moxart-dma.c:moxart_dma_interrupt() {
    ...
	for (i =3D 0; i < APB_DMA_MAX_CHANNEL; i++, ch++) {
		if (!ch->allocated)
			continue;
    ...
}

Since the handler unconditionally returns IRQ_HANDLED at the end, could this
cause the kernel to re-enter the interrupt handler immediately and
indefinitely?

[Severity: High]
This is a pre-existing issue, but is there a Time-of-Check to Time-of-Use
(TOCTOU) race condition in the interrupt handler?

The descriptor is checked locklessly before acquiring the spinlock:

drivers/dma/moxart-dma.c:moxart_dma_interrupt() {
    ...
			if (ch->desc) {
				spin_lock(&ch->vc.lock);
				if (++ch->sgidx < ch->desc->sglen) {
    ...
}

If a client driver concurrently terminates the channel and sets ch->desc to
NULL, could this result in a NULL pointer dereference when accessing
ch->desc->sglen inside the locked section?

[ ... ]

> @@ -609,19 +624,23 @@ static int moxart_probe(struct platform_device *pde=
v)
>  	ret =3D dma_async_device_register(&mdc->dma_slave);
>  	if (ret) {

[Severity: High]
This is a pre-existing issue, but does using devm_kzalloc() for the DMA
device structure cause a use-after-free on driver unbind?

drivers/dma/moxart-dma.c:moxart_probe() {
    ...
	mdc =3D devm_kzalloc(dev, sizeof(*mdc), GFP_KERNEL);
    ...
}

If the driver is unbound via sysfs while a client holds a reference to a
DMA channel, devres will immediately free mdc.  When the client later drops
its reference, will the dmaengine core access the freed memory?

[ ... ]

> @@ -630,10 +649,12 @@ static void moxart_remove(struct platform_device *p=
dev)
>  {
>  	struct moxart_dmadev *m =3D platform_get_drvdata(pdev);
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

[Severity: High]
This isn't a bug introduced by this patch, but are the hardware DMA channels
left enabled during driver removal?

If the driver is unbound while a DMA transfer is actively running, the
software resources are freed, but the hardware control registers are never
updated to stop the transfers.

If the client driver subsequently frees its DMA buffers, could the
continuing hardware transfer corrupt memory?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714033046.6736=
77-1-zenghongling@kylinos.cn?part=3D1
