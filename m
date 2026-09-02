Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0886348C66
	for <dmaengine@vger.kernel.org>; Wed,  2 Sep 2026 01:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788313516; cv=none; b=Zx+kOvMd1st07kETXyKZByvQGWtUcV80NKAhO+zwpDoYwhz0cZiGtJluOFWArP0DZknyFM1Dyr7M80dqWj/w1Lo2qAqOi7uBqHyrRYPZAoNdh8xWDU1p4ZKj5iyNFRT2bxbAAWLATCRMLgR6rAOVhYdZ/HyC03NjlTFgLS2SNa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788313516; c=relaxed/simple;
	bh=OWAG+J80mwZk8J0SFruc6twTQmkHs+gf25sH1OmL3l4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fzkKTxuoJY1XmEhc58BxjsrEmXO5tdkAoW/xd51IPo1x2eB5KII33hkxIdhDsOf/03/xM76OjGSxFiNzwhrdDgTV8ixTt858d/sIuEsaL31X+h3jaoWgy76/uuueO9BfRjctplSQxXdjgR3608d934pPlCSfOqx0FDSYde5xVWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rjv/B0Xc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rjv/B0Xc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 065151F000E9;
	Wed,  2 Sep 2026 01:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788313504;
	bh=W+XH2OZoBhd3yYfQAKdpZY9xvta0RvFPPLFk/o9wp4M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Rjv/B0XcH8wSH+LVpESesbDSNlCToT+X/gRXrlAPGbiswUxSgUV8mtUEZA1qY9bnw
	 CwANdYqQJouWz4XgB/XpdVkE2eRG+IJTDlH0AwxI8opuobv9V3BEA7JNOZ4i36/F5Z
	 T97wH0s1v4Ch01riyPRHI9w9W7QHSKlH2y/Acihv55kR2V7tcNX2tvF/IiYBDC110d
	 4yWFWuqTjOgIDSSAo9n32msQ3k/4+UEFVEtEvCOG1C/1pXsKwDHE2iP+hAt3PeQPkg
	 gbcePbg8Nh3Z2+zYu7OJlIwBmA2HpkE4y9HYff7doOS4D1GQPlCMJrZDZX7t/uTKGk
	 46VRfU8D4o3LQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] dmaengine: dw-axi-dmac: convert to clk bulk APIs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Li Youhong" <dayou5941@163.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260902013016.3381788-1-dayou5941@163.com>
References: <20260902013016.3381788-1-dayou5941@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 01:45:03 +0000
Message-Id: <20260902014504.065151F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] Unchecked clk_bulk_prepare_enable() in dw_remove() introduces a re=
gression where a partial clock failure guarantees an external abort.

Pre-existing issues:
- [High] Virt-dma tasklets are not killed on probe error paths, risking Use=
-After-Free if scheduled.
- [High] Premature IRQ registration before channel registers are mapped and=
 clocks are enabled risks NULL pointer dereference and bus faults.
- [High] `dw_remove()` modifies per-channel hardware state without holding =
the required `chan->vc.lock`, allowing concurrent DMA operations to unsafel=
y re-enable channels.
- [High] The driver relies on devres to unregister the DMA engine asynchron=
ously after `dw_remove()` completes, exposing suspended hardware to concurr=
ent DMA clients.
--

commit 40975e504ffaf6727d542d4c2cde656ef32bc7dc
Author: Li Youhong <liyouhong@kylinos.cn>

dmaengine: dw-axi-dmac: convert to clk bulk APIs
   =20
axi_dma_resume() enables cfgr_clk then core_clk. If enabling
core_clk fails, return without disabling cfgr_clk, leaking the
already-enabled clock.

Switch both clocks to the clk bulk helpers so prepare/enable
failures roll back automatically, and update probe/remove/
suspend/resume accordingly.

> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma=
/dw-axi-dmac/dw-axi-dmac-platform.c
> index eebed2474210d..cf743450f629e 100644
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
> +	chip->clks[0].id =3D "cfgr-clk";
> +	chip->clks[1].id =3D "core-clk";
> +	ret =3D devm_clk_bulk_get(chip->dev, DW_AXI_DMA_MAX_CLKS, chip->clks);
> +	if (ret)
> +		return ret;

[Severity: High]
This isn't a bug introduced by this patch, but are the virt-dma tasklets
properly cleaned up if probe fails?

