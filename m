Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7005439341
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786387512; cv=none; b=Uq27iPywbY7iLFgAwEcVDGLh+zREkQSI2fZeP2ekrSmfGJ9yRqBpzhiF1qAXT8poHCVjACXCMuH9Ve1LlOMOmWNwqVp+vnGlDHYGFrSeRPJtD90TUB5Db17nswFejQpPUapziLF3eIvDa3jua/OX2t/jmvYrbXh4rQ5RRhbZBx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786387512; c=relaxed/simple;
	bh=4Q6XJATeU05qEyhX/iSPA3ugScRKEsAdSOPdWBTR3XE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=l4U31VKWyK2mgwJXNVlMx/D0twBZhmQoMkIiZVBSk2t90puz7c8m5Qz6G8XLEhkUxW3iV4MY9nSN4J/TbNnEhFqDV3/rj9UDuKi6aySmV+jAaiieK7R/lqyqtiAdWYuKq3ky05ofNVH/sIXxWz7tDwfG8cP23FG/QqEEm4/FhP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RrjfAhdr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RrjfAhdr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4123D1F000E9;
	Mon, 10 Aug 2026 18:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786387510;
	bh=VfOIPY7n2tzwOkUGTLCUjs4qqiGxL+/52T8rSVPJBTw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RrjfAhdrb4khh/WFGVTfbIh/o2LaAOrKUGaSOPyZ14kbkpKhDg9Mt+/fFKhEDcO8M
	 qTV23uRyUiSFLh4xHEMDMDcAg6Ssxs2OM0/FbOklO5auVf4qTkIu0uZqsiKbxHduGS
	 eBapC3gS6Ov1nzvQphAxYrE+iq2D0y7D9nDZ1QYviLLIL3rQaJtDjMSlmzEnCMlpzx
	 L5i437W5Jr91hgKd3I16oDu6so3GB3A8mI06fYz6ogFU4eNVdDG43zi4OYPmuMQofU
	 auxxCpRJOxurW3lVEz38AIYVoay888bXhEGLdXkAuDOLReWIoQtzNJercc+jANUA0M
	 eqvjnlSvVo1Ow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 23/34] dmaengine: timb_dma: route callbacks via
 channel BH
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: dmaengine@vger.kernel.org, Frank.Li@kernel.org, vkoul@kernel.org
In-Reply-To: <0950412c2bdfac1b4014903dada42f4aec055bb8.1786384169.git.allen.lkml@gmail.com>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <0950412c2bdfac1b4014903dada42f4aec055bb8.1786384169.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 18:45:09 +0000
Message-Id: <20260810184510.4123D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] Data race and out-of-bounds read in `__td_ier_mask` introduced by =
asynchronous BH
- [High] Logic Error leading to permanent device hang for non-interrupt des=
criptors
- [High] Use-After-Free of `td` structure during driver teardown

Pre-existing issues:
- [High] Unsynchronized read-modify-write on global `TIMBDMA_IER` register
- [High] TOCTOU race causing premature descriptor completion
--

--- Patch [23]: [PATCH v3 23/34] dmaengine: timb_dma: route callbacks via c=
hannel BH ---
commit a7e38226e52fe6d87f6d1e2cd0a0ee22fbd778a9
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: timb_dma: route callbacks via channel BH

This commit introduces a per-channel BH workqueue for completions so
callbacks run through the dma_chan deferral mechanism while keeping the
controller tasklet for IRQ handling.

> diff --git a/drivers/dma/timb_dma.c b/drivers/dma/timb_dma.c
> index 4fc5119854ec1..5a2374aab02a6 100644
> --- a/drivers/dma/timb_dma.c
> +++ b/drivers/dma/timb_dma.c

[ ... ]

