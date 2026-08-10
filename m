Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B72242D65;
	Mon, 10 Aug 2026 18:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786386886; cv=none; b=gmeWS9hd9loQK0AlAq36KTDjvNcOC3/yDlzbU53PwKzu/j/JYHkiXA7xD1nrVsZ5tWiLEuYpa+ErmPL6MV7YV2WqeFgdHzQpfjBMPIIAX/h3YfSHMgdL9lovXyS6n+75lmKPN7xmXlcY6kweC133dgBw0j84XOHYgt9mqLmUn/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786386886; c=relaxed/simple;
	bh=19LRYhEaGVVsRgqVqsQjcCsJr/ohRigWwKNkRqoTdJ0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PjNSqEfjyuiWOhZ8WENxw+CnotWWMb0mRNM9yR8pxar5rKHYspbFWl5t+sNf9Dqk2hxZ+Ot6rkn6uPhJPKQmEIhFUjkukZDO8NqHSYS5KvHe207p93qptBtLhjlA8QAU0JKGBXiCk5WDbpQswCnf2mU1/pyVYBxQZPCFEcU2J3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=caz7o2RP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="caz7o2RP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C286D1F000E9;
	Mon, 10 Aug 2026 18:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786386885;
	bh=VoUw6BR5c9Dh2JSjaasHfK7DbtfZ1vMXWOiEPE/tN2Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=caz7o2RP/RGd+N0mAq4XlslXxJBMyFgxxHK0oQEz8/9SS7IAUyataSCqVzDtJUuWZ
	 sEdt3kZ1dthbP73sRvh3JYYmPcb3X8X+xYmtslgxpr9j7vo0gjo/td7DqJMGuInAN+
	 9meY/wOA5gibgpDIKsvazyqyk1cfeWcRcqGfY3XyMjxSj/Ppw4fBxncBmcx699GUm2
	 v3DtSl8h/49uz5DYQ7KBLczIJa3eTnDuKLpC5VzLUO633zW0zVWY2QHcZTSE72VquX
	 c412CPUZybQYw4Jfc6Otf5IAJx9/hwPBktWr71cK96kGDRWOo02Yf0gVkxBfMLAKTw
	 1eMvpv80Gtnzg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 08/34] dmaengine: imx-dma: flip per-chan tasklet to
 dmaengine BH
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, imx@lists.linux.dev, dmaengine@vger.kernel.org
In-Reply-To: <787938bdaef4c3530b4bf0296386a33928b877f0.1786384168.git.allen.lkml@gmail.com>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <787938bdaef4c3530b4bf0296386a33928b877f0.1786384168.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 18:34:44 +0000
Message-Id: <20260810183444.C286D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The watchdog timer is not safely canceled during teardown or error=
 paths, leading to Use-After-Free.
- [High] Completed descriptors are moved to the free list before callback i=
nvocation, allowing lockless data races.
- [High] Bottom-half work is not flushed before freeing channel descriptors=
, leading to Use-After-Free.
- [High] IRQ is requested before initializing channel data structures and m=
asking interrupts, leading to a NULL pointer dereference.
--

--- Patch [8]: [PATCH v3 08/34] dmaengine: imx-dma: flip per-chan tasklet t=
o dmaengine BH ---
commit a54288aab8aa66cb0228a7320efe5075981ac5ce
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: imx-dma: flip per-chan tasklet to dmaengine BH

Replace the per-channel tasklet with the shared dmaengine BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

> diff --git a/drivers/dma/imx-dma.c b/drivers/dma/imx-dma.c
> index 81c6276436f81..308fe407fe161 100644
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
This isn't a bug introduced by this patch, but could this lockless data race
cause a loss of completion callbacks?

In imxdma_tasklet(), the completed descriptor is placed on the ld_free list
before the channel lock is dropped and the callback is invoked:

imxdma_tasklet()
    list_move_tail(imxdmac->ld_active.next, &imxdmac->ld_free);
    spin_unlock_irqrestore(&imxdma->lock, flags);
    dmaengine_desc_get_callback_invoke(&desc->desc, NULL);

If another thread calls imxdma_prep_dma_memcpy() concurrently, it locklessly
inspects ld_free. If ld_free was empty, it might immediately pick up this
newly freed descriptor and overwrite its fields (desc->desc.callback =3D NU=
LL)
before imxdma_tasklet() invokes the callback.

Does this need to hold the descriptor off the free list until after the
callback completes?

[ ... ]

> @@ -1142,7 +1142,7 @@ static int __init imxdma_probe(struct platform_devi=
ce *pdev)
>  		INIT_LIST_HEAD(&imxdmac->ld_free);
>  		INIT_LIST_HEAD(&imxdmac->ld_active);
> =20
> -		tasklet_setup(&imxdmac->dma_tasklet, imxdma_tasklet);
> +		dmaengine_init_bh(&imxdmac->chan, imxdma_tasklet);
>  		imxdmac->chan.device =3D &imxdma->dma_device;
>  		dma_cookie_init(&imxdmac->chan);
>  		imxdmac->channel =3D i;

[Severity: High]
This is a pre-existing issue, but does the interrupt handler get registered
too early in imxdma_probe()?

For IMX1 DMA, devm_request_irq() is called before the interrupt mask regist=
er
(DMA_DIMR) is disabled and before channel list heads like ld_active are
initialized.

If an interrupt is pending or asserts immediately, dma_irq_handler() runs
and calls dma_irq_handle_channel(). This evaluates list_empty() on
uninitialized memory, incorrectly returning false, and then dereferences an
invalid pointer from list_first_entry(), causing a crash.

Should the IRQ registration be moved after the hardware masking and list
initializations?

[ ... ]

> @@ -1211,7 +1211,7 @@ static void imxdma_free_irq(struct platform_device =
*pdev, struct imxdma_engine *
>  		if (!is_imx1_dma(imxdma))
>  			disable_irq(imxdmac->irq);
> =20
> -		tasklet_kill(&imxdmac->dma_tasklet);
> +		dmaengine_kill_bh(&imxdmac->chan);
>  	}
>  }

[Severity: High]
This isn't a bug introduced by this patch, but could this lead to a
use-after-free with the watchdog timer?

In imxdma_free_irq(), the dmaengine BH is killed, but the imxdmac->watchdog
timer is never safely canceled. When devm frees the imxdma structure, a
still-active timer could fire, executing imxdma_watchdog(). This would
dereference freed memory to call dmaengine_schedule_bh().

Similarly in imxdma_probe(), if devm_request_irq() fails for a later channe=
l,
the error path jumps to disable_dma_ahb_clk and omits timer cleanup for
already initialized channels.

Does this require timer_shutdown_sync() during teardown and error paths?

[Severity: High]
This isn't a bug introduced by this patch, but could descriptors be freed
while the bottom-half work is still running?

When a channel is released, imxdma_free_chan_resources() iterates through
ld_free and frees the descriptors with kfree(). However, the driver does
not implement device_synchronize, and imxdma_free_chan_resources() does
not flush pending bottom-half work.

If imxdma_tasklet() is executing concurrently, imxdma_free_chan_resources()
could acquire the lock, splice the lists, and free the descriptor just as
the tasklet drops the spinlock to invoke the callback. The bottom-half
would then dereference the freed desc->desc to invoke the callback.

Does imxdma_free_chan_resources() need to flush pending BH work before
freeing descriptors?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786384168.gi=
t.allen.lkml@gmail.com?part=3D8
