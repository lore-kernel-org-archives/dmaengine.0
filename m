Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCD7175A6D;
	Wed, 26 Aug 2026 01:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787708618; cv=none; b=eiUPuAclJaJ+OGWouAsaQY5I2mGllvECVL9UAp4oGu63lh7kmWhWomrqenz08KUzdw6kE0aQhfx3+n0VaQDtGzl46DIipJ+l/q839BUK5kfbp0dX0kpBFWkRPNg0nFcsd/xWqqHC6/yEnFBdgRaDqerjCqKfCrTAZ4r19ZZIXBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787708618; c=relaxed/simple;
	bh=XcmZAVcvX3kEZeiMJSJmY7rdoeiMJPe6hIZGko1a7lg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=d6iNvfm2C1b0Vws5874+1dSjfYJcZjG2m3WkGwZmMgstg5+oH0Omc6uJzalIS+BiFj4WF0ky18jztTY2xdBy2IkGchymYI7H1C2xic+DxchZi+9FRFK4bP2VjxgGyM/4+TpB4oRQUxROBurLrQvt2KxQKo0FWME9Pwtaek1qtn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UsPJG5uU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UsPJG5uU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAE3C1F000E9;
	Wed, 26 Aug 2026 01:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787708617;
	bh=JC9cwsAybQhST5pjW4nl7Ssc4bXbWLtH0DaPC+Oq0jk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UsPJG5uUyKlLsZSgVnbP2UShdA1T5qZR4rlJFOx7u4LkG3uTGB5hBHJWpvYurgr1F
	 1mUM2iHK73Jcl4Vh7sEC5D22nBEHAO5fkWnbVBKTWTR40QYvg33nQQDPsDSHa62aR1
	 jQwSzRiRlb0vrpdzvqcWacrHiYhJ9UFejPvicXX10Fz0eKHfBOhBviOkIm9HrwSCLI
	 aXUveNB+gfNc2hJj0WpVHkIFImlitWZchzQynbmknUl5SxkQy5c3DeGtBgYhZszhcH
	 yRs9K5LInu1wrF1GiWierlkKOLNWeD0oImeswiVGDeOxSs9euuK7YGQ2BIWRTU2ybS
	 VaW2fBuj937cg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/5] dmaengine: sun6i-dma: Add support for Allwinner
 A733 DMA controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yuanshen Cao" <alex.caoys@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org, linux-sunxi@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <20260826-sun60i-a733-dma-v4-5-dc2f745f40dc@gmail.com>
References: <20260826-sun60i-a733-dma-v4-0-dc2f745f40dc@gmail.com>
 <20260826-sun60i-a733-dma-v4-5-dc2f745f40dc@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 01:43:36 +0000
Message-Id: <20260826014336.AAE3C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Missing mandatory function pointers in sun60i_a733_dma_cfg leads t=
o unconditionally dereferencing NULL pointers during DMA preparation.

Pre-existing issues:
- [High] Incorrect physical channel indexing in the DMA interrupt handler m=
aps interrupts for all registers to the first register's channels.
- [High] Missed interrupts due to integer division truncation in the DMA in=
terrupt handler causes higher channel interrupts to be ignored.
--

commit 9fc6c319ac37c3c86b13dd65e2affac0589606b0
Author: Yuanshen Cao <alex.caoys@gmail.com>

dmaengine: sun6i-dma: Add support for Allwinner A733 DMA controller

Implement support for the Allwinner A733 DMA controller by defining
A733-specific register offsets, bitfield masks, and the
sun60i_a733_dma_cfg configuration structure.

> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index b96d7d90f6b53..fb371b57d792a 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
[ ... ]
> @@ -1321,6 +1327,29 @@ static struct sun6i_dma_config sun50i_h6_dma_cfg =
=3D {
>  	SUN6I_DMA_IRQ_A31_COMMON_CFG
>  };
> =20
> +/*
> + * The A733 binding uses the number of dma channels from the
> + * device tree node.
> + */
> +static struct sun6i_dma_config sun60i_a733_dma_cfg =3D {
> +	.clock_autogate_enable =3D sun6i_enable_clock_autogate_h3,
> +	.src_burst_lengths =3D BIT(1) | BIT(4) | BIT(8) | BIT(16),
> +	.dst_burst_lengths =3D BIT(1) | BIT(4) | BIT(8) | BIT(16),
> +	.src_addr_widths   =3D BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
> +			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
> +			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
> +	.dst_addr_widths   =3D BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
> +			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
> +			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
> +	.src_high_addr_mask =3D SRC_HIGH_ADDR_32G_MASK,
> +	.dst_high_addr_mask =3D DST_HIGH_ADDR_32G_MASK,
> +	.has_mbus_clk =3D true,
> +	.irq_stride      =3D DMA_IRQ_STRIDE_A733,
> +	.irq_en_offset   =3D DMA_IRQ_EN_OFFSET_A733,
> +	.irq_stat_offset =3D DMA_IRQ_STAT_OFFSET_A733,
> +	.num_channels_per_reg =3D DMA_IRQ_CHAN_NR_A733,
> +};
> +

[Severity: High]
Does sun60i_a733_dma_cfg omit the set_burst_length, set_drq, and set_mode
function pointers?

When sun6i_dma_prep_dma_memcpy(), sun6i_dma_prep_slave_sg(), or
sun6i_dma_prep_dma_cyclic() are called, they unconditionally invoke these
function pointers:

    sdev->cfg->set_burst_length(&v_lli->cfg, burst, burst);
    sdev->cfg->set_drq(&v_lli->cfg, DRQ_SDRAM, DRQ_SDRAM);
    sdev->cfg->set_mode(&v_lli->cfg, LINEAR_MODE, LINEAR_MODE);

Could this result in a NULL pointer dereference on the A733 platform?


[Severity: High]
This is a pre-existing issue, but does setting num_channels_per_reg to 1 for
the A733 platform expose a physical channel indexing issue in
sun6i_dma_interrupt()?

When an interrupt occurs on a secondary IRQ register, sun6i_dma_interrupt()
reads the correct status register i, but calculates the physical channel
pointer as:

    pchan =3D sdev->pchans + j;

Since it omits the i * sdev->cfg->num_channels_per_reg offset, hardware
interrupts for higher channels appear to be routed to lower channels. On
A733, this would map all channel interrupts to channel 0.


[Severity: High]
This is a pre-existing issue, but does the loop bound in
sun6i_dma_interrupt() truncate due to integer division on platforms with
non-multiple channel counts?

    for (i =3D 0; i < sdev->num_pchans / sdev->cfg->num_channels_per_reg; i=
++) {
        status =3D sun6i_read_irq_stat(sdev, i);

If a platform has 12 physical channels and 8 channels per register (like H3=
),
the division evaluates to 1, causing the loop to only read interrupts for
channels 0-7 and ignore the final register. Could this cause transfers on t=
he
highest channels to time out?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826-sun60i-a73=
3-dma-v4-0-dc2f745f40dc@gmail.com?part=3D5
