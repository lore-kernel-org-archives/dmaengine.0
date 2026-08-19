Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C593E49F0
	for <dmaengine@vger.kernel.org>; Wed, 19 Aug 2026 22:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787179876; cv=none; b=i4KYO2IiVEbNNzYfYGNWvDQliuzlhxZMPE3kDSSfurHqnzfTDFn+ke/l7WImcYWR4Y54EsDiI28CJ5LM2d5YxHK8i9Kfw0YHloKxYoqFFbKNa+H9DHLaAWMVyoFtyITIc1NVZf2MO5kBcMXpEGQeELe78lN/9clvd6Z4ImbZXdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787179876; c=relaxed/simple;
	bh=LxvdFY4IY60DiaXZbV4kQ8Tjc/Evo6zw2ARNlssdlnU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MTs1Ln0d/aIG60e+NSx6hMYplU+CJeR52NZgOqI1jj7ssD0KKIebeI07fTZn31rLsV/6Agegl4WHaHha+9pmFmOVQHl234MMMTBM9GolQJzJKDTlYm+PX0E/DSMf2G5O9YJ2QhMjBIvZPaVrJbvTgLZ/Oi6ar20xELT1TXsCFhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QN9RymYU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QN9RymYU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE1511F000E9;
	Wed, 19 Aug 2026 22:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787179874;
	bh=ZOOSgJt7eWvQOatqIODhErVHakPHk72LFgzPu/w6adA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QN9RymYUCITaowY63KsFfG91sQxkmESiLUJ1rmFuPcIuNvXhJ8oJvhYBBSCUV910p
	 2/6g2WYGmFx9oxdlTxStt9AKuzxLcg3dSlSyDeOAuj8G32UAAshCBgCLNawpGyTSdq
	 +4rjCC9A/tV0Lu52YfSI/3YIfZhUKwyYDvvr9WIT9sHjgmIiv4JWRYKSGr9E0uwPDV
	 VsF5CeM6662mKVRNMj9gkGE8wi0U/9RfH/3m/uOtG66jKY7yEvCjriBca8Y7sRgM7q
	 rN4yBG5QGmGqYe/rHR5Q/4n+yFShpqOA56w3FrVaXi7XGAw3kSlgu68+oUC2DBDMQ2
	 XSGrxXxLnMZbg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] dmaengine: ste_dma40: Fix probe runtime PM disable
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260820-dma40-fixes-v1-2-5e14815ad689@kernel.org>
References: <20260820-dma40-fixes-v1-0-5e14815ad689@kernel.org>
 <20260820-dma40-fixes-v1-2-5e14815ad689@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 22:51:14 +0000
Message-Id: <20260819225114.AE1511F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Medium] The commit message claims to fix a bug regarding a 'later succes=
sful deferred probe', but deferred probe is structurally impossible for thi=
s driver.

Pre-existing issues:
- [High] Calling `free_pages()` on an `ioremap` mapped address in the probe=
 error path.
- [High] IRQ handler accesses hardware registers without checking runtime P=
M state.
- [High] Passing a raw page count instead of an allocation order to `__get_=
free_pages()` and `free_pages()`.
--

--- Patch [2]: [PATCH 2/4] dmaengine: ste_dma40: Fix probe runtime PM disab=
le ---
commit 724a6133520581f191bdd536bd3123c1d0c353fb
Author: Linus Walleij <linusw@kernel.org>

dmaengine: ste_dma40: Fix probe runtime PM disable

d40_probe() can jump to destroy_cache before runtime PM has been enabled
for the DMA controller device. Calling pm_runtime_disable() on that path
increments disable_depth, which can leave runtime PM disabled after a later
successful deferred probe.

Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/dmaengine/20260618051539.15E201F000E9@smtp.=
kernel.org/
Assisted-by: Codex:gpt-5-5
Signed-off-by: Linus Walleij <linusw@kernel.org>

> d40_probe() can jump to destroy_cache before runtime PM has been enabled
> for the DMA controller device. Calling pm_runtime_disable() on that path
> increments disable_depth, which can leave runtime PM disabled after a lat=
er
> successful deferred probe.

[Severity: Medium]
Is this description accurate regarding deferred probe?

The stedma40 driver is registered using platform_driver_probe() via
stedma40_init(), which sets drv->prevent_deferred_probe =3D true and preven=
ts
any future binds.

A later successful deferred probe appears to be impossible here, even though
fixing the unbalanced disable_depth is still semantically correct.

> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index d5837aa0a789a..0c8ff299c2c2d 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c

[ ... ]

> @@ -3658,7 +3660,8 @@ static int __init d40_probe(struct platform_device =
*pdev)
>  		regulator_disable(base->lcpa_regulator);
>  		regulator_put(base->lcpa_regulator);
>  	}

[Severity: High]
This is a pre-existing issue, but does the error path in destroy_cache
call free_pages() on an ioremap address?

If base->plat_data->use_esram_lcla is true, memory is mapped using
devm_ioremap() and assigned to base->lcla_pool.base. Just above this
regulator cleanup in destroy_cache, the code does:

    if (!base->lcla_pool.base_unaligned && base->lcla_pool.base)
        free_pages((unsigned long)base->lcla_pool.base,
                   base->lcla_pool.pages);

Calling virt_to_page() on an ioremap address yields a garbage pointer,
which would cause a crash when __free_pages() dereferences it.

> -	pm_runtime_disable(base->dev);
> +	if (runtime_pm_enabled)
> +		pm_runtime_disable(base->dev);
> =20
>   report_failure:
>  	d40_err(dev, "probe failed\n");

[Severity: High]
This is a pre-existing issue, but does the interrupt handler access
hardware registers without checking the runtime PM state?

A spurious interrupt could fire while the device is in runtime suspend.
The IRQ handler d40_handle_interrupt() unconditionally accesses the
PrimeCell registers:

drivers/dma/ste_dma40.c:d40_handle_interrupt() {
    ...
    regs[i] =3D readl(base->virtbase + il[i].src);
    ...
}

Since dma40_runtime_suspend() turns off the GCC clock, reading the unclocked
registers without calling pm_runtime_get_if_active() could cause a bus
fault (external abort).

[Severity: High]
This is a pre-existing issue, but does d40_lcla_allocate() pass a raw
page count instead of an allocation order?

During allocation, base->lcla_pool.pages is calculated as the absolute
number of pages needed:

drivers/dma/ste_dma40.c:d40_lcla_allocate() {
    ...
    base->lcla_pool.pages =3D SZ_1K * base->num_phy_chans / PAGE_SIZE;
    ...
    page_list[i] =3D __get_free_pages(GFP_KERNEL,
                                    base->lcla_pool.pages);
    ...
}

This raw count is then erroneously passed as the order parameter to
__get_free_pages(). For example, an order of 8 would allocate 256 pages
instead of the 8 pages actually needed, leading to wasted memory or
potential allocation failures.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820-dma40-fixe=
s-v1-0-5e14815ad689@kernel.org?part=3D2
