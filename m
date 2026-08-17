Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F61B44E649
	for <dmaengine@vger.kernel.org>; Mon, 17 Aug 2026 16:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786983835; cv=none; b=ahRVlb0UMnHZjpKdfmjX4AwrcVdxM7BH92sorJbrLBxrLufAXJjAlxCwE2J4MK+GrEHnXBwILYIe69EpLn9jwWhl8eW+fRMpEJPTC09ZOnN5ydnblZp6WgXUVLWuGksjjqFziHn4WE74lDmVxA10lJKp05+CaePoGEUneHXl5TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786983835; c=relaxed/simple;
	bh=ewqfneWt9aCuZT3HvoWo0zPfxwXyrZAb53CN9W+vtoc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CJQRfLz6KVYauDT12E7iOrqVUlu6frGzFOOhhSVTWFTmY/AnloxB1rm1gbgYN6PBqVg1elQJVIfALYoeaXeEsvGlQ8djlD3Qfnxga1T+19sBym7nKaVWLsIB36Oi1idpl26A+moxuiKC26uU+RD/YMhSR1hVcRUYIf6/WMZ4gfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UYbpZ1Z+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UYbpZ1Z+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21F631F00A3E;
	Mon, 17 Aug 2026 16:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786983831;
	bh=5ZbK63qtTOSzlzEWZ38AAP/ck4r+B8YTJ60k45sP59k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UYbpZ1Z+pxCgIXfPE0ARzIRsnK7uYtNJJrLazwNR08MFHscNjahO7pIlsnOD2OKv4
	 V4ptlc3bEkzXoQ6Jdj1TD2l/uELPojbcBws3Sl3H9Ssnvjtyw0Txw+zWzodUFbi9Xf
	 OpyK2kVEks+U1PoKsJoPpFrjOWyJ0jpfv4auvWdDK+oABIhwWJ/tHe7TqOTnb8ulSp
	 hv9Dtb7gWwiotZvXrZnm3bfn7tNkK6Ov8xsTz+aL+0he/TzNtio082Ji7Y8Y0bFmlD
	 y31QqZTfUaA3QFa5whowp4P4MMnKR1en/gitOa1Q8UIwx6Vomsa37kpzgco5d4UyCd
	 lW+jR2Ek8+0jg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: pxa: fix double counting of the hw
 descriptors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sascha Hauer" <s.hauer@pengutronix.de>
Cc: dmaengine@vger.kernel.org, Frank.Li@kernel.org, vkoul@kernel.org
In-Reply-To: <20260817-dmaengine-pxa-v1-1-850c215c1196@pengutronix.de>
References: <20260817-dmaengine-pxa-v1-1-850c215c1196@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 16:23:50 +0000
Message-Id: <20260817162351.21F631F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Critical] Removing the manual `sw_desc->nb_desc++` increment breaks the =
driver on compilers without `__builtin_counted_by_ref` support, permanently=
 leaving `nb_desc` at 0 on success and causing out-of-bounds memory corrupt=
ion.

Pre-existing issues:
- [High] In cyclic DMA mode, the updater descriptor is permanently leaked a=
nd its DMA address is mismatched, causing a `dma_pool_free` error and a pot=
ential double-free of the first descriptor's DMA address.
- [High] The driver's teardown sequence leaks DMA channels and creates a us=
e-after-free window in the IRQ handler due to conflicting devm registration=
 and manual cleanup.
--

--- Patch [1]: [PATCH] dmaengine: pxa: fix double counting of the hw descri=
ptors ---
commit 31bd2b3ddeaa75fd6d698e4a2da9964bd5fc7adc
Author: Sascha Hauer <s.hauer@pengutronix.de>

dmaengine: pxa: fix double counting of the hw descriptors

This commit drops a manual increment of nb_desc in pxad_alloc_desc(),
relying on kzalloc_flex() to initialize the counted_by variable. It also
updates the error path to ensure nb_desc accurately reflects allocated
descriptors.

