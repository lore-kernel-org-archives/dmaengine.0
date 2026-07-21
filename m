Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9740241737C
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 06:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784616304; cv=none; b=ij64PD0OdCjegR0k7QLSHA49awxg7o0YQP8N9O6Yt6Qnwe8jRmKdXN8pAJcDMzEOCWJQWJyAMwNCA9fLsu1sf37m4rdtMrL8jdXeCABKQxFFXXNst1xMJHskL8Tq0USdYydFipr4TLzKNNR59Eaw/p31ozEg/C4w2h1Rey4uQms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784616304; c=relaxed/simple;
	bh=pxBC6sI7/BiFZ8LooZMx9s1q/FX0lnzqoftwMnuzY28=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oyv6guS0dgjaFKd+rliNWsWkBuc0vczn8ODVkte493gtW2Y7KwMLxz6rY2DmfggffUbe6HnLqnv6dfGi+fp99TlZReBaVVAzK7q8Y1vjWMgfE4c5Uk1AtutNSzsRkgC90p8EfyOJf5VSu3v/1+RNletzBCgEMgsR3MTOhDtW4+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a+6auro+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a+6auro+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E56821F000E9;
	Tue, 21 Jul 2026 06:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784616303;
	bh=ghmv6ITATXvC7Rscz0RRtZ6KSnWsIOgAAgcqdnOs8fE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a+6auro+I/TstXvdhBIJgbrAJnLH5f0qkOO31Orzp+6Dm/ewZi5uST0F6DMxEJrXn
	 BfE8WcyKLDN5lXCTQtElaqYWmUvpHZpSqGm3/mPB0LaUBErw+wU2JB1wF4n556N/zb
	 oACcU5NdPklyAL12ecOPBGqQIZmGvcrLnK8fTQmPG2ATA/M4+orvkyc4yEUKO1dj9l
	 p8ah02kqFo4tRkXkTulz9tl4yZVekyPdEr5UVIylYHfzxzSpZ81kFMBYgof1DQXRPV
	 ygn7xHnegYAbhVbLQ7e5CCpjfkDc6PYi6oUKfkzFsEibsbLISqmkaL8RtnuSZXlJdt
	 eVxn81hacDoQg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 10/14] dmaengine: dw-edma-pcie: Add register offset
 match flag
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260721062815.4117887-11-den@valinux.co.jp>
References: <20260721062815.4117887-1-den@valinux.co.jp>
 <20260721062815.4117887-11-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 06:45:02 +0000
Message-Id: <20260721064502.E56821F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] IRQ vectors allocated by `pci_alloc_irq_vectors()` are leaked on e=
rror paths and during device unbinding.
--

--- Patch [10]: [PATCH v6 10/14] dmaengine: dw-edma-pcie: Add register offs=
et match flag ---
commit 96fe59ecf68ecec537def0ad5937dd1f7c596bd9
Author: Koichiro Den <den@valinux.co.jp>

dmaengine: dw-edma-pcie: Add register offset match flag

Add a match-data flag for devices whose DMA register block starts at an
offset inside the mapped BAR. Existing Synopsys EDDA and AMD (Xilinx)
MDB/CPM6 matches keep using the BAR mapping base directly.

> diff --git a/drivers/dma/dw-edma/dw-edma-pcie.c b/drivers/dma/dw-edma/dw-=
edma-pcie.c
> index 99ddb6e6da348..4b2757c1eda28 100644
> --- a/drivers/dma/dw-edma/dw-edma-pcie.c
> +++ b/drivers/dma/dw-edma/dw-edma-pcie.c

[ ... ]

> @@ -464,6 +465,8 @@ static int dw_edma_pcie_probe(struct pci_dev *pdev,
>  	chip->reg_base =3D pcim_iomap_table(pdev)[dma_data->rg.bar];
>  	if (!chip->reg_base)
>  		return -ENOMEM;

[Severity: High]
This is a pre-existing issue, but does this error path leak IRQ vectors?

Looking at dw_edma_pcie_probe(), pci_alloc_irq_vectors() is called earlier
in the function to allocate IRQ resources. However, this direct return on
failure bypasses releasing them.

It looks like other error returns after IRQ allocation, as well as the
dw_edma_pcie_remove() function, might also be missing a call to
pci_free_irq_vectors().

Could we exhaust system IRQ capacity if these resources are leaked during
failed probe attempts or device unbinding?

> +	if (match->flags & DW_EDMA_PCIE_F_REG_OFFSET)
> +		chip->reg_base +=3D dma_data->rg.off;
> =20
>  	for (i =3D 0; i < chip->ll_wr_cnt && !dma_data->cfg_non_ll; i++) {
>  		struct dw_edma_region *ll_region =3D &chip->ll_region_wr[i];

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721062815.4117=
887-1-den@valinux.co.jp?part=3D10
