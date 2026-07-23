Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4213C40D565
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 08:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784797185; cv=none; b=CM+oYb08FtAbTXslE0zEITVy5+p8v/IJIZc7nBgO8Bv2TKRY9kCC6VOKuJWiMypBZpNeSok2m/skoQThFUqrCKt3Ou6W4nSB9ajuMA9V8del8jGw2WVIce+1P0+9t6lP59oVTrjqSkKq+WYfA3P6+ESl7Y+Z6f+g6Gm741aD/ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784797185; c=relaxed/simple;
	bh=GcsbUp1wH7GoERpKih+AQy43/GV0vY+Re/H1oiAVUkQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=l2FJ8VJS2NGhPAKKKHNDhPgPnNp6EOtRP2I0YpDdSd5B/ObDLOPQ8GWivgfp9mO8Qp4PXDsoIlQVv4FiKX4wf4x8fyDXIT1XKooY3TfEdOCctniJUX/V6U75OoqXp3lt85O1frgZq7k37jaDUp39ohiBVvLXPIEsCX9nSBq7UIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JJXCegpa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JJXCegpa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 134281F000E9;
	Thu, 23 Jul 2026 08:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784797182;
	bh=Wz69nYtkPXwUckLjiAgWARn+LDD1YYTyI9ePx+GPFsA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JJXCegpat0XVYW2cTaEGQ3SEb5hfV/RjeXPjq0cLzhpTqGXLvNc5hn4VextgS//V1
	 bg36Wy1Wv67VvsPZrvf6bvM3T/Ud92Tf3EIYfuHQCWkFWQGN08RIvV1FsQMXdGEgox
	 ihe0CvYueL3kqJGviWGKxbCHTXNQMgb0KrZJTZxThR+r4qo7A1r4kGBlp9RRgN1Avb
	 EdnKI4gkgWZdbTdwvNsyjYd8n4vm6Ag8gZ4s28e+xj9+F0vVEZw9x41Ndzvso6yAKF
	 A322pHsKryHykiA7Sbb07XUnxYOVubjPuGb1is2SmRdL1p1vEme6+W6gICgVA2fxAC
	 6It+X05pihr2w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 12/19] dmaengine: dw-edma: Recover stopped channels
 from tx_status()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260723084150.521366-13-den@valinux.co.jp>
References: <20260723084150.521366-1-den@valinux.co.jp>
 <20260723084150.521366-13-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 08:59:41 +0000
Message-Id: <20260723085942.134281F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] Polling and restarting a stopped channel in tx_status races wi=
th the hardware STOP interrupt handler, causing the newly running transfer =
to be misinterpreted as stopped, leading to premature completion and data c=
orruption.
--

--- Patch [12]: [PATCH v2 12/19] dmaengine: dw-edma: Recover stopped channe=
ls from tx_status() ---
commit b34ccd5c57949fabf1e4daf7d4e7cfdaa0576cc4
Author: Koichiro Den <den@valinux.co.jp>

    dmaengine: dw-edma: Recover stopped channels from tx_status()

This commit allows tx_status() to consume IRQ-recorded progress under
vc.lock. If a channel is stopped with pending entries, it reconciles a
fresh LLP boundary and restarts the channel.

> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-=
edma-core.c
> index 9489ca7e70fda..3fc929a6bcf52 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c

[ ... ]

> @@ -654,6 +662,36 @@ dw_edma_device_tx_status(struct dma_chan *dchan, dma=
_cookie_t cookie,
>  	if (ret =3D=3D DMA_COMPLETE)
>  		return ret;
> =20
> +	if (!chan->non_ll) {
> +		scoped_guard(spinlock_irqsave, &chan->vc.lock) {
> +			enum dma_status ch_status;
> +
> +			ch_status =3D dw_edma_core_ch_status(chan);
> +
> +			/*
> +			 * Do not treat raw DMA_LLP polling as normal progress here. Only
> +			 * recycle progress recorded by the IRQ pass that consumed the
> +			 * status event.
> +			 */
> +			if (chan->request =3D=3D EDMA_REQ_NONE &&
> +			    chan->status !=3D EDMA_ST_PAUSE &&
> +			    ch_status =3D=3D DMA_COMPLETE &&
> +			    dw_edma_ll_consume_progress(chan)) {
> +				dw_edma_start_transfer(chan);
> +				chan->status =3D dw_edma_ll_pending(chan) ?
> +					       EDMA_ST_BUSY : EDMA_ST_IDLE;
> +			}
> +
> +			if (dw_edma_ll_recoverable_pending(chan, ch_status))
> +				chan->status =3D EDMA_ST_BUSY;
> +			dw_edma_core_ch_maybe_doorbell(chan);

[Severity: Critical]
Can this race with the hard IRQ handler and cause data corruption?

If a transfer completes and the hardware stops, the hard IRQ handler=20
(e.g., dw_hdma_v0_core_handle_int()) will read and clear the STOP status,
then call done(chan, true) which queues the deferred handler with stopped=
=3Dtrue.

Before the deferred handler acquires chan->vc.lock, could a client polling
dw_edma_device_tx_status() acquire the lock, observe DMA_COMPLETE, and rest=
art
the channel by hitting the doorbell here?

If so, when the deferred handler finally acquires the lock in
dw_edma_record_irq_idx(), it samples the LLP which is now moving since the
channel has been restarted. Because it uses the stale stopped=3Dtrue flag,
dw_edma_ll_recycle_idx() returns the exact moving LLP index without applying
the idx - 1 safety margin.=20

Could this cause descriptors to be completed prematurely while the hardware=
 is
still actively transferring data?

> +		}
> +
> +		/* dw_edma_ll_clean_pending() may have completed this cookie. */
> +		ret =3D dma_cookie_status(dchan, cookie, txstate);
> +		if (ret =3D=3D DMA_COMPLETE)
> +			return ret;
> +	}
>  	if (ret =3D=3D DMA_IN_PROGRESS && chan->status =3D=3D EDMA_ST_PAUSE)
>  		ret =3D DMA_PAUSED;
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723084150.5213=
66-1-den@valinux.co.jp?part=3D12
