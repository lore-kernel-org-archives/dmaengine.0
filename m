Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB894D2ECC
	for <dmaengine@vger.kernel.org>; Wed, 29 Jul 2026 14:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785336891; cv=none; b=T1vH7r+/w4F/AbQBF4VBwQiSisj3QekgA+uVUW+RDoUDM9r1o4ZI3OmW5ysYDVGFQXYTarPhVl7uUjWHNAcwR42li2YKN99HqRRh3elw9DK3AdyNQNca7C0bXs7Tla1mZQXOK9QW9Qu0uWW2VzGQkMirMsWc9REsJzYURaVLeQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785336891; c=relaxed/simple;
	bh=1pAPTXNGHKqUTzjgKm87BTe5yer+RbbIPmWbAA9bfuE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oGgPuD5R535Qh22lT/YR22W1Q0C8Kz0QxQaqTmaK+VXzGs/ZfUH++e8EHz3HOuqxjGK6aDhBfg2fVujeShXAjp5rskC8/Ys/gWnJ4ZFDzToaYmJAvLpX65PylKI50W5/PFhd/DGZy99BYRUQHEQXj9Y3SyVk48M3/Fi0bczXArY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oZTRzDO4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oZTRzDO4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36D751F000E9;
	Wed, 29 Jul 2026 14:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785336888;
	bh=gjH1iKS/3RIxZsxC6qac92VA7nQ5PwgrVagqcTp9DRs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oZTRzDO4BfAMS5j3mZTapZau4qQ+/xfUjCE6SKJxE1zXsR1wVuVJ/RuwoGT6RhUzS
	 7mnrPBxvQ4uvIHzHODIZSEcPjg0xPyYnc8RhsIYic3TZe9oBNu1I8A0kUGB/H5MIsC
	 kfv2Pl45AcPaYCqhgz6OKll49kg+Zl2k+Xj2XvJiGHVXMuWxAslS45u+bUGAy1Kbfn
	 bX6Sbd/+r+6kepVCbPGHBSZ6Ac/m8r7D3c8m5Aql8WlJ8GnT4hKZgQuePc2lyN0KzX
	 QMxK67SBBhWP0LGX9P/YjfUJM2DfuPSdMDENjAKQARR9Wm6740qPNBWfb5vCTviRUZ
	 LdNHMDyZROnVA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 01/24] dmaengine: dw-edma: Add
 dw_edma_core_ll_cur_idx() to get current LL entry index
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260729143036.3087722-2-den@valinux.co.jp>
References: <20260729143036.3087722-1-den@valinux.co.jp>
 <20260729143036.3087722-2-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 14:54:47 +0000
Message-Id: <20260729145448.36D751F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The linked-list index computation lacks bounds checking and underf=
lows on PCIe link loss, returning a massive positive integer that bypasses =
negative error checks.
--

--- Patch [1]: [PATCH v4 01/24] dmaengine: dw-edma: Add dw_edma_core_ll_cur=
_idx() to get current LL entry index ---
commit 97ea1bc0d0cff65116038aa18e1ba530b5bbe7c9
Author: Frank Li <Frank.Li@nxp.com>

dmaengine: dw-edma: Add dw_edma_core_ll_cur_idx() to get current LL entry i=
ndex

This commit adds dw_edma_core_ll_cur_idx() to retrieve the current LL entry
index, preparing for dynamic addition of DMA requests while the DMA engine
is running.

> diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/=
dw-edma-v0-core.c
> index abc1bd4c0be2e..7b9a95ecedbb6 100644
> --- a/drivers/dma/dw-edma/dw-edma-v0-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-v0-core.c

[ ... ]

> @@ -616,6 +616,24 @@ static void dw_edma_v0_core_ch_doorbell(struct dw_ed=
ma_chan *chan)
>  		  FIELD_PREP(EDMA_V0_DOORBELL_CH_MASK, chan->id));
>  }
> =20
> +static int dw_edma_v0_core_ll_cur_idx(struct dw_edma_chan *chan)
> +{
> +	u32 base, val;
> +
> +	val =3D GET_CH_32(chan->dw, chan->dir, chan->id, llp.lsb);
> +	base =3D lower_32_bits(dw_edma_core_get_ll_paddr(chan));
> +
> +	/*
> +	 * LL regions stay within one 4 GiB address window. If the low word is
> +	 * zero, use the high word to distinguish a nonzero boundary address
> +	 * from an unprogrammed all-zero context.
> +	 */
> +	if (!val && !GET_CH_32(chan->dw, chan->dir, chan->id, llp.msb))
> +		return -EINVAL;
> +
> +	return (val - base) / EDMA_LL_SZ;

[Severity: High]
If a PCIe link loss or hardware error occurs, the MMIO read for llp.lsb cou=
ld
return all-Fs (0xFFFFFFFF). Could this cause the unsigned subtraction of
(val - base) to underflow into a massive positive integer?

If val is 0xFFFFFFFF, the !val check is bypassed. After division by EDMA_LL=
_SZ
(24), this yields a very large positive index that fits comfortably within a
signed 32-bit int. Will this bypass negative error checks in callers and le=
ad
to an out-of-bounds memory access when the index is used?

> +}

[ ... ]

> diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/=
dw-hdma-v0-core.c
> index 36ee72efcd317..d849220f3b5d3 100644
> --- a/drivers/dma/dw-edma/dw-hdma-v0-core.c
> +++ b/drivers/dma/dw-edma/dw-hdma-v0-core.c

[ ... ]

> @@ -384,6 +384,24 @@ static void dw_hdma_v0_core_ch_doorbell(struct dw_ed=
ma_chan *chan)
>  	SET_CH_32(dw, chan->dir, chan->id, doorbell, HDMA_V0_DOORBELL_START);
>  }
> =20
> +static int dw_hdma_v0_core_ll_cur_idx(struct dw_edma_chan *chan)
> +{
> +	u32 base, val;
> +
> +	val =3D GET_CH_32(chan->dw, chan->dir, chan->id, llp.lsb);
> +	base =3D lower_32_bits(dw_edma_core_get_ll_paddr(chan));
> +
> +	/*
> +	 * LL regions stay within one 4 GiB address window. If the low word is
> +	 * zero, use the high word to distinguish a nonzero boundary address
> +	 * from an unprogrammed all-zero context.
> +	 */
> +	if (!val && !GET_CH_32(chan->dw, chan->dir, chan->id, llp.msb))
> +		return -EINVAL;
> +
> +	return (val - base) / EDMA_LL_SZ;

[Severity: High]
Like the v0 core implementation, does this HDMA arithmetic need bounds chec=
king
to prevent a stale hardware pointer where val < base, or a PCIe link loss,
from returning a large positive integer instead of a negative error code?

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729143036.3087=
722-1-den@valinux.co.jp?part=3D1
