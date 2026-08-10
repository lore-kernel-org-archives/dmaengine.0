Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5C3339391
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786386540; cv=none; b=n6Ugis6uH1xask/NKloAoo34CII0XwvwmxU1fDAuGBJcx9um9F1asevjfx6w6MxhoBVwC04DJJ2ieH2J3Tp37nIRyAtnorItMqYV9/swDgptbxmCuKoSTg91g6+uB5dhdzn1p7BGyYm/3skqv9p6D5nKHhs5gLttxLDxFLVlQeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786386540; c=relaxed/simple;
	bh=3RJHdYzx5oiYvuPFg9iIwpQIMJhd+dhUj73Rf5XvrAI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fMWFGwpBbV6esv+0ShpuSIJtHGKQP0x4rN7o/iXjkMZaNK/oASJAlpYLww2dwkFkYKN265siMEyFLwxWsnWZTasQJtzwW07kOKBII6qCZxoHD4hOny8uHUwI3y4sPgPahJlX39WcE2svTzhcAIBhxOfsoIT+4Xeu37F0aNtYd9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AsFauvAD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AsFauvAD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F6FA1F000E9;
	Mon, 10 Aug 2026 18:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786386538;
	bh=oYpRVrRetnDNWwaZLuYT7toqK1j4AJsUJ7JOuMuTag8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AsFauvAD4CIO/GNPDefsTLNTpAERd1IcSKUX7JzLUUopnuM2aYHbMs+RnVYPrU+I0
	 bCOxrPbaYhRJiucj1WtCA9BN2lVkpZ2Ud2/KFKkNDBStj8SRzXIUoWChMEVJbOwWwU
	 PWWqyx4EyNN7sDXOZJvI8/411RhN6Rr9T18QDjm7L5SUmE07lMh/LGaTmzUdhI9wQq
	 9KXhdUUwyHjek/hU7MqSpsuJMJ0fVC7Z3nk53cw6zd4ynF6GmrRfTdpiMw/+KdQnRN
	 YgXGGrJ35IeH7UmFOcSXDamO5gNesNEc5FcRL/HWVv6UiJTP9/dG793W1WMb8Cq2To
	 TsgMFO9HzQrHA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 19/34] dmaengine: xilinx-dma: use dmaengine BH
 instead of tasklets
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <67afeabe4a9cc241704b36875e766d7d129465ec.1786384169.git.allen.lkml@gmail.com>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <67afeabe4a9cc241704b36875e766d7d129465ec.1786384169.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 18:28:58 +0000
Message-Id: <20260810182858.7F6FA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Shared IRQ handler for MCDMA cross-schedules bottom halves for=
 improperly masked removed channels, causing UAF.
- [High] Early IRQ request exposes uninitialized channel structures to prem=
ature interrupts, causing NULL pointer dereferences.
- [High] Unvalidated channel ID read from hardware causes an out-of-bounds =
array access.
- [High] Assuming all indexed channels in `xdev->chan` are fully populated =
causes a NULL pointer dereference for unprobed channels.
- [High] Missing bounds check on the `dma-channels` device tree property al=
lows an out-of-bounds heap write.
--

--- Patch [19]: [PATCH v3 19/34] dmaengine: xilinx-dma: use dmaengine BH in=
stead of tasklets ---
commit 2a691fa5fbfdf533a9f83a643b93d18aff3e2930
Author: Allen Pais <allen.lkml@gmail.com>
Subject: dmaengine: xilinx-dma: use dmaengine BH instead of tasklets

This patch replaces per-channel tasklets with the shared dmaengine
bottom half (BH) helper mechanism. It transitions the tasklet cleanup
handler to run under the dmaengine's scheduling and teardown framework
while continuing to execute in softirq context.

> diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_=
dma.c
> index 404235c173538..b142c9c0583c7 100644
> --- a/drivers/dma/xilinx/xilinx_dma.c
> +++ b/drivers/dma/xilinx/xilinx_dma.c

[ ... ]

> @@ -1898,7 +1897,7 @@ static irqreturn_t xilinx_mcdma_irq_handler(int irq=
, void *data)
>  		spin_unlock(&chan->lock);
>  	}
> =20
> -	tasklet_hi_schedule(&chan->tasklet);
> +	dmaengine_schedule_bh(&chan->common);
>  	return IRQ_HANDLED;
>  }

