Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605798;
	b=Q8Lk0fZwHCxW4HRkJlRtUhJDWMIyZtH1PrlkS97I13lVVJ8saAIKoWRbtgLpMkU3ivi/
	 nF0o1M2Wqjw54eHqNHFYCbZb2GrhTDtXf4OLJ0bMR08RPpefloKOy3P/G+ZHEb0TvAhvS
	 PSmNfZcukscviy+FP3uplzLDzEehyrqGtG3Ce10W1416+JKUTHbD1CT6DZWkdrkPuAe9k
	 CoE/q4A29XG13h2TgCe8ybt/79sHAFoXL/d5dB0EL8YCckmOgraGaN3kFHSPJ+zWE3+H0
	 hnyVp0nYq1aWpRuKMAXuCJp8DDI+fq9lYr5q6m1b6FKSg5qy5cDn55yY+9anQrupQMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605798;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=LCk8/cYQY1QfYSG+3Fo/M/s86rrQAaJzHmX/7uPSwvw=;
	b=ClevHKFSStf+ts9c5Yt/XjKyyZZmUCuxuMY2iBmNCC90vguhW/OwYzSPBfUqn/bdNHdJ
	 6B6JRJvMnW3GigaXOpAS30Z3aB+ytlYW6ljXU5j+5XXjiz+e7NhdWwsmquEOcirnYCwrD
	 s3hzooKOKWwnXwOCzWhfW7eLMil8l1jTAQJ6HqRSzls3zbVsRd6CtxNYKambX26Sg3w6d
	 ZsDos8aTtRV+qIo0+cKDUk80YjBNgkGzYL4yPYJ+zfKnR/vELYAanMxRS0fMaqyIxRZBE
	 BFEL6OtbJcB146ZfqVT4dett9xwiyDta0wUk5g0MruwyavqBzNxgzQ46qt7pN/1kxHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oNLvXhng;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CB0606A321;
	Wed, 25 Nov 2026 11:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oNLvXhng
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B238C1F01563;
	Wed, 25 Nov 2026 11:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795605798;
	bh=LCk8/cYQY1QfYSG+3Fo/M/s86rrQAaJzHmX/7uPSwvw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oNLvXhngZcUstPYrA9s174Jr9m+CNDrQMdRoaq07BLhaYz7XAPj0Td/dpy6/nYnnD
	 yuU6I+HMPm1miNA4KJ3nh5HMiDzmRKJ3lqwz49Hx4QhnOxGGDi22/Cpg1XjY9T1p6h
	 +FJ4wZI9a3GfBrOR6Uc0BXvhzWshBpmnVs/jiey9OdSPBMwzjSmpatdQOSXcAhbSWn
	 n/tfzixpQq8gecyCNETKjG0dPq2mGZcCSimAJfP+1NnxuRSYhWVq42ckNZs6O5WeIo
	 miZRE7FKUXy/1WXaRdRico6+0V/JmX2ubq/IuaEC5Fb1uc7NMtDfmRbVN4bVYrGFwy
	 UlbLrbIoJyYMQ==
Message-ID: <sashiko-outbox-233227@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 5/5] dmaengine: fsl-edma: add runtime suspend/resume
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joy Zou" <joy.zou@oss.nxp.com>
Cc: imx@lists.linux.dev, dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261125-b4-edma-runtime-opt-mo-v8-5-81345a3bfb52@oss.nxp.com>
References: <20261125-b4-edma-runtime-opt-mo-v8-0-81345a3bfb52@oss.nxp.com>
 <20261125-b4-edma-runtime-opt-mo-v8-5-81345a3bfb52@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 11:23:17 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 11 potential
issues to consider:
- [High] dmaengine: fsl-edma: NULL dereference on masked channels in
  fsl_edma3_or_tx_handler()
- [High] dmaengine: fsl-edma: refcount underflow and unclocked MMIO on
  pm_runtime_get_if_active() < 0
