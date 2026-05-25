Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18E672627
	for <dmaengine@vger.kernel.org>; Mon, 25 May 2026 06:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779691340; cv=none; b=NkqVLzlYmp88ifmbfy4SMvQeOLvNMiGwOvNdMT1D9dgnG4Iq23AQdjWRUG3RT+XMVXpEKVA7idOzXBoeOw77Q0TW3XLgoAV5b3DCTdDbuaBCG6MPswmoiejamVAPb0iOk4+kQvTLtIUvQd7ajWZtCyaWZtOukYRTHNQA9frLW0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779691340; c=relaxed/simple;
	bh=9WzADrZdjdUfH12/+qDWM3o4Ogj8BkrLi/iCGgVDX24=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cwGZV0b+3+/ZSegcucWJIN8FSNnFJi1iTqAWVadBlKKHK9FEA8CwR0W+G1r8Skm2gCmnaP5hTgU/n0eNbLOFef0Pdn1mJTNKWiult6Hfd7zUl2MtEUQT1n6Z/Zzy8tul/Rv7gclf1RjlLUiPPYtyzIQpXsEI8iiPfJITR4xP1ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PeLk3ss2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PeLk3ss2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0ECC1F000E9;
	Mon, 25 May 2026 06:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779691339;
	bh=bCdgkH9nmAyRn0yQWFmQu8U4I2xX4E8tFs1CsZyoCCw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PeLk3ss2DX2B6SqLkgcSSE/T4mIzOVkF3cRbTeT5YHYQI1nt0sFoR3HGnjQZEnLoE
	 AcCfH/cl6ujaGHMRmRUdID4TuiSZkSRUVd1gBVKVHM1idz65Qa1kaIQ2l2jGDUgngY
	 ZFPD/S2imEgt5PXSvlELehfxovv+eyn02o4TE494dds4sei73sasB9kmNjaGIBsfgP
	 8tsV3sLmh4lzOx3FJ/gbeNVYEliKrFsIpPBwJCZDfCx9lCHO6jkfVhM+CAaXq327CU
	 S3J3Lj0pqZppZT6rVHE1vTtbMFbi6B1n81zVPlLAaIWysmmpbzZfH6T/A4iyz+7dTU
	 g0LTUvb5ukyZA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 06/12] dmaengine: dw-edma-pcie: Rename vsec_data to
 dma_data
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260525062420.3315904-7-den@valinux.co.jp>
References: <20260525062420.3315904-7-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 06:42:18 +0000
Message-Id: <20260525064218.E0ECC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing pci_free_irq_vectors() cleanup in error paths after succes=
sful IRQ vector allocation.
--

commit 604d26e7f01e5ab8ae5de683ae38cd18428a8d21
Author: Koichiro Den <den@valinux.co.jp>

dmaengine: dw-edma-pcie: Rename vsec_data to dma_data

This commit renames the local data copy from vsec_data to dma_data in
dw_edma_pcie_probe() before adding endpoint DMA BAR metadata discovery.

> diff --git a/drivers/dma/dw-edma/dw-edma-pcie.c b/drivers/dma/dw-edma/dw-=
edma-pcie.c
> --- a/drivers/dma/dw-edma/dw-edma-pcie.c
> +++ b/drivers/dma/dw-edma/dw-edma-pcie.c

[ ... ]

> @@ -422,7 +420,7 @@ static int dw_edma_pcie_probe(struct pci_dev *pdev,
>  		return -ENOMEM;
> =20
>  	/* IRQs allocation */
> -	nr_irqs =3D pci_alloc_irq_vectors(pdev, 1, vsec_data->irqs,
> +	nr_irqs =3D pci_alloc_irq_vectors(pdev, 1, dma_data->irqs,
>  					PCI_IRQ_MSI | PCI_IRQ_MSIX);
>  	if (nr_irqs < 1) {
>  		pci_err(pdev, "fail to alloc IRQ vector (number of IRQs=3D%u)\n",

[ ... ]

> -	chip->reg_base =3D pcim_iomap_table(pdev)[vsec_data->rg.bar];
> +	chip->reg_base =3D pcim_iomap_table(pdev)[dma_data->rg.bar];
>  	if (!chip->reg_base)
>  		return -ENOMEM;

[Severity: High]
This is a pre-existing issue, but does this function leak IRQ resources
on error paths?

It appears pci_alloc_irq_vectors() is successfully called earlier, but if
subsequent steps fail (such as the pcim_iomap_table() lookups returning NULL
here, or dw_edma_probe() failing later on), the function returns directly
without calling pci_free_irq_vectors().

Should these error paths be updated to ensure the allocated vectors are
properly cleaned up before returning?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525062420.3315=
904-1-den@valinux.co.jp?part=3D6
