Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B54B440627
	for <dmaengine@vger.kernel.org>; Wed, 19 Aug 2026 22:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787179588; cv=none; b=A2G/ZO7l7esyCvIa7HTga32TKIt/Tlg1Hl/GZGsTaYMI7r9XvWYvD1VQC7vE8THNOOT/3w611ebjqkZs8GPftZnyg+SBHMdYkNGJPIuVQVo3RVd5rWndaa2UwwIcIqDjHD0wjiwkcWoMdwNru+4EIrBfbfyFZAJIZBbX01cP7n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787179588; c=relaxed/simple;
	bh=njmLRSE8JJHD24thMGV1v1DDnxNbWTQrBKmqa/euBKA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XzZyGW0lmPFMtY/85pVjkks2ir8upLYifHnZkYjNTtC+ECVmXGzlkzu/W5imNYpbj5cLUzapY7r3wJNZDrK7lbrQVQw7M95bqxx9L5OJfQLm/ZTHNGXwo7u2fD4PsoNaN1TFV6rAMx5e+WcEcGK5N+vKoMP/AVk4MyVHWSaT7Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xh7Vk3+p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xh7Vk3+p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83C151F000E9;
	Wed, 19 Aug 2026 22:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787179586;
	bh=FDM3p7xh1b1J2iNikEXyQ2ju7VoKZI7D7DviavcpNgs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Xh7Vk3+pjjx1XqkcUQULufCUTs3t0o+bKOc+uNb5OOzH7eYYlUYnhkLxkLLhepZcw
	 zgkuUPZpezYiI8i7f71cdQfagjuBc6EbALckGhpn2dKoF5vnOXuZuyMKlFhreu7ONZ
	 IjmCbwTQ+kvnVV9RUzOkF5wFo/W45m9M1aYoLigdAjMyhlCNOrUrmNjYFHuN46d8r2
	 1bdTb9NIDjXGFhQ2+m2TaAPBnpyz0m5CgQH0CFVq0X1x9LAOROV/NLwhtCq4s6xxUS
	 qQEJfeUr2eZpRLKVOgVCYXEu77EIvzPUmHwiM422+FciXPV3y7g00tY2kqdv5N/X9b
	 mNU7iTqWJGV8A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] dmaengine: ste_dma40: Fix failed start cleanup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260820-dma40-fixes-v1-1-5e14815ad689@kernel.org>
References: <20260820-dma40-fixes-v1-0-5e14815ad689@kernel.org>
 <20260820-dma40-fixes-v1-1-5e14815ad689@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 22:46:26 +0000
Message-Id: <20260819224626.83C151F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Returning ERR_PTR(err) from d40_queue_start() introduces a PM runt=
ime reference leak and breaks caller logic in dma_tc_handle().
- [High] Freeing a submitted descriptor directly on error bypasses the DMA =
framework, causing the client to hang.
--

--- Patch [1]: [PATCH 1/4] dmaengine: ste_dma40: Fix failed start cleanup -=
--
commit 0baedf8f0f8ca2b28e1d6d6a6bce21f2db82302b
Author: Linus Walleij <linusw@kernel.org>
Date:   Wed Aug 19 22:35:57 2026 +0000

dmaengine: ste_dma40: Fix failed start cleanup

If d40_start() fails after a queued descriptor has been moved to the active
list, d40_queue_start() currently returns NULL without unwinding the
descriptor state or clearing the channel busy flag. This commit attempts
to fix the error path by freeing the descriptor and returning an error poin=
ter.

Link: https://lore.kernel.org/dmaengine/20260618051539.15E201F000E9@smtp.ke=
rnel.org/

> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
> @@ -1531,8 +1531,12 @@ static struct d40_desc *d40_queue_start(struct d40=
_chan *d40c)
>  		/* Start dma job */
>  		err =3D d40_start(d40c);
> =20
> -		if (err)
> -			return NULL;
> +		if (err) {
> +			d40_desc_remove(d40d);
> +			d40_desc_free(d40c, d40d);

[Severity: High]
Does silently freeing the submitted descriptor here cause the DMA client to
hang?

The descriptor has already been submitted to the DMA framework, which means=
 the
client holds a cookie and expects a completion callback. Bypassing the
framework and freeing the memory directly prevents the framework from compl=
eting
the cookie, meaning the client will wait indefinitely for a callback that w=
ill
never arrive.

> +			d40c->busy =3D false;
> +			return ERR_PTR(err);

[Severity: High]
Does returning ERR_PTR(err) here introduce a PM runtime reference leak?

Earlier in d40_queue_start(), a PM runtime reference is acquired:

	if (d40d !=3D NULL) {
		if (!d40c->busy) {
			d40c->busy =3D true;
			pm_runtime_get_sync(d40c->base->dev);
		}

This error path returns ERR_PTR(err) and sets busy to false without dropping
that newly acquired reference.

Additionally, changing the return value breaks the caller logic in
dma_tc_handle(), which explicitly checks for a NULL return to drop the PM
reference:

drivers/dma/ste_dma40.c:dma_tc_handle() {
    ...
		if (d40_queue_start(d40c) =3D=3D NULL) {
			d40c->busy =3D false;
			pm_runtime_put_autosuspend(d40c->base->dev);
		}
    ...
}

Because ERR_PTR(err) is not NULL, this condition evaluates to false, skippi=
ng
pm_runtime_put_autosuspend() and leaking the reference.

> +		}
>  	}
> =20
>  	return d40d;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820-dma40-fixe=
s-v1-0-5e14815ad689@kernel.org?part=3D1
