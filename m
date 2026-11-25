Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604586;
	b=REIXlPV3/VUatfMmzLGF8eXMfhppJsEYvX77tI3VypKB+l1j7llaVPR3XNIdxURuX/AI
	 iwBbM/JOxUD/PluI1+hNF2Lod4apnzHcHUimh9pMZUDnAS5Fm4TlVDw6nNB7i4BrIpdPm
	 paMSTGWy6NrNkyH8FipCPcJr8F80r44tn0H+y8wZIsjf7FNcaVAmEEnHuhthnGBV0w3oG
	 ADZO5NKAFOOj1IE6q63RMrmZcnocvA1cCqjlWhHH60F/3k8m2o605m2cz2JJaUHv9A7/B
	 7Q0IUlrnBQOM7CnMLFcoNvEX66R1lWzJyPydu1OXfjD/ozwvh7hpm6IlRAnkos/TwiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604586;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=kffb+YaQ1fQ5gU9aJO2G5YnhT5nXZMDngWqvVzu+15I=;
	b=5R17b9fiycSjwct7tFkZSvIi7pWRMv93zi3/VLGB/Xs2ZcJT0HQK0gYH7axfXVBpSj9O
	 REhGHo1f9gqMmDgvLECxKNWk2y8Z9siUlo211SpGry8WEtVQkZqGvRifSBNooVsa3Zr0b
	 yiXPCzVrtIJT5XTqZEkMV+3jFTqXsP3ioQej8JuHMAJW9saEVw0hkMMYjO8ZDXGd7jJHa
	 wMPmPKHAXLU1etuq89/7CFBtqrsKJRLba1sdk2aAz7GctO2EZhaKtXpVRLkJFW4GTBtoL
	 EJaHnKUSfdTl/C8X+iJRio7aHAHz/ZfQ0Xb1k+QaqJiAsIjQW2S4UZ79ku+f4ZOpvJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UGFIIp55;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3CA606A321;
	Wed, 25 Nov 2026 11:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UGFIIp55
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BBA71F000D3;
	Wed, 25 Nov 2026 11:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795604585;
	bh=kffb+YaQ1fQ5gU9aJO2G5YnhT5nXZMDngWqvVzu+15I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UGFIIp55DWBTdJRejNlxONE7nTRcGV8KpxDIyQZCzTsgxzfiLfkolmUAjfputCi1/
	 Wou+Y4SI3yJnTMhO65yeaduX5oQs4evNLrctIcl2IWkSGm9SHKfHmtXibN8jXa/zok
	 PZ1+pcEhpb44KviaZ4B2fBdK4pdmHFRHmsiHw378GGXg2J2q2wZ5izFYY+lhruUs4b
	 HKB4nPIcntHDjywe/F77y3dYHXbVVyV80kLam5YMvU0xPFMx5B/a2r6Y5NU7TS8XoV
	 meGUnDQhacmCYppBhRH8dnEhHH8yCoucjjV9H7UxeJ2cQOIEc4KsmMFyxGzZqqjrf4
	 PNNaDJZDiRNbA==
Message-ID: <sashiko-outbox-233190@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 4/5] dmaengine: mcf-edma: enable runtime PM for eDMA
 engine and channel
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joy Zou" <joy.zou@oss.nxp.com>
Cc: imx@lists.linux.dev, dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261125-b4-edma-runtime-opt-mo-v8-4-81345a3bfb52@oss.nxp.com>
References: <20261125-b4-edma-runtime-opt-mo-v8-0-81345a3bfb52@oss.nxp.com>
 <20261125-b4-edma-runtime-opt-mo-v8-4-81345a3bfb52@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 11:03:04 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] dmaengine: mcf-edma: NULL deref in mcf_edma_probe() on
  unregistered chan_dev
- [Medium] dmaengine: mcf-edma: missing IRQ cleanup on error in
  mcf_edma_probe()
--

commit 85c2f32e55b99ebb674415cf8e3e58e89f3b5438
Author: Joy Zou <joy.zou@oss.nxp.com>

dmaengine: mcf-edma: enable runtime PM for eDMA engine and channel

This commit enables runtime PM for the ColdFire eDMA engine and its
channel devices during probe.

> diff --git a/drivers/dma/mcf-edma-main.c b/drivers/dma/mcf-edma-main.c
> index 9e1c6400c77be..b1b94639d4cc0 100644
> --- a/drivers/dma/mcf-edma-main.c
> +++ b/drivers/dma/mcf-edma-main.c
> @@ -8,6 +8,7 @@
>  #include <linux/dmaengine.h>
>  #include <linux/platform_device.h>
>  #include <linux/platform_data/dma-mcf-edma.h>
> +#include <linux/pm_runtime.h>
> =20
>  #include "fsl-edma-common.h"
> =20
> @@ -192,7 +193,9 @@ static int mcf_edma_probe(struct platform_device *pde=
v)
>  	INIT_LIST_HEAD(&mcf_edma->dma_dev.channels);
>  	for (i =3D 0; i < mcf_edma->n_chans; i++) {
>  		struct fsl_edma_chan *mcf_chan =3D &mcf_edma->chans[i];
> +		struct device *chan_dev;
> =20
> +		chan_dev =3D &mcf_chan->vchan.chan.dev->device;
>  		mcf_chan->edma =3D mcf_edma;
>  		mcf_chan->srcid =3D i;
>  		mcf_chan->dma_dir =3D DMA_NONE;
> @@ -201,6 +204,10 @@ static int mcf_edma_probe(struct platform_device *pd=
ev)
>  		mcf_chan->tcd =3D mcf_edma->membase + EDMA_TCD
>  				+ i * sizeof(struct fsl_edma_hw_tcd);
>  		edma_write_tcdreg(mcf_chan, cpu_to_le32(0), csr);
> +		ret =3D devm_pm_runtime_enable(chan_dev);
> +		if (ret)
> +			return dev_err_probe(&pdev->dev, ret,
> +					     "Can't enable eDMA channel PM runtime!\n");
>  	}

[Severity: High]
Does devm_pm_runtime_enable(chan_dev) cause a NULL pointer dereference
when CONFIG_PM is enabled?

At this point in mcf_edma_probe(), mcf_chan->vchan.chan.dev is still NULL
because the per-channel struct dma_chan_dev is not allocated or registered
until dma_async_device_register() runs later in probe.  chan_dev is
therefore an offset from NULL, and devm_pm_runtime_enable(chan_dev)
immediately dereferences chan_dev->power.lock and chan_dev->devres_lock.

> =20
>  	iowrite32(~0, regs->inth);
> @@ -240,6 +247,10 @@ static int mcf_edma_probe(struct platform_device *pd=
ev)
> =20
>  	platform_set_drvdata(pdev, mcf_edma);
> =20
> +	ret =3D devm_pm_runtime_enable(&pdev->dev);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Can't enable eDMA engine PM run=
time!\n");
> +

[Severity: Medium]
If devm_pm_runtime_enable(&pdev->dev) fails, does returning directly leak
the IRQs requested earlier by mcf_edma->drvdata->setup_irq() and leave
the vchan tasklets initialized?

mcf_edma_irq_init() registers its interrupt handlers with unmanaged
request_irq() using mcf_edma as the dev_id cookie.  When probe fails here,
devres frees mcf_edma and unmaps mcf_edma->membase while those IRQ
handlers remain active with a dangling mcf_edma pointer.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-b4-edma-ru=
ntime-opt-mo-v8-0-81345a3bfb52@oss.nxp.com?part=3D4
