Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E74F3D25D0
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 21:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785186013; cv=none; b=ubvU4L9g9pfBhq1+PVhA3DpYGvQpBb/n2g4TGbvCjRLxfiSBmNdFru6Ap+g8dFIKnN9WxlH0ncMCOQBAowACOxGjkRXsgZZgSayZjcN1M2uds9uoVNy8eIAqD9ls+dAysI2zg1+FeraTN2UsBQQdeSykPHriGO0RtfUbRPvNRKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785186013; c=relaxed/simple;
	bh=37XT2RUgpCLG7HSVrhd/rTSV8SJ0aKV74Q3XznRJ3pc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BGyutIZFW8RqCIIdwYwEapq+H42h5TwwMMfmz6OwK2FALMtK31wZ+3uthBbJJcHzVDlWHbWGuDzXRxCUvf4XcqZHUOB5FiF+rU+eIKXQmcSVwmOnqNvtf6ZaCaGrROYa+mixz5t0po1q9pHBnUxBGl6kkt+1yS+AjGFggAUCCH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QoyXPZoG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QoyXPZoG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFE221F000E9;
	Mon, 27 Jul 2026 21:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785186012;
	bh=IBBBach0L1oTlvim7oUc1CJ5hiaTpWfeDpZAYXjQI9w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QoyXPZoGsuMQpGurn+Q0jtcQiO3z97jr9TB2NznO228RWtlmhsa+ZsD7R20G+W7PM
	 cWSbR48zt0VHJAlKbZBeubaUEajmQq4cytm5krFJjC/QKXcSYU4ighEHCGoxg/jQI9
	 0lEV/g8ffHVCGHIU7Z4wuPAcvi7qiQ7SCt7t8CWkMoJKm45tMoxjFbwtg4966tz7cf
	 F1txbDdJbyOr0hnOvPv4BGVkKmDUCvNwuu4FW78U06AzFv4HJG24JucqslzQKOxCs5
	 GqnnjULO9B9U44slPGkTP2pCcDItsX3DFyGBw8RJLG6Rv3E6SfpkG+SdYNgMkNkHpH
	 ApvPt6xLXRy3w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 24/64] dmaengine: txx9dmac: route callbacks via
 channel BH
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <8c967b8a3cdc82ba43494ac218ca7c0ae2450993.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <8c967b8a3cdc82ba43494ac218ca7c0ae2450993.1785183549.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 21:00:11 +0000
Message-Id: <20260727210011.EFE221F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Uninitialized BH work and missing cleanup in shared IRQ mode
- [High] Interrupt storm and livelock due to premature IRQ unmasking in sha=
red IRQ mode
- [High] Invalid `enable_irq()` parameter in shared IRQ mode
--

--- Patch [24]: [PATCH v2 24/64] dmaengine: txx9dmac: route callbacks via c=
hannel BH ---
commit ba661d7c1d6f85fdbcef7fb4031ee54ec6ee5c5a
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: txx9dmac: route callbacks via channel BH

Use the per-channel BH helpers for descriptor completion handling and
schedule per-channel work from both channel and controller IRQ paths.

