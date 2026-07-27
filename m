Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF3E427FB2
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 17:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785173082; cv=none; b=eGq5n1PyDTfnIkR/peVS5opkLGwWc+EvSynLEcIp3g4lI0qmdX3ibWSutosPGWVAL9CjFBc/M4GIOB+suQ70EVnwfil6m/OXi5Y8/Q5Wv2AFYnYVtSfZ91cLzie6zQbBNWILTHVzsYJU5+fzfXQGJBkH1cW4WywcjeeFMkn7UwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785173082; c=relaxed/simple;
	bh=WbF8g/slxBmfcrj5sIsR7E+s/TNERX3vtZqt9+RKd0Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=M4eGjoxzsLxf7JlIK/F+0j5KxIDDmAJLps/rMoBONslmLAQo0WSDmA9hJifC52MjDGkLgGRXLV27rE4hehvSbKDyyAgq+dqQyYxgAsDh7KU4E4+KWm6xJZfzXcZmtmjBPD6fWK6T8brEd4QCy2ghggcc0qH1aJ9cVgYTjYzFw6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aYKf2NwD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aYKf2NwD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 542911F000E9;
	Mon, 27 Jul 2026 17:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785173073;
	bh=lsK9MR2/X1b1/WV5aLfJNHjAPAzkkh91XwCtAEi7dWs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aYKf2NwDgQnrsL3Qbma2t56MJjFuc8P02JLvZHgWkT6IURSgZTnNn9TQvj1Q8fu8Q
	 ZZLpv0LwDjToSMrtzvUsSZsgXiY6A/sa+3KRgnfP2ffW+2bmEylPDiPKC974DQbZRe
	 7BVPkkpSCpR4HsgmobAlaOmnPJW+JW7QK8D3yJEpXAWbgG9yKVlK1mIC8PLDbSIQZL
	 /XAvZTUAm9h8DyTI/TElkyPPg4RrHrbv8HPs/RQ/SwH1zgz+TrS7bz0Ajb+YSo4f0s
	 +XRyLMyjp4OefO5NkZPm/RZu7u85U8Gp2n+9qbx7ldpo44Di68D09hkNsI6wgBrzng
	 hkDV0fzLCE/8Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 04/24] dmaengine: dw-edma: Make DMA link list work as
 a circular buffer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260727170323.2321369-5-den@valinux.co.jp>
References: <20260727170323.2321369-1-den@valinux.co.jp>
 <20260727170323.2321369-5-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 17:24:32 +0000
Message-Id: <20260727172433.542911F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] DMA_CYCLIC transfers do not loop continuously in hardware and exec=
ute only once, failing to implement the cyclic DMA API contract.
--

--- Patch [4]: [PATCH v3 04/24] dmaengine: dw-edma: Make DMA link list work=
 as a circular buffer ---
commit 23381b9c15312609c44ea3df9e57409eb0f1026d
Author: Frank Li <Frank.Li@nxp.com>

dmaengine: dw-edma: Make DMA link list work as a circular buffer

This commit modifies the driver to treat the DMA linked list as a circular
buffer rather than rebuilding it completely for every transfer. It
introduces helpers to manage ring space, resets the ring state upon
termination, and appends entries with alternating cycle bits.

> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-=
edma-core.c
> index 6a25a050b89c4..d7a8a43b71d64 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c
[ ... ]
> @@ -67,30 +73,75 @@ static void vchan_free_desc(struct virt_dma_desc *vde=
sc)
[ ... ]
>  static void dw_edma_core_ll_start(struct dw_edma_desc *desc)
>  {
>  	struct dw_edma_chan *chan =3D desc->chan;
>  	size_t i;
> -	bool first =3D !desc->start_burst;
> +	u32 free;
> +
> +	free =3D dw_edma_core_get_free_num(chan);
> +	for (i =3D desc->start_burst; i < desc->nburst && free; i++, free--) {

[Severity: High]
This is a pre-existing issue, but since we are modifying the linked list to
act as a circular buffer, how does the driver handle DMA_CYCLIC transfers?

Looking at dw_edma_core_ll_start(), it programs the hardware ring linearly
for the requested bursts. Because the execution stops deterministically aft=
er
processing the appended bursts due to a cycle bit mismatch, won't the DMA
engine halt when it reaches the unwritten ring slots instead of looping
continuously?

Clients using dmaengine_prep_dma_cyclic() for continuous audio or circular
buffering might encounter unexpected halts after executing the requested
number of periods instead of continuous execution.

[ ... ]
> @@ -645,6 +708,8 @@ static void dw_edma_done_interrupt(struct dw_edma_cha=
n *chan)
>  							    DMA_TRANS_NOERROR);
>  				list_del(&vd->node);
>  				vchan_cookie_complete(vd);
> +				if (!chan->non_ll)
> +					chan->ll_done =3D chan->ll_head;
>  			}

[Severity: High]
This is also a pre-existing issue, but does this interrupt completion path
break the cyclic DMA API contract?

When a client submits a cyclic transfer, the interrupt handler appears to
unconditionally complete and remove the descriptor once all bursts are
submitted.=20

Calling vchan_cookie_complete() and list_del() here terminates the cyclic
transfer completely, freeing the descriptor and preventing any continuous
hardware looping.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727170323.2321=
369-1-den@valinux.co.jp?part=3D4
