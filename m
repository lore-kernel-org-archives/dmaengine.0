Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CFE2737F8
	for <dmaengine@vger.kernel.org>; Tue, 14 Jul 2026 04:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784003768; cv=none; b=Dk+Ny17DugI+eS6PzhlPrJMrVdzT1Gljqf0/mj0abtRi7UiHVMfkm/hh4ZbT9w7PaVIOY6rep+UKdDt3s0k98TlQUURbupFj6VtU3HpEm+G78HCHFMQeoLDnhugmCLSsBDl7txr9qlsGJiRG/c6IZfgrgufXt3agxSUtBKsNELc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784003768; c=relaxed/simple;
	bh=Xj6FgWGQyovbix7h0cLqBBXLfTzJr4kQY9dLVbgPOiY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZZ5SC1sO8I5hvNYe7kYtvz6XScIci5+eFy6icEuEK7i87b0MA/w+81Hf9yQqjl20WW17JRsinktJPoFMb5MGPY9lYOc+lHC2lt4Im0wxjB7UCsbBQVX+eANNhEv03ORR61HIfyiwFqd/h0LenxYYuvzJQpLDg+kofXRRUHrkbaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ze6raLh5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ze6raLh5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBD8B1F000E9;
	Tue, 14 Jul 2026 04:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784003767;
	bh=OydBf91ZVyqybMCcxtkVpNdknf+Kb+PAeVcvetPfnYI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ze6raLh59Q5jWUbr32pPiVqTcXQv3kGeuNTzU5CnctR5rWgxpzwLuMBPHv39Zby5n
	 VnF0PcV740dkkCxUGkj3MAaFGxeRmzL4kSf7mjprRC9eHrWNNSjU1TbP/5TPlRm6HZ
	 /JR54PtVkuMXlQNXYvGsDULVeagkbI8TiINyQRdWfUsRCm1Wc6WURDIpASdb0TrsAa
	 njXrA7Rr+KQI08sZi0cFhTEYQv9hZL0UjW4GcBW7555spkEHxW4A3XWYBtxUWvMelx
	 85vOlhAFb60GGbLPJeBvCWH0ePNbgNN0eCAe46qwmzCz/0979PduCDi1+1bk5zPFGH
	 hbKqR814EHY4A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] crypto: iaa - fall back to software for multi-entry
 scatterlists
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vinicius Costa Gomes" <vinicius.gomes@intel.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260713-iaa-crypto-fixes-zswap-v1-2-65cac23c684d@intel.com>
References: <20260713-iaa-crypto-fixes-zswap-v1-0-65cac23c684d@intel.com>
 <20260713-iaa-crypto-fixes-zswap-v1-2-65cac23c684d@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 04:36:06 +0000
Message-Id: <20260714043606.BBD8B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Hardcoding the `nents` parameter to 1 in `dma_map_sg` causes a ker=
nel panic if `req->dst` is NULL.
- [Medium] The implementation tracks fallback calls rather than processed b=
ytes, contradicting the commit message.

Pre-existing issues:
- [High] Software fallback writes to CPU memory while DMA bounce buffers ar=
e mapped, risking data corruption during unmap.
- [High] A timeout during hardware polling causes the CPU to free DMA struc=
tures while the hardware device may still be performing DMA, leading to Use=
-After-Free memory corruption.
--

--- Patch [2]: [PATCH 2/4] crypto: iaa - fall back to software for multi-en=
try scatterlists ---
commit 6f1532575ac946d82236e0ac6dffd05320f89063
Author: Giovanni Cabiddu <giovanni.cabiddu@intel.com>
Subject: crypto: iaa - fall back to software for multi-entry scatterlists

This commit adds a software fallback for the IAA driver when dealing with
scatterlists containing multiple entries, as the hardware cannot process
them directly. It simplifies the DMA mapping path to expect a single entry
and adds counters for the fallback path.

