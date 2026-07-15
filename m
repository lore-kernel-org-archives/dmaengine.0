Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B9A41F5F4
	for <dmaengine@vger.kernel.org>; Wed, 15 Jul 2026 18:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784139906; cv=none; b=TjbpwI6laYDwp2o5hiG7u1r9jPuSoqEwdF5iVtbwyJ/lagYnYQdv74xqe4cAZLxH/Kw0bh5zyeH/ApdamB7BMGnlJnZhiFuKNyccjJnfJvsUFF3Xo0IM28S7T1V0THVrTptRDSsT519Wbz9TBDvc5wNMIywry3EkMzvBzJxC3zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784139906; c=relaxed/simple;
	bh=1RNQ7yRErmcq9A1kbRAfYshsnr4H9BiJvv0KJ3haIy4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PTiNCvi0rmn1wCsD8eiY0bSpIBHGW7vqA2vHkhxmFOjArwrq9UZrxdEf3Tb8o731mC77ihuSscAwavYQYcu4imJbF38lfAjtihTuqSUQIBXj5cgG6oxvK/AWeFWAJtbZqOghVj7PeLA0IIZbLvtRZndcUjN5qsptjobwFRvkOEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NnWRyD/O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NnWRyD/O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E94211F00A3A;
	Wed, 15 Jul 2026 18:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784139898;
	bh=iqb2IGYQ69IwrcH8SJGWPszqgV2BI4V8ik24hozvxJA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NnWRyD/O6luX+SmxcmNl0GxiYEaoBanFJqeWyfHaZZOZue+G988n+nG6ZuQoVOnxc
	 SCa1DFWjHGu42f4v6eZ1mTL1+eoPFhnQzQF77cLOJQwMQ/a0Hr5oUGPpbAfnLG+2NS
	 g9QLmR+XaZho4D5PRSJONHOsmLvD5JBsNVprbUJP/QJfY5OAO8rTL5ZJkUUvYytJlX
	 Uak1a2PcYcPHoJbeuRqaczs/B1SCDY1tYpsNoLHT10uKNr/VaxRZ5+iFxSaxuGAdfd
	 VQ7p5oP3kNnhne4IGQpZQAGKN1ozcGlN8j+ls6KJgIEkUnDam7b0i1uM2KuY4FiUHP
	 QrlBMoekKFn6A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/9] dmaengine: dw-edma: Terminate all descriptors
 without callbacks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260715175740.1110404-3-den@valinux.co.jp>
References: <20260715175740.1110404-1-den@valinux.co.jp>
 <20260715175740.1110404-3-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 18:24:57 +0000
Message-Id: <20260715182457.E94211F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] `dmaengine_synchronize()` explicitly waits for and causes the chan=
nel to lose its configuration, breaking generic clients that expect to reus=
e the channel without calling `dmaengine_slave_config()` again.

Pre-existing issues:
- [High] State updates in `dw_edma_abort_interrupt` are performed outside t=
he channel lock, creating a data race that can permanently stall the channe=
l.
- [High] `dw_edma_device_pause` and `dw_edma_device_resume` read and modify=
 channel state variables without acquiring `chan->vc.lock`.
--

--- Patch [2]: [PATCH v3 2/9] dmaengine: dw-edma: Terminate all descriptors=
 without callbacks ---
commit ca03488a0b49733d1020ab17fdc7c52f079bfb7c
Author: Koichiro Den <den@valinux.co.jp>

dmaengine: dw-edma: Terminate all descriptors without callbacks

This commit changes the termination behavior of the dw-edma driver. It
moves all issued and submitted descriptors to the terminated list without
scheduling callbacks when termination completes. It also introduces
dw_edma_device_synchronize() to wait for channel termination.

> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-=
edma-core.c
> index 89a4c498a17b8..44ef5fbe3fd4a 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c
[ ... ]
> @@ -306,20 +336,25 @@ static int dw_edma_device_resume(struct dma_chan *d=
chan)

[Severity: High]
This is a pre-existing issue, but does dw_edma_device_pause() and
dw_edma_device_resume() have a data race?

