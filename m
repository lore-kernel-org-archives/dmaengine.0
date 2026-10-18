Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A501BD9D0
	for <dmaengine@vger.kernel.org>; Sun, 18 Oct 2026 04:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792297521; cv=none; b=RCxfl+7zTIiEM2SGUo4c5yobJGTGtspspGYyZYrJujpynSEZJxqE78ht1trNytXw00wa37Nwu8HyNXXyY5WK2ij9ZV+hLmTJkeKPflYWWZS4TN6pyYOCe0gVI6qwuBYRIrGOJ0p2R1b6ipBbb0a36qj+m0aQr9gCnxBIn52lOxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792297521; c=relaxed/simple;
	bh=o2Ug1uTY4vX7vP1h3VD8HIOF9k+lx+cRfINltUx5fYY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=hSb9/tYukdjNgwFztoqzu3GFcOVgfbBJeOCYVg1a5f5oAQk51w8U/XnqzA5lea7tWoRni4vFqTTgwGj8hL2lDh0NcW6A3E29sxJmtD5oj5sgTEYdqFTV6dcxACfLqzWNrwwP1UbZw9XO0Rw3IaHVjMzM/b0AtnoDshsf+A2+rww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GcP2QTHR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GcP2QTHR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 867BD1F000C6;
	Sun, 18 Oct 2026 04:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792297519;
	bh=JD/QIB+9nR6Tu6BYw4G5J4oVSK+l/akl4kCB4+tjpWY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GcP2QTHRD2WF5f/so7ifSAQWPiRSm0ST9f+Yoyluss8Xh07D8EKM5fGYoeg5gHrPU
	 wy4lOUghUrStnn05V5XBNT8212S9FOQMPkKaz78NO/sHvZy2VQZHyNbJ/SBPrn9pPm
	 NgejrWAXtZ53dc3mCGk+8EFaVStqywypx25oxcjh9bMIce9x4vhmSYNcVKuZa+U1G9
	 +DPnYnB2do5556YY9xu/7RS/eHU6DXXcaxWieo53E5NTMy65A478p17n4aIqzZzO8O
	 rWsFVDNn0VIiCSENo7/IPEEJw7kPJU5yKen60C9dEC7tUQicLTfQJXmStHpGRjSN75
	 H5rxInG8QoTDg==
Message-ID: <sashiko-outbox-175930@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/7] dmaengine: mmp_tdma: synchronize tasklet when
 freeing a channel
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiale Yao" <yaojiale02@163.com>, dmaengine@vger.kernel.org
Cc: vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261018040724.534641-5-yaojiale02@163.com>
References: <20261018040724.534641-1-yaojiale02@163.com>
 <20261018040724.534641-5-yaojiale02@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2026 04:25:19 +0000
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] dmaengine: mmp_tdma: shared IRQ race in mmp_tdma_free_chan_resourc=
es()
- [High] dmaengine: mmp_tdma: unclocked MMIO access in mmp_tdma_free_chan_r=
esources()
--

commit 6a728febb9516f46ef428e03caafe8fc8e1dbec8
Author: Jiale Yao <yaojiale02@163.com>

dmaengine: mmp_tdma: synchronize tasklet when freeing a channel

This commit disables the DMA channel and kills the completion tasklet in
mmp_tdma_free_chan_resources() before freeing the descriptor storage.

