Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA8030C147
	for <dmaengine@vger.kernel.org>; Sun, 30 Aug 2026 12:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788092653; cv=none; b=vDNmCSUOUUuO0sOTSRc7vd3iqTcMe3IOebnP4VAfpelhCrijHN5/pEG1ucn7OXE/XkKb6wxA3oP3NZBcklUAM+dXCkuXK7Jd774blHKEQTSR2B6V9nYFo/cxt1n6V5jE2ZejGb1Mj7hLUCCjHFJ98wBp/LD9PBg3RulnMntpqss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788092653; c=relaxed/simple;
	bh=lEFhTG5pGAHGjjXusM7Fnan3skOQPXzYmA63SrR2pmQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ky8FrbdMUNZnHSRK0hySLtam9ad6wVcjZ7nvnNMOvEnz1CqKOmZoQNiOPBn7EVvp5VCoCioKlkJYmNdG0RXyZX09FpE9C9K9CP3lGiKj+MHT8Kno4N6qSQCkT+s0+x76cO8xmJ7T+cEK5SJrSWz2dxF8MoCj5DDB8TTlUtnyvpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PNroLnfk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PNroLnfk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5D031F000E9;
	Sun, 30 Aug 2026 12:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788092651;
	bh=Iqckwr3CtnOOPzy2s4JELbKlhL4XKaHZwQDFfSSfyhY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PNroLnfkM/Wm+1z6lGQ1IS4IRZ6QuiXRwKdtFBAfBgSMy9rejvMJPEY+153/LM/+X
	 FGHKO9jRhi3r+DwKNsY147eF//hDMOex+BaIpFdQ4A/6aRkGYwpAC3TULPuosGGLOJ
	 IZq24XXLxMK+SEqzlY3eatM5GO7lj8q755vbguSXExwp5cQOVlDipLswNk0Gs6wpfU
	 Xms4bbXyjRYvTnS1NmmjMr2UJ2/y1nTQDU7emlIC2ZHVaLV8b25xECI3CX3Gn96qPF
	 bz5DseKu0l3cBDWy5c1iyS2+0evRBDg6Ijoc53heAbXPZ7lONj69fFbhdOZN5zZzJ6
	 MH5Whz7bJ+tgg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] dmaengine: mediatek: initialize tasklets before
 requesting IRQs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Runyu Xiao" <runyu.xiao@seu.edu.cn>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260830120955.2638359-1-runyu.xiao@seu.edu.cn>
References: <20260830060422.2204459-1-runyu.xiao@seu.edu.cn>
 <20260830120955.2638359-1-runyu.xiao@seu.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 Aug 2026 12:24:11 +0000
Message-Id: <20260830122411.A5D031F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The DMA device, OF controller, and IRQ handlers are registered and=
 exposed to the system before the hardware clocks and power domains are ena=
bled, risking a fatal system crash.
- [High] Incorrect teardown ordering in `mtk_cqdma_remove` allows virtual c=
hannel tasklets to be rescheduled after they are killed, leading to use-aft=
er-free, and permits hardware access during de-initialization.
- [High] `mtk_cqdma_remove` manually removes channels from the device list,=
 completely bypassing channel unregistration and leaking memory and ID allo=
cations.
- [High] Lockless access of descriptor state in `mtk_cqdma_tx_status` leads=
 to a TOCTOU use-after-free.
- [High] If `mtk_cqdma_prep_dma_memcpy` is called with a transfer length of=
 0, memory allocation returns `ZERO_SIZE_PTR`, bypassing the NULL check and=
 causing a kernel Oops.
--

commit 8a7b8d66b024c2ee132ed95053a3dfaf346172c6
Author: Runyu Xiao <runyu.xiao@seu.edu.cn>

dmaengine: mediatek: initialize tasklets before requesting IRQs

The CQDMA probe registers each physical-channel IRQ before initializing
the tasklet scheduled by the interrupt handler. A pending interrupt can
access an uninitialized physical channel or schedule an uninitialized
tasklet while probe is still running.

Link: https://lore.kernel.org/all/20260830060422.2204459-1-runyu.xiao@seu.e=
du.cn/

> diff --git a/drivers/dma/mediatek/mtk-cqdma.c b/drivers/dma/mediatek/mtk-=
cqdma.c
> index 80791e30aec24..741b6325cdee4 100644
> --- a/drivers/dma/mediatek/mtk-cqdma.c
> +++ b/drivers/dma/mediatek/mtk-cqdma.c

[ ... ]

