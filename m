Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061A73ABD99;
	Mon, 17 Aug 2026 14:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786975622; cv=none; b=s2iqpxZ1/kHn7/PWl4qEuXa1diLxry5veL7E0gY1/GL1/MW1VYLlYyLgPyPqOTWUk7EyfeEM6UDiFdBpBV+guSnJOjN2SyQrWyBGMjvZbzc2eNXWqO39SJk80WtQUbvDlN5dgJzfpzQyRP4XAwh8X43+xrWdfkBxSRa8b6FSLrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786975622; c=relaxed/simple;
	bh=6vxOnag9n3aCAK5WDM9Cs76U2s1JHQccXo5Eer1/iC8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=K76p3kA4V/l3voMAFhj0+iV+bLyk5F1UtbR8HJWwqNcmMzTEclANJKo1BBx57HfRtES8/48RDwpf9kFUbY8b+TnYWY3N8dim6TcWUCO4isLVrw6QJ2vUS0FFwfjdkTB3HEZkOiYFAWGMsZBNyalVBNButZ/KXWez4n6DDiCNf/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XhwgWfVE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XhwgWfVE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97EC31F000E9;
	Mon, 17 Aug 2026 14:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786975620;
	bh=LI2F6B7aIR+os/ywz//bhKReCahYxVqOR/RCc2yT4m8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XhwgWfVE3Lo8e1j+eeAI1gzP1sIGy6E2rx+jxOmvQczt9zk/4q1rXLhsmNY8+hy0N
	 OI2/RWmQ1dU1alg2mG2mG8/UatwCh62qqUcpGWJjJJVF7z3iY6QKQfqvn4WJZEVRfi
	 RkgmzrNatMkbzQ35gIL2Iy0PRgwB9AV2F3bHItAwUD2pKV32SHaUUQfTWt1lgcxAjS
	 likSxWmeAkrw5jRHP+PDV3mwPNMf+XFOq8Wjlef7lsBPM83s49Gf0KeKgcHZMzucyX
	 LMNleC4R7HWdtJ8hWphHkin4/Pa8C/Q9Bm54hOQJShcODNmr5rJQgFc4Dd4Y6vvbs0
	 MeJEHAE7dUv6w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dmaengine: sun6i: fix non-atomic read of DMA
 position registers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Lugnberg" <christian.lugnberg@soundtrack.io>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, linux-sunxi@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260817135723.12807-2-christian.lugnberg@soundtrack.io>
References: <20260817135723.12807-1-christian.lugnberg@soundtrack.io>
 <20260817135723.12807-2-christian.lugnberg@soundtrack.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 14:07:00 +0000
Message-Id: <20260817140700.97EC31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The `sun6i_dma_tx_status` function reads and caches `vchan->phy` i=
nto a local `pchan` variable before acquiring the `vchan->vc.lock`. If the =
DMA transfer completes concurrently and the tasklet reassigns this physical=
 channel to another virtual channel, `tx_status` uses the stale `pchan` poi=
nter to calculate the DMA residue. This results in accessing another channe=
l's hardware registers and descriptor lists.
--

--- Patch [1]: [PATCH v3 1/2] dmaengine: sun6i: fix non-atomic read of DMA =
position registers ---
commit bea51abd69d8527a2183678d78b9d1b2e28b24a1
Author: Christian Lugnberg <christian.lugnberg@soundtrack.io>

dmaengine: sun6i: fix non-atomic read of DMA position registers

sun6i_get_chan_size() reads DMA_CHAN_LLI_ADDR and DMA_CHAN_CUR_CNT in two
separate readl() calls with no synchronisation between them. The subsequent
virtual-chain walk starts one entry too early and accumulates an extra full
period's worth of bytes into the residue estimate. Fix this by re-reading
DMA_CHAN_LLI_ADDR after DMA_CHAN_CUR_CNT and retrying if the value changed.

> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index a9a254dbf8cb9..eb060ba2d4738 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
> @@ -354,8 +354,10 @@ static size_t sun6i_get_chan_size(struct sun6i_pchan=
 *pchan)
>  	size_t bytes;
>  	dma_addr_t pos;
> =20
> -	pos =3D readl(pchan->base + DMA_CHAN_LLI_ADDR);
> -	bytes =3D readl(pchan->base + DMA_CHAN_CUR_CNT);
> +	do {
> +		pos =3D readl(pchan->base + DMA_CHAN_LLI_ADDR);
> +		bytes =3D readl(pchan->base + DMA_CHAN_CUR_CNT);
> +	} while (pos !=3D readl(pchan->base + DMA_CHAN_LLI_ADDR));

[Severity: High]
This is a pre-existing issue, but since sun6i_get_chan_size() uses the
pchan pointer to read hardware registers, can it be called with a stale
pchan pointer from sun6i_dma_tx_status()?

In sun6i_dma_tx_status(), pchan is cached outside the lock:

drivers/dma/sun6i-dma.c:sun6i_dma_tx_status() {
	struct sun6i_pchan *pchan =3D vchan->phy;
	...
	spin_lock_irqsave(&vchan->vc.lock, flags);
	...
	} else {
		bytes =3D sun6i_get_chan_size(pchan);
	}
	...
}

If the transfer finishes and the tasklet reassigns this physical channel
to another virtual channel concurrently, sun6i_dma_tx_status() could use
the stale pchan. This would lead to calculating the residue using another
channel's hardware state and descriptor lists.

Should vchan->phy be re-read inside the lock?

> =20
>  	if (pos =3D=3D LLI_LAST_ITEM)
>  		return bytes;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817135723.1280=
7-1-christian.lugnberg@soundtrack.io?part=3D1
