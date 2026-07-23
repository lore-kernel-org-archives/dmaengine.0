Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F95C39150E
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 17:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784827965; cv=none; b=gVoqRXl4FIMzQrBdsphxVIE7PVjyJtbvVX0mlEdGvqcewKxDrtXOZb15X1vIRWbdPfeF62T6K43JzERH9Ki4DImhOBMk/K5LnyK85LgUeKlAJteYB/d4poGBN7pCRI5CoBDxbN4V7dvs0ux+PT+FXrAl7sI3r3PVbTrQlhGvby4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784827965; c=relaxed/simple;
	bh=jUuepjNXNqS0v5K7TAgDWM7qFdrxmrBH3NHhpX+FnKU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FJMuId99Iij8M8zEoj94cytKTjWIsmp22VpugoJ9gg+60aizSaGI+26ssNgoRzNXhJ6y31a15kgLVFHxHbe0nvr3egCpuuKPTqgFtxTO+DZBODC/9lRGAFUVBzK7OQZ+v8DCKT0JrAz7Xq4bCnbHFNmDcCndcqAzUVHNbeA4ubc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HnEVDmJp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HnEVDmJp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C66661F000E9;
	Thu, 23 Jul 2026 17:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784827964;
	bh=LYGqak0Y+G/LCQyCmjq3KD5dTEaSvhkuZTZChXYmjQs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HnEVDmJpX2HReUhk9tq/aBuaPfOs50mvsEsjgc3rhNZkQRF4IZBwARgmwO+qSLQPY
	 ZRU7bIvNY+NkrZ/vesoplj96NzRWguavDuQkDBtjOnoUfeeYseBQJTVThRkPUyvjvy
	 LJaqCGteLcd6wKXmY7XyRBmcN45MVaLrG+g12bk2mm18zOOWzF4he3f9DFgTEZHq6f
	 qRkA4nZIKzOblYgmU+Xao2vPOiubw2jKUrmh1ysImN+MCij50cv96p0Rpk5h/eOxJc
	 1Ps+YRcu42K3e3bDn5MvJacOrSzGjCBGnkCD9y0w6yuAFaCAf35Ip53wzwLxPt/POU
	 a4+hiaMqCrqnQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v24 13/14] crypto: qce - Add BAM DMA support for crypto
 register I/O
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260723-qcom-qce-cmd-descr-v24-13-4f87bb4d9938@oss.qualcomm.com>
References: <20260723-qcom-qce-cmd-descr-v24-0-4f87bb4d9938@oss.qualcomm.com>
 <20260723-qcom-qce-cmd-descr-v24-13-4f87bb4d9938@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 17:32:42 +0000
Message-Id: <20260723173243.C66661F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Type punning of host-endian `u32` to `__le32` causes BAM DMA to wr=
ite byte-swapped values to configuration registers on big-endian architectu=
res.
- [Medium] Premature error return in `qce_dma_terminate_all()` leads to a l=
eaked DMA mapping and a skipped TX channel termination.

Pre-existing issues:
- [High] The error path `error_unmap_src` unmaps `req->src`, but for CCM al=
gorithms with associated data, the DMA mapping was actually performed on a =
newly allocated scatterlist table `rctx->src_sg`.
--

--- Patch [13]: [PATCH v24 13/14] crypto: qce - Add BAM DMA support for cry=
pto register I/O ---
commit 4d2a36eb6d9e1e8c0d5c28a8810d39001454e83e
Author: Bartosz Golaszewski <brgl@kernel.org>
crypto: qce - Add BAM DMA support for crypto register I/O

This commit switches the driver to use BAM DMA for register I/O alongside
data transfer. It introduces infrastructure to queue DMA command descriptors
for register writes, altering the sequence of operations accordingly.

