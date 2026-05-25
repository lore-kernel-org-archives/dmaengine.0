Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15ED330646
	for <dmaengine@vger.kernel.org>; Mon, 25 May 2026 06:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779691849; cv=none; b=LUUGA2pvPWQXImAitzU0mmu1MOc+C2HB2qqG0KmoYH7IbHu69QHmp9xFIZbcip/j8UIT3f1mXyWzfXyfy2N3WyNBfAlMRVajnEN7yGju4Dc1emAd8XISuz2aaZmqMjhlokNiLvVXWQIdGg9ybgNfQ18cnXdaT7UFDDqwq4uVm+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779691849; c=relaxed/simple;
	bh=t298t0W26tZt57rhd9c+7SwddVv2Nk7Olbuvye3AQyo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mMwECQw8xRpRyQykyG0GwJ9opM3RHK4cR8rQ3vMpS92KT5m0Kd0dXc+ap0nvh6oyqv3PXOHmohqy6KTKPOQeBC2E773K5LB0KMjan7fsqveMal7AXxlT/w01lvnUgjsZzFvOiKfyXL7cBfQS4kUbAbPrHf6Dcc2X9cSHn/L3YLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iYt9WzGz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iYt9WzGz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EC081F000E9;
	Mon, 25 May 2026 06:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779691842;
	bh=g0IQG96PCL7P3uqRk1udf1myQGNVnojzjzzMUT06T0w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iYt9WzGzPKFJInjipRA9jCQEb6bKI81dEWxmXBPUcJ1Y8ql5qzS1CH6OiB0jwAj9C
	 Ecw3jaB7vBF1DRqQ/bDnaCYVeyqHCyFzHdM5UWzD15q6PPrr3ntu/rcmJTCdUN9bHf
	 Mtni/bC3UMkqQykOtukljJj2oTD2kouLGvtxQoG06PlnkGU6RLRYsvocjZwvugn1r4
	 ZPfzKlxoQgXuk2JT+ZwAMTApD8jaXj7FMe/9RijAw1pOQB4WfABwCpn9yaQM4UJ+eE
	 5n7T/6PosBCCBE33+/R/+4bhFMWvjeaGS0wZaITKwdi0Kdkw/WX/u0mTfTaYu9X4kH
	 DF0OYbjZNPekw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 11/12] dmaengine: dw-edma-pcie: Handle optional data
 blocks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260525062420.3315904-12-den@valinux.co.jp>
References: <20260525062420.3315904-12-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 06:50:41 +0000
Message-Id: <20260525065042.0EC081F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing pci_free_irq_vectors() cleanup on error paths after succes=
sful allocation.
--

commit c948e6ae1060117f0578593dbfba081c04f767d4
Author: Koichiro Den <den@valinux.co.jp>

dmaengine: dw-edma-pcie: Handle optional data blocks

This commit updates the dw-edma-pcie driver to handle optional data blocks
by skipping data block BAR mapping and debug output when a channel has a
zero data block size. This enables future providers to describe channels
that only need descriptor memory exposed.

> diff --git a/drivers/dma/dw-edma/dw-edma-pcie.c b/drivers/dma/dw-edma/dw-=
edma-pcie.c
> --- a/drivers/dma/dw-edma/dw-edma-pcie.c
> +++ b/drivers/dma/dw-edma/dw-edma-pcie.c
[ ... ]
> @@ -478,6 +480,9 @@ static int dw_edma_pcie_probe(struct pci_dev *pdev,
>  							  ll_block);
>  		ll_region->sz =3D ll_block->sz;
> =20
> +		if (!dt_block->sz)
> +			continue;
> +
>  		dt_region->vaddr.io =3D pcim_iomap_table(pdev)[dt_block->bar];
>  		if (!dt_region->vaddr.io)
>  			return -ENOMEM;

[Severity: High]
This is a pre-existing issue, but does this error path leak the allocated
IRQ vectors?

Earlier in dw_edma_pcie_probe(), pci_alloc_irq_vectors() is called
successfully, but this return and others further down in the probe function
(such as when pci_dev_msi_enabled() or dw_edma_probe() fail) do not call
pci_free_irq_vectors() before returning.

Failing to free these vectors in error paths can prevent future allocations
and potentially exhaust system IRQ capacity.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525062420.3315=
904-1-den@valinux.co.jp?part=3D11
