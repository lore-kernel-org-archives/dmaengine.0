Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E9134DCF3
	for <dmaengine@vger.kernel.org>; Tue,  1 Sep 2026 06:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788244163; cv=none; b=uNlWq2NLNh+pL5En92yNYXMnD/P+e/RxmS39dvZ1DNa9z8BikhRkKi3VkhDGk+pVjBqQ12KK/qVgKJjhoJLfYJTMw4qSUrpEifoMAScTrHLqsgJJNUFRsS647zEOiZ56LrCLALjtA/+4zmIJRZyg9XAlYcHwe70eQk1VKjJpTsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788244163; c=relaxed/simple;
	bh=pOBlpLd6O++wmSapz2AVr/bRfR2G1PaEzHTSTW4pkO8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=X/iSHo646SJ25LZ1Akd3UNhadjCBBCaztR98I3oVrNgLNSDavSJJh3AUKYqDjm+ZZYuHM2eLGCD12MiixxMYRvc/ZnoAx9pn6plesXcuOZ7ekXeUnCoXOgtmXZMarJaAjUJgVcHOIomjp0C/1kcQ4glkrAdNZYz05dXM04hACP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eCebXY7q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eCebXY7q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 148311F000E9;
	Tue,  1 Sep 2026 06:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788244162;
	bh=rcFsFBLDRpry1UI/rb6ncmrVAcVGFHxo6YdBJgqEaNQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eCebXY7qofsHN9cwQL8c+Sn2qtWobbGiFKkko+T8RhIm6LAjJmyieM7kaG99ljtPi
	 hfA2BiI/do6il03M3jOXexWTGGGwDzASeU362wWBVDavqYoO1pwEky+VcjGYiHvtwh
	 iydWDz3m3w8w1AEfTT+cyOgHRDOHeYV9xNTfqALL8DzjTpS+xZEOBzc6Kn8B1zrU2j
	 zU/Yby5ujq38ImMbouWqIlk6Gh8kXeqSkPSsdFQ599TJXIhUw4nd3dd1+MuBQv5MLa
	 fPh1MEcJqnr6elpyaXd+5PfLv5wyCze1l4T2nXDt5A/alH0TpDfeZq8eT9BdbuZDNc
	 QzcVWKDBrpbNA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/4] dmaengine: dw-axi-dmac: Fix AXI burst length
 encoding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jia Wang" <wangjia@ultrarisc.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260901-dma-fix-v2-1-d7f0459ebb14@ultrarisc.com>
References: <20260901-dma-fix-v2-0-d7f0459ebb14@ultrarisc.com>
 <20260901-dma-fix-v2-1-d7f0459ebb14@ultrarisc.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 06:29:21 +0000
Message-Id: <20260901062922.148311F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing checks for zero-length inputs in descriptor prep functions=
 lead to out-of-bounds array accesses against ZERO_SIZE_PTR and divide-by-z=
ero panics.
- [High] axi_desc_put() unconditionally calls dma_pool_free() with potentia=
lly NULL pointers, causing a kernel panic when tearing down partially alloc=
ated descriptor lists.
- [High] axi_desc_put() unconditionally subtracts the maximum expected desc=
riptor count from chan->descs_allocated, causing an atomic counter underflo=
w on error paths.
--

commit 645dfa80d0619fd42c37ace18ec6558aa67250f3
Author: Jia Wang <wangjia@ultrarisc.com>

    dmaengine: dw-axi-dmac: Fix AXI burst length encoding
   =20
    The snps,axi-max-burst-len property describes the number of beats in an
    AXI burst, while the ARLEN and AWLEN fields encode that value minus one.
   =20
    The driver keeps axi_rw_burst_len as the actual burst length so that
    dma_device.max_burst reports the correct value. However, it also progra=