> diff --git a/drivers/crypto/qce/aead.c b/drivers/crypto/qce/aead.c
> --- a/drivers/crypto/qce/aead.c
> +++ b/drivers/crypto/qce/aead.c
> @@ -463,17 +463,17 @@ qce_aead_async_req_handle(struct crypto_async_reque=
st *async_req)
>  			src_nents =3D dst_nents - 1;
>  	}
> =20
> -	ret =3D qce_dma_prep_sgs(&qce->dma, rctx->src_sg, src_nents, rctx->dst_=
sg, dst_nents,
> -			       qce_aead_done, async_req);
> +	ret =3D qce_start(async_req, tmpl->crypto_alg_type);
>  	if (ret)
>  		goto error_unmap_src;
> =20
> -	qce_dma_issue_pending(&qce->dma);
> -
> -	ret =3D qce_start(async_req, tmpl->crypto_alg_type);
> +	ret =3D qce_dma_prep_sgs(&qce->dma, rctx->src_sg, src_nents, rctx->dst_=
sg, dst_nents,
> +			       qce_aead_done, async_req);
>  	if (ret)
>  		goto error_terminate;
> =20
> +	qce_dma_issue_pending(&qce->dma);
> +
>  	return 0;
> =20
>  error_terminate:

[Severity: High]
This is a pre-existing issue, but does the error handling in
qce_aead_async_req_handle() unmap the wrong scatterlist?

If a hardware setup failure or other error occurs during CCM request
processing with associated data, the error path drops into error_unmap_src:

error_unmap_src:
        if (diff_dst)
                dma_unmap_sg(qce->dev, req->src, rctx->src_nents, dir_src);

Earlier in the function, qce_aead_ccm_prepare_buf() constructs a new
scatterlist table and assigns rctx->src_sg =3D rctx->src_tbl.sgl.

If dma_map_sg() mapped rctx->src_sg, wouldn't unmapping req->src instead
cause a memory leak and potentially trigger IOMMU corruption or DMA API
warnings?

> diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
> --- a/drivers/crypto/qce/dma.c
> +++ b/drivers/crypto/qce/dma.c
[ ... ]
> +static void qce_prep_dma_cmd_desc(struct qce_device *qce, struct qce_dma=
_data *dma,
> +				  unsigned int addr, void *buf)
> +{
> +	struct qce_bam_transaction *bam_txn =3D dma->bam_txn;
> +	struct bam_cmd_element *bam_ce_buf;
> +	int bam_ce_size, cnt, idx;
> +
> +	idx =3D bam_txn->bam_ce_idx;
> +	bam_ce_buf =3D &bam_txn->bam_ce[idx];
> +	bam_prep_ce_le32(bam_ce_buf, addr, BAM_WRITE_COMMAND, *((__le32 *)buf));

[Severity: High]
Does this code write byte-swapped values to the configuration registers
on big-endian architectures?

In qce_write_dma(), the host-endian u32 val is passed by reference:

    qce_prep_dma_cmd_desc(qce, &qce->dma, reg_addr, &val);

Inside qce_prep_dma_cmd_desc(), it is cast directly to a little-endian
pointer and dereferenced without byte-swapping, as shown above.

Could this cause the BAM DMA controller to interpret the data backwards on
big-endian systems? It seems cpu_to_le32() might be needed here.

[ ... ]
> @@ -98,28 +202,36 @@ int qce_dma_prep_sgs(struct qce_dma_data *dma, struc=
t scatterlist *rx_sg,
[ ... ]
>  int qce_dma_terminate_all(struct qce_dma_data *dma)
>  {
> +	struct qce_device *qce =3D container_of(dma, struct qce_device, dma);
> +	struct qce_bam_transaction *bam_txn =3D dma->bam_txn;
>  	int ret;
> =20
>  	ret =3D dmaengine_terminate_all(dma->rxchan);
> -	return ret ?: dmaengine_terminate_all(dma->txchan);
> +	if (ret)
> +		return ret;

[Severity: Medium]
Can this early return leak the DMA mapping and leave the TX channel active?

If dmaengine_terminate_all(dma->rxchan) fails and returns an error, the
function returns immediately. This bypasses the newly added dma_unmap_sg()
cleanup for the command descriptors:

    dma_unmap_sg(qce->dev, bam_txn->wr_sgl, bam_txn->wr_sgl_cnt, DMA_TO_DEV=
ICE);

It also skips terminating the TX channel entirely.

> +
> +	dma_unmap_sg(qce->dev, bam_txn->wr_sgl, bam_txn->wr_sgl_cnt, DMA_TO_DEV=
ICE);
> +
> +	return dmaengine_terminate_all(dma->txchan);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-qcom-qce-c=
md-descr-v24-0-4f87bb4d9938@oss.qualcomm.com?part=3D13
