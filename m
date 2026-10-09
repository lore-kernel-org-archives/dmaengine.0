Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4C545198F
	for <dmaengine@vger.kernel.org>; Fri,  9 Oct 2026 16:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791561836; cv=none; b=VszpUvlFfm4VmGUeAZny6MJNoGsJp/ac6mchoOWUlC8jbtoccEg8kFJdJE0J1wqH8hKjti457gVoQrpMxFmTkDElMws2fA2CCDyju319rCo8ic5ATxeFV31xK5vmiq6+rzhsdqX8d4JbS69j/IX228ZCA+Bm6pzw4lx23ijp2BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791561836; c=relaxed/simple;
	bh=7W94mZXGa92eeGCXxzgc/erblKSppQmVZfuisbl0DOQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=YyGcAJrpPa6LEa+FF/Z7ZEVkj0jhq8/OHFcXGmNIc4/QhcBjSjdpf1UP+4YvXx99hbqJeHa50eXMQ9YNf5U0oTmbGmxr+FZXMHZURBpOrx5qeW8JepJc2QwRtgPzuSfcFaiIFsODc+VLXbRfIypsqsghlVMXPuNMJiijOEeWRes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H8/DPXlW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H8/DPXlW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6CAF1F00893;
	Fri,  9 Oct 2026 16:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791561835;
	bh=Tw5LYnsPXKAIB82tiUo8VJZdLRzsiDBpcJtX1hwtBp4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H8/DPXlWhG9huHxJstcuzHZJIfpn7c+KL7XH30uDXPhAeu6/lr5tQWMLa4QSHMJBj
	 eQ3XAFkFTBYJHAmCGUoytyDKUSNT9hlmS+6AGo4ynIkp/oOQYPVvWvqMn93UcxWKka
	 twvCIkFFnWU95Vonsr5U+/ZWmfgP15D4ClLjJFdv7RUt6ZDbhahiAglz1pShyNwipw
	 /FdEjMVLwrAh2iHiLR0TbXj/C6wpEB0izG6mCdMy6APL3RJt2Jp524apOe0RKJMCnw
	 IsHlxD2ap7PTgAjv1QATscGPSAL17DoCha+5+B4sQsM0LuodpJ4UK1+TqOh3zL0HcR
	 K3o7EqtVaV/VQ==
Message-ID: <sashiko-outbox-165812@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/9] dmaengine: dma-axi-dmac: Use bus width
 capability helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TnVubyBTw6E=?= <nuno.sa@analog.com>
Cc: dmaengine@vger.kernel.org, Frank.Li@kernel.org, vkoul@kernel.org
In-Reply-To: <20261009-dmaengine-support-wider-dma-masks-v5-2-4c4e63a7a1af@analog.com>
References: <20261009-dmaengine-support-wider-dma-masks-v5-0-4c4e63a7a1af@analog.com>
 <20261009-dmaengine-support-wider-dma-masks-v5-2-4c4e63a7a1af@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 16:03:54 +0000
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dmaengine: axi-dmac: Incorrect copy_align assignment causes UB for=
 >=3D 32-byte widths
--

commit 32d178f66f02ed239c1f773e106395cd1e81ae9c
Author: Nuno S=C3=A1 <nuno.sa@analog.com>
Subject: dmaengine: dma-axi-dmac: Use bus width capability helpers

This commit transitions the AXI DMA controller driver to use dma_bus_width_=
set()
to advertise source and destination bus widths. This allows the driver to e=
xpress
widths of 32 bytes and above while maintaining legacy fields.

> diff --git a/drivers/dma/dma-axi-dmac.c b/drivers/dma/dma-axi-dmac.c
> index d47ff27e1408f..ca9cf1e0c5e46 100644
> --- a/drivers/dma/dma-axi-dmac.c
> +++ b/drivers/dma/dma-axi-dmac.c
[ ... ]
> @@ -1262,8 +1262,13 @@ static int axi_dmac_probe(struct platform_device *=
pdev)
>  	dma_dev->device_terminate_all =3D axi_dmac_terminate_all;
>  	dma_dev->device_synchronize =3D axi_dmac_synchronize;
>  	dma_dev->dev =3D &pdev->dev;
> -	dma_dev->src_addr_widths =3D BIT(dmac->chan.src_width);
> -	dma_dev->dst_addr_widths =3D BIT(dmac->chan.dest_width);
> +	ret =3D dma_bus_width_set(dma_dev->src_bus_widths, dmac->chan.src_width=
);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D dma_bus_width_set(dma_dev->dst_bus_widths, dmac->chan.dest_widt=
h);

[Severity: High]
Does this migration to support widths of 32 bytes and above expose an
undefined behavior in the alignment checks?

Later in axi_dmac_probe(), the copy alignment is assigned the literal byte
width:

    dma_dev->copy_align =3D (dmac->chan.address_align_mask + 1);

However, dma_dev->copy_align expects a log2 alignment exponent (as defined
by enum dmaengine_alignment). The DMA core uses dmaengine_check_align(),
which calculates the alignment using a bitwise shift:

include/linux/dmaengine.h:dmaengine_check_align() {
    ...
    return !(((1 << align) - 1) & (off1 | off2 | len));
}

With this patch explicitly allowing widths of 32 bytes and above,
copy_align can now reach 32. This results in an operation of 1 << 32,
which triggers undefined behavior on 32-bit arithmetic, potentially
invalidating DMA transfer alignment checks.

> +	if (ret)
> +		return ret;
>  	dma_dev->directions =3D BIT(dmac->chan.direction);
>  	dma_dev->residue_granularity =3D DMA_RESIDUE_GRANULARITY_DESCRIPTOR;
>  	dma_dev->max_sg_burst =3D 31; /* 31 SGs maximum in one burst */

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009-dmaengine-=
support-wider-dma-masks-v5-0-4c4e63a7a1af@analog.com?part=3D2
