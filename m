Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D003750AF
	for <dmaengine@vger.kernel.org>; Fri, 17 Jul 2026 05:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784265159; cv=none; b=d9TA4sh9GhXBPCY+mz1ztW65A48macmtL3jiOsoE158BXpZYelqhjpLu6W1hJ2wdDzTgU6mh4ywYT0LlTrXaKtDFNmoQOmmfWTymwbOa3MhgcFoEL4EqBuA4TDAO/u/qfluIt7FDtK3u+k5u4UpUt9WqIk72X76CqQgUEQqBnR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784265159; c=relaxed/simple;
	bh=p8cMmBfPp748zx+FFG3m6UVDqpCzLk5LRebZHVpshTU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Vb0kTmvkeEuwXwIrs04NOknyUAXGy4ji+KT1ikqMvAcDHydGq1Rh/tfhzX5ZQfJJEze9dbrIcaSjX3FoRtTsCtEjO+rDM6aLHwcb+5dVwtxiNS5KBAEp4UcEUfLLin82s2146coYHgLe+7vwy2LU7s16X4b91jzqsOzpvfPzWaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ckH0fLi+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ckH0fLi+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C85711F00A3A;
	Fri, 17 Jul 2026 05:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784265158;
	bh=EdkYCw/6OoJOP+i/Cyon1G4O6/0GAYLtgBiPftVMAmE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ckH0fLi+hbF3CyQO+dbKyIpyB8GSv2I6N+ytpMgtcVKJY2EnogaDRWwTPowr/VVxs
	 zhgAH24vH4VZ8nEV2JzYwt+e1NjvR/kXRZRfjJAgYxPUErYfOCUz+SPqf9J/IcUQdR
	 m4zzrPXDRf0PtE/FLaUPWRPDp9CQyNCExpsMxFpnOazefqLYWRgNUPSecJRdrNa7VI
	 MmfW6MsIMXZGJA5mDmJpvwcuDrkGYp851lY1SDkthTB7ZpH75xHOEPhSwNNS717qEy
	 EghrAxW3BQygfH/HYANTXyvNLDQBDCY5dfP+l5AuRXzpyXS7lONFotba2GzVRQOXOn
	 ml4GxK80jGvDw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 07/14] dmaengine: dw-edma-pcie: Add capability match
 data
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: dmaengine@vger.kernel.org, Frank.Li@kernel.org, vkoul@kernel.org
In-Reply-To: <20260717050308.2144108-8-den@valinux.co.jp>
References: <20260717050308.2144108-1-den@valinux.co.jp>
 <20260717050308.2144108-8-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 05:12:37 +0000
Message-Id: <20260717051237.C85711F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing pci_free_irq_vectors() cleanup on error paths in the probe=
 function.
--

--- Patch [7]: [PATCH v5 07/14] dmaengine: dw-edma-pcie: Add capability mat=
ch data ---
commit 352070c0889b8cd6fe579fca832e28f5f50ba2e5
Author: Koichiro Den <den@valinux.co.jp>

dmaengine: dw-edma-pcie: Add capability match data

This commit moves device-specific capability parsing behind per-device
match data to avoid mixing static templates with vendor checks. It splits
these decisions so device-specific discovery can be added through match
data instead of adding more vendor checks.

> diff --git a/drivers/dma/dw-edma/dw-edma-pcie.c b/drivers/dma/dw-edma/dw-=
edma-pcie.c
> --- a/drivers/dma/dw-edma/dw-edma-pcie.c
> +++ b/drivers/dma/dw-edma/dw-edma-pcie.c

[ ... ]

> @@ -441,8 +477,8 @@ static int dw_edma_pcie_probe(struct pci_dev *pdev,
>  			return -ENOMEM;

[Severity: High]
This is a pre-existing issue, but does this error path leak the IRQ vectors
allocated earlier in dw_edma_pcie_probe()?

If pcim_iomap_table() fails, we return -ENOMEM directly without calling
pci_free_irq_vectors(). Failing to free them can permanently reduce the
system's available IRQ capacity. Should these error paths be updated to
properly clean up the allocated IRQ vectors?

> =20
>  		ll_region->vaddr.io +=3D ll_block->off;
> -		ll_region->paddr =3D dw_edma_get_phys_addr(pdev, vsec_data,
> -							 ll_block->bar);
> +		ll_region->paddr =3D dw_edma_get_phys_addr(pdev, match,
> +							 vsec_data, ll_block->bar);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717050308.2144=
108-1-den@valinux.co.jp?part=3D7
