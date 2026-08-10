Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30BC43634F
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786386887; cv=none; b=Y0V8/4zP0MqgyqELk21Lg7BDMtOvCEqYzHJM6etBn6EpSAShz+aPxxnOx853HujQD3tfnxcwFeE3M9fwnRXd6QyXDtApoD3c43ThYNkHG6rXLFRnqEprspEMhBCp6LoXQ6fPseaNUHWUITabv7Nz7i+zaCtZCk9pxbP6Ewl6Yg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786386887; c=relaxed/simple;
	bh=aUmJGxWMH9sxmzH85kQ8HvxmTTQPXatiiSgw3Adj6xE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Z8mVfWCUhpV069772ySKevHZqYReoJ8jk2YqErEzovKsxv49+1gOOf+UJxM14qd6P96slgqyJd1sMoPwIbjBsApzCvrECFR4XucdDZKW5DO59jbYXatATHypCs21TflkSnwTxENKUP5E8xb/oeEMZcT25uDVvXAd5DyARl7Yy/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kvpb4Gdn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kvpb4Gdn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9820A1F00A3A;
	Mon, 10 Aug 2026 18:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786386885;
	bh=KS6ytKnqqPDbAT4Ockr152E0EhRbdxlwnmGeqpCe1uw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Kvpb4GdnFsV6VqIwMJewXNYD2gFkiaWbtGuWxi3Sba3cRn1QnfYFL2ZqZKSnoDs2t
	 iaSREvEBNGRq2XCC23vZd7XWKL4+0uvSrVCGrl0eYfiXNvH2qVuSGobgfzkXcAB6LE
	 hT0O2LC/XSRZPKJq/i3R4zpYO5Z1SEMlzD6+t2fdmQLr6xedic6vyLJSNeulDph8Ai
	 dBsuB9Xx03yS9j478yO4UqWtK3W4X1c+t1nEpKvGexwGOiu7cuJuThJcL5BVI0gM4Y
	 WeoQw1wv0BvQATluV2fU4mJyIHzQHAVn9oLQTFcwsJOo9PkiMcTmO9eA73FW7hUUcP
	 hNbC5aTq4WaPQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 15/34] dmaengine: pch_dma: convert tasklet to
 dmaengine BH
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <920e972b55af0bcebe09383f5f00cf5dc75e5cf6.1786384168.git.allen.lkml@gmail.com>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <920e972b55af0bcebe09383f5f00cf5dc75e5cf6.1786384168.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 18:34:45 +0000
Message-Id: <20260810183445.9820A1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing cancellation of scheduled BH work in the probe error path =
leads to a Use-After-Free.
- [High] The driver invokes the DMA client's callback with the channel spin=
lock held, causing a deadlock if the client queues a new transfer.
- [High] Missing softirq protection on process-context locks causes deadloc=
ks when preempted by the softirq-context BH.
- [High] Using `spin_lock_irq` unconditionally re-enables interrupts, which=
 causes IRQ state corruption if called from atomic context.
- [High] The driver requests a shared IRQ before the channel count is initi=
alized and without masking hardware interrupts, causing a potential IRQ sto=
rm.
--

--- Patch [15]: [PATCH v3 15/34] dmaengine: pch_dma: convert tasklet to dma=
engine BH ---
commit 7e489ac0179032bce9c722d41def47b8d30c50c9
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: pch_dma: convert tasklet to dmaengine BH
   =20
Replace the per-channel tasklet with the shared dmaengine BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

> diff --git a/drivers/dma/pch_dma.c b/drivers/dma/pch_dma.c
> index bf805f1024f64..eb372aa328a62 100644
> --- a/drivers/dma/pch_dma.c
> +++ b/drivers/dma/pch_dma.c

[ ... ]

> @@ -665,9 +664,10 @@ static int pd_device_terminate_all(struct dma_chan *=
chan)
>  	return 0;
>  }

[Severity: High]
This is a pre-existing issue, but does pd_device_terminate_all() corrupt the
caller's interrupt state?

If a DMA client calls dmaengine_terminate_all() from an atomic or
interrupt context, pd_device_terminate_all() executes:

pd_device_terminate_all() {
        spin_lock_irq(&pd_chan->lock);
        ...
        spin_unlock_irq(&pd_chan->lock);
}

