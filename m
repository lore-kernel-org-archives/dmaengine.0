Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A678F49;
	Fri, 19 Jun 2026 05:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781845689; cv=none; b=jd0Ts/gHCwiuu1uHaSmUW6ILjt3muIJTwA0POokPmL6ktP7sVdT7h/3oKfgdm4vlnbxKav1x/2UWJi3d1PSvlL6QoY/30J3XRMcI9tasK4xQe0bA1WGTVInJeh4VfcFNnBk1Vqv4k4HrJWzrIyzH8b1AcRZrtPxb9ZCvUURxuSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781845689; c=relaxed/simple;
	bh=ar2FLf/jhByp8hS2N304VJeOeR2oRR77rW5UNQPGuqk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CXcEoI8SyOX0gVVutrw1As28G3bYnsULR7AJmaxLSzGQXrS+ULg+Jlc8ZhbnhgVRI2+sLTx94etm9cycsbuqI1yEWvay+jw6xOIlINmpb5uMUGbalvTp1Qyniot9DO6rAeepOSIOQT3PXgkjqiQj8TGLI0ILWgahECe0RZzqePM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ny+n1c0W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ny+n1c0W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64B5C1F000E9;
	Fri, 19 Jun 2026 05:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781845687;
	bh=We8WOYcG/FEFHRQL4mWCX79YRVL4ejKicJ+ijjmwBgc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ny+n1c0WxJm2GujF9wlDyD+LuOUOcBC0e5Qs94/+7vJiA826ZbE/jk69Z+1PpCshx
	 PKbK5y6paz3hi12m9aQVh9kdWrxNn7+zxGZXOMiC+qnTy1n8olSKkAGltuHLwTMYBj
	 IuxyovzbYlfWBctpRR0vn2TC7dZNv1fuvG5fYJPOKVB5UF1I0MPHy5G9gjOc+OEfxq
	 Z+Eaf/IW45/WYzluWQ+8hiJ0RJfNNE5TlnvvUypd9oA7mP2zrdVkbKCp0EsTYtYYFI
	 8WZnXrZTcNO5Buhva3e1qksKBvo4mJt0qD/FcPszJw6GnStp3KanJ5toTQTq5uwwB1
	 U8GEbu+XWQ2lw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/5] dmaengine: sun6i-dma: Add num_channels_per_reg for
 flexible interrupt mapping
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yuanshen Cao" <alex.caoys@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260619-sun60i-a733-dma-v1-3-da4b649fc72a@gmail.com>
References: <20260619-sun60i-a733-dma-v1-0-da4b649fc72a@gmail.com>
 <20260619-sun60i-a733-dma-v1-3-da4b649fc72a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 19 Jun 2026 05:08:06 +0000
Message-Id: <20260619050807.64B5C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Incorrect physical channel indexing in `sun6i_dma_interrupt` i=
gnores the register index, applying status to the wrong physical channel.
- [High] Integer division truncation in the `sun6i_dma_interrupt` loop boun=
d skips polling for trailing channels.
- [High] Time-of-Check to Time-of-Use (TOCTOU) race condition in `sun6i_dma=
_interrupt` risks a NULL pointer dereference.
--

commit 3bfcb64969bffa1792e80eaa282fc15450f3870b
Author: Yuanshen Cao <alex.caoys@gmail.com>

dmaengine: sun6i-dma: Add num_channels_per_reg for flexible interrupt mappi=
ng

This commit introduces num_channels_per_reg to the sun6i_dma_config to
handle SoCs with varying channels per interrupt register. It modifies
the interrupt logic to use this new configuration value and bounds checking.

> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index 059455425e19c..fb1c1a28744bb 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c

[ ... ]

> @@ -574,7 +575,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void =
*dev_id)
>  	int i, j, ret =3D IRQ_NONE;
>  	u32 status;
> =20
> -	for (i =3D 0; i < sdev->num_pchans / DMA_IRQ_CHAN_NR; i++) {
> +	for (i =3D 0; i < sdev->num_pchans / sdev->cfg->num_channels_per_reg; i=
++) {

[Severity: High]
This is a pre-existing issue, but does this loop condition truncate the
division and miss trailing channels?

If sdev->num_pchans is not perfectly divisible by num_channels_per_reg
(for example, 12 channels with 8 channels per register), the integer
division truncates the remainder. This means the loop will skip the second
register entirely, permanently missing interrupts for the trailing channels.

>  		status =3D sdev->cfg->read_irq_stat(sdev, i);
>  		if (!status)
>  			continue;
> @@ -584,7 +585,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void =
*dev_id)
> =20
>  		sdev->cfg->write_irq_stat(sdev, i, status);
> =20
> -		for (j =3D 0; (j < DMA_IRQ_CHAN_NR) && status; j++) {
> +		for (j =3D 0; (j < sdev->cfg->num_channels_per_reg) && status; j++) {
>  			pchan =3D sdev->pchans + j;

[Severity: Critical]
This is a pre-existing issue, but does this apply the status to the wrong
physical channel?

The array lookup uses only the local offset j, discarding the register
index i. For any register i > 0, it accesses sdev->pchans[j] instead of
sdev->pchans[i * num_channels_per_reg + j].

With the newly added hardware where num_channels_per_reg is 1, j is always
0, which seems like it would cause all channels to incorrectly map to
channel 0.

>  			vchan =3D pchan->vchan;
>  			if (vchan && (status & vchan->irq_type)) {

[Severity: High]
This is a pre-existing issue, but is there a race condition here that could
lead to a NULL pointer dereference?

The interrupt handler reads vchan =3D pchan->vchan locklessly, and eventual=
ly
blocks to acquire vchan->vc.lock. Concurrently, sun6i_dma_terminate_all()
could acquire the same lock, nullify pchan->desc, and free the descriptors.

When the interrupt handler successfully acquires the lock:

spin_lock(&vchan->vc.lock);
vchan_cookie_complete(&pchan->desc->vd);

it does not re-verify pchan->desc before passing &pchan->desc->vd to
vchan_cookie_complete(), which would crash if pchan->desc was concurrently
set to NULL.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260619-sun60i-a73=
3-dma-v1-0-da4b649fc72a@gmail.com?part=3D3
