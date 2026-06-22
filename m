Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF021246BBA;
	Mon, 22 Jun 2026 01:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782093139; cv=none; b=qsE0VLkmJHjiU8qdGdIRwoiSeXKQh4QIT+ipz+bjeOgPS4+AdYcMzjwy37Pqnp8+I/5yTxid32MO0TTM+2E+AGv89cAJoLzQvBAiq5eqZQJkppyXmMwZxJuwvhhCmr59M62qOdpHg71TwpigqrQ8YXCkgAWYUUUAqRPOSlpBsl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782093139; c=relaxed/simple;
	bh=NBZzbFF9DtAW3NETutZTLlsaQ6rX1hatIyiITnvA9W0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EAC9RXr7feJGJ2R4mlq0V0sS35NgMjBqAroyHYV/0Z4FKNR6Vs4DKcucNlsiDyYOlq45foP5L0MOsm7N3roWy+Y+u4hu1Gv2N6pjCaSKXwtYpeb2Cg8HO9OckeeqvZKHlHjaQuM4cIphyjsvCif1EiFK1GkFVghY+/wlmFGjBao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dKWt1H57; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dKWt1H57"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7F911F000E9;
	Mon, 22 Jun 2026 01:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782093138;
	bh=imiBgz3OrgsjjlQrD+QZYa1RgDlvaxZkBKC8kGr5aJo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dKWt1H57QsZJbDSKXWg1Ro17pWOC2XUFDGCqvNzEtWCY/UroSYB9oYyK8TLwYgMLD
	 vq7QjTSwl7XSMEZMZX7E/OfyVpER6R56+HBH94M7oxIN1f0lsdMiEoRb36QJkFn1UK
	 6ZLe8paYA/HnhWtOh7wa71enOKwGG2tlJ/5Up6DyUYAiIahOac42rQAijV+pYMiSZ/
	 YxrIbg9FsDL9WKFxwItUm+Ed8Yl2tsDYaUAhRfSMtq4m9i8AjAHsoHFSjLP4PE6VXy
	 bkObn6Z/eTKUtbRFDjL4R0cKxC5zxT4j7HXFsxmiEl5T+HYqqoSFwS5A05WxsQmewX
	 GuwiaLTsnMvSA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/5] dmaengine: sun6i-dma: Add support for Allwinner
 A733 DMA controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yuanshen Cao" <alex.caoys@gmail.com>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org, linux-sunxi@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260622-sun60i-a733-dma-v3-5-f697ef296cbc@gmail.com>
References: <20260622-sun60i-a733-dma-v3-0-f697ef296cbc@gmail.com>
 <20260622-sun60i-a733-dma-v3-5-f697ef296cbc@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 22 Jun 2026 01:52:17 +0000
Message-Id: <20260622015217.E7F911F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Hardcoded loop bound in `sun6i_kill_tasklet` leads to out-of-bound=
s MMIO register writes.

Pre-existing issues:
- [Critical] Incorrect physical channel indexing in `sun6i_dma_interrupt` m=
isroutes hardware interrupts to the wrong software channels.
- [High] Integer division truncation in IRQ register loops silently drops i=
nterrupts for leftover channels.
- [High] A TOCTOU race exists between `sun6i_dma_interrupt` and `sun6i_dma_=
terminate_all`, leading to a NULL pointer dereference.
--

commit 901a8f4f5bfa274478e14bdc97eb09faba518f9f
Author: Yuanshen Cao <alex.caoys@gmail.com>

dmaengine: sun6i-dma: Add support for Allwinner A733 DMA controller
   =20
Support Allwinner A733 DMA controller. Define new register offsets,
bitfield mappings and dma_config required for the A733, which slightly
differs from the older sun6i DMA controllers.

> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index 196a0d73b2212..4808015934ccb 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
> @@ -257,6 +268,23 @@ static inline void sun6i_dma_dump_com_regs(struct su=
n6i_dma_dev *sdev)
[ ... ]
> +static inline void sun6i_dma_dump_com_regs_a733(struct sun6i_dma_dev *sd=
ev)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < sdev->num_pchans / sdev->cfg->num_channels_per_reg; i=
++) {

[Severity: High]
This is a pre-existing issue, but I noticed this loop limit might cause int=
eger
division truncation.

If the total number of channels is not an exact multiple of the channels
per register, the fractional remainder is truncated. For example, if a
platform has 12 channels and 8 per register, the loop only iterates once,
completely ignoring the second register.=20

Does this mean interrupts for the leftover channels are never read or
cleared, leading to an unhandled interrupt storm? Should this use=20
DIV_ROUND_UP instead? This buggy logic also seems to be present in
sun6i_dma_interrupt().

> +		dev_dbg(sdev->slave.dev, "Common register:\n"
[ ... ]
> @@ -1339,6 +1398,33 @@ static struct sun6i_dma_config sun50i_h6_dma_cfg =
=3D {
[ ... ]
> +static struct sun6i_dma_config sun60i_a733_dma_cfg =3D {
> +	.clock_autogate_enable =3D sun6i_enable_clock_autogate_h3,
[ ... ]
> +	.dst_addr_widths   =3D BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
> +			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
> +			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
> +	.num_channels_per_reg =3D DMA_IRQ_CHAN_NR_A733,

[Severity: Critical]
This is a pre-existing issue, but setting num_channels_per_reg to 1 for
the A733 controller appears to completely break the DMA controller due
to an issue in sun6i_dma_interrupt().

In sun6i_dma_interrupt(), the physical channel is resolved as:

    pchan =3D sdev->pchans + j;

Since num_channels_per_reg is 1, j is always 0. Does this route every
hardware interrupt to software channel 0, regardless of the actual
triggering channel? Should the calculation instead be updated to properly
account for the register index:

    pchan =3D sdev->pchans + i * sdev->cfg->num_channels_per_reg + j;

[Severity: High]
I also noticed an issue in sun6i_kill_tasklet() that might be triggered
by this configuration.

sun6i_kill_tasklet() calculates its iteration bounds using:

    for (i =3D 0; i < DMA_MAX_CHANNELS / sdev->cfg->num_channels_per_reg; i=
++)
        sdev->cfg->write_irq_en(sdev, i, 0);

With DMA_MAX_CHANNELS set to 16 and num_channels_per_reg set to 1, this
loop will unconditionally execute 16 times. If the dynamically initialized
channel count for the SoC is fewer than 16, will these writes target
unmapped peripheral memory space and potentially trigger a synchronous
external abort? Should the loop bound depend on the actual initialized
channel count (sdev->num_pchans) instead?

> +	.has_mbus_clk =3D true,
> +};

[Severity: High]
This is a pre-existing issue, but could there be a TOCTOU race condition
between sun6i_dma_interrupt() and sun6i_dma_terminate_all() that leads to
a NULL pointer dereference?

In sun6i_dma_terminate_all(), the channel is stopped and pointers are clear=
ed:

    vchan->phy =3D NULL;
    pchan->vchan =3D NULL;
    pchan->desc =3D NULL;
    pchan->done =3D NULL;

However, in sun6i_dma_interrupt(), the pointers are accessed like this:

    pchan =3D sdev->pchans + j;
    vchan =3D pchan->vchan;
    if (vchan && (status & vchan->irq_type)) {
        if (vchan->cyclic) {
            vchan_cyclic_callback(&pchan->desc->vd);
        } else {
            spin_lock(&vchan->vc.lock);
            vchan_cookie_complete(&pchan->desc->vd);

Since the interrupt handler checks vchan =3D pchan->vchan outside the lock,
could a concurrent call to sun6i_dma_terminate_all() clear pchan->desc
before it is dereferenced inside the interrupt handler, resulting in a
near-NULL pointer dereference?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260622-sun60i-a73=
3-dma-v3-0-f697ef296cbc@gmail.com?part=3D5
