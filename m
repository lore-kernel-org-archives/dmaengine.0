Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5189D397E9E
	for <dmaengine@vger.kernel.org>; Thu, 16 Jul 2026 20:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784234672; cv=none; b=FkSjWZ2zR5T+N2BrnERuL4+yMLxod0MhiHkWpD0XFgUBEgJd7TcTRamCYYfEb/Pddp0fJ/CXofY8OVuvLOeXbxC3N2PdENnoGdcF08ZJTEU8a8Yd9e9rLprZ5ltWqsZ9og4I9O+eR9QvW271HsjVsxC7ySWfIuggl8OXlbV38Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784234672; c=relaxed/simple;
	bh=shZfS2bmAMWHtGjKTm9ZuPtIF/GY4pTj4jW0U83Tf0c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FbWQ7JuOCmacVUbSKgYG9Ce+f61YCFaBBK34MFHwg5Z6CdrV3TG2WgrbnTEQ0bsV9tMkk93efEJWj557cRgWPvfdWhli02lmSaymS/VccAQSsm+t8bAYbTOy/HeUAhdIg4EXx/opK6WOvRTMP2Rveu5lUDYvvhzcQ6Z3Zu0Vng4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CBQ9wG3U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CBQ9wG3U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB5071F000E9;
	Thu, 16 Jul 2026 20:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784234671;
	bh=kWy24fe4PMYU5HaX+9wX9miMEuIPbA5Z/F3vCPs3eUY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CBQ9wG3U2OasHWz65aJGqnGp/0vGB2Nfp6fVxTw8YXRYIOJOVW2lRIibgx7n96Av/
	 9mBKyPu9vtFWboLdMi3lVOtJlAXIrJUHD5+0U/eI8VEfPaSgCwTwL2Adw+beEZxAFA
	 BKvvCnGrWlRNsaRbEBWYIBmHXCM9Rg0tz/+R2GhXTOx0NbXYmYheIgeoDhiyUinRxO
	 HFxP9/4Qf2Ju2oYRwO0OaaE1vF1kXyO0W/D02CAxs5b3hu7+z3kuSe4vHWLGzyrimo
	 mYa0fvO22CWxWruyTpM44N27wWi9SBlJYE2tCKTtudMAd20jARVYCfslG3z5Sk1rUC
	 luyKlFyoMgc+g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv2 3/4] dma: fsl_raid: keep MMIO bases as void __iomem
 and cast at access
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260716202949.677290-4-rosenp@gmail.com>
References: <20260716202949.677290-1-rosenp@gmail.com>
 <20260716202949.677290-4-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 20:44:30 +0000
Message-Id: <20260716204430.BB5071F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing bounds check when parsing device tree Job Ring nodes.
- [High] `fsl_re_probe()` ignores the return value of `fsl_re_chan_probe()`=
 and unconditionally increments `total_chans`, leading to a NULL pointer de=
reference.
- [High] DMA channels are never registered with the parent DMA device frame=
work.
- [High] Missing cleanup for channel IRQs and platform devices in both erro=
r paths and driver removal, plus incorrect teardown order.
- [High] Potential NULL pointer dereference in `fsl_re_isr` due to prematur=
e IRQ registration.
--

--- Patch [1]: [PATCHv2 3/4] dma: fsl_raid: keep MMIO bases as void __iomem=
 and cast at access ---
commit d9bcf292f2ff70b568c4dd2362d8ec21ba56f6cd
Author: Rosen Penev <rosenp@gmail.com>

dma: fsl_raid: keep MMIO bases as void __iomem and cast at access

The commit modifies the fsl_re_drv_private and fsl_re_chan structures to
store MMIO bases as void __iomem * instead of typed struct pointers. This
resolves sparse warnings about mismatched address spaces by ensuring typed
pointers are only introduced locally in functions that touch the registers.

Fixes: https://lore.kernel.org/oe-kbuild-all/202008111749.yy85rFMD%25lkp@in=
tel.com/

> diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
> index 99945845d8b5e..5bc5bd499ba27 100644
> --- a/drivers/dma/fsl_raid.c
> +++ b/drivers/dma/fsl_raid.c
> @@ -656,8 +656,7 @@ static int fsl_re_chan_probe(struct platform_device *=
ofdev,
>  		goto err_free;
>  	}
> =20
> -	chan->jrregs =3D (struct fsl_re_chan_cfg *)((u8 *)re_priv->re_regs +
> -			off + ptr);
> +	chan->jrregs =3D re_priv->base + off + ptr;
> =20
>  	/* read irq property from dts */
>  	chan->irq =3D irq_of_parse_and_map(np, 0);

