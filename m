Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E7F325701
	for <dmaengine@vger.kernel.org>; Fri, 17 Jul 2026 05:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784266191; cv=none; b=oDZUafQcvJtoIMnIXHCmpR2bO7bm2wtUful8hTD7MT0fSRL44bREuq7432mhVbGE5ERadpizG5ZZtf0cp02BTkTTihBQqdcCSDHEwP6iUm1pVfycA6Ji3UJ195Xwm3gbmj2541f3hcKW1fzu+fYH0ZGsDRKSW6jO67PjJOwn+Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784266191; c=relaxed/simple;
	bh=XoVrT/1tjS2H5VU1eLE77YYtDtg5SOReVAfKHl8bwcM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BMhqPTXHPpCQDxREFtBu0VPVb8SSsqmrz5RG0uz2AbhhgAIu+S0oIwqr0nC/apUXZ1anf0let3TFAS8EdaCyVz6473AHdsh6wjeRoGxQC0LOx4Wr4eRWy5cXoLhTEEOqRLQ5duU5Y/ah+JSoS1L0I/Z0PJEh/1uKCZBwE6/wgvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lDOy8kt1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lDOy8kt1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 949521F000E9;
	Fri, 17 Jul 2026 05:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784266189;
	bh=J4B6O1v7Nn3YfqjWK4psElhRnn+hAA6/6zyc59/eqDY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lDOy8kt1bYjiV8cRbBK20uURkycbqvQpjI5TgsI5hMZUOpj9KUPBw3n6Gn0VZKveW
	 zPxsmpvwD+CLQu7LDY3d9uceu/TmnQJ8RnqG8fNS2vyeLCI/HLh0nbllLrPk7XDbJN
	 DJ2kvB3SlDPHyMOu2n9gngjpdZ/XCqPibJFqa+owtR+7nVHCJDX32mMJ82cmVbJw4b
	 Bd/cu1NXsAXKuPDsuu2jLFyV5zEPeMOE7OskkcIH28KcQWpDc4n4kCWwAViKiQIShD
	 ldxAAM+oS/hVwoF5AZ0GBhqz5nMncZmI7x7IWONGYked7jefGzN16xVLuUDnVJjwxB
	 y3FH4UqwpP9Qg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 14/14] dmaengine: dw-edma: Program endpoint function
 numbers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260717050308.2144108-15-den@valinux.co.jp>
References: <20260717050308.2144108-1-den@valinux.co.jp>
 <20260717050308.2144108-15-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 05:29:49 +0000
Message-Id: <20260717052949.949521F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Using `PCI_FUNC(pdev->devfn)` incorrectly truncates the 8-bit PCI =
`devfn` to 3 bits, leading to corrupted Requester IDs in outgoing DMA TLPs =
for Alternative Routing-ID Interpretation (ARI) devices and non-zero device=
 number RCiEPs.
--

--- Patch [14]: [PATCH v5 14/14] dmaengine: dw-edma: Program endpoint funct=
ion numbers ---
commit 69615a1713850d90b9bf46ff89bf560c8d19478f
Author: Koichiro Den <den@valinux.co.jp>

dmaengine: dw-edma: Program endpoint function numbers

This commit programs the requester function number for eDMA/HDMA transfers
so that the host can attribute and translate them correctly. It records the
function number using PCI_FUNC() during probe and programs it per channel.

> diff --git a/drivers/dma/dw-edma/dw-edma-pcie.c b/drivers/dma/dw-edma/dw-=
edma-pcie.c
> index 7f96e65ee2746..07ea237577d5e 100644
> --- a/drivers/dma/dw-edma/dw-edma-pcie.c
> +++ b/drivers/dma/dw-edma/dw-edma-pcie.c
> @@ -473,6 +473,7 @@ static int dw_edma_pcie_probe(struct pci_dev *pdev,
> =20
>  	chip->mf =3D dma_data->mf;
>  	chip->flags =3D match->chip_flags;
> +	chip->func_no =3D PCI_FUNC(pdev->devfn);

[Severity: High]
Does PCI_FUNC(pdev->devfn) incorrectly truncate the 8-bit PCI devfn to 3 bi=
ts
for Alternative Routing-ID Interpretation (ARI) devices and non-zero device
number RCiEPs?

Because the PCI_FUNC() macro masks the value with 0x07, it discards the upp=
er
5 bits. This might cause DMA transfers from an endpoint function with an ARI
function number >=3D 8 to carry an aliased Requester ID.

>  	chip->nr_irqs =3D nr_irqs;
>  	chip->ops =3D match->plat_ops;

[ ... ]

> diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/=
dw-hdma-v0-core.c
> index 77260c076cd3a..fdb2c6fb08e41 100644
> --- a/drivers/dma/dw-edma/dw-hdma-v0-core.c
> +++ b/drivers/dma/dw-edma/dw-hdma-v0-core.c
> @@ -334,6 +334,9 @@ static void dw_hdma_v0_core_ch_config(struct dw_edma_=
chan *chan)
>  	SET_CH_32(dw, chan->dir, chan->id, msi_abort.msb, chan->msi.address_hi);
>  	/* config MSI data */
>  	SET_CH_32(dw, chan->dir, chan->id, msi_msgdata, chan->msi.data);
> +	/* Configure the requester function number used by outbound TLPs. */
> +	SET_CH_32(dw, chan->dir, chan->id, func_num,
> +		  FIELD_PREP(HDMA_V0_FUNC_NUM_PF_MASK, chan->func_no));

[Severity: High]
Since HDMA_V0_FUNC_NUM_PF_MASK is defined as GENMASK(7, 0) and is intended =
to
hold the full Routing ID, will this field end up receiving the truncated
3-bit value set during probe? If so, could this lead to IOMMU faults by
blocking TLPs with mismatched Requester IDs?

>  }
> =20
>  static void

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717050308.2144=
108-1-den@valinux.co.jp?part=3D14
