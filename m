Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B9E4B66EC
	for <dmaengine@vger.kernel.org>; Thu,  3 Sep 2026 14:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788445633; cv=none; b=tg+K/GmJYGxAW2veZ54JdDjnlOBgFpVtI998Lbn1h1g5ycK4F1C52lgkTkxnJlNwJMOwAgT2eR0MRczFZqwB7ihHpNQ0OYxyehMO1p5t16xD9GSSbeVT+L9odOu/WAucVyIIXnZzNyRps7AJws398CjKJciAMci9pTWhHfQRleI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788445633; c=relaxed/simple;
	bh=rKiXXNFBoMcVaZiS0cRHFDQj8bVU3bMiANcA+fljVxY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aypPDvw/U4V1upE5nCyOf4FzFe6JSYXBc87hVyhu9emMSNnP8J/bZ4d7fB1NqMak6tfBCSQvobmqdMZ/4kgvPZVRSysOc40wawUi/SPrIlGupxnXlFKXja/HxS6QLGziAKJGQZDml2XNvFLPEe7LDxgPg5OG57oWtE6OVLCaBiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lN/1h3ht; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lN/1h3ht"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52D9D1F00AC4;
	Thu,  3 Sep 2026 14:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788445613;
	bh=jvrims6ydidqMygf6x/N2/H+WkQxviWJJP9wW6juhb8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lN/1h3htrExV8pfrAyo+U8OLLW7WN3pv6HJ7ilrmtXJ1+wojzwHxcT2uuddG7E+By
	 iilEhdTBTSClE18BOJZYTQ/ZeRzoYobgvxv0vJcD1iCNpI+HTmXv5rPCHVYm+jwp1u
	 iF1PwVPCydop45Qu6McGfmwN+geMAXSMkPL+gBa/1rDMVp8PIFIctfV3iUOss68kDt
	 UIdZBw0gwtyuxZUHKMwKhnozBcuriHFCRZBsVakkDCImwqO0ToMemxt+OfP0AETJM5
	 dooygY3CHNarj6O5ONRkc6C7GmpS99P1tBkNiStFC/Je+4q2s3rq+v3CSNRquiqGka
	 NdKr0hxYe+y7w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] dmaengine: sprd: Remove obsolete 32-bit DMA mask
 fallback
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ruizhe Zhou" <zhouruizhe@resnics.com>
Cc: dmaengine@vger.kernel.org, Frank.Li@kernel.org, vkoul@kernel.org
In-Reply-To: <20260903115441.912500-4-zhouruizhe@resnics.com>
References: <20260903115441.912500-1-zhouruizhe@resnics.com>
 <20260903115441.912500-4-zhouruizhe@resnics.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 14:26:52 +0000
Message-Id: <20260903142653.52D9D1F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Premature IRQ request leading to potential NULL pointer dereferenc=
e and uninitialized spinlock access.
- [Medium] PM runtime usage counter and enabled state leak on the `pm_runti=
me_get_sync()` error path.
--

commit 323a1a8d4f9b18f09fa8dd3e9872da5d0d05321b
Author: Ruizhe Zhou <zhouruizhe@resnics.com>

dmaengine: sprd: Remove obsolete 32-bit DMA mask fallback

This commit removes the obsolete 32-bit DMA mask fallback from
sprd_dma_probe(), relying solely on the 36-bit DMA mask request, while
retaining the error check to report genuine DMA setup failures.

> diff --git a/drivers/dma/sprd-dma.c b/drivers/dma/sprd-dma.c
> index 087fea3af2e41..b9f705dd80e52 100644
> --- a/drivers/dma/sprd-dma.c
> +++ b/drivers/dma/sprd-dma.c
> @@ -1117,11 +1117,8 @@ static int sprd_dma_probe(struct platform_device *=
pdev)
> =20
>  	ret =3D dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(36));
>  	if (ret) {
> -		ret =3D dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
> -		if (ret) {
> -			dev_err(&pdev->dev, "unable to set coherent mask to 32\n");
> -			return ret;
> -		}
> +		dev_err(&pdev->dev, "unable to set 36-bit DMA mask\n");
> +		return ret;
>  	}
> =20
>  	/* Parse new and deprecated dma-channels properties */

[Severity: High]
This isn't a bug introduced by this patch, but looking further down in
sprd_dma_probe(), could the premature IRQ request lead to a NULL pointer
dereference or uninitialized spinlock access if an interrupt fires immediat=
ely?

If an interrupt is pending at the controller level, the handler dma_irq_han=
dle()
will execute as soon as it is requested:

	ret =3D devm_request_irq(&pdev->dev, sdev->irq, dma_irq_handle,
			       0, "sprd_dma", (void *)sdev);

The interrupt handler will then dereference sdev->glb_base, which is mapped
later:

	sdev->glb_base =3D devm_platform_ioremap_resource(pdev, 0);

And it will attempt to acquire the spinlock, which is initialized even late=
r:

	vchan_init(&dma_chn->vc, &sdev->dma_dev);

[Severity: Medium]
This is a pre-existing issue, but does the pm_runtime_get_sync() error path
leak the PM runtime usage counter and leave PM runtime enabled?

	ret =3D pm_runtime_get_sync(&pdev->dev);
	if (ret < 0)
		goto err_rpm;

If pm_runtime_get_sync() fails and returns a negative error code, it jumps
to the err_rpm label:

err_rpm:
	sprd_dma_disable(sdev);
	return ret;

Since pm_runtime_get_sync() increments the usage counter even on failure,
shouldn't this path call pm_runtime_put_noidle() to drop the usage counter,
and balance the earlier pm_runtime_enable() call with pm_runtime_disable()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903115441.9125=
00-1-zhouruizhe@resnics.com?part=3D3
