Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2122253FC;
	Wed, 26 Aug 2026 02:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787712806; cv=none; b=jcA0c3u/eN8ePEtw7k9vLPPiPsyDfFC1fM/eDZY4FB6ttmBIk4kZFGzn9g9+3I2qiOjTPj52Me0ePYxT/XHRVgx1n/Vf6xHyWePiECfLuzL80a0w0rO7Uk1b3jgtOBhNT4qYzhnePzAWI6RCeHfaPpVR26vYhPkKAkW19AZ0FYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787712806; c=relaxed/simple;
	bh=T8bL5AbQLPVuZ5OIPZKjfCk204Y5KNtxMIw+XgX4+xo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=f2m3GQgpVhkbLQNmF8f/M5h5bJPLFqhvYjaKXZ4vwBR59/iS5Yfv7eNmm22fv4cZN/+l7wyYKEMY8AQlxMpC9dtuAgsnlsi9cNOM6ws8tYdwv+wbGk7/0M79JgW9fE0vMxcW3HaI3GyhmKp7A2QszhMkaVOHTLD6MjuKKS3AZkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ewC7fRt2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ewC7fRt2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E3711F000E9;
	Wed, 26 Aug 2026 02:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787712804;
	bh=MKPAOMVSw9Q0eRS2FRAuYH8f+bNgG72ikF9DDdeEFe4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ewC7fRt2xgzI/b0AxDIyjgEqXTqYt20Wqxlfb7+vPlzAG20DNr4K9ef9wTHXynF3m
	 r6ILPtUqFUREzk0EBIw/hnJHsXrKYpqWsANuUPZukXV1HIO1VU8ZNCSdbpGgEQ1MPL
	 2ishBamv3BQT5zEKeyqmfq3f5J/5AToTs0n7SnWVPT61EPyGtVslmWhmQMhnbbq/LX
	 535FG/MVONmSc04QlZJ7Fdx7qWVnVlgjMB4tg131yIuuAO+XrlPKHmb6aAgScYUkUo
	 /VyeAQRmHQTxaB8wHOjRAhp+vuWqQK+ew1CwzNHF8oNTDlJ7aMY6k7ojwLkT9ENUAH
	 72L5m/yNHZFMA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/5] dmaengine: sun6i-dma: Add num_channels_per_reg
 for flexible interrupt mapping
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yuanshen Cao" <alex.caoys@gmail.com>
Cc: linux-sunxi@lists.linux.dev, vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260826-sun60i-a733-dma-v5-3-abc5229b441e@gmail.com>
References: <20260826-sun60i-a733-dma-v5-0-abc5229b441e@gmail.com>
 <20260826-sun60i-a733-dma-v5-3-abc5229b441e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 02:53:24 +0000
Message-Id: <20260826025324.6E3711F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Integer division truncates the interrupt register loop bound, perm=
anently ignoring interrupts for channels that do not divide evenly into num=
_channels_per_reg.
- [High] Incorrect array indexing for physical channels misroutes interrupt=
s to the wrong DMA channels, breaking functionality and A733 support.
--

commit 4af47032928a84468d9e66febfa1d354c72ba8f6
Author: Yuanshen Cao <alex.caoys@gmail.com>

dmaengine: sun6i-dma: Add num_channels_per_reg for flexible interrupt mappi=
ng

This commit updates the sun6i-dma driver to use a flexible=20
num_channels_per_reg configuration rather than a hardcoded value. This make=
s=20
the interrupt handling hardware-agnostic, enabling support for the A733 SoC=
=20
which has a different interrupt structure.

> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index 1ffd870d95942..ffb63212bea71 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c

[ ... ]

> @@ -582,7 +584,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void =
*dev_id)
>  	int i, j, ret =3D IRQ_NONE;
>  	u32 status;
> =20
> -	for (i =3D 0; i < sdev->num_pchans / DMA_IRQ_CHAN_NR; i++) {
> +	for (i =3D 0; i < sdev->num_pchans / sdev->cfg->num_channels_per_reg; i=
++) {

[Severity: High]
This isn't a bug introduced by this patch, but it appears to be a pre-exist=
ing
issue where integer division truncates the interrupt register loop bound. On
hardware where the number of physical channels is not an exact multiple of
num_channels_per_reg, will this loop prematurely exit and abandon unaligned
physical channels?

For example, if a SoC has 12 physical channels and num_channels_per_reg is =
8,
the bound evaluates to 12 / 8 =3D 1, meaning the second interrupt register =
is
never checked. Should this be using DIV_ROUND_UP(sdev->num_pchans,
sdev->cfg->num_channels_per_reg) to match how it is handled in
sun6i_dma_dump_com_regs()?

>  		status =3D sun6i_read_irq_stat(sdev, i);
>  		if (!status)
>  			continue;
> @@ -592,7 +594,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void =
*dev_id)
> =20
>  		sun6i_write_irq_stat(sdev, i, status);
> =20
> -		for (j =3D 0; (j < DMA_IRQ_CHAN_NR) && status; j++) {
> +		for (j =3D 0; (j < sdev->cfg->num_channels_per_reg) && status; j++) {
>  			pchan =3D sdev->pchans + j;

[Severity: High]
This is also a pre-existing issue, but the incorrect array indexing here
becomes particularly critical with the newly introduced A733 support. Does
this array access ignore the outer register index i, aliasing all
higher-channel interrupts to the first register's channels?

Since the newly supported A733 SoC has num_channels_per_reg =3D 1, j will
always evaluate to 0. Will this catastrophically misroute all interrupts
across all channels to channel 0?

It looks like the correct calculation needs to include the register offset,
such as: pchan =3D sdev->pchans + (i * sdev->cfg->num_channels_per_reg) + j;

Note that this might also require an explicit array bounds check against
sdev->num_pchans to prevent out-of-bounds access for trailing unaligned
channels.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826-sun60i-a73=
3-dma-v5-0-abc5229b441e@gmail.com?part=3D3