Since spin_unlock_irq() unconditionally re-enables interrupts, could this
cause unexpected nested interrupts if the caller had already disabled them?

> -static void pdc_tasklet(struct tasklet_struct *t)
> +static void pdc_tasklet(struct dma_chan *c)
>  {
> -	struct pch_dma_chan *pd_chan =3D from_tasklet(pd_chan, t, tasklet);
> +	struct pch_dma_chan *pd_chan =3D container_of(c, struct pch_dma_chan,
> +						    chan);
>  	unsigned long flags;

[Severity: High]
This isn't a bug introduced by this patch, but can the BH handler deadlock
against new transfer submissions?

When the softirq executes pdc_tasklet(), it acquires pd_chan->lock using
spin_lock_irqsave(). It can then call pdc_chain_complete(), which invokes
the client's completion callback synchronously while still holding the lock:

pdc_chain_complete() {
        ...
        dmaengine_desc_callback_invoke(&cb, NULL);
}

If the client attempts to schedule a new DMA transaction during this callba=
ck,
it calls pd_tx_submit(), which tries to acquire the exact same lock:

pd_tx_submit() {
        spin_lock(&pd_chan->lock);
}

Could this sequence result in an immediate self-deadlock?

[Severity: High]
This is also a pre-existing issue, but is there a missing softirq protection
on process-context locks?

If a DMA client calls pd_tx_submit() or pd_issue_pending() from process
context, they acquire the lock without disabling softirqs:

pd_tx_submit() {
        spin_lock(&pd_chan->lock);
}

If a softirq interrupts the CPU before the lock is released, and pdc_taskle=
t()
executes, it will try to acquire the same lock using spin_lock_irqsave().

Will this cause the softirq to spin forever waiting for the preempted proce=
ss
to release the lock?

[ ... ]

> @@ -877,7 +877,7 @@ static int pch_dma_probe(struct pci_dev *pdev,
>  		INIT_LIST_HEAD(&pd_chan->queue);
>  		INIT_LIST_HEAD(&pd_chan->free_list);
> =20
> -		tasklet_setup(&pd_chan->tasklet, pdc_tasklet);
> +		dmaengine_init_bh(&pd_chan->chan, pdc_tasklet);
>  		list_add_tail(&pd_chan->chan.device_node, &pd->dma.channels);
>  	}

[Severity: High]
This isn't a bug introduced by this patch, but does the probe sequence
risk an unhandled IRQ storm?

In pch_dma_probe(), the shared IRQ is requested before the channel count is
initialized by dma_async_device_register():

pch_dma_probe() {
        ...
        err =3D request_irq(pdev->irq, pd_irq, IRQF_SHARED, DRV_NAME, pd);
        ...
        err =3D dma_async_device_register(&pd->dma);
}

If the hardware has a pending interrupt and fires immediately, pd_irq()
will execute while pd->dma.chancnt is still 0.

pd_irq() {
        for (i =3D 0; i < pd->dma.chancnt; i++) { ... }
        ...
        if (ret0)
                dma_writel(pd, STS0, sts0);
}

Because chancnt is 0, the loop is skipped, hardware status is not cleared,
and IRQ_NONE is returned. Could this cause the kernel's spurious interrupt
detector to permanently disable the shared IRQ line?

[Severity: High]
This is a pre-existing issue, but does the probe error path leave un-cancel=
led
BH work?

If dma_async_device_register() fails after the IRQ has been requested and
the BH has been initialized, the probe error path executes:

pch_dma_probe() {
...
err_free_pool:
        dma_pool_destroy(pd->pool);
err_free_irq:
        free_irq(pdev->irq, pd);
err_iounmap:
        pci_iounmap(pdev, pd->membase);
err_free_res:
        pci_release_regions(pdev);
err_disable_pdev:
        pci_disable_device(pdev);
err_free_mem:
        kfree(pd);
}

If a spurious interrupt fired and called dmaengine_schedule_bh() before
free_irq() is called, this error path frees the pd memory without calling
dmaengine_kill_bh(). Could the scheduled BH execute later and access the
freed pd_chan structure, resulting in a use-after-free?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786384168.gi=
t.allen.lkml@gmail.com?part=3D15
