Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA6C242D65
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786386192; cv=none; b=Ro3OW7BTNWOtagXlYHzlwp8x+7/G6ql0K9052YmDvUUChapNLMzZotoMeJxM6obr+pDXCs11d0q14awN1+gbFXV4ufmfjvM5SIG3c1Vu1+3F4GEqfb9mYL3JABjrX8NtWYd0w0RgMz9rdjpSpxwYU4CUARkIZfon86C9Ikoz7i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786386192; c=relaxed/simple;
	bh=zWKJrD4A/ggSW0WPbjTidgV8B58e/NmMGsF3KkGOa/0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Yf4M2xobGRVOW7tvDIOvhskpG7BwjtUnS9DxTH0oCK4I3GX/paIvpz/hBZnDSuQdQGN2zZd6QThUA389grfoUaP5iLHnn9sxw5Csz8gK3egqCpCFsVMwZPOOhbvsS/cn5IGYHg8qEkTSk8lK6SvjvaTh9HpoWmlK5WRU45om2aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gaRrce6T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gaRrce6T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F10621F000E9;
	Mon, 10 Aug 2026 18:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786386191;
	bh=QjsUNy5m2LsdIxYdBCpSZ/rPP0UZWdQgZtv7R7Y1NOs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gaRrce6TJrvl+l31Iccbfd0Bf+NLInxnImI1hA3Ev1WnFKREl4Q84oyX+2jNahnty
	 R8ldZ9BWcaLmctcKapPCCxUt+Uol8duC4tP1qmAFreuzqc1bMfHuvl2mISxkIvLuPk
	 tHpPkMlN1rnQtGf6FJ0Dj6sZItssNxWKiGOTZNyjBPr3txP7zsNEE07LLPQx3jio5B
	 SDYH7ZSeG8pDx4EEqJ5lSxoOUQyMtZP/17DX8IjjLYC4UbuHolrQiNAFuIv50irxMh
	 qhuzYOhCdRp1OvH4mDGMFD5ogB93kE++IIf8Fz3pelKZ5ipjyvKI+3vBWPC3PfAvmJ
	 GbN8D7vu/eIGg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 14/34] dmaengine: nbpfaxi: switch callbacks to
 dmaengine BH
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <c4331588c6ee8f4c73a49b5cdc262fba72042d23.1786384168.git.allen.lkml@gmail.com>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <c4331588c6ee8f4c73a49b5cdc262fba72042d23.1786384168.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 18:23:10 +0000
Message-Id: <20260810182310.F10621F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Shared IRQs are registered before the device clock is enabled, ris=
king a bus fault or system crash.
--

--- Patch [14]: [PATCH v3 14/34] dmaengine: nbpfaxi: switch callbacks to dm=
aengine BH ---
commit 0e57a5ca2e574d87910252599a7cb1273a78c7e5
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: nbpfaxi: switch callbacks to dmaengine BH
   =20
Replace the per-channel tasklet with the shared dmaengine BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

> diff --git a/drivers/dma/nbpfaxi.c b/drivers/dma/nbpfaxi.c
> index 05d7321629cc8..7dd5fc55228d2 100644
> --- a/drivers/dma/nbpfaxi.c
> +++ b/drivers/dma/nbpfaxi.c
[ ... ]
> @@ -1272,7 +1271,7 @@ static int nbpf_chan_probe(struct nbpf_device *nbpf=
, int n)
> =20
>  	snprintf(chan->name, sizeof(chan->name), "nbpf %d", n);
> =20
> -	tasklet_setup(&chan->tasklet, nbpf_chan_tasklet);
> +	dmaengine_init_bh(&chan->dma_chan, nbpf_chan_tasklet);
>  	ret =3D devm_request_irq(dma_dev->dev, chan->irq,
>  			nbpf_chan_irq, IRQF_SHARED,
>  			chan->name, chan);

[Severity: High]
This is a pre-existing issue, but shared IRQs are registered here in
nbpf_chan_probe() before the device clock is enabled.

If another device sharing the IRQ line triggers an interrupt before
clk_prepare_enable(nbpf->clk) is called later in nbpf_probe(), or if a
spurious interrupt occurs, the kernel will invoke nbpf_chan_irq().

The handler calls nbpf_status_get() which reads from device registers.
Accessing memory-mapped registers of a device while its clock is disabled
can cause a synchronous external abort (bus fault) and crash the system.

Furthermore, on the error path of nbpf_probe(), clk_disable_unprepare()
is called manually while the devm-managed IRQs remain active until devres
cleanup runs, creating a second window for the same crash.

Does this initialization sequence need to be restructured so that IRQs are
registered only after the clock is enabled, and disabled before the clock
is turned off?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786384168.gi=
t.allen.lkml@gmail.com?part=3D14
