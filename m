Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13EFE4B44B0
	for <dmaengine@vger.kernel.org>; Mon, 21 Sep 2026 15:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790003776; cv=none; b=Pl01Im54YwPxJ7TmQpI87zMzS4kI2cro8ybYDbqmFmZ47/PhABOQF0v1563UqhKLoamZvf2JpLxv0c1HaOMG9dBa2vDVO+NG82LdPj32aOzqRXnksrMq3Iwr2pYzNh7rzAptdbW73b7uTwLLA5QshqG3L+w3qeyjAO3Y6XbmS88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790003776; c=relaxed/simple;
	bh=dnmTzigjUNFHzh2EbBLEexhTM6an/ukEaDp0Fj7aRUY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dom3NVowob42ohRYQKb0uoV+Ey6lejeGXdeQzqR/bc4rejAsSmI3cBqEgmX4I+o7s8Zh/H23CBzdEDmjcEX+inYx7+ocW0aMbVnv8L+zBmvFN90BtH7ebgMNf84hnSE9X6SJpOp+oEj9taP3uT5nEAzhaPxmREyX5M4WTFw+8aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hcm/v32v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hcm/v32v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B460D1F0089A;
	Mon, 21 Sep 2026 15:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790003775;
	bh=0AgECXnREKy0Wv0yrJ/FlQ6WCgn/JBpVtNgu/7GC+SA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Hcm/v32vrlD6xTp7M9xV2Sfga9bErDq5b9p8a9woCHeiFVWS0iGLTJJjZbPLD7Zje
	 YTgw04utThASUghjgAtZlAquUqM4qj8/wUz0bDxodpfHans+VnXEJnzU+7Ux+8eadj
	 v3Lm/mQuT92k+cWhuDuwaxFhrzq5hgcNfCSwXLJWGxaDahZLZq6xi4B7ZHG9aiSD9p
	 nY0Ho+OSUio2LiEKoHMWK2vECXGmdPN0Rd+3K4HyVeL+zsAV/aVN08MsmwAuMnaXA4
	 rJRVHlStvO5ZCtHSdq9l/0h5zeFo2i4iOwkY2LL6jfKqklyLLkVkjMeBUVU6EPvOau
	 oobVd3a1DdYUA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] dmaengine: loongson: Remove the dev_dbg() output
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Andrzej Siewior" <bigeasy@linutronix.de>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260921151312.I8Q8NLnx@linutronix.de>
References: <20260921151312.I8Q8NLnx@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 15:16:14 +0000
Message-Id: <20260921151614.B460D1F0089A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dmaengine: loongson: unnecessary curly braces around single stateme=
nt
--

commit 800bb056df0405c03d12921052d730f7cccef7be
Author: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

dmaengine: loongson: Remove the dev_dbg() output

This commit removes the dev_dbg() output from
loongson2_cmc_dma_issue_pending() since the %pK format modifier is not
appropriate for general printk output. The debug statement was deemed
non-essential and is completely removed.

> diff --git a/drivers/dma/loongson/loongson2-apb-cmc-dma.c b/drivers/dma/l=
oongson/loongson2-apb-cmc-dma.c
> index 1c9a542edc859..27f8f7a5738d9 100644
> --- a/drivers/dma/loongson/loongson2-apb-cmc-dma.c
> +++ b/drivers/dma/loongson/loongson2-apb-cmc-dma.c
> @@ -337,7 +337,6 @@ static void loongson2_cmc_dma_issue_pending(struct dm=
a_chan *chan)
>  	guard(spinlock_irqsave)(&lchan->vchan.lock);
> =20
>  	if (vchan_issue_pending(&lchan->vchan) && !lchan->desc) {
> -		dev_dbg(chan2dev(lchan), "vchan %pK: issued\n", &lchan->vchan);
>  		loongson2_cmc_dma_start_transfer(lchan);
>  	}

[Severity: Low]
This isn't a bug, but with the removal of the dev_dbg() statement, this if
block now contains only a single statement. Should the curly braces be
removed to adhere to the kernel coding style guidelines?

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921151312.I8Q8=
NLnx@linutronix.de?part=3D1
