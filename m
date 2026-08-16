Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F413321A2
	for <dmaengine@vger.kernel.org>; Sun, 16 Aug 2026 06:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786860306; cv=none; b=Fjh6RE7mPQLtqJ3ac2w0j8JT+xpArPWNXlNGSjjXeGUEKNWRP3ki1IMJ8Aaq5U9OJZiPtfCAxL63FSlqKI3/iagMGSSB1/gmjnXhoX4Gxp4iL5SwP4HG1t3DtHFtDKQOENbICQWGzKFN9F7noj6YcS9E61vNuK2B6CZImFrfTk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786860306; c=relaxed/simple;
	bh=xbTovxc3kp11DQ9iYcZaJZXoPZef4Ifd0qzp5yfVft4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iv8APu064CxTxEHKb86ib/rbdtfgjz2bLRrRknP1xtvvJ9rFYDhm86xLyjLJC5q+2O3HwrzkGJGnFD2LVyu289Vc3avoEUFLCpLjIeXRsurxzyXGaUPc3KhWX2X1h/uYIhOqqvscRTd/S2Hg/XtytbthNtYlgxXHAqntn11WK5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iHP5w+Yu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iHP5w+Yu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 475F51F000E9;
	Sun, 16 Aug 2026 06:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786860304;
	bh=+IFh9zFTwTPDMcFQC0z72grumBdKzpXyyjzTUorar24=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iHP5w+YumXpC4z3e5aZyWuvBVFljoW7mGqCVGy7gKfA/XYnDgVWPsA61GrDMX0SbI
	 vdLtfElEUye9JhyREwZ8sLmhrrGE6oXGWJ11n22yvDxylLGndl41oQ/IvMtQwQAsTZ
	 gi9CywNHqlhFt3zuaLSCjq1PtSM1wo73fFVTrqvD1ptl7/uXySEc7jbZBZY80WNYA8
	 BsBMF2ybIUMHHIH1P1iEN0iJCCg86Xa+bc4VPYR3ijZLdhAowjlAVPlsUgq+9M7njd
	 M9SmwfJF1YXqziTv1NJlcHwLqRV57XTyaHwZKuNS4fHq9eoiInHHUpxf7Fr2z4sAI8
	 EI2ZaPvbv+CJg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] dmaengine: dw-axi-dmac: convert clock handling to
 clk_bulk API
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chaithanya Lagisetty" <nagachaithanya9911@gmail.com>
Cc: dmaengine@vger.kernel.org, Frank.Li@kernel.org, vkoul@kernel.org
In-Reply-To: <20260816054858.2667380-1-nagachaithanya9911@gmail.com>
References: <an3y4lS-ZE4CdJ7R@SMW015318>
 <20260816054858.2667380-1-nagachaithanya9911@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 16 Aug 2026 06:05:03 +0000
Message-Id: <20260816060504.475F51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] The patch silently reverses the required clock enable and disable =
order, which can cause hardware initialization failures.

Pre-existing issues:
- [High] The interrupt handler unconditionally accesses unclocked device re=
gisters if an interrupt fires on a shared line while the device is in PM ru=
ntime suspend.
--

--- Patch [1]: [PATCH v2] dmaengine: dw-axi-dmac: convert clock handling to=
 clk_bulk API ---
commit 9a52e2da75664a18bf3bb34d3bc595717db1bddc
Author: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
Subject: dmaengine: dw-axi-dmac: convert clock handling to clk_bulk API

This commit converts the driver to use the clk_bulk API for managing its two
mandatory clocks. It consolidates the clock getting, enabling, and disabling
logic to simplify error handling and fix a clock refcount imbalance.

Link: https://lore.kernel.org/all/20260813105432.2577322-1-nagachaithanya99=
11@gmail.com/

> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma=
/dw-axi-dmac/dw-axi-dmac-platform.c
> index bcefaff03b5c6..254167a558ff7 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c

[ ... ]

> @@ -1524,13 +1519,11 @@ static int dw_probe(struct platform_device *pdev)
> =20
>  	chip->dw->hdata->use_cfg2 =3D !!(flags & AXI_DMA_FLAG_USE_CFG2);
> =20
> -	chip->core_clk =3D devm_clk_get(chip->dev, "core-clk");
> -	if (IS_ERR(chip->core_clk))
> -		return PTR_ERR(chip->core_clk);
> -
> -	chip->cfgr_clk =3D devm_clk_get(chip->dev, "cfgr-clk");
> -	if (IS_ERR(chip->cfgr_clk))
> -		return PTR_ERR(chip->cfgr_clk);
> +	chip->clks[0].id =3D "core-clk";
> +	chip->clks[1].id =3D "cfgr-clk";

[Severity: High]
Does this array initialization unintentionally reverse the clock enable and
disable sequence?

The old driver correctly enabled cfgr_clk before core_clk in axi_dma_resume=
(),
and disabled core_clk before cfgr_clk in axi_dma_suspend().

Because clk_bulk_prepare_enable() iterates forwards and
clk_bulk_disable_unprepare() iterates backwards, mapping core-clk to index 0
and cfgr-clk to index 1 applies the reverse hardware sequence for both.  Can
this cause hardware lockups or bus faults?

> +	ret =3D devm_clk_bulk_get(chip->dev, ARRAY_SIZE(chip->clks), chip->clks=
);
> +	if (ret)
> +		return dev_err_probe(chip->dev, ret, "failed to get clocks\n");

[Severity: High]
This is a pre-existing issue, but does the interrupt handler unconditionally
access unclocked device registers if an interrupt fires on a shared line
while the device is in PM runtime suspend?

In dw_probe(), the IRQs are requested using IRQF_SHARED:

dw-axi-dmac-platform.c:axi_req_irqs() {
	...
	ret =3D devm_request_irq(chip->dev, chip->irq[i], dw_axi_dma_interrupt,
			       IRQF_SHARED, KBUILD_MODNAME, chip);
	...
}

If the DMA controller is idle, runtime PM suspends the device, which disabl=
es
the clocks. If another device sharing the same IRQ line triggers an
interrupt, the handler is called:

dw-axi-dmac-platform.c:dw_axi_dma_interrupt() {
	...
	/* Disable DMAC interrupts. We'll enable them after processing channels */
	axi_dma_irq_disable(chip);
	...
}

Since axi_dma_irq_disable() accesses DMAC_CFG without checking if the device
is active, can this unclocked register read trigger a synchronous external
abort (kernel panic)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260816054858.2667=
380-1-nagachaithanya9911@gmail.com?part=3D1
