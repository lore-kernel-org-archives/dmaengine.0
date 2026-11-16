Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794802024;
	b=NLWJ2MsZ5l1GpPtgapLbm069+qLWD1ZvqwfPnIR5Qt0//lg/DhAXmCMbOZxbfEZFwbBh
	 d9+9/C5D7H3JIgkW177/jJoilxtO4kOjQZ920lYQgym+thnaryzuguWhn2kfJx9mhYbZp
	 zNRJFfwQFEVjvC0Wsiup/xc5+LnZDcvD49DRb7C+MoFDFJX6kGMte/mnRdP2Ms4xZvpz5
	 PcwBcCKjD6QpS+0/Rsjg7v8qiuEG6fL7cH+8iGMpRjmkAJIncvgWZUJfcMEDtPYe6ZO12
	 VE17oEwVJyH8V0j6Fdy5Ez0+IZl3DdtJOc5OrWmg+xdo/BJyJR9onlvGOOopmB7szIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794802024;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=cX6xcw1ZGaZQFWeiUftDkymlGaG1UpesDWpLQVcSVMo=;
	b=A37oDENUbaClZ/UUb/a3oG1llv+FUMofZocx2p9MEjCc++NfjEyZRv5vk3np5VPkTiWE
	 i0dMRpWK1LY4cv0n5SUfK9opK0OiK/+7YWw7UXswr+v9zIBFpudIdVdrTRPReT+6F8Wj1
	 MHvTKo6E2QffybF0IXDjuWpyn0RA3ARWlPOmZuAbuoxWy2+Di44KZt8fc1L9C/4d8ge+p
	 /GPVo9C85MppgifgRe8w7SveTPxF4zxak5v0LGUGeRln1iOfZdpW5p7xvQG+WaMSOsAYQ
	 q/ULMxDVApEgjDGM8iHyreOmcZLSgHF+igY99vi4cORt6vymKAKR3rm7BH8lcb7xZyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jb70ocTO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C669606A31C
	for <dmaengine@vger.kernel.org>; Mon, 16 Nov 2026 04:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jb70ocTO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AE421F000C4;
	Mon, 16 Nov 2026 04:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794802023;
	bh=cX6xcw1ZGaZQFWeiUftDkymlGaG1UpesDWpLQVcSVMo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jb70ocTOPsuVggnQ1f9lz3jVlBiykIz54eIc5li3HbXtvg/+212Waa0VLtwKxq/Mr
	 LGBFc7U6wk6tNv0pTh2zDq4KREZAe8qMusHqdKwOWnMlMX08YAkjKdCQFNnD9wGCtH
	 eqJvObiK4BiKbo4mJlPxG6g/3Sn9gMMEUfoSOjsrv6+AUmVSaeGAqEb64lWia4b+MN
	 1MHZciZOEDSYBVsiUYdJwfbpVaxAL8QdSQUND23CjqODomMl2VnoxjKe/uWsfLnREx
	 GCsksIrQdqHKQSDL+rafB4RQLdDUB1yl/ScvZjMd5jjwT8xH5e8PvPJMCWbRa+dYWE
	 yDQB7xqJl66iQ==
Message-ID: <sashiko-outbox-216160@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] dmaengine: xilinx_dma: Allocate AXI DMA segments
 in ring order
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jeff C. Jensen" <kernel@nullptr.com>, dmaengine@vger.kernel.org
Cc: vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261115-xilinx-dma-work-v2-3-681ed00c15a1@nullptr.com>
References: <20261115-xilinx-dma-work-v2-0-681ed00c15a1@nullptr.com>
 <20261115-xilinx-dma-work-v2-3-681ed00c15a1@nullptr.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 04:07:02 +0000
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
- [Medium] dmaengine: xilinx_dma: leak and race on reset in
  xilinx_dma_tx_submit()
--

commit 80f9ff890add7d4c1438b6a3f62d632e08397edb
Author: Jeff C. Jensen <kernel@nullptr.com>

dmaengine: xilinx_dma: Allocate AXI DMA segments in ring order

This commit replaces the AXI DMA segment free list with a bitmap and ring
cursor so that descriptors reserve consecutive hardware segments in ring
order.

Link: https://lore.kernel.org/all/20260817094004.A74621F000E9@smtp.kernel.o=
rg/ [1]

> diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_=
dma.c
> index ba4fa1aafc501..69f61ba1652bd 100644
> --- a/drivers/dma/xilinx/xilinx_dma.c
> +++ b/drivers/dma/xilinx/xilinx_dma.c

[ ... ]

> @@ -2117,8 +2270,11 @@ static dma_cookie_t xilinx_dma_tx_submit(struct dm=
a_async_tx_descriptor *tx)
>  	unsigned long flags;
>  	int err;
> =20
> +	spin_lock_irqsave(&chan->lock, flags);
> +
>  	if (chan->cyclic) {
> -		xilinx_dma_free_tx_descriptor(chan, desc);
> +		xilinx_dma_cancel_tx_descriptor(chan, desc);
> +		spin_unlock_irqrestore(&chan->lock, flags);
>  		return -EBUSY;
>  	}
> =20
> @@ -2127,13 +2283,13 @@ static dma_cookie_t xilinx_dma_tx_submit(struct d=
ma_async_tx_descriptor *tx)
>  		 * If reset fails, need to hard reset the system.
>  		 * Channel is no longer functional
>  		 */
> +		spin_unlock_irqrestore(&chan->lock, flags);
>  		err =3D xilinx_dma_chan_reset(chan);
>  		if (err < 0)
>  			return err;
> +		spin_lock_irqsave(&chan->lock, flags);
>  	}
> =20
> -	spin_lock_irqsave(&chan->lock, flags);
> -
>  	cookie =3D dma_cookie_assign(tx);

[Severity: Medium]
Does the chan->err path leak desc and its reserved segments when
xilinx_dma_chan_reset() fails, or allow a concurrent submission to race
when chan->lock is dropped?

If xilinx_dma_chan_reset() returns an error, xilinx_dma_tx_submit()
returns without calling xilinx_dma_cancel_tx_descriptor(chan, desc),
leaking desc, leaving its bits set in chan->seg_used, and leaving
chan->seg_next advanced.

Even when the reset succeeds, dropping chan->lock after desc has reserved
its ring positions lets a second caller prepare and submit a newer
descriptor (or set chan->cyclic) before this thread re-acquires
chan->lock, queuing the two descriptors in chan->pending_list out of ring
order:

CPU0                              CPU1
prep_slave_sg() -> desc A
  reserve_segments() [0..1]
xilinx_dma_tx_submit(A)
  lock(&chan->lock)
  if (chan->err)
    unlock(&chan->lock)
    xilinx_dma_chan_reset()
      chan->err =3D false
                                  prep_slave_sg() -> desc B
                                    reserve_segments() [2..3]
                                  xilinx_dma_tx_submit(B)
                                    lock(&chan->lock)
                                    append_desc_queue(chan, B)
                                    unlock(&chan->lock)
    lock(&chan->lock)
    append_desc_queue(chan, A)    <-- queued after B, out of ring order

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115-xilinx-dma=
-work-v2-0-681ed00c15a1@nullptr.com?part=3D3
