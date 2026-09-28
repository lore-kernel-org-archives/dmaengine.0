Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D944E379EF0;
	Mon, 28 Sep 2026 03:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790566014; cv=none; b=deI4KTO6qtoYw/1WanTybdMuOnXsrbdyx+rJwqO3hslPy/Ezvu1l9yfyKyEB8Q7TldwS+qVA1LEfheCdAyhesYuzvI6ei3OQdsU0VC1Rts7tlMxU0Kll1BQihk8C2D7KtNMNtvY6vmtg27W4MX4L4WVix6NqmnbZlRlgm5b+OYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790566014; c=relaxed/simple;
	bh=NcQptIWXQUPT4nCJo/IKs5hxTQnsKAlCHCBaCyUJ/rc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QDgwP32a90WSE0uzE0s/6CMSIiIqZ9pE7m65pYHX3Op2ALpmXEUdy8AXc0oIQgmV/1nEvGuLJdiSudh1l+yghN3bbfD/LUvlusmhtpFSVOZByUeEmjale8z7wODiCAEDwcud9eSBHBp/DCW2fHQ1kdG0Mw1Apv+vafJyiBvhlvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aLnnyvcQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aLnnyvcQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 120051F000FF;
	Mon, 28 Sep 2026 03:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790566012;
	bh=VvXoUxmMJgKvUh1r7ME8o8WkdrnDRTj7C91xkRiaKo4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aLnnyvcQL21KbN8ArMdJ0fbVaWDIE6VJAcmj43Q2a6SdX87EgJ+oez5qwj6+Bnc0G
	 REL2c/GMruZWkaCp5yhXd52IEXCtHNmk1oyGViAZCs+2ovucbOigEdKQQl7ditE2Um
	 S5Rjompi2ZotgPgXkBIdw01I8WXbaOFP1QTN3ImFeTAhZEgZL70/KHiZF+7zV4n519
	 yz1lK5IqjPVqOeQshKlkCJq3bCA2e94fQdV4CufBcluMHsx7z10nO/GtRuNmI/7/gp
	 Od6jQv0+3Zi15nAu9fB5VdX0eItHs8w+h65GMEXKxX3QV8tFhm59Mfah5LeCKlpK73
	 jDc4Isp05jUPQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 16/19] dmaengine: ti: k3-udma-v2: New driver for K3
 BCDMA_V2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Sree Kartheek Adivi" <s-adivi@ti.com>
Cc: vkoul@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260928025749.1055383-17-s-adivi@ti.com>
References: <20260928025749.1055383-1-s-adivi@ti.com>
 <20260928025749.1055383-17-s-adivi@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 03:26:51 +0000
Message-Id: <20260928032652.120051F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Critical] dmaengine: ti: kernel panic due to double descriptor completion
- [High] dmaengine: ti: descriptor memory leak on autopair timeout
- [Medium] kconfig: TI_K3_UDMA_V2 selects TI_K3_RINGACC without inheriting =
dependencies
- [Medium] dmaengine: ti: code contradicts commit message regarding PEER re=
gisters
--

commit d73848739c5384bf6614c47a767d4ef7e89a8626
Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>

    dmaengine: ti: k3-udma-v2: New driver for K3 BCDMA_V2
   =20
    Add support for BCDMA_V2.
   =20
    The BCDMA_V2 is different than the existing BCDMA supported by the
    k3-udma driver.

> diff --git a/drivers/dma/ti/Kconfig b/drivers/dma/ti/Kconfig
> --- a/drivers/dma/ti/Kconfig
> +++ b/drivers/dma/ti/Kconfig
[ ... ]
> @@ -49,6 +49,18 @@ config TI_K3_UDMA
>  	  Enable support for the TI UDMA (Unified DMA) controller. This
>  	  DMA engine is used in AM65x and j721e.
> =20
> +config TI_K3_UDMA_V2
> +	tristate "Texas Instruments K3 UDMA v2 support"
> +	depends on ARCH_K3
> +	select DMA_ENGINE
> +	select DMA_VIRTUAL_CHANNELS
> +	select TI_K3_UDMA_COMMON
> +	select TI_K3_RINGACC

[Severity: Medium]
Is this select missing a dependency? Enabling TI_K3_UDMA_V2 selects
TI_K3_RINGACC, but omits TI_SCI_INTA_IRQCHIP which is required by
TI_K3_RINGACC. Could this cause unmet dependency warnings or build failures
during configuration?

