Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D47B4CDDCD
	for <dmaengine@vger.kernel.org>; Fri, 18 Sep 2026 16:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789749893; cv=none; b=XJE1yowo3f7BneFP7emiAWI2mWmT1y4ARKBz6ukdowP3Qzv98YE+EI7/bVA9X5U2Qf/wXvV7ijX0E0vHbIta8bfpzC0jopmsw0zjLEBwxh43BXhoVf6a8lzmJBFE2SBJpBoaM1XpO4daiQMS9IwNPVCtl3EofRZvRMZWsvIT2bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789749893; c=relaxed/simple;
	bh=7D+1hSQe70fPuWD2Q1hxjkGmKHxV9PnL9VdLRzlFnzo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aarFNFMbkkSYVCe6btId4Nl2a7Por2w8I6/RrxOcrLB/66qhmEpc1I68fTkyh/x7VNfEvlNQzIjHAy+NoWs75NSy5BsuirimLYHgCAHJ7iUdGUzlAoG2vMV/ctMnjPtmItA644JWVXu5u/l5eSaU8/T1IsWZO2Y6EDGRGYfdpNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CqMCUr2N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CqMCUr2N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF67E1F000FF;
	Fri, 18 Sep 2026 16:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789749892;
	bh=5kOGejpwAmjxGg+/+KopD1iOYzITNISZp0eWK9ZyWls=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CqMCUr2NYFUJv5wCsgfYLsN/BQRCjcvLQ0Nqzhng/HMC8kdu01YYtdjFHiwgAHRdd
	 DXNhYxghbjeziv0GYyEJkMuY5NcsAhnDeXDtSiDclBGGEfuhMu6KHUArKreHKEsBz1
	 fOcJBjR0ZvEhlni4JlBgumjob8xOX5E1GjWijtv4wUIXNards61L+abofkRB4W9aT0
	 zyEPLp0m9fQSVXGNFcDSE0RaJ5lz/qzzz4IzXTecY9dzDPPLWoC6MuIdD8o67b7Rne
	 YhMhtd09dStTuxDaS60kLc40kbb0orQIyqS/E2ioRr1yB40RDaM4pB9VdaA1mAkEWY
	 3cVM5dF1Dck1Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 02/22] dmaengine: ste_dma40: Fix cyclic transfer
 residue
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260918-dma40-fixes-v3-2-8dd8450669e8@kernel.org>
References: <20260918-dma40-fixes-v3-0-8dd8450669e8@kernel.org>
 <20260918-dma40-fixes-v3-2-8dd8450669e8@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 16:44:51 +0000
Message-Id: <20260918164451.EF67E1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] dmaengine: ste_dma40: unvalidated cyclic period length causes stat=
e corruption
- [Medium] dmaengine: ste_dma40: race condition in cyclic residue calculati=
on
--

commit 80bd7a5b773ac08dae8cfb0539ed88005fe2df44
Author: Linus Walleij <linusw@kernel.org>

dmaengine: ste_dma40: Fix cyclic transfer residue

DMA40 reads residue from the element count of the currently active LLI.
For a cyclic transfer this reports at most one period, not the bytes
remaining until the cyclic buffer wraps. This patch tracks the active
period of cyclic descriptors and adds all later periods in the buffer to
the current LLI residue.

> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
[ ... ]
> @@ -2108,15 +2120,27 @@ static bool d40_is_paused(struct d40_chan *d40c)
> =20
>  }
> =20
> -static u32 stedma40_residue(struct dma_chan *chan)
> +static u32 stedma40_residue(struct dma_chan *chan, dma_cookie_t cookie)
>  {
>  	struct d40_chan *d40c =3D
>  		container_of(chan, struct d40_chan, chan);
> +	struct d40_desc *d40d;
>  	u32 bytes_left;
>  	unsigned long flags;
> =20
>  	spin_lock_irqsave(&d40c->lock, flags);
>  	bytes_left =3D d40_residue(d40c);
> +
> +	d40d =3D d40_first_active_get(d40c);
> +	/*
> +	 * The hardware residue is for the current LLI. Cyclic transfers use
> +	 * one LLI for each period, so include the later periods in the buffer.
> +	 */
> +	if (d40d && d40d->txd.cookie =3D=3D cookie && d40d->cyclic &&
> +	    d40d->cyclic_period_len)
> +		bytes_left +=3D d40d->cyclic_buf_len - d40d->cyclic_pos -
> +			      d40d->cyclic_period_len;

[Severity: Medium]
Can this create a race condition when a client asynchronously polls the DMA
residue?

If the hardware has just completed a period and advanced its internal LLI,
but the terminal-count interrupt hasn't updated the software cyclic_pos yet:

dma_tc_handle() {
	...
	if (d40d->cyclic_period_len) {
		d40d->cyclic_pos +=3D d40d->cyclic_period_len;
	...
}

Could stedma40_residue() read the current hardware residue without
synchronizing with the interrupt handler's update, causing the residue (and
pointers for clients like ALSA) to occasionally jump backward and cause aud=
io
glitches?

[ ... ]
> @@ -2524,11 +2548,17 @@ dma40_prep_dma_cyclic(struct dma_chan *chan, dma_=
addr_t dma_addr,
>  		     size_t buf_len, size_t period_len,
>  		     enum dma_transfer_direction direction, unsigned long flags)
>  {
> -	unsigned int periods =3D buf_len / period_len;
>  	struct dma_async_tx_descriptor *txd;
> +	struct d40_desc *desc;
>  	struct scatterlist *sg;
>  	int i;
> =20
> +	if (!buf_len || !period_len || buf_len % period_len)
> +		return NULL;
> +
> +	periods =3D buf_len / period_len;

[Severity: High]
Does this also need to validate that period_len is within the hardware's
maximum segment size?

If a cyclic period_len exceeds the maximum segment size (for example,
STEDMA40_MAX_SEG_SIZE * data_width), it seems it would be silently split
into multiple LLIs. For logical channels, every LLI unconditionally
triggers a terminal-count interrupt.

If that happens, wouldn't dma_tc_handle() erroneously advance cyclic_pos
by the full period_len on every LLI interrupt?

dma_tc_handle() {
	...
	if (d40d->cyclic_period_len) {
		d40d->cyclic_pos +=3D d40d->cyclic_period_len;
	...
}

This seems like it would permanently drift the residue tracking in
stedma40_residue() and trigger excessive callbacks if a client requests a
large cyclic buffer.

> =20
>  	sg =3D kzalloc_objs(struct scatterlist, periods + 1, GFP_NOWAIT);
>  	if (!sg)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918-dma40-fixe=
s-v3-0-8dd8450669e8@kernel.org?part=3D2
