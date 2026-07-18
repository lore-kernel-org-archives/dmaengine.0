Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51761DF25C
	for <dmaengine@vger.kernel.org>; Sat, 18 Jul 2026 23:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784417218; cv=none; b=PDkFlUL93OhFteBwXGUjVnSlhvbfgc5KKTiP7ZpFpYL/ET10aRxP/1OwtG+R0ElrrZvy4q/MP/PC0eY3mkjp2/I5GtkagBVoMUbLtnqc5qQzVm3Mage3AM5eR7kz8dRPROhFqFkXs093LIv+QOblmHHfP0A6ptLpdP5fejYmr+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784417218; c=relaxed/simple;
	bh=trFua2lwIkwPonaiovGzXJnEulr41FEIm5h/XuZwOjE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kcGU3PlD+SnJx2Tx8cb6P/Rco3mSjt72pPV0Sgc66hhqwqNaHIlQXv27K4tpDNMHfzJFUddthWeS/0DA+ewMzNfWhe1dF5soRVzrjFnhzqWySBDd5kX11h4uION1I+0/q9wtGvh3MLW2NXrW+89ik2akfygQGAEriYKx3FmRlTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lPY+tp/N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lPY+tp/N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C8C71F000E9;
	Sat, 18 Jul 2026 23:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784417217;
	bh=p9NEFGDENjOgYQOlxwpDZsEGaYbDsM38IkRFy2AofVg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lPY+tp/NWbhfB+ONQZnvMGNccrpKV5gCve/Oktt8flbFe2GwiDHGZ6sMQluO6MfYN
	 m5Any5CZHZWiR24OHz7TPdLouGQGRz8wiXFEAK8z7faDmFY+8dX1Wii4mdkGbB3YuA
	 v6jb5Aj0EqLnEFK68A/u1lacrSVrIxPeLBDMnwBLh0COzlMch3SbP01NaAQ9WPOMqQ
	 7xadyQqBs7qWVoMhxhkidVi6IUhLY+23rdHQ4TxiBgh/INoz8NuZ2t7E3bI6zkGEBU
	 PNlIpy7NTLUieYl8+ILnyTToZ4oEeTgVisJfO7Hg1Bd9jB+I5FZ6eRLSv4u8/moZol
	 917OPEGE1T44g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: fsl_raid: check fsl_re_chan_probe() return
 value
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260718231521.222456-1-rosenp@gmail.com>
References: <20260718231521.222456-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 18 Jul 2026 23:26:56 +0000
Message-Id: <20260718232657.0C8C71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver fails to add its initialized DMA channels to the `dma_d=
ev->channels` list, meaning the dmaengine framework sees zero channels for =
this device.
- [High] The driver requests an interrupt handler using `request_irq()` but=
 never calls `free_irq()`, leading to a Use-After-Free on device removal or=
 a dangling IRQ if probe fails.
- [High] Interrupt is requested before channel driver data is initialized, =
leading to a race condition and NULL pointer dereference.
- [High] The driver blindly writes to the fixed-size `re_jrs` array based o=
n the number of child nodes in the device tree, leading to a buffer overflo=
w.
- [High] Failure midway through `fsl_re_probe()` leaks resources for succes=
sfully probed channels, preventing the release of devm managed DMA pools.
- [High] Recursive spinlock deadlock during DMA callback invocation.
- [High] Missing endianness conversions when writing to hardware descriptor=
s and CDBs.
--

--- Patch [1]: [PATCH] dmaengine: fsl_raid: check fsl_re_chan_probe() retur=
n value ---
commit d2ed6dc415b8714a0178137e3830a2d57f27aa00
Author: Rosen Penev <rosenp@gmail.com>

dmaengine: fsl_raid: check fsl_re_chan_probe() return value

This patch fixes a NULL pointer dereference in fsl_re_remove() by properly
checking the return value of fsl_re_chan_probe(). It ensures that only
successfully probed channels increment the total_chans count and guards
against NULL entries during cleanup.

> diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
> index 99945845d8b5e..6266ef1e6f098 100644
> --- a/drivers/dma/fsl_raid.c
> +++ b/drivers/dma/fsl_raid.c
> @@ -833,7 +833,14 @@ static int fsl_re_probe(struct platform_device *ofde=
v)
>  			rc =3D of_device_is_compatible(child,
>  					     "fsl,raideng-v1.0-job-ring");
>  			if (rc) {
> -				fsl_re_chan_probe(ofdev, child, ridx++, off);
> +				rc =3D fsl_re_chan_probe(ofdev, child, ridx, off);

[Severity: High]
This is a pre-existing issue, but can the array re_jrs[] overflow here?

If the device tree provides more than FSL_RE_MAX_CHANS (4) job rings, ridx
will grow beyond the bounds of the array, leading to memory corruption when
fsl_re_chan_probe() executes:

drivers/dma/fsl_raid.c:fsl_re_chan_probe() {
    ...
    re_priv->re_jrs[q] =3D chan;
    ...
}

> +				if (rc) {
> +					dev_err(dev,
> +						"job ring %d probe failed: %d\n",
> +						ridx, rc);
> +					continue;

[Severity: High]
This isn't a bug introduced by this patch, but is it possible for a
dangling interrupt to remain active after an error?

If fsl_re_chan_probe() fails after successfully calling request_irq(), the
interrupt is never freed because there is no free_irq() in the error handli=
ng
paths. The continue statement allows the driver to stay loaded while a dang=
ling
IRQ remains permanently active, potentially causing a use-after-free if
triggered.

This also happens during device removal:

drivers/dma/fsl_raid.c:fsl_re_remove_chan() {
    tasklet_kill(&chan->irqtask);

    dma_pool_free(chan->re_dev->hw_desc_pool, chan->inb_ring_virt_addr,
                  chan->inb_phys_addr);
    ...
}

Could a hardware interrupt firing after fsl_re_remove_chan() destroys the D=
MA
rings cause the ISR to access freed memory?

[ ... ]

> @@ -866,7 +873,8 @@ static void fsl_re_remove(struct platform_device *ofd=
ev)
> =20
>  	/* Cleanup chan related memory areas */
>  	for (i =3D 0; i < re_priv->total_chans; i++)
> -		fsl_re_remove_chan(re_priv->re_jrs[i]);
> +		if (re_priv->re_jrs[i])
> +			fsl_re_remove_chan(re_priv->re_jrs[i]);
> =20
>  	/* Unregister the driver */
>  	dma_async_device_unregister(&re_priv->dma_dev);

[Severity: High]
This is a pre-existing issue, but are the channels successfully registered
with the dmaengine framework here?

drivers/dma/fsl_raid.c:fsl_re_chan_probe() {
    ...
    chan->chan.device =3D dma_dev;
    chan->chan.private =3D chan;
    chan->dev =3D chandev;
    ...
}

Since list_add_tail(&chan->chan.device_node, &dma_dev->channels) and
dma_cookie_init() are completely omitted, the framework sees zero channels
for this device, making it unusable by clients. Should they be added?

[Severity: High]
This is a pre-existing issue, but could an interrupt firing during this
window cause a NULL pointer dereference?

drivers/dma/fsl_raid.c:fsl_re_chan_probe() {
    ...
    ret =3D request_irq(chan->irq, fsl_re_isr, 0, chan->name, chandev);
    ...
    dev_set_drvdata(chandev, chan);
    ...
}

The interrupt is requested before channel driver data is initialized. If an
interrupt fires in this small window, or if probe fails and leaves the IRQ
active, the ISR blindly dereferences the NULL pointer:

drivers/dma/fsl_raid.c:fsl_re_isr() {
    ...
    re_chan =3D dev_get_drvdata((struct device *)data);
    irqstate =3D in_be32(&re_chan->jrregs->jr_interrupt_status);
    ...
}

[Severity: High]
This is a pre-existing issue, but might this error path leak resources for
already initialized channels?

drivers/dma/fsl_raid.c:fsl_re_probe() {
    ...
    for_each_compatible_node_scoped(np, NULL, "fsl,raideng-v1.0-job-queue")=
 {
        rc =3D of_property_read_u32(np, "reg", &off);
        if (rc) {
            dev_err(dev, "Reg property not found in JQ node\n");
            return -ENODEV;
        }
    ...
}

If of_property_read_u32() fails after some channels were already successful=
ly
probed, it returns -ENODEV directly without calling fsl_re_remove_chan() for
the initialized channels, leaking devm DMA pool memory and leaving IRQs act=
ive.

[Severity: High]
This is a pre-existing issue, but could this pattern lead to a recursive
spinlock deadlock?

In fsl_re_dequeue(), the driver holds desc_lock while invoking the client's
DMA callback:

drivers/dma/fsl_raid.c:fsl_re_dequeue() {
    ...
    if (found) {
        fsl_re_desc_done(desc);
        list_move_tail(&desc->node, &re_chan->ack_q);
    }
    ...
}

If the client submits a new transaction from this callback, which is a
standard dmaengine pattern, it will attempt to acquire the same lock:

drivers/dma/fsl_raid.c:fsl_re_tx_submit() {
    ...
    spin_lock_irqsave(&re_chan->desc_lock, flags);
    ...
}

Would this result in an immediate deadlock on the same CPU?

[Severity: High]
This is a pre-existing issue, but is an endianness conversion required for
these hardware descriptor assignments?

drivers/dma/fsl_raid.c:fsl_re_init_desc() {
    ...
    desc->hwdesc.fmt32 =3D FSL_RE_FRAME_FORMAT << FSL_RE_HWDESC_FMT_SHIFT;
    desc->hwdesc.lbea32 =3D upper_32_bits(paddr);
    desc->hwdesc.addr_low =3D lower_32_bits(paddr);
    ...
}

And similarly in fill_cfd_frame():

drivers/dma/fsl_raid.c:fill_cfd_frame() {
    ...
    cf[index].efrl32 =3D efrl;
    cf[index].addr_high =3D upper_32_bits(addr);
    cf[index].addr_low =3D lower_32_bits(addr);
    ...
}

Host-endian values are assigned directly to __be32 hardware descriptor fiel=
ds.
Could this result in corrupted hardware descriptors being sent to the device
on little-endian architectures?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260718231521.2224=
56-1-rosenp@gmail.com?part=3D1
