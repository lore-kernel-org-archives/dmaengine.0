Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792755435;
	b=Q7ZTP75w20RU619IYSAmwpd9392enE7o8m+0fVYAgyzOdzgfpPkd0WbFhpgCS22SuNVt
	 hqFI5v3CXUBmsOQgcCMaPaNGEl7Tpir5lbYLxB/V2v0uFalcg1mxSC56BfOG/nqhUE+53
	 dJy2xhPAEhI6l/0yQN9jWkKsnO0+AWd0btfIqpY2gUgWfhMf0nLSpw68i+LW8vsTMRNF6
	 X02XTko2F2ID0NSQQXy+CKGyMG7OKJaJZfcKn5i4plkgEvS5f9DcbM9Izd2m473Td0mkG
	 qYbW4bhbw0AdN85TJjk+vG7319N7usIJaj9QirLZoOyI8yHe1/G8+2qD1okjt+d7VFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792755435;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=C2j7EpYlT05DlZf3X6yfEWFRRdQWDIcwjONX06ha4M0=;
	b=hWkouUFlqAw3K67WICQZc2q2ZvJEAo28t+vWozxUUeJvfhwltnFA1RNkctisT+ikNynI
	 4b+4KZvrBUjTkTtBegs4YsL8WS2/ip1t42Zx5JMfGKwuU2qVPOmOgm6lCPqOkR96PaPKq
	 +uvLDywGpYeh4qRcghNv0feKuDti6WIwL9/HwqDu6woQA4lVLn5HxfniI10VJiKXmnwYY
	 2OYGIHLZpkYyO1aleEZjBQj/RtkUwmbJ1dQADG5WQtKYTXk55ZyUu2JSwlC12zSkt+0S1
	 JZ0RmqLU7BgJ5C/G33nW4PeNOveT8VVwkvG48UrSlvpt5fpbdvj/VvDZm+qoKdCUxRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Ow0s+Fw/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268F6606A31A;
	Fri, 23 Oct 2026 11:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ow0s+Fw/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AA1E1F01825;
	Fri, 23 Oct 2026 11:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792755434;
	bh=C2j7EpYlT05DlZf3X6yfEWFRRdQWDIcwjONX06ha4M0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ow0s+Fw/4TWHAvv5JIRNLW2sgygYaei/5aKno6MD2k4LQMoAvsFlwy0B3nvn6+YDy
	 cxrem3m8h+oIxiAsxB2WBetzr64D55AUSYWiyA3Iq145fsWoXmDj6MtTrBEeaqGx/t
	 1y+0HnMeCyBOQXD2eMjiOhTQc5eXW7Q+1OOuWHRAh6a5NOj3q1QlcpvX/t5uJKYgBA
	 J2iDXqU0rOfZOPMt82/CqbY67axRRrHHpgxQnSms7UZruNAJDjtI5Vvc1F+ea1JHq/
	 DX1CzgqvuaviK6ik8wn2cu6KUC6fXcjqh/JmHv/jsEH74GNX9xuJqUZ+qxSlFrPYGU
	 XcsTWa1Rq8Asw==
Message-ID: <sashiko-outbox-182735@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 4/4] dmaengine: fsl-edma: add runtime suspend/resume
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joy Zou" <joy.zou@oss.nxp.com>
Cc: imx@lists.linux.dev, dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261023-b4-edma-runtime-opt-mo-v7-4-418e53c5f9b7@oss.nxp.com>
References: <20261023-b4-edma-runtime-opt-mo-v7-0-418e53c5f9b7@oss.nxp.com>
 <20261023-b4-edma-runtime-opt-mo-v7-4-418e53c5f9b7@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 11:37:13 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 12 potential issue=
