Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D216A3911AA
	for <dmaengine@vger.kernel.org>; Wed, 12 Aug 2026 16:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786552400; cv=none; b=ivXhi5cQKKEsAM+u1u3165uYL2ABuwUdnLiSWswrmrbCETrCDTlCb7MwdnAUOR8wZI4EbFPG+Oy7QEM2g5sWkqSNiFpeudchJXta8w4C/zzzOb6O+VnHdfeOCE6xAlkUFWLUOc1rauajxgZHjoW+PIuw3MxcvnGeFYdHAhOvCz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786552400; c=relaxed/simple;
	bh=6JV/KZFD3Hh+U2tSmA+Ls5SaXq3C/fDGqeOf6C+WEtY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bMQfEqfHIfQ4TTLO062XMGxw0P9lvmQcRrPqaAk6dF29gJSbDGNnqy7oBMgRSyNWBjEMYJp0hEjun++zt/+dgrk09VQTa3F0uvnfQIlfOJVfpBlZAZJaB90ZpPxVxejY8f7LPVCVJi9R2VrdvhwmC5S9zsOj1F8JWGKqO5U57Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iEbCaIdX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iEbCaIdX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D6CD1F000E9;
	Wed, 12 Aug 2026 16:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786552398;
	bh=MS/cz3g25rPaKK/dZRkuF5tK5yyycvT3Z8YftyQ22XM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iEbCaIdXpaJ3IMnbMrjVM7zPfCrPnmAApF0WUCDPiwxoO4FpOCTznK3B0SLyiBR0x
	 9TbfNpmNgQEZpw824T2Wi/B3TP2PcYqn37IFdAVg5mGo0Dupm83eqa/Bi0DVkpWxfF
	 k3l1frZYr0QOWuvrFH1EeRlavBTG6M+g+ARIXhrok3GHzmp2Tw0a59SK9PJm83+moa
	 zPRdsU1xV9lSU2rLMlv/vMEB/Al9jaErrGbf90aYMM9eZ2LL73u0DVQhCifZzYHcG4
	 qcJ3uXl71uu5KU2ZKvZwndBdrlmLITvoW7QtNOnZo2Aivl2crL19GDRqtyaV+B6+jm
	 +z/pq7C5WTR1g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 15/24] dmaengine: dw-edma: Recheck stopped LL
 channels before restart
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260812155721.2807506-16-den@valinux.co.jp>
References: <20260812155721.2807506-1-den@valinux.co.jp>
 <20260812155721.2807506-16-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 16:33:17 +0000
Message-Id: <20260812163318.1D6CD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Silent hardware stop during channel termination causes a 5-second =
timeout and descriptor leak.
--

--- Patch [15]: [PATCH v5 15/24] dmaengine: dw-edma: Recheck stopped LL cha=
nnels before restart ---
commit aec4dbaf9567f7c6e772cd5d67fe89362acafbbf
Author: Koichiro Den <den@valinux.co.jp>

dmaengine: dw-edma: Recheck stopped LL channels before restart

This commit introduces a mechanism to recheck stopped LL channels before
restarting them to handle races between DMA_LLP samples and updates. It also
gates eDMA kicks with a one-shot credit and serializes the stopped-state
check against IRQ capture.

> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-=
edma-core.c
> index 13c45549e08be..8325e296cb2a4 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c
[ ... ]
>  /* Must be called with vc.lock held. */
>  static void
>  dw_edma_set_request(struct dw_edma_chan *chan, enum dw_edma_request requ=
est)
>  {
> +	if (!chan->non_ll && chan->request !=3D request)
> +		dw_edma_ll_recheck_cancel(chan);
>  	chan->request =3D request;
>  }

[Severity: High]
This isn't a bug introduced by this patch, but does cancelling the recheck
work when setting EDMA_REQ_STOP remove the mechanism that detects a silent
hardware stop?

If the client calls dmaengine_terminate_all(), it sets
chan->request =3D EDMA_REQ_STOP and cancels the recheck work here. If the
hardware stops silently without an interrupt, dw_edma_wait_termination()
will spin for 5 seconds waiting for the interrupt to clear EDMA_REQ_STOP,
leading to a timeout and leaking the pending descriptors.

[ ... ]
> -/* Must be called with vc.lock held. */
> -static void dw_edma_core_ch_maybe_doorbell(struct dw_edma_chan *chan)
> +/*
> + * Must be called with vc.lock held. Return true when published work is =
still
> + * running and may need one later stop recheck.
> + */
> +static bool dw_edma_core_ch_maybe_doorbell(struct dw_edma_chan *chan)
>  {
>  	if (chan->non_ll || chan->request !=3D EDMA_REQ_NONE ||
> -	    chan->status !=3D EDMA_ST_BUSY || !dw_edma_ll_pending(chan))
> -		return;
> +	    chan->status !=3D EDMA_ST_BUSY || !dw_edma_ll_pending(chan) ||
> +	    dw_edma_abort_is_pending(chan))
> +		return false;

[Severity: High]
This is a pre-existing issue, but because this early return checks
chan->request !=3D EDMA_REQ_NONE, doesn't this explicitly prevent
dw_edma_ll_reconcile_and_refill() from running when chan->request =3D=3D
EDMA_REQ_STOP?

Combined with the cancelled recheck work above, this means there is no
mechanism to clear EDMA_REQ_STOP if the hardware stops silently during
termination.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812155721.2807=
506-1-den@valinux.co.jp?part=3D15