In drivers/dma/dw-edma/dw-edma-core.c:dw_edma_device_pause():

	if (!chan->configured)
		err =3D -EPERM;
	else if (chan->status !=3D EDMA_ST_BUSY)
		err =3D -EPERM;
	else if (chan->request !=3D EDMA_REQ_NONE)
		err =3D -EPERM;
	else
		chan->request =3D EDMA_REQ_PAUSE;

These functions read and modify chan->status and chan->request without
acquiring chan->vc.lock. If device_pause() runs concurrently with an
interrupt completing a transfer, it might overwrite chan->request to
EDMA_REQ_PAUSE on an already idle channel, preventing new transfers from
starting.

Similarly, device_resume() calls dw_edma_start_transfer() which manipulates
virt-dma lists without synchronization.

>  static int dw_edma_device_terminate_all(struct dma_chan *dchan)
>  {
[ ... ]
> @@ -698,7 +733,9 @@ static void dw_edma_abort_interrupt(struct dw_edma_ch=
an *chan)
> =20
>  	spin_lock_irqsave(&chan->vc.lock, flags);
>  	vd =3D vchan_next_desc(&chan->vc);
> -	if (vd) {
> +	if (vd && chan->request =3D=3D EDMA_REQ_STOP) {
> +		dw_edma_terminate_all_descs(chan);
> +	} else if (vd) {
>  		dw_hdma_set_callback_result(vd, DMA_TRANS_ABORTED);
>  		list_del(&vd->node);
>  		vchan_cookie_complete(vd);

[Severity: High]
This is a pre-existing issue, but can this sequence permanently stall the
channel?

The end of dw_edma_abort_interrupt() looks like this:

	spin_unlock_irqrestore(&chan->vc.lock, flags);
	chan->request =3D EDMA_REQ_NONE;
	chan->status =3D EDMA_ST_IDLE;
}

Because chan->request and chan->status are updated after releasing
chan->vc.lock, a concurrent client completion callback could queue a new
descriptor and call dma_async_issue_pending().

The issue_pending() call would acquire the lock, observe the stale
chan->status (e.g. EDMA_ST_BUSY), and fail to start the hardware. The
interrupt handler then unconditionally writes EDMA_ST_IDLE, leaving the
hardware idle while the descriptor is stuck in the desc_issued list.

[ ... ]
> @@ -856,21 +893,48 @@ static int dw_edma_alloc_chan_resources(struct dma_=
chan *dchan)
>  	return 0;
>  }
> =20
> -static void dw_edma_free_chan_resources(struct dma_chan *dchan)
> +static void dw_edma_wait_termination(struct dma_chan *dchan)
>  {
> +	struct dw_edma_chan *chan =3D dchan2dw_edma_chan(dchan);
>  	unsigned long timeout =3D jiffies + msecs_to_jiffies(5000);
> -	int ret;
> +	unsigned long flags;
> +	bool configured =3D true;
> =20
> +	/*
> +	 * dw_edma_device_terminate_all() may defer cleanup to a later interrupt
> +	 * while the channel is still running. Retry until the channel is
> +	 * deconfigured, which means termination is complete.
> +	 */
>  	while (time_before(jiffies, timeout)) {
> -		ret =3D dw_edma_device_terminate_all(dchan);
> -		if (!ret)
> -			break;
> +		dw_edma_device_terminate_all(dchan);
> =20
> -		if (time_after_eq(jiffies, timeout))
> +		spin_lock_irqsave(&chan->vc.lock, flags);
> +		configured =3D chan->configured;
> +		spin_unlock_irqrestore(&chan->vc.lock, flags);
> +		if (!configured)
>  			return;
> =20

[Severity: High]
Will this break generic dmaengine clients?

The loop in dw_edma_wait_termination() forces the channel to become
unconfigured by polling dw_edma_device_terminate_all() until
chan->configured is set to false.

However, dw_edma_wait_termination() is called by dw_edma_device_synchronize=
().
Generic dmaengine clients expect the channel configuration to persist across
dmaengine_terminate_sync(). Because this explicitly clears the configuratio=
n,
subsequent dmaengine_prep_* calls from generic clients will return NULL
and fail.

> -		cpu_relax();
> +		usleep_range(1000, 2000);
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715175740.1110=
404-1-den@valinux.co.jp?part=3D2