(s) to consider:
- [Critical] dmaengine: fsl-edma: unclocked register read in fsl_edma3_err_=
check()
- [Critical] dmaengine: fsl-edma: NULL dereference on masked channels in IR=
Q handlers
- [High] dmaengine: fsl-edma: missing CR restore in fsl_edma_resume_early()
- [High] dmaengine: fsl-edma: clocks disabled and IRQs broken when CONFIG_P=
M=3Dn
- [High] dmaengine: fsl-edma: UAF on pd_dev_link in fsl_edma3_detach_pd()
- [High] dmaengine: fsl-edma: DMA registration before setup_irq() and chann=
el PM
- [High] dmaengine: fsl-edma: broken channel allocation on mcf-edma with CO=
NFIG_PM=3Dy
- [High] dmaengine: fsl-edma: use-after-free on pd_dev in fsl_edma3_detach_=
pd()
- [Medium] dmaengine: fsl-edma: async runtime PM put in fsl_edma_probe() le=
aks clocks
- [Medium] dmaengine: fsl-edma: missing txirq_16_31 sync in channel runtime=
 suspend
- [Medium] dmaengine: fsl-edma: active channels with srcid 0 skipped in sus=
pend/resume
- [Medium] dmaengine: fsl-edma: storm in tx/err IRQ handlers when channel i=
s suspending
--

commit 9e2928aa0a1257007f05ec7ae65bb12d57332723
Author: Joy Zou <joy.zou@oss.nxp.com>

dmaengine: fsl-edma: add runtime suspend/resume support

This commit adds runtime PM support for the FSL eDMA engine and its
per-channel devices, managing engine and channel clocks as well as
per-channel power domains through runtime suspend and resume callbacks.

> diff --git a/drivers/dma/fsl-edma-common.c b/drivers/dma/fsl-edma-common.c
> index 4f7a942673ebc..4ab56294ac776 100644
> --- a/drivers/dma/fsl-edma-common.c
> +++ b/drivers/dma/fsl-edma-common.c

[ ... ]

