Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B658363096
	for <dmaengine@vger.kernel.org>; Wed, 19 Aug 2026 05:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787118432; cv=none; b=lx99khRijPSyaWTLvSwWvolBqkyHWuN5aiwsYDuC5YrAe2AX6ALLh0K0k1TEQKgqvWdBfVKZbFvbSoUVRQqVH9CpX2mRo2crhupFJlfPEEdu3K1+PkY8SPTz6clw30sxH8tAMTwkxbr1XIiPB4pFnQ4dvdy1iy5vjkJKHKKiw+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787118432; c=relaxed/simple;
	bh=we6RcMSrtHjIDJuF5ZxvFhG+LKhV80qxkgSWiegXPPI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XB0fndTkQAxBTqG6r2VwpYT6Sze4Op9QGV1er7ZzgzLqbrIYprsZKTa1m6MwY/JHLRUHiMtf08wTtNrFBB+VCBysXRxyzqhsvVgbPPBMvGSVirYpeSIw8+RG8bs1kHkNizjbLERpT/10zcBxu2XgztdMmmQW1fmVP9PZFX9iKeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fwuYLahD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fwuYLahD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD4D71F000E9;
	Wed, 19 Aug 2026 05:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787118431;
	bh=0FRXhgJLPToavwJyDcOzfwd3Ncb1tLkCbg0q9Oro41o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fwuYLahDdXzJL12c9C8LHdt0KiPt9+Q750Kq3t/AkjeZtx/lxiwAPj6YNC1h4M8qP
	 fRccQ89BIreEOs+EBKRrxsJDhsqmMEuQASUSYyYN4OHuBLft6UoGiMFgdqxUq0yy24
	 vyuFXa9PqB4Ly99D1YWhieO3uzXDEAaCHl83sUrjjldEgBbLvfWekWZeOBerGiIJSp
	 7b5qF7Vca8o8M1x7l5nWwueqFqdhMgAnUFr6plCqD1r4SY9YbI5TUYb/UWEETz4a1M
	 hpwohymWXBcOVvnYxtkwDph+jOpUgkrF/gyupPFLEAicHzNMdU4p3zJXLRTAx0XmLt
	 ZJU63ocfsKxwQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] dmaengine: sprd: use clk_bulk API to fix clock
 imbalance
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chaithanya Lagisetty" <nagachaithanya9911@gmail.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260819053518.2825514-1-nagachaithanya9911@gmail.com>
References: <aoMfW_TVbzkuGZeU@SMW015318>
 <20260819053518.2825514-1-nagachaithanya9911@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 05:47:10 +0000
Message-Id: <20260819054710.DD4D71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] The driver incorrectly enforces a mandatory clock using the option=
al `clk_bulk` API, breaking probe for `!CONFIG_HAVE_CLK` configurations and=
 systems using dummy clocks.

Pre-existing issues:
- [High] The runtime PM usage counter is leaked and PM runtime is left enab=
led if `pm_runtime_get_sync()` fails in `sprd_dma_probe()`.
- [High] The interrupt handler `dma_irq_handle` can be invoked before `sdev=
->glb_base` is mapped, leading to a NULL pointer dereference.
- [High] The driver improperly unlinks DMA channels before calling `dma_asy=
nc_device_unregister()`, breaking the DMA engine core cleanup.
- [High] Failing `pm_runtime_get_sync()` calls do not decrement the usage c=
ount in `sprd_dma_alloc_chan_resources()`, leading to PM runtime counter le=
aks.
--

--- Patch [1]: [PATCH v3] dmaengine: sprd: use clk_bulk API to fix clock im=
balance ---
commit b974e2961641a4c2c3cf6810facb62f07deec1e8
Author: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
Subject: dmaengine: sprd: use clk_bulk API to fix clock imbalance

The commit converts the driver to use the clk_bulk API for managing its clo=
cks
to fix a clock imbalance. This ensures both clocks are properly disabled on
failure paths. The optional ashb_eb clock is fetched alongside the mandatory
enable clock via devm_clk_bulk_get_optional().

> diff --git a/drivers/dma/sprd-dma.c b/drivers/dma/sprd-dma.c
> index 087fea3af2e41..749cabd984ebd 100644
> --- a/drivers/dma/sprd-dma.c
> +++ b/drivers/dma/sprd-dma.c

[ ... ]

