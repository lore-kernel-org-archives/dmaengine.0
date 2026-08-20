Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E57453A49
	for <dmaengine@vger.kernel.org>; Thu, 20 Aug 2026 13:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787232600; cv=none; b=WhgjGdgIZoN/2QZQ0Hi5izgRrb5RRfR+VI5S/Y3ux5e/hs+sjsymlwN+4DI0dUvgRhndXHzgshAUFzPZWA17P4bhR893CsqPLYiXYhC1gwxOK79+hJ9PNVDbQ9ocWLHJPigZBsUPya6UFANQqddr5ERaa9PVEmU3DVAEQ9aD5A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787232600; c=relaxed/simple;
	bh=KyCS4MEkleObcl9X5EWXMc+KM7UgFqLgD4i6mRtdWh0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XRc0RqqUIKcb09XRaoTKhREbA1nnOftrJTbvvj8wdIzBfceoQ3DrzhFWutBttROIGOlu598IIzrq7vyOcqDcVG8UW7wG7aNYRoaCbdjfoyMOJddyvaVY4DgBha9NhCm+wTPBGA3On/URufrKvlFdw7n+F1HA24jt1EzlKEU4VGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PFomBdMf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PFomBdMf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 835D31F00A3A;
	Thu, 20 Aug 2026 13:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787232598;
	bh=XOLtzD5uweNSH1d7eUxKZt5sZ3A4IhHBZuaAX7i4MaU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PFomBdMf90C6GxQ34m7ukxWoQdArNbkREu7PT0PHrv1ajozODmPTuNd63zAzYZiC4
	 yJjoQvdc7LaMnyEuJIJq8BP6t44cbzwopkK7eqSbopT52aIVxqJfHqL1VgyM8QPzrp
	 E2RKCq/VP/rRAtkfqfMZaIlEsGXEg4uQZpGlXFgrLJDIEUEuqYsXW4fYDqJAnY9Jyl
	 59C0M73dN9jpfhdyihzdNV6vAnWAt8AIjrIdSrsMiNOLtLDp0cU7dlGDDU5PwjXFT3
	 0tsp5zZVqePG1+JjNYsVLiudHIpmZe6h6oune11fU6sLJGyMjJ18Ektmbd29aJPbrE
	 rY8V21dy0tD6g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 05/13] dmaengine: ste_dma40: Fix LCLA allocation
 order
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260820-dma40-fixes-v2-5-63238334c707@kernel.org>
References: <20260820-dma40-fixes-v2-0-63238334c707@kernel.org>
 <20260820-dma40-fixes-v2-5-63238334c707@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 13:29:58 +0000
Message-Id: <20260820132958.835D31F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] DMA_CYCLIC capability applied to wrong dma_device during initializ=
ation.
--

--- Patch [5]: [PATCH v2 05/13] dmaengine: ste_dma40: Fix LCLA allocation o=
rder ---
commit d327ef86f7f30a5a539d2fef537e53e5f0f2dc5f
Author: Linus Walleij <linusw@kernel.org>

dmaengine: ste_dma40: Fix LCLA allocation order

This commit modifies d40_lcla_allocate() to use get_order() to determine
the page allocation order, instead of directly passing the calculated
number of pages to __get_free_pages() and free_pages().

Closes: https://lore.kernel.org/dmaengine/20260819225114.AE1511F000E9@smtp.=
kernel.org/

> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index 384c2f3805b02..804eb5eab06b4 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
[ ... ]
> @@ -3670,7 +3669,7 @@ static int __init d40_probe(struct platform_device =
*pdev)
> =20
>  	if (!base->lcla_pool.base_unaligned && base->lcla_pool.base)
>  		free_pages((unsigned long)base->lcla_pool.base,
> -			   base->lcla_pool.pages);
> +			   base->lcla_pool.alloc_order);
> =20
>  	kfree(base->lcla_pool.base_unaligned);
> =20

[Severity: High]
This is a pre-existing issue, but I noticed a potential problem in
d40_dmaengine_init():

drivers/dma/ste_dma40.c:d40_dmaengine_init() {
    ...
	d40_chan_init(base, &base->dma_both, base->phy_chans,
		      0, num_reserved_chans);

	dma_cap_zero(base->dma_both.cap_mask);
	dma_cap_set(DMA_SLAVE, base->dma_both.cap_mask);
	dma_cap_set(DMA_MEMCPY, base->dma_both.cap_mask);
	dma_cap_set(DMA_CYCLIC, base->dma_slave.cap_mask);
    ...
}

Does this code apply the DMA_CYCLIC capability to the wrong dma_device duri=
ng
initialization?

By setting DMA_CYCLIC on base->dma_slave.cap_mask instead of
base->dma_both.cap_mask, the dma_both device seems to lack this capability.

Will this cause initialization failures for peripherals requesting a cyclic
channel from dma_both?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820-dma40-fixe=
s-v2-0-63238334c707@kernel.org?part=3D5
