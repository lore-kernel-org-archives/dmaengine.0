Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FCB2E7389
	for <dmaengine@vger.kernel.org>; Sat, 20 Jun 2026 17:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781975609; cv=none; b=L8ugkgnupipOPHHtakUydbmZrLgut7gQ8AdpB7eewfDj/WrMY9LfmcN32OUfn+ublv8xl24ntv+tkzmQI4aCi+kgAJPStePWCCZEAsi5wEccYTwiqevBu/yMVsrBNSMBBtWU85tVRr+Vcm6ulxM/SUFDZASaT5cPIjrGV24wPCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781975609; c=relaxed/simple;
	bh=XlfZBPfjkd2VtAm5SzhbCEL9lTAPWRmSyJk/JyPBoZ8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QIm8sdAFM80OI3KvkpMYB17g7YXz01o5yon88B6ekijLkFBVXXjlVbQplxuUTJZ6PqqWwEMZ4XCj1/RX6ymqLtwad0/h4/seUFouQIQvxb9D+SbGDp8x5FQzAkEO21COO21bLq0GZR4Utm/YyHD1w0t3H3h7iEBUTA9kfiAqWUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dsMQ95LQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dsMQ95LQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A19461F000E9;
	Sat, 20 Jun 2026 17:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781975606;
	bh=WI8XmoJlmQFfZ1J8CJPegz9mGqXZd/ERh2MlRVr/p/g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dsMQ95LQGaC1CKsDWXudfvgvuDFYWqvEddmVe2IEdZTGSjPov+vEJlfsF4g3v73f5
	 jcpPFHX+eWmG/82MPQY54PTfInVmPpGdjWagHWRoPXTocnwzpNURNhFYp1MwL5nBkS
	 X47xQ5N8kWXpMaLKd4+7pxkcgw7QPeHptE+6ZT+UHed1knsbW5WXxrTpQw3pA60e+5
	 2TLOmUUqFgU0CAYxL7cr9BrsE2+DLW8Tp7hsiiA001MI7TPljeShT4h76YbsOOspLA
	 SmK3T3bZhwrTjU2W/O+/3/risK/le7R+cWktUbuGBJyaKa50kWnI/D/S8TChCfxpmD
	 Cx1q2tYT5JuUg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 09/13] dmaengine: dw-edma-pcie: Add platform ops to
 match data
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260620170040.3756043-10-den@valinux.co.jp>
References: <20260620170040.3756043-1-den@valinux.co.jp>
 <20260620170040.3756043-10-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 20 Jun 2026 17:13:26 +0000
Message-Id: <20260620171326.A19461F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Double free of PCI IRQ vectors on device removal.
--

commit ea9357c364d1768529dfa87f1f7bc66276215c93
Author: Koichiro Den <den@valinux.co.jp>

dmaengine: dw-edma-pcie: Add platform ops to match data

This commit moves the platform operations pointer into the match data
structure. It updates existing matches to use the standard platform ops
pointer without introducing any functional changes.

> diff --git a/drivers/dma/dw-edma/dw-edma-pcie.c b/drivers/dma/dw-edma/dw-=
edma-pcie.c
> index 5249324ad6bff..96038aaca0791 100644
> --- a/drivers/dma/dw-edma/dw-edma-pcie.c
> +++ b/drivers/dma/dw-edma/dw-edma-pcie.c
[ ... ]
> @@ -597,17 +598,20 @@ static void dw_edma_pcie_remove(struct pci_dev *pde=
v)

[Severity: High]
This isn't a bug introduced by this patch, but looking at
dw_edma_pcie_remove(), is there a double-free risk with the IRQ vectors?

In dw_edma_pcie_probe(), the device is enabled using pcim_enable_device(),
which means IRQ vectors allocated by pci_alloc_irq_vectors() are
automatically managed and freed by devres during device teardown.

However, dw_edma_pcie_remove() explicitly frees them again:

static void dw_edma_pcie_remove(struct pci_dev *pdev)
{
        struct dw_edma_chip *chip =3D pci_get_drvdata(pdev);
        ...
        /* Freeing IRQs */
        pci_free_irq_vectors(pdev);
}

Does this manual call to pci_free_irq_vectors() on a devres-managed device
lead to a double-free when pcim_msi_release() is later invoked?

> =20
>  static const struct dw_edma_pcie_match_data snps_edda_match_data =3D {
>  	.data =3D &snps_edda_data,
> +	.plat_ops =3D &dw_edma_pcie_plat_ops,
>  	.parse_caps =3D dw_edma_pcie_parse_synopsys_caps,
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260620170040.3756=
043-1-den@valinux.co.jp?part=3D9
