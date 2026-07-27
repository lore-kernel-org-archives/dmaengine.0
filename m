Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9233DBD65
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785185718; cv=none; b=WAsOJPSNikL2no6KD6YpkhezzT4Umotg96XaePZRfoTLj9bSWjVPxk4pzYwubkvthRdtWkJBiJ6lMP345tdb++Gtb7OZU87jeDwPRkfqim4aScodVQYqreMhit2+6KABfJok/iTtWAImJ3XJzDIyJgbGkSrDZZ4wX//qXMe6V6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785185718; c=relaxed/simple;
	bh=eDYVa6WtZQQkWPSrfSmzfTHV27NzSkKJBs0dYq+NZsQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Cr6QrYa3tGFM5ZDiz4E3g31sn2shkAWQW3CLoKAI8j3pw0HT76QpTm+i9xbusRoXbaVu7PR2sHKUa7/cd6wwWikgQqKTb+V2mu5GqcG9j1VRxBdo+u1dAN3VZyIy2AwEVFLBoOfzBI7EtpEgvL47BXz2NlHZ7VhbGbJWdpv2GLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J93/LTUq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J93/LTUq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A59D31F000E9;
	Mon, 27 Jul 2026 20:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785185716;
	bh=EU9TTTZXionb+JOMLggENMX1IEd6x1DjAxFTlNrai88=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J93/LTUqDt7kuAFpFY0TXXQoqK3Mg1NnnfsJh7TpFqK5nS6oUSc0vbaxJcez4brb6
	 J0mM5XJq+kOnIBUGNX80INtlXS8YZbASwolqJAmHjPZ12ocv9BmdUQ+DoVRUQGJDtx
	 HQE7olQ9b1nEW9J44UQOhGljqMp6OURpFPzYVxuAj3cncXprYbp+6e7hiOJLuaUu0V
	 qLIODtKA+nZ0Ha7zXxJRS6dk3dhw3mUX8gSlu0Pp5l5z0vbOq1jZm5+Ov8f4TAkzVP
	 +IbnjMVkF1O6ZLCNWtKeURm4zUdf4XfxfDgbEfaQnnv5MxR/x+IkLj7aMQ9yLjSX6g
	 3ggVmZpPpKPqg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 07/64] dmaengine: fsl_raid: run completions via
 dma_chan BH
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <05046e6cf972767567c6fdc613297b1e69eabbe0.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <05046e6cf972767567c6fdc613297b1e69eabbe0.1785183549.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 20:55:16 +0000
Message-Id: <20260727205516.A59D31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver requests hardware interrupts via request_irq() without =
devres, but completely fails to call free_irq() in both the probe error pat=
hs and device removal path.
- [High] The interrupt is requested before the channel's data structures an=
d driver data are fully initialized, leading to a potential NULL pointer de=
reference upon early interrupts.
- [High] The driver ignores the return value of fsl_re_chan_probe() during =
initialization, leading to NULL pointer dereferences in the cleanup path wh=
en iterating over failed channels.
- [High] Channel memory is freed before the device is unregistered from the=
 DMA engine, allowing concurrent clients to use freed memory.
--

--- Patch [7]: [PATCH v2 07/64] dmaengine: fsl_raid: run completions via dm=
a_chan BH ---
commit ab56ab807ba67c4bf376a52b60efd1139b5215d9
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: fsl_raid: run completions via dma_chan BH

Replace the per-channel tasklet with the shared dma_chan BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

> diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
> --- a/drivers/dma/fsl_raid.c
> +++ b/drivers/dma/fsl_raid.c

[ ... ]

> @@ -670,7 +671,7 @@ static int fsl_re_chan_probe(struct platform_device *=
ofdev,
>  	snprintf(chan->name, sizeof(chan->name), "re_jr%02d", q);
> =20
>  	chandev =3D &chan_ofdev->dev;
> -	tasklet_setup(&chan->irqtask, fsl_re_dequeue);
> +	dma_chan_init_bh(&chan->chan, fsl_re_dequeue);
> =20
>  	ret =3D request_irq(chan->irq, fsl_re_isr, 0, chan->name, chandev);

[Severity: High]
This is a pre-existing issue, but is it safe to request the IRQ before the
channel's driver data and locks are initialized?

If an interrupt fires immediately after request_irq() succeeds, fsl_re_isr()
will be executed:

fsl_re_isr()
    re_chan =3D dev_get_drvdata((struct device *)data);
    irqstate =3D in_be32(&re_chan->jrregs->jr_interrupt_status);

Since dev_set_drvdata() hasn't been called yet, dev_get_drvdata() returns
NULL, which is immediately dereferenced.

[Severity: High]
This is a pre-existing issue, but does this function leak the requested IRQ
on failure?

The driver requests the hardware interrupt without devres. If any subsequent
initialization fails, the function jumps to the err_free labels without
calling free_irq().

>  	if (ret) {

[ ... ]

> @@ -846,7 +847,7 @@ static int fsl_re_probe(struct platform_device *ofdev)
> =20
>  static void fsl_re_remove_chan(struct fsl_re_chan *chan)
>  {
> -	tasklet_kill(&chan->irqtask);
> +	dma_chan_kill_bh(&chan->chan);

[Severity: High]
This is a pre-existing issue, but can this lead to a NULL pointer
dereference if the probe previously failed?

In fsl_re_probe(), the driver ignores the return value of
fsl_re_chan_probe():

fsl_re_probe()
    rc =3D of_device_is_compatible(child, "fsl,raideng-v1.0-job-ring");
    if (rc) {
        fsl_re_chan_probe(ofdev, child, ridx++, off);
        re_priv->total_chans++;
    }

If a channel fails to probe, its pointer in the re_jrs array remains NULL
but total_chans is still incremented. Later, when cleaning up, could passing
that NULL pointer into fsl_re_remove_chan() and calling dma_chan_kill_bh()
cause a kernel crash?

[Severity: High]
This is a pre-existing issue, but shouldn't there be a free_irq() call here?

Since the IRQ was requested without devres during probe, omitting free_irq()
in the teardown path leaves the IRQ active after the driver memory structur=
es
are freed. If an interrupt occurs later, could it lead to a use-after-free?

[Severity: High]
This is a pre-existing issue, but does the driver free channel memory while
the DMA device is still registered?

Looking at fsl_re_remove(), it iterates over all channels and calls
fsl_re_remove_chan() before unregistering the DMA device:

fsl_re_remove()
    for (i =3D 0; i < re_priv->total_chans; i++)
        fsl_re_remove_chan(re_priv->re_jrs[i]);

    dma_async_device_unregister(&re_priv->dma_dev);

Could concurrent clients still submit requests while this is happening,
leading fsl_re_issue_pending() to copy data into a freed ring buffer?

> =20
>  	dma_pool_free(chan->re_dev->hw_desc_pool, chan->inb_ring_virt_addr,
>  		      chan->inb_phys_addr);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785183549.gi=
t.allen.lkml@gmail.com?part=3D7
