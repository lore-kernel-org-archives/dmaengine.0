Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0886A2253FC;
	Wed, 26 Aug 2026 02:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787712912; cv=none; b=c/ro6Bc71NSce9KmSoBA4leObJ5nJjEH56hmUufc36+c3Xw/+RZTbhEsYn/TSE1JDEeFbTIq9zZP6rWlFWoG+3zwvUtY4I1ERo+UlTTFduE0TeNFLDWsUfg3H+zE3YQy0X9dXSr4TtB17KESVIry8J+2dgXw2FFqumtgMfXDxGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787712912; c=relaxed/simple;
	bh=lc4Qc9mgSOmI6hs3YcgNcuu/wx/0aqd2mPizuZgDKuM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pKTbnncbA/DA4yJo0n1xFL3wKM3hNCMhI42ZV+GaOcpzqAQfAFpRmJq4ROBAX+HntRoWVfvi+SxQdMJmW21DK8uOQB4VMjBoUE/HecQ3s90SbG1lFCTqu+sJk0DE4awYbP2ce5ELUb/0lvwo/I764Pyb4/sKGqGgcMbGur/+RMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=huobTsHW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="huobTsHW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 463611F000E9;
	Wed, 26 Aug 2026 02:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787712910;
	bh=eq/1Vnk9oSJRz5NGaDtWrRuj3kqKW16HNnoaCQV6Nzw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=huobTsHW5eZ9dCzx90gBpQT5xww8DAyc02hj73U/4GCZQPTJUFzxOb18A9493zBZs
	 bo2aV67g2pMbEc14xVqy2GScad3+b7BDJ+0kc7XdOowN8kJKVJRya9dc1B4A2sdNuw
	 dEnNA1JwVV8bmP4wl2t0Ilhk5k+BVIDH2njzBnd/IYw2y8Vb1JWZMwRZ+aoT6vX4OQ
	 VEAoSfVC9yqw6hKu+OiEBRtcmEQ4eGhA3BnByLtO4xWBzR4y9U0l7uBsswZpBDYilh
	 lT+63g2jrDg1KTl+pZk2ecKMJj1e4GbDilg+XfwNR33IxtRwmSivPJPUKpyYDc1jsl
	 ieQrAr1tloL8g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 5/5] dmaengine: sun6i-dma: Implement support for
 Allwinner A733 DMA controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yuanshen Cao" <alex.caoys@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, Frank.Li@kernel.org, vkoul@kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260826-sun60i-a733-dma-v5-5-abc5229b441e@gmail.com>
References: <20260826-sun60i-a733-dma-v5-0-abc5229b441e@gmail.com>
 <20260826-sun60i-a733-dma-v5-5-abc5229b441e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 02:55:09 +0000
Message-Id: <20260826025510.463611F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the interrupt ha=
ndler incorrectly resolves the physical channel for IRQs by ignoring the IR=
Q register bank index, routing interrupts to the wrong channel.
- [High] This problem wasn't introduced by this patch, but `sun6i_dma_inter=
rupt` uses truncating integer division for its outer loop bound, causing hi=
gher channels to permanently hang on SoCs with unaligned channel counts.
--

commit 0187d2887a53e78b96b7bae3842e4d6f56758d3b
Author: Yuanshen Cao <alex.caoys@gmail.com>
Subject: dmaengine: sun6i-dma: Implement support for Allwinner A733 DMA con=
troller

This commit implements support for the Allwinner A733 DMA controller. It
defines A733-specific register offsets, bitfield masks, and adds the
sun60i_a733_dma_cfg configuration structure.

> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index ffb63212bea71..66281e01972dd 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c

[ ... ]

> @@ -1318,6 +1324,32 @@ static struct sun6i_dma_config sun50i_h6_dma_cfg =
=3D {
>  	SUN6I_DMA_IRQ_A31_COMMON_CFG
>  };
> =20
> +/*
> + * The A733 binding uses the number of dma channels from the
> + * device tree node.
> + */
> +static struct sun6i_dma_config sun60i_a733_dma_cfg =3D {

[ ... ]

> +	.irq_stride      =3D DMA_IRQ_STRIDE_A733,
> +	.irq_en_offset   =3D DMA_IRQ_EN_OFFSET_A733,
> +	.irq_stat_offset =3D DMA_IRQ_STAT_OFFSET_A733,
> +	.num_channels_per_reg =3D DMA_IRQ_CHAN_NR_A733,

[Severity: High]
This isn't a bug introduced by this patch, but since DMA_IRQ_CHAN_NR_A733 i=
s 1,
does the pre-existing interrupt handler correctly resolve the physical chan=
nel
for the A733?

Looking at sun6i_dma_interrupt(), it ignores the outer loop index 'i' when
resolving the channel:

	for (i =3D 0; i < sdev->num_pchans / sdev->cfg->num_channels_per_reg; i++)=
 {
		...
		for (j =3D 0; (j < sdev->cfg->num_channels_per_reg) && status; j++) {
			pchan =3D sdev->pchans + j;

Since 'j' will always be 0 for the A733 configuration, won't this route all
interrupts for higher channels (where 'i' > 0) to channel 0 instead of addi=
ng
the register offset? Could this cause hardware channels to hang permanently
and active descriptors on the wrongly targeted channel to be completed and
freed prematurely, leading to a Use-After-Free?

[Severity: High]
This is also a pre-existing issue, but while reviewing the loop boundary in
sun6i_dma_interrupt(), it appears to use truncating integer division:

	for (i =3D 0; i < sdev->num_pchans / sdev->cfg->num_channels_per_reg; i++)=
 {

For SoCs where the number of channels isn't an exact multiple of
num_channels_per_reg (like the H3 configuration with 12 channels and 8
channels per register), won't the truncating division evaluate to 1 and
completely skip the second register bank? Does this result in unhandled
interrupt storms and permanent DMA channel hangs for trailing channels?

> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826-sun60i-a73=
3-dma-v5-0-abc5229b441e@gmail.com?part=3D5