- [High] dmaengine: fsl-edma: unclocked MMIO access in fsl_edma_probe()
  when CONFIG_PM is disabled
- [High] dmaengine: fsl-edma: missing CR restore in
  fsl_edma_resume_early()
- [High] dmaengine: fsl-edma: DMA registration before setup_irq() and
  channel PM
- [High] dmaengine: fsl-edma: NULL deref on masked channel in
  fsl_edma3_or_tx_handler()
- [High] dmaengine: fsl-edma: fsl_edma_cleanup_vchan() leaks chan_dev
  and causes UAF
- [High] dmaengine: fsl-edma: IRQ storm and bad RPM ordering in
  fsl_edma_tx_handler()
- [High] dmaengine: fsl-edma: broken channel runtime PM on mcf-edma in
  mcf_edma_probe()
- [Medium] dmaengine: fsl-edma: async runtime PM put in fsl_edma_probe()
  leaks clocks
- [Medium] dmaengine: fsl-edma: active channels with srcid 0 skipped in
  suspend/resume
--

commit 904c5737dc3c2174c965ff0d6fb29328fd87a5f5
Author: Joy Zou <joy.zou@oss.nxp.com>

dmaengine: fsl-edma: add runtime suspend/resume support

This commit adds runtime PM support for the FSL eDMA controller and its
per-channel devices, managing controller and channel clocks as well as
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
Does this break mcf-edma when CONFIG_PM is enabled?

fsl_edma_alloc_chan_resources() is shared with mcf-edma, so
pm_runtime_resume_and_get() requires runtime PM to be enabled on the
registered channel device.  In commit "dmaengine: mcf-edma: enable runtime
PM for eDMA engine and channel" earlier in this series, mcf_edma_probe()
calls devm_pm_runtime_enable(chan_dev) before dma_async_device_register()
allocates mcf_chan->vchan.chan.dev:

drivers/dma/mcf-edma-main.c:mcf_edma_probe() {
    ...
	for (i =3D 0; i < mcf_edma->n_chans; i++) {
		struct fsl_edma_chan *mcf_chan =3D &mcf_edma->chans[i];
		struct device *chan_dev;

		chan_dev =3D &mcf_chan->vchan.chan.dev->device;
    ...
		ret =3D devm_pm_runtime_enable(chan_dev);
    ...
	ret =3D dma_async_device_register(&mcf_edma->dma_dev);
    ...
}

Because mcf_chan->vchan.chan.dev is still NULL in that loop,
devm_pm_runtime_enable(chan_dev) dereferences a near-NULL pointer during
probe when CONFIG_PM=3Dy, and the channel devices allocated later by
dma_async_device_register() never have runtime PM enabled.

> diff --git a/drivers/dma/fsl-edma-main.c b/drivers/dma/fsl-edma-main.c
> index fdb2577d1ccb5..5500eb17f579e 100644
> --- a/drivers/dma/fsl-edma-main.c
> +++ b/drivers/dma/fsl-edma-main.c
> @@ -37,15 +37,35 @@ static irqreturn_t fsl_edma_tx_handler(int irq, void =
*dev_id)
>  	unsigned int intr, ch;
>  	struct edma_regs *regs =3D &fsl_edma->regs;
> =20
> +	/*
> +	 * A racy or spurious interrupt for an already-suspended
> +	 * controller or channel is an extremely rare corner case and
> +	 * highly unlikely in practice.
> +	 */
> +	if (pm_runtime_get_if_active(fsl_edma->dma_dev.dev) =3D=3D 0)
> +		return IRQ_NONE;
> =20
>  	intr =3D edma_readl(fsl_edma, regs->intl);
> -	if (!intr)
> +	if (!intr) {
> +		pm_runtime_put(fsl_edma->dma_dev.dev);
>  		return IRQ_NONE;
> +	}

[Severity: High]
Can checking pm_runtime_get_if_active() =3D=3D 0 underflow power.usage_count
and access unclocked registers when runtime PM is disabled?

pm_runtime_get_if_active() returns -EINVAL without incrementing
power.usage_count when runtime PM is disabled on a device, such as during
system suspend and resume transitions after __device_suspend_late()
disables runtime PM on idle runtime-suspended channels before IRQs are
masked in dpm_suspend_noirq().  Because -EINVAL !=3D 0, this check (along
with the matching checks in fsl_edma3_err_check(), fsl_edma3_tx_handler(),
fsl_edma3_or_err_handler(), and fsl_edma_err_handler()) proceeds to read
channel registers on suspended channels whose clocks or power domains are
off and then calls pm_runtime_put() without a matching get.

> +	pm_runtime_put(fsl_edma->dma_dev.dev);
>  	for (ch =3D 0; ch < fsl_edma->n_chans; ch++) {
> +		struct fsl_edma_chan *fsl_chan =3D &fsl_edma->chans[ch];
> +
> +		if (fsl_edma->chan_masked & BIT(ch))
> +			continue;
> +
> +		if (pm_runtime_get_if_active(&fsl_chan->vchan.chan.dev->device) =3D=3D=
 0)
> +			continue;
> +
>  		if (intr & (0x1 << ch)) {
>  			edma_writeb(fsl_edma, EDMA_CINT_CINT(ch), regs->cint);
>  			fsl_edma_tx_chan_handler(&fsl_edma->chans[ch]);
>  		}
> +		pm_runtime_put(&fsl_chan->vchan.chan.dev->device);
>  	}
>  	return IRQ_HANDLED;
>  }

