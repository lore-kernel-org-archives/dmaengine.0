Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C4E18BBAE;
	Wed, 17 Jun 2026 02:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781664495; cv=none; b=qxnVYqnB2Ngjh1BF8KCPf03IjJOpxXg8gtanhO2jhYWGl4lvtLK2iTmMLB6eVsHi0Hx1z66M6jJouC+UVPbpFIAsohkfwmJwOUN3xaGUxhorEQpKxOBQAHLw8ZVNC4rYYe3h4jxw42Q3s82xKA26v3o8cawNHzll7YFK7nlWJ3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781664495; c=relaxed/simple;
	bh=Hw0B26/WnNp1xrMwAoW6xOEAXWG+B9DC7HYOAIRXqIc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=I+kamqZMU/2UEtKcaRzgXZ73Ijonc4nYbs0WqI565JYOsktQe3QGRQf+2XVLphENqcuG+FB/6oFcBZTjmPP+K64Y8nfxatYPy6z1CHXbqo0kb8qORXof41aGzRHfPVvrcQ7YeR3uAY7z6TQAwc7RgGyWjfvExzJIYMvL1VUawxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hcYdRoZr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hcYdRoZr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A10FE1F000E9;
	Wed, 17 Jun 2026 02:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781664493;
	bh=sgm7PVJ3FDl9F3x/a4Nrs+5O4PkzMC5eyxGkQuxBnhU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hcYdRoZruQTbomqnc0zhYac+AAP8UEPVchFbke6kWe5aSz6mLUvIpoYroBKKoaaNS
	 BIL9gL4+1pX9TlFB3UgHWwPhS92aPb8Et39n3TcYoNPMevTOnn/GRADvyW06h3T4td
	 RCfrpAdVV4ce8l0bRc08HQs2gk04JWqeKL7POM5ke/BiWNlpBeL93dvTOPd9DniKzp
	 RRcxUB2w+P3Gwgs3gq6eh2w+WJ5NX520PMSQVHkRdUt3fxX9ptOlszWL32ftVA64ef
	 qc/X5AP5ABMDW27DgWgZ3Gbp2axOw8cAIXSKRZv7tVox83EKyYsaQefXmUi4CVGNq/
	 /8eoyU5aw6H7g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] dmaengine: sun6i-dma: Fix memory leak in
 sun6i_dma_terminate_all
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongling Zeng" <zenghongling@kylinos.cn>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, linux-sunxi@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260617023411.574488-1-zenghongling@kylinos.cn>
References: <20260617023411.574488-1-zenghongling@kylinos.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jun 2026 02:48:13 +0000
Message-Id: <20260617024813.A10FE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] A concurrency race condition between `sun6i_dma_interrupt` and=
 `sun6i_dma_terminate_all` leads to a NULL pointer dereference or Use-After=
-Free.
- [High] Time-Of-Check to Time-Of-Use (TOCTOU) race condition on `vchan->ph=
y` in `sun6i_dma_terminate_all` leads to severe state and linked list corru=
ption.
- [High] Use-After-Free in the `err_lli_free` error path of `sun6i_dma_prep=
_slave_sg` and `sun6i_dma_prep_dma_cyclic`.
- [High] Deadlock due to acquiring `sdev->lock` without disabling softirqs =
in process context.
--

commit ef76fa0808e0c4c9df78bcb34c318f781e0ae211
Author: Hongling Zeng <zenghongling@kylinos.cn>

    dmaengine: sun6i-dma: Fix memory leak in sun6i_dma_terminate_all
   =20
    When terminating a non-cyclic DMA transfer, the active descriptor
    is not properly reclaimed because only cyclic transfer descriptors
    are added to the desc_completed list before cleanup. This causes
    the descriptor and its associated LLI chain to be permanently leaked.
    This fix ensures both cyclic and non-cyclic active descriptors are
    added to the list before setting pchan->desc to NULL.

> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index a9a254dbf8cb9..f47a326dd7ffa 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
> @@ -945,16 +945,13 @@ static int sun6i_dma_terminate_all(struct dma_chan =
*chan)

