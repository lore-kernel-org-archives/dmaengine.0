Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5293B457E72
	for <dmaengine@vger.kernel.org>; Thu, 10 Sep 2026 21:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789075643; cv=none; b=izc4JLduhuYgPafEaMY8d5u+rAJBLJlcLLwR1S7zG2QpjDFzY+Tf1fhHxjugL5+SYAwfAoxdYBjCYmH/cqj28dktmxRsfD9DZhsd1UxQ8n7EWXXnAbfHlsLS+yNJOGCRg6Noa7e2BNp2p8fS++W19dpBKCPIvbKr2lGmj378u58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789075643; c=relaxed/simple;
	bh=n86bb0jlN8OHuQ51PPzeG3kBFeDtIJXp96QKrtelbEs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tUXW7baTI4JW/FLqRjxRWdaJbNHd33pQFfCx9YPcOkitNT3TrIXaHXXSVPXgIL71jCCERPe3Ww75NMCgwJHVW6bDr6OUhONbogSjJABGJLN/Pse+1XeZnBsxzCn4TVZ2x1lR5FOilP9wCQ3ZrjnIgSLA3z+j9oGvS47O9M6odZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SvDigolL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SvDigolL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB6381F000FF;
	Thu, 10 Sep 2026 21:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789075642;
	bh=e+aX0AIDGryN9+kABdO6wtfRBFxcWnmq2siL+XDnFGg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SvDigolL4xECZjHoAYTFkdQwKaRze4yqxfixFIu+MM+pjyHVMs6Xma+hAoPleBHFe
	 4EbzkHG24e8yqUfUxEU9/1RM4N8mE3Lub4zGja9cnmiyGH05zag8zRqeKKIMmLszWw
	 YxDQFhStJz+yVBJJNUM8DfUzFBrcd56FWFFLvRhpX0rTySDcz8czns/xVsUqyk3mlo
	 e91jPKUU6VuAl0It7TLZOETDwkfp0LAZJozMpiHsN5GuzFHgjnldheS45iNf5JCATM
	 CyUecuuUBKk3BQTD760uB4FYyR7zu1aC6zK0FnCUQ+l82mHb4VW3DMx8iBYYQSQC0I
	 cyNbX6fePeefA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: ppc4xx: fix format specifiers for size_t
 arguments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260910211440.65618-1-rosenp@gmail.com>
References: <20260910211440.65618-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 21:27:21 +0000
Message-Id: <20260910212721.BB6381F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing check for dma_map_page() failure in device probe.
- [High] Calling dma_free_coherent() with an uninitialized (NULL) device po=
inter in the ioremap error path.
- [High] Missing free_irq() for adev->err_irq in the error path of ppc440sp=
e_adma_setup_irqs.
--

commit 6506d0727c09a20b6e812b6d3009a7ffe42bfacf
Author: Rosen Penev <rosenp@gmail.com>

dmaengine: ppc4xx: fix format specifiers for size_t arguments

Several dev_err, dev_dbg, pr_debug, and printk calls use %d or %u format
specifiers for size_t arguments. Fix them to use %zu to avoid warnings
on 64-bit builds.

> diff --git a/drivers/dma/ppc4xx/adma.c b/drivers/dma/ppc4xx/adma.c
> index 279a431ccae38..bcc54d584e2bf 100644
> --- a/drivers/dma/ppc4xx/adma.c
> +++ b/drivers/dma/ppc4xx/adma.c
[ ... ]
> @@ -4077,7 +4077,7 @@ static int ppc440spe_adma_probe(struct platform_dev=
ice *ofdev)
>  					adev->pool_size, &adev->dma_desc_pool,
>  					GFP_KERNEL);
>  	if (adev->dma_desc_pool_virt =3D=3D NULL) {
> -		dev_err(&ofdev->dev, "failed to allocate %d bytes of coherent "
> +		dev_err(&ofdev->dev, "failed to allocate %zu bytes of coherent "
>  			"memory for hardware descriptors\n",
>  			adev->pool_size);
>  		initcode =3D PPC_ADMA_INIT_COHERENT;

[Severity: High]
This isn't a bug introduced by this patch, but while looking at
ppc440spe_adma_probe(), I noticed we map the destination pages without
checking for mapping errors:

    chan->pdest =3D dma_map_page(&ofdev->dev, chan->pdest_page, 0,
                               PAGE_SIZE, DMA_BIDIRECTIONAL);
    chan->qdest =3D dma_map_page(&ofdev->dev, chan->qdest_page, 0,
                               PAGE_SIZE, DMA_BIDIRECTIONAL);

If the mapping fails, it returns an error address. Does this mean the
hardware might be configured with an invalid DMA destination, potentially
causing memory corruption or IOMMU faults?

Should we be validating the return values with dma_mapping_error()?

[Severity: High]
This is another pre-existing issue in ppc440spe_adma_probe(), but I'm
curious about the error handling if ioremap() fails:

    regs =3D ioremap(res.start, resource_size(&res));
    if (!regs) {
        dev_err(&ofdev->dev, "failed to ioremap regs!\n");
        ret =3D -ENOMEM;
        goto err_regs_alloc;
    }

This jumps to err_regs_alloc before adev->dev is initialized, where we do:

err_regs_alloc:
    dma_free_coherent(adev->dev, adev->pool_size,
                      adev->dma_desc_pool_virt,
                      adev->dma_desc_pool);

Since adev->dev is still NULL at this point, could this cause a crash
in dma_free_coherent() when trying to resolve the DMA operations?

[Severity: High]
A third pre-existing issue I noticed is in the error path of
ppc440spe_adma_setup_irqs(), which is called from this probe function.

If we fail to find the device tree node after successfully registering
adev->err_irq:

    np =3D of_find_compatible_node(NULL, NULL, "ibm,i2o-440spe");
    if (!np) {
        pr_err("%s: can't find I2O device tree node\n", __func__);
        ret =3D -ENODEV;
        goto err_req2;
    }

We jump to err_req2, which frees adev->irq but misses freeing adev->err_irq:

err_req2:
    free_irq(adev->irq, chan);
err_req1:
    irq_dispose_mapping(adev->irq);
err_irq_map:
    if (adev->err_irq > 0) {
        if (atomic_dec_and_test(&ppc440spe_adma_err_irq_ref))
            irq_dispose_mapping(adev->err_irq);
    }

Since the probe function later frees the chan structure on failure,
could this leave a dangling interrupt handler pointing to the freed
chan pointer?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910211440.6561=
8-1-rosenp@gmail.com?part=3D1
