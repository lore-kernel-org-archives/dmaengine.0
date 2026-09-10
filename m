Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F86496D29
	for <dmaengine@vger.kernel.org>; Thu, 10 Sep 2026 20:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789073024; cv=none; b=BzG6STCNn1Mdke2kAcEJKqnkmRhUEvhwGt11kDR7AkNQ37HrD3Glfj3MInNC+PhcSjfIpCd7R4RXNwJcI1AqitWekCYs6vTPWpRbom1Zl1Xg/jtdPpPrXK9vu3emGnaVfR0zyzseZ309TLEbtH5SHOAKT2j97LrScnhp0bN9IAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789073024; c=relaxed/simple;
	bh=CPboDKWZztdd1vwFO3KpSSPf8mTDL7dek9k7aI458EU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Snw9UKdM4hMlwPTEZg4WwCkKAj9MNF8MLbYMcgeIXjnWVukvo2Nh+AjHQOM7dtlRbpwcbjamI4F6AyoV7N0yuOSqZBnyhJZpjFBpkQzYThJCLuD8zXiAJ6pM2RHkJzBvHrXmma5Gl+wsMX0di4tg/7fMNseL00eKHpdxGejSw0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HUYvcHcK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HUYvcHcK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA0361F000FF;
	Thu, 10 Sep 2026 20:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789073023;
	bh=7stLa8wpshhB+BRrIVyrHbUZal3qpoy031l7Q5u8tQY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HUYvcHcKVx18SAcrxDoyN4bfj7v+BR+AfUzGceE/Pxz0xadEWpcTPflreGa43vsIP
	 jd9CG9oZG5kAD2z+HLTqvhR6J8RCq83FMB3Z/rnOF1PXCT+tqz33N9zxg4avHaaABO
	 FhtXlDc11bPtBU2cBvXrJL06UgjKycNNapKfE6tmbE/attfj+uYRIedugERE2dP6RL
	 3gDlR4mkOvyQz+WZhtKsT2SG8ZqiOlKjJDz9d76JjUKdd4rBxsLpcMkfodfSDEXSAU
	 9bBun052jIe9i/Sgm8Jl9b1NRWVjO93rcup+W50X1tYOHR//kPlzzhjEJ8tSMzryk6
	 aM3DulKPOf8GA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv2] dmaengine: fsldma: kill tasklet before removing
 channel
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260910202846.48941-1-rosenp@gmail.com>
References: <20260910202846.48941-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 20:43:42 +0000
Message-Id: <20260910204342.DA0361F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The error path in fsldma_request_irqs() calls free_irq() on an IRQ=
 that just failed to be requested, triggering a kernel WARNING.
- [High] fsldma_of_probe() completely ignores the return value of dma_async=
_device_register(), leading to silent failures and potential list corruptio=
n.
- [High] Recursive deadlock when invoking client callbacks or resolving DMA=
 dependencies in fsldma_run_tx_complete_actions().
- [High] Unbalanced spin_unlock_bh() on the error path in fsldma_suspend_la=
te(), causing a double unlock.
- [High] DMA engine is not halted during channel removal, potentially causi=
ng memory corruption.
--

commit 6e64fb2982240feb5c9b3c6e8b290c5fad43ac6d
Author: Rosen Penev <rosenp@gmail.com>

dmaengine: fsldma: kill tasklet before removing channel

Add tasklet_kill() in fsl_dma_chan_remove() to prevent a race where the
tasklet is scheduled by the IRQ handler and runs after the channel has been
freed.

> diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
> index 22d62d958abd9..0e2f84862261c 100644
> --- a/drivers/dma/fsldma.c
> +++ b/drivers/dma/fsldma.c
> @@ -1205,6 +1205,7 @@ static int fsl_dma_chan_probe(struct fsldma_device =
*fdev,
> =20
>  static void fsl_dma_chan_remove(struct fsldma_chan *chan)
>  {
> +	tasklet_kill(&chan->tasklet);

[Severity: High]
This is a pre-existing issue, but does this function neglect to halt the
hardware DMA controller before tearing down the software channel? If the dr=
iver
is unbound while a DMA transfer is in progress, couldn't the hardware conti=
nue
executing transactions and corrupt memory after the descriptors and IO
registers are destroyed?

>  	irq_dispose_mapping(chan->irq);
>  	list_del(&chan->common.device_node);
>  	iounmap(chan->regs);

[ ... ]


drivers/dma/fsldma.c:fsldma_request_irqs() {
    ...
		ret =3D request_irq(chan->irq, fsldma_chan_irq, IRQF_SHARED,
				  "fsldma-chan", chan);
		if (ret) {
			chan_err(chan, "unable to request per-channel IRQ\n");
			goto out_unwind;
		}
	}

	return 0;

out_unwind:
	for (/* none */; i >=3D 0; i--) {
		chan =3D fdev->chan[i];
		if (!chan)
			continue;

		if (!chan->irq)
			continue;

		free_irq(chan->irq, chan);
	}
	return ret;
}

[Severity: High]
This is a pre-existing issue, but since the index 'i' is not decremented
before entering the out_unwind loop, could this call free_irq() on the chan=
nel
that just failed initialization? This might trigger a kernel warning for tr=
ying
to free an already-free IRQ.


drivers/dma/fsldma.c:fsldma_of_probe() {
    ...
	err =3D fsldma_request_irqs(fdev);
	if (err) {
		dev_err(fdev->dev, "unable to request IRQs\n");
		goto out_free_fdev;
	}

	dma_async_device_register(&fdev->common);
	return 0;
}

[Severity: High]
This is a pre-existing issue, but does fsldma_of_probe() ignore the return
value of dma_async_device_register()? If registration fails, returning succ=
ess
could lead to a NULL pointer dereference later during device removal when
dma_async_device_unregister() is called on an uninitialized device.


drivers/dma/fsldma.c:fsldma_run_tx_complete_actions() {
    ...
	if (txd->cookie > 0) {
		ret =3D txd->cookie;

		dma_descriptor_unmap(txd);
		/* Run the link descriptor callback function */
		dmaengine_desc_get_callback_invoke(txd, NULL);
	}

	/* Run any dependencies */
	dma_run_dependencies(txd);
    ...
}

[Severity: High]
This is a pre-existing issue, but is there a potential recursive deadlock
when invoking client callbacks? fsldma_cleanup_descriptors() holds
chan->desc_lock when calling fsldma_run_tx_complete_actions(). If a client
callback or dependency submits a new transaction to the same channel,
fsl_dma_tx_submit() will try to acquire the same chan->desc_lock.


drivers/dma/fsldma.c:fsldma_suspend_late() {
    ...
	for (i =3D 0; i < FSL_DMA_MAX_CHANS_PER_DEVICE; i++) {
		chan =3D fdev->chan[i];
		if (!chan)
			continue;

		spin_lock_bh(&chan->desc_lock);
		if (unlikely(!chan->idle))
			goto out;
		chan->regs_save.mr =3D get_mr(chan);
		chan->pm_state =3D SUSPENDED;
		spin_unlock_bh(&chan->desc_lock);
	}
	return 0;

out:
	for (; i >=3D 0; i--) {
		chan =3D fdev->chan[i];
		if (!chan)
			continue;
		chan->pm_state =3D RUNNING;
		spin_unlock_bh(&chan->desc_lock);
	}
    ...
}

[Severity: High]
This is a pre-existing issue, but does the error path in fsldma_suspend_lat=
e()
perform a double-unlock? For channels prior to the failing index 'i', the l=
ock
was already correctly released in the first loop. Does the unconditional
spin_unlock_bh() in the out loop cause a double-unlock for those previously
processed channels?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910202846.4894=
1-1-rosenp@gmail.com?part=3D1
