Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B793BE16E
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 17:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785173840; cv=none; b=U6Nv+unYdyfV1QMiFVSYhqnXafP541IF6WM/lXsUNCuQA0zzTblHYF5ItQGlMI2XcD64bdqzYuKakTBv/kujHO+WFuKaR8pVP3Q9Mh9jbS4RbBrsIBxsvN2z6t8mCZDbaJ5CkeIlk/ypImvOTnSGmv4Pp1yn1Ve0FHSgIMCvCoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785173840; c=relaxed/simple;
	bh=6x8fcqRHaL8COF4E4KtDnjI1D7u1f5cGhUxvltHGm3k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=H5GAulOkje27+XJCoqb9BiYoV5eRNpvl8dQ6aHhuTGQu2Whp8+OIGP9fH9WtV0+JVuxHd9GyFv8aWVTXf+VbyF7CM9E1PedOt0OBYe1wynKyGbPjLCutk0STyX9QmFvTzV9GfWgS40jO/ZcYxABU2tINZghyYaEHsZjiwarprOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dmF0JQJr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dmF0JQJr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1588B1F000E9;
	Mon, 27 Jul 2026 17:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785173839;
	bh=x44gtBlKBDn2qQRMErGz6UcKuvNgmmIVm6/zVzWUns4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dmF0JQJrp7+HHltFjPtxkuW6RBkFaeJN9n8DK4lee/rNzu/z+ySWCtNibmnGYi4X6
	 S3obknuAeGDZbJApHE2FuROhWUO52CkruvD3blIppmE3EvkaxLKpjQm2bPKq1nN0eB
	 5X0yfy3Bn+RdIcKY7lUohbShSmfYPHYaJzkGO8+BcfgM79PNbrMMAIcLZpiNCQQc4Q
	 3t/QICCqJbnI9vxmaIdrgvRj0kieZ/7xxTdI8e/C8OsuXtGUkMKB7fYeagAlHNIO5v
	 XPNH9SSswopUv/8KqUWiB3c4p63pc+KVrQ6zaVPnojyEGTttCshAp2ODAT46XofPJ+
	 AgtCFdvpvUaOQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 23/24] dmaengine: dw-edma: Detect and recover a
 stalled eDMA engine
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260727170323.2321369-24-den@valinux.co.jp>
References: <20260727170323.2321369-1-den@valinux.co.jp>
 <20260727170323.2321369-24-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 17:37:18 +0000
Message-Id: <20260727173719.1588B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unkillable hang in dw_edma_wait_termination() if the engine fails =
to recover from a stall.
--

--- Patch [23]: [PATCH v3 23/24] dmaengine: dw-edma: Detect and recover a s=
talled eDMA engine ---
commit 8c110ba5f33df8c06f35fa69ddd95a9b7e7cab52
Author: Koichiro Den <den@valinux.co.jp>

dmaengine: dw-edma: Detect and recover a stalled eDMA engine

This commit introduces passive stall detection for write channels under
sustained multi-channel traffic. It reuses the bounded LL recheck and queue=
s a
recovery request if a channel remains stopped with no progress for 30 ms.

> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-=
edma-core.c
> index 56032137a4bb0..262ea893174f3 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c
[ ... ]
> @@ -291,6 +292,54 @@ static bool dw_edma_ll_pending(struct dw_edma_chan *=
chan)
>  	return chan->ll_head !=3D chan->ll_done;
>  }
> =20
[ ... ]
> +/*
> + * Called with vc.lock held for a stopped channel with LL work pending. =
Queue
> + * direction recovery if repeated doorbells show no progress for one rec=
heck
> + * interval.
> + */
> +static bool dw_edma_ll_stall_check(struct dw_edma_chan *chan)
> +{
> +	struct dw_edma_engine_recovery *rec;
> +
[ ... ]
> +	rec =3D &chan->dw->eng_recovery[chan->dir];
> +	chan->ll_recovery_pending =3D true;
> +	dw_edma_engine_recovery_queue(rec);

[Severity: High]
If the hardware stalls and the recovery work queued here fails to reset it,
can this lead to an unkillable hang later when the channel is freed?

Looking at dw_edma_engine_recovery_work(), if the maximum reset attempts are
reached, the worker exits without clearing chan->ll_recovering:

drivers/dma/dw-edma/dw-edma-core.c:dw_edma_engine_recovery_work() {
    ...
		if (++rec->fails >=3D DW_EDMA_ENGINE_RESET_MAX_FAILS) {
			dev_err(dw->chip->dev,
				"%s engine did not drain after %u attempts; leaving channels gated\n",
				dir_name, rec->fails);
			return;
		}
    ...
}

If chan->ll_recovering remains true, the doorbell logic aborts early and do=
es
not process the stop request when releasing the channel.=20

This causes dw_edma_wait_termination() to loop indefinitely because the loop
lacks a hard timeout break and the stop request is never cleared:

drivers/dma/dw-edma/dw-edma-core.c:dw_edma_wait_termination() {
    ...
	for (;;) {
		scoped_guard(spinlock_irqsave, &chan->vc.lock)
			stopping =3D chan->request =3D=3D EDMA_REQ_STOP;

		if (!stopping)
			return;

		if (time_after_eq(jiffies, timeout)) {
			dev_warn(chan->dw->chip->dev,
				 "timeout waiting for channel termination; still waiting\n");
			timeout =3D jiffies + msecs_to_jiffies(5000);
		}

		fsleep(1000);
	}
    ...
}

Could this result in an unkillable process hang when dw_edma_wait_terminati=
on()
polls indefinitely?

> +
> +	return false;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727170323.2321=
369-1-den@valinux.co.jp?part=3D23
