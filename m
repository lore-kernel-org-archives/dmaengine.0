Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A223E9C32
	for <dmaengine@vger.kernel.org>; Mon, 31 Aug 2026 11:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788177594; cv=none; b=iPKi92RyIDKamY2wI+XY6tt77WCr4FKEXXrsqezoNyLuvDx8+qQmduczgqSwwMbId+WEAw7niKR6uy7/l0057USsmqnl/DmIhO186c3ZhcfmiUp6NZpShEKiD5a7lIA1uZaRZiL9IG9BSzgwZIBYuDLp8czBce4gnNr9XZxe8DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788177594; c=relaxed/simple;
	bh=vdA1+tYTjhIA4xodMakBHfRAaLt9Ko3KpG3QS0Yz+Vs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nTTxmGT5D5mFpcNdvG4wWz2o0QA5BDd92P65MqmW9KHmJ+itNyg/0CSJxiQaRtM4x1RozwVn1eEVL5XEf/7YunhfPu+hooLyNm1c+UiTtHNDa+2RfTa4+0yie71VgdQQ78eOKooQ6hZjScIUe2sQFxo9ZRLDpaVvXOfgY+EVij0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mE7mIxAK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mE7mIxAK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 228A81F000E9;
	Mon, 31 Aug 2026 11:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788177591;
	bh=rEK5qnfbHpF+OczERNErDkddgnktBz+46OdgAV5r8tA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mE7mIxAKBQusMDgaWgL7j8a3juqtU2vVTU2gVmT7bFG/joUSIp+dwMy5XLmuzyLHJ
	 GjAvIYriTqpaqXGhLF07VRH998C9CQXVh9xXccYpbJyh05U+l1KxgQwENLPuVc7DWd
	 X3BgZcIAs4fnWM2rHWE0pVrXizRDX8DBpWPUR/ZiPzZyOLKVJ4tl3Vy6QYa0R55CuR
	 NB/8Jb2+byoAgGaGJzZ83I6BzLNGYwn6sKQ7WVfATruyCpkOTX6AzEeFguQjbd2VP9
	 E3zLPzsaYcDHKFQbQiDbfVG0F+mBQ7s31QZ7+xrGLhHGMj248AhBhAM5GCbt33mNXk
	 bi1Bn0fjJEk6Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/9] dmaengine: qcom: gpi: Use bus width capability
 helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TnVubyBTw6E=?= <nuno.sa@analog.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260831-dmaengine-support-wider-dma-masks-v3-4-507d97496f2d@analog.com>
References: <20260831-dmaengine-support-wider-dma-masks-v3-0-507d97496f2d@analog.com>
 <20260831-dmaengine-support-wider-dma-masks-v3-4-507d97496f2d@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 11:59:50 +0000
Message-Id: <20260831115951.228A81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing dma_async_device_unregister() on probe error path causes U=
se-After-Free.
--

commit 95d22ef1cb4b51af1c95483d343ee6c541c2475d
Author: Nuno S=C3=A1 <nuno.sa@analog.com>

dmaengine: qcom: gpi: Use bus width capability helpers

Advertise the single supported source and destination bus width through
the new dma_set_src_bus_width() and dma_set_dst_bus_width() helpers
instead of assigning the legacy u32 fields directly.

> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> index a5055a6273af6..3a35bf4c33978 100644
> --- a/drivers/dma/qcom/gpi.c
> +++ b/drivers/dma/qcom/gpi.c

[ ... ]

> @@ -2265,8 +2266,15 @@ static int gpi_probe(struct platform_device *pdev)
>  	/* configure dmaengine apis */
>  	gpi_dev->dma_device.directions =3D BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO=
_DEV);
>  	gpi_dev->dma_device.residue_granularity =3D DMA_RESIDUE_GRANULARITY_DES=
CRIPTOR;
> -	gpi_dev->dma_device.src_addr_widths =3D DMA_SLAVE_BUSWIDTH_8_BYTES;
> -	gpi_dev->dma_device.dst_addr_widths =3D DMA_SLAVE_BUSWIDTH_8_BYTES;
> +	ret =3D dma_bus_width_set(gpi_dev->dma_device.src_bus_widths,
> +				DMA_SLAVE_BUSWIDTH_8_BYTES);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D dma_bus_width_set(gpi_dev->dma_device.dst_bus_widths,
> +				DMA_SLAVE_BUSWIDTH_8_BYTES);
> +	if (ret)
> +		return ret;
>  	gpi_dev->dma_device.device_alloc_chan_resources =3D gpi_alloc_chan_reso=
urces;
>  	gpi_dev->dma_device.device_free_chan_resources =3D gpi_free_chan_resour=
ces;
>  	gpi_dev->dma_device.device_tx_status =3D dma_cookie_status;

[Severity: High]
This isn't a bug introduced by this patch, but I noticed a potential
use-after-free on the error path further down in this function.

If of_dma_controller_register() fails, the function currently returns
directly without calling dma_async_device_unregister():

gpi_probe() {
	...
	ret =3D dma_async_device_register(&gpi_dev->dma_device);
	...
	ret =3D of_dma_controller_register(gpi_dev->dev->of_node,
					 gpi_of_dma_xlate, gpi_dev);
	if (ret) {
		dev_err(gpi_dev->dev, "of_dma_controller_reg failed ret:%d", ret);
		return ret;
	}
	...
}

Since the primary gpi_dev structure is allocated with devm_kzalloc(), it
will automatically be freed by devres if the probe fails here.

Does this leave a dangling pointer in the global DMA engine lists,
potentially causing a crash later?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-dmaengine-=
support-wider-dma-masks-v3-0-507d97496f2d@analog.com?part=3D4
