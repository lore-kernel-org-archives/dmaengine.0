Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC0D2F8EA3;
	Fri, 19 Jun 2026 07:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781853143; cv=none; b=UhYal+wQlJHDXVkvHunFgDAux/AemG62wO+oP9XDlAsMqkMIF8CrGTMe94gyB/fpOSy7zMbXooP0lYtnVlbtZhp1pjnCaBv1w6PcefCqiFOw7uEUZgcDNBnPQo0AOgQ0Esj5p1zcZsPfAD6E4ooG+7yChK5h3sDbOV5v402GXjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781853143; c=relaxed/simple;
	bh=+xgIhQgS5jClem40Sn47Wq7cf9FB4mPrfw/+hYyBNgQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CrTzM4S3zSaNlH3Lm8MX3o48Ha1h+TqZz4luDaEBo9tzaF6mAMaeLnYbMP8we6c11EvCVeh1U1CnafDMLjdV+0DLrKKLk7r66BSuPs2e8YS0VFgSx8twhGvn/KZ24tq1xvOuUgbIAMJ0xpIjojhnvSb6Lw6r4jW8Q7fDKslrmJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F9JFhHCK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F9JFhHCK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 372521F000E9;
	Fri, 19 Jun 2026 07:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781853142;
	bh=lYK9wjHe9fHOgFY3S1Rqgq4Nu3WeM9aWlkMyS8SfcP0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F9JFhHCKDIYbIuH5+jbEmQBwvpWUfjWI1Ujx+F1LkysLC0y6SK61PR3H2ly3n/JpZ
	 YJ+/Q9ALCJv9/SzMPrxYX2KRqaeqg7F/GYl4xiXKlT4pPXnz7hqib1pjbcGJnVn9P4
	 mT3upWLqgkW3P7p1jV1/ES/WRx5DZKtqfmBana7Zrq3c15jkR+ID8q7MWMeB8Fcs4Q
	 b6xb290dLXvY7P+p11v+4Nuvvri8wo+xBMIYGhS81ofN2msJx6j/wEVop7ggyPte3A
	 ebvCxQC5Bg8yXIlwNjT8QBk9RtlMRP0D3c8SDLf1NavzKSA0MhYmLihXOW/4T6n/ap
	 wwgGydwxndqfw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/5] dmaengine: sun6i-dma: Implement support for
 Allwinner A733 DMA controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yuanshen Cao" <alex.caoys@gmail.com>
Cc: linux-sunxi@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org, robh@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260619-sun60i-a733-dma-v1-4-da4b649fc72a@gmail.com>
References: <20260619-sun60i-a733-dma-v1-0-da4b649fc72a@gmail.com>
 <20260619-sun60i-a733-dma-v1-4-da4b649fc72a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 19 Jun 2026 07:12:21 +0000
Message-Id: <20260619071222.372521F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] The DMA interrupt handler incorrectly resolves the physical ch=
annel (`pchan`) from the interrupt status bit by ignoring the outer loop re=
gister index `i`.
- [High] Integer division truncation in loop bounds causes upper hardware c=
hannels to be completely ignored, and introduces out-of-bounds MMIO accesse=
s.
--

commit e328a2b422946f5a9b0337a1058273c7077c1ac4
Author: Yuanshen Cao <alex.caoys@gmail.com>

dmaengine: sun6i-dma: Implement support for Allwinner A733 DMA controller

This patch implements the actual support for the Allwinner A733 DMA
controller. It defines the new register offsets and bitfield mappings
required for the A733, which slightly differs from the older sun6i
series.

> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index fb1c1a28744bb..9585b4a9e00de 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c

[ ... ]

> @@ -1352,6 +1412,33 @@ static struct sun6i_dma_config sun50i_h6_dma_cfg =
=3D {
>  	.has_mbus_clk =3D true,
>  };
> =20
> +/*
> + * The A733 binding uses the number of dma channels from the
> + * device tree node.
> + */
> +static struct sun6i_dma_config sun60i_a733_dma_cfg =3D {
> +	.clock_autogate_enable =3D sun6i_enable_clock_autogate_h3,
> +	.set_burst_length =3D sun6i_set_burst_length_h3,
> +	.set_drq          =3D sun6i_set_drq_h6,
> +	.set_mode         =3D sun6i_set_mode_h6,
> +	.set_addr         =3D sun6i_dma_set_addr_a733,
> +	.dump_com_regs    =3D sun6i_dma_dump_com_regs_a733,
> +	.read_irq_en      =3D sun6i_read_irq_en_a733,
> +	.write_irq_en     =3D sun6i_write_irq_en_a733,
> +	.read_irq_stat    =3D sun6i_read_irq_stat_a733,
> +	.write_irq_stat   =3D sun6i_write_irq_stat_a733,
> +	.src_burst_lengths =3D BIT(1) | BIT(4) | BIT(8) | BIT(16),
> +	.dst_burst_lengths =3D BIT(1) | BIT(4) | BIT(8) | BIT(16),
> +	.src_addr_widths   =3D BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
> +			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
> +			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
> +	.dst_addr_widths   =3D BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
> +			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
> +			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
> +	.num_channels_per_reg =3D DMA_IRQ_CHAN_NR_A733,

[Severity: Critical]
This is a pre-existing issue, but does setting num_channels_per_reg to 1
(DMA_IRQ_CHAN_NR_A733) break interrupt handling for all A733 channels > 0?

In sun6i_dma_interrupt(), the physical channel is calculated without the ou=
ter
loop index i:

    for (i =3D 0; i < sdev->num_pchans / sdev->cfg->num_channels_per_reg; i=
++) {
        ...
        for (j =3D 0; (j < sdev->cfg->num_channels_per_reg) && status; j++)=
 {
            pchan =3D sdev->pchans + j;

Since num_channels_per_reg is 1, j is always 0. As a result, every interrupt
on every channel will incorrectly resolve to sdev->pchans[0]. Doesn't this
completely break DMA functionality for all A733 channels except channel 0 by
causing spurious completions on channel 0 and hanging all others?

[Severity: High]
This is a pre-existing issue, but does using integer division truncation for
loop bounds ignore remainder channels and cause out-of-bounds MMIO accesses?

In sun6i_dma_interrupt(), the loop bound is:

    i < sdev->num_pchans / sdev->cfg->num_channels_per_reg

For SoCs where the number of channels is not a perfect multiple of
num_channels_per_reg (like H3 with 12 channels and 8 channels per register),
this division truncates (12 / 8 =3D 1), causing the remainder channels to be
entirely ignored so their interrupts are never serviced.

Additionally, this patch series introduces a similar loop in
sun6i_kill_tasklet():

    for (i =3D 0; i < DMA_MAX_CHANNELS / sdev->cfg->num_channels_per_reg; i=
++)

Since DMA_MAX_CHANNELS is 16 and num_channels_per_reg is 1 for A733, the lo=
op
evaluates to 16. If the A733 hardware possesses fewer than 16 channels, won=
't
this cause out-of-bounds MMIO writes which can trigger bus aborts?

> +	.has_mbus_clk =3D true,
> +};
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260619-sun60i-a73=
3-dma-v1-0-da4b649fc72a@gmail.com?part=3D4
