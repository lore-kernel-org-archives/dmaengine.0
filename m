Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F113349E141
	for <dmaengine@vger.kernel.org>; Fri, 11 Sep 2026 04:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789099854; cv=none; b=hlBMjuYOpQkDk/I0ilP6IP1ZOwVLhtmTOyPy0d/+EDsrak/lqS0eHeoVG0lN9ywO9MOVPyWHTS0tsfqWprNY55S/1wb44L2rnEp3zZWTkqgl1NR3ItpJX55JlAP5Jep/oOZQGZKkmvbJvEHkplnlmlCHUBlGDlnsfcX0JxvZgpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789099854; c=relaxed/simple;
	bh=KjIKk0RLxVmIt8OT41Y7cczyEZWSIvmPyjHhyaUXjwk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FG6HLGUSo29Pf2Tv5b3w3Lby1ALm6uGtHoHbNhlWRsLxvNTBSrsOVlayF7/vKu594wD/n+QaNhKmbdy1GrIhpv6PyF2LRrOPdPRKDlRG7uqhu9uXe5KrIeET4ZhHDyQfJPO5DRtesUoupHXOivd/b+vhIKBdDofQy9zE04pRwTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H4p/8WCE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H4p/8WCE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FA1E1F00893;
	Fri, 11 Sep 2026 04:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789099852;
	bh=CUyP3q3yMVzG4UAhKsmODqk2YBFZVO6PV7kFjSvo7Bk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H4p/8WCEJxjN5T6Q4LKaY/oCKFbgp5bK50Xuot8iKV8LKhMTiS0Ec3lxorUL/QByU
	 OXnTKEkZxlYpBNuFJ3vxC3dN8qnmOco1+iiNaFJs0DkqGMTmDfeGXFzpq5YQc3bUQo
	 XS4CW9AC7EKVwKMxupcK56qq3SJnHQ+b+RrqMaDAOuOi7e/IK/yvUouVs1Pm5O4r8R
	 KPsXUe3IH4mn/3MW6bLwEqnETyAQHLq7BXr60NnlFl2MMoSQH+bTX4FbkcC7x6zug4
	 zdGYO3fSK9AXNZ9ydM/163cQkfvz10BC/MIJZ1cmHiCzAv+HCvnfjvmn8Fib+zXCe1
	 FxsypxctiBF1g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: ppc4xx: use assigned variable for
 dma_free_coherent()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260911035941.200551-1-rosenp@gmail.com>
References: <20260911035941.200551-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 04:10:51 +0000
Message-Id: <20260911041052.4FA1E1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing `dma_mapping_error()` checks can lead to memory corruption.
- [High] Missing `tasklet_kill()` in probe error path leads to Use-After-Fr=
ee.
- [High] I/O memory leak due to shared refcount gating in `iounmap`.
- [High] Missing bounds check on `cell-index` device tree property causes o=
ut-of-bounds accesses.
- [High] Dangling `err_irq` left registered on probe error path leads to Us=
e-After-Free.
- [High] Lockless concurrent access to global `ppc440spe_adma_chan_list` ca=
uses list corruption or UAF.
--

commit d4a21e27d9b93a598c7085124df07419a304c246
Author: Rosen Penev <rosenp@gmail.com>

dmaengine: ppc4xx: use assigned variable for dma_free_coherent()

This commit fixes a potential issue in the error handling path of
ppc440spe_adma_probe() where adev->dev may be unassigned. It changes
the dma_free_coherent() call to use &ofdev->dev instead.

