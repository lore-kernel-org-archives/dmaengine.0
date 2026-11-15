Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794778896;
	b=c8dtfAyqHKobrG3iJ3WzWsdpCyeBcdJo5vT6YSQZdLf8VnMf43/3Y/TeH5jxpB9wOnO2
	 LWjkp2nl9BktT2PMew6ok3rzmULT80YjZyvM09Uq8TJ5hiWxFxH/onQp1VkSB1VVkRd40
	 uJqndnu7LyRpRByRIymFhqhBMpGoLuo8UVyqUiTWOqOqkqvP7dEvtHDBhNsVez/+Rr6qk
	 9Womv+T4wZrwLUVoTrTJc0MVrxUe7Quf1kK+e+9URYpq0D6fMAkYymIyDEFPM7tonC8eX
	 7ac0HiB+6kFKXLlqvB6yHyUwNUvdpUPKkCCdpV/WjNzH4z/+LCvJqVA4awQSOpAy24w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794778896;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=w+anAIYdKnvcawtUKf0L0dAIaM6Z4JUQgSAWVjpWsFY=;
	b=0Dfj8d1IVzPmSTm77xUT28PXQ+1Mx61/SUYzye74xEaDpM8yS+OxLHGFPq7CvyI9c1MG
	 WK3hSKfriM5piqc3NBXlJG0/9SC2MKwV3Jkq5cDTY4j8+YeyUcU3j7omLoRRwWbWQYczT
	 Q8JZHvcjaWgrrQykGk2QxN3TpVLDaqY53U9ViLR3tfaRwrbD5WkspBu2UDjVGiPd57iHO
	 +pmgClyZN+7vD2YsGgAePcXJhb+uKwv3NxG8NPL0Wshnf4+SgpNKEd9XvDxq9nTjvbGMR
	 pRTdudGI/wLpUI9AewOIHs6bqdj0JskuAB3g3j7GGYaLqhmeN6aW02VySss0Mr/dcTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="gXoHsQE/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CF6606A32F
	for <dmaengine@vger.kernel.org>; Sun, 15 Nov 2026 21:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gXoHsQE/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B9621F000C4;
	Sun, 15 Nov 2026 21:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794778895;
	bh=w+anAIYdKnvcawtUKf0L0dAIaM6Z4JUQgSAWVjpWsFY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gXoHsQE/mUEGlNreFugjrDc9LrPB72dMTy2UgSCkk47GCmwH+Xl8v+l+iMvOt9Z+E
	 8AnZppeIPuCBWrBKqB63BLlOzrP8NVhMdWgid1hI9A3BBRtZ3IIsBad7g+URn8DFNK
	 iZ9DbNs3d3+Ajn05HVcqpPfjPh36MTIeKB3V+JYvgahrMOEVgFhUpU1JvEXvJJCWDw
	 4/eA8jfUJbWBtZX0iHkZYTf766t3eJMH+5q9NdUUZBTO2zIsolmLMPGDcIzZwqbhUi
	 ojiK9hUUA2/DgBiOmQaJFC9SAFTDO2P+Bp2PCxq11Dc7DxHZVFmA4i0WxNenXlVtPv
	 Va1tzpTtdiO9w==
Message-ID: <sashiko-outbox-215867@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: ste_dma40: Use power domain for LCLA SRAM
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261115-ux500-dma40-powerdomain-v1-1-da8b6e1a0376@kernel.org>
References: <20261115-ux500-dma40-powerdomain-v1-1-da8b6e1a0376@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 21:41:35 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] dmaengine: ste_dma40: chained dev_err_probe() in d40_probe()
  clobbers reason
It also noticed 2 related pre-existing issues this patch does not
introduce:
- [Critical] dmaengine: ste_dma40: use-after-free in d40_free_dma() [1]
- [Critical] dmaengine: ste_dma40: DMA API bypass in d40_lcla_allocate()
  [2]
--

commit 1b5cce170c6b1253e8f796cc9973f76ac7915f4f
Author: Linus Walleij <linusw@kernel.org>

dmaengine: ste_dma40: Use power domain for LCLA SRAM

This commit replaces the LCLA ESRAM regulator and obsolete named memory
resource with LCLA SRAM phandle lookup and runtime PM of the SRAM device
owning the ESRAM34 power domain.

> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index f1cbc719c4f09..eca1ae95fe1c9 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
[ ... ]
> @@ -2270,7 +2291,7 @@ static int d40_free_dma(struct d40_chan *d40c)
>  		d40c->base->lookup_phy_chans[phy->num] =3D NULL;
> =20
>  	if (d40c->busy)
> -		pm_runtime_put_autosuspend(d40c->base->dev);
> +		d40_transfer_runtime_put(d40c->base);
> =20
>  	d40c->busy =3D false;
>  	d40c->phy_chan =3D NULL;

[Severity: Critical]
This problem wasn't introduced by this patch, but can calling d40_term_all()
before d40_channel_execute_command(d40c, D40_DMA_STOP) in d40_free_dma() ca=
use
a hardware use-after-free [1]?