[Severity: High]
Can skipping channels when pm_runtime_get_if_active() returns 0 cause a
hard-IRQ storm and hang in synchronize_irq() during channel suspend?

In fsl_edma_free_chan_resources(), fsl_edma_disable_request() disables
further DMA requests without clearing an already-latched interrupt flag,
and then calls pm_runtime_put_sync_suspend().  rpm_suspend() sets the
channel's runtime_status to RPM_SUSPENDING before calling
fsl_edma_chan_runtime_suspend() -> synchronize_irq().  While the channel is
in RPM_SUSPENDING, pm_runtime_get_if_active() returns 0 even though
fsl_chan->clk is still enabled, so this handler (as well as
fsl_edma_err_handler(), fsl_edma3_or_err_handler(), fsl_edma3_err_check(),
and fsl_edma3_tx_handler()) returns IRQ_HANDLED without clearing the
hardware interrupt status bit, leaving the level-triggered interrupt line
asserted forever.

In addition, fsl_edma_tx_handler() and fsl_edma_err_handler() call
pm_runtime_get_if_active() and pm_runtime_put() on every unmasked channel
before testing whether that channel's bit is set in intr or err, which
cycles power.lock and usage_count on unrelated active channels and can
cause a concurrent pm_runtime_put_sync_suspend() on another channel to fail
with -EAGAIN.

Finally, both handlers call pm_runtime_put(fsl_edma->dma_dev.dev) before
the loop, even though regs->cint, regs->cerr, regs->cerq, and regs->ceei
accessed inside the loop are global controller registers clocked by
fsl_edma->dmaclk.

[ ... ]