> @@ -1087,7 +1084,12 @@ int fsl_edma_alloc_chan_resources(struct dma_chan =
*chan)
>  	struct fsl_edma_chan *fsl_chan =3D to_fsl_edma_chan(chan);
>  	int ret =3D 0;
> =20
> -	clk_prepare_enable(fsl_chan->clk);
> +	ret =3D pm_runtime_resume_and_get(&fsl_chan->vchan.chan.dev->device);
> +	if (ret < 0) {
> +		dev_err(&fsl_chan->vchan.chan.dev->device, "Failed to resume device: %=
d\n", ret);
> +		return ret;
> +	}

[Severity: High]
Does this break channel allocation for the ColdFire mcf-edma driver when
CONFIG_PM is enabled?

drivers/dma/fsl-edma-common.c is shared with drivers/dma/mcf-edma-main.c,
where mcf_edma_probe() wires up fsl_edma_alloc_chan_resources() and
fsl_edma_free_chan_resources():

drivers/dma/mcf-edma-main.c:mcf_edma_probe() {
	...
	mcf_edma->dma_dev.device_alloc_chan_resources =3D
			fsl_edma_alloc_chan_resources;
	mcf_edma->dma_dev.device_free_chan_resources =3D
			fsl_edma_free_chan_resources;
	...
}

Unlike fsl_edma_probe(), mcf_edma_probe() never calls
devm_pm_runtime_enable() on the per-channel devices, so each channel device
remains with disable_depth =3D=3D 1 and runtime_status =3D=3D RPM_SUSPENDED=
. When a
client requests a channel on mcf-edma with CONFIG_PM=3Dy,
pm_runtime_resume_and_get(&fsl_chan->vchan.chan.dev->device) in
fsl_edma_alloc_chan_resources() will fail with -EACCES.

> diff --git a/drivers/dma/fsl-edma-main.c b/drivers/dma/fsl-edma-main.c
> index be9bd9cc66306..c16280b836560 100644
> --- a/drivers/dma/fsl-edma-main.c
> +++ b/drivers/dma/fsl-edma-main.c
> @@ -37,15 +37,32 @@ static irqreturn_t fsl_edma_tx_handler(int irq, void =
*dev_id)
>  	unsigned int intr, ch;
>  	struct edma_regs *regs =3D &fsl_edma->regs;
> =20
> +	/*
> +	 * A racy or spurious interrupt for an already-suspended
> +	 * controller or channel is an extremely rare corner case and
> +	 * highly unlikely in practice.
> +	 */
> +	if (pm_runtime_get_if_active(fsl_edma->dma_dev.dev) <=3D 0)
> +		return IRQ_NONE;

[Severity: High]
What happens here and in fsl_edma_probe() when the kernel is built with
CONFIG_PM=3Dn?

When CONFIG_PM=3Dn, the stub for pm_runtime_get_if_active() in
include/linux/pm_runtime.h unconditionally returns -EINVAL:

static inline int pm_runtime_get_if_active(struct device *dev)
{
	return -EINVAL;
}

That causes fsl_edma_tx_handler(), fsl_edma3_tx_handler(),
fsl_edma3_or_err_handler(), and fsl_edma_err_handler() to always return
IRQ_NONE.

In addition, fsl_edma_probe() replaces devm_clk_get_optional_enabled() and
devm_clk_bulk_get_optional_enable() with devm_clk_get_optional() and
devm_clk_bulk_get_optional(), and fsl_edma_alloc_chan_resources() replaces
clk_prepare_enable(fsl_chan->clk) with pm_runtime_resume_and_get(). Because
PM_RUNTIME_ACQUIRE_IF_ENABLED() and pm_runtime_resume_and_get() are no-ops
when CONFIG_PM=3Dn, fsl_edma_runtime_resume() and
fsl_edma_chan_runtime_resume() never run, leaving dmaclk, muxclk, and
fsl_chan->clk disabled when accessing registers.

> +
>  	intr =3D edma_readl(fsl_edma, regs->intl);
> -	if (!intr)
> +	if (!intr) {
> +		pm_runtime_put(fsl_edma->dma_dev.dev);
>  		return IRQ_NONE;
> +	}
> =20
> +	pm_runtime_put(fsl_edma->dma_dev.dev);
>  	for (ch =3D 0; ch < fsl_edma->n_chans; ch++) {
> +		struct fsl_edma_chan *fsl_chan =3D &fsl_edma->chans[ch];
> +
> +		if (pm_runtime_get_if_active(&fsl_chan->vchan.chan.dev->device) <=3D 0)
> +			continue;

[Severity: Critical]
Can this dereference a NULL pointer when dma-channel-mask is used?

In fsl_edma_probe(), channels with bits set in fsl_edma->chan_masked are
skipped before vchan_init(&fsl_chan->vchan, &fsl_edma->dma_dev):

drivers/dma/fsl-edma-main.c:fsl_edma_probe() {
	...
	for (i =3D 0; i < fsl_edma->n_chans; i++) {
		struct fsl_edma_chan *fsl_chan =3D &fsl_edma->chans[i];
		int len;

		if (fsl_edma->chan_masked & BIT(i))
			continue;
		...
		vchan_init(&fsl_chan->vchan, &fsl_edma->dma_dev);
	}
}

Because masked channels are not added to fsl_edma->dma_dev.channels,
dmaenginem_async_device_register() never allocates fsl_chan->vchan.chan.dev,
leaving it NULL.

Here in fsl_edma_tx_handler(), as well as in fsl_edma3_or_err_handler(),
fsl_edma_err_handler(), and fsl_edma3_or_tx_handler() ->
fsl_edma3_tx_handler(), the loop does not check fsl_edma->chan_masked &
BIT(ch) (or check intr & (0x1 << ch) / err & (0x1 << ch) first) before
passing &fsl_chan->vchan.chan.dev->device to pm_runtime_get_if_active().

> +
>  		if (intr & (0x1 << ch)) {
>  			edma_writeb(fsl_edma, EDMA_CINT_CINT(ch), regs->cint);
>  			fsl_edma_tx_chan_handler(&fsl_edma->chans[ch]);
>  		}
> +		pm_runtime_put(&fsl_chan->vchan.chan.dev->device);
>  	}
>  	return IRQ_HANDLED;
>  }

