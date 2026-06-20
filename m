Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580DE2C3757
	for <dmaengine@vger.kernel.org>; Sat, 20 Jun 2026 17:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781975486; cv=none; b=auzCdKNvvOEybj177DaKa6fpAHSpse3Z/s+aGx+CVe+07igSboB1XYeEFcCYBoA+PGrSQALYJcgYo4cTvTgdTirScHiCm3nAZgxzEIz9GXdg6YKMsjUxPo3v11su273nzKUHN6VqYqcPQi+iYg5gErVqowHlpVLoaOje3vYg778=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781975486; c=relaxed/simple;
	bh=dlX9175suov72bXrlH84KZRwKHa7ptJ5WERjgf+V51Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FoifH99RRCENhLube+4FK5WWmNRznktGeO/PZXgqkYgIT2CoJV1Hlu2iSELl3DUUeIItLlZLQKhlnMIO4YiPuOuzk8K87Ub7LAF/aEMsH3KhFipl3NFbH2QK2SDOlQYVeIc7AeOdr4z12y3G/KzchnGMVBLTOwhIjVPacJacwY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MYGGl8E9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MYGGl8E9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2E091F000E9;
	Sat, 20 Jun 2026 17:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781975485;
	bh=nbCmKzdIHIC7+E0wYLDiO35RDfOEy0oBwOEgNn8b9Ss=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MYGGl8E98flo1vePrir4RIHyuqnOjPDJiCeagCVn7DGelnMzaVxWFhFLDyWhZ1lSu
	 7TouGHyPQyx1plzAzbSjaBwD648RuJdYDtCy3922uOFYB58sWJzmhBn6Q54NuK4oue
	 M4mJjv7H34CpTXexTXco7e3iYTn920eBtOI++ib/gAlNlN42p61n0eb/2xL0GEifoG
	 si8TqrJq4dP6s3BQwk7lP1BuDBDRD3vzRtUcRNoC8+c5BAisYQbnJxjTABaSyV4Fbn
	 EwessZqKgIvtpU+Dp821qjHy5OIsckwEs/KsqH/GJgUsIud4pPKZ52DQnHBhWx9UYa
	 S5PVviEoYk0Og==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 07/13] dmaengine: dw-edma-pcie: Add capability match
 data
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260620170040.3756043-8-den@valinux.co.jp>
References: <20260620170040.3756043-1-den@valinux.co.jp>
 <20260620170040.3756043-8-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 20 Jun 2026 17:11:24 +0000
Message-Id: <20260620171124.C2E091F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing pci_free_irq_vectors() cleanup on error paths in dw_edma_p=
cie_probe()
--

commit abe1646ec71967f21d88dc1513ac61dd2092e6d7
Author: Koichiro Den <den@valinux.co.jp>

dmaengine: dw-edma-pcie: Add capability match data

This commit moves device-specific capability parsing behind per-device match
data, splitting it from static template assignment. No functional change
is intended for the existing Synopsys and AMD matches.

> diff --git a/drivers/dma/dw-edma/dw-edma-pcie.c b/drivers/dma/dw-edma/dw-=
edma-pcie.c
> index 0ea8d59782b44..c08a77c0e5085 100644
> --- a/drivers/dma/dw-edma/dw-edma-pcie.c
> +++ b/drivers/dma/dw-edma/dw-edma-pcie.c
[ ... ]
> @@ -469,8 +505,8 @@ static int dw_edma_pcie_probe(struct pci_dev *pdev,
>  			return -ENOMEM;
> =20
>  		ll_region->vaddr.io +=3D ll_block->off;
> -		ll_region->paddr =3D dw_edma_get_phys_addr(pdev, vsec_data,
> -							 ll_block->bar);
> +		ll_region->paddr =3D dw_edma_get_phys_addr(pdev, match,
> +							 vsec_data, ll_block->bar);

[Severity: High]
This is a pre-existing issue, but does dw_edma_pcie_probe() leak IRQ
vectors allocated by pci_alloc_irq_vectors() when it returns directly
on error paths?

Looking at dw_edma_pcie_probe(), after pci_alloc_irq_vectors() succeeds,
there are several error paths that return without calling
pci_free_irq_vectors(pdev).

For example, if mapped BAR addresses are NULL when checking chip->reg_base,
or when returning -ENOMEM inside the region mapping loop shown above:

    chip->reg_base =3D pcim_iomap_table(pdev)[vsec_data->rg.bar];
    if (!chip->reg_base)
        return -ENOMEM;

Since system IRQ capacity is limited, could repeated probe failures on
these paths exhaust system-wide IRQ vectors and prevent other devices
from functioning?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260620170040.3756=
043-1-den@valinux.co.jp?part=3D7
