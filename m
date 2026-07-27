Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E8F42BC34
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 17:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785173435; cv=none; b=T3dtXBtAUVksY9gfuzGCHJxJLnu96EMFFUYnOFiImA/24RLMhq6ZiluVaKj6P2ErGBLG8RKpexQejIhp10p9p5sobYzishc5ZcJHPUzYsGMcBa8Sqdcz61mwRLguI0sNJWWOqQXgCoBCzdgwIRguxpa8Y8MIXvmkUmkBo6/NYvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785173435; c=relaxed/simple;
	bh=FwhEM6AjmYt5JgOtfVrM4XeDt1Bs8OBjZma/PEECNS0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=If+w2HArTctvO2SSryTFRkvenZVNrpkh1fwt6RwvAM45PoRzisdABl4xW+w0two8B6skLxt0rWh/z6XTZW8FPvr367YrYHmarQai9c34m+wTVfpKUc/WirRbrmgsAaZGmr1cdQVmDZkCi4xXd9zSj91QUNIXT7hNfqEUcivTGok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=apI5LAGC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="apI5LAGC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 047221F000E9;
	Mon, 27 Jul 2026 17:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785173427;
	bh=Y/dfFBQtpZGiJZP1TSoVkfvy9LgYxBdVWpt6btYFTrY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=apI5LAGC5db8eRONACeXupJ6unUvVkRYgBG2oyj+pBGUmie4LjZVXBld0UL9i7qoe
	 OSNQn5oj0avdhDlXO/ss7zraXWJQCeMqUFTkIt2tykzgM+EQTjdJIqXNIjvpPABz1P
	 Svr3CTwvpHLI8Z3BvSn+lQm+3UedaqmZtyje8SAjS6c17WeD3JfpkrTaz6eHFGmL/S
	 eqdgD8IcucAHEEh5EfEFdhQug80fBD5hliIaDTkw//n21s/yeitrdakEcDZsliYQya
	 I8iaMUGZDM1rv6K+T4rx1DAzGUEkqFKeDxVKjEz0P7G1bKl68XGZMD3Ua+CB0M/bCM
	 XOJpMEsqnPpnw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 19/24] dmaengine: dw-edma: Drain LL entries for STOP
 and PAUSE
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260727170323.2321369-20-den@valinux.co.jp>
References: <20260727170323.2321369-1-den@valinux.co.jp>
 <20260727170323.2321369-20-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 17:30:26 +0000
Message-Id: <20260727173027.047221F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The delayed stop recheck is not armed when draining a stopped chan=
nel, leading to an infinite hang in dw_edma_wait_termination().
--

--- Patch [19]: [PATCH v3 19/24] dmaengine: dw-edma: Drain LL entries for S=
TOP and PAUSE ---
commit 2379a4182966c17e3764b5d21a024f5b0063f553
Author: Koichiro Den <den@valinux.co.jp>

dmaengine: dw-edma: Drain LL entries for STOP and PAUSE

This commit modifies the handling of STOP and PAUSE requests to drain
published LL entries instead of discarding ring state immediately. It waits
for hardware to consume them and uses a delayed recheck to catch a later
stop.

> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-=
edma-core.c
> index 0c30c0f51fea2..bbd417e98a9d7 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c
[ ... ]
> @@ -883,35 +916,52 @@ static int dw_edma_device_resume(struct dma_chan *d=
chan)
[ ... ]
>  static int dw_edma_device_terminate_all(struct dma_chan *dchan)
>  {
>  	struct dw_edma_chan *chan =3D dchan2dw_edma_chan(dchan);
> -	int err =3D 0;
> =20
>  	guard(spinlock_irqsave)(&chan->vc.lock);
> =20
>  	if (!chan->configured) {
>  		dw_edma_terminate_all_descs(chan);
> +		chan->request =3D EDMA_REQ_NONE;
>  	} else if (chan->status =3D=3D EDMA_ST_PAUSE) {
> +		/* A paused channel has already stopped. */
>  		dw_edma_finish_termination(chan);
> -	} else if (chan->status =3D=3D EDMA_ST_IDLE) {
> -		dw_edma_finish_termination(chan);
> -	} else if (dw_edma_core_ch_status(chan) =3D=3D DMA_COMPLETE) {
> +	} else if (dw_edma_may_be_active(chan)) {
>  		/*
> -		 * The channel is in a false BUSY state, probably didn't
> -		 * receive or lost an interrupt
> +		 * Keep published entries intact until an IRQ sample confirms
> +		 * that the channel stopped. An outstanding EDMA_REQ_PAUSE is
> +		 * replaced by EDMA_REQ_STOP.
>  		 */
> -		dw_edma_finish_termination(chan);
> -	} else if (chan->request > EDMA_REQ_PAUSE) {
> -		err =3D -EPERM;
> -	} else {
>  		dw_edma_set_request(chan, EDMA_REQ_STOP);
> +		dw_edma_core_ch_maybe_doorbell_or_recheck(chan);

[Severity: High]
Does dw_edma_core_ch_maybe_doorbell() unconditionally return false after
kicking a stopped channel?

If dw_edma_core_ch_maybe_doorbell() returns false, it looks like
dw_edma_core_ch_maybe_doorbell_or_recheck() will fail to arm the delayed
recheck timer:

static void dw_edma_core_ch_maybe_doorbell_or_recheck(...)
{
    if (dw_edma_core_ch_maybe_doorbell(chan) &&
        !dw_edma_ll_has_hdma_stop_event(chan))
        dw_edma_ll_recheck_schedule(chan);
}

Without an interrupt and with no recheck timer armed, could chan->request
remain EDMA_REQ_STOP indefinitely?

>  	}
[ ... ]
> @@ -1591,18 +1639,21 @@ static void dw_edma_wait_termination(struct dma_c=
han *dchan)
>  	 * A STOP may be deferred to a later interrupt while the channel is sti=
ll
>  	 * running. Wait until that handler completes the termination.
>  	 */
> -	while (time_before(jiffies, timeout)) {
> +	for (;;) {
>  		scoped_guard(spinlock_irqsave, &chan->vc.lock)
>  			stopping =3D chan->request =3D=3D EDMA_REQ_STOP;
> =20
>  		if (!stopping)
>  			return;
> =20
> +		if (time_after_eq(jiffies, timeout)) {
> +			dev_warn(chan->dw->chip->dev,
> +				 "timeout waiting for channel termination; still waiting\n");
> +			timeout =3D jiffies + msecs_to_jiffies(5000);
> +		}
> +
>  		fsleep(1000);
>  	}

[Severity: High]
If the channel remains stuck in EDMA_REQ_STOP due to the missing recheck
timer, will a task calling dmaengine_terminate_sync() or
dmaengine_synchronize() hang indefinitely in this loop?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727170323.2321=
369-1-den@valinux.co.jp?part=3D19