> @@ -132,13 +158,23 @@ static irqreturn_t fsl_edma3_tx_handler(int irq, vo=
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
> +	if (pm_runtime_get_if_active(&fsl_chan->vchan.chan.dev->device) =3D=3D =
0)
>  		return IRQ_NONE;

[Severity: High]
Can this dereference a NULL fsl_chan->vchan.chan.dev pointer when a channel
is masked via dma-channel-mask on controllers using
fsl_edma3_or_irq_init()?

In fsl_edma_probe(), channels matching fsl_edma->chan_masked skip
vchan_init(), so dmaenginem_async_device_register() never allocates
fsl_chan->vchan.chan.dev for them.  Unlike the other shared interrupt
handlers, fsl_edma3_or_tx_handler() calls fsl_edma3_tx_handler() for every
channel in [start, end) without checking fsl_edma->chan_masked:

drivers/dma/fsl-edma-main.c:fsl_edma3_or_tx_handler() {
    ...
	for (i =3D start; i < end; i++) {
		chan =3D &fsl_edma->chans[i];

		fsl_edma3_tx_handler(irq, chan);
	}
    ...
}

[ ... ]

> @@ -730,11 +828,11 @@ static int fsl_edma_probe(struct platform_device *p=
dev)
>  		regs =3D &fsl_edma->regs;
>  	}
> =20
> -	fsl_edma->dmaclk =3D devm_clk_get_optional_enabled(&pdev->dev, "dma");
> +	fsl_edma->dmaclk =3D devm_clk_get_optional(&pdev->dev, "dma");
>  	if (IS_ERR(fsl_edma->dmaclk))
>  		return dev_err_probe(&pdev->dev,
>  				     PTR_ERR(fsl_edma->dmaclk),
> -				     "Failed to get/enable DMA clock.\n");
> +				     "Failed to get DMA clock.\n");

[Severity: High]
What enables dmaclk, muxclk, and fsl_chan->clk when CONFIG_PM is disabled?

Although the commit message states that ARCH_MXC selects CONFIG_PM,
CONFIG_FSL_EDMA does not depend on PM and also supports platforms that do
not select CONFIG_PM, including ARCH_LAYERSCAPE (fsl,ls1028a-edma and
fsl,vf610-edma), ARCH_S32 (nxp,s32g2-edma), and 32-bit ARM ARCH_MXC
(SOC_VF610 and SOC_IMX7ULP).  With devm_clk_get_optional() and
devm_clk_bulk_get_optional() replacing the _enabled variants here and
pm_runtime_resume_and_get() replacing clk_prepare_enable() in
fsl_edma_alloc_chan_resources(), none of the clocks are enabled when
CONFIG_PM=3Dn, causing unclocked MMIO register accesses during probe and
channel use.

[ ... ]

> @@ -869,11 +960,56 @@ static int fsl_edma_probe(struct platform_device *p=
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

[Severity: High]
Does enabling runtime PM and attaching fsl_edma_chan_pm_domain on chan_dev
lead to a use-after-free on driver unbind?

dmaenginem_async_device_register() registers a devres action on &pdev->dev
to run dma_async_device_unregister(), while fsl_edma_remove() runs before
&pdev->dev devres teardown and calls fsl_edma_cleanup_vchan(), which removes
every channel from dmadev->channels:

drivers/dma/fsl-edma-common.c:fsl_edma_cleanup_vchan() {
    ...
	list_for_each_entry_safe(chan, _chan,
				&dmadev->channels, vchan.chan.device_node) {
		list_del(&chan->vchan.chan.device_node);
		tasklet_kill(&chan->vchan.task);
	}
}

When dma_async_device_unregister() subsequently runs during devres release,
dmadev->channels is already empty, so the per-channel chan_dev devices are
never unregistered and remain active with runtime PM enabled and drvdata
pointing to the freed fsl_chan structure.

> +
> +		PM_RUNTIME_ACQUIRE_IF_ENABLED(chan_dev, pm);
> +		ret =3D PM_RUNTIME_ACQUIRE_ERR(&pm);
> +		if (ret)
> +			return dev_err_probe(&pdev->dev, ret,
> +					     "Failed to resume eDMA channel %d!\n",
> +					     fsl_chan->vchan.chan.chan_id);
> +
> +		edma_write_tcdreg(fsl_chan, cpu_to_le32(0), csr);
> +		fsl_edma_chan_mux(fsl_chan, 0, false);
> +	}