> diff --git a/drivers/dma/txx9dmac.c b/drivers/dma/txx9dmac.c
> index 05622b68a9363..6269baa28c513 100644
> --- a/drivers/dma/txx9dmac.c
> +++ b/drivers/dma/txx9dmac.c
> @@ -601,13 +601,13 @@ static void txx9dmac_scan_descriptors(struct txx9dm=
ac_chan *dc)
>  	}
>  }
> =20
> -static void txx9dmac_chan_tasklet(struct tasklet_struct *t)
> +static void txx9dmac_chan_tasklet(struct dma_chan *chan)
>  {
>  	int irq;
>  	u32 csr;
>  	struct txx9dmac_chan *dc;
> =20
> -	dc =3D from_tasklet(dc, t, tasklet);
> +	dc =3D container_of(chan, struct txx9dmac_chan, chan);
>  	csr =3D channel_readl(dc, CSR);
>  	dev_vdbg(chan2dev(&dc->chan), "tasklet: status=3D%x\n", csr);
> =20

[Severity: High]
Does this code handle shared IRQs correctly?

When running in shared IRQ mode, dc->irq is set to -1. Now that the shared
controller path schedules this channel BH, txx9dmac_chan_tasklet() will run
and unconditionally call enable_irq(dc->irq) at the end of the function:

    irq =3D dc->irq;
    enable_irq(irq);

Could this end up calling enable_irq(-1) and causing an issue in the core I=
RQ
code?

[ ... ]

> @@ -659,7 +659,7 @@ static void txx9dmac_tasklet(struct tasklet_struct *t)
>  			spin_lock(&dc->lock);
>  			if (csr & (TXX9_DMA_CSR_ABCHC | TXX9_DMA_CSR_NCHNC |
>  				   TXX9_DMA_CSR_NTRNFC))
> -				txx9dmac_scan_descriptors(dc);
> +				dma_chan_schedule_bh(&dc->chan);
>  			spin_unlock(&dc->lock);
>  		}
>  	}

[Severity: High]
Could this result in an interrupt storm?

Previously, txx9dmac_scan_descriptors() would synchronously clear the hardw=
are
interrupt condition before the shared tasklet unmasked the IRQ.=20

Now, the work is deferred to the async BH handler, but enable_irq(irq) is
still called synchronously at the end of txx9dmac_tasklet():

    irq =3D ddev->irq;
    enable_irq(irq);

Will the unmasked IRQ immediately fire again before the BH has a chance to =
run
and clear the hardware interrupt condition?

[ ... ]

> @@ -1113,7 +1113,7 @@ static int __init txx9dmac_chan_probe(struct platfo=
rm_device *pdev)
>  		irq =3D platform_get_irq(pdev, 0);
>  		if (irq < 0)
>  			return irq;
> -		tasklet_setup(&dc->tasklet, txx9dmac_chan_tasklet);
> +		dma_chan_init_bh(&dc->chan, txx9dmac_chan_tasklet);
>  		dc->irq =3D irq;
>  		err =3D devm_request_irq(&pdev->dev, dc->irq,
>  			txx9dmac_chan_interrupt, 0, dev_name(&pdev->dev), dc);

[Severity: High]
Is the BH work properly initialized when operating in shared IRQ mode?

dma_chan_init_bh() is only called if dc->ddev->irq < 0:

    if (dc->ddev->irq < 0) {
        ...
        dma_chan_init_bh(&dc->chan, txx9dmac_chan_tasklet);
        ...
    } else {
        dc->irq =3D -1;
    }

If the controller uses a shared IRQ, the BH work remains uninitialized.
When the shared controller tasklet attempts to schedule it, will it trigger=
 a
WARN_ON(!chan->bh_work_initialized) and drop the completion request entirel=
y?

[ ... ]

> @@ -1159,7 +1159,7 @@ static void txx9dmac_chan_remove(struct platform_de=
vice *pdev)
>  	dma_async_device_unregister(&dc->dma);
>  	if (dc->irq >=3D 0) {
>  		devm_free_irq(&pdev->dev, dc->irq, dc);
> -		tasklet_kill(&dc->tasklet);
> +		dma_chan_kill_bh(&dc->chan);
>  	}
>  	dc->ddev->chan[pdev->id % TXX9_DMA_MAX_NR_CHANNELS] =3D NULL;
>  }

[Severity: High]
Could we leak resources here in shared IRQ mode?

Similar to the probe function, the cleanup relies on dc->irq >=3D 0. If the
initialization issue above is fixed so the BH work is correctly used in sha=
red
IRQ mode, dma_chan_kill_bh() would still be skipped here since dc->irq is -=
1.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785183549.gi=
t.allen.lkml@gmail.com?part=3D24
