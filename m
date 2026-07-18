Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0E01A6815
	for <dmaengine@vger.kernel.org>; Sat, 18 Jul 2026 03:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784346421; cv=none; b=k5h4YpJUX6dHmHLZXBkbr/CA/HUoPlltU7Gi68OgqI6NP4f9cMqDnyC+I0DOUnu50x0PdsQGq364Pb6bWkVoOi0nVcJ6hDNdo8QQ6dJjRz1VDrNym256HzQm4c+M7DCffVMoV929GCpVGjpyZzYfMwh+A0/4/wk5ULpla6FYFIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784346421; c=relaxed/simple;
	bh=xijYSqo7zi7n4puBpBJ5pw0Qh/soi/kguTqvDipsIY0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sh+I2luW8MvoHrDqlr50WsgMbwIBAk939KPcdD6dyrCG0d5bzBdA1lLgxQkIy+57q1u9EumQPVtqY2yHXwIvCzBkRu1Q1+Chp+q1qkUIdfU8hJUcEEAPbY1rTKO8u7US0/t8HpuSazmy6ajpWoiJUXQa+dbhcHGawS0bkJrOd4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A/Rszt39; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A/Rszt39"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A03B1F000E9;
	Sat, 18 Jul 2026 03:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784346419;
	bh=bins1UabK/moGioxbGgGKvVPQxwi67BsGdYLvDRNcN4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A/Rszt39D6DdRmxYZRZ1zYR5SDzM2L8JwnsNhWx+qcijRt9QNhaEy21hAAe9etnSx
	 U9oeBLYHxXA2EuUAvhk1yNRyEaiRhuPE+/gne9MbxciEg7CXXtF2DxV6cByDr/8Yw6
	 hlgczt7sSyMnjiMqf1x1xix+16RvVyQe0nBRlbPCyyiZhm1rEaX6mciDiXCDTKjlGP
	 jWaxqQ/9iC+paX7gkmJunYNAIrv/XcdJEo0+tI/V0jctKvKJJTlkNWKALC+bc8E766
	 puvjsI2cnEU7V3T+PhwMFaOxjR9nzCaoQEZhmpvJCpyKWxaR+Sdb7r7oZf2KdyrbHP
	 NSLBZLFPBN7vg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: fsl_raid: replace in_be32/out_be32 with
 ioread32be/iowrite32be
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260718033122.2372985-1-rosenp@gmail.com>
References: <20260718033122.2372985-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 18 Jul 2026 03:46:58 +0000
Message-Id: <20260718034659.0A03B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] `request_irq` is used without `devm_` and is never freed on er=
ror paths or during device removal, leading to Use-After-Free in the interr=
upt handler.
- [High] The driver configures a 40-bit DMA mask but incorrectly programs t=
he 64-bit ring base addresses, truncating upper address bits and incorrectl=
y placing the lowest 4 bits into the high address register, causing silent =
memory corruption for high memory allocations.
- [High] Deadlock in `fsl_re_dequeue` due to invoking DMA client callback w=
ith the channel spinlock held.
- [High] Unchecked return value of `fsl_re_chan_probe` causes a NULL pointe=
r dereference during device removal.
--

--- Patch [1]: [PATCH] dmaengine: fsl_raid: replace in_be32/out_be32 with i=
oread32be/iowrite32be ---
commit 9a55b4c8c34b72fe5484852d6708a7ea677fc0df
Author: Rosen Penev <rosenp@gmail.com>

dmaengine: fsl_raid: replace in_be32/out_be32 with ioread32be/iowrite32be

This commit replaces ppc4xx-specific accessors (in_be32/out_be32) with
generic portable helpers (ioread32be/iowrite32be) in the fsl_raid driver.
It also enables COMPILE_TEST for extra compile coverage.

> diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
> index 2d86f61105e52..e559c636bf552 100644
> --- a/drivers/dma/fsl_raid.c
> +++ b/drivers/dma/fsl_raid.c
[ ... ]
> @@ -167,7 +167,7 @@ static void fsl_re_dequeue(struct tasklet_struct *t)
>  	fsl_re_cleanup_descs(re_chan);
> =20
>  	spin_lock_irqsave(&re_chan->desc_lock, flags);
> -	count =3D	FSL_RE_SLOT_FULL(in_be32(&re_chan->jrregs->oubring_slot_full)=
);
> +	count =3D FSL_RE_SLOT_FULL(ioread32be(&re_chan->jrregs->oubring_slot_fu=
ll));

[Severity: High]
This is a pre-existing issue, but can this lead to a deadlock?

Looking at fsl_re_dequeue(), it acquires the desc_lock spinlock using
spin_lock_irqsave() and holds it while processing completed descriptors:

spin_lock_irqsave(&re_chan->desc_lock, flags);
...
if (found) {
        fsl_re_desc_done(desc);
        list_move_tail(&desc->node, &re_chan->ack_q);
}

The fsl_re_desc_done() function synchronously invokes the client callback
via dmaengine_desc_get_callback_invoke().

If the DMA client callback submits a new request, would it call
fsl_re_tx_submit() and attempt to reacquire the exact same desc_lock,
resulting in a deadlock?

