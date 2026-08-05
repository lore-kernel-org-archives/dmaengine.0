Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD26346AE3
	for <dmaengine@vger.kernel.org>; Wed,  5 Aug 2026 21:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785965923; cv=none; b=FPX5DLnnT0bbkCjDCVNlrRII0Uy1PKNE/v6GWepq7cl70x5yS0G1EGHP59VX6gv70gN/ITKBebAzBd7YUnWTJOD1tPJ2A95VIBTwdnmX1eefqxO5Xwr6PffKkTkURBu0SPBfDyXihyjUJdsht85hn/mmPz5ngvJcmOEK3hLXn5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785965923; c=relaxed/simple;
	bh=tD+po2W+2svJcFK3+wrAQqQzqjC/vJQ5rD1za+65jjo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SVsbsLJzW6XhnBSHMGSBYoVEHjY6QuI1Nzd9oB+4vk7fboDKxTcmv4DV4YD51lLTQGhpr61oMQvnuvxGYXVk8p9FAAN8M53Ay1nzI4RO5oDfZxE20M+Iqm+eoAVeTYMOXJW51UgQ98y82KMPZhOTKB4u7tgKtrA2spsDqV75GL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lArljkbM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lArljkbM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CA701F000E9;
	Wed,  5 Aug 2026 21:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785965921;
	bh=qwVvccRqP96/ZJawdQgKmmRWqt7KA2YWBODxZRxRhD0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lArljkbMsIbT0uhqFV1ZY4RRU2qeFXcqFPKfJ8UlfjRV29w9DJjoLa4W+BmkG3GzG
	 Z6NZbs83qP/dlDktAVtVv9uJ7kZdH6oHt4o5LdPRJTe3PH9LSsbB8V9lUH1w33LoBu
	 HiPTyauPCUGUNHALYEAtroT2AAq2HlOkg/mv17G/LuqAJbdHXrosAUji4R/PcAlP/l
	 3cqNPM7lZOTOYdkglyaSsVns1cbaMuoXaYENSv+1ZqKnBPcfb+epyM3MFzi7dedcvI
	 wdWSjkpaRHpCtjGEG3mJx9nBJahZ5AUnmyv+2KBPZ0MncyBearMlu7s/KegNQ0O5W6
	 8HciyD3CyanWA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/5] crypto: iaa - fall back to software for
 multi-entry scatterlists
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vinicius Costa Gomes" <vinicius.gomes@intel.com>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260805-iaa-crypto-fixes-zswap-v2-2-55c02694f499@intel.com>
References: <20260805-iaa-crypto-fixes-zswap-v2-0-55c02694f499@intel.com>
 <20260805-iaa-crypto-fixes-zswap-v2-2-55c02694f499@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 21:38:40 +0000
Message-Id: <20260805213841.5CA701F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Software decompression fallback reads and writes buffers while the=
y are still DMA-mapped, leading to data corruption on systems using SWIOTLB=
 (bounce buffers).
--

--- Patch [2]: [PATCH v2 2/5] crypto: iaa - fall back to software for multi=
-entry scatterlists ---
commit 6596711a82477095464512f0a5cfb3f894ac8fad
Author: Giovanni Cabiddu <giovanni.cabiddu@intel.com>
Subject: crypto: iaa - fall back to software for multi-entry scatterlists

This commit routes multi-entry scatterlists to a software deflate
implementation instead of failing them. It simplifies the DMA mapping
paths to handle only single entries and falls back to software on mapping
failures. Counters are added to track the number of software fallback
compressions.

Cc: stable@vger.kernel.org

> diff --git a/drivers/crypto/intel/iaa/iaa_crypto_main.c b/drivers/crypto/=
intel/iaa/iaa_crypto_main.c
> index f62b994e18e58..904d9413ba182 100644
> --- a/drivers/crypto/intel/iaa/iaa_crypto_main.c
> +++ b/drivers/crypto/intel/iaa/iaa_crypto_main.c

[ ... ]

> @@ -1639,10 +1650,8 @@ static int iaa_comp_adecompress(struct acomp_req *=
req)
>  	if (ret !=3D 0)
>  		dev_dbg(dev, "asynchronous decompress failed ret=3D%d\n", ret);
> =20
> -	dma_unmap_sg(dev, req->dst, sg_nents(req->dst), DMA_FROM_DEVICE);
> -err_map_dst:
> -	dma_unmap_sg(dev, req->src, sg_nents(req->src), DMA_TO_DEVICE);
> -out:
> +	dma_unmap_sg(dev, req->dst, 1, DMA_FROM_DEVICE);
> +	dma_unmap_sg(dev, req->src, 1, DMA_TO_DEVICE);
>  	iaa_wq_put(wq);
> =20
>  	return ret;

[Severity: High]
This is a pre-existing issue, but can the software fallback logic corrupt
data on systems using SWIOTLB (bounce buffers)?

If hardware decompression fails with an analytics error (for example,
IAA_ANALYTICS_ERROR), the driver falls back to software decompression via
deflate_generic_decompress(). This fallback executes directly on the CPU,
modifying the original virtual pages.

In the async completion path, the software fallback is executed while the
buffers are still actively DMA-mapped:

iaa_crypto_main.c:iaa_desc_complete() {
        ...
        if (err =3D=3D IAA_ANALYTICS_ERROR) {
                ret =3D deflate_generic_decompress(ctx->req);
        ...
        dma_unmap_sg(dev, req->dst, 1, DMA_FROM_DEVICE);
}

When SWIOTLB is active, this unmap operation syncs the bounce buffer back
to the original memory. Does this completely overwrite the correct data just
produced by the software fallback with stale hardware garbage?

Could the driver unmap the buffers before falling back to software
decompression to prevent this?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-iaa-crypto=
-fixes-zswap-v2-0-55c02694f499@intel.com?part=3D2
