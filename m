Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6A63DC4AE;
	Wed,  7 Oct 2026 10:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791370793; cv=none; b=QFF3W53QznZc1Psiwr5gyw2F3+0pd5vO4/mOrGYHN3oG2/IM1cxXDUoXooChTrRfj/yGFURGYr/IgAaFWdxwzSCrUJJNRHM7AFV2AybqWAjg+TYW6KQWkiBh40easfwGBOyBhMy6e6mvKzPua4Bowa/45Zw+PbSM91L8jfN7YcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791370793; c=relaxed/simple;
	bh=DSp5/cjwpPBFtnHMUENvDKFsR7swL4Wl9/MC+vwJfFA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=iEIQs/U/hWYlCJ4oUZM8d1/KM5ciOAhj15vow8NosfOUYPq/y8D83eDyzWPqwuzU8JZAwE5U6j135IjPxxgyATXngKqYMbMLiu5zhcndHZukTCVSk0bDQq9lBXgSFfQVJtHrA1cEaC2BSb9H85fpd5YIP+7jZVDLUxBNSm8NsWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gi0Il8zl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gi0Il8zl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C0261F0089C;
	Wed,  7 Oct 2026 10:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791370767;
	bh=XqqMoVBph5LdKWDnuUyakEvSC1AIbdMOHXs5nTupdmA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gi0Il8zlC4yBuTOjJ1XzafXVX+9jOAYzLZE4AFE6BVXueRBOBmTapesF+0o84yVb8
	 3HYgqbm7cFlK7hmvxZQPTMfxotYb6+maEYQY+zYgEYwI3WpayNT6mEWkAqOu/QP6kB
	 Q3HdJiFY3my+uGnPh7sJsrhSrpdMaPwCa9psBr2gLCrJVhM8v4eGiDQ1cORhYSSE1N
	 vMoxqfxkExr8e32fbTKrhJ7v31iUMih2FrduWi6qJqYAz9dy8K/hD9rQiELPWWrr3i
	 Vz+Ua2hPsXJVSsgrt7RJSItvpTV54EDf6GvcJ+FZrSgBUXztloRR9iXzo8UfJQgQVR
	 yRe+0OHoZALQA==
Message-ID: <sashiko-outbox-162900@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 13/20] drivers: soc: ti: k3-ringacc: handle absence
 of tisci
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Sree Kartheek Adivi" <s-adivi@ti.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20261007102936.2402427-14-s-adivi@ti.com>
References: <20261007102936.2402427-1-s-adivi@ti.com>
 <20261007102936.2402427-14-s-adivi@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 10:59:27 +0000
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dma: k3-ringacc: DMA use-after-free if hardware size clear times o=
ut during teardown
--

commit 48061d2f6a019df3afcaa81ed2b4f501e491cdef
Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>

drivers: soc: ti: k3-ringacc: handle absence of tisci

This patch handles the absence of TISCI by falling back to direct register
writes. This adds support for platforms that do not have TISCI firmware=20
like AM62L.

> diff --git a/drivers/soc/ti/k3-ringacc.c b/drivers/soc/ti/k3-ringacc.c
> index 5966db4327b13..9195d91fae732 100644
> --- a/drivers/soc/ti/k3-ringacc.c
> +++ b/drivers/soc/ti/k3-ringacc.c

[ ... ]

> @@ -576,10 +665,40 @@ static void k3_ringacc_ring_free_sci(struct k3_ring=
 *ring)
>  	ring_cfg.index =3D ring->ring_id;
>  	ring_cfg.valid_params =3D TI_SCI_MSG_VALUE_RM_ALL_NO_ORDER;
> =20
> -	ret =3D ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
> -	if (ret)
> -		dev_err(ringacc->dev, "TISCI ring free fail (%d) ring_idx %d\n",
> -			ret, ring->ring_id);
> +	if (!ringacc->tisci) {
> +		u32 reg;
> +
> +		writel(K3_RINGACC_RT_INT_ENABLE_SET_COMPLETE | K3_RINGACC_RT_INT_ENABL=
E_SET_TR,
> +		       &ring->intr->clr);
> +
> +		reg =3D readl(&ring->cfg->size);
> +		reg &=3D ~K3_DMARING_CFG_SIZE_MASK;
> +		writel(reg, &ring->cfg->size);
> +
> +		ret =3D readl_poll_timeout(&ring->cfg->size, reg,
> +					  !(reg & K3_DMARING_CFG_SIZE_MASK),
> +					  1, 100);
> +		if (ret) {
> +			dev_err(ringacc->dev, "ring %d size clear timeout\n",
> +				ring->ring_id);
> +			return;

[Severity: High]
If readl_poll_timeout() times out here, the early return prevents clearing
the ring base address registers (ba_lo and ba_hi).

Since the caller k3_ringacc_ring_free() subsequently frees the ring memory
unconditionally via dma_free_coherent(), could this lead to a DMA=20
use-after-free if the hardware continues to access those still-programmed=20
addresses?

Does the teardown path need to ensure the DMA addresses are cleared even
if the size clearing operation times out?

> +		}
> +
> +		reg =3D readl(&ring->cfg->size);
> +		reg |=3D ring_cfg.count & K3_DMARING_CFG_SIZE_MASK;
> +
> +		writel(reg, &ring->cfg->size);
> +
> +		writel(ring_cfg.addr_lo, &ring->cfg->ba_lo);
> +		writel((ring_cfg.addr_hi & K3_DMARING_CFG_ADDR_HI_MASK) +
> +				(ring_cfg.asel << K3_DMARING_CFG_ASEL_SHIFT),
> +				&ring->cfg->ba_hi);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007102936.2402=
427-1-s-adivi@ti.com?part=3D13
