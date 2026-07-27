Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4273E63A8
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 21:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785187054; cv=none; b=Vl5H6QJ9RGtWkL7B9S4kpFfkg9stMBX+zv4auUIoHptNOQHzNH2U8whZe3VUrxpGLeFBiEsTUKtuEm+IIF1ccoMXL921SBqx8id9RcolGUs1nl7xgGB6gC90ik2nGE94ascj2QMM2FcuFVsOlcsdWijXkk5Ed3ukTHLeeh3GFBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785187054; c=relaxed/simple;
	bh=b9tiCO1OEfgWSVQbJEY2wsk8pg7BiFIiYZE5skOpdc8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Y2xagnA9gMaPGrXBoUM7Dx797NphAjFwSk+lkxrrZd0OAn81aHBZoj5R85eIKbXhjKJq6NHoxV4bofv+CCI1IRqMwXlmgjiORbn7w+E0OXWHUu2FzOMZ7K718usxG4NlyedwAC4Nytap2wqraCHmRrcYh51CWXMG6qnXHmPf2C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jFXPk+Dx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jFXPk+Dx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C31BE1F00A3A;
	Mon, 27 Jul 2026 21:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785187053;
	bh=fZcMU+mU+B96r9a1R3yG9zY+ZS+ANGqbvRK4Nhv4wQE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jFXPk+DxXwWiGIX42WoohhyW3yBkR/IF5ox2EOTx9YD2hYF4g362hSxE9sdCqY7D5
	 4LYL7g4MjV9IX5+ivwJnSCXCq/he+6L9efbFHU4Td1cyilZ6/ZgB0pREOG161cFtSh
	 opf5xS/qNT425fcky55s3QB855q4vgy2ox/pRYoRAoVPfx5bSiOb0uhg7/Gsrfs48H
	 eBIiF8QdIhyPtknIWsnsNqwb9QRbP51bYlcH6w93MGikYMSai77hH4sk+LOZ4Ariwz
	 KmRSyhPYnqdy+1XBEbrFCsAQ+xBakS8J5h0+98v8K6Ms4Z2aIGc+CgrIF30qHXOvwt
	 tXxbOyN4Q1Y7g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 52/64] dmaengine: tegra210-adma: kill vchan BH on
 teardown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <131ec17f48b91f3981df2d5e84fae5d43195d32b.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <131ec17f48b91f3981df2d5e84fae5d43195d32b.1785183549.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 21:17:32 +0000
Message-Id: <20260727211732.C31BE1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incorrect ordering of bottom-half termination and IRQ freeing leav=
es a window for spurious execution and use-after-free.
- [High] Requesting the IRQ before powering up the device via Runtime PM ca=
uses a kernel panic if a pending or spurious interrupt fires.
--

--- Patch [52]: [PATCH v2 52/64] dmaengine: tegra210-adma: kill vchan BH on=
 teardown ---
commit acf1e1ab4d7c08f6577663273485ed69a1d42e71
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: tegra210-adma: kill vchan BH on teardown

Use dma_chan_kill_bh() for virt-dma cleanup.

> diff --git a/drivers/dma/tegra210-adma.c b/drivers/dma/tegra210-adma.c
> index ceaee1e33e68a..598abcc4edaa1 100644
> --- a/drivers/dma/tegra210-adma.c
> +++ b/drivers/dma/tegra210-adma.c
> @@ -811,7 +811,7 @@ static void tegra_adma_free_chan_resources(struct dma=
_chan *dc)
> =20
>  	tegra_adma_terminate_all(dc);
>  	vchan_free_chan_resources(&tdc->vc);
> -	tasklet_kill(&tdc->vc.task);
> +	dma_chan_kill_bh(&tdc->vc.chan);
>  	free_irq(tdc->irq, tdc);

[Severity: High]
This is a pre-existing issue, but does this ordering leave a window for a
use-after-free?

If a delayed or spurious interrupt fires after dma_chan_kill_bh() flushes t=
he
bottom-half, but before free_irq() unregisters the interrupt, couldn't the
interrupt handler execute and reschedule the bottom half via
vchan_cyclic_callback()?

Because free_irq() only waits for hardirq handlers and does not flush pendi=
ng
bottom halves, this rescheduled bottom half could execute asynchronously af=
ter
the channel teardown completes and the client driver has freed its buffers.

Would it be safer to call free_irq() before dma_chan_kill_bh() to ensure
hardware events are disabled before flushing the work?

>  	pm_runtime_put(tdc2dev(tdc));
> =20

[Severity: High]
This is also a pre-existing issue, but looking at the allocation side in
tegra_adma_alloc_chan_resources(), is it safe to request the IRQ before
powering up the device?

drivers/dma/tegra210-adma.c:tegra_adma_alloc_chan_resources() {
    ...
    ret =3D request_irq(tdc->irq, tegra_adma_isr, 0, dma_chan_name(dc), tdc=
);
    if (ret) {
        ...
    }

    ret =3D pm_runtime_resume_and_get(tdc2dev(tdc));
    ...
}

If the interrupt line is already active from a previous session or a spurio=
us
hardware event, the CPU could immediately execute tegra_adma_isr() upon IRQ
registration.

Since tegra_adma_isr() unconditionally reads the ADMA_CH_INT_STATUS registe=
r,
and the device clock is disabled before pm_runtime_resume_and_get(), can
this access to unclocked hardware cause a synchronous external abort?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785183549.gi=
t.allen.lkml@gmail.com?part=3D52
