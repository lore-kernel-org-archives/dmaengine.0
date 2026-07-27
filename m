Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F963D5229
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 21:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785186556; cv=none; b=QzJctXbHxA4Gnpcm/YI5isn/mn4EogTsL85R0qUcF9YkdL5E57kx3SKjjgBn9X/fwIsx6M9DqE6YI1aEAUMbws/FXOfnsFHPwhbHfGlVPgUkR0rAzJUSnAFkZnqFwlgU439Vwbg5ey+exQNJwleiGpY3/Q1vnx9ysSFReQsuICA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785186556; c=relaxed/simple;
	bh=rLmUUcjYTXpS2ZmKNw3WAq51yKat/ZjbFpcm0PzXQqc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HPgb1o6GTDv+1XtsF0BsrRCOaZfkgWH7EMl/Elx3WHqxQLOL9zjYSgB4c90yCXpZnzsJIrhbIycEMkv3TkpzwCSBQbNFbUJNJYask2sRFHDTsfudtovBVoOHY4hVVVbkINVlOmoKLOQZajoqF6kbC9r8AN/1KWB99tutXJyG2Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nYlWCdTU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nYlWCdTU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EC241F00A3A;
	Mon, 27 Jul 2026 21:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785186554;
	bh=u08Z6iG0tdCuHz/1QTCgPZ6avXgXq+x0yHKf6VZtz5U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nYlWCdTULr/y+J0W3GmhA+QpTw6TiTnMtmbU+g+7+sTCjm9+sqs33pzBUz/alVEnz
	 jPkguEqyUdxDCZVPSadRTTCHimrSUsZXOvfSPR82oMe9oZUS6h18X0R1GOIEjcyahn
	 ztfCv7DrXpMsU5xz5fDv6/U5v20zcUwDwgrtSFPAx9qbf8cPoERRH23gnAetAjsVe8
	 +e+f9coKPZg51w63/RfZvY/mtYHzfgp0bGNzIkY139x0m7anHeHuxLj3qcCkFGV8lI
	 +Ul7865Ax/hRYSqngCu9h7f7aIG7spH0rTsq9TY5pLJoXDpKPtvVDYZ7oJl/hD3hwe
	 gYzByYOx5JX0g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 23/64] dmaengine: timb_dma: route callbacks via
 channel BH
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <b13242b2b3e1ea01e6c1b7b2daa32836b8ea5398.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <b13242b2b3e1ea01e6c1b7b2daa32836b8ea5398.1785183549.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 21:09:14 +0000
Message-Id: <20260727210914.9EC241F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Data race and out-of-bounds read in __td_ier_mask due to lockless =
traversal of active_list racing with asynchronous workqueue.

Pre-existing issues:
- [High] Premature completion of active transfers due to a race between td_=
issue_pending and timb_dma_chan_bh.
--

--- Patch [23]: [PATCH v2 23/64] dmaengine: timb_dma: route callbacks via c=
hannel BH ---
commit 2a07cb9b339578f9caa75d42037da515bda38de2
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: timb_dma: route callbacks via channel BH

This patch schedules per-channel BH work for completions so callbacks run
through the dma_chan deferral mechanism while keeping the controller
tasklet for IRQ handling.

> diff --git a/drivers/dma/timb_dma.c b/drivers/dma/timb_dma.c
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
> +			dma_chan_schedule_bh(&td_chan->chan);
>  		}
> =20
>  	ier =3D __td_ier_mask(td);

[Severity: High]
Can this lead to an out-of-bounds memory read?

With completion processing moved to an asynchronous workqueue via
dma_chan_schedule_bh(), td_tasklet() and timb_dma_chan_bh() can now run
concurrently. The tasklet calls __td_ier_mask() right here, which
locklessly evaluates td_chan->ongoing and traverses td_chan->active_list.

If __td_ier_mask() reads ongoing as true right before the workqueue removes
the final descriptor from active_list in __td_finish(), wouldn't list_entry=
()
calculate a bogus pointer relative to the empty list head? This could cause=
 a
read of unmapped memory or garbage when accessing td_desc->interrupt.

>  	iowrite32(ier, td->membase + TIMBDMA_IER);
>  }
> =20
> +static void timb_dma_chan_bh(struct dma_chan *chan)
> +{
> +	struct timb_dma_chan *td_chan =3D container_of(chan, struct timb_dma_ch=
an,
> +						     chan);
> +
> +	spin_lock(&td_chan->lock);
> +	__td_finish(td_chan);

[Severity: High]
This is a pre-existing issue, but does moving to an asynchronous workqueue
widen a race condition here?

Currently, if td_issue_pending() races with a hardware interrupt, it can
acknowledge the interrupt and complete the transfer before the completion
path runs.

If td_issue_pending() also started the next transfer, this newly scheduled
timb_dma_chan_bh() workqueue will blindly call __td_finish() and complete
whatever is currently in the active_list. By changing the completion from a
tasklet (which had a very short race window) to a scheduled workqueue, the
delay is much longer. Will this result in erroneously aborting and completi=
ng
the newly started transfer?

> +	if (!list_empty(&td_chan->queue))
> +		__td_start_next(td_chan);
> +	spin_unlock(&td_chan->lock);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785183549.gi=
t.allen.lkml@gmail.com?part=3D23
