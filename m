Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A1F22FF22
	for <dmaengine@vger.kernel.org>; Fri,  5 Jun 2026 22:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780697794; cv=none; b=QqrJXsFoh6rec3X12PrENw5CAxo56SAg63PrsLOXio/SPjAFO8iUjDJEQLi4qRLmz7Fn6J4VPxmycJl5YecvDFwPnfKyOu0jbp6zjSWBO4lbt7vdbpwNawyGV9Dl4CuFV3bklu6fSNE9t6tTu/9UR0FTqW+hrmHdpiMi2kRlN5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780697794; c=relaxed/simple;
	bh=7PcJn5jYOIiipAtIPhlEOp0QcQfcvdCYI2k7PucyxgE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qkKTZNWMmifL8IvZ5eyJfhJ0pFT1GZJjK9mTEMsqZHjMXOdby1+opedW+p3Kooc5OE9PBJPo6ti0L/zR1o7XQbpjqj9nKnyqBF5DZiqgPyRBRyz0I1SVaMjgeUmRyvOkK/pf/oKvlkDMEP3YWIcOdmgsrTPgCgmO7Un0yCyOmjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AesK9Oq5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AesK9Oq5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A02A51F00893;
	Fri,  5 Jun 2026 22:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780697792;
	bh=XV6/OZEkvbXhQ7FB+YrGIVWNza9f1Nz916SKeE2fG+o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AesK9Oq5/P21KceTJsxxNDql1tV3OSz9HjJlUnSCDptT3NwyeAnJ2TQsWz/N5JJ/F
	 MFAv8ptO3qnlC6hgsRZ6z2TJ/lbzPj4qgJIwCt37x293Q1VHaJJNXQCJwf3BsI/q5G
	 0Bi5wiH5yc9Z7xC0CI6sRmUEF0qr03Zw5DHakTN+KIIKPEvk68FZ7mhT5hj5kuZm9M
	 NmD7HPbflxZ7IzqPATeIvNa34EmJnyJJpFpvsG3ldloCQYl0/VJbq5NSeYybyE8p1m
	 UoBw5aYP/WC2veRBKZiBfeQd64d6uke4TgtaRRFTpqP+bIBMw6B/ZBju4tfLHeqhXr
	 Mo5OBkX/k+5ww==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 01/10] dmaengine: fsldma: kill tasklet before removing
 channel
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260605220134.43295-2-rosenp@gmail.com>
References: <20260605220134.43295-2-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 22:16:32 +0000
Message-Id: <20260605221632.A02A51F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Medium] The commit message inaccurately claims the channel struct is 'no=
 longer freed in the remove path' due to devm conversions, concluding this =
is not a use-after-free fix.

Pre-existing issues:
- [High] The driver holds a spinlock while executing client callbacks, caus=
ing a deadlock if the client submits new transactions.
- [High] The hardware DMA engine is not explicitly halted when the driver i=
s unbound or when channel resources are freed, leading to DMA fetching from=
 freed memory.
--

commit 2874e539ce862c4c0134a865315888712d6c8923
Author: Rosen Penev <rosenp@gmail.com>

dmaengine: fsldma: kill tasklet before removing channel

This commit adds tasklet_kill() to fsl_dma_chan_remove() to prevent a race
where the tasklet could run after the channel has been torn down.

> With the recent devm conversions
> the channel struct is no longer freed in the remove path, so
> this is not a use-after-free crash fix, but rather correct
> shutdown sequencing to avoid the tasklet operating on a
> logically-removed channel.

[Severity: Medium]
Is this description accurate for this exact point in the git history?

Looking at fsl_dma_chan_remove(), it still explicitly calls kfree() on the
channel struct:

drivers/dma/fsldma.c:fsl_dma_chan_remove() {
        tasklet_kill(&chan->tasklet);
        [ ... ]
        kfree(chan);
}

It appears the memory is indeed manually freed here, making this patch an
active prevention of a use-after-free crash. Could the commit message be
updated to reflect the current state of the code before the devm conversions
are applied?

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
>  	irq_dispose_mapping(chan->irq);
>  	list_del(&chan->common.device_node);
>  	iounmap(chan->regs);

[Severity: High]
This is a pre-existing issue, but does the hardware DMA engine need to be
explicitly halted when the driver is unbound or resources are freed?

During driver unbind in fsldma_of_remove(), the driver unmaps MMIO registers
and frees structures:

drivers/dma/fsldma.c:fsldma_of_remove() {
        [ ... ]
        for (i =3D 0; i < FSL_DMA_MAX_CHANS_PER_DEVICE; i++) {
                if (fdev->chan[i])
                        fsl_dma_chan_remove(fdev->chan[i]);
        }
        irq_dispose_mapping(fdev->irq);
        iounmap(fdev->regs);
        kfree(fdev);
        [ ... ]
}

Similarly, fsl_dma_free_chan_resources() destroys the descriptor pool:

drivers/dma/fsldma.c:fsl_dma_free_chan_resources() {
        [ ... ]
        dma_pool_destroy(chan->desc_pool);
        [ ... ]
}

Since dma_halt() is never called on the channel, could an actively running
transfer continue executing in the background and fetch descriptors or write
data to physical memory pages that have already been freed?

[Severity: High]
This is another pre-existing issue, but can this code cause a recursive
spinlock deadlock if a client submits new transactions from a callback?

When the driver executes client callbacks, it holds the descriptor lock:

drivers/dma/fsldma.c:fsldma_cleanup_descriptors() {
        [ ... ]
        cookie =3D fsldma_run_tx_complete_actions(chan, desc, cookie);
        [ ... ]
}

If the client completion callback then invokes fsl_dma_tx_submit() to submit
a new DMA transaction, that function attempts to acquire the same lock:

drivers/dma/fsldma.c:fsl_dma_tx_submit() {
        [ ... ]
        spin_lock_bh(&chan->desc_lock);
        [ ... ]
}

Will this result in a deadlock on the same CPU?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605220134.4329=
5-1-rosenp@gmail.com?part=3D1
