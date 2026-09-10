Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5E2457E69
	for <dmaengine@vger.kernel.org>; Thu, 10 Sep 2026 21:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789075789; cv=none; b=Il4sLYr8af2IvwdcS2LjIZKzM4Vq2UFxkKIEZgL3/OAE4kL5gkg2EyVDaFx4rM/Zgjv6ipx12RM5GDg1jGy/iWl8LnkPsIltgvr2FThvep3fO8MIHQZfXSyrTdcW9kUbJvZGUIEZNA4TxSq+GxZB5th2AUM2IWfzFKjkb4Pmkug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789075789; c=relaxed/simple;
	bh=NZ146UCey3RgdFUobXquXDJm+JT/10ova9uGzW6V7ts=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=U7tXmIPRVlSYYeaZdCjPrhOJccwZ8qVtaFOmeyjhOye9PolI+32ymR73fOaG8Dx7Qz9QXol6/n34Z7XL9u4TsxZZeFrn1vhCryxutioSuzYBJQnWUgvXBy2rmxIDX+OV+nvoFtn/3OKYsf2GvmyIsT/oirKjFmeRtTLOcccxzd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lPAnEUnQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lPAnEUnQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B30E51F00898;
	Thu, 10 Sep 2026 21:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789075788;
	bh=5hh+5nAzhsVsuwEm0kToniuOFVZEU4SMwKbgzqzcJMM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lPAnEUnQRc8kwwG7Z+eKqCIsq35okXwF07vD4eUO6ME/HXOHD7bEwtyud5E/HKgKM
	 xuf0B5q8CjpV/kwHmKeTiLPVHn3wNlKYVEeYhyOhGUVw/1jOzcocPya9Qik4ntsLM/
	 9cDlwPYx7ODJqV7t3aA3Vix/Tm5TYed2RGx+akhK4XcfEbLPgRWMqIFwIL96Y8QNF7
	 KWQe87IdXNQfT22uqgxHMpKtVvQR2GyIb8vSZlctcJKC1JUwpExmqwNdGkbLSVB25F
	 t6NQxyGxG4rwMVg3t5+vI3ol9kI/z0wabhuvbKyHPKcelmSWX7OoEQkwLuVxaSN0kB
	 WFsSjjgzJMdsA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: ppc4xx: use devm_platform_ioremap_resource()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260910212018.67728-1-rosenp@gmail.com>
References: <20260910212018.67728-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 21:29:47 +0000
Message-Id: <20260910212947.B30E51F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Calling `dma_free_coherent()` with a NULL `adev->dev` pointer in t=
he error path if `devm_platform_ioremap_resource()` fails.
- [High] Missing tasklet_kill on the probe error path leads to Use-After-Fr=
ee of the chan structure.
- [High] Missing free_irq() for the error IRQ if subsequent allocations fai=
l during setup.
- [High] Missing check for dma_map_page() failure.
--

commit ed3114dad8f9fbd2d3d5f92d786754a5f161c4f0
Author: Rosen Penev <rosenp@gmail.com>
Subject: dmaengine: ppc4xx: use devm_platform_ioremap_resource()

This patch replaces the open-coded sequence of of_address_to_resource(),
request_mem_region(), and ioremap() with devm_platform_ioremap_resource().
It also removes unused error codes and simplifies error paths since the
devm framework handles automatic release.

