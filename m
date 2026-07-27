Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3BA2E6CB3
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785185770; cv=none; b=kaurGkWwmcYVoAWIv3YOcBqjfUzBz+gD4HVv5kah3BOVjFNRwlkxXfvRWT0rwfoGPdYridgEdy0ilwClfz6Bz+xJ7oNbu0/z9jAV96J1U/v02KCAO+BwGj+BwC26ntVyPRX1957ieA4P5bk4qz74uBpCj+4QdljorZPzRqGuUxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785185770; c=relaxed/simple;
	bh=3nFVPZScQqK6bCmvFvxfPifWtxxRSea3uCkBe2ei/Qw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=I3kw2AVlRqG1s60+z93UMNBbkmSqfmWaqxDkK6gh0R+Z9vr34q9/G+aIVVsMTDL8xk29XKsRvXG3e1k7nZ3nw2xKq/yZhlo4TT1mKTUuErQXrlQ1Fw/OlsKC6TJMITI+/qMG6YSPzKc1Mt32aDmLEFKojmnX243OCKC+esjrDnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kXmJjF8e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kXmJjF8e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A51B01F000E9;
	Mon, 27 Jul 2026 20:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785185768;
	bh=wjR+f2GlorWW81cZPoyyLifz7z8y4NORGUmMburU6rU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kXmJjF8ekb/2CaLCDfKnzPAoC4NsLaudc3PvJfFYoKfGdCcfmaTF1LA9loJYgXDj2
	 bIzW7a8xoPJQpSkJ4pOPtKg/sRP2gqkFwJCHUULc+2uMWeUFC79eFL5UYnbmN9wGQ0
	 m1lL1WvfNvooiMoBr3430ET6AHURGMg3VKZgUOUcAm/A/cPL41quF3hXlYwWvyKTP1
	 sQ0i7us7+0Vx8xXL4wFYeNtALMTYM4BaY3+Y07ruW3/gAJNMxHHg+sVhBjLMt8YMuC
	 8a5hQF4DhZWmW3JGFVSvWp8tkFbP0rjlqs7WBKKh5ORePT/fR/wMF1VlRjWeyysGpD
	 nW+9v70gE4VGg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 01/64] dmaengine: add tasklet-backed channel BH
 helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <1ffd627be7ac24478efb82f52acbdc80c46ee2e5.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <1ffd627be7ac24478efb82f52acbdc80c46ee2e5.1785183549.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 20:56:08 +0000
Message-Id: <20260727205608.A51B01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] API breakage leading to widespread build failures in downstream DMA=
 drivers due to the removal of the `task` field from `struct virt_dma_chan`=
 without updating its consumers.

Pre-existing issues:
- [Critical] Race condition causing a Use-After-Free of a cyclic descriptor=
's `tx_result` pointer when a channel is concurrently terminated.
--

--- Patch [1]: [PATCH v2 01/64] dmaengine: add tasklet-backed channel BH he=
lpers ---
commit 9141d715bfba5e26881326cc343ca063eaf8458a
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: add tasklet-backed channel BH helpers

This patch introduces helpers to initialize, schedule, and kill a channel
bottom half. It converts virt-dma to use the new API, replacing its private
tasklet while preserving the execution context.

> diff --git a/drivers/dma/virt-dma.c b/drivers/dma/virt-dma.c
> index 7961172a780dd..89fcd51ddcabe 100644
> --- a/drivers/dma/virt-dma.c
> +++ b/drivers/dma/virt-dma.c
[ ... ]
> @@ -98,7 +98,7 @@ static void vchan_complete(struct tasklet_struct *t)
>  	}
>  	spin_unlock_irq(&vc->lock);
> =20
> -	dmaengine_desc_callback_invoke(&cb, &vd->tx_result);
> +	dmaengine_desc_callback_invoke(&cb, vd ? &vd->tx_result : NULL);

[Severity: Critical]
This is a pre-existing issue, but does dropping vc->lock just before
referencing vd->tx_result open a race window for a use-after-free?

If a concurrent dmaengine_terminate_sync() calls the driver's terminate_all
callback (like bcm2835_dma_terminate_all()), the driver could acquire the
lock and free vd via vchan_dma_desc_free_list():

CPU1
vchan_complete()
    spin_unlock_irq(&vc->lock);

CPU2
dmaengine_terminate_sync()
    bcm2835_dma_terminate_all()
        spin_lock_irqsave(&vc->lock, flags);
        vchan_dma_desc_free_list() // frees vd
        spin_unlock_irqrestore(&vc->lock, flags);

CPU1
    dmaengine_desc_callback_invoke(&cb, vd ? &vd->tx_result : NULL);

Could evaluating vd->tx_result here pass a dangling pointer to the client
callback if the descriptor was freed by the concurrent termination?

>  	list_for_each_entry_safe(vd, _vd, &head, node) {
>  		dmaengine_desc_get_callback(&vd->tx, &cb);
[ ... ]
> diff --git a/drivers/dma/virt-dma.h b/drivers/dma/virt-dma.h
> index 59d9eabc8b674..abe2a44757442 100644
> --- a/drivers/dma/virt-dma.h
> +++ b/drivers/dma/virt-dma.h
> @@ -21,7 +21,6 @@ struct virt_dma_desc {
> =20
>  struct virt_dma_chan {
>  	struct dma_chan	chan;
> -	struct tasklet_struct task;

[Severity: Low]
Does removing the task field here cause build failures in downstream driver=
s?

Several DMA drivers like bcm2835-dma, hisi_dma, idma64, and tegra210-adma
directly access chan->vc.task during driver removal or error paths to kill
the tasklet. Without updating those consumers, they will fail to compile.

>  	void (*desc_free)(struct virt_dma_desc *);
> =20
>  	spinlock_t lock;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785183549.gi=
t.allen.lkml@gmail.com?part=3D1
