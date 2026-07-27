Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C04436897C
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785185980; cv=none; b=denObFV6a+ctSG/E+xBHMs2KwVSnpWckZWpVejsfTPONlroEMyGqbpX1F9V1MmbChesf61EAhhgxYYgW8geGh0iDWemDln9HXmdzGLryyWRPSeMavS9hl/fIO9qLY9sxXxHlk08JEnvWDqlpa95IZCN9zgBmEly0aM6XmLBSzd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785185980; c=relaxed/simple;
	bh=nkmQ7wizkX9HVJDfEQ0eiT+P2DpPKZuc1PceXgrvNhI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MlAeeBWYMt5Qd0FYIgYB8/gD+s5sDyi8A4Yrb2cloENXwu3mEPZ7YgixbZYoCDilmwy0Dcn7aZadA8DqG1VEt/RzcgypRW5WEn6IZXM9MgKcEt+flaNpIwTfQ+e67HGT7zJJrQYK8AH9N9NlZFD67WbAa/YtC0QY3pa3hUywrEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iuTacmsQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iuTacmsQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E59661F000E9;
	Mon, 27 Jul 2026 20:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785185979;
	bh=3JH2y3vwKepKlAIidAZetmBHFT/T96twq2+qb891Smw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iuTacmsQ5PKKNAkmCLLa1rPAX6Ru+gvCIA2g3+Smm5E9mHpee5LMw3md61ticF+gY
	 WRoIyInTvzXMcFGuPq4wHAdIOfvQVXiCy9Uu4ahQc/1bQepqXKfuD6hQ3NbLNGdZ3V
	 QN1jV6Ce2BYLT8ZOQdH+HHEcvH30mcTFfebEw5BxYxyhgrA/nsU3CNew1ZKAfAPlob
	 w+bg2LrcuOYt7WaW9On27s36TzMzPt3fc+cb8pHdY6fGyFigO2OwllBQFP4xRGKbIx
	 rBT6EbIy5aHHhuZJR984K8trVWg5xFJf3o7GfNP9a3ObYqfJOtF1y3xCaJkXQhZCFV
	 QSBgKDg1eqWmg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 05/64] dmaengine: ep93xx: hook callbacks via dma_chan
 BH
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <5b4f1f6e674bd520c47cb058ba400bc033bd446b.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <5b4f1f6e674bd520c47cb058ba400bc033bd446b.1785183549.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 20:59:38 +0000
Message-Id: <20260727205938.E59661F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing `dma_chan_kill_bh()` in `ep93xx_dma_synchronize()` and `ep=
93xx_dma_free_chan_resources()` violates the dmaengine API and leads to pre=
mature callback execution for new clients.
- [High] The ep93xx_dma driver is vulnerable to a Use-After-Free and kernel=
 panic if unbound via sysfs, due to the lack of a .remove callback and miss=
ing .suppress_bind_attrs =3D true.
--

--- Patch [5]: [PATCH v2 05/64] dmaengine: ep93xx: hook callbacks via dma_c=
han BH ---
commit e03616bfd332cb745207d3436713d688064c9cb5
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: ep93xx: hook callbacks via dma_chan BH

Replace the per-channel tasklet with the shared dma_chan BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

> diff --git a/drivers/dma/ep93xx_dma.c b/drivers/dma/ep93xx_dma.c
> index 311e55a97ba9f..8f5200750fe98 100644
> --- a/drivers/dma/ep93xx_dma.c
> +++ b/drivers/dma/ep93xx_dma.c

[ ... ]

> @@ -1420,7 +1418,7 @@ static struct ep93xx_dma_engine *ep93xx_dma_of_prob=
e(struct platform_device *pde
>  		INIT_LIST_HEAD(&edmac->active);
>  		INIT_LIST_HEAD(&edmac->queue);
>  		INIT_LIST_HEAD(&edmac->free_list);
> -		tasklet_setup(&edmac->tasklet, ep93xx_dma_tasklet);
> +		dma_chan_init_bh(&edmac->chan, ep93xx_dma_tasklet);
> =20
>  		list_add_tail(&edmac->chan.device_node,
>  			      &dma_dev->channels);

[Severity: High]
This is a pre-existing issue, but I noticed ep93xx_dma_synchronize() and
ep93xx_dma_free_chan_resources() do not cancel the pending BH work.

If a client calls dma_terminate_all(), the active list is emptied, but a
scheduled BH is not cancelled because the driver does not call
dma_chan_kill_bh() (previously missing tasklet_kill()).

When the channel is reallocated, the pending BH can run, see the new client=
's
descriptor, and unconditionally invoke its callback before completion:

drivers/dma/ep93xx_dma.c:ep93xx_dma_tasklet()
    ...
	desc =3D ep93xx_dma_get_active(edmac);
	if (desc) {
		if (desc->complete) {
			/* mark descriptor complete for non cyclic case only */
			if (!test_bit(EP93XX_DMA_IS_CYCLIC, &edmac->flags))
				dma_cookie_complete(&desc->txd);
			list_splice_init(&edmac->active, &list);
		}
		dmaengine_desc_get_callback(&desc->txd, &cb);
	}
    ...

Does this need to call dma_chan_kill_bh() during synchronization or channel
release to prevent state corruption for new DMA clients?

[Severity: High]
This isn't a bug introduced by this patch, but the ep93xx_dma driver appears
vulnerable to a Use-After-Free and kernel panic if unbound via sysfs.

Because the driver lacks a .remove callback and doesn't set
.suppress_bind_attrs =3D true in ep93xx_dma_driver:

drivers/dma/ep93xx_dma.c:
static struct platform_driver ep93xx_dma_driver =3D {
	.driver		=3D {
		.name	=3D "ep93xx-dma",
		.of_match_table =3D ep93xx_dma_of_ids,
	},
	.probe		=3D ep93xx_dma_probe,
};

If a privileged user unbinds the driver via sysfs, it never calls
dma_async_device_unregister() or frees IRQs. The device core's devres
mechanism will free the edma and edmac structures, but any subsequent IRQ
firing or scheduled BH execution will dereference the freed memory.

Should this driver include a .remove callback or set
.suppress_bind_attrs =3D true to prevent this?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785183549.gi=
t.allen.lkml@gmail.com?part=3D5
