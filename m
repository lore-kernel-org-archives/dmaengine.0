Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4553DAABF;
	Mon, 27 Jul 2026 20:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785185870; cv=none; b=OQSMyGWxfV6c1++DOzuyBae2li8niGo1i6GRTJaR2VU670ucww7T111BmPtaWTYdROBzdEoyVSS2/ZnrgTE2SvYeOSfHLizoqqDiy2IDSiZTVC6ULsx5rhLO2xwM9l6X/XjK3CLjY0QwGBMInBw8uki36kDl2+QNbGDnCjI5ITs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785185870; c=relaxed/simple;
	bh=MlvVfZ2VF/15u/UIUnkrloOL0sMT3OEj91/rKzZGsRk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cZNWvAG4qUzc3nPv5Bi6UqhRBdp3NrL88QbU8i+xAicPXn0mka+YwCRsH0d0VDn/s+gezpHeOmn4PTLclIs//WVhDl1WVyCpGL2S9XmkP9GXJ22MQHbGTyMyF4TYSmH5xMDjnDCSEJk5VzwwKIGY35DFvKcGOg3+WCCJniQU1WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cs7e64f1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cs7e64f1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F42E1F000E9;
	Mon, 27 Jul 2026 20:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785185868;
	bh=o/zZlmhtNumHqcI4JSnKvopwUmfADeDq2d8a5v0l5kE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Cs7e64f1R/qOmf2Gakhzjiw41si/99K5qrUywlOJ1N2kz7kxhqC93DGgQaiZ6b3fT
	 pwVkFjCYaBHVGtols2JsLThLIypp/f1wqadgAh764ioG9lUkVL2H4nTjIfyKjBErQB
	 zoli05Jm3WR4UfHDJCQrelFlgr1P+ZHOFpjeC0nhL9XqZHNM4F/UANQcw5z9JaXFP5
	 SeMII6g09dQYNk+ursLwwl6/PQbKQ5C4KdBVSFGRKYr8F4D7MvzGw7yf7IYC06FBtm
	 iKAXWrYhKMucEK+kKknNr3XrRQY/ij2aYMOXqW0cqOKXThdyfHxHcs6BGcLb+LWnAg
	 ggAQEp6fbXe1Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 08/64] dmaengine: imx-dma: flip per-chan tasklet to
 dma_chan BH
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org, imx@lists.linux.dev
In-Reply-To: <fbe4067de02f050d3b2f958b3a04dcef0549b6f6.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <fbe4067de02f050d3b2f958b3a04dcef0549b6f6.1785183549.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 20:57:47 +0000
Message-Id: <20260727205748.4F42E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The per-channel watchdog timer is not synchronously canceled durin=
g driver teardown, leading to a Use-After-Free.
- [High] Pending BH works are not canceled on the probe error path, causing=
 a Use-After-Free.
- [High] Early interrupts cause a NULL pointer dereference because IRQs are=
 requested before channel lists are initialized.
- [High] Descriptor state is accessed after being placed on the free list a=
nd unlocking the spinlock, leading to a TOCTOU race with prep functions.
- [High] Channel state and lists are read and modified without proper lock =
protection in descriptor preparation functions.
- [High] The driver frees DMA descriptors in `imxdma_free_chan_resources` w=
ithout synchronizing with the completion BH, causing a Use-After-Free.
--

--- Patch [8]: [PATCH v2 08/64] dmaengine: imx-dma: flip per-chan tasklet t=
o dma_chan BH ---
commit 6c1578dd7a98a9ceebdc129c266b46d0c2bdf6e3
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: imx-dma: flip per-chan tasklet to dma_chan BH

Replace the per-channel tasklet with the shared dma_chan BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

> diff --git a/drivers/dma/imx-dma.c b/drivers/dma/imx-dma.c
> index 81c6276436f81..3ff0bfbfa5ffa 100644
> --- a/drivers/dma/imx-dma.c
> +++ b/drivers/dma/imx-dma.c

[ ... ]

> @@ -592,9 +591,10 @@ static int imxdma_xfer_desc(struct imxdma_desc *d)
>  	return 0;
>  }
> =20
> -static void imxdma_tasklet(struct tasklet_struct *t)
> +static void imxdma_tasklet(struct dma_chan *chan)
>  {
> -	struct imxdma_channel *imxdmac =3D from_tasklet(imxdmac, t, dma_tasklet=
);
> +	struct imxdma_channel *imxdmac =3D container_of(chan, struct imxdma_cha=
nnel,
> +						      chan);
>  	struct imxdma_engine *imxdma =3D imxdmac->imxdma;
>  	struct imxdma_desc *desc, *next_desc;
>  	unsigned long flags;

[Severity: High]
This is a pre-existing issue, but is it safe to invoke the callback after
releasing the spinlock and moving the descriptor to the free list?

At the end of imxdma_tasklet(), the lock is released and the callback is
subsequently invoked directly from the descriptor:

out:
        spin_unlock_irqrestore(&imxdma->lock, flags);

        dmaengine_desc_get_callback_invoke(&desc->desc, NULL);
}