[Severity: High]
This is a pre-existing issue, but can acquiring sdev->lock cause a deadlock
here?

Earlier in this function:

	spin_lock(&sdev->lock);
	list_del_init(&vchan->node);
	spin_unlock(&sdev->lock);

Because spin_lock() does not disable softirqs, could a hardware interrupt
occur while this lock is held, schedule sun6i_dma_tasklet(), and cause the
tasklet to spin forever on sdev->lock in softirq context on the same CPU?
This exact same locking pattern also appears in sun6i_dma_pause().


[Severity: High]
This is a pre-existing issue, but is there a TOCTOU race on vchan->phy?

At the beginning of sun6i_dma_terminate_all(), pchan is read locklessly:

	struct sun6i_pchan *pchan =3D vchan->phy;

Could sun6i_dma_tasklet() free this physical channel and reallocate it to a
different virtual channel before we acquire the lock? If so, does mutating
pchan->desc and calling vchan_terminate_vdesc(vd) below corrupt the
descriptor lists of an unrelated channel?

> =20
>  	spin_lock_irqsave(&vchan->vc.lock, flags);
> =20
> -	if (vchan->cyclic) {
> -		vchan->cyclic =3D false;
> -		if (pchan && pchan->desc) {
> -			struct virt_dma_desc *vd =3D &pchan->desc->vd;
> -			struct virt_dma_chan *vc =3D &vchan->vc;
> +	if (pchan && pchan->desc && pchan->desc !=3D pchan->done) {
> +		struct virt_dma_desc *vd =3D &pchan->desc->vd;
> =20
> -			list_add_tail(&vd->node, &vc->desc_completed);
> -		}
> +		vchan_terminate_vdesc(vd);
>  	}
> =20
> +	vchan->cyclic =3D false;
>  	vchan_get_all_descriptors(&vchan->vc, &head);
> =20
>  	if (pchan) {

[Severity: Critical]
This is a pre-existing issue, but does sun6i_dma_terminate_all() race with
sun6i_dma_interrupt()?

Later in this function, we set pchan->desc =3D NULL under vchan->vc.lock:

	if (pchan) {
		writel(DMA_CHAN_ENABLE_STOP, pchan->base + DMA_CHAN_ENABLE);
		writel(DMA_CHAN_PAUSE_RESUME, pchan->base + DMA_CHAN_PAUSE);

		vchan->phy =3D NULL;
		pchan->vchan =3D NULL;
		pchan->desc =3D NULL;
		pchan->done =3D NULL;
	}

If sun6i_dma_interrupt() is currently executing on another CPU, it evaluates
pchan->desc->vd either locklessly (for cyclic) or blocks on vchan->vc.lock
(for non-cyclic):

	if (vchan->cyclic) {
		vchan_cyclic_callback(&pchan->desc->vd);
	} else {
		spin_lock(&vchan->vc.lock);
		vchan_cookie_complete(&pchan->desc->vd);
		...

Once sun6i_dma_terminate_all() drops the lock, sun6i_dma_interrupt() will
dereference the invalidated pointer. Can this cause a NULL pointer derefere=
nce
or a Use-After-Free?


[Severity: High]
This isn't a bug introduced by this patch, but is there a Use-After-Free in
the error path of sun6i_dma_prep_slave_sg() and sun6i_dma_prep_dma_cyclic()?

In the err_lli_free label of both functions:

err_lli_free:
	for (p_lli =3D txd->p_lli, v_lli =3D txd->v_lli; v_lli;
	     p_lli =3D v_lli->p_lli_next, v_lli =3D v_lli->v_lli_next)
		dma_pool_free(sdev->pool, v_lli, p_lli);

dma_pool_free() frees v_lli, but the loop update expression subsequently
evaluates v_lli =3D v_lli->v_lli_next. Does this dereference the freed memo=
ry?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260617023411.5744=
88-1-zenghongling@kylinos.cn?part=3D1
