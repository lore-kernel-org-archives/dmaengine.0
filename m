Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941562D7386
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 09:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784797769; cv=none; b=GDmZhBpDdynvtteXkvkkAAaugNBDUOyuHknQYvJcashbQjQ1ODg3XQ+dp//A82Vl85G1p98NtkBVM0LhJSS2CaTCdi9wfahO/oZ/CHXMhbrfE1iG0ljXJ2ekcKW40Ju/HYEWpYL/0uly5Sl0KoLIkRp74Mh65Qj+hfK24a1w0qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784797769; c=relaxed/simple;
	bh=VMrQUGlkfnVMzmmN73HMzNIAEzF8ZZ2dYSmdsDodGs0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uwTVy6qslTrZnLyj2MZo6oBSVfWu57FI82z/D8dPl2MaWunNIEUEgrBFT2L2Ex0AxdpLP+S9RAUiEem5OoSl87HPnPD+QiV0pczHCrE8jRrU/8EP+N/4BaR9GJ0riJKK4PPV6tq7fkxv3brBbDDP7U2dQ1SZpV2pe0kr8uCVYdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O2M3f3UY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O2M3f3UY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07D331F000E9;
	Thu, 23 Jul 2026 09:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784797768;
	bh=r3upOC15Fc9fWjWLyQW+na6wU8AxWZ4IUZvvhca4r6U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O2M3f3UY9Z9eCRk1GazK5UfbQc7BsF8L+k09hBIkqcq921Q8iAKXGGSslxe13dJlw
	 t/9UIfcQsgtmnGOyQvWHwUe/fFW8ChirgAWHRBKzMRHblmeZ62eNpjkJjCt6UiEiWr
	 CIQmaPu3rC3uW/sUDnMQX97IOKDtm+SPS07mfZ749hjoZjQgM9IwxGMQjhm8nY1DZF
	 KGWQUGokVsRy2TiXAHcip/vjvTJJmYRZGENYMWdwRmeGH0AoFhRf+0fYqU5H3Uggp6
	 rghkf9mavO/UNbEUOrm9pJL2tlgcJsmcTCUXtLqucL5n/Oo2T0/EXDHmU3XxYN7O+E
	 wFpPpODfNLuNg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 08/19] dmaengine: dw-edma: Centralize LL doorbell
 decisions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260723084150.521366-9-den@valinux.co.jp>
References: <20260723084150.521366-1-den@valinux.co.jp>
 <20260723084150.521366-9-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 09:09:26 +0000
Message-Id: <20260723090928.07D331F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] A Time-of-Check to Time-of-Use (TOCTOU) race when reading the hard=
ware status can permanently stall the DMA channel.

Pre-existing issues:
- [High] DMA structures allocated with devm_ are freed before clients relea=
se their references, causing a Use-After-Free (UAF).
--

--- Patch [8]: [PATCH v2 08/19] dmaengine: dw-edma: Centralize LL doorbell =
decisions ---
commit d0e41965abfce0d50ea05e24f3f479e6cabd8ab0
Author: Koichiro Den <den@valinux.co.jp>

dmaengine: dw-edma: Centralize LL doorbell decisions

LL fill currently rings the doorbell every time. A running eDMA or HDMA
channel follows entries whose CB matches CCS without another kick. A
channel stopped at a CB mismatch needs one.

Move that decision to dw_edma_core_ch_maybe_doorbell(). It rings only for
a BUSY LL channel with pending entries, no EDMA_REQ_STOP or
EDMA_REQ_PAUSE, and hardware that is not running. The BUSY check prevents
EDMA_REQ_STOP completion from restarting terminated work.

issue_pending() still publishes LL entries only from IDLE. A later patch
allows live appends. Non-LL channels are unchanged.

> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-=
edma-core.c
> index 1f893dc54c793..e88bfb417ad4a 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c
[ ... ]
> @@ -150,6 +235,23 @@ static void dw_edma_terminate_all_descs(struct dw_ed=
ma_chan *chan)
>  	dw_edma_terminate_vdesc_list(&chan->vc.desc_submitted);
>  }
> =20
> +/* Must be called with vc.lock held. */
> +static void dw_edma_core_ch_maybe_doorbell(struct dw_edma_chan *chan)
> +{
> +	if (chan->non_ll || chan->request !=3D EDMA_REQ_NONE ||
> +	    chan->status !=3D EDMA_ST_BUSY || !dw_edma_ll_pending(chan))
> +		return;
> +
> +	/*
> +	 * While running, both legacy eDMA and HDMA consume newly published
> +	 * elements without another doorbell.
> +	 */
> +	if (dw_edma_core_ch_status(chan) =3D=3D DMA_IN_PROGRESS)
> +		return;

[Severity: High]
Is there a time-of-check to time-of-use regression here that can permanently
stall the channel?

If the hardware fetches a descriptor just before the software updates it,
it sees a cycle bit mismatch and begins transitioning to DMA_COMPLETE.

If dw_edma_core_ch_status(chan) reads the status during this transition,
it sees DMA_IN_PROGRESS and incorrectly skips ringing the doorbell.

If the hardware stops on an element without the local interrupt enable
bit, no interrupt is raised. Because the doorbell was skipped, the channel
never resumes.

> +
> +	dw_edma_core_ch_doorbell(chan);
> +}
> +
[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but are the dma structures
vulnerable to a use-after-free when a client holds a reference during
device removal?

The structures are allocated using devm_kzalloc() in dw_edma_probe():

drivers/dma/dw-edma/dw-edma-core.c:dw_edma_probe() {
	...
	dw =3D devm_kzalloc(dev, sizeof(*dw), GFP_KERNEL);
	if (!dw)
		return -ENOMEM;
	...
}

During removal, dma_async_device_unregister() is called but does not wait
for clients to drop references before devres frees the memory:

drivers/dma/dw-edma/dw-edma-core.c:dw_edma_remove() {
	...
	/* Deregister eDMA device */
	dma_async_device_unregister(&dw->dma);
	...
}

If a client later drops its reference, dw_edma_free_chan_resources() is
called on the already freed memory:

drivers/dma/dw-edma/dw-edma-core.c:dw_edma_free_chan_resources() {
	struct dw_edma_chan *chan =3D dchan2dw_edma_chan(dchan);
	...
}

Could the memory be improperly tied to the device's devres lifecycle
instead of using explicit lifecycle management (like a kref) or the dma
engine's device_release callback?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723084150.5213=
66-1-den@valinux.co.jp?part=3D8
