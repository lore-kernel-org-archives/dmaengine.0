Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB85640B0E1
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 09:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784797860; cv=none; b=s8nh6HH2T+LC2LhDE0AFQfK1rEDj/cog7P6kENxdLwvaQbAPl506j99M3vKyVUvNH6kLPzFAQuTtQqGBipwlhpOjWUpgma1x61X1dBtQDB0/0aQaYR6xxZNSJHhIjffSTdygF+UsJm1dFqT++/TABjzpk81t0fWsXGqJ/df1T/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784797860; c=relaxed/simple;
	bh=W4Eiy8qUsbWVaAaaJ4lctnHk63JB/SCjwo9TyaZg8rg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uZl7Z2abXMBX0lQIVjOTw14iSU6fQ+kBghCcTg2BJFFoCVcf1mRjxkJXOJ9VhI37gBJksQrm2By3+qJzNJEkBDYzFeKLR1n964Uk0I26B0yRt6bmZgHXHZDKifkT+Zzy7/jmVusVGx2RC/3xPq6liczsdrzl7JaesCKJnhI7c48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S3YtBO/h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S3YtBO/h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 367F41F000E9;
	Thu, 23 Jul 2026 09:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784797859;
	bh=4bYEnPozAn6HPmSRV0ZybR05jMr/p2uuC/mmPqnzj0k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S3YtBO/hHOd/6L0jPXryG78ZZKX/kKy/XHEqwdydpn0lK+UnP+SQcGMR2f0tlCvjU
	 kxk5CHvZJBFofnORgIq5hE8RKLsLLxGydGVb1pFEs04bn99gzMjMzf8AbgflJcAjLu
	 6s8EBrduWOsUJvRY5VqoSt9Q2w6mUu6Ni+wfHL5p1cgZ62wHhkCAg2QvdvoDhjJ69R
	 RcUfUffQQ1h9jnIszQRPWbkoGYUHatXPjpkTsN9Z071uLkaeH3giTf7EzU2DvWlk0S
	 1dVAI+MUmSi+c1l4HeOmBXmvioKmJvqzcOaDgoPDt6Q0XVFBcuMVjtYvoUaCjNLANK
	 vfJeGJ97DEkHg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 13/19] dmaengine: dw-edma: Make the LL ring reset a
 full channel resync
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260723084150.521366-14-den@valinux.co.jp>
References: <20260723084150.521366-1-den@valinux.co.jp>
 <20260723084150.521366-14-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 09:10:58 +0000
Message-Id: <20260723091059.367F41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Caching `desc` prior to channel reset in `dw_edma_start_transfer()=
` leads to starting hardware DMA on an aborted and completed descriptor, ca=
using Use-After-Free and Rogue DMA.
--

--- Patch [13]: [PATCH v2 13/19] dmaengine: dw-edma: Make the LL ring reset=
 a full channel resync ---
commit 4087cc9178be36e7f92be792abfbec15027f1b49
Author: Koichiro Den <den@valinux.co.jp>

dmaengine: dw-edma: Make the LL ring reset a full channel resync

Reset currently clears the ring but leaves issued descriptors unchanged.
This patch updates the LL ring reset to abort descriptors with published
entries to prevent unsafe replay and to allow unpublished descriptors to use
the fresh ring.

> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-=
edma-core.c
> index 3fc929a6bcf52..963abecdc59ed 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c
> @@ -100,8 +100,27 @@ static void dw_hdma_set_callback_result(struct virt_=
dma_desc *vd,
> =20
>  static void dw_edma_core_reset_ll(struct dw_edma_chan *chan)
>  {
> +	struct virt_dma_desc *vd, *tmp;
>  	u32 i;
> =20
> +	/*
> +	 * Software cannot tell which published entries completed before the
> +	 * reset. Replaying one could duplicate a transfer after its target
> +	 * changed ownership, while keeping descriptors with uncertain entries
> +	 * would block later in-order completions. Abort descriptors with publi=
shed
> +	 * entries; untouched descriptors remain available for republishing.
> +	 */
> +	list_for_each_entry_safe(vd, tmp, &chan->vc.desc_issued, node) {
> +		struct dw_edma_desc *desc =3D vd2dw_edma_desc(vd);
> +
> +		if (desc->start_burst =3D=3D desc->done_burst)
> +			continue;
> +
> +		dw_hdma_set_callback_result(vd, DMA_TRANS_ABORTED);
> +		list_del(&vd->node);
> +		vchan_cookie_complete(vd);

[Severity: High]
If this aborts partially issued descriptors by unlinking and completing the=
m,
doesn't it cause a use-after-free when called from dw_edma_start_transfer()?

In dw_edma_start_transfer(), the first descriptor is cached before calling =
the
reset function:

drivers/dma/dw-edma/dw-edma-core.c:dw_edma_start_transfer() {
    ...
	vd =3D vchan_next_desc(&chan->vc);
	if (!vd)
		return 0;

	desc =3D vd2dw_edma_desc(vd);
	if (!desc)
		return 0;

	if (!chan->non_ll && !chan->ll_valid)
		dw_edma_core_reset_ll(chan);

	dw_edma_core_start(desc);
    ...
}

Because dw_edma_core_reset_ll() may complete the cached descriptor, the cli=
ent
could free the DMA buffer and the descriptor while dw_edma_core_start() is
subsequently passing it to the hardware. Can this result in rogue hardware =
DMA
and memory corruption?

> +	}
> +
>  	chan->ll_head =3D 0;
>  	chan->ll_done =3D 0;
>  	dw_edma_ll_irq_idx_discard(chan);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723084150.5213=
66-1-den@valinux.co.jp?part=3D13
