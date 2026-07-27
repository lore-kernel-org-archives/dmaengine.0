Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D503E316C
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785185651; cv=none; b=P+L+3rFkaxxRtZsnC25ZZzyeWWjZeZWAdEwCX4yYJdl3dCkcLKaVuCaufot4SOwXvNV2QCVnDf/vKaEVQgh0UhMKNfg7PHYji2EOYCn4DECGKvUdUz2Otz2PGoOa3Ytwl52OClHFD65n3ctwJX554PkHGm0s0UymGbablgyVJ8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785185651; c=relaxed/simple;
	bh=8chrRAh6kTHPHBa8qt9oqyPArS5c0PSqxZduYidJdAQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mZDlinv/5l1A0GY80I9h5FAmkfbwc1J9+pGAxlyFg0eoUiV883hepro1WplKLerRKdGC99YvzjuGmt3Oi9Pr+NaUt26iuXZRa8yvnzjLUdhMN1o0b35UCAWtbHMskS6kw8IVYfbFOILdJLY9DxyUOo3TTMUQ/Wf3ALQTWlJojrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QHjYUtAJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QHjYUtAJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A1601F00A3A;
	Mon, 27 Jul 2026 20:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785185649;
	bh=Wt5k9v5YxKE38+9Wl9s+Sg58Rvv2Hm08Z5BCocOYCAw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QHjYUtAJDXVlJYHEMo8fro27Vgyuu72hSWDzAPufyjAdn9PwhaktZTBOtANYN661u
	 lJB0qe7bi+Qsb5+KlR86tVKIMAlC2KFSFMUtHu70/dpuRG85h+duRb7oaJfpIuCIOU
	 vnL59TUrE1U51ejgH0dWo0e8L8R0B3A499fWQJOrHrOxzQ9MbD0W1R2KXV8Jiq8Gz4
	 2NuPTe7T/GxxHv709NRnSpryVCW96Hke9reNG0LihiiLywW7RLLvqPhy6pU96MMJuD
	 2Cix/haem0hUoiJjU/QlPB+4YOSBSk/1RTGmQ/tYH1WrKW8Wp+QM+hYqHQpCM8t5fh
	 Cp8cveO1CVszA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 16/64] dmaengine: ppc4xx: replace irq tasklet with
 dma_chan BH
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <c2fa905ca405e0832085111ea534750e5cf90e28.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <c2fa905ca405e0832085111ea534750e5cf90e28.1785183549.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 20:54:09 +0000
Message-Id: <20260727205409.9A1601F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing dma_chan_kill_bh() on probe error paths leads to use-after=
-free.
- [High] Lockless traversal of chan->chain in hardirq context races with li=
st modification, causing panics.
- [High] Missing channel lock in ppc440spe_adma_issue_pending causes concur=
rent list/hardware corruption.
- [High] Direct freeing of DMA structures in remove() without waiting for a=
ctive clients causes Use-After-Free.
--

--- Patch [16]: [PATCH v2 16/64] dmaengine: ppc4xx: replace irq tasklet wit=
h dma_chan BH ---
commit f5f6478c931c241a7fdae2271fa2dee782cc4570
Author: Allen Pais <allen.lkml@gmail.com>
Subject: dmaengine: ppc4xx: replace irq tasklet with dma_chan BH

Replace the per-channel tasklet with the shared dma_chan BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