> diff --git a/drivers/dma/ppc4xx/adma.c b/drivers/dma/ppc4xx/adma.c
> index 279a431ccae38..8e6a162396234 100644
> --- a/drivers/dma/ppc4xx/adma.c
> +++ b/drivers/dma/ppc4xx/adma.c
[ ... ]
> @@ -4087,10 +4068,10 @@ static int ppc440spe_adma_probe(struct platform_d=
evice *ofdev)
>  	dev_dbg(&ofdev->dev, "allocated descriptor pool virt 0x%p phys 0x%llx\n=
",
>  		adev->dma_desc_pool_virt, (u64)adev->dma_desc_pool);
> =20
> -	regs =3D ioremap(res.start, resource_size(&res));
> -	if (!regs) {
> -		dev_err(&ofdev->dev, "failed to ioremap regs!\n");
> -		ret =3D -ENOMEM;
> +	regs =3D devm_platform_ioremap_resource(ofdev, 0);
> +	if (IS_ERR(regs)) {
> +		ret =3D PTR_ERR(regs);
> +		initcode =3D PPC_ADMA_INIT_MEMRES;
>  		goto err_regs_alloc;
>  	}

[Severity: High]
This is a pre-existing issue, but does jumping to err_regs_alloc here cause=
 a
NULL pointer dereference?

adev is allocated earlier with kzalloc_obj(), which zero-initializes the me=
mory
and leaves adev->dev as NULL. adev->dev is only assigned after the register
mapping succeeds.

If devm_platform_ioremap_resource() fails, execution jumps to the
err_regs_alloc label:

err_regs_alloc:
	dma_free_coherent(adev->dev, adev->pool_size,
			  adev->dma_desc_pool_virt,
			  adev->dma_desc_pool);

Could passing this NULL adev->dev pointer to dma_free_coherent() cause a ke=
rnel
panic during device probe failure?

[ ... ]
> @@ -4206,19 +4187,12 @@ static int ppc440spe_adma_probe(struct platform_d=
evice *ofdev)
>  	}
>  err_page_alloc:
>  	kfree(chan);

[Severity: High]
This isn't a bug introduced by this patch, but is it possible for a tasklet
to run after the chan structure is freed here?

During probe, the driver initializes a tasklet and successfully registers t=
he
hardware IRQ handler via ppc440spe_adma_setup_irqs(). From this point, an
interrupt can fire and schedule the tasklet asynchronously.

If the subsequent dma_async_device_register() fails, the code jumps to the
err_dev_reg error path, which calls ppc440spe_adma_release_irqs(). This fre=
es
the IRQ, but it doesn't appear to call tasklet_kill(&chan->irq_tasklet) to
synchronize with or cancel any pending or running tasklets.

When execution falls through to err_page_alloc, chan is freed via kfree(cha=
n).
Will a running or pending tasklet then access the freed chan memory, leadin=
g to
a use-after-free?

> -err_chan_alloc:
> -	if (adev->id =3D=3D PPC440SPE_XOR_ID)
> -		iounmap(adev->xor_reg);
> -	else
> -		iounmap(adev->dma_reg);
>  err_regs_alloc:
>  	dma_free_coherent(adev->dev, adev->pool_size,
>  			  adev->dma_desc_pool_virt,
>  			  adev->dma_desc_pool);
[ ... ]

In addition to the changes in the diff, a few pre-existing issues were noti=
ced
in this file during review:

[Severity: High]
This is a pre-existing issue, but should the return value of dma_map_page()=
 be
checked for errors?

In ppc440spe_adma_probe():

	chan->pdest =3D dma_map_page(&ofdev->dev, chan->pdest_page, 0,
				   PAGE_SIZE, DMA_BIDIRECTIONAL);
	chan->qdest =3D dma_map_page(&ofdev->dev, chan->qdest_page, 0,
				   PAGE_SIZE, DMA_BIDIRECTIONAL);

If the system is under heavy memory or IOMMU pressure and dma_map_page() fa=
ils,
it will return an invalid DMA address. Since this address is never verified
with dma_mapping_error(), could the hardware be programmed with an invalid
address, resulting in memory corruption or IOMMU faults?

[Severity: High]
This is a pre-existing issue, but are we leaking the error IRQ in the
ppc440spe_adma_setup_irqs() error path?

If adev->err_irq > 0, the error IRQ is successfully requested using
request_irq(). Later in the function, if of_find_compatible_node() or
of_iomap() fails, the code jumps to err_req2:

err_req2:
	free_irq(adev->irq, chan);
err_req1:
	irq_dispose_mapping(adev->irq);
err_irq_map:
	if (adev->err_irq > 0) {

The err_req2 block calls free_irq(adev->irq, chan) for the primary IRQ, but
it appears to miss calling free_irq(adev->err_irq, chan) for the error IRQ.

If the probe function subsequently fails and frees the chan structure, coul=
d a
firing error interrupt execute the handler with the freed chan pointer, lea=
ding
to a use-after-free?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910212018.6772=
8-1-rosenp@gmail.com?part=3D1
