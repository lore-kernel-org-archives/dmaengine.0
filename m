Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565E94052CD
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 15:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786375126; cv=none; b=epgwxaG5XyN0Xj4kVm5sL8SJpBtQnLLXGBNTaPud7CGsxvSm+xZXGEii5B0MI7lOiDU6H73IGix05jjtvceVhIdr3MPYEv2F0Ae9xhUUtvM+g9v3i3dPdUP2LFUGSHiwy9xiB8ZnTRkfDUA5IeHiSBCJ/fx/XcQqY5C4hiA7ylY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786375126; c=relaxed/simple;
	bh=74EGx83VivcmQ9HBoOOZ1WDQhZZG/IFfu7SCXKGfxQc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jtYU+PTpE9zqQ5PaBsssGBNnDx2D2kPd25AzLuVY3dMNg2Rt5nbb4rEtTvXiny73O5bFc+K169oD8SfEjiXnyfyaC24pYi1KX+IQYiYSKx4DrESJFzfUrRecE73DeIXrQbJpMYq4enyK0DdpVcynTd7H+3U3nFfGrPJkYK4ZaHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OAB5v/o1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OAB5v/o1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B28E1F000E9;
	Mon, 10 Aug 2026 15:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786375124;
	bh=9TSG7knUk1fo+mfyKWUhWfY4dkgLparIx4+M0lII7Mc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OAB5v/o1fAvXwnHSrbD+1LbYq8+suk5Nn1NRtBTM2QWmlJiTRMzwLfxoX5SbnKneC
	 xQZW5816WaEZ8nTinDHUOTsS/AkwJoXhoURv4QItEXc6VuKURw0kiJHJGIl/hIcusn
	 0zwhvOw8TxB1aPJdjc0C0tFM/meCHadFuFH/VtaSRBe23tLlHExtPtD6YSP5zyCJXn
	 oLOlS67qA4xZzpSq2f4igC5aYVuRaCsx2weaeGOIP32famWmPdc1i9EsAWROK1/6tb
	 9W9DP8yQukZxzbbXm2Bdeprv7H/S+CHPo2GODlc7S95jXHOKVO0J4Pl+Am0KV6ueny
	 jXivFBj+F0q/w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/9] dmaengine: dw-axi-dmac: Use bus width capability
 helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TnVubyBTw6E=?= <nuno.sa@analog.com>
Cc: dmaengine@vger.kernel.org, Frank.Li@kernel.org, vkoul@kernel.org
In-Reply-To: <20260810-dmaengine-support-wider-dma-masks-v2-3-1f7b798d035f@analog.com>
References: <20260810-dmaengine-support-wider-dma-masks-v2-0-1f7b798d035f@analog.com>
 <20260810-dmaengine-support-wider-dma-masks-v2-3-1f7b798d035f@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 15:18:44 +0000
Message-Id: <20260810151844.8B28E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver requests a shared IRQ before fully initializing the cha=
nnel structures and enabling device clocks, risking a system crash and NULL=
 pointer dereference if an interrupt fires early.
--

--- Patch [3]: [PATCH v2 3/9] dmaengine: dw-axi-dmac: Use bus width capabil=
ity helpers ---
commit 716fd3c99096094837bfe18d429e50e20434ac33
Author: Nuno S=C3=A1 <nuno.sa@analog.com>
Subject: dmaengine: dw-axi-dmac: Use bus width capability helpers

This commit updates the driver to advertise supported bus widths through
the dma_set_src_bus_widths and dma_set_dst_bus_widths helpers. It moves
away from assigning legacy u32 masks directly.

> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma=
/dw-axi-dmac/dw-axi-dmac-platform.c
> index eebed2474210d..0fc4aa537346d 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c

[ ... ]

> @@ -1565,8 +1565,15 @@ static int dw_probe(struct platform_device *pdev)
> =20
>  	/* DMA capabilities */
>  	dw->dma.max_burst =3D hdata->axi_rw_burst_len;

[Severity: High]
This is a pre-existing issue in dw_probe(), but does the current
initialization sequence risk a bus fault or NULL pointer dereference?

Earlier in dw_probe(), the driver requests a shared IRQ before fully
initializing the channel structures and enabling device clocks:

dw_probe() {
    ...
    ret =3D axi_req_irqs(pdev, chip);
    ...
    for (i =3D 0; i < hdata->nr_channels; i++) {
        struct axi_dma_chan *chan =3D &dw->chan[i];
        chan->chan_regs =3D chip->regs + ...
        ...
    }
    ...
    ret =3D axi_dma_resume(chip);
}

If the IRQ is shared and fires immediately after the request,
dw_axi_dma_interrupt() is invoked while the hardware clocks are still
disabled. It accesses hardware registers via axi_dma_irq_disable() which
might cause a synchronous external abort.

If the system survives the unclocked access, dw_axi_dma_interrupt()
iterates over the channels and calls axi_chan_irq_read(), dereferencing
the uninitialized chan->chan_regs pointer:

dw_axi_dma_interrupt() {
    ...
    axi_dma_irq_disable(chip);
    for (i =3D 0; i < dw->hdata->nr_channels; i++) {
        chan =3D &dw->chan[i];
        status =3D axi_chan_irq_read(chan);
        ...
}

Would it be safer to request the IRQ only after the channel structures
are fully initialized and the clocks are enabled?

> -	dw->dma.src_addr_widths =3D AXI_DMA_BUSWIDTHS;
> -	dw->dma.dst_addr_widths =3D AXI_DMA_BUSWIDTHS;
> +	ret =3D dma_set_src_bus_widths(&dw->dma, axi_dma_buswidths,
> +				     ARRAY_SIZE(axi_dma_buswidths));
> +	if (ret)
> +		return ret;
> +
> +	ret =3D dma_set_dst_bus_widths(&dw->dma, axi_dma_buswidths,
> +				     ARRAY_SIZE(axi_dma_buswidths));
> +	if (ret)
> +		return ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810-dmaengine-=
support-wider-dma-masks-v2-0-1f7b798d035f@analog.com?part=3D3
