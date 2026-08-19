Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC661DDA18
	for <dmaengine@vger.kernel.org>; Wed, 19 Aug 2026 22:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787179937; cv=none; b=XeJ5j1qCiLW2pTAFZEHCuabDvHEgTeuyuvO8TmT3E96ei+x7Wqpw2IdOyNhbi+qDualUDn44klPNikzuIAD/DRzPHqtgQrUJibS0IYQHIH8ssClmWA/b3qZDQfyaKbedlKAR7uhFbuR+wWZUu3aUVSrndK4FCX51VN8K+7QFZCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787179937; c=relaxed/simple;
	bh=MMcLwLVMofxrG5Xmp4XJwRLyl363v40ANsxTUdrl32o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WxHki37T/K3DSxCG67TtPBMNmAJ8zR7Rr1YnmmBfOen3RCoPhXI0btw+5Hy6WTGDhxz1uf8OT/hLWGY6rshMvX0zic14zZrBMssoh4xRt9tSIr57bq/JhCJc3WbAFxGEhQCEKMZvX7i8MxayNMV7b0XnblkXqYjfcTWqHLJvu/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MykPQufz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MykPQufz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EA2F1F000E9;
	Wed, 19 Aug 2026 22:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787179935;
	bh=J3QbueQVZzgh2eWfEkmJE1UZnOQnKobjoVCb46jW3/8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MykPQufz6tuNrw6vH+d/INOxAhJNndwjM9l0Q+Btd1cLxN5bo9j6RXK4S6/U0qKTg
	 KvVnKZtOlKt7P3unZdUjj9QHdi3PaRU2glhxw8sDJdOV2NvnmPT7jUpcordpAhW/sZ
	 jbpJ02oAv9Q7RS/+K1wBXCsgH6gUgupyixvbSXomC8tzqTThVgBl8ochCSYSFqJl1C
	 7n3+/Q32XClV7ttMX55iVCV3y7tbyzgeBif1+jQWZS9H+fFaVmgfijMrQibfe701r2
	 nAqvzyC3kgYqKvf9dQ8Ikg7XPXjsfXcLTiWOQ2bThBg23k50ZvwhlyYyaZnkczr/7t
	 kTdwyyyuf6wYA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] dmaengine: ste_dma40: Fix probe IRQ leak
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260820-dma40-fixes-v1-3-5e14815ad689@kernel.org>
References: <20260820-dma40-fixes-v1-0-5e14815ad689@kernel.org>
 <20260820-dma40-fixes-v1-3-5e14815ad689@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 22:52:14 +0000
Message-Id: <20260819225215.5EA2F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The probe error path incorrectly calls free_pages() on an ioremap =
pointer when ESRAM is used for LCLA.
- [High] The DMA engine devices are registered using devres (dmaenginem_asy=
nc_device_register), but core memory resources and the interrupt handler ar=
e manually freed in the probe error path, risking Use-After-Free.
- [High] d40_lcla_allocate() passes a calculated number of pages instead of=
 a logarithmic order to __get_free_pages(), leading to severe memory overal=
location.
- [High] The DMA engine is registered and exposed to other subsystems befor=
e hardware initialization is complete.
- [High] Out-of-bounds write in the global dma40_memcpy_channels array via =
unverified device tree input.
--

--- Patch [3]: [PATCH 3/4] dmaengine: ste_dma40: Fix probe IRQ leak ---
commit 5f3ddaa41f4f5eab5f519e10436cd8e82088831f
Author: Linus Walleij <linusw@kernel.org>

dmaengine: ste_dma40: Fix probe IRQ leak

d40_probe() registers the hardware interrupt before several later probe
steps that can fail. Those error paths jump to destroy_cache without
freeing the IRQ, leaving the handler registered after probe resources have
been released. This patch tracks successful IRQ registration and frees the
IRQ on later probe failure.

Closes: https://lore.kernel.org/dmaengine/20260618051539.15E201F000E9@smtp.=
kernel.org/

> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index 0c8ff299c2c2d..a723133d096ec 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
> @@ -3503,6 +3503,7 @@ static int __init d40_probe(struct platform_device =
*pdev)
>  	struct resource res_lcpa;
>  	int num_reserved_chans;
>  	bool runtime_pm_enabled =3D false;
> +	bool irq_requested =3D false;
>  	u32 val;
>  	int ret;
> =20

[ ... ]

> @@ -3595,6 +3596,7 @@ static int __init d40_probe(struct platform_device =
*pdev)
>  		d40_err(dev, "No IRQ defined\n");
>  		goto destroy_cache;
>  	}
> +	irq_requested =3D true;
> =20
>  	if (base->plat_data->use_esram_lcla) {
> =20

[ ... ]

> @@ -3660,6 +3662,8 @@ static int __init d40_probe(struct platform_device =
*pdev)
>  		regulator_disable(base->lcpa_regulator);
>  		regulator_put(base->lcpa_regulator);
>  	}
> +	if (irq_requested)
> +		free_irq(base->irq, base);

