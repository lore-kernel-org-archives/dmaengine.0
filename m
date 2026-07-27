Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5654E42BC48
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 21:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785187879; cv=none; b=ZZV0BvOHFxqs8BRz1HesdMzeVYUJd6MOqnul/hIkm9bhvOdTuP3BoP5q7MogZ92WRW6sU1rdSRkIQ91/dfofAZWG2PLEhLFFa0CPYQO5TS+XvpsRPHO/AZ2SIwRawOu2czH0+2YfoqE7mg6dmJnzMf2JH1Tp/7VwQIMSlUjsP50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785187879; c=relaxed/simple;
	bh=d7wZFMY/XPkQm+qJFDVjXjGFJJuZmpdbqINYCg3u/7c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UilGzUogK/AP3+gVBwghLkpKR0Yr/qLEGg27LWfqa7zHLT6AlBUG4IxuQylLqQtvaPIzFJB2dSRN9cC5Zkicrg5bihj/N7nzRhb2keFVeyQiNPUoKrAzhAdjhIomUNXdDiJOlQROvZUrGlosE1QcuasJ7s0HxF70+EIJirTDpqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ldOXUkrz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ldOXUkrz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C9B41F000E9;
	Mon, 27 Jul 2026 21:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785187877;
	bh=mxDz9PdobEflQy4QSYlf1u+uoFpsC9XnqmoTxg70a+k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ldOXUkrzZgHSb4GxBOmC4pLQ8QyQcKgsHDlaM+daSjjy81J1+gUZyxbPp14B4uas3
	 6ABX8haur7gqpAdQDWG9OuCEW+Kdjt2fd5gW6Mipr4XXWfbQeh6fZ4Dv3XZgPtTxHr
	 WjpvAjgpP2Y1NQMnsCdpjKbQ8/SlLcaVjtCWFRlHSEEa4M9BuUlledYw2uxeH0WH3e
	 Koezlu+tiuTn0cGKxN3Mn5PDKyPomIyBK6CxWhy2LQO8Rp1nQhJZI9z7atKCr4hDK0
	 crC4aLovt0HDi6JSJXp5FJjVr99Ph6Z+LjQeii+7YzbKRj4lpgt6EgyJXuPvMPFPgx
	 ZJ/3v8FsDQ0Wg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 61/64] dmaengine: dw: defer callbacks via channel BH
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <4399a85a5ffe0dcbace462217f15c682c5f8d28a.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <4399a85a5ffe0dcbace462217f15c682c5f8d28a.1785183549.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 21:31:17 +0000
Message-Id: <20260727213117.9C9B41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Concurrent list modification between dwc_scan_descriptors() and dw=
c_terminate_all() leads to an infinite loop and list corruption.
--

--- Patch [61]: [PATCH v2 61/64] dmaengine: dw: defer callbacks via channel=
 BH ---
commit d2107b5998f3b825a629b786e29b948ab851a743
Author: Allen Pais <allen.lkml@gmail.com>
Subject: dmaengine: dw: defer callbacks via channel BH

Queue completed descriptors on the channel and invoke their callbacks
from per-channel BH work instead of the controller tasklet. Add a
synchronize hook so termination can wait for deferred callbacks before
their descriptor storage is released.

> diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
> index dd75f97a33b3d..e780116a944bc 100644
> --- a/drivers/dma/dw/core.c
> +++ b/drivers/dma/dw/core.c
> @@ -236,25 +236,24 @@ dwc_descriptor_complete(struct dw_dma_chan *dwc, st=
ruct dw_desc *desc,
>  	struct dma_async_tx_descriptor	*txd =3D &desc->txd;
>  	struct dw_desc			*child;
>  	unsigned long			flags;
> =20
>  	dev_vdbg(chan2dev(&dwc->chan), "descriptor %u complete\n", txd->cookie);
> =20
>  	spin_lock_irqsave(&dwc->lock, flags);
>  	dma_cookie_complete(txd);
> -	if (callback_required)
> -		dmaengine_desc_get_callback(txd, &cb);
> -	else
> -		memset(&cb, 0, sizeof(cb));
> +	list_del_init(&desc->desc_node);
> =20
>  	/* async_tx_ack */
>  	list_for_each_entry(child, &desc->tx_list, desc_node)
>  		async_tx_ack(&child->txd);
>  	async_tx_ack(&desc->txd);
> -	dwc_desc_put(dwc, desc);
> +	if (callback_required) {
> +		list_add_tail(&desc->desc_node, &dwc->completed_list);

[Severity: High]
Can this concurrent list modification lead to an infinite loop during chann=
el
termination?

If dwc_tx_status() races with dwc_terminate_all(), dwc_scan_descriptors()
temporarily drops dwc->lock while iterating over dwc->active_list.

If dwc_terminate_all() runs concurrently, it acquires the lock, splices
active_list to a local list, drops the lock, and begins locklessly iterating
the local list:

drivers/dma/dw/core.c:dwc_terminate_all() {
    ...
    list_splice_init(&dwc->queue, &list);
    list_splice_init(&dwc->active_list, &list);

    spin_unlock_irqrestore(&dwc->lock, flags);

    /* Flush all pending and queued descriptors */
    list_for_each_entry_safe(desc, _desc, &list, desc_node)
        dwc_descriptor_complete(dwc, desc, false);
}

When dwc_scan_descriptors() resumes, it calls dwc_descriptor_complete()
which now modifies desc->desc_node by moving it to dwc->completed_list.

Because dwc_terminate_all()'s lockless list_for_each_entry_safe() traversal
may have already prefetched a descriptor that is subsequently moved, its
iteration could jump into dwc->completed_list.

This would prevent the loop termination condition from ever matching the
stack-allocated list head in dwc_terminate_all(), causing an infinite loop.
Could this sequence happen in practice?

> +		dma_chan_schedule_bh(&dwc->chan);
> +	} else {
> +		dwc_desc_put(dwc, desc);
> +	}
>  	spin_unlock_irqrestore(&dwc->lock, flags);
> -
> -	dmaengine_desc_callback_invoke(&cb, NULL);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785183549.gi=
t.allen.lkml@gmail.com?part=3D61
