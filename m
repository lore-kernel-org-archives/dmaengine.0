Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB83C39022E
	for <dmaengine@vger.kernel.org>; Wed,  2 Sep 2026 09:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788342028; cv=none; b=j0xP7Ji3HgpIllhdiUhx7Rjs9Jr2z/KIPIYfRkpH/qChs6+CvRNe7bVoiA9sAkiImfMcj7IyiJN+21SGdfF6WuDFHaJJl0ar7wILyK5/OV1G3Fs+i2JrxQHOTzpkSWzTTfrWGmh7xzaZWyptTPsHDS/Qib3mBy3RUnPiMrFpew0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788342028; c=relaxed/simple;
	bh=jKurVm316gIgdG9OFTFNOYVHQL2BkuaB+vKGfShyrAs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=alRyS8DDZ5vn4owiKlWPw6y5nga+jASgulcOEb6RXWv4+xKPld7vbmBiWT8CAQJUZM6zYjFOq0LP7JgxWotzo7PXbqs4UEm9H6fQ8zJiI2NzFn/24quMqatUY4ZCC+uv85Wh1aPtz9bykLRljeDglhLG5D3YHQiNlNumNXIeBDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YG2EGFzE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YG2EGFzE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FE081F000E9;
	Wed,  2 Sep 2026 09:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788342026;
	bh=3WGnNhxWcNNnbf+XfDTSo9kKc4c8HtVHAzhCzMZq6v0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YG2EGFzEQ2J1p7F05wYcsX2eJhW8MCbK3cJ0qcjD90LzavlVccgENBxCIksKm2E4Y
	 3D2e/e6rTMnaTZeQ0RWz82tYitmUu0DrkbaZ9cFnyvsxt55DSMUwmBJDHXDVlX1p/l
	 0Z1Tvd4wFP97T42pofcdsvh1WIH/KChsAi7n4CukzHSIy9n81Nsi9MPL020XjvVWec
	 C7SBGTTdZS98Inm5AnrVGDIgjGgzjfsxCPvipOHsLDGDw/rto+t2xLX1/wz3CCcY4s
	 AmfRJ0l9s7cRxoXFnJutIoHEVAcDv2Dqfhd6gXHWQslBA4l6UC9lifT6szWHA2dRg9
	 KqGrGMNHcSOoA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/4] dmaengine: dw-axi-dmac: Fix LLI dump
 out-of-bounds access
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jia Wang" <wangjia@ultrarisc.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260902-dma-fix-v3-2-414c6449fbcc@ultrarisc.com>
References: <20260902-dma-fix-v3-0-414c6449fbcc@ultrarisc.com>
 <20260902-dma-fix-v3-2-414c6449fbcc@ultrarisc.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 09:40:25 +0000
Message-Id: <20260902094026.1FE081F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Out-of-bounds array access in `axi_chan_block_xfer_complete()`=
 due to using a channel-wide allocation count instead of a descriptor-speci=
fic count.
- [Critical] Unbalanced error cleanup leads to fatal NULL pointer dereferen=
ce in `axi_desc_put()`.
--

commit fcec4647e1e2dadb380a57d84fb44bb3b6d294d3
Author: Jia Wang <wangjia@ultrarisc.com>

dmaengine: dw-axi-dmac: Fix LLI dump out-of-bounds access

This patch addresses an out-of-bounds array read in axi_chan_list_dump_lli(=
).
It modifies the loop to use the descriptor-local count instead of the
channel-wide allocation count. This prevents reading past the end of the ar=
ray
when multiple transactions are present.

> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma=
/dw-axi-dmac/dw-axi-dmac-platform.c
> index 742e08cfab435..61230d2b1c561 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> @@ -1052,10 +1052,7 @@ static void axi_chan_dump_lli(struct axi_dma_chan =
*chan,
>  static void axi_chan_list_dump_lli(struct axi_dma_chan *chan,
>  				   struct axi_dma_desc *desc_head)
>  {
> -	int count =3D atomic_read(&chan->descs_allocated);
> -	int i;
> -
> -	for (i =3D 0; i < count; i++)
> +	for (unsigned int i =3D 0; i < desc_head->nr_hw_descs; i++)
>  		axi_chan_dump_lli(chan, &desc_head->hw_desc[i]);
>  }

[Severity: Critical]
This isn't a bug introduced by this patch, but the exact same logic flaw
appears to exist in axi_chan_block_xfer_complete():

drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:axi_chan_block_xfer_complete=
() {
    [ ... ]
	int count =3D atomic_read(&chan->descs_allocated);
    [ ... ]
	if (chan->cyclic) {
		desc =3D vd_to_axi_desc(vd);
		if (desc) {
			llp =3D lo_hi_readq(chan->chan_regs + CH_LLP);
			for (i =3D 0; i < count; i++) {
				hw_desc =3D &desc->hw_desc[i];
				if (hw_desc->llp =3D=3D llp) {
					axi_chan_irq_clear(chan, hw_desc->lli->status_lo);
					hw_desc->lli->ctl_hi |=3D cpu_to_le32(CH_CTL_H_LLI_VALID);
    [ ... ]
}

If multiple transfers are queued or prepared, can the channel-wide count
exceed the transaction-local desc->nr_hw_descs count and cause an
out-of-bounds access of the desc->hw_desc[] array here as well?

Could this out-of-bounds memory be dereferenced as an LLI descriptor pointer
and subsequently cause memory corruption when written to?

[Severity: Critical]
This isn't a bug introduced by this patch, but is there also a regression
with unbalanced error cleanup causing a NULL pointer dereference?

In dw_axi_dma_chan_prep_cyclic(), if an error occurs midway through setting=
 up
the segments:

drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:dw_axi_dma_chan_prep_cyclic(=
) {
    [ ... ]
	for (i =3D 0; i < total_segments; i++) {
		hw_desc =3D &desc->hw_desc[i];

		status =3D dw_axi_dma_set_hw_desc(chan, hw_desc, src_addr,
						segment_len);
		if (status < 0)
			goto err_desc_get;
    [ ... ]
}

The error path will call axi_desc_put(), which loops over the entire
desc->nr_hw_descs array unconditionally:

drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:axi_desc_put() {
    [ ... ]
	for (descs_put =3D 0; descs_put < count; descs_put++) {
		hw_desc =3D &desc->hw_desc[descs_put];
		dma_pool_free(chan->desc_pool, hw_desc->lli, hw_desc->llp);
	}
    [ ... ]
}

Since desc->hw_desc is zero-initialized and trailing elements may not have
been populated yet, won't hw_desc->lli be NULL for those elements?

Since dma_pool_free() does not handle NULL virtual addresses, will this
lead to a panic?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902-dma-fix-v3=
-0-414c6449fbcc@ultrarisc.com?part=3D2
