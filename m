Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72438311C2D
	for <dmaengine@vger.kernel.org>; Thu, 16 Jul 2026 15:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784217219; cv=none; b=ilvhOOJfxw92Au9A6KYSi4mOinf4JpXXy7FyfBm8+ZhZmJAp1DCm6QatQdKPeuqZzhgGSAp3kMKlCJzhZUAJffiQd0lhZP9jjDgxrvNBvkou+n4yeFEI02rkPEH8q/W6yLhiU+ov69aPe9/DMEtymnh+hPKY5sj5RC0cTPWIRA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784217219; c=relaxed/simple;
	bh=A4kS8UiIJnqxWa/INfe4vtdi3OmjTvdLa3AEmPdEqgM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=js6RRHK5bx1QiE1qOqWQU3TulIeODx5y1rak/4no9ULtJ33q84+rctyQk0wntJEjnF9SjHGkF/UJeSQOkHYfvo6WcNZNDgiOv28rZ8ktrIZPQcwyQd4EsxJSnzCTR0/k/aF7YIT+j39RqP0Jl+P1WIh6jsb+/T+b7b6QZ+WjLHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e+s6eM5k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e+s6eM5k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C57CE1F000E9;
	Thu, 16 Jul 2026 15:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784217218;
	bh=ZNdLjGDN9xv0ccRdkrMuIGRItPkeCLNnrZWPjyigzGU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e+s6eM5k9O2ECDmCnFWNbm2ik25ZquVX45PBI4DPpczrqAQL6uUX3RDi53w3FxBCT
	 +koAjya09F4sI79MdByuFfiueK+PHrxO0eMYkuC3yRmYQLfVCHKFW+MQ3AWxmpFwin
	 zsb7cmfkAIxGuSpeiwd4TYRVFoWk16sKJ9M1qIiOIrOXbdVAZ5o1yROhTqSkv6oU1a
	 b3T7pBZ434tvMWidLP5lbxeVvKVAq82etYfwOhKo7+/gpA8suy17eHVudZTzUYhVrN
	 1zJZA62LfO54zlK82P8aAy/FoV20MSka0CuDXi4AIPhH1krVolNXCELkE5a04jI7wh
	 NhWwVv3nEJLJw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 9/9] dmaengine: dw-edma: Defer channel IRQ handling
 to workqueue
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260716152503.1747922-10-den@valinux.co.jp>
References: <20260716152503.1747922-1-den@valinux.co.jp>
 <20260716152503.1747922-10-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 15:53:37 +0000
Message-Id: <20260716155337.C57CE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Interrupts are requested before critical channel structures are fu=
lly initialized, leading to possible NULL pointer dereferences or uninitial=
ized lock acquisitions on early or shared interrupts.
--

--- Patch [9]: [PATCH v4 9/9] dmaengine: dw-edma: Defer channel IRQ handlin=
g to workqueue ---
commit 9d2ebede7ce8b472f3d4f1a246b418b61a57de7a
Author: Koichiro Den <den@valinux.co.jp>

dmaengine: dw-edma: Defer channel IRQ handling to workqueue

This commit shifts channel IRQ handling from hard IRQ context to workqueues.
It keeps the hard IRQ handler minimal to clear status and dispatch channel
events, while deferring per-channel processing to work items to improve
concurrency.

> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-=
edma-core.c
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c
[ ... ]
> @@ -1190,10 +1232,21 @@ int dw_edma_probe(struct dw_edma_chip *chip)
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
This is a pre-existing issue, but requesting interrupts here before critical
channel structures are initialized can lead to a NULL pointer dereference.

Since dw_edma_irq_request() uses IRQF_SHARED, an interrupt from another
device sharing the line could fire immediately.

If that happens before dw_edma_channel_setup() completes, the handler
(like dw_edma_interrupt_emulated()) will unconditionally dereference the
uninitialized dw_irq->dw pointer.

Additionally, the deferred work items might attempt to acquire chan->vc.lock
before vchan_init() has been called in dw_edma_channel_setup().

Does the initialization order need to be adjusted so that structures are fu=
lly
setup before interrupts are requested?

> -	if (err)
> +	if (err) {
> +		destroy_workqueue(dw->wq);
>  		return err;
> +	}
> =20
>  	/* Allocate a dedicated virtual IRQ for interrupt-emulation doorbells */
>  	err =3D dw_edma_emul_irq_alloc(dw);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716152503.1747=
922-1-den@valinux.co.jp?part=3D9
