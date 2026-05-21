Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D1C371063
	for <dmaengine@vger.kernel.org>; Thu, 21 May 2026 16:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779379502; cv=none; b=Uyx25LT+R/Rd1CQbUe2zDqBk7/fPJQJmB5jStjdzMRF5IQsTjP/gAs4g1B5VIfl+9Q6lDq9+rUfSzzPGWS1/cINhtlNSgBJZVr6mwyTK1cYGxqpxbzHcVf7SFxFXxRc6Fm8w26I063s4TLz3VKZJfDgk21Gw64sEI96Aw0fcF10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779379502; c=relaxed/simple;
	bh=LIP+8XHxFjsqzZjdRHeK1w2i9r4zEfx/4uROMjNauDk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=j5cKBFos7KV6IInUZtBgIAx2LzW1S2eabweaAkU8vDnCPso1IvhZI2l5NsiGuwRMWR9/OIPyDa8pVvI54C6vPw/JkSwbcUCVJ98eG6FOJ2PJmRbKHCYffCV8xnOsAYluFcd7ljVk6O4+Dbc/azoPPlxqaU/BcyiPajp8fBU1G6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jhuMatyt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jhuMatyt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A49DB1F000E9;
	Thu, 21 May 2026 16:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779379501;
	bh=gxtsbm/SmAye+VzXYga2kcjyEf3JozifgScqceB3nR8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jhuMatytlMEBKSquLDsXhidMvdeQDCxXmOtrllCDKxvjup9myaKcZkpwuXJsgX3/7
	 kXFAqqpuPiusJxSULpJq+i2QOHkhf/czH4aZSsy84z2gLypOfZRMCd7e9+LYK0Ea+m
	 vdTZxCwJhyHxCBRZAUjYFonv3ZL3X7Cbar4kFoKvTSHqwSTyKkD+cXklzPloVak48F
	 7uhSn8koQkKUOKgMZOBbWNiCbv/iYFWxfnHNxM1qHKu8+czTXHWHPtnki0S8bCf1rc
	 deED1ODSJo3V2MyM2CulxjibUhAiWr4clsBqt/s0oL1TFmmiastNlrr3Af6KHiNU1j
	 HfdCGfzh2PM0g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] dmaengine: rz-dmac: fix dead empty check in
 rz_dmac_chan_get_residue()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Maoyi Xie" <maoyixie.tju@gmail.com>
Cc: dmaengine@vger.kernel.org, Frank.Li@kernel.org, vkoul@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260521144755.3476353-3-maoyixie.tju@gmail.com>
References: <20260521144755.3476353-3-maoyixie.tju@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 16:05:00 +0000
Message-Id: <20260521160500.A49DB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] The patch introduces a logic error that falsely reports pending un=
issued transfers as DMA_COMPLETE.

Pre-existing issues:
- [High] Race condition where unsubmitted descriptors are prematurely execu=
ted by the hardware.
--

commit 0e410e8d5063eb51746f71d6bfff0bc38f086e9b
Author: Maoyi Xie <maoyixie.tju@gmail.com>
Subject: dmaengine: rz-dmac: fix dead empty check in rz_dmac_chan_get_resid=
ue()

This commit changes list_first_entry to list_first_entry_or_null in
rz_dmac_chan_get_residue to properly check if the active list is empty.
If the list is empty, it now safely returns a zero residue instead of
reading from invalid neighboring memory.

> diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
> index 625ff29024de0..3dd76615881ff 100644
> --- a/drivers/dma/sh/rz-dmac.c
> +++ b/drivers/dma/sh/rz-dmac.c
> @@ -723,8 +723,8 @@ static u32 rz_dmac_chan_get_residue(struct rz_dmac_ch=
an *channel,
>  	u32 crla, crtb, i;
> =20
>  	/* Get current processing virtual descriptor */
> -	current_desc =3D list_first_entry(&channel->ld_active,
> -					struct rz_dmac_desc, node);
> +	current_desc =3D list_first_entry_or_null(&channel->ld_active,
> +						struct rz_dmac_desc, node);
>  	if (!current_desc)
>  		return 0;

[Severity: High]
If a client queries the status of a transfer that has been prepared but not
yet issued, or while it is pending in ld_queue waiting for previous
transfers, ld_active will be empty. With this patch, current_desc will be
null and the function will immediately return 0.

Does returning 0 residue here cause rz_dmac_tx_status() to prematurely
report the transfer as finished with a DMA_COMPLETE status?

Before this patch, the invalid pointer coincidentally bypassed the null
check, which allowed the code to continue, correctly search ld_queue, and
return the full descriptor length. Returning early here could cause
clients to free or reuse buffers while the hardware is still scheduled to
access them.

[Severity: High]
This is a pre-existing issue, but looking at how descriptors are queued,
is there a race condition where unsubmitted descriptors are prematurely
executed by the hardware?

In rz_dmac_prep_slave_sg() and rz_dmac_prep_dma_memcpy(), prepared
descriptors are immediately placed into channel->ld_queue before the
client calls dmaengine_submit(). If an existing transfer completes, the
hardware interrupt handler rz_dmac_irq_handler_thread() appears to blindly
pull the next descriptor from ld_queue and initiates the transfer via
rz_dmac_xfer_desc().

Could this result in the hardware executing transfers before the client
has filled the data buffers or actually submitted the transfer?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521144755.3476=
353-1-maoyixie.tju@gmail.com?part=3D2