> @@ -1140,16 +1120,17 @@ static int sprd_dma_probe(struct platform_device =
*pdev)
>  	if (!sdev)
>  		return -ENOMEM;
> =20
> -	sdev->clk =3D devm_clk_get(&pdev->dev, "enable");
> -	if (IS_ERR(sdev->clk)) {
> -		dev_err(&pdev->dev, "get enable clock failed\n");
> -		return PTR_ERR(sdev->clk);
> -	}
> +	/* The ashb_eb clock is optional and only present for AGCP DMA */
> +	sdev->clks[0].id =3D "enable";
> +	sdev->clks[1].id =3D "ashb_eb";
> +	ret =3D devm_clk_bulk_get_optional(&pdev->dev, ARRAY_SIZE(sdev->clks),
> +					 sdev->clks);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "get clocks failed\n");
> =20
> -	/* ashb clock is optional for AGCP DMA */
> -	sdev->ashb_clk =3D devm_clk_get(&pdev->dev, "ashb_eb");
> -	if (IS_ERR(sdev->ashb_clk))
> -		dev_warn(&pdev->dev, "no optional ashb eb clock\n");
> +	if (!sdev->clks[0].clk)
> +		return dev_err_probe(&pdev->dev, -ENOENT,
> +				     "get enable clock failed\n");

[Severity: High]
Does this manual NULL check break probe for systems without CONFIG_HAVE_CLK=
 or
when dummy clocks are used?

When using devm_clk_bulk_get_optional(), if CONFIG_HAVE_CLK is disabled, the
API returns 0 but sets the clock pointer to NULL. The previous IS_ERR() che=
ck
would safely ignore this, but the new strict NULL check will unconditionally
fail with -ENOENT.

>  	/*
>  	 * We have three DMA controllers: AP DMA, AON DMA and AGCP DMA. For AGCP


While reviewing this patch, I also noticed a few pre-existing issues in the=
 file.

In sprd_dma_probe():

> 	sdev->irq =3D platform_get_irq(pdev, 0);
> 	if (sdev->irq > 0) {
> 		ret =3D devm_request_irq(&pdev->dev, sdev->irq, dma_irq_handle,
> 				       0, "sprd_dma", (void *)sdev);
[ ... ]
> 	sdev->glb_base =3D devm_platform_ioremap_resource(pdev, 0);

[Severity: High]
This is a pre-existing issue, but could this cause a NULL pointer dereferen=
ce
if the interrupt fires immediately?

The interrupt handler dma_irq_handle() dereferences sdev->glb_base to read
SPRD_DMA_GLB_INT_MSK_STS. Because devm_request_irq() is called before
devm_platform_ioremap_resource(), an early interrupt would access the unmap=
ped
glb_base which is still NULL.


Also in sprd_dma_probe():

> 	pm_runtime_set_active(&pdev->dev);
> 	pm_runtime_enable(&pdev->dev);
>=20
> 	ret =3D pm_runtime_get_sync(&pdev->dev);
> 	if (ret < 0)
> 		goto err_rpm;
[ ... ]
> err_register:
> 	pm_runtime_put_noidle(&pdev->dev);
> 	pm_runtime_disable(&pdev->dev);
> err_rpm:
> 	sprd_dma_disable(sdev);
> 	return ret;

[Severity: High]
This isn't a bug introduced by this patch, but does this error path leak the
runtime PM usage counter?

If pm_runtime_get_sync() fails, it still increments the usage count.
Jumping directly to err_rpm skips pm_runtime_put_noidle() and
pm_runtime_disable(), leaving PM runtime enabled and the counter unbalanced.


In sprd_dma_alloc_chan_resources():

> static int sprd_dma_alloc_chan_resources(struct dma_chan *chan)
> {
> 	return pm_runtime_get_sync(chan->device->dev);
> }

[Severity: High]
This is a pre-existing issue, but does this leak the PM usage count if it f=
ails?

Because pm_runtime_get_sync() increments the counter even on failure, direc=
tly
returning its negative error code without calling pm_runtime_put_noidle() l=
eaves
the usage count permanently elevated, preventing the device from suspending.
Should this use pm_runtime_resume_and_get() instead?


In sprd_dma_remove():

> 	list_for_each_entry_safe(c, cn, &sdev->dma_dev.channels,
> 				 vc.chan.device_node) {
> 		list_del(&c->vc.chan.device_node);
> 		tasklet_kill(&c->vc.task);
> 	}
>=20
> 	of_dma_controller_free(pdev->dev.of_node);
> 	dma_async_device_unregister(&sdev->dma_dev);

[Severity: High]
This is a pre-existing issue, but does explicitly removing the channels from
the list here break the DMA engine core cleanup?

The channels are unlinked with list_del() before calling
dma_async_device_unregister(). When the core DMA engine loops over the
channels to free resources (such as sysfs entries), the list is empty, resu=
lting
in leaked channel resources.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819053518.2825=
514-1-nagachaithanya9911@gmail.com?part=3D1
