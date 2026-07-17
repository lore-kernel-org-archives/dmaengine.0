Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B447538F934
	for <dmaengine@vger.kernel.org>; Fri, 17 Jul 2026 09:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784279326; cv=none; b=Hlf2ydINhK7J9SMJY519aIXNoUzooMZ1h7E0ouJK+t56KRs/ZSXyHFs7amwvzaHzMQeRly52niA+Q3ne4/1vk1/lzlOG1EcLBUy+m/3xYvYBWw2ovbhv+dxrwxz2/bN3aSIX9QJmFGw+ZZBUrNMhJdYm1Nl4KW6oh0K/ixpu2Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784279326; c=relaxed/simple;
	bh=FgPEv3lZbTdO14tDT37sFwY23tYt2BtCuZEdWcjlq84=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=B+DfU2cFmXBo5df3EHgRDgcMwddso459yYXDtlGV92Z/X5nr2aukGzjX4p0gOZOWPIi+Ud8dowXUUzntNy+EtevzHulruZeQAAO1Jr2YjdZkBTis7LTYvOIYnGxE4umXJnE/z4/WFb+4+kKaUnHrJGNY/mVMx+Gm2GfGbNbuZqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YsT4aaOA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YsT4aaOA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F9861F00A3F;
	Fri, 17 Jul 2026 09:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784279320;
	bh=UmPkz0tugV1M9S9ZFiFz+R1ZgLeBLBoqNXvtJrE+QUE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YsT4aaOA0UeoqBAW/Xzsp/NeQgFav3j9+vQM+mOjB2ksR94/JvV//K3PZQUkOf2nj
	 /kO6sUhP0OFxXfcIklRqET0pGk1trwAhGHbi2v3QbrSk/13VVZSQ5jhTrfSPKnZlcn
	 ROGZhXspZC3hPrmWW04MFdqXQ7VC/WIt5IySqSVozdaMt1fsaV+JP9tem4mv3RfSzm
	 yXQ0fWwyprx2aqxCx6CFQuut80BMxS1pCsdILXuc0/ilxwW04BRuEuP+PIzJguzaiK
	 tzICRrGDJM8cLYr/FrcT7Qs0XyipgYbYX85e05SC+QCMBPBRraCK0RpdaWDDCDYHSM
	 wPmvvpfBkWNeA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v22 13/14] crypto: qce - Add BAM DMA support for crypto
 register I/O
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260717-qcom-qce-cmd-descr-v22-13-ff0d18b27246@oss.qualcomm.com>
References: <20260717-qcom-qce-cmd-descr-v22-0-ff0d18b27246@oss.qualcomm.com>
 <20260717-qcom-qce-cmd-descr-v22-13-ff0d18b27246@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 09:08:40 +0000
Message-Id: <20260717090840.8F9861F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] BAM DMA command descriptors misinterpret host-endian values on big=
-endian architectures, causing incorrect register writes.

Pre-existing issues:
- [High] The error cleanup path in `qce_aead_async_req_handle` unmaps the w=
rong scatterlist for the source buffer when `diff_dst` is true, leaking ass=
ociated data mappings.
- [High] Incorrect error check for `dma_map_sg()` allows an unmapped scatte=
rlist to be erroneously unmapped on fallback paths.
--

--- Patch [13]: [PATCH v22 13/14] crypto: qce - Add BAM DMA support for cry=
pto register I/O ---
commit 61e73b38a77173b6ebf2858f2dd73a186ca5b139
Author: Bartosz Golaszewski <brgl@kernel.org>

crypto: qce - Add BAM DMA support for crypto register I/O

This commit switches the driver to use BAM DMA for register I/O instead of
direct register writes. It provides the necessary DMA infrastructure, updat=
es
the ordering of operations, and replaces direct I/O calls with wrappers that
queue DMA command descriptors.

> diff --git a/drivers/crypto/qce/aead.c b/drivers/crypto/qce/aead.c
> index 92d84941d3dbf..48ea7fb9a91e6 100644
> --- a/drivers/crypto/qce/aead.c
> +++ b/drivers/crypto/qce/aead.c
> @@ -461,17 +461,17 @@ qce_aead_async_req_handle(struct crypto_async_reque=
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

[Severity: High]
This is a pre-existing issue, but is the error check for dma_map_sg()
correct prior to this step?

Looking earlier in qce_aead_async_req_handle():

    src_nents =3D dma_map_sg(qce->dev, rctx->src_sg, rctx->src_nents, dir_s=
rc);
    if (src_nents < 0) {
        ret =3D src_nents;
        goto error_unmap_dst;
    }

Since dma_map_sg() returns 0 on failure, checking for < 0 bypasses this err=
or
handler. This allows an unmapped scatterlist to proceed and later be
erroneously unmapped on fallback paths (such as if qce_start or
qce_dma_prep_sgs fails).

[Severity: High]
This is also a pre-existing issue, but does this error path unmap the wrong
scatterlist when diff_dst is true?

In qce_aead_async_req_handle(), the source buffer is mapped using:

    src_nents =3D dma_map_sg(qce->dev, rctx->src_sg, rctx->src_nents, dir_s=
rc);

However, if a subsequent step fails and execution jumps to error_unmap_src,
the code performs:

error_unmap_src:
    if (diff_dst)
        dma_unmap_sg(qce->dev, req->src, rctx->src_nents, dir_src);

Could this leak IOMMU mappings by unmapping req->src instead of the actually
mapped rctx->src_sg buffer?

[ ... ]

> diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
> index 26347e9fc078a..88d253d9147cf 100644
> --- a/drivers/crypto/qce/dma.c
> +++ b/drivers/crypto/qce/dma.c
> @@ -11,6 +13,98 @@
>  #include "dma.h"
> =20
>  #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
> +#define QCE_BAM_CMD_SGL_SIZE		128
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
Does this direct cast incorrectly handle host-endian values on big-endian
architectures?=20

The buf parameter is passed a native u32 pointer from qce_write_dma():

    unsigned int reg_addr =3D ((unsigned int)(qce->base_phys) + offset);
    qce_prep_dma_cmd_desc(qce, &qce->dma, reg_addr, &val);

By casting the native u32 to *((__le32 *)buf) without applying cpu_to_le32(=
),
the little-endian BAM DMA hardware might receive reversed byte sequences for
crypto register writes on big-endian systems.

> +
> +	bam_ce_buf =3D &bam_txn->bam_ce[bam_txn->pre_bam_ce_idx];
> +	bam_txn->bam_ce_idx++;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717-qcom-qce-c=
md-descr-v22-0-ff0d18b27246@oss.qualcomm.com?part=3D13
