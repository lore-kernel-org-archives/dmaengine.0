Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05287496D43
	for <dmaengine@vger.kernel.org>; Thu, 10 Sep 2026 20:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789072422; cv=none; b=K/Ujl9mXbFEc6rvRVOaRQli5A3+xZnsMiICDskTw6AkxlaQVguFM2lcHNjLrXCIOT4xhqncLQDPetWSlkANtOjccNgrZzeAosTJYfstufbDTgV5ZSys2q09mE5uK7XLNMdI8uw/abkXpIf+ePLTh5sDYvh3xKCemp3F68LDq7k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789072422; c=relaxed/simple;
	bh=Tm46Na2Oui+ISRKMr6Bcrzc+CPW78HfCG7aB0Gspopg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=e2ZvWFfXQY+F1vcSCRKs/+Kdspo/bwVuvEc6kQn5r1K34bQ6oNma29yMQfccl+wG8hqasmzZURjxV+rGSeq7kYcq89280iUYSbuquzZPSt/hkTQX+o5Gks9ReXMMMvtx99SqpHESlIbIiC/6F/FA+SHVvp9DQGni0/GYVU6RihQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=maUzF/oX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="maUzF/oX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 705B11F000FF;
	Thu, 10 Sep 2026 20:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789072420;
	bh=jOjoa7z5XKz7uE6TQ2BxJtMsp+duGA/jqCMBfGBH8zs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=maUzF/oXLMPAz6QK8D/tK0LV86vzLKCDt/5RlivF4wfA818+AsMW+VdtUD+EWSNcU
	 sAuelLohdEW6f+gLzLQd41qhGWXN0N4aJd3jTjrVZ/rfu/sKJgJNwYTK0BrLQDNiAw
	 XSQjxCoAUQLadufEoJ6yAeX22tgb99qk1z1XiXTotaPlZXqXH8/jvQy17KSMhK407Q
	 GK2FFU/Qg3OfubPoPUyUbaYXu2iy7Wm+manDBS9mvYmRIDws75UI+9XyjSOer7t7PX
	 /HgGCgs8QyUJeVPZzTX84F9skBia2I2tfB88a3+cFDR9yevnzD5rz8okjkN08UgLSZ
	 g4R4VMluD+3dg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: fsl_raid: fix 64-bit ring base address
 programming
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260910201717.44891-1-rosenp@gmail.com>
References: <20260910201717.44891-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 20:33:39 +0000
Message-Id: <20260910203340.705B11F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The return value of fsl_re_chan_probe() is ignored, leading to a N=
ULL pointer dereference on driver removal.
- [High] The driver calls request_irq() without a corresponding free_irq(),=
 causing a Use-After-Free panic on module removal.
- [High] Channels are never added to the DMA device's channel list, resulti=
ng in a non-functional driver.
- [High] The interrupt handler is registered before critical driver data is=
 initialized, leading to crashes from early interrupts.
- [High] The driver invokes the DMA client completion callback while holdin=
g desc_lock, causing an AB-BA self-deadlock if the client submits a new tra=
nsaction.
- [High] fsl_re_free_chan_resources() modifies the free_q list without hold=
ing desc_lock and improperly loops based on alloc_count.
--

commit ac27e4641c6966f6e1eb9d43776e03a8a1dcc825
Author: Rosen Penev <rosenp@gmail.com>

dmaengine: fsl_raid: fix 64-bit ring base address programming

The driver claims a 40-bit DMA mask via dma_set_mask(40), but the
inbound/outbound ring base addresses were programmed by masking the
physical address with FSL_RE_ADDR_BIT_MASK (0xF) into the high register
and shifting it right by FSL_RE_ADDR_BIT_SHIFT (4) into the low register.

> diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
> index 2d86f61105e52..e8223ac38e222 100644
> --- a/drivers/dma/fsl_raid.c
> +++ b/drivers/dma/fsl_raid.c
> @@ -707,15 +707,19 @@ static int fsl_re_chan_probe(struct platform_device=
 *ofdev,
>  		goto err_free_1;
>  	}
> =20
> -	/* Program the Inbound/Outbound ring base addresses and size */
> +	/* Program the Inbound/Outbound ring base addresses and size.
> +	 * The DMA rings are 64-bit addresses split into high/low registers.
> +	 * The driver supports a 40-bit DMA mask, so the low register holds
> +	 * bits [31:0] and the high register holds bits [39:32].
> +	 */
>  	out_be32(&chan->jrregs->inbring_base_h,
> -		 chan->inb_phys_addr & FSL_RE_ADDR_BIT_MASK);
> +		 upper_32_bits(chan->inb_phys_addr) & FSL_RE_ADDR_HIGH_MASK);
>  	out_be32(&chan->jrregs->oubring_base_h,
> -		 chan->oub_phys_addr & FSL_RE_ADDR_BIT_MASK);
> +		 upper_32_bits(chan->oub_phys_addr) & FSL_RE_ADDR_HIGH_MASK);
>  	out_be32(&chan->jrregs->inbring_base_l,
> -		 chan->inb_phys_addr >> FSL_RE_ADDR_BIT_SHIFT);
> +		 lower_32_bits(chan->inb_phys_addr));
>  	out_be32(&chan->jrregs->oubring_base_l,
> -		 chan->oub_phys_addr >> FSL_RE_ADDR_BIT_SHIFT);
> +		 lower_32_bits(chan->oub_phys_addr));
>  	out_be32(&chan->jrregs->inbring_size,
>  		 FSL_RE_RING_SIZE << FSL_RE_RING_SIZE_SHIFT);
>  	out_be32(&chan->jrregs->oubring_size,
> diff --git a/drivers/dma/fsl_raid.h b/drivers/dma/fsl_raid.h
> index adbfede330a77..748047996bbcc 100644
> --- a/drivers/dma/fsl_raid.h
> +++ b/drivers/dma/fsl_raid.h
> @@ -66,8 +66,7 @@
>  #define FSL_RE_RING_SIZE		0x400
>  #define FSL_RE_RING_SIZE_MASK		(FSL_RE_RING_SIZE - 1)
>  #define FSL_RE_RING_SIZE_SHIFT		8
> -#define FSL_RE_ADDR_BIT_SHIFT		4
> -#define FSL_RE_ADDR_BIT_MASK		(BIT(FSL_RE_ADDR_BIT_SHIFT) - 1)
> +#define FSL_RE_ADDR_HIGH_MASK		0xFF
>  #define FSL_RE_ERROR			0x40000000
>  #define FSL_RE_INTR			0x80000000
>  #define FSL_RE_CLR_INTR			0x80000000

[Severity: High]
This is a pre-existing issue, but I noticed the return value of
fsl_re_chan_probe() is ignored, which can lead to a NULL pointer dereference
on driver removal.

drivers/dma/fsl_raid.c:fsl_re_probe() {
    ...
			if (rc) {
				fsl_re_chan_probe(ofdev, child, ridx++, off);
				re_priv->total_chans++;
			}
    ...
}

If fsl_re_chan_probe() fails, re_priv->total_chans is still incremented,
and re_priv->re_jrs[q] remains NULL.  During teardown, fsl_re_remove() calls
fsl_re_remove_chan() which unconditionally dereferences it:

drivers/dma/fsl_raid.c:fsl_re_remove_chan() {
	tasklet_kill(&chan->irqtask);
    ...
}

Will this cause a kernel panic on driver unbind if any channel failed to
probe?

[Severity: High]
This isn't a bug introduced by this patch, but I noticed request_irq() is
called without a corresponding free_irq(), which can cause a use-after-free
panic on module removal.

drivers/dma/fsl_raid.c:fsl_re_chan_probe() {
    ...
	ret =3D request_irq(chan->irq, fsl_re_isr, 0, chan->name, chandev);
	if (ret) {
    ...
err_free:
	return ret;
}

The interrupt handler doesn't appear to be freed in error paths or during
teardown in fsl_re_remove_chan():

drivers/dma/fsl_raid.c:fsl_re_remove_chan() {
	tasklet_kill(&chan->irqtask);

	dma_pool_free(chan->re_dev->hw_desc_pool, chan->inb_ring_virt_addr,
		      chan->inb_phys_addr);
    ...
}

If a hardware interrupt fires after the module is unloaded, will the kernel
jump into freed module memory?

[Severity: High]
This is a pre-existing issue, but it looks like channels are never added to
the DMA device's channel list, which might result in a non-functional drive=
r.

drivers/dma/fsl_raid.c:fsl_re_chan_probe() {
    ...
	re_priv->re_jrs[q] =3D chan;
	chan->chan.device =3D dma_dev;
	chan->chan.private =3D chan;
	chan->dev =3D chandev;
    ...
}

The global channel list is initialized via INIT_LIST_HEAD(&dma_dev->channel=
s),
but list_add_tail(&chan->chan.device_node, &dma_dev->channels) is never
called.  Will dma_async_device_register() iterate over an empty list and
register zero channels?

[Severity: High]
This isn't a bug introduced by this patch, but the interrupt handler is
registered before critical driver data is initialized, which could lead to
crashes from early interrupts.

drivers/dma/fsl_raid.c:fsl_re_chan_probe() {
    ...
	ret =3D request_irq(chan->irq, fsl_re_isr, 0, chan->name, chandev);
    ...
	dev_set_drvdata(chandev, chan);
    ...
}

If a spurious or early interrupt triggers immediately after request_irq(),
the ISR will execute dev_get_drvdata() and receive NULL:

drivers/dma/fsl_raid.c:fsl_re_isr() {
    ...
	re_chan =3D dev_get_drvdata((struct device *)data);

	irqstate =3D in_be32(&re_chan->jrregs->jr_interrupt_status);
    ...
}

Could this cause a NULL pointer dereference panic while reading
jr_interrupt_status?

[Severity: High]
This is a pre-existing issue, but the driver invokes the DMA client complet=
ion
callback while holding desc_lock, which can cause an AB-BA self-deadlock.

drivers/dma/fsl_raid.c:fsl_re_dequeue() {
    ...
	spin_lock_irqsave(&re_chan->desc_lock, flags);
    ...
		if (found) {
			fsl_re_desc_done(desc);
    ...
}

If the client submits a chained DMA request within the callback,
fsl_re_tx_submit() attempts to re-acquire the exact same desc_lock:

drivers/dma/fsl_raid.c:fsl_re_tx_submit() {
    ...
	spin_lock_irqsave(&re_chan->desc_lock, flags);
    ...
}

Will this instantly deadlock the CPU?

[Severity: High]
This isn't a bug introduced by this patch, but fsl_re_free_chan_resources()
modifies the free_q list without holding desc_lock and improperly loops bas=
ed
on alloc_count.

drivers/dma/fsl_raid.c:fsl_re_free_chan_resources() {
    ...
	while (re_chan->alloc_count--) {
		desc =3D list_first_entry(&re_chan->free_q,
					struct fsl_re_desc,
					node);

		list_del(&desc->node);
    ...
		kfree(desc);
	}
}

If any descriptors are still in flight, free_q will be prematurely empty,
causing list_first_entry() to return an invalid pointer which is then freed.
Should this be protected by desc_lock and use list_empty() checks?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910201717.4489=
1-1-rosenp@gmail.com?part=3D1
