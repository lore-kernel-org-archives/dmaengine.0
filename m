Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505C93D5229
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785185734; cv=none; b=ngY36xWy9dwjQen4Gl7Naalz0135mFYTw65ZK0JiFPqCp36cosgzVXkL7wlAEnqpFE3LbeGDMrdkDrHWkQwCQjbuH43yexj0AoYrtJZDJZvUg9PR4EKlVD88Fk2LFsXYHwRlIW4lVKJEphvDom4BOGPmavfkZFQv0vdPlWCgYvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785185734; c=relaxed/simple;
	bh=OUXfJuBR0atqp93GMG88kq+h2AszT3ACKr1uxytLSSU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DEok2i0n/f+W4SZj/oaYnii0djGJH4zDR5utR2Q3dAFphkC+kReYMWpe8PozDrPVJb5L6Y869+30BHm0YPG8Fe9pZLUSnzTuu6x6Jky06fRCv8jOoWNSaGZWOvmZHijSKbADOboOV6GhxPVw1Qea3hUwyP9NSN6zN26s77j9NZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hw+pyxLY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hw+pyxLY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B11E1F000E9;
	Mon, 27 Jul 2026 20:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785185732;
	bh=HhHrPiiOePYWKObYsUz2A7L76F1mZeQMwS0QsTjvFlg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hw+pyxLYYTIR1sF1D5diG6k37s/gJ5QZjjk9mIfC6Gr+DjEKXkBoq7CME9h7OIozv
	 L3Yj0LliKLT2zcl7qODTMfc0tqcS1xvZ0JhaNfsPdqTVT2GZ7WwIjgyJ2uvzudKUtD
	 hbhkkM8JmNY4v4EUGRz9+I3cC7A+Bra7CX8I/w+VSlhYQrdlENcAyY6SodZqhzxIch
	 NrRh0wsTadFRTNH6+ofAE+244JCBhQbOUv5ZMMLz9DkNkkMHTzfgYObHLbBy5o/pAz
	 zdEUtsbCcFilnk4WyXCe7WyuXOwrgr2JHtrLnyvACLUVzFl/eVv1wwdItR/dndU2jx
	 cmIbZ/EL8+USA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 11/64] dmaengine: mmp_tdma: hook completions to
 dma_chan BH
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <6b016025aba50032c5c1560d237923294a2f6ab5.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <6b016025aba50032c5c1560d237923294a2f6ab5.1785183549.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 20:55:32 +0000
Message-Id: <20260727205532.9B11E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing teardown of bottom-half work during channel release, leadi=
ng to potential use-after-free.
- [High] Incorrect devres initialization ordering for shared interrupts cau=
ses NULL pointer dereferences on probe and use-after-free on unbind.
- [High] SRAM descriptors allocated from the `gen_pool` are leaked when `mm=
p_tdma_prep_dma_cyclic` fails or is called multiple times.
--

--- Patch [11]: [PATCH v2 11/64] dmaengine: mmp_tdma: hook completions to d=
ma_chan BH ---
commit c186dbcb9d7ae1ce6b3473be898cbd442e74d154
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: mmp_tdma: hook completions to dma_chan BH

This commit replaces the per-channel tasklet with the shared dma_chan BH he=
lper.
The handler continues to run in softirq context while dmaengine manages the
common scheduling and teardown mechanism.

> diff --git a/drivers/dma/mmp_tdma.c b/drivers/dma/mmp_tdma.c
> index ba03321eeff79..d1ed2886f0e70 100644
> --- a/drivers/dma/mmp_tdma.c
> +++ b/drivers/dma/mmp_tdma.c

[ ... ]

> @@ -320,7 +319,7 @@ static irqreturn_t mmp_tdma_chan_handler(int irq, voi=
d *dev_id)
>  	struct mmp_tdma_chan *tdmac =3D dev_id;
> =20
>  	if (mmp_tdma_clear_chan_irq(tdmac) =3D=3D 0) {
> -		tasklet_schedule(&tdmac->tasklet);
> +		dma_chan_schedule_bh(&tdmac->chan);
>  		return IRQ_HANDLED;
>  	} else
>  		return IRQ_NONE;
> @@ -346,9 +345,9 @@ static irqreturn_t mmp_tdma_int_handler(int irq, void=
 *dev_id)