[Severity: Medium]
What happens in fsl_edma_tx_handler() and fsl_edma_err_handler() if an
interrupt is pending when a channel is being runtime-suspended?

When fsl_edma_free_chan_resources() calls fsl_edma_disable_request() and
then pm_runtime_put_sync_suspend(&fsl_chan->vchan.chan.dev->device),
fsl_edma_disable_request() disables future hardware requests in regs->cerq
and regs->ceei, but does not clear any pending interrupt bit in regs->intl
or regs->errl.

Inside rpm_suspend(), the runtime PM core sets
chan_dev->power.runtime_status =3D RPM_SUSPENDING before invoking
fsl_edma_chan_runtime_suspend(), which calls synchronize_irq(fsl_edma->txir=
q)
and synchronize_irq(fsl_edma->errirq). When fsl_edma_tx_handler() or
fsl_edma_err_handler() runs for that pending interrupt,
pm_runtime_get_if_active(&fsl_chan->vchan.chan.dev->device) returns 0
because the status is already RPM_SUSPENDING. The loop then skips writing
EDMA_CINT_CINT(ch) to regs->cint (or EDMA_CERR_CERR(ch) to regs->cerr) while
the handler still returns IRQ_HANDLED, leaving the level-triggered interrupt
asserted in an infinite storm.

Also, both handlers call pm_runtime_put(fsl_edma->dma_dev.dev) before the
loop even though regs->cint, regs->cerr, regs->cerq, and regs->ceei accessed
inside the loop are global controller registers clocked by dmaclk.

> @@ -132,13 +149,23 @@ static irqreturn_t fsl_edma3_tx_handler(int irq, vo=
id *dev_id)
>  	struct fsl_edma_chan *fsl_chan =3D dev_id;
>  	unsigned int intr;
> =20
> -	intr =3D edma_readl_chreg(fsl_chan, ch_int);
> -	if (!intr)
> +	/*
> +	 * A racy or spurious interrupt for an already-suspended
> +	 * channel is an extremely rare corner case and highly unlikely in
> +	 * practice.
> +	 */
> +	if (pm_runtime_get_if_active(&fsl_chan->vchan.chan.dev->device) <=3D 0)
>  		return IRQ_NONE;

[Severity: Critical]
Were fsl_edma3_err_check(), fsl_edma3_err_handler_per_chan(), and
fsl_edma3_err_handler_shared() missed when adding runtime PM checks to the
interrupt handlers?

Just above fsl_edma3_tx_handler(), fsl_edma3_err_handler_shared() loops over
all unmasked channels and calls fsl_edma3_err_check(), and
fsl_edma3_err_handler_per_chan() (registered with IRQF_SHARED) also calls
fsl_edma3_err_check():

