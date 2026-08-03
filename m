Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B5040DB44
	for <dmaengine@vger.kernel.org>; Mon,  3 Aug 2026 13:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785764492; cv=none; b=blrN5GxKFu+TwQxBnwsiLDV4YUTO0JoNg/I1vT3NEqjkBZVutJ4vIXXOGrymvBFVdjOCuQxYkvG9bOJ7u77p8OjirGJnxeqpDbDgYE0yZLrjvgm2rW2Ckq7px/tZenBMBOAwcxTR4rBTv0wdWNkyaheZgDKBKlinU/eYNAdWOLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785764492; c=relaxed/simple;
	bh=IdN9LV+mfolkNdeYcZ4TCD/x7ODfBSwgsrgjwlEau6M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RyspTAk+f/4tWUD5ECWLvbGt5jMIFXQOYQlzIwmKO1cUPhQqSGQRgwXGuHtttlg2Cb0aefksMpiPT01uFR3aMONPTIMfD522nmWpSqS2UbfUjEfb0gtmB3nZSBsz1sYse+UDAmcLSQ88I/PATMe9vavpRCpbHwu0bJpcXPJ9k2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FyWCbnR5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FyWCbnR5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8735E1F00A3A;
	Mon,  3 Aug 2026 13:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785764490;
	bh=jHyRUQkthz+dYQv47OH5B8qYgMbXnFxZUkJVI84vRzU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FyWCbnR5P+NNsDBofA0FtLHw87xSSqbL7eYyHRIPl85nc00CySrIa8OzKe6qxqnpl
	 pli1mtDenoTN5f5ttEXvpdIcAuASdoMUY+lRlxdOwGj63BqMi+vHl3fGpbWA4NCvFX
	 BdM0Eo1l1p+lot3Knq09dkwMULFcNrWts98P55VL0f7SHGgAmuQ0IvW1nAQemfKqG9
	 JQBdQ4mlQ9s8H+OfIAUAYWdZW0R6Vo3mXAXmXA8MmrtmsS0AVlfUX7nM5T5MIhr3ew
	 LeEqNBFwFtlGbOLsHTQi4NG/Ul48biuIky/d7mJ/pnA0Qa88opzNsOmFmmKjggiPJ4
	 4pNInEzZx9kzA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: xilinx_dma: Use readl_poll_timeout() instead
 of atomic variant
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260803-xilinx-dma-poll-fix-v1-1-892302c4847d@ideasonboard.com>
References: <20260803-xilinx-dma-poll-fix-v1-1-892302c4847d@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 13:41:28 +0000
Message-Id: <20260803134129.8735E1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The patch replaces `readl_poll_timeout_atomic()` with `readl_poll_=
timeout()` in an atomic context, violating the `iopoll.h` API contract and =
introducing a risk of infinite loops and severe latency.
--

--- Patch [1]: [PATCH] dmaengine: xilinx_dma: Use readl_poll_timeout() inst=
ead of atomic variant ---
commit f549bf1ac3f30db8e280af9c3f9f7f1f4d4ac1b5
Author: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

dmaengine: xilinx_dma: Use readl_poll_timeout() instead of atomic variant

This commit switches xilinx_dma_poll_timeout() from the atomic to the
regular readl_poll_timeout() macro. The commit message states that this
is safe because zero delay means it never sleeps.

> Calling xilinx_dma_poll_timeout() from atomic context is still safe even
> after this change, as readl_poll_timeout() with zero delay never sleeps.

> diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_=
dma.c
> --- a/drivers/dma/xilinx/xilinx_dma.c
> +++ b/drivers/dma/xilinx/xilinx_dma.c
> @@ -530,7 +530,7 @@ struct xilinx_dma_device {
>  #define to_dma_tx_descriptor(tx) \
>  	container_of(tx, struct xilinx_dma_tx_descriptor, async_tx)
>  #define xilinx_dma_poll_timeout(chan, reg, val, cond, delay_us, timeout_=
us) \
> -	readl_poll_timeout_atomic(chan->xdev->regs + chan->ctrl_offset + reg, \
> +	readl_poll_timeout(chan->xdev->regs + chan->ctrl_offset + reg, \
>  				  val, cond, delay_us, timeout_us)

[Severity: High]
Is the assertion in the commit message accurate for all hardware
configurations, or could this regression lead to a hard lockup during DMA
transfers or error resets?

While it is true that readl_poll_timeout() does not sleep with a zero delay,
it still relies on ktime_get() for timekeeping. The API documentation in
iopoll.h explicitly forbids calling readl_poll_timeout() from atomic context
if timeout_us is used.

This macro is called with interrupts disabled in multiple paths. For exampl=
e,
xilinx_dma_issue_pending() calls start_transfer() under spin_lock_irqsave(),
and the irq handler also calls it under a spinlock:

drivers/dma/xilinx/xilinx_dma.c:xilinx_dma_irq_handler() {
        ...
        spin_lock(&chan->lock);
        xilinx_dma_complete_descriptor(chan);
        chan->idle =3D true;
        chan->start_transfer(chan);
        ...
}

If ktime_get() relies on timer interrupts to advance the clock on certain
hardware configurations, and those interrupts are disabled, would this cause
the polling loop to hang indefinitely if the hardware condition is never me=
t?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-xilinx-dma=
-poll-fix-v1-1-892302c4847d@ideasonboard.com?part=3D1
