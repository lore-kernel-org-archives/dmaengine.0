Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48F23D5227
	for <dmaengine@vger.kernel.org>; Thu, 10 Sep 2026 08:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789028568; cv=none; b=OKTq6Udb1N1G88QrNU3//+e+mWUFhxJrxjrWMCrBf6UJGIBlM0rRuh5NHveCHv89k7BuLqUOSV686dDNnvO8jsW+eMQl0kVNva6ntduavsNoPPyVZHA7gpzjAs5kdC2CSqe3ft6jHz2orIrUOgpQlT4Bx5u+CvQxYMs0gaffWSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789028568; c=relaxed/simple;
	bh=Akr/bJbrq9fVVKiyuPBhV5y32bVxsA7VWQtsDpBApCA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rj4rH4GP/hle5qzdAAXNJIM67Y7/dhGUUVumCyVuCP3JwTdKcdeKyx4/ymQIZc1sBLTGhLv4d/U8tMKDKtB+NA1MLWY77umvpppplHUPzcCEJ3aPhCHkKhtIOIhNzM3cPIH1jMnN+5RFO0vPLsIjuMTxv+vpP64nxOe40eCzr0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B/5Vi8Au; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B/5Vi8Au"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D1431F000FF;
	Thu, 10 Sep 2026 08:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789028566;
	bh=RZBBUPTJbaPsg0vsYi+PoeEapFV7rxsWakC4/BNSCsI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B/5Vi8AuqvjjNZXmxka/izwBSgUKZ0BC8dwKd9J8kobDya6ha9JjoUcfED46VBe1Z
	 OKdGiLGChr38uEAIimLIAVRGNXHjljJpJyGtEPtOzZUwzgVj6nogILQIDbF0T+6/ZO
	 5u9eXT4yHUX3dXlXqLjwvO4OMg/cmpP6AYpWWJAzUjZD+OiIGMO1qEPrpnEpugWJiu
	 vGxNkiSW1uYTTW3obrQzhhNH1aijtL7DqGNivBJT78PdRC0xCMEuL8EHfwKIMLfXPD
	 rG/NURoiVNcq7/Ozl/X1l9dbJQDVq1qpv+eLiiCc60Ea1PNQID5hEpex0CegCwv3fm
	 CXge1m3g86nIA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: dw-axi-dmac: demote apb_regs warning to
 debug
Reply-To: sashiko-reviews@lists.linux.dev
To: "Baineng Shou" <shoubaineng@gmail.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260910080956.2342267-1-shoubaineng@gmail.com>
References: <20260910080956.2342267-1-shoubaineng@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 08:22:45 +0000
Message-Id: <20260910082246.0D1431F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] In `dw_axi_dma_set_hw_channel()`, bitwise operations on a 32-bit s=
igned integer and improper use of `unsigned long` cause severe data loss an=
d Undefined Behavior, permanently corrupting the configuration for channels=
 4-7 in the 64-bit hardware register.
- [High] In several descriptor preparation functions, the error cleanup pat=
h loops over all hardware descriptors to free them using dma_pool_free(), r=
egardless of whether they were successfully allocated. This causes a NULL p=
ointer dereference crash and corrupts atomic tracking counters.
--

commit f6abedf368282d2b40d4a72081898ecaa3428d91
Author: Baineng Shou <shoubaineng@gmail.com>

dmaengine: dw-axi-dmac: demote apb_regs warning to debug

This commit changes the log level of the "apb_regs not initialized" message
from error to debug in dw_axi_dma_set_hw_channel(). This prevents log spam
on supported SoCs that do not carry apb_regs, where reaching this path is
a normal no-op during slave or cyclic transfers.

> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma=
/dw-axi-dmac/dw-axi-dmac-platform.c
> index eebed2474210d..dc04b73c5987b 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> @@ -574,7 +574,7 @@ static void dw_axi_dma_set_hw_channel(struct axi_dma_=
chan *chan, bool set)
>  	unsigned long reg_value, val;

[Severity: High]
This is a pre-existing issue, but does using unsigned long here silently
truncate the 64-bit value returned by lo_hi_readq() on 32-bit platforms?
Assigning the 64-bit result to a 32-bit unsigned long would cause immediate
data loss for the upper 32 bits.

Also, further down in dw_axi_dma_set_hw_channel(), is there a risk of
undefined behavior and unintended zero-extension?

	reg_value &=3D ~(DMA_APB_HS_SEL_MASK <<
			(chan->id * DMA_APB_HS_SEL_BIT_SIZE));

If DMA_APB_HS_SEL_MASK is a 32-bit signed integer, shifting it by 24 (when
chan->id >=3D 3) produces a sign-extended 0x00FFFFFF. When promoted to 64-b=
it,
this zero-extends to 0x0000000000FFFFFFUL, which unintentionally wipes out
the configuration for channels 4-7. For chan->id >=3D 4, it shifts by 32 or
more, invoking undefined behavior.

> =20
>  	if (!chip->apb_regs) {
> -		dev_err(chip->dev, "apb_regs not initialized\n");
> +		dev_dbg(chip->dev, "apb_regs not initialized\n");
>  		return;
>  	}

[Severity: High]
This is another pre-existing issue, but while reviewing the error handling
paths for descriptor allocation, I noticed a potential null pointer
dereference in axi_desc_put().

When functions like dw_axi_dma_chan_prep_cyclic() fail to allocate or set up
hardware descriptors, they jump to their error paths and call axi_desc_put(=
).
The array of hardware descriptors is zero-initialized, and axi_desc_put()
unconditionally loops over all elements to free them:

	dma_pool_free(chan->desc_pool, hw_desc->lli, hw_desc->llp);

If unallocated descriptors are passed in, could hw_desc->lli be null?
Passing a null pointer to dma_pool_free() dereferences it immediately,
crashing the kernel.

Additionally, in the same function:

	atomic_sub(descs_put, &chan->descs_allocated);

Could this corrupt the atomic tracking counter? It appears to subtract the
full array length (descs_put) regardless of how many descriptors were
actually allocated, which would underflow the counter.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910080956.2342=
267-1-shoubaineng@gmail.com?part=3D1
