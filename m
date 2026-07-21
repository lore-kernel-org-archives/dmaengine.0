Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E3A3EC6A1
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 06:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784616668; cv=none; b=aAi7DQbOcCbAWftY9u/6IeOZD2S6N8Qjd//a/bq5lfsSMP8P/i7Ormy6nsNNBLX3/rdLn7C1a9qMHKbHr2XkKbgbzDUc/3oUggShxIibA1lcTg5bXrQeGiXpTC5zCMbwEF5TBwYg6jZY+4Mwd76UmjuwaebN+jhhusCOarCGfpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784616668; c=relaxed/simple;
	bh=KEpAZCqcOjV92CQsTe96TnUvoQgwH8E/BX4VUcLTfYc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ANWCnLuQvA+0kyUux40v1bhm+ZTOJiewj8Hyo9mxrJEsUY4395Y+i15YPwcQF5F525n3OU4H2oIu2FAAWghK49tpck0RE2IuEwN99hVEBoK6AFI27Y5q8jW1SEFmT4pdZwUXpBEyo3aBtm7yT+VDpm8zKAwkcV7nwAhG4UjjSoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=afV2l/ho; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="afV2l/ho"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19F381F000E9;
	Tue, 21 Jul 2026 06:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784616667;
	bh=es8eLxpx6yGIcsrpK7FijBYEFV91KJ9tHfEA/EvTDRY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=afV2l/hoNjgXUhWCDUNHvpVnzZwC6RTfsDCmr+wCZsRPgv3P+BqkbyYHYgonzxOh6
	 9WmZxG2A5gGmpG39Rqc7AOnN2Otex7S1JCFU9HdFtJFcwQSgtwCRmO4DL0wGAfAULL
	 3rXVNS595jelaN4u7KVb6RlLp4lqzHGCTZjQmcuDJNw+nJ76gQX/01rZ4DVGjJxRXd
	 Cs6/KS7kQcklZPLL+Hx5cpH4u5ry7s3z8lhNRq6wGY2ZiJ6yLz30nnZ8VGRB4G01YN
	 PcE+1iW3gNq1E9/W4ukoK5/c3LnScy4u5YRHrhxC7B916hX1szFT8lA+mvro4PTIKU
	 ncwUZZjzivgeA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 14/14] dmaengine: dw-edma: Program endpoint function
 numbers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260721062815.4117887-15-den@valinux.co.jp>
References: <20260721062815.4117887-1-den@valinux.co.jp>
 <20260721062815.4117887-15-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 06:51:06 +0000
Message-Id: <20260721065107.19F381F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Truncation of PCIe Requester ID using `PCI_FUNC()` breaks IOMMU is=
olation and DMA for ARI devices and SR-IOV Virtual Functions.
--

--- Patch [14]: [PATCH v6 14/14] dmaengine: dw-edma: Program endpoint funct=
ion numbers ---
commit 12cd49191ea0c234c70a872c83095a085495199a
Author: Koichiro Den <den@valinux.co.jp>

dmaengine: dw-edma: Program endpoint function numbers

This patch configures the requester function number for eDMA/HDMA transfers
by recording it in the chip data and programming it per channel. It extracts
the function number using PCI_FUNC() during PCIe probe. Endpoint-local
instances keep it at 0, while host-side instances use the probing device's
function number.

[ ... ]
> diff --git a/drivers/dma/dw-edma/dw-edma-pcie.c b/drivers/dma/dw-edma/dw-=
edma-pcie.c
> index 64f2a80072bce..9f237ba916dea 100644
> --- a/drivers/dma/dw-edma/dw-edma-pcie.c
> +++ b/drivers/dma/dw-edma/dw-edma-pcie.c
> @@ -473,6 +473,7 @@ static int dw_edma_pcie_probe(struct pci_dev *pdev,
> =20
>  	chip->mf =3D dma_data->mf;
>  	chip->flags =3D match->chip_flags;
> +	chip->func_no =3D PCI_FUNC(pdev->devfn);

[Severity: High]
Does PCI_FUNC() truncate the function number for Alternative Routing-ID
Interpretation (ARI) devices and SR-IOV Virtual Functions?

PCI_FUNC() masks the input to 3 bits, dropping the upper bits of the
function number. Since ARI or SR-IOV topologies can have function numbers
up to 255 (8 bits), could this cause the host IOMMU to attribute DMA traffic
from functions >=3D 8 to functions 0-7, breaking isolation?

>  	chip->nr_irqs =3D nr_irqs;
>  	chip->ops =3D match->plat_ops;
>  	chip->cfg_non_ll =3D dma_data->cfg_non_ll;
[ ... ]
> diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/=
dw-hdma-v0-core.c
> index 8d20bb028b528..36ee72efcd317 100644
> --- a/drivers/dma/dw-edma/dw-hdma-v0-core.c
> +++ b/drivers/dma/dw-edma/dw-hdma-v0-core.c
> @@ -345,6 +345,9 @@ static void dw_hdma_v0_core_ch_config(struct dw_edma_=
chan *chan)
>  	SET_CH_32(dw, chan->dir, chan->id, msi_abort.msb, chan->msi.address_hi);
>  	/* config MSI data */
>  	SET_CH_32(dw, chan->dir, chan->id, msi_msgdata, chan->msi.data);
> +	/* Configure the requester function number used by outbound TLPs. */
> +	SET_CH_32(dw, chan->dir, chan->id, func_num,
> +		  FIELD_PREP(HDMA_V0_FUNC_NUM_PF_MASK, chan->func_no));

[Severity: High]
HDMA_V0_FUNC_NUM_PF_MASK is an 8-bit mask, which implies the hardware expec=
ts
the full 8-bit devfn. Because chan->func_no was assigned using PCI_FUNC()
earlier, does this result in programming a truncated 3-bit value into this
8-bit hardware field, causing the hardware to emit TLPs with an incorrect
Requester ID?

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721062815.4117=
887-1-den@valinux.co.jp?part=3D14
