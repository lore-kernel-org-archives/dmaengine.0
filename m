Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7484411F9F;
	Mon, 10 Aug 2026 15:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786375558; cv=none; b=m+2HNiB2bBlihXhAIsKYqeBy3xY0/cxd23O19CIQbPmYgjqslbKjxmgTy2wXGAIW49o1wzTiMgcLoiq1Oy48LT82rRZRfWL1XROpOMBpEHCO+q/8WGVd1GqYEosfVf2936T+6eVntSWNGdF2cHDWM0ujJi4GBfcSAbHBgfb9Mn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786375558; c=relaxed/simple;
	bh=iKUrEXRFKeKirrF1+Q57QVyDO0IwIPFbhE/d3DsnATg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JWXmAvFr+6WPfOCillTEZ/AepppFK6gwPRgZi/M1k3tkExtS+rPxD/du2LNaXhT9jxCZzCfxOu32hDICDRg4uGHLXCSyCenGD9yJCiyl7HrJkMHWn7/RBfDL5aSSC84JWmhWbnOvwcdtluxSniu0YQha5H30q6uZ+EDi3gCs17g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KCMW4p8b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KCMW4p8b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D16E21F000E9;
	Mon, 10 Aug 2026 15:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786375556;
	bh=WIiXUtTP17eUpLFZXPnZATuPr2iPiMAMyMXtdr3uMfM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KCMW4p8bkA5nFOKaA2Ia//aX79hhBTCo18oc4HWo2GXD8FuiVYzNFQ+LFLKqz057O
	 BibSNrW3xnJ97N9DFQJEhnbtX8MO/bojbgkPk1gRdtfKl/kwPnOierFmjNZdWDehao
	 3yOzJwEDCF1rHjHAzsY6ihjaXm13ZnoEjzPl44sx9yFVnJa7EhgdGKBXEngjVEK8m6
	 jIXHZ6vt7uh9/T4GPOlWgGipFkZ+InDaCn1lcmQW86cWCYa+ljGqTBsm4mL1GBYv/A
	 +na8/rTpwN1YsKA3e+lyB47y42auu4yy6vE1lNk9YySB9iEvsHZTNGGZAgdobFk6gh
	 /RnV/uVYJIREA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 02/19] dmaengine: ti: k3-udma: move macros to header
 file
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Sree Kartheek Adivi" <s-adivi@ti.com>
Cc: conor+dt@kernel.org, robh@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260810151423.1948224-3-s-adivi@ti.com>
References: <20260810151423.1948224-1-s-adivi@ti.com>
 <20260810151423.1948224-3-s-adivi@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 15:25:54 +0000
Message-Id: <20260810152555.D16E21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Failure to handle all MSI controller DT binding variants by direct=
ly calling `of_msi_get_domain`.
--

--- Patch [2]: [PATCH v8 02/19] dmaengine: ti: k3-udma: move macros to head=
er file ---
commit 602a5738457ed780a012151dd52a59d2064763e4
Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>

dmaengine: ti: k3-udma: move macros to header file
   =20
Move macros defined in k3-udma.c to k3-udma.h for better separation and
reuse.

> diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
> index 48f4db777d924..a066862e2c699 100644
> --- a/drivers/dma/ti/k3-udma.c
> +++ b/drivers/dma/ti/k3-udma.c

[ ... ]

> @@ -5398,12 +5342,6 @@ static enum dmaengine_alignment udma_get_copy_alig=
n(struct udma_dev *ud)
>  	}
>  }
> =20
> -#define TI_UDMAC_BUSWIDTHS	(BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) | \
> -				 BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) | \
> -				 BIT(DMA_SLAVE_BUSWIDTH_3_BYTES) | \
> -				 BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) | \
> -				 BIT(DMA_SLAVE_BUSWIDTH_8_BYTES))
> -
>  static int udma_probe(struct platform_device *pdev)
>  {
>  	struct device_node *navss_node =3D pdev->dev.parent->of_node;

[ ... ]

	dev->msi.domain =3D of_msi_get_domain(dev, dev->of_node,
					    DOMAIN_BUS_TI_SCI_INTA_MSI);

[Severity: High]
This is a pre-existing issue, but does this explicitly fail to support
msi-map bindings?

By calling of_msi_get_domain() during device probe, the driver resolves
the MSI domain solely by iterating msi-parent phandles.

Will this cause MSI allocation failures and return -EPROBE_DEFER on platfor=
ms
that rely on msi-map bindings?

	if (!dev->msi.domain) {
		return -EPROBE_DEFER;
	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810151423.1948=
224-1-s-adivi@ti.com?part=3D2
