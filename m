Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9173C9EE5
	for <dmaengine@vger.kernel.org>; Mon, 20 Jul 2026 20:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784579621; cv=none; b=TYz781oxEpASfrnyleB7eHFwpSnkGNhp8i2a+m3dVrIkosECtaQD/oOGMQ1QrXh7NEdZu8CXPM/orHb2Fu/Zrr704kJe1JDENaSpaU5tsybHsoT2sMV5YxrhxCXGqxvyd/8Hiep+43S33EZBieeetQxTwOEGO/0bo9uvGsbRXP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784579621; c=relaxed/simple;
	bh=7YFkhYGYpVyPT/m08hr0mRgDs/AxRXJG8F3l5bCzKzQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TTOIGLCFggHXYnyqbnqiySa3tVn6IUXABod7EeaKxAv8qHz+X1zyNMKNtU8S8AhgcgJ71+bCsFzEKFLzm4so7DZmkIARfmxHK089+uXYi5BecmU+xXI4eqxHc1BdRF42kty4M4KrGv6g5IrPY4qSL4hAadUyr2nvtWs26q1vi5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ksJh/P1t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ksJh/P1t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C783C1F000E9;
	Mon, 20 Jul 2026 20:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784579619;
	bh=5+59gnsBilEpH/fyOSogGrmBH8eSVM9h6Dlvxswbkkw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ksJh/P1tTsorUCL6igesLOznIeEpUSWZssmbcU/nhBLIjWAhLt8NIPN1w+U3cOb+a
	 CpvsR78CCuw72lZzzJMKqPqfCac+/5m8uJBGDV/PAh5GqiC7b8+0tDrBS6wSwgzuYW
	 HJVvI22CIWnYCPlitAk9QT6rkzQwzdTkwuSrAbLD51wYoejULvW/SkyzpfjawG/aKO
	 4PnXsSzlm5whOfpoAYheEpzBkYHb444zoO+GzXfpXW7uKRpPcn2oa9fwGY2GsAmb9e
	 /0XVHGpSo/Uu/EJaVy0rMKtkkL6b+xq8Vx/f2pib9ecGj7FdsshG1X5mJ4+HQpvCsx
	 d2mr/HvBpgX4w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv2] dmaengine: fsl_raid: check fsl_re_chan_probe() return
 value
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260720202040.2531311-1-rosenp@gmail.com>
References: <20260720202040.2531311-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 20:33:38 +0000
Message-Id: <20260720203338.C783C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

New issues:
- [High] The newly added FSL_RE_MAX_CHANS check aborts probe directly, leak=
ing previously probed channels and causing a Use-After-Free.

Pre-existing issues:
- [High] The driver requests unmanaged IRQs but never frees them, leading t=
o a permanent leak and Use-After-Free on module unload.
- [High] The driver never registers its DMA channels with the DMA engine fr=
amework, rendering it completely non-functional.
- [High] Channel resources are torn down before unregistering the DMA devic=
e, introducing a Use-After-Free race condition.
- [High] The interrupt handler is registered before its private data is ful=
ly initialized, causing a potential NULL pointer dereference.
- [High] The physical addresses for inbound and outbound rings are incorrec=
tly shifted and masked, truncating 40-bit DMA addresses.
--

--- Patch [1]: [PATCHv2] dmaengine: fsl_raid: check fsl_re_chan_probe() ret=
urn value ---
commit 12f631d0fec9947222a58ad5b976eca2ba2a47f9
Author: Rosen Penev <rosenp@gmail.com>

dmaengine: fsl_raid: check fsl_re_chan_probe() return value

This patch updates fsl_re_probe() to check the return value of
fsl_re_chan_probe(). It ensures that the driver only increments the
channel count for successfully probed channels and avoids dereferencing
NULL pointers during device removal.

> diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
> index 99945845d8b5e..052218b224943 100644
> --- a/drivers/dma/fsl_raid.c
> +++ b/drivers/dma/fsl_raid.c
> @@ -832,10 +832,26 @@ static int fsl_re_probe(struct platform_device *ofd=
ev)
>  		for_each_child_of_node(np, child) {
>  			rc =3D of_device_is_compatible(child,
>  					     "fsl,raideng-v1.0-job-ring");
> +			if (!rc)
> +				continue;
> +
> +			if (ridx >=3D FSL_RE_MAX_CHANS) {
> +				dev_err(dev,
> +					"too many job rings, max %d\n",
> +					FSL_RE_MAX_CHANS);
> +				of_node_put(child);
> +				return -EINVAL;

[Severity: High]
Does returning directly here leak previously probed channels?

If the device tree contains more than FSL_RE_MAX_CHANS (4) job rings, this
aborts the probe and frees devm-managed memory. However, successfully probed
channels leave behind unmanaged resources (like dma_pool_alloc() and
request_irq()), and the hardware remains enabled.

Could this lead to a use-after-free if an interrupt fires and the ISR
dereferences the freed channel structure?

> +			}
> +
> +			rc =3D fsl_re_chan_probe(ofdev, child, ridx, off);

[Severity: High]
This is a pre-existing issue, but does the driver ever register its DMA
channels with the DMA engine framework?

Looking at fsl_re_chan_probe(), the channel is configured but is never added
to dma_dev->channels (e.g., via vchan_init() or list_add_tail()). Because
dma_async_device_register() iterates over an empty list, it registers a DMA
device with zero channels, rendering the driver unusable.

[Severity: High]
This is a pre-existing issue, but does fsl_re_chan_probe() register the
interrupt handler before its private data is fully initialized?

drivers/dma/fsl_raid.c:fsl_re_chan_probe() {
    ...
    ret =3D request_irq(chan->irq, fsl_re_isr, 0, chan->name, chandev);
    ...
    dev_set_drvdata(chandev, chan);
    ...
}

If an interrupt fires between request_irq() and dev_set_drvdata(), wouldn't
fsl_re_isr() receive NULL when calling dev_get_drvdata(chandev) and crash
when dereferencing it?

[Severity: High]
This is a pre-existing issue, but are the physical addresses for inbound and
outbound rings incorrectly shifted in fsl_re_chan_probe()?

drivers/dma/fsl_raid.c:fsl_re_chan_probe() {
    ...
    out_be32(&chan->jrregs->inbring_base_h,
             chan->inb_phys_addr & FSL_RE_ADDR_BIT_MASK);
    ...
    out_be32(&chan->jrregs->inbring_base_l,
             chan->inb_phys_addr >> FSL_RE_ADDR_BIT_SHIFT);
    ...
}

Assuming FSL_RE_ADDR_BIT_MASK is a lower-bit mask and FSL_RE_ADDR_BIT_SHIFT
is 4, inbring_base_h receives the lowest 4 bits instead of the upper bits,
and inbring_base_l receives the address shifted right by 4.

Doesn't this truncate 40-bit DMA addresses and cause IOMMU faults or memory
corruption?

>  			if (rc) {
> -				fsl_re_chan_probe(ofdev, child, ridx++, off);
> -				re_priv->total_chans++;
> +				dev_err(dev,
> +					"job ring %d probe failed: %d\n",
> +					ridx, rc);
> +				continue;
>  			}
> +			ridx++;
> +			re_priv->total_chans++;
>  		}
>  	}

[ ... ]

> @@ -866,7 +882,8 @@ static void fsl_re_remove(struct platform_device *ofd=
ev)
> =20
>  	/* Cleanup chan related memory areas */
>  	for (i =3D 0; i < re_priv->total_chans; i++)
> -		fsl_re_remove_chan(re_priv->re_jrs[i]);
> +		if (re_priv->re_jrs[i])
> +			fsl_re_remove_chan(re_priv->re_jrs[i]);

[Severity: High]
This is a pre-existing issue, but does fsl_re_remove_chan() leak the
unmanaged IRQ?

The interrupt is allocated with request_irq() during probe, but neither the
probe error path nor fsl_re_remove_chan() ever calls free_irq().

Could this cause a use-after-free on module unload if the hardware asserts
an interrupt after the devm structures are freed?

> =20
>  	/* Unregister the driver */
>  	dma_async_device_unregister(&re_priv->dma_dev);

[Severity: High]
This is a pre-existing issue, but does fsl_re_remove() tear down channel
resources before unregistering the DMA device?

By freeing the DMA pools and killing tasklets before calling
dma_async_device_unregister(), couldn't concurrent DMA clients or core
subsystems access already-freed DMA pools?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720202040.2531=
311-1-rosenp@gmail.com?part=3D1
