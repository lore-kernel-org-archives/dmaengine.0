Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19C93BFAF7
	for <dmaengine@vger.kernel.org>; Sat,  8 Aug 2026 11:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786187483; cv=none; b=iUrp0DU2OTsHcqQ3E3hfJlG11O4wcPmDHp9gvOwE8ikItSDzdjBIrbPvZWlz/qgqyIfxDZ6Zwnjgx3UL3XAHdyrW8KgRk9+RLBcfBOlQbfVWTTp8tGwCoxtyccaoLjhycLwzVkwPrXigWecWP8HCgHZE+Bu+bQN8h6abiOxwDso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786187483; c=relaxed/simple;
	bh=LxvHmZJYnlNSLII/zmPTd1EvOqtsOrlUGGnFU56o/PU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=O+XzdKG4ZvURi8i0DsGb2J29Dqfu2F4i1ZVZ7aAfBYNMzydUH6kkOmn5f62HrH8hqEen9qa41ZUwr+LcZGyvDqbnuoQewIyBR5KAlq1zOV+y6nmrpyiYTI1BaO3WKSVoa77ax8o3lgsM724hSLYIzqiM3U+Oz/PnI3fs2xJWD7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V2L1yntp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V2L1yntp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ECF91F000E9;
	Sat,  8 Aug 2026 11:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786187481;
	bh=DZTQp9jaUumLNpopMGLOfn+DT+xmM/cmYmEaIgzQqbY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V2L1yntpBwAIIkrK9jfrmSf25NMpPrNY4Bxrvqy4FJoDMVGUhJRGq5J6C4UHN12es
	 kUdLfi7jdU+8xlK47jY5nNomxiYbffqIXkTYCYyGyS7agjltJ9r8NdBVpNCVewdcrC
	 kufJt10cJpLYoq85s0qm7avONal3u/wwtMttg3qFs9YS8Xsr3FEyn80TYBvij3a9YS
	 z8Wi3OBhoMR6gVyLVjL/ofAMj7JgLfsRSUHgRHCypvWSLbRP5scSplyrR2JxbMhJU/
	 o4kIvm8iXZ/FFpwgNcon9+udCRryzSjJVL25s1Zgpr4Mzos4XwTacA7BC30WIOf+zF
	 VIpXpSa4KPM2A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: ste_dma40: fix autosuspend cleanup on probe
 failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guangshuo Li" <lgs201920130244@gmail.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260808105657.2762974-1-lgs201920130244@gmail.com>
References: <20260808105657.2762974-1-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 11:11:20 +0000
Message-Id: <20260808111121.4ECF91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unbalanced PM runtime state due to unconditional disable on probe =
failure.
- [High] IRQ resource leak and subsequent Use-After-Free on probe failure.
- [High] Incorrect order parameter passed to `__get_free_pages()` causes ex=
ponentially oversized allocations.
- [High] Calling `free_pages()` on a `devm_ioremap()` pointer causes a kern=
el panic.
- [High] Missing tasklet cleanup on probe failure leads to Use-After-Free.
- [High] Teardown asymmetry leaves active DMA engines exposed to users afte=
r backing resources are freed.
--

--- Patch [1]: [PATCH] dmaengine: ste_dma40: fix autosuspend cleanup on pro=
be failure ---
commit 314875d0410790018090d6a5f3fa67bbac67585d
Author: Guangshuo Li <lgs201920130244@gmail.com>

dmaengine: ste_dma40: fix autosuspend cleanup on probe failure

d40_probe() calls pm_runtime_use_autosuspend(), but its error path does
not call the matching pm_runtime_dont_use_autosuspend() before
disabling runtime PM.

If the autosuspend delay is set to a negative value while autosuspend
is enabled, the runtime PM core increments usage_count to prevent
runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
during cleanup, this reference is not dropped and usage_count remains
unbalanced.

