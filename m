Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE42517B43F
	for <dmaengine@vger.kernel.org>; Thu, 21 May 2026 07:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779346992; cv=none; b=oloU41nl6EMq99NtQiEMnI+PL6IRiTmXpx+s2LUYEviJA2ty2jOBB5SWxNQ9rByTGCdqm0utFKcr8uoNfGgfpCQfTUwYy1Pqrss45kjHYW6GVgIGXs8qsg2gnHJAnohh4S0QCtEmKcmMIccYSb653tG4/ChETCZQ2V64uDZrBBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779346992; c=relaxed/simple;
	bh=Us95u1/qxKPSCZqNOVgfmjPQakiqJpCY9CKG+9tsFnA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=i8/y3huKnPPDmNx1Ze78rzWX++9NBVoi5oH5n62j5WZZDilb5xP+pTtd6DtatnKCuUz/a5RZcJ8I0YeYRVuNoGFNCB9JTvzo51W02uowV+ucRLcb3qvoUf3eIlETg7yS7Ypt5m8d0fo+1y8/HD1UqeY4viJXxLHiVGR6c4DX3JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kJAn1mMY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kJAn1mMY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CF881F000E9;
	Thu, 21 May 2026 07:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779346991;
	bh=xrwBP7oDqT+xhmvIwodlpZzrOlCgqEK5kc1DvGBDlIE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kJAn1mMYQVhEUQAidz5NsEIVH7gwjYajSmhtfuQRPaKgleE4O8DGBKfPYeHJMt/je
	 hEB5PdT9fvF7IsUKL7dWwf/xw/uEeHN++iMnWa63fSlaFHS3KVq1DC+Hkz9Gp3oZLD
	 6w6hnmTSaXYtTSxmy9lsCVungNVZIz9iSjE1KTx/rgVYj2XWbUeTAkgvxFMSR/Xm/C
	 O54+k6TjMdO3uhqMucejYDSW9FJD7onpubNYW8ljmAH6J28iH2WrOKUt2chTwt+vjT
	 dfQARhphZEQAiDwd9R37jRQvvTcB4NDcM3P3zbF6xp42Z2g7FKi+RLfoJIkRlQ/Wzd
	 018Nr4+Pw3UKQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 12/12] dmaengine: dw-edma-pcie: Add chip flags match
 data
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260521063115.2842238-13-den@valinux.co.jp>
References: <20260521063115.2842238-13-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 07:03:10 +0000
Message-Id: <20260521070311.2CF881F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing pci_free_irq_vectors() on error paths in dw_edma_pcie_prob=
e() causes IRQ resource leak.
--

commit d8cbd780b5a68286e708214b11a9459c55d2af3b
Author: Koichiro Den <den@valinux.co.jp>

dmaengine: dw-edma-pcie: Add chip flags match data

Allow PCI ID match data to pass dw_edma_chip flags into dw_edma_probe().
This keeps per-device policy in the match data instead of open-coding it
in probe().

> diff --git a/drivers/dma/dw-edma/dw-edma-pcie.c b/drivers/dma/dw-edma/dw-=
edma-pcie.c
> index df02b244e7487..2f752e8fb999c 100644
> --- a/drivers/dma/dw-edma/dw-edma-pcie.c
> +++ b/drivers/dma/dw-edma/dw-edma-pcie.c
[ ... ]
> @@ -455,6 +456,7 @@ static int dw_edma_pcie_probe(struct pci_dev *pdev,
>  	chip->dev =3D dev;
> =20
>  	chip->mf =3D dma_data->mf;
> +	chip->flags =3D match->chip_flags;
>  	chip->default_irq_mode =3D match->default_irq_mode;
>  	chip->nr_irqs =3D nr_irqs;
>  	chip->ops =3D match->flags & DW_EDMA_PCIE_F_RAW_SLAVE_ADDR ?

[Severity: High]
This is a pre-existing issue, but does this function leak IRQ vectors
on error paths?

In dw_edma_pcie_probe(), pci_alloc_irq_vectors() successfully allocates
MSI/MSI-X IRQ vectors. However, multiple subsequent error paths return
directly without calling pci_free_irq_vectors() to clean up.

For example, when pcim_iomap_table() fails later in the function:

	chip->reg_base =3D pcim_iomap_table(pdev)[dma_data->rg.bar];
	if (!chip->reg_base)
		return -ENOMEM;

Should these error paths call pci_free_irq_vectors() before returning
to prevent exhausting system IRQ capacity?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521063115.2842=
238-1-den@valinux.co.jp?part=3D12
