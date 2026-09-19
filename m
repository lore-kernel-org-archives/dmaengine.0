Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9093A382D
	for <dmaengine@vger.kernel.org>; Sat, 19 Sep 2026 08:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789808259; cv=none; b=rbevvhoWnO5XnATSWPiuSYScaBh49PZgz1VFuEnVeIXOjiiU5qxYEhK+l3srLRP3ref+KFw0g1ivjqDo9dLnPZetuOrEOrXfzTbKPnKgD1wFxZ9kRWKgo3FOms7x2Qs1ImBOMUGQ1SKTRBvSgTipiNnWTT813eDzrsleelPERS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789808259; c=relaxed/simple;
	bh=Yk4e3c01FFccj7VnRhsN0GOjtwjjhvujXe8W5nkhz2o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EtmRcniM+aeQGfcQDjwUilP4iCG3QSAmX1sRnL2VNpv5zmaADpvaddrxtxXkzbmeXCmBU/QyZ9uBnBFRNOEOsnSoG9pCwLZUOl4sb9MRtGHRqqj0c2Ml2WRqj7TRNLKMBCLPznr+M9Q5ECN/T1kU3UZRtODQUyKYrX2QoBU93kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NJ4Ha2NK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NJ4Ha2NK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 999901F000FF;
	Sat, 19 Sep 2026 08:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789808257;
	bh=eDX0m4gkCE8VG40JV5PlRYUncscTKx3LXRpHKUU94SA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NJ4Ha2NKbzlZ3WqAgpwTrJf5IrNRu7HIFM1n3TvxU2qH1OCejQHLPOs7SvO+e0de5
	 7HbPpEfDGJTLdEFw5YfTGqp2v7tCdEMiJapgfeOvqAgg2960cBf+yoI7lBXhQhsSWn
	 M9pF47or2+N6mVZzojvOGRk7MAPhpuLMysh3snWG9PNI1XAq7zHH/ptdqFEm/Te5iD
	 O/9N2coVpVymiEMHyu3HCLpaxbQSedjo77vL44RTJcLizVdJ1vbfW8m1usIwOCxJHG
	 Ec+/svXpkRBZutCeYqD8hGz+UlK2nx1Q4LVkTSwLHgYnKIAXj6OWMZyyq1Lo2chruM
	 BWL2AVrjn08tw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: dw-axi-dmac: restart the next queued
 transfer after completion
Reply-To: sashiko-reviews@lists.linux.dev
To: "Baineng Shou" <shoubaineng@gmail.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260919084732.502247-1-shoubaineng@gmail.com>
References: <20260919084732.502247-1-shoubaineng@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 19 Sep 2026 08:57:37 +0000
Message-Id: <20260919085737.999901F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dmaengine: dw-axi-dmac: permanent queue stall on axi_chan_wait_idl=
e() timeout
--

commit 9a989fc2edd4f4603b5177a0c01ff0b20e6546b9
Author: Baineng Shou <shoubaineng@gmail.com>

dmaengine: dw-axi-dmac: restart the next queued transfer after completion

Commit 333e11bf47fa ("Avoid hw_desc array overrun in dw-axi-dmac") removed
the axi_chan_start_first_queued() call from the non-cyclic completion path,
after observing that a descriptor started there could be dropped by the
non-idle check in axi_chan_block_xfer_start() because the channel has not
fully stopped yet when the transfer-complete interrupt arrives.

> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma=
/dw-axi-dmac/dw-axi-dmac-platform.c
> index eebed2474210d..f3d89f5cc12a7 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c

[ ... ]

> @@ -1067,6 +1087,9 @@ static noinline void axi_chan_handle_err(struct axi=
_dma_chan *chan, u32 status)
>  	spin_lock_irqsave(&chan->vc.lock, flags);
> =20
>  	axi_chan_disable(chan);
> +	if (axi_chan_wait_idle(chan))
> +		dev_warn(chan2dev(chan), "%s failed to go idle\n",
> +			 axi_chan_name(chan));

[Severity: High]
If axi_chan_wait_idle() times out (e.g., due to bus contention extending the
flush time beyond 100us), it returns -ETIMEDOUT. Because the error is ignor=
ed
here, execution continues and calls axi_chan_start_first_queued(chan) at th=
e end
of this function.

Since the hardware channel is still active, axi_chan_block_xfer_start() will
evaluate axi_chan_is_hw_enable(chan) as true, log an error, and return with=
out
programming the new transfer.=20

The next descriptor will remain in the pending queue, but no hardware trans=
fer
will be started. Without a new transfer, no further completion interrupts w=
ill
fire, permanently deadlocking the DMA channel queue.

Would it be better to handle the timeout error and avoid attempting to start
the next queued descriptor while the channel is busy?

> =20
>  	/* The bad descriptor currently is in the head of vc list */
>  	vd =3D vchan_next_desc(&chan->vc);

[ ... ]

> @@ -1108,6 +1131,9 @@ static void axi_chan_block_xfer_complete(struct axi=
_dma_chan *chan)
>  		dev_err(chan2dev(chan), "BUG: %s caught DWAXIDMAC_IRQ_DMA_TRF, but cha=
nnel not idle!\n",
>  			axi_chan_name(chan));
>  		axi_chan_disable(chan);
> +		if (axi_chan_wait_idle(chan))
> +			dev_warn(chan2dev(chan), "%s failed to go idle\n",
> +				 axi_chan_name(chan));

[Severity: High]
Does the same unhandled timeout logic apply to the completion handler here?

If axi_chan_wait_idle() times out, we will eventually call
axi_chan_start_first_queued(chan) lower in this function, which could drop =
the
transfer and result in a permanent queue stall.

>  	}
> =20
>  	/* The completed descriptor currently is in the head of vc list */
> @@ -1141,6 +1167,9 @@ static void axi_chan_block_xfer_complete(struct axi=
_dma_chan *chan)
>  		/* Remove the completed descriptor from issued list before completing =
*/
>  		list_del(&vd->node);
>  		vchan_cookie_complete(vd);
> +
> +		/* Restart the next queued descriptor, if any */
> +		axi_chan_start_first_queued(chan);
>  	}
> =20
>  out:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260919084732.5022=
47-1-shoubaineng@gmail.com?part=3D1