>  		return IRQ_NONE;
>  }

[Severity: High]
This is a pre-existing issue, but is it possible for this interrupt handler=
 to
trigger before the channel structures are fully initialized?

Looking at mmp_tdma_probe(), devm_request_irq() is called with IRQF_SHARED
before the channel structures are allocated and assigned:

drivers/dma/mmp_tdma.c:mmp_tdma_probe() {
    ...
    ret =3D devm_request_irq(&pdev->dev, irq,
                           mmp_tdma_int_handler, IRQF_SHARED, "tdma", tdev);
    ...
}

If the shared IRQ line fires immediately, mmp_tdma_int_handler() iterates o=
ver
tdev->tdmac[] and unconditionally passes a potentially uninitialized NULL p=
ointer
to mmp_tdma_chan_handler(). Could this lead to a NULL pointer dereference on
probe, or a use-after-free on unbind since devres reverses the initializati=
on
order?

> -static void dma_do_tasklet(struct tasklet_struct *t)
> +static void dma_do_tasklet(struct dma_chan *c)
>  {
> -	struct mmp_tdma_chan *tdmac =3D from_tasklet(tdmac, t, tasklet);
> +	struct mmp_tdma_chan *tdmac =3D container_of(c, struct mmp_tdma_chan, c=
han);
> =20
>  	dmaengine_desc_get_callback_invoke(&tdmac->desc, NULL);
>  }
> @@ -583,7 +582,7 @@ static int mmp_tdma_chan_init(struct mmp_tdma_device =
*tdev,
>  	tdmac->pool	   =3D pool;
>  	tdmac->status =3D DMA_COMPLETE;
>  	tdev->tdmac[tdmac->idx] =3D tdmac;
> -	tasklet_setup(&tdmac->tasklet, dma_do_tasklet);
> +	dma_chan_init_bh(&tdmac->chan, dma_do_tasklet);

[Severity: High]
This isn't a bug introduced by this patch, but should the bottom-half work =
be
explicitly torn down during channel release?

Currently, mmp_tdma_free_chan_resources() frees channel resources without
calling dma_chan_kill_bh():

drivers/dma/mmp_tdma.c:mmp_tdma_free_chan_resources() {
    ...
}

Similarly, when the device unbinds, devres frees the channel structure (tdm=
ac)
but mmp_tdma_remove() does not explicitly kill the bottom-half work.

Could this leave pending bottom-half tasks to execute after memory is freed=
 by
devres, leading to a use-after-free?

>  	/* add the channel to tdma_chan list */
>  	list_add_tail(&tdmac->chan.device_node,

[Severity: High]
This is a pre-existing issue, but can mmp_tdma_prep_dma_cyclic() leak SRAM
descriptors allocated from the gen_pool?

If mmp_tdma_config_write() fails, the function branches to err_out without
freeing the newly allocated descriptor:

drivers/dma/mmp_tdma.c:mmp_tdma_prep_dma_cyclic() {
    ...
    desc =3D mmp_tdma_alloc_descriptor(tdmac);
    if (!desc)
        goto err_out;

    if (mmp_tdma_config_write(chan, direction, &tdmac->slave_config))
        goto err_out;
    ...
}

Additionally, mmp_tdma_alloc_descriptor() unconditionally assigns the newly
allocated memory to tdmac->desc_arr:

drivers/dma/mmp_tdma.c:mmp_tdma_alloc_descriptor() {
    ...
    tdmac->desc_arr =3D gen_pool_dma_alloc(gpool, size, &tdmac->desc_arr_ph=
ys);
    ...
}

If mmp_tdma_prep_dma_cyclic() is called multiple times without an interveni=
ng
mmp_tdma_free_chan_resources(), the previous descriptor is blindly overwrit=
ten
and permanently leaked. Could this exhaust the limited device SRAM pool and
prevent further DMA operations?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785183549.gi=
t.allen.lkml@gmail.com?part=3D11