ms
    that unencoded value directly into the hardware fields. A value of 256
    therefore overflows the 8-bit fields and can cause AXI decode errors.
   =20
    Subtract one only when constructing hardware descriptors, while keeping
    the actual value for dma_device.max_burst.
   =20
    Fixes: c454d16a7d5a ("dmaengine: dw-axi-dmac: Burst length settings")
    Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
    Reviewed-by: Frank Li <Frank.Li@nxp.com>

> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma=
/dw-axi-dmac/dw-axi-dmac-platform.c
> index eebed2474210d..742e08cfab435 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> @@ -706,7 +706,7 @@ static int dw_axi_dma_set_hw_desc(struct axi_dma_chan=
 *chan,
>  	ctlhi =3D CH_CTL_H_LLI_VALID;
> =20
>  	if (chan->chip->dw->hdata->restrict_axi_burst_len) {
> -		burst_len =3D chan->chip->dw->hdata->axi_rw_burst_len;
> +		burst_len =3D chan->chip->dw->hdata->axi_rw_burst_len - 1;
>  		ctlhi |=3D CH_CTL_H_ARLEN_EN | CH_CTL_H_AWLEN_EN |
>  			 burst_len << CH_CTL_H_ARLEN_POS |
>  			 burst_len << CH_CTL_H_AWLEN_POS;

[ ... ]

I have a few questions about how zero-length inputs and error handling
are managed in this file.

In drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:dma_chan_prep_dma_memcpy(=
):

	while (len) {
		...
		num++;
	}

	/* Set end-of-link to the last link descriptor of list */
	set_desc_last(&desc->hw_desc[num - 1]);

[Severity: High]
This isn't a bug introduced by this patch, but does this cause an
out-of-bounds array access if the DMA client requests a zero-length transfe=
r?

If len is 0, the while loop never executes, num remains 0, and we access
desc->hw_desc[-1], leading to an immediate out-of-bounds dereference.


Also in drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:dw_axi_dma_chan_prep=
_cyclic():

	num_periods =3D buf_len / period_len;
	...
	total_segments =3D num_periods * num_segments;
	...
	llp =3D desc->hw_desc[0].llp;

	/* Managed transfer list */
	do {
		hw_desc =3D &desc->hw_desc[--total_segments];
		write_desc_llp(hw_desc, llp | lms);
		llp =3D hw_desc->llp;
	} while (total_segments);

[Severity: High]
This is a pre-existing issue, but does this cause a divide-by-zero panic if
period_len is 0?

[Severity: High]
This is a pre-existing issue, but does this code also go out of bounds if
buf_len is 0?

If buf_len is 0, total_segments is 0. Accessing desc->hw_desc[0].llp goes
out of bounds, and --total_segments underflows, causing another out-of-boun=
ds
access against the descriptor array.


I also have a question about the error handling path.

In drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:axi_desc_put():

	for (descs_put =3D 0; descs_put < count; descs_put++) {
		hw_desc =3D &desc->hw_desc[descs_put];
		dma_pool_free(chan->desc_pool, hw_desc->lli, hw_desc->llp);
	}

	kfree(desc->hw_desc);
	kfree(desc);
	atomic_sub(descs_put, &chan->descs_allocated);

[Severity: High]
This isn't a bug introduced by this patch, but can dma_pool_free() panic if
axi_desc_get() fails during partial allocation?

If axi_desc_get() fails under memory pressure, hw_desc->lli could be NULL
for the descriptors that failed allocation. dma_pool_free() appears to
unconditionally dereference this pointer.

[Severity: High]
This is a pre-existing issue, but does this code also underflow
chan->descs_allocated?

Because descs_put iterates up to the total requested descriptors (count),
atomic_sub() subtracts the total requested count, not just the successfully
allocated ones. If chan->descs_allocated underflows, could this break the
cyclic DMA interrupt handling logic by failing the loop bound check?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-dma-fix-v2=
-0-d7f0459ebb14@ultrarisc.com?part=3D1
