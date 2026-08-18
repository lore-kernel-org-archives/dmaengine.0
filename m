Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152F844839E
	for <dmaengine@vger.kernel.org>; Tue, 18 Aug 2026 09:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787046599; cv=none; b=c1PYpXptVMmpXeAK+2b3LuzuI+aEZsRUSB6qYLRyNAsd2iK1j6K9pRIcV/G4epMwDopPgBIVIZaW+JvaWK1zHuhgq68r2/xvP7KjNScdupq61em/9aGLHd/IxlV4Qp/p2Yz14KUpFbB+w1pqkok/h9EXEbPXE1xUbPuzQx7WCJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787046599; c=relaxed/simple;
	bh=fBC8lBTG88PcAilaEvllxWCGOWzMMxNOlzKcCDbtO/E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BYlkOPCSmGKdpVFHpp2yPD9uzzoZzJxQPe75tu+AJrUqtwJQY5TPHoYbzCJoqOc9i5QBuxlUpPRMj6F3Z3ONQyPi07rOI5rP2HOwcmb8qC0QSpTaCslCqjRNm+euSA1hVLZDJwv0nVwVAFkcwMIjBzHmu2u16NeuH1nqHqmIXGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZL27e564; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZL27e564"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D2221F000E9;
	Tue, 18 Aug 2026 09:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787046597;
	bh=XUJVpNMKnRVvTIjLgBKI5uqYrYv07US6qdZRUHOTYfg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZL27e564rL5DYhfgVnkI19uPy8ySTJG61Ct5vQ9/fnzwcPtviMM+4XCkCIsvpZPGL
	 wOKvqdNL096KATjRdvUQicuHREsT5D+ACD81Nkr6kYncrnyyCw64jeHM5UaWt4/TcO
	 FMvj0lsTkr60zK0dNm1eZ2Uz2f1xT3VTtw1DAGH/a7U8vZgfSEQrTYcFBwGANCT2MT
	 XKoutG5E1NAs+LunAJdTatPOqVo5sxeXqdOCd+B4TuH+1HvuF52txfV9KS6XiiDhaC
	 O+CDwMpq3EZXrEoy/S1kJYq4m1m75A5Y92Liq6R1UL6x9FptbCo9veF3CmMV3+LvA6
	 kWj+LIwH8uh5Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: loongson: loongson2-apb-cmc: Fix signedness
 bug in irq handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Binbin Zhou" <zhoubinbin@loongson.cn>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260818093448.3597016-1-zhoubinbin@loongson.cn>
References: <20260818093448.3597016-1-zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 09:49:57 +0000
Message-Id: <20260818094957.7D2221F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] The ACPI DMA filter function unconditionally casts and modifie=
s unknown dma_chan pointers, causing memory corruption.
- [High] Activating the IRQ error path exposes a race condition where the D=
MA engine is unregistered without proper synchronization, and virt-dma task=
lets are leaked, causing Use-After-Free bugs.
- [High] The shared interrupt handler unconditionally returns IRQ_HANDLED, =
breaking spurious interrupt detection.
- [High] A NULL pointer dereference will occur in loongson2_cmc_dma_desc_re=
sidue() when querying the status of an idle channel or pending descriptor.
- [High] loongson2_cmc_dma_prep_slave_sg() leaks the allocated descriptor i=
f loongson2_cmc_dma_set_xfer_param() fails.
--

--- Patch [1]: [PATCH] dmaengine: loongson: loongson2-apb-cmc: Fix signedne=
ss bug in irq handling ---
commit a6570585f5f63a15a2b81f25847b66a84b8e9a42
Author: Binbin Zhou <zhoubinbin@loongson.cn>

dmaengine: loongson: loongson2-apb-cmc: Fix signedness bug in irq handling

This patch changes the type of irq to int in the loongson2-apb-cmc DMA
driver, allowing proper signed comparison and error handling when
platform_get_irq() returns a negative value.

Closes: https://lore.kernel.org/r/202608152230.p20WPlS0-lkp@intel.com/

