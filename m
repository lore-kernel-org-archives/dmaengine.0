Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4223D6487
	for <dmaengine@vger.kernel.org>; Sat, 18 Jul 2026 14:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784386114; cv=none; b=NDEn7Z2jJ4MVwmDv1XtqbBQTsidMlQ1TGtssA/12I7cmswb2xPH+tkWemF9P8bNfLrAPU0mTulDQuH1hJvsB6JxGRtyf5lird/fyawxuhtb2cXjXwEH8XxZIy/YeG2g+wy+TMu8ElPdLfWdT2KcboQmFDYyTxcwzQwLJZ12HaCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784386114; c=relaxed/simple;
	bh=ANAqmZEHBjOnqn3MPUHeqYh/aiTdAd6QWochNmYMtfI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nKgIFjybx5YetYu2pi9ss0ke3IIi/RDqqvSiFc4bJFQul7hJLAftkRL3rvC1//RyMjHFMZFInfgxNUNVkaawP4lxNhyyS6zUBZdaYKyE7+jK9WvFMUF6QUtpBseLFlk+8qXZEqGrsKERkyjTXyIwWi6T6Ts0N8tx8M+gjXAIkOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZhW5cOnc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZhW5cOnc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF3981F000E9;
	Sat, 18 Jul 2026 14:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784386111;
	bh=MpbUtkmwE88AYUwRIbbecIBHidpysrx7jLNmP3L0/0Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZhW5cOnczdCxPSEDLrhyBeZ6wa8FH+W7bUpQglry+ZdeZEI36Ad23zhhJZ69TYDvt
	 AatApS1cmyP2ROXDJgLkAOSdiZ6ZEF93oNLri90VAlzKuHca/Bn6bZDNpbarTrUpNV
	 qJK9A9nY9Z7tGOM47i7rfNE8Opz0WRb55VDE5I3B+O6hrw7WTLKQHeASmyCBtPJRzI
	 8obj+BCln09V05nrnsy+oLGNDhJVJEoYlH9nJYsimS9nnmHzJHxkFRQsU9bXSn9xpQ
	 jQtNJwhALeWqV9ggMrHloGcko0Rq4iVq/B7waQqRgXjh4xIP4HnAFnfHXKwsUJzqgp
	 YecVyA85cSJ8Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: switchtec-dma: preserve results for
 out-of-order completions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hao-Qun Huang" <alvinhuang0603@gmail.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260718223257.5662.alvinhuang0603@gmail.com>
References: <20260718223257.5662.alvinhuang0603@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 18 Jul 2026 14:48:30 +0000
Message-Id: <20260718144830.EF3981F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Race condition on the first ring traversal can cause premature com=
pletion of in-flight DMA descriptors.
- [High] Descriptor hardware control flags accumulate across reuse.
- [High] Invoking client callbacks while holding `complete_lock` causes a d=
eadlock if the client calls `dmaengine_tx_status`.
- [Medium] Memory leak of descriptor rings on error path during channel res=
ource allocation.
--

--- Patch [1]: [PATCH] dmaengine: switchtec-dma: preserve results for out-o=
f-order completions ---
commit 4a9da15cea6ee54c832c41e3ac56d3a47db7138d
Author: Hao-Qun Huang <alvinhuang0603@gmail.com>

dmaengine: switchtec-dma: preserve results for out-of-order completions

This patch modifies the driver to store the transfer result within each
descriptor rather than on the stack. Passing the descriptor's own saved
result prevents out-of-order completions from assigning incorrect status
and residue values when retiring a batch of descriptors.

> diff --git a/drivers/dma/switchtec_dma.c b/drivers/dma/switchtec_dma.c
> index 3ef9286406159..681540836e73d 100644
> --- a/drivers/dma/switchtec_dma.c
> +++ b/drivers/dma/switchtec_dma.c

[ ... ]

> @@ -488,7 +488,7 @@ switchtec_dma_cleanup_completed(struct switchtec_dma_=
chan *swdma_chan)
>  		do {
>  			dma_cookie_complete(&desc->txd);
>  			dma_descriptor_unmap(&desc->txd);
> -			dmaengine_desc_get_callback_invoke(&desc->txd, &res);
> +			dmaengine_desc_get_callback_invoke(&desc->txd, &desc->result);

[Severity: High]
This is a pre-existing issue, but does invoking the client callback here
while holding complete_lock cause a deadlock if the client queries status?

Looking at switchtec_dma_tx_status(), it unconditionally calls
switchtec_dma_cleanup_completed(), which attempts to acquire
complete_lock. If a client callback invokes dmaengine_tx_status(), it
would trigger a self-deadlock since the non-recursive lock is already
held.

>  			desc->txd.callback =3D NULL;
>  			desc->txd.callback_result =3D NULL;
>  			desc->completed =3D false;

[Severity: High]
This is a pre-existing issue, but could this loop prematurely complete
in-flight DMA descriptors due to a race condition?

In switchtec_dma_alloc_desc(), descriptors are initialized with
desc->completed =3D true.

Concurrently, if the submission thread calls switchtec_dma_prep_desc()
(setting desc->completed =3D false) and updates swdma_chan->head, could the
consumer thread evaluate the loop-exit condition without a read memory
barrier:

switchtec_dma_cleanup_completed() {
    ...
        if (!desc->completed)
            break;
    } while (CIRC_CNT(READ_ONCE(swdma_chan->head), swdma_chan->tail,
                      SWITCHTEC_DMA_SQ_SIZE));
}

and see a stale true state for desc->completed alongside an updated head
state, erroneously completing a newly submitted descriptor?

[ ... ]

[Severity: Medium]
This is a pre-existing issue, but does this error path leak the allocated
descriptor rings?

If device_alloc_chan_resources() fails, the dmaengine core does not invoke
device_free_chan_resources(). In switchtec_dma_alloc_chan_resources():

switchtec_dma_alloc_chan_resources() {
    ...
    rc =3D switchtec_dma_alloc_desc(swdma_chan);
    if (rc)
        return rc;

    rc =3D enable_channel(swdma_chan);
    if (rc)
        return rc;
    ...
}

The function returns directly without freeing the memory allocated by
switchtec_dma_alloc_desc().


[Severity: High]
This is a pre-existing issue, but do the hardware control flags accumulate
across descriptor reuse?

In switchtec_dma_prep_desc(), flags are conditionally added:

switchtec_dma_prep_desc() {
    ...
    if (flags & DMA_PREP_INTERRUPT)
        desc->hw->ctrl |=3D SWITCHTEC_SE_LIOF;

    if (flags & DMA_PREP_FENCE)
        desc->hw->ctrl |=3D SWITCHTEC_SE_BRR;
    ...
}

Because the descriptor slots are recycled and the flags are never cleared,
a new transfer prepared without DMA_PREP_INTERRUPT could inappropriately
trigger an interrupt if the recycled descriptor slot previously had it set.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260718223257.5662=
.alvinhuang0603@gmail.com?part=3D1
