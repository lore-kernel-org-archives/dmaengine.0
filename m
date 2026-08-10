Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CEA361DBA;
	Mon, 10 Aug 2026 17:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786381452; cv=none; b=raU3eBnEhg8lxFVU0OYDvlTif+2e/yDa9Hu60kfNPBUISzY/oGaFWfIbcw9uLrVwoQxzsQdakf9GzV/sZQm8I6CBVVO5pdvOSxNt6V3CLw0xX4pYz75Vhiy5mXYX9mtLh9ZRmZJT3kvUaA4o2xjIu4LlqA5A+55CQdPusEVYT+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786381452; c=relaxed/simple;
	bh=XocDMTozul/zrTOl/wF0/MH9EtQk8rCLVp2BfXIoeEk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nC/OlgP+2UY6WiJNrpcis2tEPYXhFmt/YT8XxjhQik76MjghD6unTER3XK5Ji9gtHiXQqYIWtwtRE59tUki5ZIWc/RgImOgnkbg/t21a7KCuOJanjaXspCa7Cm0Bkdp3N2UoOtuaznqvUirSE4PIvAi7ButNRHuWrHK/3XTcNHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dlrCRWgi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dlrCRWgi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5278C1F000E9;
	Mon, 10 Aug 2026 17:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786381450;
	bh=ScNPKJm1abt8X5OlXSNubOVVD9BaXsH3ma1Vusfys2k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dlrCRWgibLDaKT3gmHSOB/FBdHSxXC21kN5izHb1KXQXrzxaAIg6EOMOMOOqQS+y8
	 vnH57TFwVErT3Gep0t6QgZpqn3Gr3B8Gf3CbB99iCrvtcfWDdmeu1XUB9Jr4SFsDOO
	 S7cmAFBPBbaxmGeXbDQhDwrtsjGiF67B03NqL/JlWEbTJM7EfXT+oG8m69kUGwUgju
	 a3E78d4487FLDLFh5XHqfSwSfokgn+neEAcML4FFsRQ5WFTEJLO3WzaRBoB0UWzyyZ
	 sbpqwzAapQgDuPUFPsyRKVrzVKT7bETjVYwnnmpeJkhNsmye1Y/xsRdiEAJFRpnApD
	 fmVz0evC5wt4Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 16/19] dmaengine: ti: k3-udma-v2: New driver for K3
 BCDMA_V2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Sree Kartheek Adivi" <s-adivi@ti.com>
Cc: vkoul@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260810151423.1948224-17-s-adivi@ti.com>
References: <20260810151423.1948224-1-s-adivi@ti.com>
 <20260810151423.1948224-17-s-adivi@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 17:04:09 +0000
Message-Id: <20260810170410.5278C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Unconstrained virtual channel ID (`uc->id`) is used as a hardware =
index for `bchan` allocation, leading to out-of-bounds array and bitmap acc=
esses.
- [High] Missing `.remove` function in `bcdma_v2_driver` causes a use-after=
-free on module unload.
- [High] PM suspend forcefully frees active channel resources and descripto=
r pools, causing Use-After-Free on resume.
- [Medium] Lockless call to `complete_all()` races with `reinit_completion(=
)` during channel teardown.
- [Low] `TI_K3_UDMA_V2` selects `TI_K3_RINGACC` without inheriting its depe=
ndencies, causing Kconfig unmet dependency warnings.
- [Low] The return values of consecutive `k3_ringacc_ring_cfg` calls are ac=
cumulated using a bitwise OR, which mangles negative error codes.
--

--- Patch [16]: [PATCH v8 16/19] dmaengine: ti: k3-udma-v2: New driver for =
K3 BCDMA_V2 ---
commit 61b786131a37c8bebad4a083b46e1ce421934a6f
Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>

dmaengine: ti: k3-udma-v2: New driver for K3 BCDMA_V2