[Severity: High]
This isn't a bug introduced by this patch, but looking at how
xilinx_mcdma_irq_handler() computes the channel offset earlier in this
function:

    chan_sermask =3D dma_ctrl_read(chan, ser_offset);
    chan_id =3D ffs(chan_sermask);
    ...
    chan_offset =3D chan_offset + (chan_id - 1);
    chan =3D chan->xdev->chan[chan_offset];

Can a faulty hardware device or emulator asserting bits in the upper half of
chan_sermask cause an out-of-bounds access? The array xdev->chan is
statically sized to XILINX_MCDMA_MAX_CHANS_PER_DEVICE (32), but
chan_offset could potentially reach up to 47 for DEV_TO_MEM transfers.

[Severity: High]
This is also a pre-existing issue, but immediately after fetching the
channel pointer:

    chan =3D chan->xdev->chan[chan_offset];
    status =3D dma_ctrl_read(chan, XILINX_MCDMA_CHAN_SR_OFFSET(chan->tdest)=
);

If the device tree did not define all channels or some failed to probe,
could the xdev->chan array contain NULL pointers? If the hardware asserts
interrupts for unpopulated channels, it seems this would cause a NULL
pointer dereference.

[ ... ]

> @@ -2745,7 +2744,7 @@ static void xilinx_dma_chan_remove(struct xilinx_dm=
a_chan *chan)
>  	if (chan->irq > 0)
>  		free_irq(chan->irq, chan);
> =20
> -	tasklet_kill(&chan->tasklet);
> +	dmaengine_kill_bh(&chan->common);
> =20
>  	list_del(&chan->common.device_node);
>  }

[Severity: Critical]
This isn't a bug introduced by this patch, but looking at the teardown
sequence in xilinx_dma_chan_remove():

    dma_ctrl_clr(chan, XILINX_DMA_REG_DMACR,
                 XILINX_DMA_DMAXR_ALL_IRQ_MASK);

Does this write to the correct register for MCDMA channels? It appears to
write to XILINX_DMA_REG_DMACR instead of an MCDMA-specific register like
XILINX_MCDMA_CHAN_CR_OFFSET.

If the MCDMA hardware interrupts remain enabled, and the shared IRQ line
fires after this channel structure is freed, couldn't the shared
xilinx_mcdma_irq_handler() fetch this freed channel from the uncleared
xdev->chan array and call dmaengine_schedule_bh() on freed memory?

[ ... ]

> @@ -3075,8 +3074,7 @@ static int xilinx_dma_chan_probe(struct xilinx_dma_=
device *xdev,
>  			str_enabled_disabled(chan->has_sg));
>  	}
> =20
> -	/* Initialize the tasklet */
> -	tasklet_setup(&chan->tasklet, xilinx_dma_do_tasklet);
> +	dmaengine_init_bh(&chan->common, xilinx_dma_do_tasklet);
> =20
>  	/*
>  	 * Initialize the DMA channel and add it to the DMA engine channels

[Severity: High]
This isn't a bug introduced by this patch, but earlier in
xilinx_dma_chan_probe(), request_irq() is called before critical function
pointers like chan->start_transfer are initialized:

    err =3D request_irq(chan->irq, xdev->dma_config->irq_handler,
                      IRQF_SHARED, "xilinx-dma-controller", chan);

If a shared interrupt fires immediately (or if there is pending hardware
state), the handler xilinx_dma_irq_handler() will execute and might
unconditionally call chan->start_transfer(chan). Could this cause a NULL
pointer dereference since start_transfer is populated after request_irq()?

[Severity: High]
This is also a pre-existing issue, but further down in
xilinx_dma_chan_probe():

    xdev->chan[chan->id] =3D chan;

This relies on chan->id, which is incremented based on the loop in
xilinx_dma_child_probe():

    ret =3D of_property_read_u32(node, "dma-channels", &nr_channels);
    for (i =3D 0; i < nr_channels; i++) {
        ret =3D xilinx_dma_chan_probe(xdev, node);

Is there any bounds checking to ensure nr_channels or chan->id does not
exceed XILINX_MCDMA_MAX_CHANS_PER_DEVICE? Without it, an oversized device
tree property might cause an out-of-bounds heap write here.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786384168.gi=
t.allen.lkml@gmail.com?part=3D19
