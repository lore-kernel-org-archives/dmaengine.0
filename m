Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED8D3CF1F1
	for <dmaengine@vger.kernel.org>; Tue,  1 Sep 2026 01:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788227562; cv=none; b=YixoP73SuUMyOtN9viLvmwlE+8LOjR2fVNUrtw3dijW/s59MSobZPkwb4KSFJ0ElzAz1AhH0elQ4gvniOJcoVUMgal+KFNbLzvFjRdfgh4jwsUsb+AFd7Twf4pv+eXMz5VfJ6e+2nywuYfWbnMmBeG0d2DJ10mWe2YPG22CVSoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788227562; c=relaxed/simple;
	bh=ipZ/cUfoJgWzSHDBj/ffh3Ft8sRjwW7BuxKUXokiqpU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CEnN4QuMDuYN21kq9efz5JuoK/352Aou792pSl6py++muc6OG0arPrpc0Jz4rcwtASwfxiOm2VteDXU8PIV3YRnYv5gbN3fJf2D+7CbNcNxhH0GtbJPOe57fbXbAh+65h2sgosCRGfoCAcNyeN/xBRlIq++1Qh5TKV3xc42EJwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g+WgYsU8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g+WgYsU8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B74CC1F00A3D;
	Tue,  1 Sep 2026 01:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788227516;
	bh=BXeqLVODmyYXdr3uXd+v1T9AGtIOIp+5d7I11qc7Sko=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g+WgYsU8947QkeK49p1jd2GfmwnxVrNMMN92udL1EinKqvtVawcbHRYZ4vPbw3x7a
	 24pI7C1qOXEcqNyHYoP8Q4Hpv/AOJubCb5Qj4AhxULfR/y01/3F/UC7xb36v2CuAjB
	 FkN/g6KSovBs7f/YWsLRmdx7l+AyxOQRtZJV1N1w7GNWp3PyNZBhcLjE6jo+LsPiPW
	 Ey+XhUknffvlC2YvHP9tIl6ARDCycPJ5XyXzYXt06ITm5RTHqPSYaqKmY5wRfhzH2c
	 npO98VAYMU1GfObWKIDmsWWAcipjg4tT01v7BwK9cmH5wn0CFlVBgzA28lfrKozNzt
	 EZZo47yHQlqug==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] dmaengine: dw-axi-dmac: convert to clk bulk APIs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Li Youhong" <dayou5941@163.com>
Cc: dmaengine@vger.kernel.org, Frank.Li@kernel.org, vkoul@kernel.org
In-Reply-To: <20260901013916.194253-1-dayou5941@163.com>
References: <20260901013916.194253-1-dayou5941@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 01:51:56 +0000
Message-Id: <20260901015156.B74CC1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unchecked return value of `clk_bulk_prepare_enable()` in `dw_remov=
e()` risks synchronous external abort (bus fault).
- [High] Hardware dismantling and tasklet termination in `dw_remove` race w=
ith devres-managed DMA engine unregistration.
- [High] Out-of-bounds array write when parsing device tree interrupts in `=
axi_req_irqs`.
--

commit d3c59d86966d2cb3f7687638252b5fce4a07a2b0
Author: Li Youhong <liyouhong@kylinos.cn>

dmaengine: dw-axi-dmac: convert to clk bulk APIs
   =20
This patch switches the core and configuration clocks in the dw-axi-dmac
driver to use the clock bulk helpers. This ensures that prepare and enable
failures are automatically rolled back, preventing clock leaks.

> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma=
/dw-axi-dmac/dw-axi-dmac-platform.c
> index eebed2474210d..3a957af0e089d 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> @@ -1524,13 +1519,10 @@ static int dw_probe(struct platform_device *pdev)
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
> +	memcpy(chip->clks, dw_axi_dmac_clks, sizeof(chip->clks));
> +	ret =3D devm_clk_bulk_get(chip->dev, ARRAY_SIZE(chip->clks), chip->clks=
);
> +	if (ret)
> +		return ret;
> =20
>  	ret =3D parse_device_properties(chip);
>  	if (ret)

[Severity: High]
This is a pre-existing issue not introduced by this patch, but while
looking at device initialization triggered from dw_probe(), is there
a bounds checking issue in axi_req_irqs() when parsing the device tree?

In axi_req_irqs(), the code reads:

int irq_count =3D platform_irq_count(pdev);
for (int i =3D 0; i < irq_count; i++) {
        chip->irq[i] =3D platform_get_irq(pdev, i);
}

If a malformed device tree provides more than DMAC_MAX_CHANNELS (32)
interrupts, will this loop write past the bounds of the fixed-size
chip->irq[32] array and overwrite subsequent critical fields like regs
or clks?

[ ... ]

> @@ -1642,8 +1634,7 @@ static void dw_remove(struct platform_device *pdev)
>  	u32 i;
> =20
>  	/* Enable clk before accessing to registers */
> -	clk_prepare_enable(chip->cfgr_clk);
> -	clk_prepare_enable(chip->core_clk);
> +	clk_bulk_prepare_enable(ARRAY_SIZE(chip->clks), chip->clks);
>  	axi_dma_irq_disable(chip);

[Severity: High]
This isn't a bug introduced by this patch, but since we are modifying the
clock enablement here, does it make sense to check the return value of
clk_bulk_prepare_enable()?

If the clock controller fails to re-enable the clocks during a sysfs device
unbind, this code will proceed to call axi_dma_irq_disable() and access
hardware MMIO registers on an unclocked peripheral. Can this lead to a
synchronous external abort and kernel panic?

[Severity: High]
This is another pre-existing issue in dw_remove(), but is it safe to
manually tear down the tasklets and channels further down in this function?

Down in dw_remove(), we have:

list_for_each_entry_safe(chan, _chan, &dw->dma.channels,
                         vc.chan.device_node) {
        list_del(&chan->vc.chan.device_node);
        tasklet_kill(&chan->vc.task);
}

Since devres is used to unregister the DMA engine via
dma_async_device_unregister(), does prematurely deleting the channels from
dw->dma.channels bypass the subsystem protections? If a client driver is
still actively holding DMA channels during unbind, can this allow clients
to schedule dead tasklets or access freed resources while the DMA engine is
still publicly registered?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901013916.1942=
53-1-dayou5941@163.com?part=3D1
