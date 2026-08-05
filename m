Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A473AF656
	for <dmaengine@vger.kernel.org>; Wed,  5 Aug 2026 21:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785965783; cv=none; b=AVcScwNXCTmgWp70146sns8m5bzt67RbCvZVr897NgcGcftgD+Z0Y5foVp4uLA7gT/UthYsQ2xbjQwCevuKsv5olgip7Gl/I91RJZRdQ3f9/aLGKkuyYjy6B4IEFuPTPIDb6HTg7rHDV0wJTSEdXUT6oZSiBOeTmmO8PERVY4EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785965783; c=relaxed/simple;
	bh=FxTIUxf0t0PURoceZJ36fibH1EzYtr/8VChABZCUQVA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=li7pk/y7i2G2A0yfR/RvZRBVBjZND3zGkwCrKTybDoRv6Ac+qnF2st+5bJWvhv3eA41Xle1DMDUUyrrZQORDussCGciRgx3JGyul+nwdBTaWKNigy2FvqLJPHOV/zSNyGDHJa38pe//SfIC3VPh686Fhb/E9LuNxk5Gp4+p0ZPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ha+hiVPg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ha+hiVPg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A8661F000E9;
	Wed,  5 Aug 2026 21:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785965782;
	bh=Y10RuMtDWgywnE9NWlTQBxzIx5jwKsDYgUz+R1Gynlk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ha+hiVPgKWxpKySsvfvXvg/9PkmP41+6MMIX5FlAnpLgGR1+WYJUrvo1qXexnBLWG
	 8h7p+5vuSiwy/U4mhUli3AHim0swaaXONh10TRskvk15KVobouxL5NKf28udDqpO48
	 yjrxjQ3e08pjCldGF0Xo+yafZtbZa2eN++TrBfLIaT/YMxRNQ9OeGmXJGdgggMkJ+H
	 3AmEIgYSmV7enBeNlF79DrCh96xOYQaoDdbaAPTRvqeZqV52kgIWFa/9vPlMeyJRNv
	 nVJpCRMXU3F56OLOz4VsS/X9hlRSlPL6SREvmDRTXheRRGjvqM1TZNcZQ8n9VbsOO2
	 o6WGBjcW22Q/g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/5] crypto: iaa - use bounce buffer for multi-sg
 decompress input
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vinicius Costa Gomes" <vinicius.gomes@intel.com>
Cc: dmaengine@vger.kernel.org, Frank.Li@kernel.org, vkoul@kernel.org
In-Reply-To: <20260805-iaa-crypto-fixes-zswap-v2-4-55c02694f499@intel.com>
References: <20260805-iaa-crypto-fixes-zswap-v2-0-55c02694f499@intel.com>
 <20260805-iaa-crypto-fixes-zswap-v2-4-55c02694f499@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 21:36:21 +0000
Message-Id: <20260805213622.3A8661F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Software fallback inside the synchronous `iaa_decompress()` pa=
th writes to `req->dst` while it remains mapped for DMA, causing data corru=
ption when unmapped if SWIOTLB is active.
--

--- Patch [4]: [PATCH v2 4/5] crypto: iaa - use bounce buffer for multi-sg =
decompress input ---
commit 734c3b6227baae1deae54e3c6e85848a75b44265
Author: Giovanni Cabiddu <giovanni.cabiddu@intel.com>

crypto: iaa - use bounce buffer for multi-sg decompress input

This commit introduces a pre-allocated bounce page to linearize small=20
multi-entry sources for IAA hardware decompression. This avoids falling=20
back to software for multi-entry sources while maintaining the fallback=20
for multi-entry destinations.

> diff --git a/drivers/crypto/intel/iaa/iaa_crypto_main.c b/drivers/crypto/=
intel/iaa/iaa_crypto_main.c
> index 9505ca23e6f38..51547c5fcf701 100644
> --- a/drivers/crypto/intel/iaa/iaa_crypto_main.c
> +++ b/drivers/crypto/intel/iaa/iaa_crypto_main.c

[ ... ]

> @@ -1653,7 +1726,7 @@ static int iaa_comp_adecompress(struct acomp_req *r=
eq)
>  		dev_dbg(dev, "asynchronous decompress failed ret=3D%d\n", ret);
> =20
>  	dma_unmap_sg(dev, req->dst, 1, DMA_FROM_DEVICE);
> -	dma_unmap_sg(dev, req->src, 1, DMA_TO_DEVICE);
> +	iaa_unmap_src(dev, req);
>  	iaa_wq_put(wq);

[Severity: Critical]
This is a pre-existing issue, but since this patch modifies the unmap
path here, I noticed a potential data corruption issue when SWIOTLB is
active.

If iaa_decompress() fails and falls back to software via
deflate_generic_decompress(req), the CPU will write valid decompressed
data directly to req->dst.

However, req->dst is still mapped for DMA (DMA_FROM_DEVICE). When
iaa_decompress() returns success after the fallback, we reach this
dma_unmap_sg() in iaa_comp_adecompress():

iaa_comp_adecompress()
   dma_map_sg(..., req->dst, DMA_FROM_DEVICE);
   ...
   ret =3D iaa_decompress(...)
      -> hardware fails, falls back to deflate_generic_decompress(req)
      -> CPU writes decompressed data to req->dst
      -> returns 0

   dma_unmap_sg(..., req->dst, DMA_FROM_DEVICE);

If SWIOTLB is active, won't this dma_unmap_sg() copy the unmodified or
partially modified bounce buffer back over req->dst, overwriting the
valid CPU-written data with garbage?

Should the software fallback inside iaa_decompress() unmap req->dst before
calling deflate_generic_decompress(req), similar to how
iaa_desc_complete() handles its fallback?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-iaa-crypto=
-fixes-zswap-v2-0-55c02694f499@intel.com?part=3D4