> diff --git a/drivers/dma/mmp_tdma.c b/drivers/dma/mmp_tdma.c
> index ba03321eeff79..e0de0967d7e70 100644
> --- a/drivers/dma/mmp_tdma.c
> +++ b/drivers/dma/mmp_tdma.c
> @@ -399,8 +399,10 @@ static void mmp_tdma_free_chan_resources(struct dma_=
chan *chan)
>  {
>  	struct mmp_tdma_chan *tdmac =3D to_mmp_tdma_chan(chan);
> =20
> +	mmp_tdma_disable_chan(chan);

[Severity: High]
Can calling mmp_tdma_disable_chan() unconditionally here access TDCR while
the MMP2 Audio island clock and power domain are disabled?

In drivers/dma/mmp_tdma.c, mmp_tdma_disable_chan() performs MMIO accesses on
TDCR:

drivers/dma/mmp_tdma.c:mmp_tdma_disable_chan() {
	tdcr =3D readl(tdmac->reg_base + TDCR);
	tdcr |=3D TDCR_ABR;
	tdcr &=3D ~TDCR_CHANEN;
	writel(tdcr, tdmac->reg_base + TDCR);
}

On MMP2 (arch/arm/boot/dts/marvell/mmp2.dtsi), the adma0 and adma1
controllers reside in the Audio subsystem power island alongside sspa0/sspa=
1.
The mmp_tdma driver does not manage clocks or power domains itself; its
consumer driver in sound/soc/pxa/mmp-sspa.c controls sspa->audio_clk and the
runtime PM domain.

In sound/soc/pxa/mmp-sspa.c, asoc_mmp_sspa_probe() registers dmaengine PCM
(which requests the DMA channels) before enabling runtime PM and
sspa->audio_clk:

sound/soc/pxa/mmp-sspa.c:asoc_mmp_sspa_probe() {
	if (pdev->dev.of_node) {
		ret =3D devm_snd_dmaengine_pcm_register(&pdev->dev,
						      &mmp_pcm_config, 0);
		if (ret)
			return ret;
	}

	ret =3D devm_snd_soc_register_component(&pdev->dev, &mmp_sspa_component,
					      &mmp_sspa_dai, 1);
	if (ret)
		return ret;

	pm_runtime_enable(&pdev->dev);
	clk_prepare_enable(sspa->audio_clk);
}

And on driver unbind, asoc_mmp_sspa_remove() disables sspa->audio_clk and
runtime PM before devres releases the DMA channels:

sound/soc/pxa/mmp-sspa.c:asoc_mmp_sspa_remove() {
	clk_disable_unprepare(sspa->audio_clk);
	pm_runtime_disable(&pdev->dev);
}

When devres subsequently runs snd_dmaengine_pcm_unregister() ->
dmaengine_pcm_release_chan() -> dma_release_channel() ->
mmp_tdma_free_chan_resources() (either after asoc_mmp_sspa_remove() or if
devm_snd_soc_register_component() fails during probe), won't
mmp_tdma_disable_chan() read and write TDCR while the Audio island is power=
ed
off and unclocked, causing an external abort or hang?

>  	if (tdmac->irq)
>  		devm_free_irq(tdmac->dev, tdmac->irq, tdmac);
> +	tasklet_kill(&tdmac->tasklet);

[Severity: High]
Does this prevent tdmac->tasklet from being scheduled again when the
controller uses a shared interrupt (tdmac->irq =3D=3D 0)?

In mmp_tdma_probe(), when irq_num !=3D chan_num, a single shared handler
mmp_tdma_int_handler() is registered on tdev and each channel has
tdmac->irq =3D 0:

drivers/dma/mmp_tdma.c:mmp_tdma_probe() {
	if (irq_num !=3D chan_num) {
		irq =3D platform_get_irq(pdev, 0);
		ret =3D devm_request_irq(&pdev->dev, irq,
			mmp_tdma_int_handler, IRQF_SHARED, "tdma", tdev);
		if (ret)
			return ret;
	}

	/* initialize channel parameters */
	for (i =3D 0; i < chan_num; i++) {
		irq =3D (irq_num !=3D chan_num) ? 0 : platform_get_irq(pdev, i);
		ret =3D mmp_tdma_chan_init(tdev, i, irq, type, pool);
}

When mmp_tdma_free_chan_resources() runs on such a controller:

1. Unlike mmp_tdma_terminate_all(), which calls both mmp_tdma_disable_chan()
   and mmp_tdma_enable_irq(tdmac, false), mmp_tdma_free_chan_resources() on=
ly
   calls mmp_tdma_disable_chan(), which updates TDCR without masking TDIMR =
or
   clearing a latched TDISR_COMP bit in TDISR.

2. Because tdmac->irq is 0, devm_free_irq() is skipped and nothing
   synchronizes with a concurrently running mmp_tdma_int_handler() ->
   mmp_tdma_chan_handler() before tasklet_kill(&tdmac->tasklet) is called.

If mmp_tdma_int_handler() -> mmp_tdma_chan_handler() is already executing on
another CPU, or if TDISR_COMP was latched before TDCR_CHANEN was cleared and
the shared interrupt fires (for instance from the sibling channel in
tdev->tdmac[]), mmp_tdma_chan_handler() will still schedule tdmac->tasklet
after tasklet_kill() and mmp_tdma_free_descriptor() have completed:

drivers/dma/mmp_tdma.c:mmp_tdma_chan_handler() {
	if (mmp_tdma_clear_chan_irq(tdmac) =3D=3D 0) {
		tasklet_schedule(&tdmac->tasklet);
		return IRQ_HANDLED;
	} else
		return IRQ_NONE;
}

Wouldn't that allow dma_do_tasklet() to invoke the client callback after
mmp_tdma_free_chan_resources() returns and dereference a NULL tdmac->desc_a=
rr
if the callback queries mmp_tdma_tx_status() -> mmp_tdma_get_pos()?

>  	mmp_tdma_free_descriptor(tdmac);
>  	return;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261018040724.5346=
41-1-yaojiale02@163.com?part=3D4
