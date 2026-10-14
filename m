Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B97545D95
	for <dmaengine@vger.kernel.org>; Wed, 14 Oct 2026 14:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791988429; cv=none; b=dstH0kWzclvbDOejLa1szAlhO88popwFbMkslc9MPCErqDdycbsbbKq4JYC0NPd9NQeB8rXZsQSf1V/an4Y9UN1ZdCQb5PpNXRc8tAZl3SlvNyxxoZMQJvhnx5c3UX11bCKIx1Lc5iTnDRWgLVjlCqr+msOT3dnX92WnBxFlunE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791988429; c=relaxed/simple;
	bh=RvhFW9WfPcNI1HIFiMNi3VIdgqBi81u2XOETSHHTkcY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=OYJVwGLBpfRy3aokWxsMHDFjw5xyDaL96E8oSP3lEXVDKDcIhqlYLOLGoJGfoZ25oUlCDJ4ZwjaggYFHpR2C/bGOoUwvANTJKBCYjWk/S04rDaL0js19Rv/2RPBhLKXfEjciu8U3MOsHGzXIm2Bz92vxqXskeSVW2sMHYnIKuS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HXV90zwT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HXV90zwT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54A881F000C4;
	Wed, 14 Oct 2026 14:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791988427;
	bh=E+x0aOUsNsok41sawh2OrpDk6ITzuvyomPwhZp2lm9s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HXV90zwTtxD+25OIJ7abm2PpPOdi7cSkPMp2ERiDwD1vYATSMgETiqeQRb02f7wnQ
	 JEVeJfZs1bTTlxD5iVoWgcjfmS50laaQgzBzwKkkep/ATOmDP6x3lJ7gjaBfPRxu2J
	 lRmtFK6iOxBZsCfWGHo5ZZTlMdxW8N4yJ6bg86q6RNmzKeUZ2PZKbWF1bZDIQrtg+M
	 k0p1dmFRVIjPa/czyZG96FSOD1e4Lq9EuopxDp4Bw5LtJxgi5kxh5tBwuJcGE1+4hi
	 VJlFm/QCAstd+GDCjpR2JJHFU/3uduFYxJuNNbQVwfYDiI5nVICTChaGKKKPAUQ8PG
	 YE5faOBYSdhfA==
Message-ID: <sashiko-outbox-171431@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/9] dmaengine: dma-axi-dmac: Use bus width
 capability helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TnVubyBTw6E=?= <nuno.sa@analog.com>, dmaengine@vger.kernel.org
Cc: vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261014-dmaengine-support-wider-dma-masks-v6-2-5b3ffdef8191@analog.com>
References: <20261014-dmaengine-support-wider-dma-masks-v6-0-5b3ffdef8191@analog.com>
 <20261014-dmaengine-support-wider-dma-masks-v6-2-5b3ffdef8191@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 14:33:46 +0000
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dmaengine: axi-dmac: copy_align assigned literal byte width instea=
d of log2
--

commit 42cec2a379cf13fe7096c3154a7c87e99d4f9258
Author: Nuno S=C3=A1 <nuno.sa@analog.com>

dmaengine: dma-axi-dmac: Use bus width capability helpers

Advertise the source and destination bus widths through the new
dmaengine_bus_width_set() helper instead of open-coding the legacy
BIT() mask. This moves the driver onto the representation that can
express widths of 32 bytes and above while keeping the legacy u32 fields
populated during the transition.

> diff --git a/drivers/dma/dma-axi-dmac.c b/drivers/dma/dma-axi-dmac.c
> index d47ff27e1408f..ab436e9d6cbc3 100644
> --- a/drivers/dma/dma-axi-dmac.c
> +++ b/drivers/dma/dma-axi-dmac.c
> @@ -1262,8 +1262,13 @@ static int axi_dmac_probe(struct platform_device *=
pdev)
>  	dma_dev->device_terminate_all =3D axi_dmac_terminate_all;
>  	dma_dev->device_synchronize =3D axi_dmac_synchronize;
>  	dma_dev->dev =3D &pdev->dev;
> -	dma_dev->src_addr_widths =3D BIT(dmac->chan.src_width);
> -	dma_dev->dst_addr_widths =3D BIT(dmac->chan.dest_width);
> +	ret =3D dmaengine_bus_width_set(&dma_dev->src_bus_widths, dmac->chan.sr=
c_width);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D dmaengine_bus_width_set(&dma_dev->dst_bus_widths, dmac->chan.de=
st_width);
> +	if (ret)
> +		return ret;

[Severity: High]
Does this change cause undefined behavior when enabling 32-byte and larger =
bus
widths?

The field copy_align expects an enum dmaengine_alignment (which represents =
the
base-2 logarithm of the alignment), but it gets assigned a literal byte wid=
th
further down in axi_dmac_probe():

drivers/dma/dma-axi-dmac.c:axi_dmac_probe() {
    ...
	dma_dev->copy_align =3D (dmac->chan.address_align_mask + 1);
    ...
}

Any caller invoking dmaengine_check_align() (e.g. via is_dma_copy_aligned()=
 in
dmatest or async_tx) will then perform a bit shift that can exceed the width
of a 32-bit integer:

include/linux/dmaengine.h:dmaengine_check_align() {
    ...
	return !(((1 << align) - 1) & (off1 | off2 | len));
    ...
}

If align is 32 or more, 1 << align results in undefined behavior because the
shift exponent is too large. This typically results in a 0 mask, accepting =
all
unaligned addresses and potentially leading to DMA hardware faults.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-dmaengine-=
support-wider-dma-masks-v6-0-5b3ffdef8191@analog.com?part=3D2