> +	select TI_K3_PSIL
> +        help
> +	  Enable support for the TI UDMA (Unified DMA) v2 controller. This
> +	  DMA engine is used in AM62L.
> +
>  config TI_K3_UDMA_COMMON
>  	tristate
> =20
> diff --git a/drivers/dma/ti/k3-udma-v2.c b/drivers/dma/ti/k3-udma-v2.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/dma/ti/k3-udma-v2.c
[ ... ]
> +static int udma_v2_start(struct udma_chan *uc)
> +{
[ ... ]
> +		udma_chanrt_write(uc, UDMA_CHAN_RT_CTL_REG,
> +				  UDMA_CHAN_RT_CTL_EN | UDMA_CHAN_RT_CTL_AUTOPAIR);
> +
> +		/* Poll for autopair completion */
> +		read_poll_timeout_atomic(udma_v2_check_chan_autopair_completion,
> +					 status, status !=3D 0, 100, 500, false, uc);
> +
> +		if (status <=3D 0) {
> +			udma_chanrt_write(uc, UDMA_CHAN_RT_CTL_REG, 0);
> +			return -ETIMEDOUT;
> +		}

[Severity: High]
What happens to the DMA descriptor if udma_v2_start() times out and returns
-ETIMEDOUT here? The caller, udma_issue_pending(), ignores the return value,
leaving the descriptor assigned to uc->desc and pushed to the hardware ring.
Since the channel is disabled, no completion interrupt will fire to free
uc->terminated_desc. It looks like this might lead to a permanent memory
leak.

[ ... ]
> +static int udma_v2_stop(struct udma_chan *uc)
> +{
> +	uc->state =3D UDMA_CHAN_IS_TERMINATING;
> +	reinit_completion(&uc->teardown_completed);
> +
> +	if (uc->config.dir =3D=3D DMA_DEV_TO_MEM) {
> +		if (!uc->cyclic && !uc->desc)
> +			udma_push_to_ring(uc, -1);
> +	}
> +
> +	if (uc->config.dir !=3D DMA_MEM_TO_MEM)
> +		udma_chanrt_write(uc, UDMA_CHAN_RT_PEER_REG(8), UDMA_CHAN_RT_PEER_REG8=
_FLUSH);

[Severity: Medium]
The commit message states there is "no need to write to PEER registers",
but this code explicitly writes a flush command to UDMA_CHAN_RT_PEER_REG(8)
during teardown. Are there certain cases where writing to the PEER register
is still required for this hardware?

> +
> +	udma_chanrt_update_bits(uc, UDMA_CHAN_RT_CTL_REG,
> +				UDMA_CHAN_RT_CTL_EN | UDMA_CHAN_RT_CTL_TDOWN,
> +				UDMA_CHAN_RT_CTL_EN | UDMA_CHAN_RT_CTL_TDOWN);
> +
> +	return 0;
> +}
[ ... ]
> +static irqreturn_t udma_v2_ring_irq_handler(int irq, void *data)
> +{
[ ... ]
> +	if (intr_status & K3_RINGACC_RT_INT_STATUS_TR) {
> +		reg =3D udma_chanrt_read(uc, UDMA_CHAN_RT_CTL_REG);
> +
> +		/* check teardown status */
> +		if ((reg & UDMA_CHAN_RT_CTL_TDOWN) && !(reg & UDMA_CHAN_RT_CTL_EN))
> +			complete_all(&uc->teardown_completed);
> +		udma_v2_udma_irq_handler(irq, data);
> +		tr_handled =3D true;
> +
> +		if (!(intr_status & K3_RINGACC_RT_INT_STATUS_COMPLETE))
> +			return IRQ_HANDLED;
> +	}
> +
> +	if (udma_pop_from_ring(uc, &paddr) || !paddr)
> +		return tr_handled ? IRQ_HANDLED : IRQ_NONE;
> +
> +	spin_lock(&uc->vc.lock);
> +
> +	/* Teardown completion message */
> +	if (cppi5_desc_is_tdcm(paddr)) {
[ ... ]
> +	d =3D udma_udma_desc_from_paddr(uc, paddr);
> +
> +	if (d) {
> +		dma_addr_t desc_paddr =3D udma_curr_cppi5_desc_paddr(d,
> +								   d->desc_idx);
[ ... ]
> +		if (d =3D=3D uc->desc) {
[ ... ]
> +		} else {
> +			/*
> +			 * terminated descriptor, mark the descriptor as
> +			 * completed to update the channel's cookie marker
> +			 */
> +			dma_cookie_complete(&d->vd.tx);
> +		}

[Severity: Critical]
Is it possible for this interrupt handler to complete the same descriptor
twice and cause a kernel panic?

If intr_status has both the K3_RINGACC_RT_INT_STATUS_TR and
K3_RINGACC_RT_INT_STATUS_COMPLETE bits set, the handler processes the TR
event and completes the descriptor via udma_v2_udma_irq_handler(), which
zeroes its cookie.

Because K3_RINGACC_RT_INT_STATUS_COMPLETE is also set, the handler does
not return early. It falls through to the completion handling branch below,
completing the descriptor a second time and potentially triggering a BUG_ON
in dma_cookie_complete() because the cookie is now less than
DMA_MIN_COOKIE.

[ ... ]
> +static struct platform_driver bcdma_v2_driver =3D {
> +	.driver =3D {
> +		.name	=3D "ti-udma-v2",
> +		.of_match_table =3D udma_of_match,
> +		.suppress_bind_attrs =3D true,
> +		.pm =3D &udma_pm_ops,
> +	},
> +	.probe		=3D udma_v2_probe,
> +};

[Severity: High]
This is a pre-existing issue, but this platform driver lacks a .remove
callback. Because dma_async_device_register() is used without being managed
by devres, unloading the module leaves the DMA engine registered while the
underlying devm structures are freed. Might this lead to a use-after-free
if the module is unloaded?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928025749.1055=
383-1-s-adivi@ti.com?part=3D16
