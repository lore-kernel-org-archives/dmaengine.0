Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6A14C6D
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786387173; cv=none; b=ChWPGJ5+g+6rOol8dXf6fkpSTSLhAu2nZq8gM2FjTAJMVQ8BLmK4chvEJsAj5qMeO/fnVU3Ge799+K1WOn5+Th0P81yzS4koFsRh0Nrtb+UT56PmPWDUtT1RkZ3AoFn+8xUXVdxNfnbWvXA70ZsF9HVlO+PumTrJ8RdBztKX8aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786387173; c=relaxed/simple;
	bh=hhnx9BA60DGKeoZ/ug7p2IMrS32IWHnHMU+WL9XyLIw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=q9E6Tyu/qvppgmKorWYT20wn9YRH0YqPgM1Yo42rPnHaODFaN9STvgjBGy39meP+LXnxOCKsF8W1bUCBLcgKsRSSYJhS0xK2g3tvwc8v15THhkoX8KftdFYF6pboUxHeRQdpmq/XODZWzM6IcHAa3sRICM8F/H5RLW01Ji7x3ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q3uRTBs0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q3uRTBs0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A07C1F00A3A;
	Mon, 10 Aug 2026 18:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786387172;
	bh=jc+G0Ze1tH1btc7SR19jImJZOmW1C9rhqS3/VEIUUzs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q3uRTBs0L7AmaeS5EkIDm+oK2ZvzjIfbtDytYDRDOtKdXu3gB3T+nuE7B8EQkGZ19
	 B3tXsKvoOLnbZ9Yhf52yfsJXvKVU4gHvq1+SGq4+UpAtP0dRraeIxtajHDcvOWPQZw
	 8JFTa0bwYujolpiImZFKyiRuGH1p9N+f82Vcfki3oKOwAYaZ7JSRziW+iVpd85KvMn
	 HHvkfDv61GrzhiyxsvmGkZfaP37voZ6SYaECgYCuPS7uTFlAHLjrPxc3AAJG/gQX8r
	 GpqCqmOMtQEY5bdiKlgmL+RtpJBnfbG8PKGkLCVGCszNEuBunyFWO6tHSjL+UTNCZ+
	 /nhlF4S0T7ZsA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 27/34] dmaengine: plx_dma: use channel BH helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <9b931c21648cdee0e5db08642861b532b6b040d5.1786384169.git.allen.lkml@gmail.com>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <9b931c21648cdee0e5db08642861b532b6b040d5.1786384169.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 18:39:31 +0000
Message-Id: <20260810183932.3A07C1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] plx_dma_process_desc() fails to disable bottom halves when acquiri=
ng ring_lock, leading to a spinlock deadlock if preempted by a softirq.
- [High] plx_dma_process_desc() and plx_dma_abort_desc() invoke client comp=
letion callbacks while holding the driver's ring_lock, causing a recursive =
deadlock if the client submits a new transaction.
- [High] Race condition in plx_dma_create() where request_irq() is called b=
efore plxdev->bar is initialized, leading to a potential NULL pointer deref=
erence.
--

--- Patch [27]: [PATCH v3 27/34] dmaengine: plx_dma: use channel BH helpers=
 ---
commit 3f31218d1705896b2087c850d94c4632503584c8
Author: Allen Pais <allen.lkml@gmail.com>
Date:   Mon Aug 10 18:09:28 2026 +0000

    dmaengine: plx_dma: use channel BH helpers
   =20
    Replace the device tasklet with the per-channel BH helper so completion
    callbacks run via dmaengine_*_bh.

> diff --git a/drivers/dma/plx_dma.c b/drivers/dma/plx_dma.c
> index 84941a918b01f..a9a798c54ef15 100644
> --- a/drivers/dma/plx_dma.c
> +++ b/drivers/dma/plx_dma.c

[ ... ]

> @@ -241,9 +240,10 @@ static void plx_dma_stop(struct plx_dma_dev *plxdev)
>  	rcu_read_unlock();
>  }
> =20
> -static void plx_dma_desc_task(struct tasklet_struct *t)
> +static void plx_dma_desc_task(struct dma_chan *chan)
>  {
> -	struct plx_dma_dev *plxdev =3D from_tasklet(plxdev, t, desc_task);
> +	struct plx_dma_dev *plxdev =3D container_of(chan, struct plx_dma_dev,
> +						  dma_chan);
> =20
>  	plx_dma_process_desc(plxdev);

[Severity: High]
This isn't a bug introduced by this patch, but does plx_dma_process_desc()
leave bottom halves enabled while acquiring ring_lock?

If plx_dma_process_desc() is called from process context (like through
plx_dma_tx_status() or plx_dma_abort_desc()), it acquires ring_lock with
spin_lock():

	spin_lock(&plxdev->ring_lock);

If a hardware interrupt fires on the same CPU, plx_dma_isr() schedules
the BH work. When the ISR returns, the kernel will run the softirq before
returning to the preempted process context. The BH work (plx_dma_desc_task)
will then call plx_dma_process_desc() and try to acquire the already-held
ring_lock, causing a deadlock.

[Severity: High]
This is a pre-existing issue, but can invoking the client callback
synchronously while holding ring_lock cause a recursive deadlock?

In plx_dma_process_desc() and plx_dma_abort_desc(), the callback is invoked
while holding the spinlock:

	spin_lock(&plxdev->ring_lock);
	...
	dmaengine_desc_get_callback_invoke(&desc->txd, &res);

If a DMA client prepares and submits a new DMA transaction directly from
its completion callback, it will call plx_dma_prep_memcpy(). This attempts
to acquire ring_lock via spin_lock_bh() on the same CPU, which is already
held, resulting in a self-deadlock.

>  }

[ ... ]

> @@ -510,7 +510,7 @@ static int plx_dma_create(struct pci_dev *pdev)
>  		goto free_plx;
> =20
>  	spin_lock_init(&plxdev->ring_lock);
> -	tasklet_setup(&plxdev->desc_task, plx_dma_desc_task);
> +	dmaengine_init_bh(&plxdev->dma_chan, plx_dma_desc_task);
> =20
>  	RCU_INIT_POINTER(plxdev->pdev, pdev);
>  	plxdev->bar =3D pcim_iomap_table(pdev)[0];

[Severity: High]
This isn't a bug introduced by this patch, but is there a race condition
with the interrupt handler here?

request_irq() is called earlier in plx_dma_create(), unmasking the interrupt
before plxdev->bar is initialized.

If an interrupt fires immediately upon registration (for example, due to
pending hardware state), plx_dma_isr() executes and unconditionally reads f=
rom
plxdev->bar:

	status =3D readw(plxdev->bar + PLX_REG_INTR_STATUS);

Since plxdev->bar is still NULL at that point, this will result in a NULL
pointer dereference.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786384168.gi=
t.allen.lkml@gmail.com?part=3D27
