Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C211F36897C
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785185951; cv=none; b=nWa/b5lZnDkCCuJPU6RaFD+5PWkT9Xfy5CdMR1bDdwRCXWjY/Q3T1qtr6Gpwso/SUR25QtdW4V4vBdseGmDWqOHJsE25BrHZccxtjXyhggzKs1yOGpIE2wO2NVrBdISHJ9m7HIi2qW+HBXk0DVicWkUCyFK83IfhSCusR56SKKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785185951; c=relaxed/simple;
	bh=lJkO8fbi1UP3xBXbBo3dRdBhjQE1JSo0gNsGP910Bmk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qrwkXc+ZF+LboLIX3QHAEsmb0z8DBKfNIQ6a1SwJhS5IULscHOElS2W8Vu1FXIg0tjC4R3p4A8oOx03Yld1BjClZrKNnK1IbkdjsnYfmvlqIl+ScOeZGIZLfseVM4g8RN6oS0CPQfv7lN3+zgwFA3w3TNv/R3its3phQMXCI80A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ex59BBqo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ex59BBqo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 394F21F000E9;
	Mon, 27 Jul 2026 20:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785185950;
	bh=jtUOmBbAPjCFR9Fx3O7dW4dtOMsEI5zAeWv9KWQEKBk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ex59BBqo+6mruxwf8muQL02uPHvqkZOisUmphrjJ3wmwwcF45vsx2EzjSmIwaUdpk
	 DII3rMIGNEOfCd4g7jOVBP6xHTF1dBVVf28gMyIUTCCdMQVFByak27XE7O+ok9ugWJ
	 whJRimD8NkIqLe4Dis0bgoFYFlN7gMNtlSHUg+Pwt/KbG9qlJCSv2XRLkPkjDcUcfd
	 Ndiu/fziewhzsbJ56VS5kZBZ/n+JhlKAhZW1DP8coNpulBaN+d/jScqeB+8M/1FGHC
	 2FD5sj0tSD+nTs9XdUi92fIT3rcOFR7rsaMNtAHqJvbJ7ny2xJC6n5xc4Mcf9heph3
	 fDTY6TDqtdkrA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 19/64] dmaengine: xilinx-dma: use dma_chan BH instead
 of tasklets
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <300282f7a29dc2125d22ac153075b0ac29591ce6.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <300282f7a29dc2125d22ac153075b0ac29591ce6.1785183549.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 20:59:09 +0000
Message-Id: <20260727205910.394F21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] request_irq() is called before channel initialization is complete,=
 creating a race condition if an early interrupt fires.
- [High] Uninitialized channel access in xilinx_mcdma_irq_handler during pr=
obe.
- [High] Recursive spinlock deadlock when running dependencies on the same =
DMA channel.
--

--- Patch [19]: [PATCH v2 19/64] dmaengine: xilinx-dma: use dma_chan BH ins=
tead of tasklets ---
commit 2b1e6b23fed3e56575f2e8169196ee83cbca26e8
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: xilinx-dma: use dma_chan BH instead of tasklets

This patch replaces the per-channel tasklet with the shared dma_chan BH
helper. The handler continues to run in softirq context while dmaengine
owns the common scheduling and teardown mechanism.

> diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_=
dma.c
> index 404235c173538..bf9f22ed12659 100644
> --- a/drivers/dma/xilinx/xilinx_dma.c
> +++ b/drivers/dma/xilinx/xilinx_dma.c
[ ... ]
> @@ -1115,11 +1113,12 @@ static void xilinx_dma_chan_desc_cleanup(struct x=
ilinx_dma_chan *chan)
> =20
>  /**
>   * xilinx_dma_do_tasklet - Schedule completion tasklet
> - * @t: Pointer to the Xilinx DMA channel structure
> + * @c: Pointer to the Xilinx DMA channel structure
>   */
> -static void xilinx_dma_do_tasklet(struct tasklet_struct *t)
> +static void xilinx_dma_do_tasklet(struct dma_chan *c)
>  {
> -	struct xilinx_dma_chan *chan =3D from_tasklet(chan, t, tasklet);
> +	struct xilinx_dma_chan *chan =3D container_of(c,
> +			struct xilinx_dma_chan, common);
> =20
>  	xilinx_dma_chan_desc_cleanup(chan);
>  }

[Severity: High]
This is a pre-existing issue, but can this lead to a recursive spinlock
deadlock?=20

Looking at xilinx_dma_chan_desc_cleanup(), the channel lock is acquired
before running dependencies:

xilinx_dma_chan_desc_cleanup() {
    ...
    spin_lock_irqsave(&chan->lock, flags);
    ...
    dma_run_dependencies(&desc->async_tx);
    ...
}

If a dependent transaction belongs to the same channel, dma_run_dependencie=
s()
will invoke xilinx_dma_tx_submit(), which unconditionally attempts to acqui=
re
the exact same chan->lock. Since standard spinlocks are not recursive, would
this cause the CPU to deadlock?

[ ... ]
> @@ -1898,7 +1897,7 @@ static irqreturn_t xilinx_mcdma_irq_handler(int irq=
, void *data)
>  		spin_unlock(&chan->lock);
>  	}
> =20
> -	tasklet_hi_schedule(&chan->tasklet);
> +	dma_chan_schedule_bh(&chan->common);
>  	return IRQ_HANDLED;
>  }

[Severity: High]
This is a pre-existing issue, but could this handler dereference a NULL
pointer during device probe?

If a shared interrupt fires while the driver is still probing channels,
xilinx_mcdma_irq_handler() might compute a chan_offset for a channel that
has not been probed yet:

xilinx_mcdma_irq_handler() {
    ...
    chan =3D chan->xdev->chan[chan_offset];
    status =3D dma_ctrl_read(chan, XILINX_MCDMA_CHAN_SR_OFFSET(chan->tdest)=
);
    ...
}

If the channel array entry is still NULL, would dma_ctrl_read() trigger a
crash?

[ ... ]
> @@ -3075,8 +3074,7 @@ static int xilinx_dma_chan_probe(struct xilinx_dma_=
device *xdev,
>  			str_enabled_disabled(chan->has_sg));
>  	}
> =20
> -	/* Initialize the tasklet */
> -	tasklet_setup(&chan->tasklet, xilinx_dma_do_tasklet);
> +	dma_chan_init_bh(&chan->common, xilinx_dma_do_tasklet);

[Severity: High]
This is a pre-existing issue, but does calling request_irq() earlier in
xilinx_dma_chan_probe() create a race condition here?

In xilinx_dma_chan_probe(), request_irq() is called with IRQF_SHARED
before chan->start_transfer and the bottom-half work are initialized:

xilinx_dma_chan_probe() {
    ...
    err =3D request_irq(chan->irq, xdev->dma_config->irq_handler,
                      IRQF_SHARED, "xilinx-dma-controller", chan);
    ...
    chan->start_transfer =3D xilinx_dma_start_transfer;
    ...
    dma_chan_init_bh(&chan->common, xilinx_dma_do_tasklet);
    ...
}

If an interrupt fires on the shared line immediately after request_irq()
succeeds, the handler could try to invoke chan->start_transfer() or
dma_chan_schedule_bh() while they are still uninitialized. Should the IRQ
registration be moved after the channel is fully initialized?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785183549.gi=
t.allen.lkml@gmail.com?part=3D19
