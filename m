Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C743E638E;
	Mon, 27 Jul 2026 21:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785187025; cv=none; b=WFRxSzQQJTwnwM4PIF6rMtR/1QhWhNFL5/1fIkpUpimaeHSRMp4hFow564upJ6Y9ipCdDO9JOK1+cbhnVjcASc4+ecQrGET7TRLCPN7cFcCd39QLxLyXas/w/RxC/1Ob9DtcQ4lfZzP10xooL9WCaFwnnjq93tFwrOIvHccPwOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785187025; c=relaxed/simple;
	bh=mTMHCQMkexpcZ65759/ciESTDfl4VErA/dDxQ8QlzdY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iteK5etAANf0BUBgpV+VvwrjsVhyRACNe/o6c/eEJosPK08PfCjTLuqtnAKmOnfOeUY5zVUTMM+LOEWyFKQiq9w/D4uiLL28QbqMWqpPzdsqvoaRrudHeEK7s3qPiXw1OWViSdBHi9pFnbjRYj7quliSzB8Ccza4EGkmfdkLfEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ngCb/bk9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ngCb/bk9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED74A1F000E9;
	Mon, 27 Jul 2026 21:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785187023;
	bh=Y5W89RwgpT1IzwIFNOD/KCdQJtXOe4yIlfF14Qqn9Wo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ngCb/bk9EOqbD8ERnfZzf8eyeOFrHsxJAV9Ii14pcEFT3qG3yTGrt2UBJg87TGGeq
	 IEbChLayapS75i5CuP25+BeHK2pBpVYHL1Sm+bPOmwaBNK5RTF448wZzLSiJsDll3M
	 XTQ3vnnxGAXNKWn0MQiz0tUHjYZh4IPkFkRtfj/6513x0KQgRctrmGc82/01NF9gfi
	 cHSQyc8gT8c6/ZuwBTAv3s/lgvFJgRhnC7bkTMj44+G5w3Ue6hP1cZ2kl9MKj3ywxN
	 x3G7x4x4U99k9yrqGwvUoLjPGAORAMRwzNhF035DqP/5r50cK/jqf1wdMd60kgyuWN
	 3BnbzDV4Ln2Sw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 46/64] dmaengine: imx-sdma: kill vchan BH on teardown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <10f4e15741836cf24f08cdaf935da3260dea0250.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <10f4e15741836cf24f08cdaf935da3260dea0250.1785183549.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 21:17:02 +0000
Message-Id: <20260727211702.ED74A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Kernel OOPS on module removal due to uninitialized list head in ch=
annel 0.
- [High] Acquiring an uninitialized spinlock for channel 0 during teardown =
causes a kernel BUG.
- [High] Accessing hardware registers while clocks are disabled causes a sy=
nchronous external abort.
- [High] Unbalanced clock disables in `sdma_remove` trigger refcount underf=
low warnings.
- [High] Use-After-Free race condition in `sdma_update_channel_loop` during=
 concurrent termination.
--

--- Patch [46]: [PATCH v2 46/64] dmaengine: imx-sdma: kill vchan BH on tear=
down ---
commit 3996df4e4fdc79870fd89eac795a9295e1141104
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: imx-sdma: kill vchan BH on teardown

This commit modifies the virt-dma cleanup path to use dma_chan_kill_bh()
during driver teardown.

> --- a/drivers/dma/imx-sdma.c
> +++ b/drivers/dma/imx-sdma.c
> @@ -2399,11 +2399,11 @@ static void sdma_remove(struct platform_device *p=
dev)
>  	int i;
> =20
>  	devm_free_irq(&pdev->dev, sdma->irq, sdma);
> -	/* Kill the tasklet */
> +	/* Kill the channel BH */
>  	for (i =3D 0; i < MAX_DMA_CHANNELS; i++) {
>  		struct sdma_channel *sdmac =3D &sdma->channel[i];
> =20
> -		tasklet_kill(&sdmac->vc.task);
> +		dma_chan_kill_bh(&sdmac->vc.chan);
>  		sdma_free_chan_resources(&sdmac->vc.chan);

[Severity: High]
This is a pre-existing issue, but does iterating over all channels here lead
to a null pointer dereference for channel 0?

Channel 0 intentionally skips vchan_init() during probe, leaving its list
heads 0-initialized. When sdma_free_chan_resources() calls
vchan_synchronize() for channel 0, it executes:

drivers/dma/virt-dma.h:vchan_synchronize() {
    ...
    list_splice_tail_init(&vc->desc_terminated, &head);

Could this evaluate an empty list on the null next pointer and cause a pani=
c?


[Severity: High]
This isn't a bug introduced by this patch, but does calling
sdma_free_chan_resources() on channel 0 also attempt to acquire an
uninitialized spinlock?

During teardown, sdma_terminate_all() executes:

drivers/dma/imx-sdma.c:sdma_terminate_all() {
    ...
    spin_lock_irqsave(&sdmac->vc.lock, flags);

Since vchan_init() is skipped for channel 0, the lock remains uninitialized
from devm_kzalloc. Can this result in a bad magic system crash?


[Severity: High]
This is a pre-existing issue, but does writing to the hardware registers
during this loop cause a synchronous external abort?

When iterating over all channels, unallocated channels (or when all channels
are inactive) will have the ipg and ahb clocks disabled.

sdma_free_chan_resources() calls sdma_terminate_all(), which invokes
sdma_disable_channel() doing:

drivers/dma/imx-sdma.c:sdma_disable_channel() {
    ...
    writel_relaxed(BIT(channel), sdma->regs + SDMA_H_STATSTOP);

Writing to an i.MX SDMA register while the IP block clocks are gated
typically causes a hardware bus fault. Is there a way to verify the clocks
are enabled before this write?


[Severity: High]
This isn't a bug introduced by this patch, but does this cleanup loop
cause clock refcount underflow warnings?

sdma_free_chan_resources() unconditionally calls:

drivers/dma/imx-sdma.c:sdma_free_chan_resources() {
    ...
    clk_disable(sdma->clk_ipg);
    clk_disable(sdma->clk_ahb);

Since clk_enable() is only invoked dynamically when a client requests a
channel, calling disable on unallocated channels seems unbalanced. Could th=
is
break clock tracking?


[Severity: High]
This is a pre-existing issue, but is there a use-after-free race condition
in sdma_update_channel_loop() during concurrent termination?

sdma_update_channel_loop() drops the lock to invoke the callback:

drivers/dma/imx-sdma.c:sdma_update_channel_loop() {
    ...
    spin_unlock(&sdmac->vc.lock);
    dmaengine_desc_get_callback_invoke(&desc->vd.tx, NULL);
    spin_lock(&sdmac->vc.lock);

    /* Assign buffer ownership to SDMA */
    bd->mode.status |=3D BD_DONE;

If a concurrent thread calls dmaengine_terminate_sync(), it can take the
lock, move the active descriptor to the terminated list, and schedule the
terminate_worker which frees the descriptor memory.

When the IRQ thread reacquires the lock, it writes to bd->mode.status. Since
bd points inside the freed descriptor, does this overwrite freed memory?

>  	}
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785183549.gi=
t.allen.lkml@gmail.com?part=3D46