Add the missing pm_runtime_dont_use_autosuspend() call to the probe
failure path before disabling runtime PM.

Fixes: 8d318a50b3d7 ("DMAENGINE: Support for ST-Ericssons DMA40 block v3")
Cc: stable@vger.kernel.org

> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index 0d9ffa3e26639..e2ad50e0fec48 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
> @@ -3654,6 +3654,7 @@ static int __init d40_probe(struct platform_device =
*pdev)
>  		regulator_disable(base->lcpa_regulator);
>  		regulator_put(base->lcpa_regulator);
>  	}
> +	pm_runtime_dont_use_autosuspend(base->dev);
>  	pm_runtime_disable(base->dev);
> =20

[Severity: High]
This isn't a bug introduced by this patch, but since we are modifying the
PM cleanup here, does this unconditional call to pm_runtime_disable() cause
an unbalanced runtime state if probe fails early?

If d40_probe() jumps to destroy_cache before pm_runtime_enable() is called
(e.g., during memory allocation or IRQ request), this will increment the
device's disable_depth from 1 to 2. If the device is probed again later,
the next pm_runtime_enable() will only decrement it to 1, leaving the
device permanently disabled.

[Severity: High]
This is a pre-existing issue, but looking at the surrounding error cleanup
path, is there an IRQ resource leak here?

The driver requests an unmanaged interrupt earlier:

    request_irq(base->irq, d40_handle_interrupt, 0, D40_NAME, base);

If a subsequent initialization step fails and we jump to destroy_cache,
free_irq() is omitted. Could this leave a dangling pointer registered as
the IRQ handler data, potentially causing a use-after-free if the hardware
fires an interrupt after devres frees the base structure?

[Severity: High]
This is a pre-existing issue, but does the cleanup in destroy_cache risk
calling free_pages() on an I/O mapped pointer?

When base->plat_data->use_esram_lcla is true, the base pointer is assigned
an I/O mapped address:

    base->lcla_pool.base =3D devm_ioremap(dev, res->start, resource_size(re=
s));

If probe fails, destroy_cache evaluates if base_unaligned is NULL and
base->lcla_pool.base is true, leading to:

    free_pages((unsigned long)base->lcla_pool.base, base->lcla_pool.pages);

Passing an I/O memory address to free_pages() seems invalid.

[Severity: High]
This is a pre-existing issue, but is the pages parameter passed to
free_pages() and __get_free_pages() calculated correctly?

In d40_lcla_allocate(), the value is calculated as the raw number of pages:

    base->lcla_pool.pages =3D SZ_1K * base->num_phy_chans / PAGE_SIZE;

This raw count is then passed as the order parameter to __get_free_pages():

    __get_free_pages(GFP_KERNEL, base->lcla_pool.pages);

Would passing the raw count instead of an order (e.g., 8 instead of 3 for
32 channels) cause exponentially oversized allocations?

[Severity: High]
This is a pre-existing issue, but does the error path omit tasklet cleanup?

During channel initialization, tasklets are set up:

    tasklet_setup(&d40c->tasklet, dma_tasklet);

If probe fails afterwards, tasklet_kill() is not called in the cleanup
path. If an interrupt fires and schedules a tasklet before probe fails,
could the tasklet still execute after devres frees the channel structures?

[Severity: High]
This is a pre-existing issue, but is there a teardown asymmetry with the
DMA engine registration?

The DMA engine is exposed via a managed API:

    dmaenginem_async_device_register(&base->dma_slave);

If probe fails later (e.g., in of_dma_controller_register), the code
jumps to destroy_cache and manually destroys the lcla_pool, unmaps DMA
addresses, and disables regulators. However, the successfully registered
DMA engines remain active until devres unregisters them later.

Could concurrent clients acquire a channel and initiate transfers during
this window, accessing freed memory or operating with disabled regulators?

>   report_failure:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260808105657.2762=
974-1-lgs201920130244@gmail.com?part=3D1
