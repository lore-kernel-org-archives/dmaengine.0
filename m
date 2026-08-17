Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6608418A39;
	Mon, 17 Aug 2026 14:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786975816; cv=none; b=mDjkJRD9qu3GLdp+uvDLnpDVfBz9X8vSc/GC7/Ag6VrPZEpLg4o++WDxq6azRjImxj8xNgZy6Bkl71vNlL1THa0/Iq3Yct136QonVo0XJpIDUcPBDc7eh2c+7bKEaVm25MHG59Z3rWK66ZWb7x7+AxEzrk5Kfa58e8/SorWO1AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786975816; c=relaxed/simple;
	bh=t943H5ZyI5iqlm8KdVdq1ESqbtSXQ4Q/lcoX85ZKWCg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DK8zG8NQ5sVVcQeo5bXrDfMs+xF4jAKvIh2IdDVptE5HG9lE3KwPfcOzXJ3z8nWX0+J53GRhjsoOFugyMBWQnhbFAwsdSOC3cAvB6290yJL1ZiTFLrLLeer8qYD2IrwW7aq7hw6IphpDS4L32666U8CG7HlnB8vWOJbP/J2n9sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rw0uvjUB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rw0uvjUB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E84A1F00A3A;
	Mon, 17 Aug 2026 14:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786975814;
	bh=ZzwcsGuc8fW1Woxy1CjFOKBDqyrbW2zzm/gvf9jaUJg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Rw0uvjUBH5kLzHp8hvDj03KLngLFSiw6C8Gked9rfFzsA8iGvYZybsdGulALytdEL
	 NalPZq4xCKp9nUn7vHJG8/xx2BP3ZsLqyXzgjRyHgpvJwfYWrUn79ZxrObrp4+cd8J
	 iTOkFYO5izLXjqnBEmV2MglKh3sep5ef7G6N815IfkbvmMu9uy9dFfIxB+xIrDgVwq
	 MEstZImMkjwoCuwS2Yk/X8B3sBy/OivH320nzedslmokhOZcuJtMBbXED121qUB9QD
	 Hroa8kjDb572gwB8YP71lZyNCg0AALMGFD4zqHqjx5/d8KDavPk5rasaBTiNaWlSGz
	 3KZpC+iEwqrKw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] dmaengine: sun6i: fix undefined behaviour in
 sun6i_dma_tx_status
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Lugnberg" <christian.lugnberg@soundtrack.io>
Cc: linux-sunxi@lists.linux.dev, vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260817135723.12807-3-christian.lugnberg@soundtrack.io>
References: <20260817135723.12807-1-christian.lugnberg@soundtrack.io>
 <20260817135723.12807-3-christian.lugnberg@soundtrack.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 14:10:13 +0000
Message-Id: <20260817141014.5E84A1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Cross-channel hardware state corruption due to unprotected rea=
d of `vchan->phy`.
- [Critical] Use-After-Free of `pchan->desc` due to tasklet scheduling orde=
r during transfer completion.
- [High] Incorrect hardware residue reported for unmatched cookies due to m=
issing validation in the fallback path.
--

--- Patch [2]: [PATCH v3 2/2] dmaengine: sun6i: fix undefined behaviour in =
sun6i_dma_tx_status ---
commit 6902e79f0976789cfe066fe9007a8898713c0622
Author: Christian Lugnberg <christian.lugnberg@soundtrack.io>

dmaengine: sun6i: fix undefined behaviour in sun6i_dma_tx_status
   =20
sun6i_dma_tx_status() calls vchan_find_desc() to look up the virtual
descriptor for a given cookie, before checking whether the pointer vd is
NULL. This patch moves the to_sun6i_desc() call inside the if (vd) guard
to ensure it is only reached with a valid pointer.

> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index eb060ba2d4738..070101c109a3f 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
> @@ -984,7 +984,6 @@ static enum dma_status sun6i_dma_tx_status(struct dma=
_chan *chan,
>  	struct sun6i_pchan *pchan =3D vchan->phy;

[Severity: Critical]
This is a pre-existing issue, but caching vchan->phy outside the lock
creates a race window. If the thread is preempted right after this read,
an interrupt could fire, causing sun6i_dma_tasklet() in sun6i-dma.c to clear
vchan->phy and dynamically reassign the physical channel to a different
virtual channel.

When the thread resumes and acquires the lock, it might use a stale pchan
pointer, potentially reading the state of an unrelated transfer locklessly
in sun6i_dma_tx_status() or improperly terminating one in
sun6i_dma_terminate_all().

Could this unprotected read lead to cross-channel hardware state corruption?

[ ... ]

>  	vd =3D vchan_find_desc(&vchan->vc, cookie);
> -	txd =3D to_sun6i_desc(&vd->tx);
> =20
>  	if (vd) {
> +		struct sun6i_desc *txd =3D to_sun6i_desc(&vd->tx);
>  		for (lli =3D txd->v_lli; lli !=3D NULL; lli =3D lli->v_lli_next)
>  			bytes +=3D lli->len;
>  	} else if (!pchan || !pchan->desc) {
>  		bytes =3D 0;
>  	} else {

[Severity: High]
This isn't a bug introduced by this patch, but if a requested cookie is
newly submitted or recently completed, vchan_find_desc() will return NULL.
The driver then falls back to querying the active hardware channel (pchan)
and returns its residue.

Since vchan_find_desc() only searches the desc_issued list, does this
mean the driver assumes pchan is executing the requested cookie without
verifying if pchan->desc->vd.tx.cookie matches? Could this cause the
progress of an unrelated transfer to be reported as residue?

>  		bytes =3D sun6i_get_chan_size(pchan);

[Severity: Critical]
This is a pre-existing issue, but when a non-cyclic transfer completes,
sun6i_dma_interrupt() in drivers/dma/sun6i-dma.c calls
vchan_cookie_complete() and then schedules the driver's tasklet.

vchan_cookie_complete() schedules the virt-dma tasklet, which executes
first and frees the descriptor memory. If another processor concurrently
queries sun6i_dma_tx_status() for an unrelated cookie, it will fall back
to calling sun6i_get_chan_size(pchan):

drivers/dma/sun6i-dma.c:sun6i_get_chan_size() {
	...
	struct sun6i_desc *txd =3D pchan->desc;
	...
	for (lli =3D txd->v_lli; lli; lli =3D lli->v_lli_next) {
	...
}

Since the driver's tasklet hasn't run yet to clear pchan->desc, won't
this dereference a descriptor that has already been freed by virt-dma?

>  	}
> =20
>  	spin_unlock_irqrestore(&vchan->vc.lock, flags);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817135723.1280=
7-1-christian.lugnberg@soundtrack.io?part=3D2
