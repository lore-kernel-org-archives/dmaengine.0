Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F04436BFB
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786386910; cv=none; b=toxDaifyB+ICnDEcXxiT5eOBebCWg7mEoL3q+AvH5empQP2lZKrY5JNWCW4ogx2hOT66z+1grQJlDqbqxMgQc0V3vy8iL9MmQwYfSOMG0Pyb5/JN+z7pmppUJMYxrfqZSBeqolZjCv8TqNpZCTalnP+bNY9xabv35XdPfsfsU2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786386910; c=relaxed/simple;
	bh=WH8OzmlZnMpDvZ+bmBv4oQgST4+z7Tn4APykpOYoh4c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dGRh7mc0nIQvHkqbmm3hkhlnFNfUdkBDU3rMneakOWBizBbVanZ9HndUSs+KLmcaIe3J1diLBWomZfriONKHLu/ilImqbBs2ZZLP88DPJ5MfAS1hFdZYHWnNDW935g9hDlqXYib6dDftrbnVd3mYGx5IAO06qy/1bIOzZUQv4Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F7zEqFBV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F7zEqFBV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 520761F000E9;
	Mon, 10 Aug 2026 18:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786386909;
	bh=vZDXtqt5H8joWD4V2qIqvycc/4q4UfihOjtWUfKyrIQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F7zEqFBV/AHdcjn/TTdOTKDZeXmWobdFhe+TYrr5rR7SLWdYjnmxz8cMM7uqKZUg/
	 COpndGu2movDC4oi757cDNt7fvnn/2zyPjT6TLVtEJgJq47wbtScvMiAtyJa29Gf/t
	 YIyziUS4vcJAkwQFZaCQTLK44dpQPBlGPdmAn5syFC8syFo5EsVP/AqvNydJwBzH/e
	 gxjqhmc5OuUBH1pOfC5CXmXccbdqaQsNqkgiKONsk4MJUhDAPSxi00kj0/YQsZTSGm
	 rhPjRRRHYKugE+5H5EtJgV3itkiJ6u9vv5qzW4kcJDvZ4qXW/vP7K/GpHZkXw+BE/X
	 BsglhPqxwtgKA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 18/34] dmaengine: xgene-dma: wire descriptor cleanup
 to dmaengine BH
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <29f97cc894a9c6fcd4aa1f2981850476a963db52.1786384169.git.allen.lkml@gmail.com>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <29f97cc894a9c6fcd4aa1f2981850476a963db52.1786384169.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 18:35:06 +0000
Message-Id: <20260810183508.520761F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Interrupts are requested and hardware interrupts unmasked before t=
he DMA engine BH is initialized, exposing a race condition.
- [High] Potential self-deadlock in `xgene_dma_free_chan_resources` due to =
calling `xgene_dma_cleanup_descriptors` without disabling softirqs.
- [High] Use-after-free memory corruption in the error handling paths of `x=
gene_dma_prep_xor` and `xgene_dma_prep_pq`.
- [High] Failure to mask interrupts and disable hardware before calling `dm=
aengine_kill_bh()` in the probe error path leaves a race window where an in=
terrupt can reschedule the BH, leading to a Use-After-Free.
- [High] The teardown sequence in `xgene_dma_remove` frees the device IRQs =
before killing the DMA engine BH, potentially causing `enable_irq()` to be =
called on a freed IRQ.
--

--- Patch [18]: [PATCH v3 18/34] dmaengine: xgene-dma: wire descriptor clea=
nup to dmaengine BH ---
commit cdb570000a04c682157da4771610c096505551ac
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: xgene-dma: wire descriptor cleanup to dmaengine BH
   =20
Replace the per-channel tasklet with the shared dmaengine BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

> diff --git a/drivers/dma/xgene-dma.c b/drivers/dma/xgene-dma.c
> index f64624ea44add..e1199863a8246 100644
> --- a/drivers/dma/xgene-dma.c
> +++ b/drivers/dma/xgene-dma.c

[ ... ]

