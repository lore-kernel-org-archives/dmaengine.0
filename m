Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794475408;
	b=NY5gFpsda3zKfZTKIJ7r8xKiEwBB5UWmL458Mu+/w3Hs+VclFZNnjHYXpIUHjksM7X/T
	 YCUXL2p60SkS4eAskBurwSkCj/Uq5WbEWcCpQY6p8afPvP+wRZSF9oC/evkMYMn/X6nN5
	 OYspUBJAx8hSufC/HH1hEHx8s/yDP/G4MipVkbztcPVspJaOme9ShSd2jAXZimlXXzbxp
	 D0kLSEhZHgvjPsPwFd3iFcTehndWqbefy02WK51YOQprwElhZ8fE8jQMu4asg8+0+6cmQ
	 b2PXE39Z7qy/0afvWONz7I/q81e0L1Um6PfjRCGgV6eEwDc11twHifBt6k47vb//cXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794475408;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=w0vaMWRSgh5aouQUt8EEATwDkoYoRXyRvfSX3PGrKcQ=;
	b=hXl1Z8OGwv8pF3zIDr2r/Ni2taTJGhHcZFyHbI95nlpaxaCpEl3F1V71UKYKo1ANi1hx
	 YQpgOt6sXiAIb21tFTEpvNhCRpunu++r20QDLx/CwrnIpn4ntAEl7bl5GyG2gKNSVadEY
	 fFxy9rdL1sbpXNyvXHbToxHQEeHHgeEA6cMkAYYJGJqf1NuI3/jFB/OVFLfHcaCcfc2Fr
	 D2VWzUdKXKNvS1rEqAXdphNVUlfwikohrlmdi7w2qBpXHr6QQeedfIwe3XN2OeV8C51Bh
	 Z+kJHOA2qi10dUZ1Wdys8o/bR6I0a+bTEup+1DM/e/gIudvcd4BJTSn8bwDIUyatXow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eLlSZZA0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBDC606A323
	for <dmaengine@vger.kernel.org>; Thu, 12 Nov 2026 09:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eLlSZZA0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A5171F00A07;
	Thu, 12 Nov 2026 09:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794475408;
	bh=w0vaMWRSgh5aouQUt8EEATwDkoYoRXyRvfSX3PGrKcQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eLlSZZA0hCJB+Jl+lXEbYWBAD7GvM3fxRlcshY0mPO1RW2+ZJ2SALa0Ot8uAceyYw
	 2FEns6pAmrTHalsdVXHqkkCnhkSoPlSiR+8ABJFxG4qOBh0oeP41XLlzlaZrdghyEE
	 L0ncGX310vKRouKP+QvdNiVTtZk4Ts3+6/6CLj115RP9f4Op3P3+NF/0xgluS8n31/
	 p3PFFwZGIya4zomRcJkKwK9rMg1/IIcwZHrviWDyWsr9nljf7HOse407weudufwlH+
	 f4QYox5XOvU40uiecVUGoYzUVnMGXXX589OhVEk0sdMXs4Q/RYAGbhXZ+4b7JQnA17
	 HuI/4Xflxluuw==
Message-ID: <sashiko-outbox-210870@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/5] dmaengine: dw-axi-dmac: preserve pending pause
 requests
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261112-submit-dw-axi-dma-stop-pause-v1-v4-5-3ebc24b243db@gmail.com>
References: <20261112-submit-dw-axi-dma-stop-pause-v1-v4-0-3ebc24b243db@gmail.com>
 <20261112-submit-dw-axi-dma-stop-pause-v1-v4-5-3ebc24b243db@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 09:23:28 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] dmaengine: dw-axi-dmac: cyclic completion bypasses suspend
  cleanup
--

commit 42cf728bc72837bdd6aafccd6828bd4c191d4963
Author: James Hilliard <james.hilliard1@gmail.com>

dmaengine: dw-axi-dmac: preserve pending pause requests

This commit tracks pending pause requests separately from hardware suspend
acknowledgment and defers restarting cyclic or queued descriptors while a
pause is requested.

> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma=
/dw-axi-dmac/dw-axi-dmac-platform.c
> index 1a53fbc951a91..70ff0c5006231 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c

[ ... ]

> @@ -1134,11 +1145,18 @@ static void axi_chan_block_xfer_complete(struct a=
xi_dma_chan *chan)
>  			}
>  		}
> =20
> -		axi_chan_enable(chan);
> +		if (chan->pause_requested) {
> +			chan->is_paused =3D true;
> +			chan->cyclic_restart =3D true;
> +		} else {
> +			axi_chan_enable(chan);
> +		}
>  	} else {

[Severity: Medium]
Does setting chan->is_paused here skip cleaning up an unacknowledged
hardware suspend request when a cyclic block completes after
dma_chan_pause() times out?

If dma_chan_pause() writes the channel suspend request and times out in
axi_chan_wait_for_suspend(), chan->pause_requested remains true while the
hardware suspend request stays pending.  When the in-flight cyclic block
then finishes, axi_chan_block_xfer_complete() sets chan->is_paused =3D true
without calling axi_chan_disable() or clearing DWAXIDMAC_IRQ_SUSPENDED.  A
later dma_chan_pause() retry or dma_chan_resume() call sees chan->is_paused
and returns early from axi_chan_wait_for_suspend(), bypassing the
axi_chan_disable() call in axi_chan_is_suspended() that clears an
unacknowledged suspend request on a completed transfer.

Leaving chan->is_paused false here (or calling axi_chan_disable() and
clearing DWAXIDMAC_IRQ_SUSPENDED before setting chan->is_paused) would
ensure the pending hardware suspend state is cleaned up before the channel
is re-enabled on resume.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-submit-dw-=
axi-dma-stop-pause-v1-v4-0-3ebc24b243db@gmail.com?part=3D5
