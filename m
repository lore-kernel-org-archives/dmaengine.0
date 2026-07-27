Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23EF3446C5
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785185838; cv=none; b=KY5NZIIMDWJXrcIP0N1pscx5UtC04WcIvlBe02l7oiKpbBzdfh1gv0rUM671FJpcHVn+tvZ6MoQUNO6xoDri6HNAL06UglBZBL6GFE06A8V048XIarpi5IuGwaSA46XFFNoYaG3nHm3sFEq4fzfk96aX/rcaCQIcCZs6Hyan6Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785185838; c=relaxed/simple;
	bh=BZRcjz3RoJ3ZMgZa9sJHTLSOC8cwGHcZKNV+vk9e2ZM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=O1hRqPWjRUy1FwGD8iBK4T4D33nsotJno/KbvtQv1vMuKiEEOTKWhZFhU0sE/5mPJajeVJxytPAyG3MdwDuuY+seeyFmPBTHDiXKFJ1dudWHjZuu6n35G2qt5IvXd2b9iZ+pT7anN0eUnbzR3YIVx6Z+qxRmdUcNhYEQgdGQvTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DZgc2tLm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DZgc2tLm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5990B1F000E9;
	Mon, 27 Jul 2026 20:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785185836;
	bh=VPJDUFxM4pwkymVbtjdlUeZyf9lu4W4tJbYbhjsLFEQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DZgc2tLmAmYh3MMjXm6BEpZU3Cs+cOUUSSG1i2CLZyMYlZ7WfGxmr3QJQY2DsaCJY
	 HZK7LGoxZEDM8/bKHoqyq4kA52dntO3TK5L7xRJDWE/jufmfIC6cIwMwUkKOMcG4Ha
	 Rv5IKFKDEWGnMolCs2wPbAmjBDVpek8+s18OX9T1WGxhSA0dBRrA4un56iwxejGMai
	 7GTk7VjqsJd7t649LnmknKTcD5SH4DhhTrxeyq7M9iZW8p1xwEJcAHrFwmm8lLpfHv
	 JWXRp+uIgllE8PMoDDcKSTd+iT3QiMMAOM53dCgQuOl1CblOqxJITyV1MZ97wnuJXU
	 ZCCel5vQEogAw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 15/64] dmaengine: pch_dma: convert tasklet to
 dma_chan BH
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <e1688959517cfa8b6bc1adcf272d0ea3c73751c2.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <e1688959517cfa8b6bc1adcf272d0ea3c73751c2.1785183549.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 20:57:15 +0000
Message-Id: <20260727205716.5990B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing cleanup of scheduled BH work on the probe error path can l=
ead to a use-after-free.
- [High] Early registration of a shared IRQ before channel count setup lead=
s to an unhandled IRQ storm.
- [High] Client completion callbacks are invoked with the channel spinlock =
held, leading to a potential self-deadlock.
- [High] Process-context functions acquire the channel spinlock without dis=
abling softirqs, risking a deadlock if preempted by the BH work.
- [High] Checking hardware idle state outside the lock causes a TOCTOU race=
 leading to premature completion and use-after-free.
--

--- Patch [15]: [PATCH v2 15/64] dmaengine: pch_dma: convert tasklet to dma=
_chan BH ---
commit a2ed59e859fb44b7074fd4693b53c278ebc94f3d
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: pch_dma: convert tasklet to dma_chan BH
   =20
Replace the per-channel tasklet with the shared dma_chan BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

> diff --git a/drivers/dma/pch_dma.c b/drivers/dma/pch_dma.c
> index bf805f1024f64..b0044bea8fe4c 100644
> --- a/drivers/dma/pch_dma.c
> +++ b/drivers/dma/pch_dma.c

[ ... ]

> @@ -665,9 +664,10 @@ static int pd_device_terminate_all(struct dma_chan *=
chan)
>  	return 0;
>  }
> =20
> -static void pdc_tasklet(struct tasklet_struct *t)
> +static void pdc_tasklet(struct dma_chan *c)
>  {
> -	struct pch_dma_chan *pd_chan =3D from_tasklet(pd_chan, t, tasklet);
> +	struct pch_dma_chan *pd_chan =3D container_of(c, struct pch_dma_chan,
> +						    chan);
>  	unsigned long flags;
> =20
>  	if (!pdc_is_idle(pd_chan)) {

[Severity: High]
This isn't a bug introduced by this patch, but might checking the hardware
idle state outside the lock cause a race condition?

If a concurrent pd_issue_pending() acquires the lock first and starts the
next request, could the preempted thread later acquire the lock, see a stale
idle state, and improperly complete the newly started descriptor?

This same check appears unprotected in pd_issue_pending():

drivers/dma/pch_dma.c:pd_issue_pending() {
    ...
    if (pdc_is_idle(pd_chan)) {
    ...
}

[Severity: High]
This is a pre-existing issue, but would acquiring the channel lock with a
plain spin_lock() in process-context functions risk a deadlock?

If a hardware interrupt preempts process context here in pd_tx_submit() or
pd_issue_pending():

drivers/dma/pch_dma.c:pd_tx_submit() {
    ...
    spin_lock(&pd_chan->lock);
    ...
}

and schedules this pdc_tasklet() work which attempts to acquire the exact
same lock using spin_lock_irqsave(), might this deadlock the CPU?

[Severity: High]
This is a pre-existing issue, but is there a risk of a self-deadlock if the
client callback submits a new DMA transaction?

If pdc_tasklet() acquires the lock, and then pdc_chain_complete() invokes
the callback:

drivers/dma/pch_dma.c:pdc_chain_complete() {
    ...
    if (callback)
        callback(param);
    ...
}

and that callback attempts to submit a new transaction via pd_tx_submit(),
it will attempt to acquire the same pd_chan->lock.

[ ... ]

> @@ -877,7 +877,7 @@ static int pch_dma_probe(struct pci_dev *pdev,
>  		INIT_LIST_HEAD(&pd_chan->queue);
>  		INIT_LIST_HEAD(&pd_chan->free_list);
> =20
> -		tasklet_setup(&pd_chan->tasklet, pdc_tasklet);
> +		dma_chan_init_bh(&pd_chan->chan, pdc_tasklet);
>  		list_add_tail(&pd_chan->chan.device_node, &pd->dma.channels);
>  	}

[Severity: High]
This isn't a bug introduced by this patch, but can requesting the shared
IRQ before dma_async_device_register() initializes the channel count lead
to an unhandled IRQ storm?

In pch_dma_probe(), request_irq() is called with IRQF_SHARED before the
channel count is initialized.

The interrupt handler relies entirely on pd->dma.chancnt:

drivers/dma/pch_dma.c:pd_irq() {
    ...
    for (i =3D 0; i < pd->dma.chancnt; i++) {
    ...
}

If pd->dma.chancnt is initially 0, could it loop 0 times and return
IRQ_NONE without clearing the hardware interrupt status?

[Severity: High]
This is a pre-existing issue, but does the probe error path fail to kill
the scheduled bottom-half work before freeing the device structure?

If dma_async_device_register() fails, the error path frees the memory but
appears to skip cancelling pending BH works:

drivers/dma/pch_dma.c:pch_dma_probe() {
    ...
err_free_pool:
    dma_pool_destroy(pd->pool);
err_free_irq:
    free_irq(pdev->irq, pd);
    ...
}

If an interrupt fires and schedules the BH work during this window, could
it execute on freed memory?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785183549.gi=
t.allen.lkml@gmail.com?part=3D15