[Severity: Medium]
Can fsl_edma_probe() leak clock prepare/enable references if a later probe
step fails?

PM_RUNTIME_ACQUIRE_IF_ENABLED() synchronously resumes &pdev->dev and each
chan_dev (enabling muxclk, dmaclk, and fsl_chan->clk), but releases them via
asynchronous pm_runtime_put(), which only queues suspend work on pm_wq.  If
fsl_edma_probe() fails or defers after resuming the engine or any channel,
devres teardown disables runtime PM on chan_dev and &pdev->dev, which
cancels the pending suspend work via __pm_runtime_barrier() without running
fsl_edma_chan_runtime_suspend() or fsl_edma_runtime_suspend(), leaving the
clocks prepared and enabled.

>  	ret =3D devm_of_dma_controller_register(&pdev->dev, np,
>  			drvdata->dmamuxs ? fsl_edma_xlate : fsl_edma3_xlate,
>  			fsl_edma);
> @@ -885,6 +1021,10 @@ static int fsl_edma_probe(struct platform_device *p=
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
Doesn't registering the DMA device and OF DMA controller before channel
runtime PM and setup_irq() expose uninitialized channels to consumers and
to pm_wq?

A client requesting a channel after dmaenginem_async_device_register() or
devm_of_dma_controller_register() can enter fsl_edma_alloc_chan_resources()
before devm_pm_runtime_enable(chan_dev) runs (failing in
pm_runtime_resume_and_get() with -EACCES) or before setup_irq() populates
fsl_chan->txirq, fsl_chan->errirq, and their handlers (skipping
request_irq() in fsl_edma_alloc_chan_resources()).  Meanwhile, the
asynchronous pm_runtime_put(chan_dev) in the channel loop queues
fsl_edma_chan_runtime_suspend() on pm_wq, which reads fsl_edma->txirq,
fsl_edma->txirq_16_31, fsl_edma->errirq, fsl_chan->txirq, and
fsl_chan->errirq concurrently with setup_irq() writing them.

> @@ -907,6 +1047,19 @@ static int fsl_edma_suspend_late(struct device *dev)
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
Doesn't checking !fsl_chan->srcid here and in fsl_edma_resume_early() skip
active channels that legitimately have srcid =3D=3D 0?

Unassigned channels are already runtime-suspended and caught by
pm_runtime_status_suspended().  On FSL_EDMA_DRV_SPLIT_REG controllers
without FSL_EDMA_DRV_HAS_PD (such as imx8ulp, imx93, imx95, and s32g2), an
allocated, runtime-active channel has srcid =3D=3D 0 when used for DMA_MEMC=
PY
or when channel 0 is allocated via fsl_edma3_xlate() on controllers without
FSL_EDMA_DRV_HAS_CHMUX (such as imx93-edma3 and s32g2-edma).  Skipping
those channels leaves them in pm_state =3D=3D RUNNING across system suspend=
 and
skips clearing their TCD csr on resume.

> @@ -926,19 +1079,56 @@ static int fsl_edma_resume_early(struct device *de=
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
>  	return 0;
>  }

[Severity: High]
Does moving the regs->cr write from fsl_edma_resume_early() to
fsl_edma_runtime_resume() lose the EDMA_CR_ERGA | EDMA_CR_ERCA setting
across system suspend when a channel is allocated?

When any channel is allocated, fsl_edma_alloc_chan_resources() holds a
runtime PM reference that keeps both the channel and the parent controller
device RPM_ACTIVE across system suspend and resume.  Because
fsl_edma_pm_ops does not use pm_runtime_force_suspend() and
pm_runtime_force_resume(), fsl_edma_runtime_resume() does not run during
system resume in that case, leaving regs->cr unconfigured on non-SPLIT_REG
controllers (vf610, ls1028a, and imx7ulp).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-b4-edma-ru=
ntime-opt-mo-v8-0-81345a3bfb52@oss.nxp.com?part=3D5
