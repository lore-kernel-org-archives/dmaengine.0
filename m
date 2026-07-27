Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BB5431A51
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 17:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785172882; cv=none; b=PCGP9pwkyL4zYtap9dwixMtH1CY6gnd/AxR8Wc1oYcglFp91aYh+KYgEGt4v91sZm7lwauDBme9KX1iC0KTxrKfRBraJzCfaFptO0F0Y35C/CAKNlQbxSpVCUvL0WvbA+FksCXId+YKl7qYZ1Etg67sNQESszzP3IVFThq8QCrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785172882; c=relaxed/simple;
	bh=R9poMBVBXTt6r3BNzUTHCFz4IJXIUdF6xjFlLtmmhVc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iZ2jABAToct7TT6V/M5ujtFgb+bL1WTycY7iLTADzFhYxq0JcyR9cXds5G12dSzHRwENwns5C/iDjHz2nUoi0ant9oP7GDJmFa+tkaI/OJNfVJZZmItPEV73hqwSdRNdOKVlZIv035nfOxVWJJMo5qdxaPurXcXDwluQcTQaN9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EHE8Sxm0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EHE8Sxm0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83C831F00A3A;
	Mon, 27 Jul 2026 17:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785172872;
	bh=UQeLYLk8b/uVLTUZ8TKia69ZGRBwJuXq+Gz6WTzhU1I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EHE8Sxm0NSkIDPT0lcTQ0mv9B/fFkVrKMrZuIkKszbkAUlKIwCbBcG3noVwMCjDGz
	 9J5Km0sRGOKaRhY5NHfs98C4MSZzj3FjrwhD4Qg94tCq6TR2JGUHUk3K9b76NAJeuN
	 79MH448vqCg2GU23GpCiF9+/BLsyUj4K2npieuVULifp3zEdG4B14K6YzUcnNlZn+W
	 DTpYULt5hotDPJNd0ZSCTKBu9Kf8xKRVag2Jz2JSNENnAzqx2ucia9Ie3vcQOEsjt8
	 lCpy/T2M3iu/cCQnmTxdCssHt4/KYEJo0wgC+RQ8he4suU2+T8tt2NXCj9ZsBLKqXb
	 1NE4QdmrK4wyw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 15/24] dmaengine: dw-edma: Recheck stopped LL
 channels before restart
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260727170323.2321369-16-den@valinux.co.jp>
References: <20260727170323.2321369-1-den@valinux.co.jp>
 <20260727170323.2321369-16-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 17:21:12 +0000
Message-Id: <20260727172112.83C831F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Using 0 as a sentinel for `ll_recheck_at` leads to missed DMA re=
checks when `jiffies + delay` evaluates to exactly 0.
--

--- Patch [15]: [PATCH v3 15/24] dmaengine: dw-edma: Recheck stopped LL cha=
nnels before restart ---
commit 204ac5e83f10ca496840d5ab003b724253b46bfe
Author: Koichiro Den <den@valinux.co.jp>

dmaengine: dw-edma: Recheck stopped LL channels before restart

This commit introduces a mechanism to recheck a stopped linked-list
channel before restarting it. It samples DMA_LLP again to reclaim any
newly visible progress for interfaces without a dedicated STOP event. It
also schedules a delayed recheck if the channel reports it is running.

> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-=
edma-core.c
> index d28e3633a8665..dbccd11aa92fa 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c
[ ... ]
> @@ -148,6 +149,26 @@ static void dw_edma_ll_event_discard_locked(struct d=
w_edma_chan *chan)
>  	dw_edma_ll_snapshot_discard_locked(chan);
>  }
> =20
> +/* Must be called with vc.lock held. */
> +static void dw_edma_ll_recheck_cancel(struct dw_edma_chan *chan)
> +{
> +	chan->ll_recheck_at =3D 0;
> +	cancel_delayed_work(&chan->ll_recheck_work);
> +}
> +
> +/* Must be called with vc.lock held. */
> +static void dw_edma_ll_recheck_schedule(struct dw_edma_chan *chan)
> +{
> +	unsigned long delay =3D
> +		msecs_to_jiffies(DW_EDMA_LL_RECHECK_DELAY_MS);
> +
> +	if (unlikely(READ_ONCE(chan->dw->teardown)))
> +		return;
> +
> +	chan->ll_recheck_at =3D jiffies + delay;

[Severity: Medium]
If jiffies + delay evaluates to exactly 0 when it wraps around, will the
delayed work function mistake this for a cancelled timer?

> +	mod_delayed_work(chan->dw->wq, &chan->ll_recheck_work, delay);
> +}
[ ... ]
> +static void dw_edma_ll_recheck_work(struct work_struct *work)
> +{
> +	struct dw_edma_chan *chan =3D
> +		container_of(to_delayed_work(work), struct dw_edma_chan,
> +			     ll_recheck_work);
> +	unsigned long delay;
> +
> +	guard(spinlock_irqsave)(&chan->vc.lock);
> +
> +	if (unlikely(READ_ONCE(chan->dw->teardown))) {
> +		chan->ll_recheck_at =3D 0;
> +		return;
> +	}
> +
> +	if (!chan->ll_recheck_at)
> +		return;

[Severity: Medium]
If the scheduled time wrapped to 0, does this check incorrectly abort
the function and miss the necessary recheck of the stopped boundary?

> +
> +	if (time_before(jiffies, chan->ll_recheck_at)) {
> +		delay =3D chan->ll_recheck_at - jiffies;
> +		mod_delayed_work(chan->dw->wq, &chan->ll_recheck_work, delay);
> +		return;
> +	}
> +
> +	chan->ll_recheck_at =3D 0;
> +	if (chan->request =3D=3D EDMA_REQ_NONE)
> +		dw_edma_core_ch_maybe_doorbell(chan);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727170323.2321=
369-1-den@valinux.co.jp?part=3D15
