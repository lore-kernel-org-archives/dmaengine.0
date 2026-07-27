Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7529036B905
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 21:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785186610; cv=none; b=B2tRzwH/ba1W0FVA0CxdlEGPj/eRCwntlBd8q2u+ARp3rmXDQjMJbtwFX59R9N4gjePHC9SDL6CE/IatP6eR5IdCFYgMLm8eS6jSVlSn/IkgtovAmhhuYdRf3rOcFwcFfR6KrP+e8zHLEMiW0ukaJLyRabR+4v6ZQVKw5QhvzPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785186610; c=relaxed/simple;
	bh=IljmAEdTCNsyEGUvm4pIMEF2E7UvTjKZJ0WFTzse9jg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sOS97Fk8S07VOjtkNyH06QY6p8M4lKKVRKrb/3mRm6z4rRcafmpZzjKSYM/y9LUWsLXS7Z7uhKQFglxhguek9MA52boI1gHA8iIi609PgcW7xARPrj1pmSwkYXAYCkGMvVSsagSPQEWPIvAvW7O3MOZnOh5sXvW9eqydj2SZfrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LM2a2dls; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LM2a2dls"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B921F1F000E9;
	Mon, 27 Jul 2026 21:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785186609;
	bh=D3ItLjM+2WABz/t1KM7oVHl5uly/WMsW3NSik7uKBug=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LM2a2dlsGFgpuC21o4macd4vgSSDUPDWrJwnY7F9rhH3mD6F3P4SiPWmplt2TNLj8
	 mJDYVgIltn65oEtqJZhRXWXLc5U8CBnvGZv8SDIpVoROdHLDah2tiLU9mLnMJqD5Pf
	 5NQ7vUO65fmVZziGbcYwzDimt6k31sUd8o7o0gvya24GXxyjx++ciI3CQC/IRrnHRj
	 xPHC/8mvxHenE+BnHGb3t6cgU4PAiJFvGZGLjZLTEcfGcHw9IuUMct0doIq4iHap5s
	 NSDYCsjdY0OcDzBVrbHmdqdn18EJIdeBAaZuqCO0wWS7X0fIOiXmzkVO0o0XPolvxT
	 x/DEidsTrOSBQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 32/64] dmaengine: k3-udma: use channel BH for vchan
 completions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <590639c835c2926e2ff26d803f1282a27b147555.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <590639c835c2926e2ff26d803f1282a27b147555.1785183549.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 21:10:08 +0000
Message-Id: <20260727211008.B921F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Dangling `vc->cyclic` pointer causes a Use-After-Free in `udma_vch=
an_complete` when a channel running a cyclic transfer is terminated.
--

--- Patch [32]: [PATCH v2 32/64] dmaengine: k3-udma: use channel BH for vch=
an completions ---
commit 8a0a241d872268ead0d3f5e593bb261aae3ac2ff
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: k3-udma: use channel BH for vchan completions
   =20
This patch converts the custom vchan completion handling in the k3-udma
driver from a tasklet to a per-channel bottom-half mechanism. It updates
the initialization and teardown paths to use the new dma_chan_kill_bh() API.

> diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
> index 1cf158eb7bdb5..12b8a9caf4d2b 100644
> --- a/drivers/dma/ti/k3-udma.c
> +++ b/drivers/dma/ti/k3-udma.c

[ ... ]

> @@ -4042,12 +4042,12 @@ static void udma_desc_pre_callback(struct virt_dm=
a_chan *vc,
>  }
> =20
>  /*
> - * This tasklet handles the completion of a DMA descriptor by
> + * This BH handles the completion of a DMA descriptor by
>   * calling its callback and freeing it.
>   */
> -static void udma_vchan_complete(struct tasklet_struct *t)
> +static void udma_vchan_complete(struct dma_chan *chan)
>  {
> -	struct virt_dma_chan *vc =3D from_tasklet(vc, t, task);
> +	struct virt_dma_chan *vc =3D to_virt_chan(chan);

[Severity: High]
This is a pre-existing issue, but could this bottom half handler trigger a
use-after-free of the cyclic descriptor?

Looking at the teardown path, if a channel is actively running a cyclic
transfer, udma_terminate_all() moves uc->desc to uc->terminated_desc but
crucially leaves vc->cyclic pointing to the active descriptor.

When the hardware sends a teardown completion message, the IRQ handler
udma_ring_irq_handler() frees the active descriptor via
udma_desc_free(&uc->terminated_desc->vd). At this point, vc->cyclic becomes
a dangling pointer.

The driver then calls udma_synchronize(), which calls vchan_synchronize().
This flushes the bottom half by calling dma_chan_kill_bh(), which happens
before vc->cyclic is checked and cleared:

drivers/dma/virt-dma.c:vchan_synchronize() {
    dma_chan_kill_bh(&vc->chan);

    spin_lock_irqsave(&vc->lock, flags);
    if (vc->cyclic) {
        vchan_terminate_vdesc(vc->cyclic);
        vc->cyclic =3D NULL;
    }
}

When the bottom half executes, it reads the dangling vc->cyclic pointer and
dereferences it:

    vd =3D vc->cyclic;
    if (vd) {
        vc->cyclic =3D NULL;
        dmaengine_desc_get_callback(&vd->tx, &cb);

Does this sequence cause a use-after-free when dmaengine_desc_get_callback()
accesses the freed descriptor?

>  	struct virt_dma_desc *vd, *_vd;
>  	struct dmaengine_desc_callback cb;
>  	LIST_HEAD(head);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785183549.gi=
t.allen.lkml@gmail.com?part=3D32
