Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6E13A7F55
	for <dmaengine@vger.kernel.org>; Mon, 25 May 2026 06:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779691390; cv=none; b=bN9PY+MF1t4lzPbHjSwZTvvwnrpZQzW9c1Ak2Xdwy1Wm6D6pS8MS+VcLBeQmCBj9Jy3apRM98Tv5oEpMEkWit7Rhr4/J/rxAE0SbQ0IOHXjrJkm1+w46z5lTtx3xvBy1Dn/uQ9NA4YQ1lB6NNyQG6bIL6Xr2QFEk2V44XX4KMhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779691390; c=relaxed/simple;
	bh=bEifnqMs+q3xsUGdauiRWMI7e/HSm46XnQXhNYIl8iU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IhbaO16+Dr78bfiDocHdt2VDu0U5k5asxpZq6M4vpw1uBRwnzCdVlqoaGZ1Mm9QKFHow/C2FESPS+ULY4P0iDkehCAbeBLl6yVB+XzCCCTREntuJafb72ijg5no6gE8rW5/t2sqdu45cK/f7vWID+tEe9TbWHR36aOB/2P8t1n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RpJ0ihhR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RpJ0ihhR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F28051F000E9;
	Mon, 25 May 2026 06:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779691385;
	bh=w/9ujnYWoZ5+Q/2yTVRM7nzDTQ7TqJVtabEP9kxMDIw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RpJ0ihhRX7VCPrp95N1Uei3L7UExH77GW8IRLxsUc4nbypPmbPK3Dw06UGBvPyn2K
	 37C1rLAClWrm4220NFpjEOg+tuAMLM2plSz6o6MTN0psmwSwFHzI2iN+HJt1JWG4OS
	 CIR04efMbZIPZ2GTUPqJsvgdFzGAk0lUwOqTLToSqWe014F+LT0TyE5BoTEz9+O4Be
	 meTTn2W9o8GvN0Al/f29rJH1JVWyM7Wx6V3FotHGEsePokiLrf7Vz3Gy3qdwZPd/wg
	 NkQXC6hNSWJa99o+m33yOnxlDHXFZaH6rIyL2+FxJ/qs+ve07u6huaBqbC0VX41XTE
	 gFuZKDSRagqyg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 08/12] dmaengine: dw-edma-pcie: Add platform ops to
 match data
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260525062420.3315904-9-den@valinux.co.jp>
References: <20260525062420.3315904-9-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 06:43:04 +0000
Message-Id: <20260525064304.F28051F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unconditional dereference of `match` when derived from `pid->drive=
r_data`, which can be NULL if bound via the sysfs `new_id` interface.
- [High] Double-free risk of IRQ vectors due to explicitly calling `pci_fre=
e_irq_vectors()` while using managed `pcim_enable_device()`.
--

commit 071f84626ae62c03bf1cfe1223de5d9ebdcd55e6
Author: Koichiro Den <den@valinux.co.jp>

dmaengine: dw-edma-pcie: Add platform ops to match data
   =20
Move the platform ops pointer into match data. Existing EDDA/MDB matches
keep using dw_edma_pcie_plat_ops.

> diff --git a/drivers/dma/dw-edma/dw-edma-pcie.c b/drivers/dma/dw-edma/dw-=
edma-pcie.c
> index 9aed1005854dc..1d63b07723f93 100644
> --- a/drivers/dma/dw-edma/dw-edma-pcie.c
> +++ b/drivers/dma/dw-edma/dw-edma-pcie.c
[ ... ]
> @@ -383,7 +384,7 @@ static int dw_edma_pcie_probe(struct pci_dev *pdev,
>  		return -ENOMEM;
> =20
>  	/* Let device-specific discovery override the static template data. */
> -	if (!match->parse_caps)
> +	if (!match->parse_caps || !match->plat_ops)

[Severity: High]
This is a pre-existing issue, but since this patch adds new dereferences
of match, what happens if the driver is bound via the sysfs new_id interfac=
e?

If a user dynamically binds the driver without providing the optional=20
driver_data field, pid->driver_data defaults to 0. The probe function
derives match from this and dereferences it, which could lead to a NULL
pointer dereference.

[ ... ]
> @@ -577,11 +578,13 @@ static void dw_edma_pcie_remove(struct pci_dev *pde=
v)
> =20

[Severity: High]
This isn't a bug introduced by this patch, but is there a double-free risk
for IRQ vectors during removal?

The probe function initializes the PCI device using pcim_enable_device():

drivers/dma/dw-edma/dw-edma-pcie.c:dw_edma_pcie_probe() {
	/* Enable PCI device */
	err =3D pcim_enable_device(pdev);
...
}

This automatically configures IRQ vector cleanup via devres. However,
the driver explicitly calls pci_free_irq_vectors(pdev) in
dw_edma_pcie_remove().

Could this lead to a double-free issue when the devres cleanup also attempts
to release the IRQ vectors?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525062420.3315=
904-1-den@valinux.co.jp?part=3D8
