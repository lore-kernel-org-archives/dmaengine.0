Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694D440DB4F
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 09:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784797944; cv=none; b=cOkCIH3xxdoOSdsGtSBjwwQHND71HFSBfE/tfqL8lu61P/v5Z+UADowoSsvDp7awhZZbtPHEQL6+lwNtPjHyRBTOIHCW7M7eIXD0vSSNKVwuQ5JR11vyq9RqG+86/WRMp5UepxG7du84E/2T/mNNKBHpCMKppt4uyZgAPnaKbcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784797944; c=relaxed/simple;
	bh=5z5fQj1sY+cyB6plWJw2+RbAddAh2F2A/rw6fm8F2QA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=g35i5SpQcFvw/2E8cm/i4J4Gqn0q4OjDrD/edQ7PdhdF7nUoU6j7KF1comZXMKTHql+rZLjQu4kEEdfVR1mu7DL4Linn9vOle+TkqL738d+GpfPa/4mWVIySajwkOXeQU5/ArACH3nb8qJQgSmCX+slb4ucsaVYFrK+gKaPbJOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zx2B82DS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zx2B82DS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F35011F000E9;
	Thu, 23 Jul 2026 09:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784797943;
	bh=rb5A9tiOeD17c6foKYDC1bXF02JUOedX9iJrHf2n5L4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Zx2B82DSooDSZoqm/PJMNXu9KfNtwvTOMa1GRWnzZFDmwLVwlnxjPYJEvW+frs2Dh
	 jb5RV8JSbnMSp/i5/9scCnX8cO1ZERpNAPDeuI9qYdNoam9wAZjhV/K+1zC/LCwtGC
	 cdowg8MMVdryFRjBJQfj5VqF5/tZN9JsMqKuvj4Pwr3r7mc5eJEyXlnV6QqGPJ7JUh
	 94QoiR4lIeT/CHS8zbcZmplicMUOnjxLhcnTDklD1XjQZ0+EtMFnTtB35RUF7Mtppk
	 xN/+mS4U2MlTWeOaLTb8iIy5fKlM77qAYxzevjyD4aeIBHSs59KpffH1tDkk7DO77o
	 FAQShomZQLS/w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 17/19] dmaengine: dw-edma: Detect and recover a
 stalled eDMA engine
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260723084150.521366-18-den@valinux.co.jp>
References: <20260723084150.521366-1-den@valinux.co.jp>
 <20260723084150.521366-18-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 09:12:22 +0000
Message-Id: <20260723091222.F35011F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] A race condition in the channel stall recovery mechanism can leave=
 a channel permanently stalled because `queue_work()` is manually bypassed =
while `rec->active` is true during the worker's cleanup phase.
--

--- Patch [17]: [PATCH v2 17/19] dmaengine: dw-edma: Detect and recover a s=
talled eDMA engine ---
commit 9ca900fbc673ab7db9a251eb4f96dc2eddcf8833
Author: Koichiro Den <den@valinux.co.jp>

dmaengine: dw-edma: Detect and recover a stalled eDMA engine

This commit introduces a mechanism to detect and recover stalled legacy
eDMA engines. It adds a 30ms stall window during the doorbell path and
queues a recovery work if a channel stops making progress.

> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-=
edma-core.c
> index 14cd0038dbd27..1b9ba34b25c80 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c

[ ... ]

> @@ -183,11 +185,52 @@ static bool dw_edma_ll_advance(struct dw_edma_chan =
*chan, int idx, u32 *old_done
> =20
>  	*old_done =3D chan->ll_done;
>  	chan->ll_done =3D idx;
> +	chan->ll_stall_valid =3D false;
>  	chan->ll_recovery_pending =3D false;
> =20
>  	return true;
>  }
> =20
> +/*
> + * Called with vc.lock held for a stopped channel with LL work pending. =
Queue
> + * direction recovery if repeated doorbells show no progress for the sta=
ll
> + * timeout.
> + */
> +static void dw_edma_ll_stall_check(struct dw_edma_chan *chan)
> +{

[ ... ]

> +	if (!time_after(jiffies, chan->ll_stall_since +
> +			msecs_to_jiffies(DW_EDMA_LL_STALL_TIMEOUT_MS)))
> +		return;
> +
> +	rec =3D &chan->dw->eng_recovery[chan->dir];
> +	chan->ll_recovery_pending =3D true;
> +	if (!READ_ONCE(rec->active))
> +		queue_work(chan->dw->wq, &rec->work);
> +}

[Severity: High]
Does this custom active check bypass queue_work()'s built-in deduplication,
potentially leaving a channel permanently stalled?

In dw_edma_engine_recovery_release(), rec->active is still true when it
calls dw_edma_core_ch_maybe_doorbell() for all channels:

drivers/dma/dw-edma/dw-edma-core.c:dw_edma_engine_recovery_release() {
    ...
    for (i =3D 0; i < cnt; i++) {
        chan =3D &dw->chan[off + i];
        ...
        dw_edma_core_ch_maybe_doorbell(chan);
    }

    WRITE_ONCE(rec->active, false);
}

If another channel also stalled during the recovery wait, this sequence
would trigger dw_edma_ll_stall_check() while rec->active is still true.
The manual check here skips queue_work(), and when the release function
finishes by setting rec->active to false, no new worker is queued.

Since queue_work() already safely handles WORK_STRUCT_PENDING, could
this check be safely removed to ensure we don't drop recovery work?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723084150.5213=
66-1-den@valinux.co.jp?part=3D17
