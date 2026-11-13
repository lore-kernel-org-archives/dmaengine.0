Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794563800;
	b=2KHzj76aoaD3/RjvR4H7qCh6kTCkhKGglh1h+WYvD8rXitCJuN3Gr3R2PhFjSVMqJKNp
	 OQWsdq8omdE+siQ7g2XvtVZMaX2Z/XLUeD7/ehEVgPJBIkAzT0s0psl23VYTWVY184nRd
	 TayIIqv1rLNBDC7ec205pYKMRdVFDMbibIo9FMt7o+znhYM0/8UZDVey+of9DxoSg3PQ0
	 BPHvHKQ6kkO/NXcbdzDFtJ8o7H7ojJd5VeLsZKOL/iMpxjhID4teEJGPtnXCYkB17KHRf
	 p+6kN/Wx3PRgECvCpljpysfw/wM4M+1pCNIqiPWvz7wliWs35ynk/fst4wrqIURaBMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794563800;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=IgGEgmLOwiHuCe78JvST/Gq/YLNBuvUkHsFjkeRJ67A=;
	b=4Bnuuurst65oLw7EITJ7fPwgemv6ylrM9tj54YcdY3uY7UZgJImEzSlaxUVHmiPRn+ZN
	 ZxQQFV+1CPMbNPiKu/BamI/iXZRuee8PJLIDtBenR826Y7q8rGJe67/lguIkWQ4qTplej
	 +mfic8rC4hOcZVFqgUfCpTz72xH/6iYH/+KyCnfIE6HQm6oEWLHa4qy33arX0wxQGzqwy
	 NkZN3/7AW2ag+pKb89QmCGsTzUjDPlCE+uXyTcsXHanMG9kXPIWVSfGtVUvAlK9UJbN6N
	 duD2oJvKYVsiUuuDcieUAQWyyU+ffA07G3dAhJ5d/ZJh59Yc8gC4swpVpArEjj5i49g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K9RtA6wO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C6B606A327
	for <dmaengine@vger.kernel.org>; Fri, 13 Nov 2026 09:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K9RtA6wO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF1E81F000C4;
	Fri, 13 Nov 2026 09:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794563800;
	bh=IgGEgmLOwiHuCe78JvST/Gq/YLNBuvUkHsFjkeRJ67A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K9RtA6wOhWujwvEEopI9oVrgOzx320eMv9Mb+ctfzb5slpHNBXybthUXqQ36qSrPV
	 lcpyYmwwqVY57xqrCmAgWA/jz3zHEDOszej+uuECcJieg5IN8o35szHQzvAHihqVUo
	 vCOcliEEEpM+QJnFWKUGJdjRhVUNEccUDxit76osuPMvh74kxzXNQnv7cFWJ5oNR9P
	 NMRYxuAXL3h3lOrESRsjGm9UsvRyT2SvpPxEWERxJck926sqLkXIU6nnm9gCzV5niA
	 8NbAmnzDZ1OedL/6Wo/VHUfWRA4AmNNVNhJg9geyHNjfr5tps/GTsKAQQTfwHgXMvq
	 dHwr49XDtww/Q==
Message-ID: <sashiko-outbox-212590@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 5/5] dmaengine: dw-axi-dmac: preserve pending pause
 requests
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261113-submit-dw-axi-dma-stop-pause-v1-v5-5-8523a27b5788@gmail.com>
References: <20261113-submit-dw-axi-dma-stop-pause-v1-v5-0-8523a27b5788@gmail.com>
 <20261113-submit-dw-axi-dma-stop-pause-v1-v5-5-8523a27b5788@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 09:56:39 +0000
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
- [Medium] dmaengine: dw-axi-dmac: cyclic completion in
  axi_chan_block_xfer_complete() bypasses suspend cleanup
--

commit d0a0ce5ca0c535aeb1aa58ba2ac57a8edf27e326
Author: James Hilliard <james.hilliard1@gmail.com>

dmaengine: dw-axi-dmac: preserve pending pause requests

This commit tracks pending pause requests and active descriptors across
polling timeouts, interrupt handling, and cyclic transfer completions so
that pause and resume operations do not lose hardware suspend
acknowledgments or prematurely restart transfers.

> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma=
/dw-axi-dmac/dw-axi-dmac-platform.c
> index 1a53fbc951a91..cd9a5b45d295a 100644
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

[Severity: Medium]
Does setting chan->is_paused =3D true here bypass the suspend cleanup in
axi_chan_wait_for_suspend() when a cyclic segment completes after
dma_chan_pause() times out?

If dma_chan_pause() writes the channel suspend bit and times out with
-EAGAIN, and the cyclic segment then finishes in hardware before the
caller retries dma_chan_pause() or calls dma_chan_resume(), this branch
sets chan->is_paused =3D true without calling axi_chan_disable() or
clearing DWAXIDMAC_IRQ_SUSPENDED.  A subsequent dma_chan_pause() or
dma_chan_resume() will then hit the early return in
axi_chan_wait_for_suspend(), skipping axi_chan_is_suspended() (which
calls axi_chan_disable() for completed transfers) and leaving any late
DWAXIDMAC_IRQ_SUSPENDED status uncleared across pause retries.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-submit-dw-=
axi-dma-stop-pause-v1-v5-0-8523a27b5788@gmail.com?part=3D5
