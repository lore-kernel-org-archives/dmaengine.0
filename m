Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D801BBBFC
	for <dmaengine@vger.kernel.org>; Thu,  9 Jul 2026 14:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783607021; cv=none; b=aoIyL6sEf7s+iq5tTnOZodp1MK/nTrzyIWXvCt4nYYDk3LP22jMokzcYi53DIOvb5BeVFKQ4n6KEaLSNU5MAdns+hXDR8f7+jgo1pdIAo01JWS8Dte+vkK/QIOZ6KLULGbqqGpoHZ+RW04L5yig1Co+EPXv+B3ohTknNtQX4AnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783607021; c=relaxed/simple;
	bh=N2owLqQ+Ple1keEPEHMm5sLk/V92rsy5s/mPlrC29CQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BRFh5/buy/mjGpnTskU452OdOahlppLs2kdkLJ/v6+cEk5TkjEDl9Ef4mbjbkDhPFQICPq/b5OPGe4z9W+8PDQQRhCVIo66ajFdn4BM8FAjoYHQvzcGu2G9n+3B8HQURYMLFqNsRwqMLbjl9drnQ0GGUhhDpA1XJOkEyHMEdzSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W6548fE9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W6548fE9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A84981F00A3E;
	Thu,  9 Jul 2026 14:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783607020;
	bh=UsNXh191FC+P1JDNVQfHz0rhp50vuU38c3VHCuRUNN0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W6548fE9IZMHgDX9Uv73jmYAHnX+Z/dlPXeOnOD+0JVuh270aRLvmCiVpv1WroTon
	 Gfyem70EjU41LKUEJ/sJwQJbVw7J90yyp1+pMDMRR1ffEPaBC3YMjsXl3z2Vi8MKlu
	 VCOdrg0U7GH5mmy2+TcznGGHDzQ9eQe7mbcm1Gf1JBI+w1fcFERmmET0M4/Msz5+ir
	 1myO7P6w0m3m23pDiEctO0u1IUudag4H0jWBwppWAk/xbgoyJZHBTMXJP3B9xPO3Ia
	 P2jE85n+/+Hv68KtE2EilYnq/fELZh5PtYEqZocKOL1pn8hS0hwyu06FsFNyKZQIc7
	 IT9mRXzgwykdQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 12/26] dmaengine: sh-rcar-dmac: Remove redundant
 dev_err()/dev_err_probe()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pan Chuang" <panchuang@vivo.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, wsa+renesas@sang-engineering.com, vkoul@kernel.org
In-Reply-To: <20260709135846.97972-13-panchuang@vivo.com>
References: <20260709135846.97972-1-panchuang@vivo.com>
 <20260709135846.97972-13-panchuang@vivo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 14:23:39 +0000
Message-Id: <20260709142339.A84981F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] System crash due to unclocked register access on spurious interrupt
--

--- Patch [12]: [PATCH 12/26] dmaengine: sh-rcar-dmac: Remove redundant dev=
_err()/dev_err_probe() ---
commit 910ca9859b95c7ea2133b72448deeefa62bebf2b
Author: Pan Chuang <panchuang@vivo.com>

dmaengine: sh-rcar-dmac: Remove redundant dev_err()/dev_err_probe()

This commit removes driver-specific error logging when requesting the
channel interrupt. The logging is removed because
devm_request_threaded_irq() now automatically logs detailed error messages
on failure.

> diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
> index 44eab2d21d54f..4cd7f0189bc7b 100644
> --- a/drivers/dma/sh/rcar-dmac.c
> +++ b/drivers/dma/sh/rcar-dmac.c
> @@ -1793,11 +1793,8 @@ static int rcar_dmac_chan_probe(struct rcar_dmac *=
dmac,
>  					rcar_dmac_isr_channel,
>  					rcar_dmac_isr_channel_thread, 0,
>  					irqname, rchan);

[Severity: High]
This is a pre-existing issue, but is it safe to leave the interrupt active
when the device enters runtime suspend?

Since the IRQ is managed by devm_request_threaded_irq(), it remains
unmasked even when the power domain gates the clock (for example, after
rcar_dmac_probe() calls pm_runtime_put()).

If a spurious interrupt fires while the clock is gated, the hardirq
handler unconditionally accesses a device register:

rcar_dmac_isr_channel() {
        ...
        chcr =3D rcar_dmac_chan_read(chan, RCAR_DMACHCR);
        ...
}

Could this unclocked register read cause a synchronous external abort and
subsequent kernel panic?

A similar window appears to exist in rcar_dmac_remove(). It calls
pm_runtime_disable(), which leaves the clock disabled if the device was
already suspended, before devres unregisters the IRQ. Can a spurious
interrupt during this teardown phase also trigger the same panic?

> -	if (ret) {
> -		dev_err(dmac->dev, "failed to request IRQ %u (%d)\n",
> -			rchan->irq, ret);
> +	if (ret)
>  		return ret;
> -	}
> =20
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709135846.9797=
2-1-panchuang@vivo.com?part=3D12
