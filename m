Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B0442049B
	for <dmaengine@vger.kernel.org>; Wed,  2 Sep 2026 09:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788341951; cv=none; b=QSYQDmmEGDX6TyiWzoUZpmVygFL5eJB/Qhd9afFskjMGKjmukeHwHJIOogm4j2N6ija4IGpS2gacTPmuqTp1jawVALQq7gMFpKravTr06pWQ3XHoWJ0W0wAEmeIgkAJjQTwhMElyIzWMIlgZCXESgIfyIrYok82WpM8eWa3g/94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788341951; c=relaxed/simple;
	bh=yjT2ZjkXeDitnmXzYDGueZVNIfWsys1iBcgwWXfkVF8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P9qHNCY1eaV9dlkLwoWVT5FL0oq6duuJFx9T8ev5zqIxVaz49R4GX/aCkflBPIiYYSvyb1QDVYEHbDeO56OTPbLlys5L9/SPZSkhA6eU2dhzVmgE7eibWokXEVM2Us8XfkVcfAwDcv3gUu/BBEdsXRtcZ2/JiJAFi4O5hB1k8lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ROe6HvPs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ROe6HvPs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7695A1F00A3D;
	Wed,  2 Sep 2026 09:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788341949;
	bh=Xb8DsXgo9Hbib8JStRhc5ssT842wH1w9YWLeuzS6llM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ROe6HvPsd5wxgSyB1oHUJXZJ/TnhnpILBZCUq17weUZBOnjSyDGAlXDQAr+DgHs3i
	 tytbZv9nFUOK6XFxqTAeg4qBqkFZH6U1GnByLUW2JShp4SUsCdFGYqnqu87RiNjvpl
	 DdiSGDnxQRCm4uDTb7AP824X98SzsBDb42hKJNaHogeq8U+bYwufgQR0w2tZknYENI
	 EII2MgA/EEOmOf7nDypEmul66IedtUpPrJiMz7aRJ1K8n6E+WV5ijA9FnLt4cPX1l1
	 qNa8hM2R0cIp9dmVvlp7u6ZJaaDRyRE3nhSjmHSVx8+2HwuDJElUrP7nBdLGej+4Pl
	 150wUAdGsDfiA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/4] dmaengine: dw-axi-dmac: Use bitfield helpers for
 registers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jia Wang" <wangjia@ultrarisc.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260902-dma-fix-v3-4-414c6449fbcc@ultrarisc.com>
References: <20260902-dma-fix-v3-0-414c6449fbcc@ultrarisc.com>
 <20260902-dma-fix-v3-4-414c6449fbcc@ultrarisc.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 09:39:09 +0000
Message-Id: <20260902093909.7695A1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Kernel crash in axi_desc_put due to dma_pool_free() being called w=
ith a NULL virtual address when descriptor setup fails.
--

commit cfefdb6fe5a6c1faad810fe6247a2229e7ffd900
Author: Jia Wang <wangjia@ultrarisc.com>

    dmaengine: dw-axi-dmac: Use bitfield helpers for registers
   =20
    The driver open-codes several channel configuration and descriptor
    control bitfield writes with left shifts. Define masks for those fields
    and use FIELD_PREP() when programming the registers.
   =20
    Valid field values keep the same encoding. FIELD_PREP() confines values
    to their respective fields, but does not validate handshake numbers
    supplied through DMA specifiers.

> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma=
/dw-axi-dmac/dw-axi-dmac-platform.c
> index 61230d2b1c561..b4aa6461684cb 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
[ ... ]
> @@ -977,19 +980,19 @@ dma_chan_prep_dma_memcpy(struct dma_chan *dchan, dm=
a_addr_t dst_adr,
>  		if (chan->chip->dw->hdata->restrict_axi_burst_len) {
>  			u32 burst_len =3D chan->chip->dw->hdata->axi_rw_burst_len - 1;
> =20
> -			reg |=3D (CH_CTL_H_ARLEN_EN |
> -				burst_len << CH_CTL_H_ARLEN_POS |
> -				CH_CTL_H_AWLEN_EN |
> -				burst_len << CH_CTL_H_AWLEN_POS);
> +			reg |=3D CH_CTL_H_ARLEN_EN |
> +			       FIELD_PREP(CH_CTL_H_ARLEN, burst_len) |
> +			       CH_CTL_H_AWLEN_EN |
> +			       FIELD_PREP(CH_CTL_H_AWLEN, burst_len);
>  		}
>  		hw_desc->lli->ctl_hi =3D cpu_to_le32(reg);
> =20
> -		reg =3D (DWAXIDMAC_BURST_TRANS_LEN_4 << CH_CTL_L_DST_MSIZE_POS |
> -		       DWAXIDMAC_BURST_TRANS_LEN_4 << CH_CTL_L_SRC_MSIZE_POS |
> -		       xfer_width << CH_CTL_L_DST_WIDTH_POS |
> -		       xfer_width << CH_CTL_L_SRC_WIDTH_POS |
> -		       DWAXIDMAC_CH_CTL_L_INC << CH_CTL_L_DST_INC_POS |
> -		       DWAXIDMAC_CH_CTL_L_INC << CH_CTL_L_SRC_INC_POS);
> +		reg =3D FIELD_PREP(CH_CTL_L_DST_MSIZE, DWAXIDMAC_BURST_TRANS_LEN_4) |
> +		      FIELD_PREP(CH_CTL_L_SRC_MSIZE, DWAXIDMAC_BURST_TRANS_LEN_4) |
> +		      FIELD_PREP(CH_CTL_L_DST_WIDTH, xfer_width) |
> +		      FIELD_PREP(CH_CTL_L_SRC_WIDTH, xfer_width) |
> +		      FIELD_PREP(CH_CTL_L_DST_INC, DWAXIDMAC_CH_CTL_L_INC) |
> +		      FIELD_PREP(CH_CTL_L_SRC_INC, DWAXIDMAC_CH_CTL_L_INC);
>  		hw_desc->lli->ctl_lo =3D cpu_to_le32(reg);
> =20
>  		set_desc_src_master(hw_desc);

[Severity: High]
This is a pre-existing issue, but can the error handling path in
dma_chan_prep_dma_memcpy() cause a kernel crash?

If axi_desc_get() fails to allocate a descriptor from the DMA pool, the code
jumps to err_desc_get and calls axi_desc_put(desc):

drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:dma_chan_prep_dma_memcpy() {
	...
		hw_desc->lli =3D axi_desc_get(chan, &hw_desc->llp);
		if (unlikely(!hw_desc->lli))
			goto err_desc_get;
	...
err_desc_get:
	if (desc)
		axi_desc_put(desc);
	return NULL;
}

In axi_desc_put(), the loop unconditionally iterates over all requested
hardware descriptors up to desc->nr_hw_descs and attempts to free them:

drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:axi_desc_put() {
	...
	for (descs_put =3D 0; descs_put < count; descs_put++) {
		hw_desc =3D &desc->hw_desc[descs_put];
		dma_pool_free(chan->desc_pool, hw_desc->lli, hw_desc->llp);
	}
	...
}

Because unallocated descriptors will have a NULL hw_desc->lli, dma_pool_fre=
e()
is called with a NULL virtual address. Since dma_pool_free() does not check
for a NULL vaddr input, will this trigger a NULL pointer dereference in the
DMA pool allocator?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902-dma-fix-v3=
-0-414c6449fbcc@ultrarisc.com?part=3D4
