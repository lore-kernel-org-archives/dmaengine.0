Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B503F3266
	for <dmaengine@vger.kernel.org>; Wed,  5 Aug 2026 21:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785965563; cv=none; b=geq503WQ8VLZFmfDsTISmldKxkzDKjWBKaBUzPk20Mn4aYjpxzrfFxYEajqTlFTIW2oskJtiaTp+DYTnKdYusO+9snrnMDzyeNvz1Ffizsaa9wyR+jdvPwnXVZGdBdjs4lWoGH3SEZuLrHOJoRwlPJPPZNYb3xub4v/WCRIZWN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785965563; c=relaxed/simple;
	bh=hwdXi/ZPfwZ6vgNnyRAYj7hztOWSqUcFfIHO6UJyog0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pMx3G5ldR1PzxEiQPiA5Lt30CJgb2mg2CuzFgAVGj0rbeJq0GyQEFyqQ6lqsAQ8+tbeewHfhpEoQ/2ph/TgQDnfn2IctQU85o4RFrf4KOwUj/Pcvwb0ACRfHLbGONUxoyc3uKATH7XXCyhJb0jwTY0sHKRBFkOkTsS97llb5E68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aBxncLTI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aBxncLTI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B6261F000E9;
	Wed,  5 Aug 2026 21:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785965561;
	bh=g7LQ2Gz1ZH/ANgAVcMBWl/XgmocTM9sQfyTfY4Bj4tU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aBxncLTINoKe+yzHXJLs2lv99t6l9t9N5rfVWQe/muVnKpC/DmaQR+FHU6CfuPTO+
	 uGBLFZlnMDbNWdov66zRotRsArVUaqTYR5d+IipHSUPlDprjYnasU3afadHVfmqEwc
	 I16XNCz64bQuCpI1aF66tCYsrkwjcxecfg0NryQ/x8CSXjLNgchgJwk8pSodroG/i0
	 ny9I7oMWuJ2PIemzg7yHlOi6WedZoY8iGk5LJzh0lwihaqKJ3B3CFx0IrF6Sw+3Y2O
	 FwKLerftXhWVBlei89Ql4gV4Sex3DOahlijAQF6Npcvsa6Fb5bJuWlzFctCKBz+cn6
	 uB7oG3KlBoBdA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/5] crypto: iaa - avoid counting fallback
 decompression bytes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vinicius Costa Gomes" <vinicius.gomes@intel.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260805-iaa-crypto-fixes-zswap-v2-3-55c02694f499@intel.com>
References: <20260805-iaa-crypto-fixes-zswap-v2-0-55c02694f499@intel.com>
 <20260805-iaa-crypto-fixes-zswap-v2-3-55c02694f499@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 21:32:40 +0000
Message-Id: <20260805213241.6B6261F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Software fallback decompression executes while scatterlist buf=
fers are still mapped for DMA, leading to data corruption.
- [High] TOCTOU race condition leading to Use-After-Free of `wq_table` duri=
ng device unbind.
- [High] Hardware DMA writes to freed memory if `check_completion` times ou=
t.
--

--- Patch [3]: [PATCH v2 3/5] crypto: iaa - avoid counting fallback decompr=
ession bytes ---
commit 4c267bc9414930f6e0fce0b302c075f74ec2f4ff
Author: Giovanni Cabiddu <giovanni.cabiddu@intel.com>

crypto: iaa - avoid counting fallback decompression bytes

This commit moves decompression byte accounting into the successful IAA
completion path in both synchronous and asynchronous flows. This ensures
decomp_bytes only reflects bytes actually processed by IAA, avoiding counti=
ng
fallback decompression bytes when an analytics error occurs.

> diff --git a/drivers/crypto/intel/iaa/iaa_crypto_main.c b/drivers/crypto/=
intel/iaa/iaa_crypto_main.c
> index 904d9413ba182..9505ca23e6f38 100644
> --- a/drivers/crypto/intel/iaa/iaa_crypto_main.c
> +++ b/drivers/crypto/intel/iaa/iaa_crypto_main.c
> @@ -1071,15 +1071,17 @@ static void iaa_desc_complete(struct idxd_desc *i=
dxd_desc,
>  		}
>  	} else {
>  		ctx->req->dlen =3D idxd_desc->iax_completion->output_size;
> +
> +		if (!ctx->compress) {
> +			update_total_decomp_bytes_in(ctx->req->slen);
> +			update_wq_decomp_bytes(iaa_wq->wq, ctx->req->slen);
> +		}
>  	}

[Severity: Critical]
This is a pre-existing issue, but can the software fallback decompression
execute while scatterlist buffers are still mapped for DMA, leading to data
corruption?

When the hardware engine returns IAA_ANALYTICS_ERROR and the operation
falls back to deflate_generic_decompress(), does it execute before
dma_unmap_sg() is called?

If the platform uses SWIOTLB bounce buffers, the hardware-untouched bounce
buffer could be copied back to the actual memory pages during unmap,
completely overwriting the CPU-decompressed valid data.

[ ... ]

> @@ -1462,16 +1464,16 @@ static int iaa_decompress(struct crypto_tfm *tfm,=
 struct acomp_req *req,
>  		}
>  	} else {
>  		req->dlen =3D idxd_desc->iax_completion->output_size;
> +
> +		/* Update stats */
> +		update_total_decomp_bytes_in(slen);
> +		update_wq_decomp_bytes(wq, slen);
>  	}
> =20
>  	*dlen =3D req->dlen;
> =20
>  	if (!ctx->async_mode)
>  		idxd_free_desc(wq, idxd_desc);

[Severity: High]
This is a pre-existing issue, but does a timeout in check_completion()
cause the hardware DMA to write to freed memory?

In check_completion(), if the hardware fails to complete the descriptor
within IAA_COMPLETION_TIMEOUT polls, the driver sets
iaa_crypto_enabled =3D false and returns -ETIMEDOUT.

The caller then frees the IDXD software descriptor and returns an error,
which leads to unmapping and freeing the SG buffers without aborting or
quiescing the hardware engine.

If the hardware is merely stalled and eventually completes the operation,
will it perform asynchronous DMA writes to the now-freed req->dst physical
pages, and write the completion status to the re-allocated descriptor?

[Severity: High]
This is a pre-existing issue, but is there a TOCTOU race condition
leading to a Use-After-Free of wq_table during device unbind?

The fast-paths like iaa_comp_acompress() check the global
iaa_crypto_enabled flag without locks:

	if (!iaa_crypto_enabled) {
		pr_debug("iaa_crypto disabled, not compressing\n");
		return -ENODEV;
	}
...
	cpu =3D get_cpu();
	wq =3D wq_table_next_wq(cpu);

Concurrently, iaa_crypto_remove() can be invoked via device unbind,
setting iaa_crypto_enabled =3D false and freeing the wq_table pointer array.

Since the crypto algorithms are only unregistered during module exit,
they remain accessible. Can a concurrent compression request read
iaa_crypto_enabled =3D=3D true, get preempted, and then access the freed
wq_table when calling wq_table_next_wq()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-iaa-crypto=
-fixes-zswap-v2-0-55c02694f499@intel.com?part=3D3