>  	while (count--) {
>  		found =3D 0;
>  		hwdesc =3D &re_chan->oub_ring_virt_addr[re_chan->oub_count];
[ ... ]
> @@ -708,30 +707,23 @@ static int fsl_re_chan_probe(struct platform_device=
 *ofdev,
>  	}
> =20
>  	/* Program the Inbound/Outbound ring base addresses and size */
> -	out_be32(&chan->jrregs->inbring_base_h,
> -		 chan->inb_phys_addr & FSL_RE_ADDR_BIT_MASK);
> -	out_be32(&chan->jrregs->oubring_base_h,
> -		 chan->oub_phys_addr & FSL_RE_ADDR_BIT_MASK);
> -	out_be32(&chan->jrregs->inbring_base_l,
> -		 chan->inb_phys_addr >> FSL_RE_ADDR_BIT_SHIFT);
> -	out_be32(&chan->jrregs->oubring_base_l,
> -		 chan->oub_phys_addr >> FSL_RE_ADDR_BIT_SHIFT);
> -	out_be32(&chan->jrregs->inbring_size,
> -		 FSL_RE_RING_SIZE << FSL_RE_RING_SIZE_SHIFT);
> -	out_be32(&chan->jrregs->oubring_size,
> -		 FSL_RE_RING_SIZE << FSL_RE_RING_SIZE_SHIFT);
> +	iowrite32be(chan->inb_phys_addr & FSL_RE_ADDR_BIT_MASK, &chan->jrregs->=
inbring_base_h);
> +	iowrite32be(chan->oub_phys_addr & FSL_RE_ADDR_BIT_MASK, &chan->jrregs->=
oubring_base_h);
> +	iowrite32be(chan->inb_phys_addr >> FSL_RE_ADDR_BIT_SHIFT, &chan->jrregs=
->inbring_base_l);
> +	iowrite32be(chan->oub_phys_addr >> FSL_RE_ADDR_BIT_SHIFT, &chan->jrregs=
->oubring_base_l);

[Severity: High]
This is a pre-existing issue, but does this correctly program the 64-bit
DMA base addresses?

The driver advertises 40-bit DMA address support in fsl_re_probe() by
calling:

dma_set_mask(dev, DMA_BIT_MASK(40));

However, when writing the physical addresses here in fsl_re_chan_probe(), it
shifts the address right by FSL_RE_ADDR_BIT_SHIFT into inbring_base_l, and
extracts the lowest bits via FSL_RE_ADDR_BIT_MASK into inbring_base_h.

If a DMA buffer is allocated above the 64GB boundary, will this drop the
upper bits and extract the lowest bits into the high register, leading to
the hardware reading or writing the wrong physical memory?

[Severity: Critical]
This is a pre-existing issue, but is there a missing IRQ cleanup here?

Earlier in fsl_re_chan_probe(), the driver requests an interrupt without
using the managed devm_ wrapper:

ret =3D request_irq(chan->irq, fsl_re_isr, 0, chan->name, chandev);

If fsl_re_chan_probe() fails later, or if the driver is unbound and
fsl_re_remove_chan() is called, free_irq() is never called to unregister
the handler.

Since the chan structure is allocated with devm_kzalloc, will a dangling
interrupt firing after the device is removed cause fsl_re_isr() to
dereference the freed chan pointer and crash?

> +	iowrite32be(FSL_RE_RING_SIZE << FSL_RE_RING_SIZE_SHIFT, &chan->jrregs->=
inbring_size);
> +	iowrite32be(FSL_RE_RING_SIZE << FSL_RE_RING_SIZE_SHIFT, &chan->jrregs->=
oubring_size);
[ ... ]
> @@ -766,15 +758,15 @@ static int fsl_re_probe(struct platform_device *ofd=
ev)
>  	re_priv->base =3D re_regs;
> =20
>  	/* Program the RE mode */
> -	out_be32(&re_regs->global_config, FSL_RE_NON_DPAA_MODE);
> +	iowrite32be(FSL_RE_NON_DPAA_MODE, &re_regs->global_config);

[Severity: High]
This is a pre-existing issue, but are we missing an error check on the
return value of fsl_re_chan_probe()?

Later in fsl_re_probe(), the driver iterates over child nodes and calls
fsl_re_chan_probe(), but ignores the return value and unconditionally
increments total_chans:

for_each_child_of_node(np, child) {
        rc =3D of_device_is_compatible(child,
                                     "fsl,raideng-v1.0-job-ring");
        if (rc) {
                fsl_re_chan_probe(ofdev, child, ridx++, off);
                re_priv->total_chans++;
        }
}

If fsl_re_chan_probe() fails (for example, failing to map an IRQ), the array
element re_priv->re_jrs[ridx] remains uninitialized.

During module unload, fsl_re_remove_chan() unconditionally dereferences the
pointer when calling tasklet_kill(&chan->irqtask).

Will this result in a NULL pointer dereference on cleanup if any channel
failed to probe?

> =20
>  	/* Program Galois Field polynomial */
> -	out_be32(&re_regs->galois_field_config, FSL_RE_GFM_POLY);
> +	iowrite32be(FSL_RE_GFM_POLY, &re_regs->galois_field_config);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260718033122.2372=
985-1-rosenp@gmail.com?part=3D1