> diff --git a/drivers/dma/ppc4xx/adma.c b/drivers/dma/ppc4xx/adma.c
> index 279a431ccae38..d0863394c7235 100644
> --- a/drivers/dma/ppc4xx/adma.c
> +++ b/drivers/dma/ppc4xx/adma.c
> @@ -4212,7 +4212,7 @@ static int ppc440spe_adma_probe(struct platform_dev=
ice *ofdev)
>  	else
>  		iounmap(adev->dma_reg);
>  err_regs_alloc:
> -	dma_free_coherent(adev->dev, adev->pool_size,
> +	dma_free_coherent(&ofdev->dev, adev->pool_size,
>  			  adev->dma_desc_pool_virt,
>  			  adev->dma_desc_pool);

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing the probe
function, I noticed the destination pages are mapped without validation:

> 	if (adev->id !=3D PPC440SPE_XOR_ID) {
> 		chan->pdest_page =3D alloc_page(GFP_KERNEL);
> 		chan->qdest_page =3D alloc_page(GFP_KERNEL);
[ ... ]
> 		chan->pdest =3D dma_map_page(&ofdev->dev, chan->pdest_page, 0,
> 					   PAGE_SIZE, DMA_BIDIRECTIONAL);
> 		chan->qdest =3D dma_map_page(&ofdev->dev, chan->qdest_page, 0,
> 					   PAGE_SIZE, DMA_BIDIRECTIONAL);

Can the lack of a dma_mapping_error() check here lead to memory corruption?

If the IOMMU or memory allocator is exhausted, dma_map_page() returns an er=
ror
address which would then be written into DMA descriptors. I also noticed th=
at
ppc440spe_test_raid6() similarly maps a test page without validation.


[Severity: High]
This is a pre-existing issue, but is there a risk of a use-after-free
in this error path?

> err_dev_reg:
> 	ppc440spe_adma_release_irqs(adev, chan);
> err_irq:
[ ... ]
> err_page_alloc:
> 	kfree(chan);

The error path invokes IRQ cleanup but fails to call
tasklet_kill(&chan->irq_tasklet) before freeing the channel memory.

If an interrupt fires and schedules the tasklet before kfree(chan) runs,
would the tasklet dereference the freed memory to acquire the spinlock
when ppc440spe_adma_tasklet() ultimately executes?


[Severity: High]
This isn't a bug introduced by this patch, but it looks like the I/O memory
could be leaked:

> 	adev->i2o_reg =3D of_iomap(np, 0);

[ ... in ppc440spe_adma_release_irqs() ... ]

> 		if (atomic_dec_and_test(&ppc440spe_adma_err_irq_ref)) {
> 			irq_dispose_mapping(adev->err_irq);
> 			iounmap(adev->i2o_reg);
> 		}

Are we permanently leaking the physical I/O space virtual mapping here?

Since adev->i2o_reg is mapped unconditionally on a per-device basis during
setup, gating the unmap operation behind a shared IRQ reference counter mea=
ns
that if one engine unbinds or fails probe while the other is still active,
the refcount remains > 0 and its unique mapping is skipped.


[Severity: High]
This is a pre-existing issue, but could missing bounds checking on the
device tree property cause out-of-bounds accesses?

> 	idx =3D of_get_property(np, "cell-index", &len);
[ ... ]
> 	id =3D *idx;
[ ... ]
> 	adev->id =3D id;

The property is read directly into the identifier without validation.

If the ID is malformed, wouldn't this cause out-of-bounds array writes later
in the fast paths, such as to the 3-element array
chan_first_cdb[chan->device->id] in ppc440spe_adma_tx_submit() and
chan_last_sub[chan->device->id] in ppc440spe_dma_put_desc()?


[Severity: High]
This isn't a bug introduced by this patch, but does the setup error path
leave a dangling interrupt registered?

> err_req2:
> 	free_irq(adev->irq, chan);
> err_req1:
> 	irq_dispose_mapping(adev->irq);

The error path in ppc440spe_adma_setup_irqs() fails to free adev->err_irq
before returning.

Since kfree(chan) is called later in the probe error path, could the
interrupt handler ppc440spe_adma_err_handler() access the freed chan
pointer if the error interrupt fires?


[Severity: High]
This is a pre-existing issue, but might there be a race condition when acce=
ssing
the global channel list?

> 	list_add_tail(&ref->node, &ppc440spe_adma_chan_list);

Is it safe to append to and delete from ppc440spe_adma_chan_list without any
synchronization?

The list is modified globally in ppc440spe_adma_probe() and
ppc440spe_adma_remove(), while being traversed by
ppc440spe_async_tx_find_best_channel() without holding any spinlock or RCU
read lock.

Could this lead to list corruption or a use-after-free if the exported
symbol is called during a driver unbind?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911035941.2005=
51-1-rosenp@gmail.com?part=3D1
