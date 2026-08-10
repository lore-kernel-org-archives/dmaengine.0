Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C96242D65
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786386482; cv=none; b=NYL0IZf9i3PbSzrh+u69USMJO1wnW+fbMRgawufV/05qgNdGBH4ZH7cKhoGzJnZQz7xPB8sZcTlbKJXVqlHkxSa3MPvYjpy0Ib6U7uGcepZXcis+tvI51OMVpGAVDPUSwATGy7rSydhG34+LOtBW9dxALTBh3vqRCho/kvZOk9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786386482; c=relaxed/simple;
	bh=RNvggbhkubIauDGPhGGPMIe79W+JhYxwaPbrfRyIkDQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bleyXCsg1LHEYKs209kvtNMBpJXzb5zGmjiQJpwUjdTWS83iiR0Q8FeA0niFrPY/JqoXgT+2HAwxya/Sd5Y8k41wGYKruHOIXop/GIz8phLBoLKToKo731j8gGf6tVufnxibUZ6AjSIzc0sTwegaxTHupv3dpLJhTqNftxkY1AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cs2HnXiB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cs2HnXiB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B1C31F000E9;
	Mon, 10 Aug 2026 18:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786386481;
	bh=2NWkFzRnPkM/Xqm7dTpgrqPSDFhIU9ApPuKFYk8OIrc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cs2HnXiBYwYGUICLli/RkP9yy5+gGzOYI3JuhuufN4H+oLXuAGf2j74MPyNXKCl/+
	 qXpQK/rXQI50p5R4o6dUz96ijm1dWISgH6pF5c9sX+MehEPiAto9V6kLn0iK+yWSiv
	 9TFLxeQI7CX8ssO5FHLTLSjFrFvleTLCrv4tSIWe5j8SgMe8ZqHYb2juL6ZqthXKF8
	 HjJqwyjPHyGJX9X6rFyOlB+CFZOjhI9uLy0BdrbqQc/ZP5gPIRMXXK93yj85RsMFT2
	 t3vRu6rI3eX1ynlYQxIvFKWcsUd18t8S4y/7NxqoBwU93GZpyZdrVn4RwvHFo4s/ZV
	 BKSzm9URhqpEQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 11/34] dmaengine: mmp_tdma: hook completions to
 dmaengine BH
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <3cd07c8bcab908e352bf1570fb7a3c24cc0fe516.1786384168.git.allen.lkml@gmail.com>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <3cd07c8bcab908e352bf1570fb7a3c24cc0fe516.1786384168.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 18:28:00 +0000
Message-Id: <20260810182801.3B1C31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing explicit teardown of dmaengine BH work, leading to a poten=
tial Use-After-Free if work is pending when the driver is removed or the ch=
annel is freed.
- [High] The driver requests a shared interrupt before initializing the cha=
nnel data structures, which can crash the kernel if the interrupt fires imm=
ediately.
--

--- Patch [11]: [PATCH v3 11/34] dmaengine: mmp_tdma: hook completions to d=
maengine BH ---
commit fb6d690923127c3cb64e8e8d24e39f8004e89713
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: mmp_tdma: hook completions to dmaengine BH

This commit replaces the per-channel tasklet with the shared dmaengine
BH helper for completions. The handler is updated to schedule the BH
work while teardown and common scheduling are managed by dmaengine.

> diff --git a/drivers/dma/mmp_tdma.c b/drivers/dma/mmp_tdma.c
> index ba03321eeff79..d20aaa7567a6d 100644
> --- a/drivers/dma/mmp_tdma.c
> +++ b/drivers/dma/mmp_tdma.c
> @@ -320,7 +319,7 @@ static irqreturn_t mmp_tdma_chan_handler(int irq, voi=
d *dev_id)
>  	struct mmp_tdma_chan *tdmac =3D dev_id;
> =20
>  	if (mmp_tdma_clear_chan_irq(tdmac) =3D=3D 0) {

[Severity: High]
This isn't a bug introduced by this patch, but is it possible for tdmac
to be NULL here if the interrupt fires early?

Looking at mmp_tdma_probe(), devm_request_irq() is called with IRQF_SHARED
before mmp_tdma_chan_init() populates the tdev->tdmac array elements.

If another device on the shared interrupt line triggers an interrupt right
after it is requested, mmp_tdma_int_handler() will iterate over the
uninitialized tdev->tdmac array and pass a NULL tdmac pointer to
mmp_tdma_chan_handler().

When mmp_tdma_clear_chan_irq() is called:

mmp_tdma_clear_chan_irq()
    u32 reg =3D readl(tdmac->reg_base + TDISR);

Could this unconditionally dereference the NULL tdmac and cause a panic?

> -		tasklet_schedule(&tdmac->tasklet);
> +		dmaengine_schedule_bh(&tdmac->chan);
>  		return IRQ_HANDLED;
>  	} else

[ ... ]

> @@ -583,7 +582,7 @@ static int mmp_tdma_chan_init(struct mmp_tdma_device =
*tdev,
>  	tdmac->pool	   =3D pool;
>  	tdmac->status =3D DMA_COMPLETE;
>  	tdev->tdmac[tdmac->idx] =3D tdmac;
> -	tasklet_setup(&tdmac->tasklet, dma_do_tasklet);
> +	dmaengine_init_bh(&tdmac->chan, dma_do_tasklet);

[Severity: High]
This is a pre-existing issue, but does there need to be a corresponding
call to dmaengine_kill_bh() during teardown?

If the driver is removed or the channel is freed while DMA is active or BH
work is scheduled, it appears the work could execute after the channel
structures are freed:

mmp_tdma_remove()
    of_dma_controller_free(pdev->dev.of_node);

Since the tdmac channel structure is allocated via devm_kzalloc(), without
explicitly flushing the pending work in mmp_tdma_remove() or
mmp_tdma_free_chan_resources(), could this lead to a use-after-free when
the pending work later dereferences the freed tdmac?

> =20
>  	/* add the channel to tdma_chan list */
>  	list_add_tail(&tdmac->chan.device_node,
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786384168.gi=
t.allen.lkml@gmail.com?part=3D11
