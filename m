Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794961926;
	b=nEfDN/1Ct5NP9pYRorY9IzqLSVbOLFq1i5HcL8R/cGnoqnv3zyh4HN/H5/3f4lCVTZ/M
	 ADb3QD7JgqPzV/1aP7LoAWL8KSmWrG2YQZAMJyLRlQWh7ctIrGGrmoEJMKHh4a+xQq9F1
	 vwdU/JIgIqdeuMsGO0j/qfxOcLN0jHVW8C5d7gUNqx4lU6aH/P8aMbUg83dz5qpH7CIOT
	 oDGnjzl55V2WSjQ5EpIlfVHmVetbH0Zx8ykED9T+kRBr1EYI2v5dos2yDJhxa65cJWBsy
	 GyjUD+wHnRom0p1b0kat13raZBAdqzXxezZrqXxGCAbH2coDYMhzDsdDa7zU3FTvCgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794961926;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ajLriKZV6TBTrPcf2mXUiEeaovYt24sH1J1vfWCgv6o=;
	b=R6FCa+up5bEz47C5AP4/nuQCSBvJepdAjseT7Cs0JkYEogOLN8FG1MM1fqyiF0HBMGKx
	 rnglejj6oiSuc2UiXXZZPDvuCTo/dpqYDat2gDiRuoByHD5WPGhLEjldR7aMUmRf2Getu
	 WXG18d7bzIuVjaMVUFO7JE1eB/u6Qo7GWnsFqOa2UnC3kO3bsCGNiqBry54WTfLkLiPLV
	 2kPunGRY9atAmeokBG9g8bSE38BplnvLPApavOZCa+gcfncgtbZlOjG2Y0/KX6v2YrCdc
	 0Z8FMUWmtQF0wFjSZWLnAJ7HEcgLhyqitmzwZS9iT7UV0auSCsYuXRnoj4dLYrK+YJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=opCYPpmu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BF6606A31C
	for <dmaengine@vger.kernel.org>; Wed, 18 Nov 2026 00:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=opCYPpmu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBB201F000C4;
	Wed, 18 Nov 2026 00:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794961926;
	bh=ajLriKZV6TBTrPcf2mXUiEeaovYt24sH1J1vfWCgv6o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=opCYPpmu0dcRv9HCAdLnj3HVAblUv0ANEqM4oEZHe10AS4AKErycbQnGbQj5fqc40
	 LXwjjKvFQrPfS6gq+oc+6TfwMSu7lHf569qZUrKsupK1Yz9GT+zaOHFcxrua8W6Zfz
	 Uk95UGBSY1C2laW4OENt+sWbFP6RpLP5sIOuJoAQRBQ10vFQxDxLKrqKifBlqAKIyL
	 oUvVxOvn4MCW09SaAWrUUx7Huaet2WAWeTCxUeHDv5TIXTec7jGsEEzRkZDHPaV4XP
	 8MFisWrylliz5CSikYo6rv3S1zEbmEI2ZcaXWSptv64VaQWK1kTz3qMGA7Bcp0VVMF
	 Gc4EOEYrx47JA==
Message-ID: <sashiko-outbox-219846@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 8/8] dmaengine: dw-axi-dmac: guard shared IRQs across
 the controller lifetime
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261117-submit-dw-axi-dma-stop-pause-v1-v7-8-d5f2309afd72@gmail.com>
References: <20261117-submit-dw-axi-dma-stop-pause-v1-v7-0-d5f2309afd72@gmail.com>
 <20261117-submit-dw-axi-dma-stop-pause-v1-v7-8-d5f2309afd72@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 00:32:05 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [High] dmaengine: dw-axi-dmac: unhandled IRQ storm in dw_probe()
  before irq_ready
- [Medium] dmaengine: dw-axi-dmac: unhandled IRQ in dw_remove() before
  masking DMAC
- [Medium] dmaengine: dw-axi-dmac: dw_axi_dma_interrupt() drops IRQs in
  PM transitions
--

commit 7c162a89d8b1aefab137f65050f65004c3cd340c
Author: James Hilliard <james.hilliard1@gmail.com>

dmaengine: dw-axi-dmac: guard shared IRQs across the controller lifetime

This commit gates the shared interrupt handler on an irq_ready flag and a
runtime PM active check, while updating probe, suspend, and remove paths
to drain and mask interrupts around power state transitions.

> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma=
/dw-axi-dmac/dw-axi-dmac-platform.c
> index 0116c44d3bef1..b1d7530367448 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c

[ ... ]

> @@ -1166,6 +1167,14 @@ static irqreturn_t dw_axi_dma_interrupt(int irq, v=
oid *dev_id)
> =20
>  	u32 status, i;
> =20
> +	/* Pair with publication after channel registration in dw_probe(). */
> +	if (!smp_load_acquire(&chip->irq_ready))
> +		return IRQ_NONE;
> +
> +	/* Shared interrupts can arrive while the controller is suspended. */
> +	if (IS_ENABLED(CONFIG_PM) && pm_runtime_get_if_active(chip->dev) <=3D 0)
> +		return IRQ_NONE;

[Severity: Medium]
Can pm_runtime_get_if_active() drop valid controller interrupts during PM
transitions?