> diff --git a/drivers/dma/loongson/loongson2-apb-cmc-dma.c b/drivers/dma/l=
oongson/loongson2-apb-cmc-dma.c
> index 1c9a542edc859..969dbc5dabe75 100644
> --- a/drivers/dma/loongson/loongson2-apb-cmc-dma.c
> +++ b/drivers/dma/loongson/loongson2-apb-cmc-dma.c
> @@ -90,7 +90,7 @@ struct loongson2_cmc_dma_chan {
>  	struct dma_slave_config	dma_sconfig;
>  	struct loongson2_cmc_dma_desc *desc;
>  	u32 id;
> -	u32 irq;
> +	int irq;

[Severity: High]
This isn't a bug introduced by this patch, but since this patch fixes the
error check for lchan->irq < 0, it enables this error path which exposes
a race condition and a tasklet leak.

In loongson2_cmc_dma_probe(), dmaenginem_async_device_register() is called
before the IRQ setup loop. If platform_get_irq() or devm_request_irq()
fails now, the probe aborts and triggers devres cleanup. If a client
requested a channel in this narrow window, it takes a kref, but devres
will unwind and free the lddev memory anyway, leading to a Use-After-Free.

Also, vchan_init() initializes tasklets, but tasklet_kill() is never
called in the error path or in loongson2_cmc_dma_remove():

loongson2-apb-cmc-dma.c:loongson2_cmc_dma_remove() {
	of_dma_controller_free(pdev->dev.of_node);
}

If a tasklet was scheduled, it will execute after the device memory is
freed. Could the IRQ initialization be moved before
dmaenginem_async_device_register(), and tasklet_kill() be added to the
cleanup paths?


[Severity: High]
This is a pre-existing issue, but the shared interrupt handler
unconditionally returns IRQ_HANDLED, breaking spurious interrupt
detection.

loongson2-apb-cmc-dma.c:loongson2_cmc_dma_chan_irq() {
	...
	scoped_guard(spinlock, &lchan->vchan.lock) {
		...
	}

	return IRQ_HANDLED;
}

Since IRQF_SHARED is used, if the status register reads 0 (no interrupt
generated by this channel), the handler simply drops the lock and returns
IRQ_HANDLED.

Does this falsely claim to handle a spurious interrupt, masking an
interrupt storm from a misbehaving shared device?


[Severity: Critical]
This is a pre-existing issue, but the ACPI DMA filter function
unconditionally casts and modifies unknown dma_chan pointers, causing
memory corruption.

loongson2-apb-cmc-dma.c:loongson2_cmc_dma_acpi_filter() {
	struct loongson2_cmc_dma_chan *lchan =3D to_lmdma_chan(chan);
	struct acpi_dma_spec *dma_spec =3D param;

	memset(&lchan->chan_reg, 0,
	       sizeof(struct loongson2_cmc_dma_chan_reg));
	lchan->chan_reg.ccr =3D dma_spec->chan_id &
			      LOONGSON2_CMCDMA_STREAM_MASK;
=09
	return true;
}

The DMA engine core iterates over all available DMA channels in the system
and passes them to this filter. Blindly casting the generic dma_chan to
loongson2_cmc_dma_chan without verifying ownership corrupts other drivers'
memory via memset(). Could ownership be verified first?


[Severity: High]
This is a pre-existing issue, but a NULL pointer dereference will occur in
loongson2_cmc_dma_desc_residue() when querying the status of an idle
channel.

loongson2-apb-cmc-dma.c:loongson2_cmc_dma_desc_residue() {
	...
	if (lchan->desc->cyclic && next_sg =3D=3D 0)
		return residue;
	...
}

When a caller requests the status of a pending descriptor via
loongson2_cmc_dma_tx_status(), it passes next_sg =3D 0. If the channel is
idle or has no active descriptor, lchan->desc is NULL. Does this
unconditionally dereference a NULL pointer?


[Severity: High]
This is a pre-existing issue, but loongson2_cmc_dma_prep_slave_sg() leaks
the allocated descriptor if loongson2_cmc_dma_set_xfer_param() fails.

loongson2-apb-cmc-dma.c:loongson2_cmc_dma_prep_slave_sg() {
	...
	desc =3D kzalloc_flex(*desc, sg_req, sg_len, GFP_NOWAIT);
	if (!desc)
		return ERR_PTR(-ENOMEM);

	for_each_sg(sgl, sg, sg_len, i) {
		ret =3D loongson2_cmc_dma_set_xfer_param(lchan, direction,
						       &buswidth,
						       sg_dma_len(sg));
		if (ret)
			return ERR_PTR(ret);
	...
}

If the transfer direction is invalid, the function returns ERR_PTR(ret)
directly without freeing the dynamically allocated desc. Can this allow an
application to deplete kernel memory by repeatedly submitting bad SG
lists?

>  	u32 next_sg;
>  	struct loongson2_cmc_dma_chan_reg chan_reg;
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818093448.3597=
016-1-zhoubinbin@loongson.cn?part=3D1
