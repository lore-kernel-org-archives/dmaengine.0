Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C071422E03
	for <dmaengine@vger.kernel.org>; Wed, 15 Jul 2026 18:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784139548; cv=none; b=b9D8uXpqfsnEbYdqkwcyWN6wWe7ba3tozcJQyLmBRQAd7g0k7MRAm/7daVGi6LZl7HiqYHYLy5+/IQYCZsOOlftlqE9uM8fOUNpiJatYd8xFycjXL8xIcZv09sYBmy8qvPcrObScDRENhlsc1Uqqurkb2L9M5we1kmfc1EHlSE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784139548; c=relaxed/simple;
	bh=ldC+o7GI9ksx3T0f+fo0rq+8BfShZV0bEi2IEt4fpYE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=J82X+n9McrnS72gDV4ecgtV7446G4ZoIz7u056PhzEGUz9zx8QZtylTqrRq4LQbiiQvqumvY+1BP1e6hvHTOVew1mP9ElP9t/Aqgh1HXPMa9k0UuAM7nQkZCe+DYMigMsRtwi/aW/EHKtW1aPc7bPfcR2TWs8HVAbYo6sJqVNDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eOmV4dK/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eOmV4dK/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F02911F000E9;
	Wed, 15 Jul 2026 18:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784139546;
	bh=fAJ36lqlmTiXRkZTe0rhHVyItOiMX5ONtcc5AgvrmqQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eOmV4dK/0jYA/CKvn9nNyM8FtkTAPbEOAEgfb4U3DJdMJFtWnHuLj1Y7n6FYSMKMT
	 qSwdXXm8Y9nlEl7ZfstoIBIMxQuX+HPapJHY7S8zwwXRRy/fhNNUi+7Efn9LbF4/6a
	 1wFVSJ8rNWi/WrfIkltVYPhwUtXQs34U2YMRR9AkqyX+sh51FXGZd4g9gdsBhNft8I
	 jtxntQGuw77AxvThKATHcJiDzr4CEQp18/h3a484nzGstizjgR0V0BKYX5cqrlfuWr
	 SgHT6SCtNbr+5pLKD5m/JVMasrZ9hSmv+5CYwJmGcZbqPkQn2n/wUhliiJw0GO4y7i
	 cw1YqU4BEMkiQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 6/9] dmaengine: dw-edma: Clear stale requests on
 termination
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260715175740.1110404-7-den@valinux.co.jp>
References: <20260715175740.1110404-1-den@valinux.co.jp>
 <20260715175740.1110404-7-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 18:19:05 +0000
Message-Id: <20260715181905.F02911F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The PCIe driver fails to validate that the PCI BAR size is large e=
nough to contain the hardcoded offsets and sizes for the DMA linked-list an=
d data regions. A malicious PCIe device can present an artificially small B=
AR, causing the computed iomem pointers to fall outside the mapped region.
--

--- Patch [6]: [PATCH v3 6/9] dmaengine: dw-edma: Clear stale requests on t=
ermination ---
commit c7a703de13f7d742a92f8673efc6a54e5f2e9c63
Author: Koichiro Den <den@valinux.co.jp>

dmaengine: dw-edma: Clear stale requests on termination

This commit fixes a stale request issue where a pending PAUSE request
could survive paths that deconfigure a channel. It ensures that the
request state is cleared whenever termination leaves the channel
deconfigured.

> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-=
edma-core.c
> index 8b0e2af734da9..2369b4c4630b9 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c

[ ... ]

[Severity: High]
This is a pre-existing issue and was not introduced by this patch, but does
dw_edma_pcie_probe() lack validation against the actual PCI BAR length
before computing I/O memory pointers?

Looking at dw_edma_pcie_probe() in drivers/dma/dw-edma/dw-edma-pcie.c:

drivers/dma/dw-edma/dw-edma-pcie.c:dw_edma_pcie_probe() {
[ ... ]
	for (i =3D 0; i < chip->ll_wr_cnt && !non_ll; i++) {
		struct dw_edma_region *ll_region =3D &chip->ll_region_wr[i];
		struct dw_edma_region *dt_region =3D &chip->dt_region_wr[i];
		struct dw_edma_block *ll_block =3D &vsec_data->ll_wr[i];
		struct dw_edma_block *dt_block =3D &vsec_data->dt_wr[i];

		ll_region->vaddr.io =3D pcim_iomap_table(pdev)[ll_block->bar];
		if (!ll_region->vaddr.io)
			return -ENOMEM;

		ll_region->vaddr.io +=3D ll_block->off;
		ll_region->paddr =3D dw_edma_get_phys_addr(pdev, vsec_data,
							 ll_block->bar);
		ll_region->paddr +=3D ll_block->off;
		ll_region->sz =3D ll_block->sz;
[ ... ]
}

If a malicious PCIe or Thunderbolt device presents a spoofed vendor/device
ID with an artificially small BAR, couldn't the computed iomem pointers
fall outside the mapped region?

Should the driver verify that the hardcoded offsets and sizes fit within
the BAR by checking if ll_block->off + ll_block->sz <=3D
pci_resource_len(pdev, ll_block->bar) prior to pointer arithmetic?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715175740.1110=
404-1-den@valinux.co.jp?part=3D6
