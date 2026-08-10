Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCB83F8241
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786386702; cv=none; b=N5/ZlBCRyqxuif5Odm7RjUDxmYv2o8JpyuqQr3gpd9nuDTpSwNuWqONaDNiCPH/GGGa6/klYpAS5+TLl/WiB3hkDE0o0uUNdBLliaUT2BNSQBeTYBkPWDa+BVqrzQV4llbDBUsDMB6tMu1L9K3VdhtIxoX16Ay0J7ou0o/acZAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786386702; c=relaxed/simple;
	bh=cCOOaevmrZ3Vwk9igmo/4PGk9UGBeAmtxIVn28sUtkE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Mj0tEC7ffE4ayYhWYkJzoIukqeWlo1ARxTWEhPJDV2vbuA8xDieFCw05UkmVmd49gHu5+vGRR6Pi57YOMJ1u9IitRdbF601hGKuxKTM4qCWrv0U6VoKCrRnOnPssgXEEPRnfXOutuoxATK05IdImru0Q5ZJ5VhRJbvIc9FMWCvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dArtLGHy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dArtLGHy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4DA91F00A3A;
	Mon, 10 Aug 2026 18:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786386701;
	bh=9hbnwBnTFjjcqtJFH65Ju5wdBcB0e56KjzYD+/j7xS4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dArtLGHyNB9tefDulrGqAc3Q24eN441l2NVBe7YAnmfcy1js3XQIcLkqnIzq1ZG1M
	 D+UE9hpXl5IprE7L2+hzf6n6O0dg9zaecXOZPILPej7pyYeyjiU4GkP7AYwOFaZ8F/
	 YT04vLeiBACZdjsA6GlWhZnL2f9/dKCtGAmq9QEsD9jDVdipe9He8Ucaef6uXb5Nqm
	 i2i/5cq+kVubJBqPOL3tW1gy8VyK7DzyqR/kE1x398NQK+DoH3wUZznKO1rEaRz+XR
	 5/3EZcJa1VYgwj4zZMbKYMLbnfRHpCuGmaGvOH5HJDEA1s76mLv7ivacwxvFSFCLZY
	 62Zz25QJMKWCg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 05/34] dmaengine: ep93xx: hook callbacks via
 dmaengine BH
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <69b17379bf3c78b6af96dbe3b76940520d491417.1786384168.git.allen.lkml@gmail.com>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <69b17379bf3c78b6af96dbe3b76940520d491417.1786384168.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 18:31:40 +0000
Message-Id: <20260810183140.C4DA91F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing dmaengine_kill_bh() causes use-after-free and premature ca=
llback invocation
--

--- Patch [5]: [PATCH v3 05/34] dmaengine: ep93xx: hook callbacks via dmaen=
gine BH ---
commit 3ccb9d1bebba979771c31fb7e0c5d8c45b92dd9c
Author: Allen Pais <allen.lkml@gmail.com>
Date:   Mon Aug 10 18:09:06 2026 +0000

    dmaengine: ep93xx: hook callbacks via dmaengine BH
   =20
    Replace the per-channel tasklet with the shared dmaengine BH helper.
    The handler continues to run in softirq context while dmaengine owns
    the common scheduling and teardown mechanism.

> diff --git a/drivers/dma/ep93xx_dma.c b/drivers/dma/ep93xx_dma.c
> index a3395cfcf5dd5..b269d2f072f82 100644
> --- a/drivers/dma/ep93xx_dma.c
> +++ b/drivers/dma/ep93xx_dma.c

[ ... ]

> @@ -1421,7 +1419,7 @@ static struct ep93xx_dma_engine *ep93xx_dma_of_prob=
e(struct platform_device *pde
>  		INIT_LIST_HEAD(&edmac->active);
>  		INIT_LIST_HEAD(&edmac->queue);
>  		INIT_LIST_HEAD(&edmac->free_list);
> -		tasklet_setup(&edmac->tasklet, ep93xx_dma_tasklet);
> +		dmaengine_init_bh(&edmac->chan, ep93xx_dma_tasklet);

[Severity: High]
This is a pre-existing issue, but should we be terminating the bottom-half
work during synchronization or resource cleanup?

If an interrupt fires and schedules the bottom-half work, but the client
calls dmaengine_terminate_all() and dma_release_channel() before the work
can execute, a new client could request the channel and submit a new
descriptor.

When the delayed bottom-half finally runs, could it access the new client's
descriptor from edmac->active and prematurely invoke its callback?

Also, if the driver is unbound via sysfs, devm_kzalloc frees the channel
memory. If the bottom-half is still scheduled, would this result in a
use-after-free?

It looks like we are missing a call to dmaengine_kill_bh() (and previously
tasklet_kill()) in ep93xx_dma_synchronize() or=20
ep93xx_dma_free_chan_resources():

drivers/dma/ep93xx_dma.c:ep93xx_dma_synchronize() {
    ...
    if (edmac->edma->hw_synchronize)
        edmac->edma->hw_synchronize(edmac);
    ...
}

drivers/dma/ep93xx_dma.c:ep93xx_dma_free_chan_resources() {
    ...
    clk_disable_unprepare(edmac->clk);
    free_irq(edmac->irq, edmac);
    ...
}

> =20
>  		list_add_tail(&edmac->chan.device_node,
>  			      &dma_dev->channels);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786384168.gi=
t.allen.lkml@gmail.com?part=3D5
