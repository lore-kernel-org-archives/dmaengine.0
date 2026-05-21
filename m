Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EC0348883
	for <dmaengine@vger.kernel.org>; Thu, 21 May 2026 06:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779346205; cv=none; b=KW+L7Hgx2qTpdjnZCEjb+wJ+tj9RB5GowdL2N/cYXGXRJiZnwInLPP0RkcCzEBW80cbKnBtPFEPy+Qpm2rigXYlDotOUF1KKcGUoaq6KmLZ2Wa9YmOA3Q0dxk9rg7yLK/L+2FGA7Vn8YuwXIVk98/okH7d9t3HmpNGwQkM2gp/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779346205; c=relaxed/simple;
	bh=Vkpfp8q6SVRFxv/kuQx8MUaydxlke6YzaHpziLU4ZAY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CYGiRy4XNIKmfPFikbRAdlxAYZjZbDQ7o0fGV1Ty/XNKsv+G+N7GQ52zoB3AVsdPv0ZayUGm70yOvzpiT7eg/0rf7VIZGZ7wwVRbR5+3GuvCsqCxCJ29I5WswWEs4op838Nb3m+yktj3JRUvIX/MqlRhw9ugWSUWJGiMIb/cUEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YIMWxd/s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YIMWxd/s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B32901F000E9;
	Thu, 21 May 2026 06:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779346204;
	bh=f6Cd7SNRZsd1Jv3tVzBGfg6Wa0z5X03ysY1OuAjv14E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YIMWxd/s9HbDsXjaKc8D33nYbqqcwojx0q1XDrBU1H76lkr7K920IzVIV4tXdphk/
	 jKqcCy5Kk2d8Ux+SQKt9UfjF2EctSRBYbIDqpDEW0LwU2NLXXxThInTdXHekYbNTy8
	 iLKfbQrXSTDFNnv/dddJ0kVuVmlqjecGMym5p0jG6EMti04F9nJnYpAiMWgSqF9NQ/
	 jLqsZsReZlxSOw6X944e/JnO37SFytx5Mp5F2t8KrxpK7oxb2E112jJn3fTfzz1u1W
	 MSPTVrlhkhZLdcHlNcuyCxV9NYIBDyaHKXx4mn2HBx0pbLrOC4rFnhH5LgppPzNp3A
	 5gpkcQhevDgjg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 08/12] dmaengine: dw-edma-pcie: Add raw slave address
 match flag
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260521063115.2842238-9-den@valinux.co.jp>
References: <20260521063115.2842238-9-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 06:50:02 +0000
Message-Id: <20260521065003.B32901F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The function dw_edma_pcie_probe() leaks IRQ vectors by returning w=
ithout calling pci_free_irq_vectors() in error paths after pci_alloc_irq_ve=
ctors() succeeds.
- [High] Unconditional dereference of 'match' pointer derived from 'pid->dr=
iver_data' leads to a kernel panic if bound via sysfs new_id.
--

commit cf25adc4e90d11085734c5ab0ee97aa67c656e3f
Author: Koichiro Den <den@valinux.co.jp>

dmaengine: dw-edma-pcie: Add raw slave address match flag

This commit introduces a new match-data flag for devices whose DMA slave
address is already in the DMA controller address domain. When the flag is
set, it selects platform ops without a pci_address callback, allowing the
slave address to pass through unchanged.

> diff --git a/drivers/dma/dw-edma/dw-edma-pcie.c b/drivers/dma/dw-edma/dw-=
edma-pcie.c
> index cf2f09f1891c9..651269708cc54 100644
> --- a/drivers/dma/dw-edma/dw-edma-pcie.c
> +++ b/drivers/dma/dw-edma/dw-edma-pcie.c

[ ... ]

> @@ -435,7 +440,8 @@ static int dw_edma_pcie_probe(struct pci_dev *pdev,
>  	chip->mf =3D dma_data->mf;
>  	chip->default_irq_mode =3D match->default_irq_mode;
>  	chip->nr_irqs =3D nr_irqs;

[Severity: High]
This is a pre-existing issue, but does this function leak IRQ vectors in er=
ror
paths after this point?

Since pci_alloc_irq_vectors() was successfully called just prior to this
setup, subsequent error paths such as pcim_iomap_table() returning NULL or
a potential initialization failure appear to return directly without calling
pci_free_irq_vectors().

Would it make sense to add a cleanup path to free these IRQ resources?

> -	chip->ops =3D &dw_edma_pcie_plat_ops;
> +	chip->ops =3D match->flags & DW_EDMA_PCIE_F_RAW_SLAVE_ADDR ?
> +		    &dw_edma_pcie_raw_addr_plat_ops : &dw_edma_pcie_plat_ops;

[Severity: High]
This isn't a bug introduced by this patch, but is it possible for the match
pointer to be NULL here?

If the driver is dynamically bound using the sysfs new_id interface without
providing custom driver_data, pid->driver_data defaults to 0. This could
cause a NULL pointer dereference when evaluating match->flags here, as well
as earlier in the function when match->data is accessed.

Can this lead to a kernel panic if bound via sysfs?

>  	chip->cfg_non_ll =3D non_ll;
> =20
>  	chip->ll_wr_cnt =3D dma_data->wr_ch_cnt;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521063115.2842=
238-1-den@valinux.co.jp?part=3D8
