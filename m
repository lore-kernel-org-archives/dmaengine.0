Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD25497B65
	for <dmaengine@vger.kernel.org>; Fri, 11 Sep 2026 22:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789164743; cv=none; b=JtOV/9kvlte2p6MA72w5jnVmAsX7OLlX7ILYnVzbDf/usY6n7btQirnXkylPR/GETRdF2eFzdNAXMt+K+8GoRtZS8XUTjNiz/TcNA24h7H8sww6+7oVr5PDs2h8Uq9FHKMbtz70ctcra5NwlfYBC7NXoMjr/hM2wcosa4uhqm6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789164743; c=relaxed/simple;
	bh=OoxmxiY3iojQtxEpouq1m6bNY6aC1XvG7dDgqh5OXTI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kxdnBLkK0fueIsd9DgIr36mSC1IN3E/kOim39P6mEfnk3MlmgM9UCymACv5K+pc3LJCDSpTi4y/wO+7ILDs8LBypmrCCWVhqwKqsx3kPuzYIz5IFYa0B/fCL17fLL3BCcVeakuqeIdGQLcza5WOHFNQRFluHElOaITVblteFR4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c0V2QGdY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c0V2QGdY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 403161F000FF;
	Fri, 11 Sep 2026 22:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789164741;
	bh=5+wuD+K0HD50pSu88OcnXUZsXEuMHMlq0BDMCCLC6Ec=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c0V2QGdY3cS05vv2TvCUSNAlHE/Dou3PuwMb1YhI9Oo1HiLHGDNaRgOvqGHwliWdo
	 UoG1erFoauGubckBXxcRjVfz3rhrD0HSK6j8lpoInzl5tKOc6EfqxksMstQEFtIIqx
	 S2cUSiBWqmFoI69O1Sefc/bmPfIJrbz2u0a46+ESPa816lYW/pXmlEWiGCp6Jkupx8
	 zOEUH6/g5/M94F5JtyBWvfFwUyKWgOs9nerLLrg8lV7CownTrfN3C4KxgltYoECxHO
	 snNQbRIU4CUSxlfxuCvcTCwdgBo5dC2E5uzICIg8BO1xqu4lVy+jGhBH9DOi1N2Wbc
	 cxtkrH8foWeuA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv2] dmaengine: ppc4xx: change to %zu format specifiers
 for size_t arguments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260911220308.176962-1-rosenp@gmail.com>
References: <20260911220308.176962-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 22:12:20 +0000
Message-Id: <20260911221221.403161F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The macro PPC440SPE_ADMA_XOR_MAX_BYTE_COUNT evaluates to a negativ=
e integer, completely bypassing bounds checks on 64-bit platforms due to si=
gn extension.
- [High] Missing dma_mapping_error checks for page mappings in ppc440spe_ad=
ma_probe.
--

commit b83f66852a04e3a963271742acb4ce17841dcd68
Author: Rosen Penev <rosenp@gmail.com>

dmaengine: ppc4xx: change to %zu format specifiers for size_t arguments

Several dev_err, dev_dbg, pr_debug, and printk calls use %d or %u format
specifiers for size_t arguments (len, pool_size). Fix them to use %zu to
avoid warnings on 64-bit builds.

> diff --git a/drivers/dma/ppc4xx/adma.c b/drivers/dma/ppc4xx/adma.c
> index 279a431ccae38..bcc54d584e2bf 100644
> --- a/drivers/dma/ppc4xx/adma.c
> +++ b/drivers/dma/ppc4xx/adma.c
> @@ -799,7 +799,7 @@ static int ppc440spe_chan_xor_slot_count(size_t len, =
int src_cnt,
>  	if (likely(len <=3D PPC440SPE_ADMA_XOR_MAX_BYTE_COUNT))
>  		return slot_cnt;
> =20
> -	printk(KERN_ERR "%s: len %d > max %d !!\n",
> +	printk(KERN_ERR "%s: len %zu > max %d !!\n",
>  		__func__, len, PPC440SPE_ADMA_XOR_MAX_BYTE_COUNT);

[Severity: High]
This is a pre-existing issue, but does this bounds check evaluate correctly=
 on
64-bit platforms?

The macro PPC440SPE_ADMA_XOR_MAX_BYTE_COUNT is defined as (1 << 31), which
evaluates to a negative signed integer. When compared against a 64-bit
unsigned size_t, sign extension causes the macro to be implicitly cast to
0xffffffff80000000UL (or ~18 exabytes).

Since this patch explicitly addresses 64-bit builds by changing to %zu
format specifiers, could this pre-existing issue now allow excessively large
len values to bypass the bounds check and truncate hardware descriptor
configurations?

[ ... ]

> @@ -2030,7 +2030,7 @@ static struct dma_async_tx_descriptor *ppc440spe_ad=
ma_prep_dma_xor(
>  	BUG_ON(len > PPC440SPE_ADMA_XOR_MAX_BYTE_COUNT);
> =20
>  	dev_dbg(ppc440spe_chan->device->common.dev,
> -		"ppc440spe adma%d: %s src_cnt: %d len: %u int_en: %d\n",
> +		"ppc440spe adma%d: %s src_cnt: %d len: %zu int_en: %d\n",

[Severity: High]
This isn't a bug introduced by this patch, but similarly to
ppc440spe_chan_xor_slot_count(), does this BUG_ON() check fail to catch lar=
ge
len values due to the sign-extended macro definition?

[ ... ]

> @@ -2553,7 +2553,7 @@ static struct dma_async_tx_descriptor *ppc440spe_ad=
ma_prep_dma_pq(
>  	BUG_ON(!dst_cnt);
> =20
>  	dev_dbg(ppc440spe_chan->device->common.dev,
> -		"ppc440spe adma%d: %s src_cnt: %d len: %u int_en: %d\n",
> +		"ppc440spe adma%d: %s src_cnt: %d len: %zu int_en: %d\n",

[Severity: High]
This is also a pre-existing issue, but is this another instance where the
length bounds check in BUG_ON() fails due to the sign-extended macro?

[ ... ]

> @@ -4077,7 +4077,7 @@ static int ppc440spe_adma_probe(struct platform_dev=
ice *ofdev)
>  					adev->pool_size, &adev->dma_desc_pool,
>  					GFP_KERNEL);
>  	if (adev->dma_desc_pool_virt =3D=3D NULL) {
> -		dev_err(&ofdev->dev, "failed to allocate %d bytes of coherent "
> +		dev_err(&ofdev->dev, "failed to allocate %zu bytes of coherent "
>  			"memory for hardware descriptors\n",
>  			adev->pool_size);

[Severity: High]
This isn't a bug introduced by this patch, but further down in this functio=
n,
dma_map_page() is called to map chan->pdest and chan->qdest pages:

drivers/dma/ppc4xx/adma.c:ppc440spe_adma_probe() {
...
        chan->pdest =3D dma_map_page(&ofdev->dev, chan->pdest_page, 0,
                                   PAGE_SIZE, DMA_BIDIRECTIONAL);
        chan->qdest =3D dma_map_page(&ofdev->dev, chan->qdest_page, 0,
                                   PAGE_SIZE, DMA_BIDIRECTIONAL);
...
}

Are we missing a dma_mapping_error() check for these mappings?

If the mapping fails, it could return an invalid DMA address that gets writ=
ten
into hardware DMA descriptors, potentially leading to IOMMU faults or memory
corruption.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911220308.1769=
62-1-rosenp@gmail.com?part=3D1
