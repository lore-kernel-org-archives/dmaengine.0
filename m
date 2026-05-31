Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6CC188596
	for <dmaengine@vger.kernel.org>; Sun, 31 May 2026 02:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780194660; cv=none; b=oosK4Lh4y4I5sBvnBcMNsr9kPMfgiJIMgWfKekuosP9e88dLvUT8fDkU495h2wX0+sHKiNROBzj8zXpfQHa3KdHERfUfw2qyk7wmbJHXgQMYqUGiSqtGsmEJgXubJ6Ja/E3+SOyT0KPh97bw+lbbaEGX720yoEA5NFpcjZZWT9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780194660; c=relaxed/simple;
	bh=8wqxugk1eo9GmwZawmHJMW8W7ToGhH/X/BKDuxS3Qz8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FnnHcjLHfUuq8BSD2S8mr+pQLrPL2vc9mFyqt2PjDl2sJ2ZxYgnCUpqlsbvCXWSGhj8zuuKJiNbFoFKrlb/GmRoBIUIAg09Q48IQKJxSZjVTbrYVwci8U6kbpydzOTUxs7gjxxzepCSYipsTW47xqZdw/35hPY7BG3tJHqvu2xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IRxDAQ3k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IRxDAQ3k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B163E1F00893;
	Sun, 31 May 2026 02:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780194658;
	bh=HbYlvgXf3yVqsmuJjxRwY4jdTcqfZkW4u1iUEqWGA6M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IRxDAQ3kxLe+ie17qIK4Rn4P+rmzXsBORn7c+AVrOGxJctyW0x0HKF9E60dRX0I3S
	 I4L3Tx6UqdpPKQ6rH4yF7XKAGjUgWt0mudz6CMtGeeY7uLpdCqR6xyTXz+cIWXOkpn
	 HuKmYXkmMSoVQ02wAqoA5xFAlH1L85A8J0f3V+BU8XEV0iiI6GAYeFkePMOPsxnL+k
	 B+l1Bmbe8SE1ggZXJTWv1fFLogaXlLjEl3/ZENVK2pfb4kPSUCICJ8I/t20VbavWyV
	 RcVzy7F8e+LAn84W0BtdasCx/tuXTG8kRV5WWzHAB6RitVVpgQN89imUTbZgo8uHRe
	 UAxZRAtnr45hA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] dmaengine: ti: omap-dma: fix dma_pool_destroy
 before omap_dma_free in error paths
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260531020535.594460-4-rosenp@gmail.com>
References: <20260531020535.594460-4-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 31 May 2026 02:30:58 +0000
Message-Id: <20260531023058.B163E1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Potential Use-After-Free in the IRQ handler during the `of_dma_con=
troller_register` error path in probe.
- [High] Unsafe unbind and devm anti-pattern due to lack of `device_release=
` callback and failure to drain virt-dma descriptors.
--

commit 7feb24e91af080b6fba5d126723a162d39a35206
Author: Rosen Penev <rosenp@gmail.com>

dmaengine: ti: omap-dma: fix dma_pool_destroy before omap_dma_free in error=
 paths

omap_dma_free() tears down channels and may free t2_desc entries from
the descriptor pool via tasklet cleanup. Destroying the pool before
omap_dma_free() is a use-after-free. Move omap_dma_free() ahead of
dma_pool_destroy() in both probe error paths and the remove path.

> diff --git a/drivers/dma/ti/omap-dma.c b/drivers/dma/ti/omap-dma.c
> index 839e04f53fc2d..fd1ad3b4268c9 100644
> --- a/drivers/dma/ti/omap-dma.c
> +++ b/drivers/dma/ti/omap-dma.c

[ ... ]

> @@ -1825,9 +1825,9 @@ static int omap_dma_probe(struct platform_device *p=
dev)
>  		if (rc) {
>  			pr_warn("OMAP-DMA: failed to register DMA controller\n");
>  			dma_async_device_unregister(&od->ddev);
> +			omap_dma_free(od);

[Severity: High]
This is a pre-existing issue, but does this error path leave us vulnerable =
to
a use-after-free if an interrupt fires during probe failure?

If of_dma_controller_register() fails, the probe error path calls
omap_dma_free(), which frees the channel objects via kfree().

However, it does not appear to stop active DMA hardware, clear
od->irq_enable_mask, or unregister the IRQ. Because the DMA device was
already exposed by a successful dma_async_device_register() earlier in
probe, a concurrent client could have allocated a channel and started a
transfer, enabling hardware interrupts.

If a hardware interrupt fires before devres cleanup unwinds the IRQ:

omap_dma_irq() {
    ...
    c =3D od->lch_map[i];
    if (c) {
        spin_lock_irqsave(&c->vc.lock, flags);
        ...
        tasklet_schedule(&c->vc.task);
    ...
}

Would this read the freed channel structure from od->lch_map and schedule
a tasklet using a freed pointer?

>  			if (od->ll123_supported)
>  				dma_pool_destroy(od->desc_pool);
> -			omap_dma_free(od);
>  			return rc;
>  		}
>  	}

[ ... ]

> @@ -1869,10 +1869,10 @@ static void omap_dma_remove(struct platform_devic=
e *pdev)
>  		omap_dma_glbl_write(od, IRQENABLE_L0, 0);
>  	}
> =20
> +	omap_dma_free(od);

[Severity: High]
This is a pre-existing issue, but does forcefully freeing channel structures
here bypass dma_device refcounting and leak descriptor lists?

The driver does not seem to provide a .device_release callback for the
dma_device and forcefully frees the omap_chan structures using kfree() in
omap_dma_free():

omap_dma_free() {
    ...
    list_del(&c->vc.chan.device_node);
    tasklet_kill(&c->vc.task);
    kfree(c);
    ...
}

Because omap_dmadev is allocated with devm_kzalloc(), a forced unbind while=
 a
client holds a channel reference will result in devm freeing omap_dmadev and
omap_dma_free() freeing omap_chan. This bypasses dma_device refcounting and
could cause a use-after-free when the client later attempts to call
dma_release_channel().

Additionally, omap_dma_free() does not drain the internal virt-dma lists
(desc_allocated, desc_submitted, etc.). Does this permanently leak any pend=
ing
virt_dma_desc items allocated by clients?

> +
>  	if (od->ll123_supported)
>  		dma_pool_destroy(od->desc_pool);
> -
> -	omap_dma_free(od);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260531020535.5944=
60-1-rosenp@gmail.com?part=3D3