> @@ -580,17 +582,25 @@ static void td_tasklet(struct tasklet_struct *t)
>  	for (i =3D 0; i < td->dma.chancnt; i++)
>  		if (ipr & (1 << i)) {
>  			struct timb_dma_chan *td_chan =3D td->channels + i;
> -			spin_lock(&td_chan->lock);
> -			__td_finish(td_chan);
> -			if (!list_empty(&td_chan->queue))
> -				__td_start_next(td_chan);
> -			spin_unlock(&td_chan->lock);
> +			dmaengine_schedule_bh(&td_chan->chan);
>  		}

[Severity: High]
This is a pre-existing issue, but does the lockless caching of the
completion event lead to a time-of-check to time-of-use race?

The td_tasklet() caches the completion status locklessly into the ipr
variable before this loop. If td_issue_pending() executes concurrently,
processes the real completion, and starts a new transfer, would the
subsequent lock acquisition by the BH unconditionally pop the active
descriptor via __td_finish() while the hardware is still actively
processing the new transfer?

> =20
>  	ier =3D __td_ier_mask(td);
>  	iowrite32(ier, td->membase + TIMBDMA_IER);
>  }

[Severity: High]
Does this sequence result in a permanent hardware hang regression for
non-interrupt descriptors?

The tasklet schedules the BH but then immediately recalculates the hardware
IER register using the stale ongoing =3D true state, which leaks the interr=
upt
enable mask.

When the BH later completes the descriptor in __td_finish() by setting
ongoing =3D false, it never updates IER. If a subsequent non-interrupt
descriptor is submitted, might it trigger a spurious hardware interrupt
that the tasklet drops, preventing the BH from ever being scheduled and
hanging the channel?

[Severity: High]
Could the new asynchronous BH introduce a data race regression with
__td_ier_mask()?

By deferring __td_finish() to a workqueue, the driver can now mutate
active_list concurrently with the tasklet's execution of __td_ier_mask()
above. If a concurrent list_move() in the BH sets the next pointer to the
list head itself:

drivers/dma/timb_dma.c:__td_ier_mask() {
    ...
    if (td_chan->ongoing) {
        struct timb_dma_desc *td_desc =3D
            list_entry(td_chan->active_list.next,
            struct timb_dma_desc, desc_node);
        if (td_desc->interrupt)
    ...
}

Would the lockless __td_ier_mask() cast the list head to a descriptor and
read an out-of-bounds interrupt field?

[ ... ]

> @@ -697,6 +707,7 @@ static int td_probe(struct platform_device *pdev)
>  		INIT_LIST_HEAD(&td_chan->active_list);
>  		INIT_LIST_HEAD(&td_chan->queue);
>  		INIT_LIST_HEAD(&td_chan->free_list);
> +		dmaengine_init_bh(&td_chan->chan, timb_dma_chan_bh);

[Severity: High]
Does the driver properly terminate these newly introduced channel BH
workqueues during driver teardown to prevent a use-after-free regression?

While td_free_chan_resources() kills the BH, if a driver unbind occurs
immediately after a transfer finishes via td_remove(), the td object is
freed without calling dmaengine_kill_bh():

drivers/dma/timb_dma.c:td_remove() {
    ...
    tasklet_kill(&td->tasklet);
    iounmap(td->membase);
    kfree(td);
    ...
}

Could the pending system workqueue then execute timb_dma_chan_bh() on
the freed memory to acquire the spinlock?

[Severity: High]
This isn't a bug introduced by this patch, but is there an unsynchronized
read-modify-write on the global TIMBDMA_IER register?

Concurrent execution of td_tx_submit() on multiple channels appears to
modify a shared hardware register protected only by a local per-channel
lock:

drivers/dma/timb_dma.c:__td_enable_chan_irq() {
    ...
    ier =3D ioread32(td->membase + TIMBDMA_IER);
    ier |=3D 1 << id;
    iowrite32(ier, td->membase + TIMBDMA_IER);
    ...
}

Could this permanently drop interrupt masks for racing channels and stall
their operation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786384168.gi=
t.allen.lkml@gmail.com?part=3D23
