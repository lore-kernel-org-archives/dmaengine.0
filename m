Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E497745D5C7
	for <dmaengine@vger.kernel.org>; Wed, 29 Jul 2026 14:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785336416; cv=none; b=oPjxMQLao0c4k1/Lb8RNPmhMIlsQoPx5XpIPumvSuLgLdvOx2fla4zUjiFHuweiFSpnCyvhkNAKDKsNdYkqDMc+A8RMr3dUc+7JCNM+0fsgHX4HXxssM6NLoqfvXOF40IvYRUyt0RuLMKsInMF+MhM7jAzUQ82lc8KQ1VZZAt/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785336416; c=relaxed/simple;
	bh=XzmsX+PPinf28969Skf1dLWoE7WD8IxSa/q3LEFKyZA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KZrA2zcSnvHbD1bVP4TCQualXMWF0OPOnLfmTxjgbCjSVzYfOsIHLFPfX5uv4RFdVAo/fMU/b0aSsEZXpF7UEcUeg0rIfgsBUEecFBm4IWW6A078CuGFMoZb3j7otsT3UnzgvMdK8H5D0O2rTOpVacQxD0aSJfX1eKfqEbUdEW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WxNvDMCo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WxNvDMCo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D3831F000E9;
	Wed, 29 Jul 2026 14:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785336414;
	bh=omfLcjixWnrZlDjcNn2IlIdnnIpQ1/H6lIGEBjw7+js=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WxNvDMCopC5cMK4/XbPMDx/IA2gYXgWVISXPtTmc3Z2FH9ASOTvgbO90x09EP4maW
	 ow/zl0mkDIcomSGeT079lwPN2+Y/9m9pKLGJXQ3Avt4pyC9Bvc2wxQcjIsrZ2ARHQ9
	 IA0Z+gFyUjGkhLyO3pVOF1cm8PLQ3lUPDu4mOEx0YwshMyve2cEXZ8Gl99va+kRvIL
	 yVUQwi1rvG58HtjWqFZd3m3m6r9Vx+ExDyEJsmPn+KYyGuyLLhILbkubPY5KKrV+xR
	 Zorr2oFoQmYuRn85lyM2FB2sAyJ+XCXoFYGKbzLFS3YCGMfL8xpFZD3GshqT+Wkidv
	 XZ40nAMUBlSTg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 15/24] dmaengine: dw-edma: Recheck stopped LL
 channels before restart
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260729143036.3087722-16-den@valinux.co.jp>
References: <20260729143036.3087722-1-den@valinux.co.jp>
 <20260729143036.3087722-16-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 14:46:53 +0000
Message-Id: <20260729144654.2D3831F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Double read of volatile `jiffies` variable without a snapshot lead=
s to a race condition where the timer delay can underflow, causing indefini=
te stalling.
--

--- Patch [15]: [PATCH v4 15/24] dmaengine: dw-edma: Recheck stopped LL cha=
nnels before restart ---
commit 9769569e17606605660b53b027f9a3d71abb5a3d
Author: Koichiro Den <den@valinux.co.jp>

dmaengine: dw-edma: Recheck stopped LL channels before restart

This commit introduces a delayed recheck mechanism for stopped LL channels.
It samples DMA_LLP again before restarting a stopped channel to reclaim
newly visible progress that might have been missed due to an interrupt race.

> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-=
edma-core.c
> index 16d3d2a8d1c26..0d1e6f48cac1d 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c

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
> +
> +	if (time_before(jiffies, chan->ll_recheck_at)) {
> +		delay =3D chan->ll_recheck_at - jiffies;

[Severity: High]
Could this code suffer from a race condition due to reading jiffies twice?

Since jiffies is volatile, the compiler will emit two separate memory loads.
If jiffies advances past chan->ll_recheck_at between the time_before()
check and the subtraction, delay will underflow to an extremely large
unsigned value. This would schedule the recheck work indefinitely far into
the future, potentially hanging the DMA channel.

Should jiffies be cached in a local variable (e.g., unsigned long now =3D
jiffies;) before the check to avoid this TOCTOU race?

> +		mod_delayed_work(chan->dw->wq, &chan->ll_recheck_work, delay);
> +		return;
> +	}
> +
> +	chan->ll_recheck_at =3D 0;
> +	if (chan->request =3D=3D EDMA_REQ_NONE)
> +		dw_edma_core_ch_maybe_doorbell(chan);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729143036.3087=
722-1-den@valinux.co.jp?part=3D15