> diff --git a/drivers/dma/ppc4xx/adma.c b/drivers/dma/ppc4xx/adma.c
> index 279a431ccae38..98cfd012ca5bf 100644
> --- a/drivers/dma/ppc4xx/adma.c
> +++ b/drivers/dma/ppc4xx/adma.c
> @@ -1658,9 +1658,9 @@ static void __ppc440spe_adma_slot_cleanup(struct pp=
c440spe_adma_chan *chan)
>  /**
>   * ppc440spe_adma_tasklet - clean up watch-dog initiator
>   */
> -static void ppc440spe_adma_tasklet(struct tasklet_struct *t)
> +static void ppc440spe_adma_tasklet(struct dma_chan *c)
>  {
> -	struct ppc440spe_adma_chan *chan =3D from_tasklet(chan, t, irq_tasklet);
> +	struct ppc440spe_adma_chan *chan =3D to_ppc440spe_adma_chan(c);
> =20
>  	spin_lock_nested(&chan->lock, SINGLE_DEPTH_NESTING);
>  	__ppc440spe_adma_slot_cleanup(chan);

[Severity: High]
This is a pre-existing issue, but does this list modification race with
hardirq context?

The hardirq handlers (ppc440spe_adma_eot_handler and
ppc440spe_adma_err_handler) call ppc440spe_adma_device_clear_eot_status(),
which traverses chan->chain locklessly:

drivers/dma/ppc4xx/adma.c:ppc440spe_adma_device_clear_eot_status() {
    ...
    list_for_each_entry(iter, &chan->chain, chain_node) {
        if (iter->phys =3D=3D phys)
            break;
    }
    ...
}

Meanwhile, this softirq/BH code modifies the list without disabling local
interrupts (using spin_lock_nested or spin_lock_bh). If a hardware interrupt
fires on the same CPU while the list is being modified, couldn't the hardirq
handler traverse a corrupted list and cause memory corruption or a panic?

[ ... ]

> @@ -4137,7 +4137,7 @@ static int ppc440spe_adma_probe(struct platform_dev=
ice *ofdev)
>  	chan->common.device =3D &adev->common;
>  	dma_cookie_init(&chan->common);
>  	list_add_tail(&chan->common.device_node, &adev->common.channels);
> -	tasklet_setup(&chan->irq_tasklet, ppc440spe_adma_tasklet);
> +	dma_chan_init_bh(&chan->common, ppc440spe_adma_tasklet);
> =20
>  	/* allocate and map helper pages for async validation or

[Severity: High]
This isn't a bug introduced by this patch, but does the probe error path
need to call dma_chan_kill_bh()?

In ppc440spe_adma_probe(), dma_chan_init_bh() initializes the bottom-half
work. Later, hardware IRQs are requested. If an interrupt fires and schedul=
es
the BH via dma_chan_schedule_bh(), but a subsequent initialization step fai=
ls,
the error path uses free_irq() and then frees the channel structure without
canceling the pending work:

err_page_alloc:
    kfree(chan);

When the background work queue executes later, won't it access the freed
chan memory and cause a use-after-free?

[ ... ]

> @@ -4247,7 +4247,7 @@ static void ppc440spe_adma_remove(struct platform_d=
evice *ofdev)
>  				 device_node) {
>  		ppc440spe_chan =3D to_ppc440spe_adma_chan(chan);
>  		ppc440spe_adma_release_irqs(adev, ppc440spe_chan);
> -		tasklet_kill(&ppc440spe_chan->irq_tasklet);
> +		dma_chan_kill_bh(&ppc440spe_chan->common);
>  		if (adev->id !=3D PPC440SPE_XOR_ID) {
>  			dma_unmap_page(&ofdev->dev, ppc440spe_chan->pdest,
>  					PAGE_SIZE, DMA_BIDIRECTIONAL);

[Severity: High]
This is a pre-existing issue, but does this function safely wait for all
clients to drop their references?

In ppc440spe_adma_remove(), the driver calls dma_async_device_unregister()
which unregisters the device but does not synchronously block for active
client references to be dropped.

Immediately after, it frees the channel and device structures:

    list_del(&chan->device_node);
    kfree(ppc440spe_chan);
    ...
    kfree(adev);

If a client (like the network stack or filesystem) still holds a reference
and attempts to use the channel or release it later, will it dereference
these freed structures and cause a use-after-free?

[ ... ]

[Severity: High]
This is another pre-existing issue in the driver. Is channel locking missin=
g=20
in ppc440spe_adma_issue_pending()?

The DMA engine callback executes without acquiring chan->lock when checking
chan->pending and calling ppc440spe_chan_append():

drivers/dma/ppc4xx/adma.c:ppc440spe_adma_issue_pending() {
    ...
    if (ppc440spe_chan->pending) {
        ppc440spe_chan->pending =3D 0;
        ppc440spe_chan_append(ppc440spe_chan);
    }
    ...
}

Other parts of the driver (like ppc440spe_adma_tx_submit) correctly lock
around these calls using spin_lock_bh. Because issue_pending is an
asynchronous dmaengine API that can be called concurrently across multiple
CPUs, couldn't this race and corrupt hardware MMIO registers and descriptor
lists?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785183549.gi=
t.allen.lkml@gmail.com?part=3D16
