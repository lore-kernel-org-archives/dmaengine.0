Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CEE442FBB
	for <dmaengine@vger.kernel.org>; Wed, 15 Jul 2026 18:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784140435; cv=none; b=Wb5yHU9PNXyRSIRWh5RU8BgIdHKaEccaxpiAp97h6M9mzcsqdhVA/f7GYk+yPODmtqGkKUCEO1g4XDJOcfknFTlXLabOTYQ6X+w+75e1Gm3JxLW8/tU6kmK/PJRRVZ0/xZmOmDMnB0SElvY+h/USFFoaBHaS+SRPkHXypn3fOPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784140435; c=relaxed/simple;
	bh=oQM0cOulifCHCXI/eA0c+VyI7GTyfbULr/cr0i6VanU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sluy1baQkAC3cCSSxtTN4Qq+QGf49iomYGGp6Jho9j4EaMXxxtrttwo3GFhsYMDMOwt00lit8NYa1jqZKcRoCMuyAZldXndElYCjw43bbbuk0MmIS48xmHmT8R6IJew2vSOspGWp1JdNjQ+JP2r35bp0I4KTSL9Mb0Vaps62938=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XQWFheOn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XQWFheOn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 879F61F000E9;
	Wed, 15 Jul 2026 18:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784140421;
	bh=yDHIKmDIG5Qmsxhg1PDeVVihS/NpI8CYBiUCxvr4FOc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XQWFheOnxHVqnsyXsFl/pE/b5HouSzRoAHID7KYl1zgmcoWWig8eUFk4B67Bu7BaP
	 NBWsvxH6FBripS1SdkD3JbC3eBZJEjmagGy6Zvv0dD/+qrPLsMzOJPiwiPUL0ffRis
	 ZnT61/6BUzvYaqur5eCofxOqfjjzhOgoXWZwA/3YaWW6vm+tgJy7jY2PhXD/RouDTI
	 9KFzsKkVbwNvvVeeyQ4zuKsl5H5BtGiRiqLgJ1PAAwYpiyYDW77bit/upxRrSYH+XP
	 xvqlFbOKLrMoM1wfLbVG7aLC4PMEZTvb4HeLbulLmwiSh2I5HwJ9oUKj7burZnhKgJ
	 SAN9RVhPTbnLg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 9/9] dmaengine: dw-edma: Defer channel IRQ handling
 to workqueue
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260715175740.1110404-10-den@valinux.co.jp>
References: <20260715175740.1110404-1-den@valinux.co.jp>
 <20260715175740.1110404-10-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 18:33:41 +0000
Message-Id: <20260715183341.879F61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Shared IRQs are requested before `irq->dw` is initialized, potenti=
ally causing a NULL pointer dereference on early interrupts.
--

--- Patch [9]: [PATCH v3 9/9] dmaengine: dw-edma: Defer channel IRQ handlin=
g to workqueue ---
commit 61576b5286f799082619f98fb9d5cfc6fa61833f
Author: Koichiro Den <den@valinux.co.jp>
dmaengine: dw-edma: Defer channel IRQ handling to workqueue

This patch modifies the eDMA driver to keep the hard IRQ handler minimal to
prevent performance bottlenecks under multichannel load. It defers per-chan=
nel
completion and abort processing to a workqueue, queuing a work item per
channel to allow parallel execution across multiple CPUs.

> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-=
edma-core.c
> index 2369b4c4630b9..4ee7f14c3a824 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c

[ ... ]

> @@ -1195,10 +1237,21 @@ int dw_edma_probe(struct dw_edma_chip *chip)
>  	/* Disable eDMA, only to establish the ideal initial conditions */
>  	dw_edma_core_off(dw);
> =20
> +	/*
> +	 * Deferred IRQ works are queued from the hard IRQ handlers, so the
> +	 * workqueue must exist before any IRQ is requested.
> +	 */
> +	dw->wq =3D alloc_workqueue("dw-edma:%s", WQ_UNBOUND | WQ_HIGHPRI, 0,
> +				 dev_name(chip->dev));
> +	if (!dw->wq)
> +		return -ENOMEM;
> +
>  	/* Request IRQs */
>  	err =3D dw_edma_irq_request(dw, &wr_alloc, &rd_alloc);

[Severity: High]
This is a pre-existing issue, but could this lead to a NULL pointer
dereference on early interrupts?

In dw_edma_probe(), we call dw_edma_irq_request() which requests the
shared IRQ:

dw_edma_irq_request() {
    ...
    err =3D request_irq(irq, dw_edma_interrupt_common, IRQF_SHARED, dw->nam=
e, &dw->irq[0]);
    ...
}

If an interrupt from another device sharing this IRQ line fires immediately,
the handler will be invoked before we've fully initialized the context.

Specifically, dw_edma_interrupt_common() calls down into
dw_edma_core_handle_int(), which dereferences dw_irq->dw:

dw_edma_core_handle_int() {
    ...
    return dw_irq->dw->core->handle_int(dw_irq, dir, done, abort);
}

However, irq->dw is only initialized later in dw_edma_channel_setup():

dw_edma_channel_setup() {
    ...
    for (i =3D 0; i < ch_cnt; i++) {
        ...
        irq->dw =3D dw;
    }
}

If the shared handler fires before dw_edma_channel_setup() runs, will
dw_irq->dw be NULL here and crash the kernel?

> -	if (err)
> +	if (err) {
> +		destroy_workqueue(dw->wq);
>  		return err;
> +	}
> =20
>  	/* Allocate a dedicated virtual IRQ for interrupt-emulation doorbells */
>  	err =3D dw_edma_emul_irq_alloc(dw);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715175740.1110=
404-1-den@valinux.co.jp?part=3D9