Since the descriptor is already on the free list, couldn't a concurrent
call to imxdma_prep_dma_memcpy() pick this exact descriptor from ld_free
and clear desc->desc.callback =3D NULL, leading to execution of a NULL or
corrupted callback?

[Severity: High]
This isn't a bug introduced by this patch, but how are the channel lists
synchronized against concurrent preparation?

The completion BH actively splices and modifies ld_free and ld_active while
holding imxdma->lock. However, prep functions like imxdma_prep_dma_memcpy()
read ld_free and call list_first_entry() without acquiring the channel lock:

drivers/dma/imx-dma.c:imxdma_prep_dma_memcpy() {
        ...
        if (list_empty(&imxdmac->ld_free) ||
            imxdma_chan_is_doing_cyclic(imxdmac))
                return NULL;

        desc =3D list_first_entry(&imxdmac->ld_free, struct imxdma_desc, no=
de);
        ...
}

Could this lead to linked list corruption or NULL pointer dereferences if
clients actively submit transfers while completions fire?

[ ... ]

> @@ -1142,7 +1142,7 @@ static int __init imxdma_probe(struct platform_devi=
ce *pdev)
>  		INIT_LIST_HEAD(&imxdmac->ld_free);
>  		INIT_LIST_HEAD(&imxdmac->ld_active);
> =20
> -		tasklet_setup(&imxdmac->dma_tasklet, imxdma_tasklet);
> +		dma_chan_init_bh(&imxdmac->chan, imxdma_tasklet);
>  		imxdmac->chan.device =3D &imxdma->dma_device;
>  		dma_cookie_init(&imxdmac->chan);
>  		imxdmac->channel =3D i;

[Severity: High]
This is a pre-existing issue, but what happens if the probe fails after
this point?

Looking at the error path later in imxdma_probe():

err_of_dma_controller:
        dma_async_device_unregister(&imxdma->dma_device);
disable_dma_ahb_clk:
        clk_disable_unprepare(imxdma->dma_ahb);
disable_dma_ipg_clk:
        clk_disable_unprepare(imxdma->dma_ipg);
        return ret;

It exits without calling dma_chan_kill_bh() or imxdma_free_irq(). If a
spurious or lingering hardware interrupt triggers before
dma_async_device_register() completes, dma_irq_handler() schedules the BH.
If a subsequent initialization step fails, devres frees the device memory
but the scheduled BH is never canceled, which might lead to a use-after-fre=
e.

[Severity: High]
This isn't a bug introduced by this patch, but does the early interrupt
setup risk a NULL pointer dereference?

The IRQ is requested earlier in imxdma_probe():

        ret =3D devm_request_irq(&pdev->dev, irq,
                               dma_irq_handler, 0, "DMA", imxdma);

This happens well before the list heads like ld_active are initialized in
the loop shown in the diff above. If an interrupt fires early,
dma_irq_handle_channel() checks the list:

        if (list_empty(&imxdmac->ld_active)) {
                spin_unlock_irqrestore(&imxdma->lock, flags);
                goto out;
        }

Since memory is 0-initialized, ld_active.next is NULL. This makes
list_empty() evaluate to false, leading directly to a crash via
list_first_entry() right below it.

[ ... ]

> @@ -1211,7 +1211,7 @@ static void imxdma_free_irq(struct platform_device =
*pdev, struct imxdma_engine *
>  		if (!is_imx1_dma(imxdma))
>  			disable_irq(imxdmac->irq);
> =20
> -		tasklet_kill(&imxdmac->dma_tasklet);
> +		dma_chan_kill_bh(&imxdmac->chan);
>  	}
>  }

[Severity: High]
This is a pre-existing issue, but is it safe to kill the BH here without
also stopping the watchdog timer?

This function stops the BH but omits timer_shutdown_sync(&imxdmac->watchdog=
),
leaving it active. If the driver is unbound via sysfs while a transfer is
active, imxdma_remove() invokes imxdma_free_irq() and then unregisters
and frees the engine. Couldn't the still-armed timer fire on freed memory
and schedule the destroyed BH workqueue?

[Severity: High]
This isn't a bug introduced by this patch, but does
imxdma_free_chan_resources() safely synchronize with this BH?

When a channel is released, descriptors are indiscriminately freed without
stopping or waiting for the BH to finish:

drivers/dma/imx-dma.c:imxdma_free_chan_resources() {
        ...
        list_for_each_entry_safe(desc, _desc, &imxdmac->ld_free, node) {
                kfree(desc);
                imxdmac->descs_allocated--;
        }
        ...
}

Since the driver lacks a device_synchronize callback and does not call
dma_chan_kill_bh() during channel release, could the completion BH be
actively running on another CPU trying to invoke the callback for a
descriptor that is being freed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785183549.gi=
t.allen.lkml@gmail.com?part=3D8
