Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625CD47D949
	for <dmaengine@vger.kernel.org>; Thu, 20 Aug 2026 17:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787247901; cv=none; b=AHhtn+ut9GretR49kVgyR+SMK5TpyLPu9jJH4aG9uaXhATtdBkpGdF7xfmTnaIPqIqm1IzETgCpaLUlqhmvd06nFdBk+v6j0+E3srunOwAa9WboCQNgDyP6kqX5FXjg9VxBcyjD3xz3QTVsu28OE0fHb/EqxDOlDwFbMrVsq75g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787247901; c=relaxed/simple;
	bh=L9rC5rRge5CgzHdu4AbAIY1enUd7IzTFODct4n23RKg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WyGpo1nFqcVeHcoToGhONnSHNiBXhXtOGwHrF0Bl7ADWILW6UM2gcC3HcwkO6bnQcq0sXBgDb+qRN1gJwV7m7Djb7l6SXPqPXYFzsny6TdC64jdYYnuyJ0bqODt4Dz2VXmvz0dCs8nVQ7bQAlhivvRtgDqoLn5kifAbQ9td7i1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oFnFYHBC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oFnFYHBC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC1831F000E9;
	Thu, 20 Aug 2026 17:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787247899;
	bh=/+uyGgeCGwCWQmW/HxAh/HO6uqIrkN7XofpO/0qbKKo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oFnFYHBCulOBgmd8tCSVVSB+ndfNdaKJNqV6KBeeU1r3Qc9ePf90rDqbXu42cn8Fc
	 UTWOXrOKaFJ+NRRzUhk3buUUcusx84WZIER9oY7gOHD1LX0FMgBEGrQgMz8a+s9xNc
	 tL0oTAy89j+ax4rrCJ0rt9SREn3Tk0NBTJYWart6qUXpRB2tIb3CNN5ZR+xscbYHWF
	 ebW2AAkd8RppVxNlhKu69SYbjH9TJ9YT++CtIs5WwNIvMgOldLRz7VUyJDM5dFgA6M
	 0nq0epy6dWnLmPhy/rjx1pUNWUqTl2iAr1tTKTwV9l6LkvLSLh0OcAMt1qJaP6yn5u
	 F6xTuu6iZgPyQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 01/10] dmaengine: dw-edma: Add
 dw_edma_core_ll_cur_idx() to get current LL entry index
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260820173439.2004068-2-den@valinux.co.jp>
References: <20260820173439.2004068-1-den@valinux.co.jp>
 <20260820173439.2004068-2-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 17:44:59 +0000
Message-Id: <20260820174459.BC1831F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Unsigned subtraction underflow causes out-of-bounds hardware poi=
nter values to return a large positive index instead of a negative error co=
de.
--

--- Patch [1]: [PATCH v6 01/10] dmaengine: dw-edma: Add dw_edma_core_ll_cur=
_idx() to get current LL entry index ---
commit a5cf77298fa28da8c44ef71a7e3da99c79085cf7
Author: Frank Li <Frank.Li@nxp.com>

dmaengine: dw-edma: Add dw_edma_core_ll_cur_idx() to get current LL entry i=
ndex

This commit introduces the dw_edma_core_ll_cur_idx() function to retrieve
the current linked list entry index. This prepares the driver for the
dynamic addition of DMA requests while the DMA engine is running.

> diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/=
dw-edma-v0-core.c
> index abc1bd4c0be2e..cc80591829403 100644
> --- a/drivers/dma/dw-edma/dw-edma-v0-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
> @@ -616,6 +616,25 @@ static void dw_edma_v0_core_ch_doorbell(struct dw_ed=
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
> +	 * LL regions stay within one 4 GiB address window. Reject an all-ones
> +	 * MMIO value. If the low word is zero, use the high word to distinguish
> +	 * a nonzero boundary address from an unprogrammed all-zero context.
> +	 */
> +	if (val =3D=3D U32_MAX ||
> +	    (!val && !GET_CH_32(chan->dw, chan->dir, chan->id, llp.msb)))
> +		return -EINVAL;
> +
> +	return (val - base) / EDMA_LL_SZ;

[Severity: Medium]
Is it possible for val to be less than base if the channel context is
uninitialized and holds a stale linked-list pointer from a previous
allocation at a lower physical address?

Since val and base are unsigned 32-bit integers, if val < base, the operati=
on
val - base underflows to a large unsigned integer. Dividing this by
EDMA_LL_SZ yields a massive positive index that fits into the signed int
return type, rather than returning a negative error code as intended.

Would it make sense to verify that val is >=3D base, or to bounds check the
resulting index against chan->ll_max to prevent potential out-of-bounds
reads or writes?

> +}
> +

[ ... ]

> diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/=
dw-hdma-v0-core.c
> index 36ee72efcd317..19da1c8fd6159 100644
> --- a/drivers/dma/dw-edma/dw-hdma-v0-core.c
> +++ b/drivers/dma/dw-edma/dw-hdma-v0-core.c
> @@ -384,6 +384,25 @@ static void dw_hdma_v0_core_ch_doorbell(struct dw_ed=
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
> +	 * LL regions stay within one 4 GiB address window. Reject an all-ones
> +	 * MMIO value. If the low word is zero, use the high word to distinguish
> +	 * a nonzero boundary address from an unprogrammed all-zero context.
> +	 */
> +	if (val =3D=3D U32_MAX ||
> +	    (!val && !GET_CH_32(chan->dw, chan->dir, chan->id, llp.msb)))
> +		return -EINVAL;
> +
> +	return (val - base) / EDMA_LL_SZ;

[Severity: Medium]
Could this suffer from the same underflow issue as the v0 core implementati=
on
if val is less than base?

> +}
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820173439.2004=
068-1-den@valinux.co.jp?part=3D1