drivers/dma/fsl-edma-main.c:fsl_edma3_err_check() {
	...
	scoped_guard(spinlock, &fsl_chan->vchan.lock) {
		ch_err =3D edma_readl_chreg(fsl_chan, ch_es);
		if (!(ch_err & EDMA_V3_CH_ERR))
			return;
	...
}

drivers/dma/fsl-edma-main.c:fsl_edma3_err_handler_shared() {
	...
	for (ch =3D 0; ch < fsl_edma->n_chans; ch++) {
		if (fsl_edma->chan_masked & BIT(ch))
			continue;

		fsl_edma3_err_check(&fsl_edma->chans[ch]);
	}
	...
}

When idle channels are runtime-suspended with their channel clocks disabled
(or their per-channel power domains powered off on platforms with
FSL_EDMA_DRV_HAS_PD), an error interrupt on any active channel causes
fsl_edma3_err_handler_shared() -> fsl_edma3_err_check() to read ch_es on the
suspended channels without calling pm_runtime_get_if_active(), triggering a
bus hang or synchronous external abort.

[ ... ]

> @@ -630,11 +691,12 @@ static void fsl_edma3_detach_pd(struct fsl_edma_eng=
ine *fsl_edma)
>  		if (fsl_edma->chan_masked & BIT(i))
>  			continue;
>  		fsl_chan =3D &fsl_edma->chans[i];
> -		if (fsl_chan->pd_dev_link)
> +		if (fsl_chan->pd_dev_link) {
>  			device_link_del(fsl_chan->pd_dev_link);
> +			fsl_chan->pd_dev_link =3D NULL;
> +		}

[Severity: High]
Can device_link_del(fsl_chan->pd_dev_link) cause a use-after-free during
devres teardown?

In fsl_edma_probe(), devm_add_action_or_reset(&pdev->dev,
devm_fsl_edma3_detach_pd, fsl_edma) is registered before
dmaenginem_async_device_register(&fsl_edma->dma_dev), and
fsl_chan->pd_dev_link is now created with chan_dev
(&fsl_chan->vchan.chan.dev->device) as the consumer.

When probe fails after creating pd_dev_link or when the driver is unbound,
devres unwinds in reverse order:
1. dmaenginem_async_device_unregister() runs first and calls
   device_unregister(chan_dev) -> device_del(chan_dev) ->
   device_links_purge(chan_dev), which deletes and frees
   fsl_chan->pd_dev_link.
2. devm_fsl_edma3_detach_pd() -> fsl_edma3_detach_pd() runs next and calls
   device_link_del(fsl_chan->pd_dev_link) on the already-freed device_link.

>  		if (fsl_chan->pd_dev) {
>  			dev_pm_domain_detach(fsl_chan->pd_dev, false);
> -			pm_runtime_dont_use_autosuspend(fsl_chan->pd_dev);
>  			pm_runtime_set_suspended(fsl_chan->pd_dev);
>  		}
>  	}

[Severity: High]
Does pm_runtime_set_suspended(fsl_chan->pd_dev) dereference fsl_chan->pd_dev
after it has already been freed by dev_pm_domain_detach()?

Because device_link_add() was moved out of fsl_edma3_attach_pd() into a
later loop in fsl_edma_probe(), if fsl_edma3_attach_pd() fails midway or if
fsl_edma_probe() fails before device_link_add() runs for a channel,
fsl_chan->pd_dev holds only the single initial reference from
dev_pm_domain_attach_by_id(). Calling dev_pm_domain_detach(fsl_chan->pd_dev,
false) invokes genpd_dev_pm_detach() -> device_unregister(fsl_chan->pd_dev),
which drops the last reference and frees fsl_chan->pd_dev before
pm_runtime_set_suspended(fsl_chan->pd_dev) accesses it.

[ ... ]

> @@ -689,6 +736,42 @@ static int fsl_edma3_attach_pd(struct platform_devic=
e *pdev, struct fsl_edma_eng
>  	return -EINVAL;
>  }
> =20
> +/* Per channel dma power domain */
> +static int fsl_edma_chan_runtime_suspend(struct device *dev)
> +{
> +	struct fsl_edma_chan *fsl_chan =3D dev_get_drvdata(dev);
> +	struct fsl_edma_engine *fsl_edma =3D fsl_chan->edma;
> +
> +	if (fsl_edma->txirq > 0)
> +		synchronize_irq(fsl_edma->txirq);
> +
> +	if (fsl_edma->errirq > 0)
> +		synchronize_irq(fsl_edma->errirq);
> +
> +	if (fsl_chan->txirq > 0)
> +		synchronize_irq(fsl_chan->txirq);
> +
> +	if (fsl_chan->errirq > 0)
> +		synchronize_irq(fsl_chan->errirq);
> +
> +	clk_disable_unprepare(fsl_chan->clk);
> +
> +	return 0;
> +}

[Severity: Medium]
Should fsl_edma_chan_runtime_suspend() also synchronize
fsl_edma->txirq_16_31 (and should fsl_edma_probe() initialize
fsl_edma->txirq_16_31 =3D -EINVAL)?