[Severity: High]
This isn't a bug introduced by this patch, but does the destroy_cache error
path call free_pages() on an ioremap pointer when ESRAM is used for LCLA?

In d40_probe(), if base->plat_data->use_esram_lcla is true,
base->lcla_pool.base is initialized with devm_ioremap():

drivers/dma/ste_dma40.c:d40_probe() {
    ...
    if (base->plat_data->use_esram_lcla) {
        ...
        base->lcla_pool.base =3D devm_ioremap(dev, res->start,
                                            resource_size(res));
    ...
}

However, in the destroy_cache error path, it seems to be freed using
free_pages():

drivers/dma/ste_dma40.c:d40_probe() {
    ...
 destroy_cache:
    ...
    if (!base->lcla_pool.base_unaligned && base->lcla_pool.base)
        free_pages((unsigned long)base->lcla_pool.base,
                   base->lcla_pool.pages);
    ...
}

Would passing this MMIO address to the page allocator cause a VM_BUG_ON or
memory corruption?

[Severity: High]
This isn't a bug introduced by this patch, but does the error path risk a
use-after-free by manually freeing core memory resources while the DMA engi=
ne
devices are still registered?

In d40_probe(), the DMA engine devices are registered using
d40_dmaengine_init():

drivers/dma/ste_dma40.c:d40_probe() {
    ...
    ret =3D d40_dmaengine_init(base, num_reserved_chans);
    if (ret)
        goto destroy_cache;
    ...
}

If a failure occurs after this point, the destroy_cache path manually frees
lcla_pool and the IRQ handler. Since d40_dmaengine_init() likely uses devres
to register the DMA devices, they remain globally visible until the probe
function returns and devres unwinds.

Could this allow a concurrent client to initiate a DMA transfer using freed
resources?

[Severity: High]
This is a pre-existing issue, but is the DMA engine registered and exposed =
to
other subsystems before hardware initialization is complete?

In d40_probe(), the DMA devices are registered via d40_dmaengine_init()
before d40_hw_init() is called:

drivers/dma/ste_dma40.c:d40_probe() {
    ...
    ret =3D d40_dmaengine_init(base, num_reserved_chans);
    if (ret)
        goto destroy_cache;
    ...
    d40_hw_init(base);
    ...
}

If a client requests a channel and starts a transfer before d40_hw_init()
finishes, could this lead to a bus lockup or corrupted transfers?

[Severity: High]
This is a pre-existing issue, but does d40_lcla_allocate() pass a page count
instead of a logarithmic order to __get_free_pages()?

In d40_lcla_allocate(), the required number of pages is calculated and stor=
ed
in base->lcla_pool.pages:

drivers/dma/ste_dma40.c:d40_lcla_allocate() {
    ...
    base->lcla_pool.pages =3D SZ_1K * base->num_phy_chans / PAGE_SIZE;
    ...
    page_list[i] =3D __get_free_pages(GFP_KERNEL,
                                    base->lcla_pool.pages);
    ...
}

If SZ_1K * base->num_phy_chans / PAGE_SIZE evaluates to 8, wouldn't passing=
 8
as the order request 2^8 (256) pages instead of 8, leading to massive memory
overallocation?

[Severity: High]
This isn't a bug introduced by this patch, but is there an out-of-bounds
write when parsing memcpy-channels from the device tree?

The global array dma40_memcpy_channels is sized to exactly 6 elements:

drivers/dma/ste_dma40.c:
    static int dma40_memcpy_channels[] =3D {
        DB8500_DMA_MEMCPY_EV_0,
        ...
        DB8500_DMA_MEMCPY_EV_5,
    };

In d40_of_probe(), the length is checked against D40_MEMCPY_MAX_CHANS (which
is 8), and then of_property_read_u32_array() writes up to 8 elements:

drivers/dma/ste_dma40.c:d40_of_probe() {
    ...
    if (num_memcpy > D40_MEMCPY_MAX_CHANS || num_memcpy <=3D 0) {
        ...
    }
    ...
    of_property_read_u32_array(np, "memcpy-channels",
                               dma40_memcpy_channels,
                               num_memcpy);
    ...
}

Could this overwrite adjacent kernel data if the device tree specifies 7 or=
 8
elements?

>  	if (runtime_pm_enabled)
>  		pm_runtime_disable(base->dev);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820-dma40-fixe=
s-v1-0-5e14815ad689@kernel.org?part=3D3