pm_runtime_get_if_active() returns 0 unless runtime_status is RPM_ACTIVE,
and returns -EINVAL when runtime PM is disabled (disable_depth > 0).
However, controller interrupts (INT_EN_MASK in DMAC_CFG) are enabled in
hardware during transition windows where those conditions do not hold:

- In rpm_resume(), runtime_status is still RPM_RESUMING when
  axi_dma_runtime_resume() -> axi_dma_resume() calls axi_dma_irq_enable().
- In rpm_suspend(), runtime_status is already RPM_SUSPENDING before
  axi_dma_runtime_suspend() -> axi_dma_quiesce_irqs() masks INT_EN_MASK.
- In pm_runtime_force_suspend() and pm_runtime_force_resume(),
  disable_depth is non-zero while hardware interrupts are still enabled
  before suspend or already re-enabled during resume.

If the controller asserts its level-triggered interrupt line during any of
these windows, dw_axi_dma_interrupt() returns IRQ_NONE without masking
DMAC_CFG or clearing CH_INTSTATUS, causing an unhandled IRQ storm that can
disable the shared IRQ line.

[ ... ]

> @@ -1661,16 +1687,23 @@ static int dw_probe(struct platform_device *pdev)
>  	pm_runtime_get_noresume(chip->dev);
>  	ret =3D axi_dma_resume(chip);
>  	if (ret < 0)
> -		goto err_pm_disable;
> +		goto err_pm_put;
> =20
>  	axi_dma_hw_init(chip);
> =20
> -	pm_runtime_put(chip->dev);
> +	ret =3D pm_runtime_set_active(chip->dev);
> +	if (ret)
> +		goto err_suspend;
> +	pm_runtime_enable(chip->dev);
> =20
>  	ret =3D dmaenginem_async_device_register(&dw->dma);
>  	if (ret)
>  		goto err_pm_disable;
> =20
> +	/* Publish initialized hardware and channel devices to the IRQ handler.=
 */
> +	smp_store_release(&chip->irq_ready, true);
> +	pm_runtime_put(chip->dev);

[Severity: High]
Can dw_probe() trigger an unhandled interrupt storm before chip->irq_ready
is set to true?

axi_req_irqs() has already registered dw_axi_dma_interrupt() earlier in
dw_probe(), and there are two windows where hardware interrupts are enabled
while chip->irq_ready is still false:

1. axi_dma_resume() enables global DMAC interrupts via
   axi_dma_irq_enable() before axi_dma_hw_init() masks and clears the
   per-channel interrupts.  On platforms without a reset line, or after a
   kexec or prior unbind (since dw_remove() does not clear CH_INTSTATUS),
   any stale pending channel interrupt will immediately assert the IRQ
   line while chip->irq_ready is false.
2. dmaenginem_async_device_register() publishes the DMA_MEMCPY channels to
   in-kernel consumers before smp_store_release(&chip->irq_ready, true)
   runs, so a client on another CPU can allocate a channel and complete a
   transfer before chip->irq_ready becomes true.

In either window, dw_axi_dma_interrupt() returns IRQ_NONE without masking
or clearing the level-triggered interrupt, causing a hardirq storm until
note_interrupt() permanently disables the shared IRQ line.

[ ... ]

> @@ -1697,21 +1735,24 @@ static void dw_remove(struct platform_device *pde=
v)
>  	u32 i;
>  	int ret;
> =20
> -	/* Enable clk before accessing to registers */
> -	ret =3D clk_bulk_prepare_enable(ARRAY_SIZE(chip->clks), chip->clks);
> -	if (ret)
> -		dev_warn(chip->dev, "failed to enable clocks before remove: %d\n",
> -			 ret);
> -	axi_dma_irq_disable(chip);
> -	for (i =3D 0; i < dw->hdata->nr_channels; i++) {
> -		axi_chan_disable(&chip->dw->chan[i]);
> -		axi_chan_irq_disable(&chip->dw->chan[i], DWAXIDMAC_IRQ_ALL);
> +	WRITE_ONCE(chip->irq_ready, false);
> +	ret =3D pm_runtime_resume_and_get(chip->dev);
> +	pm_runtime_disable(chip->dev);
> +	if (ret < 0) {
> +		dev_warn(chip->dev, "failed to resume before remove: %d\n", ret);
> +		goto free_irqs;
>  	}
> -	axi_dma_disable(chip);
> =20
> -	pm_runtime_disable(chip->dev);
> -	axi_dma_suspend(chip);
> +	axi_dma_quiesce_irqs(chip);

[Severity: Medium]
Does clearing chip->irq_ready and disabling runtime PM before
axi_dma_quiesce_irqs() leave hardware interrupts unmasked while
dw_axi_dma_interrupt() refuses to handle them?

In dw_remove(), WRITE_ONCE(chip->irq_ready, false) and
pm_runtime_disable() both run before axi_dma_quiesce_irqs() masks
INT_EN_MASK in DMAC_CFG.  Furthermore, if the device was runtime-suspended,
pm_runtime_resume_and_get() calls axi_dma_resume() -> axi_dma_irq_enable()
and unmasks INT_EN_MASK while chip->irq_ready is already false.  Any
level-triggered DMAC interrupt firing in this window causes
dw_axi_dma_interrupt() to return IRQ_NONE without masking or clearing the
source, which can trigger a spurious IRQ storm and disable the shared IRQ
line.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-submit-dw-=
axi-dma-stop-pause-v1-v7-0-d5f2309afd72@gmail.com?part=3D8