drivers/dma/ste_dma40.c:d40_free_dma() {
    ...
	d40_term_all(d40c);
    ...
	res =3D pm_runtime_resume_and_get(d40c->base->dev);
	if (res >=3D 0) {
		res =3D d40_channel_execute_command(d40c, D40_DMA_STOP);
    ...
}

When tearing down an active channel, d40_term_all() unmaps and frees the
active descriptors while the DMA controller is still running and accessing
that memory until D40_DMA_STOP is issued.

[ ... ]
> @@ -3640,13 +3655,9 @@ static void __init d40_hw_init(struct d40_base *ba=
se)
> =20
>  	/* Write which interrupt to clear */
>  	writel(pcicr, base->virtbase + base->gen_dmac.interrupt_clear);
> -
> -	/* These are __initdata and cannot be accessed after init */
> -	base->gen_dmac.init_reg =3D NULL;
> -	base->gen_dmac.init_reg_size =3D 0;
>  }
> =20
> -static int __init d40_lcla_allocate(struct d40_base *base)
> +static int d40_lcla_allocate(struct d40_base *base)
>  {
>  	struct d40_lcla_pool *pool =3D &base->lcla_pool;
>  	size_t lcla_size =3D SZ_1K * base->num_phy_chans;

[Severity: Critical]
This problem wasn't introduced by this patch, but shouldn't
d40_lcla_allocate() write pool->dma_addr instead of
virt_to_phys(base->lcla_pool.base) to D40_DREG_LCLA [2]?

drivers/dma/ste_dma40.c:d40_lcla_allocate() {
    ...
	pool->dma_addr =3D dma_map_single(base->dev, pool->base, lcla_size,
					DMA_TO_DEVICE);
	if (dma_mapping_error(base->dev, pool->dma_addr)) {
		pool->dma_addr =3D 0;
		ret =3D -ENOMEM;
		goto free_page_list;
	}

	writel(virt_to_phys(base->lcla_pool.base),
	       base->virtbase + D40_DREG_LCLA);
    ...
}

Programming raw CPU physical addresses instead of the mapped DMA address
bypasses IOMMU translations and bus offsets, which also happens in
d40_prep_sg_phy() where virt_to_phys(desc->lli_phy.src) and
virt_to_phys(desc->lli_phy.dst) are passed to d40_phy_sg_to_lli().

[ ... ]
> @@ -3781,13 +3791,70 @@ static int __init d40_of_probe(struct device *dev,
>  	return 0;
>  }
> =20
> -static int __init d40_probe(struct platform_device *pdev)
> +static int d40_lcla_sram_setup(struct d40_base *base)
> +{
[ ... ]
> +	if (!IS_ALIGNED(res.start, LCLA_ALIGNMENT) ||
> +	    resource_size(&res) < SZ_1K * base->num_phy_chans ||
> +	    res.end > U32_MAX) {
> +		of_node_put(parent);
> +		return dev_err_probe(dev, -EINVAL, "Invalid LCLA SRAM region\n");
> +	}
[ ... ]
> @@ -3844,26 +3911,12 @@ static int __init d40_probe(struct platform_devic=
e *pdev)
>  		d40_err(dev, "Failed to ioremap LCPA region\n");
>  		goto report_failure;
>  	}
> -	/* If lcla has to be located in ESRAM we don't need to allocate */
> -	if (base->plat_data->use_esram_lcla) {
[ ... ]
> -	} else {
> +	ret =3D d40_lcla_sram_setup(base);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "Failed to set up LCLA SRAM\n");
> +		goto destroy_cache;
> +	}
> +	if (!base->lcla_pool.esram) {
>  		ret =3D d40_lcla_allocate(base);
>  		if (ret) {
>  			d40_err(dev, "Failed to allocate LCLA area\n");
[ ... ]
> @@ -3954,22 +3987,18 @@ static int __init d40_probe(struct platform_devic=
e *pdev)
>  		dma_unmap_single(base->dev, base->lcla_pool.dma_addr,
>  				 SZ_1K * base->num_phy_chans,
>  				 DMA_TO_DEVICE);
> -
> -	if (!base->plat_data->use_esram_lcla &&
> -	    !base->lcla_pool.base_unaligned && base->lcla_pool.base)
> +	if (!base->lcla_pool.base_unaligned && base->lcla_pool.base)
>  		free_pages((unsigned long)base->lcla_pool.base,
>  			   base->lcla_pool.alloc_order);
> =20
>  	kfree(base->lcla_pool.base_unaligned);
> -
> -	if (base->lcpa_regulator) {
> -		regulator_disable(base->lcpa_regulator);
> -		regulator_put(base->lcpa_regulator);
> -	}
> +	if (base->lcla_link)
> +		device_link_del(base->lcla_link);
> +	if (base->lcla_dev)
> +		put_device(base->lcla_dev);
> =20
>   report_failure:
> -	d40_err(dev, "probe failed\n");
> -	return ret;
> +	return dev_err_probe(dev, ret, "probe failed\n");
>  }

[Severity: Low]
Does calling dev_err_probe(dev, ret, "probe failed\n") at report_failure
overwrite the deferred probe reason recorded earlier by d40_lcla_sram_setup=
()
or platform_get_irq()?

When d40_lcla_sram_setup() returns -EPROBE_DEFER, d40_probe() records "Fail=
ed
to set up LCLA SRAM" via dev_err_probe() and jumps to destroy_cache, which
falls through to report_failure and replaces that reason in debugfs
devices_deferred with "probe failed".  On non-deferral errors such as an
invalid LCLA SRAM region, chaining dev_err_probe() across
d40_lcla_sram_setup(), its caller, and report_failure also logs up to three
error messages for a single failure.

[1] https://sashiko.dev/#/bug/linux-36e6bab6-2c91-434c-83be-1363c42736bc
[2] https://sashiko.dev/#/bug/linux-ca33b515-31eb-4b66-afe9-8493aaf2e04a

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115-ux500-dma4=
0-powerdomain-v1-1-da8b6e1a0376@kernel.org?part=3D1