> @@ -976,9 +974,10 @@ static enum dma_status xgene_dma_tx_status(struct dm=
a_chan *dchan,
>  	return dma_cookie_status(dchan, cookie, txstate);
>  }
> =20
> -static void xgene_dma_tasklet_cb(struct tasklet_struct *t)
> +static void xgene_dma_tasklet_cb(struct dma_chan *c)
>  {
> -	struct xgene_dma_chan *chan =3D from_tasklet(chan, t, tasklet);
> +	struct xgene_dma_chan *chan =3D container_of(c, struct xgene_dma_chan,
> +						   dma_chan);
> =20
>  	/* Run all cleanup for descriptors which have been completed */
>  	xgene_dma_cleanup_descriptors(chan);

[Severity: High]
This isn't a bug introduced by this patch, but can this lead to a
self-deadlock?

Looking at xgene_dma_free_chan_resources(), it calls=20
xgene_dma_cleanup_descriptors() directly from process context, which=20
acquires chan->lock without disabling softirqs:

xgene_dma_free_chan_resources()
  xgene_dma_cleanup_descriptors(chan)
    spin_lock(&chan->lock);

If a DMA hardware interrupt arrives on the same CPU while this lock is held,
the ISR will schedule the BH.=20

When returning from the hardware interrupt, irq_exit() will process softirqs
and attempt to acquire the same chan->lock, deadlocking against the
interrupted process context.

[ ... ]

> @@ -1540,7 +1539,7 @@ static int xgene_dma_async_register(struct xgene_dm=
a *pdma, int id)
>  	INIT_LIST_HEAD(&chan->ld_pending);
>  	INIT_LIST_HEAD(&chan->ld_running);
>  	INIT_LIST_HEAD(&chan->ld_completed);
> -	tasklet_setup(&chan->tasklet, xgene_dma_tasklet_cb);
> +	dmaengine_init_bh(&chan->dma_chan, xgene_dma_tasklet_cb);

[Severity: High]
This isn't a bug introduced by this patch, but is there a race condition
during probe where the BH is scheduled before initialization?

In xgene_dma_probe(), interrupts are requested and hardware interrupts are
unmasked before xgene_dma_init_async() is called to initialize the BH:

xgene_dma_probe()
  ret =3D xgene_dma_request_irqs(pdma);
  ...
  xgene_dma_init_hw(pdma);
  ...
  ret =3D xgene_dma_init_async(pdma);

If a pending interrupt fires in this window, the ISR will call
dmaengine_schedule_bh() on an uninitialized BH.

This triggers a WARN_ON and fails to queue the BH. Because the ISR disables
the IRQ and relies on the BH to re-enable it, the interrupt line will remain
permanently disabled.

>  	chan->pending =3D 0;
>  	chan->desc_pool =3D NULL;

[ ... ]

> @@ -1580,7 +1579,7 @@ static int xgene_dma_init_async(struct xgene_dma *p=
dma)
>  		if (ret) {
>  			for (j =3D 0; j < i; j++) {
>  				dma_async_device_unregister(&pdma->dma_dev[j]);
> -				tasklet_kill(&pdma->chan[j].tasklet);
> +				dmaengine_kill_bh(&pdma->chan[j].dma_chan);

[Severity: High]
This isn't a bug introduced by this patch, but does this error path leave
a race window that could result in a use-after-free?

During driver probe, xgene_dma_init_hw() unmasks hardware interrupts. If a
subsequent channel registration fails here, dmaengine_kill_bh() is called,
but hardware interrupts are not masked.

An incoming interrupt could fire immediately after dmaengine_kill_bh(),
causing the ISR to re-queue the BH.

When the probe function then returns an error, the device data structures
are freed via devres. When the workqueue subsequently executes the re-queued
BH, it will operate on freed memory.

>  			}
> =20
>  			return ret;

[ ... ]

> @@ -1791,7 +1790,7 @@ static void xgene_dma_remove(struct platform_device=
 *pdev)
> =20
>  	for (i =3D 0; i < XGENE_DMA_MAX_CHANNEL; i++) {
>  		chan =3D &pdma->chan[i];
> -		tasklet_kill(&chan->tasklet);
> +		dmaengine_kill_bh(&chan->dma_chan);

[Severity: High]
This isn't a bug introduced by this patch, but is the teardown ordering
correct here?

In xgene_dma_remove(), xgene_dma_free_irqs() is called to free the interrupt
handlers before the loop that flushes the BH work with dmaengine_kill_bh().

If a BH is currently pending, dmaengine_kill_bh() will wait for it to
execute. The BH handler xgene_dma_tasklet_cb() unconditionally calls
enable_irq(chan->rx_irq).

Because the IRQ has already been freed, calling enable_irq() operates on a
torn-down IRQ.

>  		xgene_dma_delete_chan_rings(chan);
>  	}

[Severity: High]
This isn't a bug introduced by this patch, but is there a use-after-free
in the error handling path of xgene_dma_prep_xor() and xgene_dma_prep_pq()?

If descriptor allocation fails during a multi-descriptor transaction, the
driver jumps to the fail label and passes the embedded list head of the
first descriptor to the cleanup function:

xgene_dma_prep_xor()
fail:
    if (!first)
        return NULL;
    xgene_dma_free_desc_list(chan, &first->tx_list);

xgene_dma_free_desc_list() uses list_for_each_entry_safe() to iterate and
free elements. On the first iteration, the first descriptor is freed.

However, list_for_each_entry_safe() evaluates the loop increment step at the
end of the iteration, which accesses head->next. Since head is
&first->tx_list, this reads from the freed first descriptor memory.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786384168.gi=
t.allen.lkml@gmail.com?part=3D18
