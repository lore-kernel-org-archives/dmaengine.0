Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90796242D65
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786386441; cv=none; b=N0GpUn0ocGg2NaxQ2Js8qdzhkkoLOM42sl/Jx3hCpaxlZLeYzDoRJPUDDKJsic8lR+9UfTxsK4LAaJsWyNgLx5zex74WP2JNtUeRfsXJNhE7he6KNy+XZEDzLgzVsjiuEEaoLS1ELQVPPzjeqEwVHebpB7P8dar7+nH/hvezSuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786386441; c=relaxed/simple;
	bh=ADNq/sviJf4Jo2IdARuHGpyl8Ihqppm26RMI0JrgfSM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=p7aHf50/1KAGPt6/yoJqkLM3ryaUOYtU8kAHERt4d5c4uiKhP4QsESkKBIsunLs0FZdSUgBCFZRESSdp/CuKvRIaE6q1KtPz4lzyvt03uNxPIE26ZZAuZJPwcXdcgGsijW4U3XNXPYVC7LCVVhpoyhfT4GqOk32prsYVkPpUiQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JPvv/2/h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JPvv/2/h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8EE31F000E9;
	Mon, 10 Aug 2026 18:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786386440;
	bh=eb6pgsvgBCu8vh5CIaANtuJH58QfqYby4csD/Qfg2eg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JPvv/2/hjZl8zmwGkzsXKdT0Z6cU53dS9G/BqJ90eYGbBiWbctq2R1zid8u1MAT+/
	 1MmPz6uMiYuyV163XLWnJ1HyYFlqd67Yc2xgrhOmNorVV5AQtz236XXMXmr2TkcqJp
	 09jhW/KZAil8wE24pFYpDfBGwXGtJNCgq7Jvz60vwpHRKXN185tDsFueLvmOI4tlnj
	 dzjPAkEA+qcK4EF9MXirynm0YX446h1lPCgGUReBiUJ65RcxojsHhwZz4xEvs6gXg6
	 FM2M1iAsrxyS0hT5zJIjsjxAVJlrQ+Gp9X49z8j0EQAYXGaqQNAAnR7VZJD6VpsUlQ
	 984qeMbDhyXng==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 07/34] dmaengine: fsl_raid: run completions via
 dmaengine BH
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <5619f788f9ce69629aaa113d882ad3ec91dfd0be.1786384168.git.allen.lkml@gmail.com>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <5619f788f9ce69629aaa113d882ad3ec91dfd0be.1786384168.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 18:27:19 +0000
Message-Id: <20260810182719.D8EE31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver requests an IRQ using `request_irq()` but never frees i=
t on module unload or error paths, leading to a resource leak and potential=
 Use-After-Free.
- [High] The IRQ handler is registered before the channel's critical state =
(locks, lists, and driver private data) is initialized, creating a race win=
dow for early interrupts.
- [High] Probe error handling in `fsl_re_probe()` ignores failures from `fs=
l_re_chan_probe()`, leaving partial state that causes NULL pointer derefere=
nces and double-frees during device removal.
- [High] Channels are torn down and their memory pools freed before the DMA=
 device is unregistered, creating a race window for use-after-free.
- [High] The RAID hardware engine is not explicitly stopped during channel =
removal, resulting in DMA continuing into freed memory.
- [High] The driver holds the internal channel spinlock (`desc_lock`) while=
 synchronously invoking the client's DMA completion callback, leading to a =
potential AA deadlock.
--

--- Patch [7]: [PATCH v3 07/34] dmaengine: fsl_raid: run completions via dm=
aengine BH ---
commit 12282b5227658b803a18693207b1136ab132efae
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: fsl_raid: run completions via dmaengine BH
   =20
Replace the per-channel tasklet with the shared dmaengine BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

> diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
> index 99945845d8b5e..0d0403945d91a 100644
> --- a/drivers/dma/fsl_raid.c
> +++ b/drivers/dma/fsl_raid.c
> @@ -155,9 +155,10 @@ static void fsl_re_cleanup_descs(struct fsl_re_chan =
*re_chan)
>  	fsl_re_issue_pending(&re_chan->chan);
>  }
> =20
> -static void fsl_re_dequeue(struct tasklet_struct *t)
> +static void fsl_re_dequeue(struct dma_chan *chan)
>  {
> -	struct fsl_re_chan *re_chan =3D from_tasklet(re_chan, t, irqtask);
> +	struct fsl_re_chan *re_chan =3D container_of(chan, struct fsl_re_chan,
> +						   chan);

[Severity: High]
This isn't a bug introduced by this patch, but I spotted a potential
deadlock in the completion path.

When fsl_re_dequeue() is running, it acquires the channel's desc_lock:

fsl_re_dequeue() {
    ...
    spin_lock_irqsave(&re_chan->desc_lock, flags);
    ...
    if (found) {
        fsl_re_desc_done(desc);
    ...

It then calls fsl_re_desc_done(desc), which invokes the client callback.

If the client calls dma_async_issue_pending() from within that callback,
fsl_re_issue_pending() will try to acquire the exact same spinlock:

fsl_re_issue_pending() {
    ...
    spin_lock_irqsave(&re_chan->desc_lock, flags);
    ...
}

Could this sequence trigger an AA deadlock?

[ ... ]
> @@ -670,7 +671,7 @@ static int fsl_re_chan_probe(struct platform_device *=
ofdev,
>  	snprintf(chan->name, sizeof(chan->name), "re_jr%02d", q);
> =20
>  	chandev =3D &chan_ofdev->dev;
> -	tasklet_setup(&chan->irqtask, fsl_re_dequeue);
> +	dmaengine_init_bh(&chan->chan, fsl_re_dequeue);
> =20
>  	ret =3D request_irq(chan->irq, fsl_re_isr, 0, chan->name, chandev);
>  	if (ret) {

[Severity: High]
This is a pre-existing issue, but I noticed the driver requests an IRQ
using request_irq(), but it appears there's no matching free_irq() call
on the module unload or error paths.

If the module is unbound, will the IRQ handler remain registered and
potentially dereference a freed chan pointer when it fires?

[Severity: High]
This is also a pre-existing issue, but I noticed the IRQ handler is
registered here before the channel's critical state (locks, lists, and
driver private data) is fully initialized.

If an interrupt fires immediately after request_irq() completes:

fsl_re_isr() {
    re_chan =3D dev_get_drvdata((struct device *)data);
    irqstate =3D in_be32(&re_chan->jrregs->jr_interrupt_status);
}

Could this result in a NULL pointer dereference since dev_set_drvdata()
hasn't been called yet?

[ ... ]
> @@ -846,7 +847,7 @@ static int fsl_re_probe(struct platform_device *ofdev)
> =20
>  static void fsl_re_remove_chan(struct fsl_re_chan *chan)
>  {
> -	tasklet_kill(&chan->irqtask);
> +	dmaengine_kill_bh(&chan->chan);
> =20
>  	dma_pool_free(chan->re_dev->hw_desc_pool, chan->inb_ring_virt_addr,
>  		      chan->inb_phys_addr);

[Severity: High]
This is a pre-existing issue, but fsl_re_remove_chan() frees the hardware
descriptor rings without explicitly stopping the RAID hardware engine first.

Is there a risk that the hardware continues executing pending transactions
into memory that has already been returned to the pool, potentially causing
memory corruption?

Should we write a disable command to the jr_command register before freeing
the rings?

[Severity: High]
Another pre-existing issue, but fsl_re_probe() doesn't check the return
value of fsl_re_chan_probe():

fsl_re_probe() {
    ...
    fsl_re_chan_probe(ofdev, child, ridx++, off);
    re_priv->total_chans++;
    ...
}

If fsl_re_chan_probe() fails, the channel state remains partially
initialized. During module removal, fsl_re_remove() iterates up to
total_chans:

fsl_re_remove() {
    ...
    for (i =3D 0; i < re_priv->total_chans; i++)
        fsl_re_remove_chan(re_priv->re_jrs[i]);
    ...
}

Could this lead to double-frees or NULL pointer dereferences when
fsl_re_remove_chan() operates on these failed channels?

[Severity: High]
Finally, this is a pre-existing issue, but I noticed channels are completely
torn down before the DMA device is unregistered in fsl_re_remove():

fsl_re_remove() {
    ...
    for (i =3D 0; i < re_priv->total_chans; i++)
        fsl_re_remove_chan(re_priv->re_jrs[i]);

    dma_async_device_unregister(&re_priv->dma_dev);
    ...
}

Could the dmaengine core or clients still attempt to submit transfers to
channels that are actively being destroyed? Should
dma_async_device_unregister() happen before the resources are torn down?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786384168.gi=
t.allen.lkml@gmail.com?part=3D7