>     Add counters to track the number of bytes processed by the software
>     implementation on the compression direction.

[Severity: Medium]
The commit message states that counters are added to track the number of
bytes processed. However, looking at the updates in iaa_crypto_stats.c:

void update_total_sw_comp_calls(void)
{
        atomic64_inc(&total_sw_comp_calls);
}

Could it be that the implementation only tracks fallback calls rather than
the processed bytes?

> diff --git a/drivers/crypto/intel/iaa/iaa_crypto_main.c b/drivers/crypto/=
intel/iaa/iaa_crypto_main.c
> index f62b994e18e58..fb154959c2aa8 100644
> --- a/drivers/crypto/intel/iaa/iaa_crypto_main.c
> +++ b/drivers/crypto/intel/iaa/iaa_crypto_main.c
[ ... ]
> @@ -983,17 +984,43 @@ static inline int check_completion(struct device *d=
ev,
>  	return ret;
>  }

[Severity: High]
This is a pre-existing issue, but how does the driver handle hardware
DMA after a timeout?

In check_completion(), if the polling loop exceeds IAA_COMPLETION_TIMEOUT,
it returns -ETIMEDOUT:

check_completion() {
    while (!comp->status) {
        if (status_checks++ >=3D IAA_COMPLETION_TIMEOUT) {
            ret =3D -ETIMEDOUT;
            goto out;
        }
        ...
    }
}

When this timeout happens, the caller immediately frees the IDXD descriptor
and unmaps the DMA buffers. However, the hardware might still be actively
processing the request. If the delayed hardware eventually performs a DMA
write to the destination address after the CPU has reallocated that memory
for something else, could this cause silent memory corruption?

> -static int deflate_generic_decompress(struct acomp_req *req)
> +static int deflate_fallback(struct acomp_req *req, bool compress)
[ ... ]
> +static int deflate_generic_decompress(struct acomp_req *req)
> +{
> +	int ret;
> +
> +	ret =3D deflate_fallback(req, false);
> +	if (ret)
> +		return ret;
> +
>  	update_total_sw_decomp_calls();
> =20
> -	return ret;
> +	return 0;
>  }

[Severity: High]
This is a pre-existing issue, but I noticed a potential problem when
deflate_generic_decompress() is called as a fallback from iaa_decompress().

If a hardware error like IAA_ANALYTICS_ERROR occurs in iaa_decompress(),
the software fallback writes to the CPU virtual mapping of req->dst:

iaa_decompress() {
    ...
    if (idxd_desc->iax_completion->status =3D=3D IAA_ANALYTICS_ERROR) {
        ret =3D deflate_generic_decompress(req);
        ...
    }
}

Since req->dst is still mapped for DMA_FROM_DEVICE at this point,
when dma_unmap_sg() is eventually called, might it synchronize memory
from a bounce buffer over the original CPU buffer, overwriting the
software fallback's output? Should the scatterlist be unmapped before
invoking the software fallback?

[ ... ]
> @@ -1507,30 +1538,25 @@ static int iaa_comp_acompress(struct acomp_req *r=
eq)
[ ... ]
> -	nr_sgs =3D dma_map_sg(dev, req->dst, sg_nents(req->dst), DMA_FROM_DEVIC=
E);
> -	if (nr_sgs <=3D 0 || nr_sgs > 1) {
[ ... ]
> +	if (!dma_map_sg(dev, req->dst, 1, DMA_FROM_DEVICE)) {

[Severity: High]
If req->dst is NULL, sg_nents() will return 0, bypassing the fallback check
earlier in this function. Calling dma_map_sg() unconditionally with nents=
=3D1
will then attempt to dereference the NULL scatterlist pointer.

Would it be safer to verify req->dst is not NULL before attempting to map
it, preserving the old behavior where sg_nents(req->dst) returning 0 was
handled safely?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713-iaa-crypto=
-fixes-zswap-v1-0-65cac23c684d@intel.com?part=3D2