On platforms using fsl_edma3_or_irq_init() (such as nxp,s32g2-edma),
channels 16..31 are serviced by fsl_edma->txirq_16_31 via
fsl_edma3_tx_16_31_handler(), which is not synchronized here before
disabling fsl_chan->clk.

[ ... ]

> @@ -870,11 +945,69 @@ static int fsl_edma_probe(struct platform_device *p=
dev)
> =20
>  	platform_set_drvdata(pdev, fsl_edma);
> =20
> +	ret =3D devm_pm_runtime_enable(&pdev->dev);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Can't enable eDMA engine PM run=
time!\n");
> +
> +	PM_RUNTIME_ACQUIRE_IF_ENABLED(&pdev->dev, pm);
> +	ret =3D PM_RUNTIME_ACQUIRE_ERR(&pm);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Failed to resume eDMA engine!\n=
");
> +
>  	ret =3D dmaenginem_async_device_register(&fsl_edma->dma_dev);
>  	if (ret)
>  		return dev_err_probe(&pdev->dev, ret,
>  				     "Can't register Freescale eDMA engine.\n");
> =20
> +	for (i =3D 0; i < fsl_edma->n_chans; i++) {
> +		struct fsl_edma_chan *fsl_chan =3D &fsl_edma->chans[i];
> +		struct device *chan_dev;
> +
> +		if (fsl_edma->chan_masked & BIT(i))
> +			continue;
> +
> +		chan_dev =3D &fsl_chan->vchan.chan.dev->device;
> +		dev_set_drvdata(chan_dev, fsl_chan);
> +		dev_pm_domain_set(chan_dev, &fsl_edma_chan_pm_domain);
> +
> +		if (fsl_chan->pd_dev) {
> +			fsl_chan->pd_dev_link =3D device_link_add(chan_dev, fsl_chan->pd_dev,
> +								DL_FLAG_STATELESS |
> +								DL_FLAG_PM_RUNTIME);
> +			if (!fsl_chan->pd_dev_link) {
> +				return dev_err_probe(&pdev->dev, -EINVAL,
> +						     "Failed to add device_link to %d!\n", i);
> +			}
> +		}
> +		ret =3D devm_pm_runtime_enable(chan_dev);
> +		if (ret)
> +			return dev_err_probe(&pdev->dev, ret,
> +					     "Can't enable eDMA channel PM runtime!\n");
> +
> +		if (fsl_chan->pd_dev) {
> +			ret =3D pm_runtime_resume_and_get(fsl_chan->pd_dev);
> +			if (ret)
> +				return dev_err_probe(&pdev->dev, ret,
> +						     "Failed to power on eDMA channel %d!\n",
> +						     fsl_chan->vchan.chan.chan_id);
> +		}
> +
> +		PM_RUNTIME_ACQUIRE_IF_ENABLED(chan_dev, pm);
> +		ret =3D PM_RUNTIME_ACQUIRE_ERR(&pm);
> +		if (ret) {
> +			if (fsl_chan->pd_dev)
> +				pm_runtime_put_sync_suspend(fsl_chan->pd_dev);
> +
> +			return dev_err_probe(&pdev->dev, ret,
> +					     "Failed to resume eDMA channel %d!\n",
> +					     fsl_chan->vchan.chan.chan_id);
> +		}
> +		edma_write_tcdreg(fsl_chan, cpu_to_le32(0), csr);
> +		fsl_edma_chan_mux(fsl_chan, 0, false);
> +		if (fsl_chan->pd_dev)
> +			pm_runtime_put_sync_suspend(fsl_chan->pd_dev);
> +	}

[Severity: Medium]
Does using PM_RUNTIME_ACQUIRE_IF_ENABLED() here leak prepared/enabled clocks
when probe fails, and prevent fsl_chan->pd_dev from suspending?