Later in dw_probe(), vchan_init() initializes a tasklet for each channel:

	vchan_init(&chan->vc, &dw->dma);

If a subsequent step like dmaenginem_async_device_register() fails, the dri=
ver
returns without calling tasklet_kill().

Since devm_request_irq() was called earlier with IRQF_SHARED, a shared
interrupt could fire and schedule the tasklet before the error path complet=
es,
leading to a use-after-free when devres frees the channel memory.

[Severity: High]
This is also a pre-existing issue, but does requesting the shared IRQ early
risk a NULL pointer dereference or bus fault?

In dw_probe(), devm_request_irq() is called with IRQF_SHARED:

	ret =3D axi_req_irqs(pdev, chip);

This happens before the hardware clocks are enabled and before chan->chan_r=
egs
is populated later in dw_probe():

	chan->chan_regs =3D chip->regs + COMMON_REG_LEN + i * CHAN_REG_LEN;

If a shared interrupt fires immediately, dw_axi_dma_interrupt() executes and
calls axi_dma_irq_disable(), which reads DMAC_CFG while clocks are off, cau=
sing
a bus fault. It also reads chan->chan_regs + CH_INTSTATUS, which is NULL,
resulting in a crash.

[ ... ]

> @@ -1642,8 +1635,7 @@ static void dw_remove(struct platform_device *pdev)
>  	u32 i;
> =20
>  	/* Enable clk before accessing to registers */
> -	clk_prepare_enable(chip->cfgr_clk);
> -	clk_prepare_enable(chip->core_clk);
> +	clk_bulk_prepare_enable(DW_AXI_DMA_MAX_CLKS, chip->clks);
>  	axi_dma_irq_disable(chip);

[Severity: High]
Does this unchecked bulk prepare/enable create a regression where a partial
clock failure leads to a bus fault?

During driver removal, if cfgr-clk enables successfully but core-clk fails,=
 the
clk_bulk API automatically rolls back and disables cfgr-clk. Because the re=
turn
value isn't checked, the code unconditionally proceeds to call
axi_dma_irq_disable().

axi_dma_irq_disable() reads the DMAC_CFG APB register while the APB clock is
disabled, causing a bus fault.

Before this patch, the individual clk_prepare_enable() calls did not roll b=
ack
cfgr-clk on core-clk failure, allowing the APB access to succeed safely.

>  	for (i =3D 0; i < dw->hdata->nr_channels; i++) {
>  		axi_chan_disable(&chip->dw->chan[i]);

[Severity: High]
This is a pre-existing issue, but does this loop unsafely modify hardware
state without holding chan->vc.lock?

In dw_remove(), axi_chan_disable() and axi_chan_irq_disable() are called
without acquiring the lock. Concurrently, a virt-dma tasklet or client can =
call
axi_chan_start_first_queued(), which acquires the lock and writes to DMAC_C=
HEN
to enable the channel.

This race could allow a channel to be re-enabled after dw_remove() attempte=
d to
disable it. When dw_remove() subsequently suspends the clocks, it could cra=
sh
the bus if the channel is actively transferring.

>  		axi_chan_irq_disable(&chip->dw->chan[i], DWAXIDMAC_IRQ_ALL);
>  	}
>  	axi_dma_disable(chip);
> =20
>  	pm_runtime_disable(chip->dev);
>  	axi_dma_suspend(chip);
> =20
>  	for (i =3D 0; i < DMAC_MAX_CHANNELS; i++)
>  		if (chip->irq[i] > 0)
>  			devm_free_irq(chip->dev, chip->irq[i], chip);

[Severity: High]
This isn't a bug introduced by this patch, but does this driver leave
suspended hardware exposed to concurrent DMA clients during unbind?

Because dw_probe() uses dmaenginem_async_device_register() (devm), the DMA
engine is only unregistered asynchronously by devres after dw_remove() fully
returns.

During dw_remove(), the hardware clocks are manually turned off via
axi_dma_suspend(). Since the DMA engine remains visible to clients througho=
ut
this process, a concurrent DMA request invoking dma_chan_issue_pending() wi=
ll
attempt to write to hardware registers with disabled clocks, leading to a b=
us
fault.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902013016.3381=
788-1-dayou5941@163.com?part=3D1
