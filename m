Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284EA3195FB
	for <dmaengine@vger.kernel.org>; Tue, 26 May 2026 09:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779786955; cv=none; b=uZISIkb6N2z79yvvehxnoOscx3hnHzjR98U1BfV34hWtYcvqrQ/rpT3SfBmczvJBlvF82tG5tnndK7tyy30XqtH34Q5KIpnHvhryq6zLyCu8aYApmtkubXGU7WLZe8cXWqpkW+FKSfXd+tLR2WVDUEZyuxSqe4QRtBcXr65V+Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779786955; c=relaxed/simple;
	bh=C5X6hBO7vfarrhNMP6DpjK7GmrlEfRN2FkNQKtEsbqA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bUwH5SIroHo3Ac8QQ/CmCACl5hVH5Um297FmMRKWjq9Dg2kc2SM4gqNzhyzjacaef0UkFYc/MfSv2qUJbm36s02vtQ+7Kf7fUPXy5vgjD/XC0hTvczjt9A2tf1INnjbFO2EIeH+B2ma8ngh5Zya8arhzt8llh5Ys2fw6Uxb8PVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZMGoladh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZMGoladh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1D1C1F000E9;
	Tue, 26 May 2026 09:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779786953;
	bh=AcWAbGyRzPSdiXDerNe00CSWRSlwDxADdoJjCnbPWXQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZMGoladhO3FDEo5X61wv/z+yAdjog4t3W/RiRGcr1oPa7hHT03zWygBtUSyphlGda
	 F99UNv3qDBAgzbx7uD4/ax2rmEWqMF9/JHoR+jnno2V5Vz1C7JA1oQ+xMWogmGTodE
	 BN4txuKWV7Gs6ar8iiJcIb9qCwSHTs2Xxn/DP5BKkGGEuHPPfgJMzvoo/+VM8lsZIe
	 EFML6+GIGAYLAVbIz2LCVZme0XNfaeo5HUD6cNLGB+iJcelGXtctQmf67CXOBMuefD
	 6qeD5/GQQWumd1Wgi0CBiYApRTqX3JB012KkinsnvvzaDpsMMXyfaTzkO+3NoJx7pI
	 kLyGOtDTDOaag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 04/18] dmaengine: sh: rz-dmac: Use
 rz_dmac_disable_hw()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Claudiu Beznea" <claudiu.beznea@kernel.org>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260526084710.3491480-5-claudiu.beznea@kernel.org>
References: <20260526084710.3491480-5-claudiu.beznea@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 26 May 2026 09:15:52 +0000
Message-Id: <20260526091552.E1D1C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The IRQ handler is managed via `devm_request_threaded_irq` but not=
 explicitly disabled before suspending `pm_runtime` and asserting reset in =
`rz_dmac_remove`.
--

commit e012424755ae0df83a2b4aaef3c18ec6973ad51c
Author: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

dmaengine: sh: rz-dmac: Use rz_dmac_disable_hw()

This commit replaces an open-coded register write with a call to
rz_dmac_disable_hw() to unify the code. It also moves the hardware disable
sequence after vchan_init() during channel probe.

> diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
> index 1717b407ab9e9..40ddf534c0948 100644
> --- a/drivers/dma/sh/rz-dmac.c
> +++ b/drivers/dma/sh/rz-dmac.c

[ ... ]

> @@ -1000,15 +1000,15 @@ static int rz_dmac_chan_probe(struct rz_dmac *dma=
c,
>  	}
>  	rz_lmdesc_setup(channel, lmdesc);
> =20
> -	/* Initialize register for each channel */
> -	rz_dmac_ch_writel(channel, CHCTRL_DEFAULT, CHCTRL, 1);
> -
>  	channel->vc.desc_free =3D rz_dmac_virt_desc_free;
>  	vchan_init(&channel->vc, &dmac->engine);
>  	INIT_LIST_HEAD(&channel->ld_queue);
>  	INIT_LIST_HEAD(&channel->ld_free);
>  	INIT_LIST_HEAD(&channel->ld_active);
> =20
> +	/* Initialize register for each channel */
> +	rz_dmac_disable_hw(channel);
> +
>  	/* Request the channel interrupt. */
>  	scnprintf(pdev_irqname, sizeof(pdev_irqname), "ch%u", index);
>  	irq =3D platform_get_irq_byname(pdev, pdev_irqname);

[Severity: High]
This is a pre-existing issue, but since we are looking at the channel
initialization here, could the use of devres for the IRQ handler lead to a
crash during module removal?

In rz_dmac_remove(), the driver asserts the hardware reset via
reset_control_assert() and disables device power via pm_runtime_put() and
pm_runtime_disable(). Because the interrupts for the DMA channels are manag=
ed
using devm_request_threaded_irq() just below this block, they are not freed
and synchronized until the devres cleanup runs after rz_dmac_remove() retur=
ns.

If an interrupt is already in flight on another CPU or pending in the
interrupt controller just before the reset is asserted, would the interrupt
handler execute and attempt to read device registers?=20

Accessing registers of a device that is in reset or powered down might caus=
e a
synchronous external abort, leading to a kernel panic during module unbind.

Should the driver explicitly free or disable the IRQs before turning off the
hardware in the remove path?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260526084710.3491=
480-1-claudiu.beznea@kernel.org?part=3D4