> diff --git a/drivers/dma/pxa_dma.c b/drivers/dma/pxa_dma.c
> index fa2ee0b3e09f8..8252d27be8c3c 100644
> --- a/drivers/dma/pxa_dma.c
> +++ b/drivers/dma/pxa_dma.c
> @@ -752,10 +752,11 @@ pxad_alloc_desc(struct pxad_chan *chan, unsigned in=
t nb_hw_desc)
>  			dev_err(&chan->vc.chan.dev->device,
>  				"%s(): Couldn't allocate the %dth hw_desc from dma_pool %p\n",
>  				__func__, i, sw_desc->desc_pool);
> +			/* Only the descriptors below i have been allocated */
> +			sw_desc->nb_desc =3D i;
>  			goto err;
>  		}
> =20
> -		sw_desc->nb_desc++;

[Severity: Critical]
Does removing this manual increment break the driver on compilers without
__builtin_counted_by_ref() support (such as GCC < 15 or Clang < 19)?

It appears that without compiler support, the kzalloc_flex() macro acts as
a no-op for initializing the counter, which would leave sw_desc->nb_desc as=
 0
on a successful allocation.

If nb_desc remains 0, could this cause out-of-bounds memory corruption later
in set_updater_desc()?

drivers/dma/pxa_dma.c:set_updater_desc() {
	struct pxad_desc_hw *updater =3D
		sw_desc->hw_desc[sw_desc->nb_desc - 1];
...

If nb_desc is 0, this evaluates to hw_desc[-1], which would overlay and
corrupt the adjacent desc_pool pointer in the pxad_desc_sw struct.


[Severity: High]
This isn't a bug introduced by this patch, but does the current driver
permanently leak the updater descriptor in cyclic DMA mode?

During cyclic setup, set_updater_desc() overwrites the ddadr field of the
second-to-last descriptor:

drivers/dma/pxa_dma.c:set_updater_desc() {
	...
	if (sw_desc->cyclic)
		sw_desc->hw_desc[sw_desc->nb_desc - 2]->ddadr =3D sw_desc->first;
	...
}

Later, pxad_free_desc() relies on that overwritten ddadr to find the physic=
al
address for freeing the updater:

drivers/dma/pxa_dma.c:pxad_free_desc() {
	...
	dma =3D sw_desc->hw_desc[i - 1]->ddadr;
	else
		dma =3D sw_desc->first;
	dma_pool_free(sw_desc->desc_pool,
		      sw_desc->hw_desc[i], dma);
	...
}

Could this pass the wrong physical address (sw_desc->first) to
dma_pool_free(), failing to free the updater descriptor and potentially
causing a double-free of the first descriptor's address?


[Severity: High]
This is a pre-existing issue, but does the driver's teardown sequence leak
DMA channels and create a use-after-free window in the IRQ handler?

In pxad_probe(), devres allocates the IRQ before the pxad_chan structures:

drivers/dma/pxa_dma.c:pxad_init_phys() {
	...
	ret =3D devm_request_irq(&op->dev, irq,
			       pxad_chan_handler,
			       IRQF_SHARED, "pxa-dma", phy);
	...
}

On teardown, pxad_remove() manually empties the channel list before the
devm-managed DMA engine unregistration occurs:

drivers/dma/pxa_dma.c:pxad_free_channels() {
	...
	list_del(&c->vc.chan.device_node);
	tasklet_kill(&c->vc.task);
	...
}

When devres later executes dma_async_device_unregister(), does the empty
list cause it to skip unregistering the individual channels?

If the channels are skipped, devres frees the pxad_chan memory while the
IRQ remains registered. Could an interrupt firing in this window cause
pxad_chan_handler() to dereference the freed chan pointer?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817-dmaengine-=
pxa-v1-1-850c215c1196@pengutronix.de?part=3D1
