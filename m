Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB3A30D405
	for <dmaengine@vger.kernel.org>; Thu, 16 Jul 2026 15:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784216526; cv=none; b=AGXOxPjg+lPxbXK+lQTpZ31s9S8TIxd/+cDbxi6CHq5zHelKvayHOwNLL8FuXZCP/k3MWl9waeqQJ+mDPoRC0ury/6ow+hOzyK3Sh8Yi3KftRSHrc0GwcEtYrduUnWud/L72CeczUctV7x02CcD2oHITUFpeedW9MP1ZEc+Hjng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784216526; c=relaxed/simple;
	bh=uu2k2VZNMzjQIMiL+PP9LL7PxdAKYIjIUpa6hEBattk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=N6Zd5VZ0yIqhR99xmxD598od73G1kHNVVh78hH8hVVZ8Kz8KmdAj+y0ILK1hnVy8NaKZ+ds4xW6f3Nj1G/D8ZK8VXbXY7C22YNT3D/gbE3meuM58cqzEUFTyyk8AjuEISfZtAfQYlV6z5VzlizcOJ+2U0ToINzZfBi/OF3O8USs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZFHAEtZ2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZFHAEtZ2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFD5E1F000E9;
	Thu, 16 Jul 2026 15:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784216525;
	bh=/gIYvC6ahd0Y60EjtcKajecCji6PeehfSNkPm1QBNYE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZFHAEtZ2HH3vApbuajEzDdDqvDopePW+8OQJ1ZozfQXfIs/8vTXKhkL6y4E9R3Nnu
	 eAxAqn5bOhFW4MKBerBpnSwMQig+RoWn8EkqOMB1HGuzWNYr+9cBhnksrM3NRQ8yxf
	 kF8wnI2/eLQhm8bpC+oeQMv7p379SjnyC/9Enmyn9KQ5u01Ve8Nl1Oi44f/TaYf10e
	 v6U/IDBe4Gjcd3w0aVwNKXBJ04ic8X7UZlFEw+yTiQm2ejKXwxNS/BQerpQc5Us2oB
	 ocTh67fJjIC3XtlmJyw3mvC8YbHPWOaCO7+rzqXlcDoa90sFM57qcs48gK9EOD/NAd
	 gw/d17lnUbnIw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/9] dmaengine: dw-edma: Terminate all descriptors
 without callbacks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: dmaengine@vger.kernel.org, Frank.Li@kernel.org, vkoul@kernel.org
In-Reply-To: <20260716152503.1747922-3-den@valinux.co.jp>
References: <20260716152503.1747922-1-den@valinux.co.jp>
 <20260716152503.1747922-3-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 15:42:04 +0000
Message-Id: <20260716154204.AFD5E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] If channel termination times out, the channel state becomes perman=
ently wedged in BUSY, rendering it unusable.

Pre-existing issues:
- [High] Pre-existing missing locking in `dw_edma_device_pause()` causes da=
ta races with interrupt handlers.
--

--- Patch [2]: [PATCH v4 2/9] dmaengine: dw-edma: Terminate all descriptors=
 without callbacks ---
commit 9db3cc9880b9ba6f4fe534fd17ede7df5d2a503f
Author: Koichiro Den <den@valinux.co.jp>

dmaengine: dw-edma: Terminate all descriptors without callbacks

This commit moves all issued and submitted descriptors to the terminated
list when termination completes. It also introduces a wait for pending
STOPs before releasing resources to prevent late callbacks from
dereferencing freed client state.

> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-=
edma-core.c
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c
> @@ -673,8 +705,7 @@ static void dw_edma_done_interrupt(struct dw_edma_cha=
n *chan)
>  			break;
> =20
>  		case EDMA_REQ_STOP:
> -			list_del(&vd->node);
> -			vchan_cookie_complete(vd);
> +			dw_edma_terminate_all_descs(chan);
>  			chan->request =3D EDMA_REQ_NONE;
>  			chan->status =3D EDMA_ST_IDLE;
>  			break;

[Severity: High]
This is a pre-existing issue, but can dw_edma_device_pause() race with
the interrupt handler and wedge the channel?

dw_edma_device_pause() modifies chan->request and chan->status locklessly.

If it races with dw_edma_done_interrupt() (which holds the lock and sets
chan->status =3D EDMA_ST_IDLE here), dw_edma_device_pause() can concurrently
set chan->request =3D EDMA_REQ_PAUSE on an IDLE channel.

This leaves the channel in a state where dw_edma_device_resume() returns
-EPERM because it expects EDMA_ST_PAUSE, and dw_edma_device_issue_pending()
ignores it because chan->request is not EDMA_REQ_NONE, permanently
breaking the channel.

[ ... ]

> +static void dw_edma_free_chan_resources(struct dma_chan *dchan)
> +{
> +	struct dw_edma_chan *chan =3D dchan2dw_edma_chan(dchan);
> +
> +	dw_edma_device_terminate_all(dchan);
> +	dw_edma_device_synchronize(dchan);
> +
> +	scoped_guard(spinlock_irqsave, &chan->vc.lock)
> +		chan->configured =3D false;
> +
> +	vchan_free_chan_resources(&chan->vc);
>  }

[Severity: High]
If dw_edma_wait_termination() (called via dw_edma_device_synchronize)
times out, does the channel become permanently wedged in a BUSY state?

If the hardware fails to respond within 5 seconds, the timeout returns and
vchan_free_chan_resources() clears all descriptors.

If the hardware eventually finishes and raises a deferred DONE interrupt,
dw_edma_done_interrupt() is called. Because the descriptors were already
freed, vchan_next_desc() returns NULL.

Since the state reset logic (setting chan->request =3D EDMA_REQ_NONE and
chan->status =3D EDMA_ST_IDLE) is nested inside the if (vd) check in
dw_edma_done_interrupt(), it is completely skipped. This leaves the channel
stuck in EDMA_ST_BUSY and causes future dw_edma_alloc_chan_resources()
calls to fail with -EBUSY.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716152503.1747=
922-1-den@valinux.co.jp?part=3D2
