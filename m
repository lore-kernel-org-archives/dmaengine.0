Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E062A33E358
	for <dmaengine@vger.kernel.org>; Thu,  9 Jul 2026 14:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783607058; cv=none; b=VB6RmQKWRz93rmIbOGueUG0vYYNpcBBa/sXRzt/ktROwOfKsD8LVxA0A7WqqhqpqUKynOMS/XBsesdbF1EMLPyI4d/K2L2hthScwFOgO0qVeAhTGqex6xZtXqKpLiJ/i03loUIlR5F47vdmfVdaSTlpYRDMxJ0vw3De5XCRUQHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783607058; c=relaxed/simple;
	bh=pLzv/19tsq0/na9rS6H3Y2MCyiMjeP+wioUMztZfPDI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JKx9oxqKnlWXRnauP8vu3/wgGXrr7CQYiLFEYTDEgVx+JrOJXfAPcIesEqTGtTMHBnJEvcjJW8KTcEdTRKRKqYHTYk/dk+3PHyuXGLXLr0D9HgpsRYpqm99Atl2iWVwtAyXGpIq09793oTpJ1p/50SBFU4M0uJG9B56eblhP9Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VfwEJ4JH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VfwEJ4JH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E04B1F00A3A;
	Thu,  9 Jul 2026 14:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783607056;
	bh=2yFQpd4fKzffm2XGKkUUzElLfpQF3H2JGQkHzEs5XO4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VfwEJ4JHvM9/S96R6pvrz1MzrsY+OUnATa97/yaw2y7QhQOJelTk0wYw3lOEpdm6Q
	 XmO3WY72/ogjJ/arp/lgDlzaiCTQmYMmo3i9MvMB74STVY9hsKOcHNkp2j8+E2wdlw
	 L/I8vPkWSoi9cbAUKRj0vqTfF9nT4GYT7VnVQkqvwlZhrPp+t0+o0Ov4pvspN8dX7v
	 JDHRHRvKsYelflDWqze8hLknI9sPOgUZFXi+/gsafONGHUcE5CHV7Hkbsca3uPS0b6
	 l5OqWbRues0kOZNby9E4BPfQEL2SCjersitwaQmQ1NRklrHwCwpbj8rHVoV1+GQbfL
	 vKfx1vxgb+8sA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 14/26] dmaengine: sh-shdmac: Remove redundant
 dev_err()/dev_err_probe()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pan Chuang" <panchuang@vivo.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260709135846.97972-15-panchuang@vivo.com>
References: <20260709135846.97972-1-panchuang@vivo.com>
 <20260709135846.97972-15-panchuang@vivo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 14:24:16 +0000
Message-Id: <20260709142416.8E04B1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Possible use-after-free of `sdev->schan` in `sh_dmae_err` during d=
evice probe failure or driver removal.
- [High] Unsafe hardware register access in a shared interrupt handler whil=
e the device is runtime suspended.
- [High] Failure of pm_runtime_get_sync() is logged but execution continues=
, potentially causing hardware faults.
--

--- Patch [14]: [PATCH 14/26] dmaengine: sh-shdmac: Remove redundant dev_er=
r()/dev_err_probe() ---
commit c205bd1feae8c44a14e3a6ace262ed40dc6c1ba6
Author: Pan Chuang <panchuang@vivo.com>

dmaengine: sh-shdmac: Remove redundant dev_err()/dev_err_probe()

The devm_request_irq() now automatically logs detailed error messages on
failure. This eliminates the need for driver-specific dev_err() and
dev_err_probe() calls that previously printed generic messages.

> diff --git a/drivers/dma/sh/shdmac.c b/drivers/dma/sh/shdmac.c
> index 603e15102e45e..e0391f72384d3 100644
> --- a/drivers/dma/sh/shdmac.c
> +++ b/drivers/dma/sh/shdmac.c
> @@ -800,12 +800,8 @@ static int sh_dmae_probe(struct platform_device *pde=
v)
> =20
>  		err =3D devm_request_irq(&pdev->dev, errirq, sh_dmae_err,
>  				       irqflags, "DMAC Address Error", shdev);

[Severity: High]
This is a pre-existing issue, but since we are requesting a potentially
shared interrupt here, is there a risk of accessing memory-mapped registers
of an unclocked or powered-down device?

If the device is runtime suspended and a shared interrupt fires from another
device, the handlers sh_dmae_err() and sh_dmae_chan_irq() unconditionally
read registers like DMAOR and CHCR.

Could this result in a synchronous external abort or system hang if the
module clock is disabled?

> -		if (err) {
> -			dev_err(&pdev->dev,
> -				"DMA failed requesting irq #%d, error %d\n",
> -				errirq, err);
> +		if (err)
>  			goto eirq_err;

[Severity: High]
This isn't a bug introduced by this patch, but does the error handling path
have a use-after-free risk?

If a subsequent probe step fails and we take the eirq_err path, it calls
shdma_cleanup() which frees the sdev->schan array. However, the devm-managed
interrupt requested above is not freed until the probe function returns and
devres cleanup runs.

If the shared interrupt fires during this window, sh_dmae_err() executes. If
it reads a value with DMAOR_AE set, it calls sh_dmae_reset() -> shdma_reset=
()
which iterates over the freed sdev->schan array.

The same vulnerability appears to exist in sh_dmae_remove() where
shdma_cleanup() is called before the devm-managed interrupt is freed. Might
we need to explicitly free or disable the interrupt before cleaning up?

[Severity: High]
This is also a pre-existing issue, but I noticed earlier in sh_dmae_probe()
that we log a pm_runtime_get_sync() failure but continue execution:

drivers/dma/sh/shdmac.c:sh_dmae_probe() {
    ...
	pm_runtime_enable(&pdev->dev);
	err =3D pm_runtime_get_sync(&pdev->dev);
	if (err < 0)
		dev_err(&pdev->dev, "%s(): GET =3D %d\n", __func__, err);

	spin_lock_irq(&sh_dmae_lock);
	list_add_tail_rcu(&shdev->node, &sh_dmae_devices);
	spin_unlock_irq(&sh_dmae_lock);

	/* reset dma controller - only needed as a test */
	err =3D sh_dmae_rst(shdev);
    ...
}

Will this cause a fatal bus error? If the PM domain failed to power on the
device, accessing the memory-mapped registers in sh_dmae_rst() could cause a
crash. Should the probe process be aborted if pm_runtime_get_sync() fails?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709135846.9797=
2-1-panchuang@vivo.com?part=3D14
