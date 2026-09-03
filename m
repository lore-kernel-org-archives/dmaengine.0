Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462414B8DC3
	for <dmaengine@vger.kernel.org>; Thu,  3 Sep 2026 14:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788445773; cv=none; b=T2PvS8S3jfhvLopvDKCBW1SL60hSzGTrj4lMVDZSOvA/efM2z+DEBBIe4ig0+SnyIEVnwUNskqQFi0RNyZeRrFOOvLwH6lvcEXxcOkOVHfg9hk4J/flrzrFc7iG7gHVKs7dTAu5fUtHcaKJoyuR4FYNkNoBxt+peNERySainXck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788445773; c=relaxed/simple;
	bh=/hJPIuvYLBhyjRCYDjrKVQuhAJJXpqKujuUmSpsEn3U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=U16AldpiJHyxpNiqyUhuy/QzV/wJ+0eQXOfLAirDgex6137AUdohOAquXXa9BH5X8HTpWijMtDWF3Nfg7XI15ngnNwsF9uN1S3LQjOarL+V0CX150guw3DsdDa+eidB2I1gegbgVB11vxy2dMAwO07QHsj5oRpeqohSqHaWPzAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ODCZu/Ab; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ODCZu/Ab"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 527961F00ACA;
	Thu,  3 Sep 2026 14:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788445766;
	bh=zfoIX2IReUKxBCh0UMs82nS2cLdGjQHHbmzp6daM0XI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ODCZu/AbWUddHZ0+YQPZnur9Pk2YzOlB+lVyLY/x+XU8mkWGreEqNMralWVBXidHJ
	 5r+1SUDNItXSvvCvJ+OnpH78gF+2WQ/FEB26V8QMf6bS8HW+F9BMIYtdnxhVQQB96R
	 Y9vV/ILJL4pnN3VvUfKsi3mvqhmbIBY9hIo6FCWasjq2taa7dDx+P8N6eZqb4tHTE3
	 etgOalN8q4b1RDvIdfwQgTDimCohfFS7wTRO13sNAOu7D0fW8tOPkDX2DVUYQMhExl
	 FCWYgRglRyG5X4db/cfboGttJgrycs/0Xdusjgnz+uHaftKZtjsQG/NHb/mQ+nfq7/
	 xbNYbarnn9C8w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] dmaengine: plx_dma: Remove obsolete 32-bit DMA mask
 fallback
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ruizhe Zhou" <zhouruizhe@resnics.com>
Cc: dmaengine@vger.kernel.org, Frank.Li@kernel.org, vkoul@kernel.org
In-Reply-To: <20260903115441.912500-3-zhouruizhe@resnics.com>
References: <20260903115441.912500-1-zhouruizhe@resnics.com>
 <20260903115441.912500-3-zhouruizhe@resnics.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 14:29:24 +0000
Message-Id: <20260903142925.527961F00ACA@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Potential NULL pointer dereference in plx_dma_isr() because the in=
terrupt handler is registered before plxdev->bar is initialized.
--

commit ebe0c3fecaf3a5fe091d793b49cde50217868ab8
Author: Ruizhe Zhou <zhouruizhe@resnics.com>

dmaengine: plx_dma: Remove obsolete 32-bit DMA mask fallback

The DMA API guarantees support for masks of 32 bits or wider. This commit
removes the obsolete 32-bit DMA mask fallback while retaining the error
check so that a genuine DMA setup failure is still propagated.

> diff --git a/drivers/dma/plx_dma.c b/drivers/dma/plx_dma.c
> index 84941a918b01f..ad9187448ed20 100644
> --- a/drivers/dma/plx_dma.c
> +++ b/drivers/dma/plx_dma.c
> @@ -562,8 +562,6 @@ static int plx_dma_probe(struct pci_dev *pdev,
>  		return rc;
> =20
>  	rc =3D dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(48));
> -	if (rc)
> -		rc =3D dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
>  	if (rc)
>  		return rc;
> =20

[Severity: High]
This is a pre-existing issue, but is there a potential NULL pointer
dereference in plx_dma_isr() due to the order of initialization in
plx_dma_create()?

When plx_dma_probe() calls plx_dma_create(), the interrupt handler is
registered before plxdev->bar is initialized:

drivers/dma/plx_dma.c:plx_dma_create() {
    ...
    rc =3D request_irq(pci_irq_vector(pdev, 0), plx_dma_isr, 0,
                     KBUILD_MODNAME, plxdev);
    if (rc)
        goto free_plx;

    ...
    plxdev->bar =3D pcim_iomap_table(pdev)[0];
    ...
}

If an interrupt triggers immediately after request_irq() (e.g., from a
spurious interrupt or a pending interrupt left by a previous kernel/kexec),
the handler will execute:

drivers/dma/plx_dma.c:plx_dma_isr() {
    ...
    status =3D readw(plxdev->bar + PLX_REG_INTR_STATUS);
    ...
}

Since plxdev is zero-allocated and plxdev->bar is initialized only after
the IRQ is registered, could this cause a kernel panic due to a NULL
pointer dereference? Should the driver state be fully initialized before
unmasking the interrupt?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903115441.9125=
00-1-zhouruizhe@resnics.com?part=3D2
