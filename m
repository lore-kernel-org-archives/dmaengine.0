Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4B83A872C
	for <dmaengine@vger.kernel.org>; Thu, 13 Aug 2026 11:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786619264; cv=none; b=sOQwi9b8qMA0TIAV0g+fB65q9Ciqe6oKiVrvOeRQ263wSJJ08vORaFIFikxCisGDNMiuiLg6P0wzpCY0tRsKx1WrZXBB8/Z5lICf8h/4vVN85OGjKR1CwJczlfxNgG4dQSOv1eQQm73UomlhA3eMLiXoh6MVKq1kbxGdfjSmF1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786619264; c=relaxed/simple;
	bh=wB6T7WOaeuZAY6oDVaNfMlIdxqLpZsWxUiAKCWyHEOU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JCiTQQzo6PdD9W7DzAZDErFKkkAF+jl1sahHrXhp9/TBAgRAWni7NWUAdH9hpVDYA5uTXTo6XTjq3Wnp0U27hwyk6hQ8BMbm4zzSDZkeBBUpthkVKICTgsULMgY+Dth/daUsG2Z2CpQ7vdKmOIC6FUlL7M+/KzjBO00Nh9JI3gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N1G/D+5j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N1G/D+5j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C40161F000E9;
	Thu, 13 Aug 2026 11:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786619260;
	bh=EclKJkXsCOzzP1rTTKYZoP+hN18UiCjsoQGSZ3szoFk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N1G/D+5jfjTGMPJWGaFBP8ZSgxqv5DnfAXXYbHtWsBIiMkg4vpa+vcrlFigqi8GwT
	 Zmep9iWhCkDLu8JBTHpR/qW9XD6OHqxtPvlXFbBSDIv6QJ4QKDntiFJgvrfU94g/sx
	 GkNxso+olwPUWO5G7QtT2honOHF/uCKOJHt3o6BhqmyWmztyO0ODGJlyRQiZuWduWk
	 W2D4dOVh3aDbsNKsKnR48xhnrOEQXopI6O23NHLH/9FevugA//0PNLtWgGnHgse5nH
	 iHeD3yrjj7mGO/eoQZ0Z4YBudgTVZM5sIeL41/dWyRCv/LlASR9vWfcQgs8E+3ltY3
	 PoP8Z8/gNbx+w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: dw-axi-dmac: fix clock imbalance in resume
 error path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chaithanya Lagisetty" <nagachaithanya9911@gmail.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260813105432.2577322-1-nagachaithanya9911@gmail.com>
References: <20260813105432.2577322-1-nagachaithanya9911@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 11:07:39 +0000
Message-Id: <20260813110739.C40161F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver requests a shared interrupt before device clocks are en=
abled and channel registers are initialized, risking a kernel panic if a sh=
ared interrupt fires early.
- [High] Unbalanced PM runtime usage counter and hardware clock leaks on `d=
w_probe` error paths.
- [High] `dw_remove` leaks clock reference counts if the device was runtime=
 active, leaving clocks permanently enabled.
- [High] Ignored return values from `clk_prepare_enable()` in `dw_remove()`=
 can lead to fatal bus faults.
- [High] The driver shuts down hardware and kills tasklets in `dw_remove()`=
 before unregistering the DMA engine, exposing it to fatal race conditions.
- [High] Bypassing dmaengine channel unregistration in `dw_remove()` causes=
 resource leaks.
--

--- Patch [1]: [PATCH] dmaengine: dw-axi-dmac: fix clock imbalance in resum=
e error path ---
commit c0653e2ca540837590c802ab80fc07b1689246e9
Author: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>

dmaengine: dw-axi-dmac: fix clock imbalance in resume error path

This commit addresses a clock imbalance in the resume error path of the
dw-axi-dmac driver. It ensures the configuration clock is properly
disabled if the core clock fails to enable.

> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma=
/dw-axi-dmac/dw-axi-dmac-platform.c
> index bcefaff03b5c6..9db8993e0bc6a 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> @@ -1335,8 +1335,10 @@ static int axi_dma_resume(struct axi_dma_chip *chi=
p)
>  		return ret;
> =20
>  	ret =3D clk_prepare_enable(chip->core_clk);
> -	if (ret < 0)
> +	if (ret < 0) {
> +		clk_disable_unprepare(chip->cfgr_clk);
>  		return ret;
> +	}
> =20
>  	axi_dma_enable(chip);
>  	axi_dma_irq_enable(chip);

[Severity: High]
This is a pre-existing issue, but does this sequence in dw_probe() risk a
NULL pointer dereference if a shared interrupt fires early?

dw_probe() {
    ...
    ret =3D axi_req_irqs(pdev, chip);
    ...
}

Interrupts are requested here before chan_regs initialization and clock
enablement. If an interrupt fires early, dw_axi_dma_interrupt() calls
axi_dma_irq_disable() which accesses unclocked registers and subsequently
dereferences chan->chan_regs.

[Severity: High]
This is a pre-existing issue, but does dw_probe() leave the PM runtime
usage count unbalanced on error paths?

dw_probe() {
    ...
    goto err_pm_disable;
    ...
err_pm_disable:
    ...
}

If axi_dma_resume() fails, the execution jumps to err_pm_disable but fails
to call pm_runtime_put_noidle(). If dmaenginem_async_device_register()
fails, it jumps to err_pm_disable calling pm_runtime_disable() before the
scheduled pm_runtime_put() executes, leaving hardware clocks permanently
enabled.

[Severity: High]
This is a pre-existing issue, but does dw_remove() leak clock reference
counts if the device was runtime active?

dw_remove() {
    ...
    clk_prepare_enable(chip->cfgr_clk);
    clk_prepare_enable(chip->core_clk);
    ...
    axi_dma_suspend(chip);
    ...
}

If the device is active, PM runtime holds a clock reference. Calling
clk_prepare_enable() unconditionally increments it. axi_dma_suspend()
decrements it, but pm_runtime_disable() prevents PM runtime from dropping
the remaining reference, permanently leaving the clocks enabled.

[Severity: High]
This is a pre-existing issue, but can ignoring these return values lead to
fatal bus faults?

dw_remove() {
    ...
    clk_prepare_enable(chip->cfgr_clk);
    clk_prepare_enable(chip->core_clk);
    ...
}

If clock enablement fails here, the driver proceeds to access hardware
registers via axi_dma_irq_disable() and axi_chan_disable(), which will
trigger a fatal bus error.

[Severity: High]
This is a pre-existing issue, but does this tear down the hardware while
the DMA engine is still fully registered and accessible to clients?

dw_remove() {
    ...
    list_del(&chan->vc.chan.device_node);
    tasklet_kill(&chan->vc.task);
    ...
}

Since dw_probe() uses dmaenginem_async_device_register(), the actual DMA
engine unregistration is deferred until after dw_remove() returns. The
hardware is aggressively shut down here while clients can still submit
transactions, potentially causing use-after-free or bus faults.

[Severity: High]
This is a pre-existing issue, but does bypassing dmaengine channel
unregistration cause resource leaks?

dw_remove() {
    ...
    list_del(&chan->vc.chan.device_node);
    ...
}

Manually emptying the channel list breaks the subsequent deferred devres
unregistration loop. When dma_async_device_unregister() finally runs, the
list is empty, preventing __dma_async_device_channel_unregister() from
being called and leaking sysfs device nodes and IDAs for every channel.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813105432.2577=
322-1-nagachaithanya9911@gmail.com?part=3D1
