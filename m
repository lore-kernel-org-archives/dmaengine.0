Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794281128;
	b=s/snqR3y/HHNvIJccQqkVTgqcrYT8KoT0MucMvvs3fsKYegYXL/t/hCrdwh0wSwIM0pR
	 bvfFjfqqT0+YjE3SE3+F//jQelV3qYGhJNj7vgKRcYyPxHie8TZyXRjfYm45+DEtKDYoL
	 0ob0Ig9vimkxy6ya1kc4+v/ZgTOUSXUKMNSd+c3eBv8Mb6pK+fPzViHGBOuZFuKC+ujGU
	 IvyjWOc4TGq1NUAYaKCKBIBe/4mzQ9MMXTqzSs8Bij9O1sEL0uQACgG312FxqzgWjAWW4
	 iLMUoF5HzJYX5SNb52dMd3yu7lQ7WTq3t0IQDMw2KxM1awBcSsRhX9B/fZciBO9Bjkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794281128;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=y/5yU2Xu1lug1JTJk9zWK0Ip4a48470lmA1eMPWgs7Q=;
	b=YaN3mAPoYiZYGWmSQTuc9rGKaK4PfbRWVYdEcev2DbvR1n6lvNm1SZ9NYQB/q5XcZuLJ
	 R4Ng0GbupQUC8uV2ydYomqbmd3Bd28YurfWdm+MV53KnYmVOCGYt42lIVrAAcV7qTT2et
	 S9X70UD2rfZFd8dni6Gh9VKDbeHAbJep/WEksbi5l2nShwOkRw6gVfCeKZl6IhEFORbmO
	 M7UjsN7lhXlbHiUwlfVFkHDa5lJ2E2JAAl5cFTh2bFNyKOIEsYlaqCJTkInV7KpZ4z990
	 b1bzHGCLr5BO79+QNoJ61/IYdU7ndNEph3jp9INf2KQRwvYWI63UZj2aTNGtcWbHX1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A+kaRkA6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7738960A263C
	for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 03:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A+kaRkA6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81EC11F0089F;
	Tue, 10 Nov 2026 03:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794281128;
	bh=y/5yU2Xu1lug1JTJk9zWK0Ip4a48470lmA1eMPWgs7Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A+kaRkA6EtwZOSWuAijD8fyuBLNHssTAWcfixdGRJs8avOzYPdIw0I9cqPCD8F0qq
	 BS2DcbX/3HdjZqfBbny1qemDy4v2B5j8sWmW4Bs0BgLbf1aIr2dwIwAQ59hcQGeiSA
	 Xzx4NNE8t3Mc514TuHnsy95b1pyy6Bm3WSnLrkkPYNyslobssm7Kenw5jnuaTp0lHp
	 bgNoK0b8bCnsPqu8zyyd8MDqMi+bWlnBNa4ml/QtogTI61rvxZ5ziHuar/fvSOcRlO
	 Uu449tKNnNrdBCujbZkBUf2W+ZR0fDH3R09lEvHykGfj/0xkU8+8zQXG+f4irfLIM4
	 sSUOc2x5KoOUw==
Message-ID: <sashiko-outbox-206114@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] dmaengine: dw-axi-dmac: preserve pending pause
 requests
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261109-submit-dw-axi-dma-stop-pause-v1-v2-3-64adc48df793@gmail.com>
References: <20261109-submit-dw-axi-dma-stop-pause-v1-v2-0-64adc48df793@gmail.com>
 <20261109-submit-dw-axi-dma-stop-pause-v1-v2-3-64adc48df793@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 03:25:27 +0000
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
- [Medium] dmaengine: dw-axi-dmac: cyclic completion skips suspend
  cleanup on pause
--

commit 2085e97ef4b5e2caaf2c3443bb6eed8c9823633f
Author: James Hilliard <james.hilliard1@gmail.com>

dmaengine: dw-axi-dmac: preserve pending pause requests

This commit tracks pending DMA channel pause requests separately from
hardware suspend acknowledgment, prevents the shared IRQ handler from
clearing DWAXIDMAC_IRQ_SUSPENDED, and defers starting or restarting
transfers while a pause is pending.

> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma=
/dw-axi-dmac/dw-axi-dmac-platform.c
> index 281d7c79246e3..5c1eb120a28b1 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c

[ ... ]

> @@ -1135,12 +1146,19 @@ static void axi_chan_block_xfer_complete(struct a=
xi_dma_chan *chan)
>  				}
>  			}
> =20
> -			axi_chan_enable(chan);
> +			if (chan->pause_requested) {
> +				chan->is_paused =3D true;
> +				chan->cyclic_restart =3D true;
> +			} else {
> +				axi_chan_enable(chan);
> +			}
>  		}
>  	} else {

[Severity: Medium]
Can setting chan->is_paused =3D true here leave an unacknowledged hardware
suspend request latched across dma_chan_resume()?

If dma_chan_pause() asserts the hardware suspend bit and times out waiting
for acknowledgment, and the active cyclic block finishes in hardware before
the caller retries pause or calls dma_chan_resume(), hardware clears the
channel enable bit without necessarily setting DWAXIDMAC_IRQ_SUSPENDED.
axi_chan_block_xfer_complete() then sets chan->is_paused =3D true without
calling axi_chan_disable(chan) or clearing DWAXIDMAC_IRQ_SUSPENDED.

When dma_chan_resume() later calls axi_chan_wait_for_suspend(), it sees
chan->is_paused =3D=3D true and returns 0 immediately, skipping
axi_chan_is_suspended() (which calls axi_chan_disable(chan) to abort an
unacknowledged suspend on a completed transfer) and skipping
axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED).  Because hardware
ignores clearing the suspend bit in axi_chan_resume() while an
unacknowledged request is still pending, re-enabling the channel for
chan->cyclic_restart can leave the suspend request active in hardware.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-submit-dw-=
axi-dma-stop-pause-v1-v2-0-64adc48df793@gmail.com?part=3D3
