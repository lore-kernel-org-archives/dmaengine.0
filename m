Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8018D3D093A;
	Fri, 14 Aug 2026 13:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786714679; cv=none; b=L8wdRpkEZDSSnDlADb8F5TE1bLjOXTZUwhArqQV1xiuq1KNypfIwOlqHXpLX4ZiD3fy/hBCaPSKHoUVY3wVqCB28Ik+3vl8a/mGMGef904Uk3YcMaiLZYtH4clg3LYnWcl96b6uvTOzUQD7S8IphBsCqlehi3VMlFInLeQ0j+5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786714679; c=relaxed/simple;
	bh=FXeZugGxLvM0dL5ZE0D1AGM/mygv1o7P9Scmm0yiz10=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IEKyECY9Kv1CV00sBDJ/Xy3a9XysgO2tTjkqvUHo4x16EAMBtYjlwqco2iALc1DJnW1mSd4ilv4+EeuEiL2/5eDAHqMlberkc6rQthj6NflOMc9n5+ycB61Li4PXMq/Azs8MEZGq0YifgGLrZJSd9m4vVoLaeYking3ZLFT1djY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QmsB7gMp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QmsB7gMp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDBCE1F000E9;
	Fri, 14 Aug 2026 13:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786714678;
	bh=ZP72bImDoKv4rl+wolbS3DJ63p+TGGGw9j6Q0zOjbAg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QmsB7gMpMBazQu2LKL6qcPF7Cn3SgPPEhs6e+HY1i+14JiaL+g+7VwKvvGgrMFn3v
	 8F7MptWAsWTVKvi2R85Ij3irbsTJjswUnpMA5RvYJkIiZ5B09coarE1zqxEI8FUwP+
	 tjwyAIv5zJ4xJluCKLsw36slT3K7BVM9VLq65wVFEHXzXCsEx3HCg9lYO7tccgC/J6
	 zPu6kSaI3fJ+eDdZtMUsMvWHbV4cZ5Fs1s91CVdRomiD5d/2v4U/u4iosXAHDJbkQ6
	 S3CJTKsGF2NfR+sur4BfNv1C+LeDdKNmOmdVh4lFkDXzGasopwrsw1qQdICnePIe5S
	 JL9nRwERDoPpA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] dmaengine: sun6i: fix null pointer dereference in
 sun6i_dma_tx_status
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Lugnberg" <christian.lugnberg@soundtrack.io>
Cc: linux-sunxi@lists.linux.dev, Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260814132906.70322-3-christian.lugnberg@soundtrack.io>
References: <20260814132906.70322-1-christian.lugnberg@soundtrack.io>
 <20260814132906.70322-3-christian.lugnberg@soundtrack.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 13:37:57 +0000
Message-Id: <20260814133757.BDBCE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Medium] The commit message falsely claims to fix a NULL pointer derefere=
nce that causes a kernel oops, but the original code performs no memory acc=
ess at that location.

Pre-existing issues:
- [High] TOCTOU race condition from lockless read of `vchan->phy` causes ha=
rdware state corruption, use-after-free, and NULL pointer dereferences.
- [Medium] sun6i_dma_tx_status fails to verify the active descriptor's cook=
ie, causing it to report incorrect residue for unrelated cookies.
--

--- Patch [2]: [PATCH 2/2] dmaengine: sun6i: fix null pointer dereference i=
n sun6i_dma_tx_status ---
commit a4a11017b14d1cd4a177bac4da56b1c3eb480161
Author: Christian Lugnberg <christian.lugnberg@soundtrack.io>

dmaengine: sun6i: fix null pointer dereference in sun6i_dma_tx_status

This commit attempts to fix an alleged null pointer dereference in
sun6i_dma_tx_status() by moving the to_sun6i_desc() call inside the
NULL check for vd.

> vchan_find_desc() returns NULL when the descriptor has already been
> completed or is in-flight on a physical channel and no longer present
> in the virtual channel's descriptor list. Dereferencing NULL via
> to_sun6i_desc() in that case is undefined behaviour and will oops on
> any architecture that faults on NULL pointer access.

[Severity: Medium]
Is this description accurate?

Looking at the original code, to_sun6i_desc() expands to a container_of()
macro on &vd->tx. Since tx is at offset 0 of virt_dma_desc and vd is at
offset 0 of sun6i_desc, calculating the offset on a NULL pointer evaluates
to NULL through pure pointer arithmetic.

Does this actually perform a memory access that would trigger a hardware
fault or oops?

> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index eb060ba2d4738..070101c109a3f 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
> @@ -984,7 +984,6 @@ static enum dma_status sun6i_dma_tx_status(struct dma=
_chan *chan,
>  	struct sun6i_pchan *pchan =3D vchan->phy;

[Severity: High]
This is a pre-existing issue, but can this lockless read lead to state
corruption or a use-after-free?

If vchan->phy is read into the local variable pchan outside the lock,
could a concurrent tasklet take the lock, complete the transfer, clear
vchan->phy, and reassign the physical channel to a completely different
virtual channel before we acquire the lock here?

If so, would we be operating on a reassigned pchan without verifying
ownership inside the lock? It looks like this same pattern exists in
sun6i_dma_pause(), sun6i_dma_resume(), and sun6i_dma_terminate_all().

>  	struct sun6i_dma_lli *lli;
>  	struct virt_dma_desc *vd;
> -	struct sun6i_desc *txd;
>  	enum dma_status ret;
>  	unsigned long flags;
>  	size_t bytes =3D 0;

[ ... ]

>  	spin_lock_irqsave(&vchan->vc.lock, flags);
> =20
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
>  		bytes =3D sun6i_get_chan_size(pchan);

[Severity: Medium]
This is a pre-existing issue, but does this code accurately report the
residue if the queried cookie doesn't match the active descriptor?

If the queried cookie is in the desc_submitted list and therefore not
found by vchan_find_desc(), this fallback branch assumes pchan->desc
corresponds to the requested transfer.

Should we verify if pchan->desc->vd.tx.cookie =3D=3D cookie before blindly
calling sun6i_get_chan_size(pchan) and returning the residue of a
potentially unrelated transfer?

>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260814132906.7032=
2-1-christian.lugnberg@soundtrack.io?part=3D2
