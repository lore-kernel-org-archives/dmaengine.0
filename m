Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCF8423E9A
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 17:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785172885; cv=none; b=cmdk7d2EeGjhcTsucTiJUR9n4uzvNqfbqQk5rAPys5DaPFtHXBhZ4iPZ59B63dZ71EcytKalJs5CQQtzYH7fihCd3Xgbaj6gREisfHTo1Sh/3BuW6CKukoTmGt97n/ESBbo9/OwU1ui7Zh4lnHqSw88j8Ltzrv6e1KIGx4CKeok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785172885; c=relaxed/simple;
	bh=l0xCvBb209hrzYZQ6aPH4wJ2kZRkivifAu662NAO9BM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cEvQ1tItYofqmQTfYPq6YoTAPBpMGrwtV6igRhPFQDazHZLZq470wVdwhX/sLxyZogM/Puj6ZV4VH4P5RR9AeTOh8p9AgNBlCsXKUxoFh0FFWGhsBeIRt4xIFPypy+9N515HodHDWFU9p3gSSY8yMeone3pKsBr0IRbFUPyBwlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XjLD7hXd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XjLD7hXd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 409211F000E9;
	Mon, 27 Jul 2026 17:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785172871;
	bh=qcGsZdrZx56pFI88lLZ5mYHgABi5s3V2ThS2zDtEEvY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XjLD7hXdzdS0oMws8iWwx2+NRpJ35Vz+/yNIOllHGeqfMnJT5hsErqWREYab+k45Z
	 pnfrykFrA/W5Lvl0FSKvQlmQvcX8PAIlhb1ZWEWZsXZITzaJcqSVpFTZZMRFLK6E+d
	 4uyhjDFXjHZd39vmeeCweRGuhuk22GZZAgVbRifqeZgpr6LtBLqoSHRV6arXsykJxC
	 HTm6fzuGjsJcAnlQ7kFsFTuuSf2fWPm0CLpYk/v8dfzJHjDnwadlZ70YCwBKG1LLmO
	 tt+GK/64jOTAO0Zj9VNN7k6DL7Hm3czzsO5RIV7CC+qQtxib4FfvzuObSuLGq+hRqM
	 Qqsx8GYQJ3/6A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 14/24] dmaengine: dw-edma: Add LL interrupt placement
 policy
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260727170323.2321369-15-den@valinux.co.jp>
References: <20260727170323.2321369-1-den@valinux.co.jp>
 <20260727170323.2321369-15-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 17:21:10 +0000
Message-Id: <20260727172111.409211F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The logic to enable periodic LL interrupts when 'more issued wor=
k follows' is ineffective and causes spurious interrupts because the driver=
's submission mechanism cannot pipeline multiple descriptors.
--

--- Patch [14]: [PATCH v3 14/24] dmaengine: dw-edma: Add LL interrupt place=
ment policy ---
commit a9910cf03e474780cd4b172ac661f19546045a22
Author: Koichiro Den <den@valinux.co.jp>

dmaengine: dw-edma: Add LL interrupt placement policy

This commit moves the linked list (LL) interrupt placement policy into the
common core. It configures interrupts at descriptor ends, at the last free
slot, and adds a periodic interrupt every four entries if the descriptor
does not fit or if more work is queued.

> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-=
edma-core.c
> index d4c0be2cbaef1..d28e3633a8665 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c

[ ... ]

> @@ -250,6 +253,30 @@ static bool dw_edma_ll_done_is_stopped(struct dw_edm=
a_chan *chan)
>  	       dw_edma_core_ch_transfer_size(chan) =3D=3D 0;
>  }
> =20
> +static bool dw_edma_core_enable_ll_irq(struct dw_edma_desc *desc, u32 i,
> +				       u32 free)
> +{
> +	struct dw_edma_chan *chan =3D desc->chan;
> +
> +	/* Always report descriptor ends and the last free slot. */
> +	if (i =3D=3D desc->nburst - 1 || free =3D=3D 1)
> +		return true;
> +
> +	/* Keep one progress point per physical ring lap. */
> +	if (chan->ll_head =3D=3D chan->ll_max - 1)
> +		return true;
> +
> +	/*
> +	 * Add periodic progress points only while this descriptor does not fit
> +	 * in the current free space or more issued work follows it.
> +	 */
> +	if (desc->nburst - i <=3D free &&
> +	    list_is_last(&desc->vd.node, &chan->vc.desc_issued))
> +		return false;

[Severity: Medium]
Does this logic result in spurious interrupts instead of pipelining the next
descriptor?

When multiple descriptors are queued, !list_is_last() will evaluate to true,
enabling periodic interrupts. However, looking at the submission path,
dw_edma_start_transfer() only fetches the very first descriptor:

dw_edma_start_transfer() {
    ...
    vd =3D vchan_next_desc(&chan->vc);
    ...
}

Since dw_edma_ll_clean_pending() does not unlink the running descriptor from
the desc_issued list until it is completely finished:

dw_edma_ll_clean_pending() {
    ...
    if (desc->done_burst !=3D desc->nburst)
        break;

    /* Hardware has consumed this descriptor's LL entries. */
    dw_hdma_set_callback_result(vd, DMA_TRANS_NOERROR);
    list_del(&vd->node);
    ...
}

Won't these intermediate periodic interrupts just fetch the same running
descriptor, see it is already fully programmed, and do nothing?=20

This appears to prevent subsequent descriptors from being pipelined until t=
he
first one completes, meaning the extra interrupts just add CPU overhead.

> +
> +	return (chan->ll_head + 1) % DW_EDMA_LL_PROGRESS_INTERVAL =3D=3D 0;
> +}
> +
>  static void dw_edma_core_ll_start(struct dw_edma_desc *desc)
>  {
>  	struct dw_edma_chan *chan =3D desc->chan;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727170323.2321=
369-1-den@valinux.co.jp?part=3D14