[Severity: High]
This isn't a bug introduced by this patch, but the driver context seems to
be attached to the device too late.

In fsl_re_chan_probe(), request_irq() is called before dev_set_drvdata()
populates the driver data:

    ret =3D request_irq(chan->irq, fsl_re_isr, 0, chan->name, chandev);
    ...
    dev_set_drvdata(chandev, chan);

If an interrupt triggers immediately, fsl_re_isr() retrieves a NULL pointer
and dereferences it:

    re_chan =3D dev_get_drvdata((struct device *)data);
    irqstate =3D in_be32(&re_chan->jrregs->jr_interrupt_status);

Is there a vulnerable window here where an incoming interrupt could lead to
a NULL pointer dereference?

[Severity: High]
This is a pre-existing issue, but it appears the DMA channels are never
registered with the parent DMA device framework.

In fsl_re_chan_probe(), the channels are initialized, but the required list
addition to attach them to dma_dev->channels is omitted:

    re_priv->re_jrs[q] =3D chan;
    chan->chan.device =3D dma_dev;
    ...

Without adding the channel to dma_dev->channels, will
dma_async_device_register() end up registering 0 channels and leave the
driver functionally dead?

[Severity: High]
This isn't a bug introduced by this patch, but I noticed potential resource
leaks and incorrect teardown ordering.

On error paths inside fsl_re_chan_probe(), resources like requested IRQs
and platform devices are not freed:

    err_free:
        return ret;

Additionally, in fsl_re_remove_chan(), free_irq() or
of_platform_device_destroy() are not called.

This leaves an active unmanaged IRQ pointing to freed driver memory.

Also, in fsl_re_remove(), the driver frees ring buffers before unregistering
the async DMA device:

    for (i =3D 0; i < re_priv->total_chans; i++)
        fsl_re_remove_chan(re_priv->re_jrs[i]);

    /* Unregister the driver */
    dma_async_device_unregister(&re_priv->dma_dev);

Could this cause a use-after-free if the IRQ fires, and does the teardown
order violate teardown safety expectations?

[ ... ]

> @@ -763,20 +763,21 @@ static int fsl_re_probe(struct platform_device *ofd=
ev)
>  		return -ENODEV;
> =20
>  	/* IOMAP the entire RAID Engine region */
> -	re_priv->re_regs =3D devm_ioremap(dev, res->start, resource_size(res));
> -	if (!re_priv->re_regs)
> +	re_regs =3D devm_ioremap(dev, res->start, resource_size(res));
> +	if (!re_regs)
>  		return -EBUSY;
> +	re_priv->base =3D re_regs;
> =20
>  	/* Program the RE mode */
> -	out_be32(&re_priv->re_regs->global_config, FSL_RE_NON_DPAA_MODE);
> +	out_be32(&re_regs->global_config, FSL_RE_NON_DPAA_MODE);

[ ... ]

[Severity: High]
This is a pre-existing issue, but there seems to be a missing bounds check
when parsing device tree Job Ring nodes.

In fsl_re_probe(), the ridx counter is incremented indefinitely and passed
directly to fsl_re_chan_probe() without being bounded against
FSL_RE_MAX_CHANS (4):

    fsl_re_chan_probe(ofdev, child, ridx++, off);
    re_priv->total_chans++;

Then in fsl_re_chan_probe(), the unbounded index q is directly used to write
into the statically sized array:

    re_priv->re_jrs[q] =3D chan;

If a malformed device tree contains more than 4 job ring child nodes,
would this cause an out-of-bounds write and memory corruption?

[Severity: High]
This isn't a bug introduced by this patch, but fsl_re_probe() appears to
ignore the return value of fsl_re_chan_probe() and unconditionally
increments total_chans.

    fsl_re_chan_probe(ofdev, child, ridx++, off);
    re_priv->total_chans++;

If fsl_re_chan_probe() fails and returns an error, fsl_re_probe() ignores
the error but still increments re_priv->total_chans.

Subsequent calls to fsl_re_remove_chan() on driver remove or error rollback
will then dereference a NULL pointer:

    static void fsl_re_remove_chan(struct fsl_re_chan *chan)
    {
        tasklet_kill(&chan->irqtask);
        ...

Might this result in a kernel panic from a NULL pointer dereference during
teardown?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716202949.6772=
90-4-rosenp@gmail.com?part=3D1