PM_RUNTIME_ACQUIRE_IF_ENABLED() releases its reference via asynchronous
pm_runtime_put() when exiting the scope. If fsl_edma_probe() returns an
error after resuming &pdev->dev or chan_dev, the guard queues an async idle
request on pm_wq, and devres teardown immediately runs pm_runtime_disable()
(from devm_pm_runtime_enable()), which calls __pm_runtime_barrier() and
cancels the pending work before fsl_edma_chan_runtime_suspend() or
fsl_edma_runtime_suspend() can disable fsl_chan->clk, fsl_edma->dmaclk, and
fsl_edma->muxclk.

In addition, inside the channel loop, PM_RUNTIME_ACQUIRE_IF_ENABLED(chan_de=
v,
pm) (which also shadows the outer pm variable) is still in scope and holds a
runtime PM reference on the supplier fsl_chan->pd_dev via
fsl_chan->pd_dev_link when pm_runtime_put_sync_suspend(fsl_chan->pd_dev) is
called at the end of the loop body, so pm_runtime_put_sync_suspend() on
pd_dev will fail with -EAGAIN.

> +
>  	ret =3D devm_of_dma_controller_register(&pdev->dev, np,
>  			drvdata->dmamuxs ? fsl_edma_xlate : fsl_edma3_xlate,
>  			fsl_edma);
> @@ -886,6 +1019,10 @@ static int fsl_edma_probe(struct platform_device *p=
dev)
>  	if (!(drvdata->flags & FSL_EDMA_DRV_SPLIT_REG))
>  		edma_writel(fsl_edma, EDMA_CR_ERGA | EDMA_CR_ERCA, regs->cr);
> =20
> +	ret =3D fsl_edma->drvdata->setup_irq(pdev, fsl_edma);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Failed to setup IRQ!\n");
> +
>  	return 0;
>  }

[Severity: High]
Is it safe to call dmaenginem_async_device_register() before enabling
per-channel runtime PM, and to call setup_irq() after both
dmaenginem_async_device_register() and devm_of_dma_controller_register()?

Once dmaenginem_async_device_register() and
devm_of_dma_controller_register() return, the DMA channels are published and
can be requested by consumers on another CPU before the channel loop has
configured chan_dev runtime PM (causing pm_runtime_resume_and_get() in
fsl_edma_alloc_chan_resources() to fail with -EACCES) or before setup_irq()
has populated fsl_chan->txirq, fsl_chan->errirq, fsl_chan->irq_handler, and
fsl_chan->errirq_handler (causing fsl_edma_alloc_chan_resources() to skip
request_irq() while fsl_edma_free_chan_resources() later calls free_irq()).

> @@ -908,6 +1045,19 @@ static int fsl_edma_suspend_late(struct device *dev)
>  		fsl_chan =3D &fsl_edma->chans[i];
>  		if (fsl_edma->chan_masked & BIT(i))
>  			continue;
> +
> +		/*
> +		 * Skip channel if:
> +		 * 1. Runtime PM already suspended.
> +		 * 2. Channel without power domain, and the channel source ID is zero,
> +		 * so the channel isn't assigned.
> +		 */
> +		if (pm_runtime_status_suspended(&fsl_chan->vchan.chan.dev->device) ||
> +		    (!(fsl_edma->drvdata->flags & FSL_EDMA_DRV_HAS_PD) &&
> +		     (fsl_edma->drvdata->flags & FSL_EDMA_DRV_SPLIT_REG) &&
> +		     !fsl_chan->srcid))
> +			continue;

[Severity: Medium]
Can checking !fsl_chan->srcid here and in fsl_edma_resume_early() skip
active, allocated channels?

There are two cases where an allocated, runtime-active channel on a
FSL_EDMA_DRV_SPLIT_REG controller without FSL_EDMA_DRV_HAS_PD has
fsl_chan->srcid =3D=3D 0:
1. A channel used for DMA_MEMCPY via fsl_edma_prep_memcpy(), which sets
   fsl_chan->is_sw =3D true and leaves fsl_chan->srcid as 0.
