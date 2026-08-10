Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D703B435EC5
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786386870; cv=none; b=Ecj+m4eyVrH0Zu+U0q82VzvM/q4er3vTXZh7COm1BtH/MHDv6DYOHcIw0psLh07MbsLP6eEU6I4xRoKD5i2PlTuMGt1YRBPF2SkgatsvaQUxa56dZwy0ysE/pmhbH87lyK4DfYG+cdQdP2w6SjL9WTqrkoZO+f+hP+xMgzjLpQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786386870; c=relaxed/simple;
	bh=VFY7v3dRfUg/12+I/tdble+cb4AEzJu5Fyhfmhq6VPI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UbVEYVjoUAoWUaZz9bIL0BZFMWN2HeSnRgPY0yI6N3xegFGziTxH4H4KyeOdKPDjw//acLnVmy3qVUjjmSoRvw2UK2ytYDwsJv3HGN0OibKS2S/zKLscmv0JpUR0Du/aIqp80Rnkq27QbCzOLtf/JFaCxk0LV8JcxzQt4jxdSLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EpIvnqnb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EpIvnqnb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD29A1F00A3A;
	Mon, 10 Aug 2026 18:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786386868;
	bh=3dFL+lKYXJg3fsnyQmFCNzaGo8Fz+hrBHiieErrQV9c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EpIvnqnbIiHuOYrikKgDWBu+gNJaOhSeGz5uXqJG6Jtl9Tzr41S38eAJTkG0XEPk/
	 Hl9vT4K5ZFz6W4gPePIytwV8fWPR5o/v3Tx07Vd9IGcbom9lhSIdEvVOvJYNJ1llZk
	 suKQdkano71I4ihtgU9JaZtQ6z5YuN50aOy+s5UXip6YpM87xnNj8K7g4F4ZbI/odB
	 cpf2N5s5bJCpDZO6rh94j0g6vEQLyHVe994kUzYFkTIt6oFvMmY7sO3qezqw2twTqz
	 Mbxp+rkE0KS9BVkEXNcxxAUbaTGwHhri/uft3zF81T1ra3atK46YXq2WkWg0OMWbsO
	 fxRcENB/pSkEg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 17/34] dmaengine: ste_dma40: convert per-channel
 tasklet to dmaengine BH
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <72495a21d3eb7ef735400e1a52deb24f3e70c944.1786384168.git.allen.lkml@gmail.com>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <72495a21d3eb7ef735400e1a52deb24f3e70c944.1786384168.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 18:34:27 +0000
Message-Id: <20260810183427.BD29A1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing IRQ free on probe error path leads to Use-After-Free
- [High] Missing `device_synchronize` callback causes UAF race condition wi=
th client callbacks
- [High] Integer underflow and out-of-bounds array access on zero-length sc=
atterlist
--

--- Patch [17]: [PATCH v3 17/34] dmaengine: ste_dma40: convert per-channel =
tasklet to dmaengine BH ---
commit fc9cce1bc39ef7ff38acb71e0dd932c23517c6a1
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: ste_dma40: convert per-channel tasklet to dmaengine BH
   =20
Replace the per-channel tasklet with the shared dmaengine BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index 0d9ffa3e26639..e6dfa1fc5e5ab 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
[ ... ]
> @@ -1641,7 +1638,7 @@ static void dma_tasklet(struct tasklet_struct *t)
>  	d40c->pending_tx--;
> =20
>  	if (d40c->pending_tx)
> -		tasklet_schedule(&d40c->tasklet);
> +		dmaengine_schedule_bh(&d40c->chan);
> =20
>  	spin_unlock_irqrestore(&d40c->lock, flags);

[Severity: High]
This is a pre-existing issue, but I noticed the callback is executed
without the channel lock held here.

Is it possible for a concurrent client termination to return early and free
resources?

The ste_dma40 driver does not implement the device_synchronize callback.
When a client calls dmaengine_terminate_sync(), the core
dmaengine_synchronize() fallback acts as a no-op.

If dmaengine_terminate_sync() is called while this background handler has
dropped the lock to execute dmaengine_desc_callback_invoke(), could the
termination return immediately instead of waiting for the callback to finis=
h?

This might allow the client to proceed and free buffers or structures that
the background callback is actively accessing.


Also, I noticed another pre-existing issue in the probe error path:

drivers/dma/ste_dma40.c:d40_probe() {
    ...
		dev_err(dev,
			"could not register of_dma_controller\n");
		goto destroy_cache;
	}

	dev_info(base->dev, "initialized\n");
	return 0;

 destroy_cache:
	if (base->lcla_pool.dma_addr)
		dma_unmap_single(base->dev, base->lcla_pool.dma_addr,
				 SZ_1K * base->num_phy_chans,
				 DMA_TO_DEVICE);
    ...
}

[Severity: High]
This is a pre-existing issue, but does this error path need a free_irq()?

If a subsequent initialization step fails (e.g.,=20
of_dma_controller_register()), the code jumps to destroy_cache and returns
an error without freeing the IRQ.

Then devres automatically frees the memory allocated for the d40_base
structure.

If an interrupt fires after a probe failure, could d40_handle_interrupt()
execute using the freed base pointer?


Finally, I saw a potential out-of-bounds access in the scatterlist preparat=
ion:

drivers/dma/ste_dma40.c:d40_prep_sg() {
    ...
	desc =3D d40_prep_desc(chan, sg_src, sg_len, dma_flags);
	if (desc =3D=3D NULL)
		goto unlock;

	if (sg_next(&sg_src[sg_len - 1]) =3D=3D sg_src)
		desc->cyclic =3D true;
    ...
}

[Severity: High]
This is a pre-existing issue, but does this code correctly handle an empty
scatterlist?

If a client provides an empty scatterlist where sg_len is 0, does the
subtraction sg_len - 1 underflow to UINT_MAX?

Could this lead to d40_prep_desc() successfully returning a zero-length
allocation, and then the condition sg_next(&sg_src[UINT_MAX]) triggering
a massive out-of-bounds memory read?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786384168.gi=
t.allen.lkml@gmail.com?part=3D17
