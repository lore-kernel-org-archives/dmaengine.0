Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD46322A2E
	for <dmaengine@vger.kernel.org>; Sat, 20 Jun 2026 17:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781975743; cv=none; b=p0oP0loD0y5+m4axA44TsTID2/pp0fNX8at7WLzxYDxjEJ1d4C9JqQA72Ie0Yrr0sbPHdd3Ey3aBPxoY65YxqwdMskrAVu5W7ByvXpmyIDHQGmwMpkRBkY7Wt0zMANEirpazstggvejEBW20tAU4PngYemxg5P5TqciHlkcklpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781975743; c=relaxed/simple;
	bh=HnT4nSd3cox0MjBYQ3y3APK8LUhPUqagkReezFWKHdE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FtPTWybI+W1qaOWNdGjy0usXtuPiJQnpZadG7H5wDFWiFnoxzxrPt6tthmWcfIusHVguBX4ZFtvO2iv1AfdPlnPH4tLrvR6uvXu+TlyjBLS4kzrsmMV+58muynzRRh3JQZm7mXR6wB999HJeOYKFgILHx+Vv8RcxrvgxSEnw+as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XmR0Ij6J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XmR0Ij6J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E59501F000E9;
	Sat, 20 Jun 2026 17:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781975742;
	bh=Bc389PPrRDKYz7AjPIUtMVLEhS1a/TWc+tJK6Wq71x0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XmR0Ij6JUY5NKpYkrdbNd7mTqHAml5qKtTKe572MmIGSY1l7Kttr77sYlzGgEDImY
	 T2UdJxoiPj51TskygDh7PWwXLcIFpfarCZ3sx4zs0lraeMch0iHFl/9OQHkZFpGdoo
	 6t8qU0MdhDupuKkc22mfikKIUzmKb1ko0h5nQQUYvRx3juVpnPNk0oOyTl2GWvnlym
	 /MEEwc9F+++X/X0eYC1bmd6g1vdZ5zkl9RGeejWKqwP4qKl6BVp/fUbmbV23bnAy+s
	 cWvbww7+ZdsMkJNfoGw/CDZuWS/h4y2BQrp6L4l1DMaYJ8q4CBjkvZBOd1SVWWkoiK
	 JCdKEHUlveK9w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 06/13] dmaengine: dw-edma-pcie: Track non-LL mode in
 DMA data
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260620170040.3756043-7-den@valinux.co.jp>
References: <20260620170040.3756043-1-den@valinux.co.jp>
 <20260620170040.3756043-7-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 20 Jun 2026 17:15:41 +0000
Message-Id: <20260620171541.E59501F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Calling pci_free_irq_vectors() in remove() violates API guidelines=
 for devices enabled with pcim_enable_device() and leads to a double free.
--

commit 4807e012ff4fafc258bc7806f34cdce5751bf7bf
Author: Koichiro Den <den@valinux.co.jp>
Subject: dmaengine: dw-edma-pcie: Track non-LL mode in DMA data

The dw-edma-pcie driver copies static template data into a mutable
dw_edma_pcie_data instance before applying capability-derived updates. This
commit keeps the derived non-LL mode in that copy as well.

> diff --git a/drivers/dma/dw-edma/dw-edma-pcie.c b/drivers/dma/dw-edma/dw-=
edma-pcie.c
> index 70ea031147d18..0ea8d59782b44 100644
> --- a/drivers/dma/dw-edma/dw-edma-pcie.c
> +++ b/drivers/dma/dw-edma/dw-edma-pcie.c

[ ... ]

> @@ -326,7 +327,6 @@ static int dw_edma_pcie_probe(struct pci_dev *pdev,
>  	struct dw_edma_chip *chip;
>  	int err, nr_irqs;
>  	int i, mask;
> -	bool non_ll =3D false;
> =20
>  	if (!pdata)
>  		return -ENODEV;

This is a pre-existing issue, but I noticed a potential problem in how this
driver handles IRQ cleanup.

[Severity: High]
Does dw_edma_pcie_remove() result in a double-free of the IRQ vectors?

This driver calls pcim_enable_device() in dw_edma_pcie_probe(), which marks
the PCI device as managed. Later in the probe function,
pci_alloc_irq_vectors() is called, which automatically registers a devres
action to free the vectors on device detach.

However, dw_edma_pcie_remove() manually calls pci_free_irq_vectors():

drivers/dma/dw-edma/dw-edma-pcie.c:dw_edma_pcie_remove() {
	...
	/* Freeing IRQs */
	pci_free_irq_vectors(pdev);
}

Since the devres action remains registered, will it attempt to free the IRQs
again, causing a double-free on driver unload?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260620170040.3756=
043-1-den@valinux.co.jp?part=3D6