> @@ -805,41 +805,54 @@ static int mtk_cqdma_probe(struct platform_device *=
pdev)
>  		err =3D platform_get_irq(pdev, i);
>  		if (err < 0)
> -			return err;
> +			goto err_tasklets;
>  		cqdma->pc[i]->irq =3D err;
> +	}
> =20
> +	/* Register IRQs only after all PCs are initialized. */
> +	for (i =3D 0; i < cqdma->dma_channels; ++i) {
>  		err =3D devm_request_irq(&pdev->dev, cqdma->pc[i]->irq,
>  				       mtk_cqdma_irq, 0, dev_name(&pdev->dev),
>  				       cqdma);

[Severity: High]
This is a pre-existing issue, but does requesting the IRQ here unmask inter=
rupts
at the controller, allowing the ISR to execute unclocked register reads bef=
ore
the hardware clocks are enabled?

>  		if (err) {
>  			dev_err(&pdev->dev,
>  				"request_irq failed with err %d\n", err);

[ ... ]

> @@ -850,7 +863,7 @@ static int mtk_cqdma_probe(struct platform_device *pd=
ev)
> =20
>  	err =3D dma_async_device_register(dd);
>  	if (err)
> -		return err;
> +		goto err_tasklets;

[Severity: High]
This is a pre-existing issue, but is the DMA device exposed to clients befo=
re
its hardware is initialized?

> =20
>  	err =3D of_dma_controller_register(pdev->dev.of_node,
>  					 of_dma_xlate_by_chan_id, cqdma);
> @@ -864,22 +877,36 @@ static int mtk_cqdma_probe(struct platform_device *=
pdev)
>  	err =3D mtk_cqdma_hw_init(cqdma);
>  	if (err) {

[Severity: High]
This is a pre-existing issue, but hardware clocks and PM runtime are only
initialized here, which appears to be too late in the probe sequence. Could=
 an
immediately pending interrupt or an immediate DMA request access the uncloc=
ked
hardware, leading to a fatal system crash?

[ ... ]

This is a pre-existing issue, but could the incorrect teardown ordering in
mtk_cqdma_remove() lead to use-after-free and hardware access during
de-initialization?

drivers/dma/mediatek/mtk-cqdma.c:mtk_cqdma_remove() {
...
	/* kill VC task */
	for (i =3D 0; i < cqdma->dma_requests; i++) {
		vc =3D &cqdma->vc[i];

		list_del(&vc->vc.chan.device_node);
		tasklet_kill(&vc->vc.task);
	}
...
	for (i =3D 0; i < cqdma->dma_channels; i++) {
		spin_lock_irqsave(&cqdma->pc[i]->lock, flags);
		mtk_dma_clr(cqdma->pc[i], MTK_CQDMA_INT_EN,
			    MTK_CQDMA_INT_EN_BIT);
		spin_unlock_irqrestore(&cqdma->pc[i]->lock, flags);

		/* Waits for any pending IRQ handlers to complete */
		synchronize_irq(cqdma->pc[i]->irq);

		tasklet_kill(&cqdma->pc[i]->tasklet);
	}

	/* disable hardware */
	mtk_cqdma_hw_deinit(cqdma);

	dma_async_device_unregister(&cqdma->ddev);
...
}

[Severity: High]
VC tasklets are killed prematurely before PC producers and IRQs are fully
stopped. Furthermore, the teardown loop fails to call disable_irq(), leavin=
g the
global IRQ handler vulnerable to cross-channel polling execution. Lastly, i=
s it
safe that the DMA device is unregistered after hardware deinitialization, w=
hich
might allow late client requests to interact with unclocked hardware?


This is a pre-existing issue, but does mtk_cqdma_remove() manually remove
channels from the device list, completely bypassing channel unregistration
and leaking memory and ID allocations?

drivers/dma/mediatek/mtk-cqdma.c:mtk_cqdma_remove() {
...
	for (i =3D 0; i < cqdma->dma_requests; i++) {
		vc =3D &cqdma->vc[i];

		list_del(&vc->vc.chan.device_node);
		tasklet_kill(&vc->vc.task);
	}
...
}

[Severity: High]
Does calling list_del(&vc->vc.chan.device_node) hide the channels from the =
DMA
core unregistration, leading to a leak of memory and ID allocations?


This is a pre-existing issue, but does lockless access of descriptor state =
in
mtk_cqdma_tx_status() lead to a TOCTOU use-after-free?

drivers/dma/mediatek/mtk-cqdma.c:mtk_cqdma_tx_status() {
...
	spin_lock_irqsave(&cvc->pc->lock, flags);
	spin_lock(&cvc->vc.lock);
	vd =3D mtk_cqdma_find_active_desc(c, cookie);
	spin_unlock(&cvc->vc.lock);
	spin_unlock_irqrestore(&cvc->pc->lock, flags);

	if (vd) {
		cvd =3D to_cqdma_vdesc(vd);
		bytes =3D cvd->residue;
	}
...
}

[Severity: High]
Since the locks protecting the descriptor's lifecycle are dropped right bef=
ore
its fields are accessed, could concurrent tasklets complete the transaction=
 and
free the descriptor, resulting in a use-after-free?


This is a pre-existing issue, but if mtk_cqdma_prep_dma_memcpy() is called
with a transfer length of 0, could memory allocation return ZERO_SIZE_PTR a=
nd
bypass the NULL check?

drivers/dma/mediatek/mtk-cqdma.c:mtk_cqdma_prep_dma_memcpy() {
...
	nr_vd =3D DIV_ROUND_UP(len, MTK_CQDMA_MAX_LEN);
	cvd =3D kzalloc_objs(*cvd, nr_vd, GFP_NOWAIT);
	if (!cvd)
		return NULL;

	for (i =3D 0; i < nr_vd; ++i) {
...
	return &cvd[0]->vd.tx;
}

[Severity: High]
When len is 0, nr_vd becomes 0 and kzalloc_objs() returns ZERO_SIZE_PTR.
Does the NULL check pass in this scenario, skipping the loop and causing a
kernel oops when &cvd[0]->vd.tx is returned and dereferenced?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260830120955.2638=
359-1-runyu.xiao@seu.edu.cn?part=3D1