2. Channel 0 on a controller without FSL_EDMA_DRV_HAS_CHMUX (such as
   imx93_data3), where fsl_edma3_xlate() sets
   fsl_chan->srcid =3D dma_spec->args[0] (the channel index 0).

Since unassigned channels are already runtime-suspended and filtered out by
pm_runtime_status_suspended(&fsl_chan->vchan.chan.dev->device), is the
extra !fsl_chan->srcid check needed?

> @@ -927,19 +1077,56 @@ static int fsl_edma_resume_early(struct device *de=
v)
>  {
>  	struct fsl_edma_engine *fsl_edma =3D dev_get_drvdata(dev);
>  	struct fsl_edma_chan *fsl_chan;
> -	struct edma_regs *regs =3D &fsl_edma->regs;
>  	int i;
> =20
>  	for (i =3D 0; i < fsl_edma->n_chans; i++) {
>  		fsl_chan =3D &fsl_edma->chans[i];
>  		if (fsl_edma->chan_masked & BIT(i))
>  			continue;
> +
> +		if (pm_runtime_status_suspended(&fsl_chan->vchan.chan.dev->device) ||
> +		    (!(fsl_edma->drvdata->flags & FSL_EDMA_DRV_HAS_PD) &&
> +		     (fsl_edma->drvdata->flags & FSL_EDMA_DRV_SPLIT_REG) &&
> +		     !fsl_chan->srcid))
> +			continue;
> +
>  		fsl_chan->pm_state =3D RUNNING;
>  		edma_write_tcdreg(fsl_chan, 0, csr);
>  		if (fsl_chan->srcid !=3D 0)
>  			fsl_edma_chan_mux(fsl_chan, fsl_chan->srcid, true);
>  	}
> =20
> +	return 0;
> +}
> +
> +/* edma engine runtime system/resume */
> +static int fsl_edma_runtime_suspend(struct device *dev)
> +{
> +	struct fsl_edma_engine *fsl_edma =3D dev_get_drvdata(dev);
> +
> +	clk_bulk_disable_unprepare(fsl_edma->drvdata->dmamuxs, fsl_edma->muxclk=
);
> +
> +	clk_disable_unprepare(fsl_edma->dmaclk);
> +
> +	return 0;
> +}
> +
> +static int fsl_edma_runtime_resume(struct device *dev)
> +{
> +	struct fsl_edma_engine *fsl_edma =3D dev_get_drvdata(dev);
> +	struct edma_regs *regs =3D &fsl_edma->regs;
> +	int ret;
> +
> +	ret =3D clk_bulk_prepare_enable(fsl_edma->drvdata->dmamuxs, fsl_edma->m=
uxclk);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D clk_prepare_enable(fsl_edma->dmaclk);
> +	if (ret) {
> +		clk_bulk_disable_unprepare(fsl_edma->drvdata->dmamuxs, fsl_edma->muxcl=
k);
> +		return ret;
> +	}
> +
>  	if (!(fsl_edma->drvdata->flags & FSL_EDMA_DRV_SPLIT_REG))
>  		edma_writel(fsl_edma, EDMA_CR_ERGA | EDMA_CR_ERCA, regs->cr);
> =20

[Severity: High]
If a DMA channel is allocated across system suspend and resume on a
non-FSL_EDMA_DRV_SPLIT_REG platform (such as vf610, ls1028a, or imx7ulp),
will regs->cr still be restored on resume?

Moving the EDMA_CR_ERGA | EDMA_CR_ERCA write out of fsl_edma_resume_early()
into fsl_edma_runtime_resume() means it only runs on a runtime PM resume
transition. When any channel is allocated during system suspend, the
channel holds a runtime PM reference that keeps the parent controller
RPM_ACTIVE across suspend/resume, so fsl_edma_resume_early() runs on system
resume while fsl_edma_runtime_resume() does not.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023-b4-edma-ru=
ntime-opt-mo-v7-0-418e53c5f9b7@oss.nxp.com?part=3D4
