Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE01C3EC80A
	for <dmaengine@vger.kernel.org>; Mon, 31 Aug 2026 12:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788177675; cv=none; b=UmNpglNvOXls1H+6UG2hXXkA7Ua5dy6JkXyiMCPQbjnOovIrKGTLX3baeohVuaLwM7W+y/04nvsbOdvcuudCFeVTk20hPOKe+sQx1xxA3fDqzdd10NUXEOX0ohF4JKiJPBV5OofGyO8fFLnCcLC4vPlsAlCE9lMLEtg/0v9Ju8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788177675; c=relaxed/simple;
	bh=4USNphwcYme9XtAn5sOYde2RStjTQcPvO2mrIQbCAT0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jefe+SF+yZInum4goMFFXyz6w8H7HdouaU4hPgDuCkDjoa1+bxJtdnZNRuw3hns9IS7QJbVAwLCZAxCyqntGCZLCGt6jWMYuxEgFre99xRsNoOrh4tZ616g3GOU+DiTnKed6SB97bEUABx2wGyA3rN9nKhrWhQbD00pLlfy97I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f0sNau2x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f0sNau2x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07E861F000E9;
	Mon, 31 Aug 2026 12:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788177672;
	bh=2zZqh99PaKlGIpVVE1Gmg21UPx6sWkhaInA8NZkYFIs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f0sNau2xKmX2EN24AXwNKO8ChbHV/sKbav9xQSvzTCAeL8oSUVDKEUpik745npSJO
	 92MIeha05AzO7QXv3pKzwdij5/AXVv0ZNy1ZBcjeeq00aurpIJgqfj1QXAmWU84Hue
	 +U5H+2omOpKVZ+7y7ikjOPINoPgfNWRebwjVboYyemtVzUxruB43hgMN25hgdUDNg6
	 Jk0QGHhousz+uh1DXaZ8nLDBkekmBk/1/Ps3EQgPUxDVFURaQRAxJ6dC3HoPWIRrYp
	 lvdg3uGti3wpz/9+DlDSjvdRBu3dJUiQ3JDH+nuxeUIsUQqbcVMyV6sMiawl1MJYMG
	 U6gmh92R/3lXw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/9] dmaengine: dma-axi-dmac: Use bus width
 capability helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TnVubyBTw6E=?= <nuno.sa@analog.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260831-dmaengine-support-wider-dma-masks-v3-2-507d97496f2d@analog.com>
References: <20260831-dmaengine-support-wider-dma-masks-v3-0-507d97496f2d@analog.com>
 <20260831-dmaengine-support-wider-dma-masks-v3-2-507d97496f2d@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 12:01:11 +0000
Message-Id: <20260831120112.07E861F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The legacy `src_addr_widths` and `dst_addr_widths` fields in `st=
ruct dma_device` are left uninitialized (0), breaking bisection for unconve=
rted dmaengine consumers and directly contradicting the commit message.
--

commit e0d3ea2099710250e81c32b95cc62ac180daeb2f
Author: Nuno S=C3=A1 <nuno.sa@analog.com>

dmaengine: dma-axi-dmac: Use bus width capability helpers

Advertise the source and destination bus widths through the new
dma_set_{src,dst}_bus_width() helpers instead of open-coding the legacy
BIT() mask.

> diff --git a/drivers/dma/dma-axi-dmac.c b/drivers/dma/dma-axi-dmac.c
> index d47ff27e1408f..dc56178cafe08 100644
> --- a/drivers/dma/dma-axi-dmac.c
> +++ b/drivers/dma/dma-axi-dmac.c
[ ... ]
> @@ -1262,8 +1263,13 @@ static int axi_dmac_probe(struct platform_device *=
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
> +	if (ret)
> +		return ret;

[Severity: Medium]
Will this break bisection for unconverted dmaengine consumers by leaving the
legacy src_addr_widths and dst_addr_widths uninitialized?

The commit message states the intent is "keeping the legacy u32 fields
populated during the transition."

However, this patch removes the assignments to dma_dev->src_addr_widths and
dma_dev->dst_addr_widths and replaces them with dma_bus_width_set(), which =
only
populates the new bitmap masks.

The DMA engine core's fallback logic in dma_get_slave_caps() (which folds t=
he
new bitmaps into the legacy caps fields) is placed inside an if
(device->device_caps) block. Because axi-dmac does not implement a
device_caps() callback, this fallback is never executed.

Consequently, will unconverted legacy consumers (like IIO) querying channel
capabilities during bisection receive caps->src_addr_widths =3D=3D 0, causi=
ng DMA
transfer configurations to fail?

While this regression is fixed later in the patch series (when legacy fields
are dropped and consumers are fully converted), it seems to cause a bisecti=
on
breakage in the intermediate patches.

Could the legacy assignments be retained alongside the new helper calls to
match the commit message's stated intent?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-dmaengine-=
support-wider-dma-masks-v3-0-507d97496f2d@analog.com?part=3D2