Add support for BCDMA_V2, which differs from existing BCDMA by not
requiring PSIL pairing, using static channel mapping, direct IRQs,
and having a unified channel space.

> diff --git a/drivers/dma/ti/Kconfig b/drivers/dma/ti/Kconfig
> --- a/drivers/dma/ti/Kconfig
> +++ b/drivers/dma/ti/Kconfig
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

[Severity: Low]
Is it possible for this select statement to cause unmet dependency warnings?
TI_K3_RINGACC depends on TI_SCI_INTA_IRQCHIP, but select bypasses dependenc=
ies,
which could lead to build warnings if the IRQ chip driver is disabled.

> +	select TI_K3_PSIL
> +        help
> +	  Enable support for the TI UDMA (Unified DMA) v2 controller. This
> +	  DMA engine is used in AM62L.
> +
>  config TI_K3_UDMA_COMMON
[ ... ]
> diff --git a/drivers/dma/ti/k3-udma-v2.c b/drivers/dma/ti/k3-udma-v2.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/dma/ti/k3-udma-v2.c
[ ... ]
> +static int udma_v2_stop(struct udma_chan *uc)
> +{
> +	uc->state =3D UDMA_CHAN_IS_TERMINATING;
> +	reinit_completion(&uc->teardown_completed);

[Severity: Medium]
Can a data race occur between the interrupt handler and this stop function?
In the interrupt handler, complete_all() is called without a lock. Concurre=
ntly,
a channel termination path holding the channel lock could call udma_v2_stop=
(),
which runs reinit_completion(). If reinit_completion() occurs right after
complete_all(), the completion gets cleared before waiting threads consume =
it,
potentially causing a timeout.

> +
> +	if (uc->config.dir =3D=3D DMA_DEV_TO_MEM) {
[ ... ]
> +static int bcdma_v2_get_bchan(struct udma_chan *uc)
> +{
> +	struct udma_dev *ud =3D uc->ud;
> +	enum udma_tp_level tpl;
> +	int ret;
> +
> +	if (uc->bchan) {
> +		dev_dbg(ud->dev, "chan%d: already have bchan%d allocated\n",
> +			uc->id, uc->bchan->id);
> +		return 0;
> +	}
> +
> +	/*
> +	 * Use normal channels for peripherals, and highest TPL channel for
> +	 * mem2mem
> +	 */
> +	if (uc->config.tr_trigger_type)
> +		tpl =3D 0;
> +	else
> +		tpl =3D ud->bchan_tpl.levels - 1;
> +
> +	/*
> +	 * UDMA V2 uses a static 1:1 mapping between the virtual channel index
> +	 * (uc->id) and the hardware bchan/tchan/rchan index -- unlike V1, which
> +	 * dynamically allocates from a shared pool. Passing uc->id directly to
> +	 * __udma_reserve_*() is intentional, not a bug.
> +	 */
> +	uc->bchan =3D __udma_reserve_bchan(ud, tpl, uc->id);

[Severity: High]
Could this result in out-of-bounds accesses? The DMA filter function accepts
virtual channels for MEM_TO_MEM workflows without enforcing that uc->id is
within the valid bchan count limit (16). If previous allocations consume the
first 16 channels, a subsequent request would get an ID >=3D 16. Passing th=
is
unconstrained ID directly to __udma_reserve_bchan would perform an
out-of-bounds set_bit() on the ud->bchan_map bitmap and read out of bounds.

> +	if (IS_ERR(uc->bchan)) {
> +		ret =3D PTR_ERR(uc->bchan);
> +		uc->bchan =3D NULL;
> +		return ret;
> +	}
> +	uc->chan =3D uc->bchan;
> +	uc->tchan =3D uc->bchan;
> +
> +	return 0;
> +}
> +
> +static int bcdma_v2_alloc_bchan_resources(struct udma_chan *uc)
> +{
> +	struct k3_ring_cfg ring_cfg;
> +	struct udma_dev *ud =3D uc->ud;
> +	int ret;
> +
> +	ret =3D bcdma_v2_get_bchan(uc);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D k3_ringacc_request_rings_pair(ud->ringacc, ud->match_data->chan=
_cnt + uc->id, -1,

[Severity: High]
Following the above logic, requesting a ring pair with this unconstrained
uc->id could also exceed the bounds of the num_rings array here.

> +					    &uc->bchan->t_ring,
> +					    &uc->bchan->tc_ring);
[ ... ]
> +static int udma_v2_alloc_tx_resources(struct udma_chan *uc)
> +{
> +	struct k3_ring_cfg ring_cfg;
> +	struct udma_dev *ud =3D uc->ud;
> +	struct udma_tchan *tchan;
> +	int ring_idx, ret;
[ ... ]
> +	ret =3D k3_ringacc_ring_cfg(tchan->t_ring, &ring_cfg);
> +	ret |=3D k3_ringacc_ring_cfg(tchan->tc_ring, &ring_cfg);

[Severity: Low]
Does accumulating return values with a bitwise OR mangle negative error cod=
es?
If the first call fails with an error like -EINVAL, ORing the result of the
second call will produce a corrupted error code, destroying the original
POSIX error mapping.

> +
> +	if (ret)
> +		goto err_ringcfg;
[ ... ]
> +static int __maybe_unused udma_v2_pm_suspend(struct device *dev)
> +{
> +	struct udma_dev *ud =3D dev_get_drvdata(dev);
> +	struct dma_device *dma_dev =3D &ud->ddev;
> +	struct dma_chan *chan;
> +	struct udma_chan *uc;
> +
> +	list_for_each_entry(chan, &dma_dev->channels, device_node) {
> +		if (chan->client_count) {
> +			uc =3D to_udma_chan(chan);
> +			/* backup the channel configuration */
> +			memcpy(&uc->backup_config, &uc->config,
> +			       sizeof(struct udma_chan_config));
> +			dev_dbg(dev, "Suspending channel %s\n",
> +				dma_chan_name(chan));
> +			ud->ddev.device_free_chan_resources(chan);

[Severity: High]
Is it safe to free active channel resources and descriptor pools during
suspend? DMA clients generally only pause transfers during suspend and expe=
ct
their pre-allocated descriptors to remain valid.

> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused udma_v2_pm_resume(struct device *dev)
> +{
> +	struct udma_dev *ud =3D dev_get_drvdata(dev);
> +	struct dma_device *dma_dev =3D &ud->ddev;
> +	struct dma_chan *chan;
> +	struct udma_chan *uc;
> +	int ret;
> +
> +	list_for_each_entry(chan, &dma_dev->channels, device_node) {
> +		if (chan->client_count) {
> +			uc =3D to_udma_chan(chan);
> +			/* restore the channel configuration */
> +			memcpy(&uc->config, &uc->backup_config,
> +			       sizeof(struct udma_chan_config));
> +			dev_dbg(dev, "Resuming channel %s\n",
> +				dma_chan_name(chan));
> +			ret =3D ud->ddev.device_alloc_chan_resources(chan);

[Severity: High]
Reallocating a new pool on resume leaves clients holding dangling pointers =
to
the old destroyed pool, which could cause a use-after-free when they attempt
to submit or free their old descriptors.

> +			if (ret)
> +				return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops udma_pm_ops =3D {
> +	SET_LATE_SYSTEM_SLEEP_PM_OPS(udma_v2_pm_suspend, udma_v2_pm_resume)
> +};
> +
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
Should this platform driver include a remove callback? Without it, module
unload leaves the DMA engine core and OF subsystems with dangling pointers =
to
the freed ud->ddev structure, which could cause a use-after-free on subsequ=
ent
access when the module is removed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810151423.1948=
224-1-s-adivi@ti.com?part=3D16
