Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18A74C77CA
	for <dmaengine@vger.kernel.org>; Wed, 29 Jul 2026 14:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785336673; cv=none; b=EkQEuXA24K1KDG7ndemDayn1Yn1BtiuIbZNiMDo09p055umhNQkIe8zV40PDidO/eg1gyUs2Z1Lmhox0w9P0CPsBMTh0QL52oqC7M/0dY2uJ3RysO0a2OOlgAHziidYBt+N/EPJ3oyIuyffUj8ZzJV7zh3NVEdJXcrNp3V5BS+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785336673; c=relaxed/simple;
	bh=GLks2J742vmsyE1qrsOwoFfqPj9ftaOyj6YVHxdzMCk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IQ7AGWL1ZjCVrRPCB8si4LupdDc6MiNY3td3VfqGuz2kEotzujpjghQmx5OCXaE95kfu5Tk2NLQE/az5/ykKnRbRamFlpg52DjYBC8N3ONQnodRNrpueCzGqulTdNhMzxm59BojEfn15dSIKJhe1JwV7y74B9WeIL8BNa9wEh5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eQTDyeSi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eQTDyeSi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFE281F00A3E;
	Wed, 29 Jul 2026 14:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785336669;
	bh=quxQMQxHoqLY5Xk7WKkLH6zSIu1dwN7+7OpBil6tB1k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eQTDyeSiNyKpQs0zSCct3bIw26uCanZBDmaKCvuZF1aSxSAQ17kU4Pt3k6Qcb2bqO
	 nJbp1W7XHcpAPmSBzO6SUtCe9ABMBBUn/JM5c8jIajk7fbVRVsI9A4V4ladS9Z5FAG
	 MCixVAbg1ch6rPu95GAebHWnMPdgq2VWobPDTf1aiKrDODxq5RtaxM1gvO1rsIlRFf
	 uWRG7Xz89xo8w9mphg4Qp3llW3L3G87xqZ3Woz+Y7LGDzsszmYgBQCnF8m9vbpOmUW
	 k4/jrJLH/fO4LQXiow54XheUtiihU+g970nYr0pScJskSGFmSwTrc5rYwkMGMIdUNJ
	 k+6tnVhKjS2Ug==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 11/24] dmaengine: dw-edma: Serialize LL event capture
 with channel kicks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260729143036.3087722-12-den@valinux.co.jp>
References: <20260729143036.3087722-1-den@valinux.co.jp>
 <20260729143036.3087722-12-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 14:51:08 +0000
Message-Id: <20260729145108.CFE281F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Ringing the doorbell can race with a hardware interrupt, clearing =
and permanently losing a pending DMA completion event.
--

--- Patch [11]: [PATCH v4 11/24] dmaengine: dw-edma: Serialize LL event cap=
ture with channel kicks ---
commit 56231794b3b46dd52a7c7f61f0def40f1fed9890
Author: Koichiro Den <den@valinux.co.jp>

dmaengine: dw-edma: Serialize LL event capture with channel kicks
   =20
This commit introduces an event lock to serialize interrupt status reads,
clears, snapshot recording, and LL doorbell writes. It aims to prevent a
deferred handler from applying an event from a previous hardware run when a
doorbell starts a new run in between.

> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-=
edma-core.c
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c

[ ... ]

> @@ -269,6 +317,17 @@ static void dw_edma_core_ll_sync(struct dw_edma_chan=
 *chan)
>  static void dw_edma_core_ch_doorbell(struct dw_edma_chan *chan)
>  {
>  	dw_edma_core_ll_sync(chan);
> +
> +	guard(spinlock_irqsave)(dw_edma_event_lock(chan));
> +
> +	/*
> +	 * A recorded event belongs to the current ring and must be consumed
> +	 * before starting another hardware run.
> +	 */
> +	if (chan->ll_irq.event !=3D DW_EDMA_LL_EVENT_NONE)
> +		return;
> +
> +	dw_edma_ll_event_discard_locked(chan);

[Severity: High]
Can this race with a hardware interrupt and permanently lose a completion e=
vent?

If dw_edma_core_ch_doorbell() is called (for example, when appending
descriptors to a running channel) exactly when the hardware finishes a burst
and asserts an interrupt, but before the hardirq handler can run,
chan->ll_irq.event will still be DW_EDMA_LL_EVENT_NONE.

The code will bypass the early return and unconditionally call
dw_edma_ll_event_discard_locked(), which clears the hardware interrupt
status.

Does this result in the interrupt being completely lost? If so, the software
state will permanently trail the hardware, which would cause the DMA channel
to stall indefinitely.

>  	dw_edma_core_do_ch_doorbell(chan);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729143036.3087=
722-1-den@valinux.co.jp?part=3D11
