Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179A54156CC
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 15:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786374923; cv=none; b=igTYIccx2fL2JS8+SL1Z+GXzM4vbJ4aY6OHf6AfZrKcUlPbGYrcIwwEbVyuKJh4RxKI5MO3/tQMy0zKgN0H/qedAq0CXiPKN3LWwZ65dEksMJ5T9uuz9qDeKCn7+BA1mGo0sE1hXTil718kyXPuSZj7R+y7EB/Elw2+hcFJfews=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786374923; c=relaxed/simple;
	bh=ennLqz72Abss8vs1Mya4qWnx8F6704QgmBjGltKD+3w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WUT5XaJoFNk0+J3Uqcgp1qNe64l+8iIhsVKCIO2rYfnEVbMCqFW19s7bw95OdzeItV/STZO/FnGPZUZCW7SNp79yOpHPVMuKe1LRxhYVEGwUsqd0vXg9CwxM6PLxUqE++QnWD/vElAEjpiPKxQ5hIsYuNoZ5nyeX638DI4cfcPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J6WAVovT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J6WAVovT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 632631F00A3A;
	Mon, 10 Aug 2026 15:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786374921;
	bh=oM40jA3Y3p7MJhRGFQhJISJUvdOUscayJtel3JHsp1M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J6WAVovTRBa7IjNImXDDwHcncP+yuhhIK6ip7tECYm9PaebtOJvjcicGN4TOUInmT
	 TTvH9ldr3h7JUBQaJj1LqsLDh65LYQ7uKf/6toAXJ62yN+Szan/8op7nJCzFbMOA6c
	 1cEQJkvdYmElXt/5DvFuJv9XCZi55GdkJElw5AEOvI4PMPmM/3FjCnWkTGJ/MakjXC
	 wc4fXXhm/QgouDU+U+TfyF65nQ4z1zPn51BwIRTQWrqtZ0hQ++wek8WLUlBT8gMryJ
	 uFoTDuJpHNLaw37Ps9jOH8nmbARz9qoqg21UbPnoJUFIl0Vwpg8HYJxi61ry6r8Dpw
	 83L/OYs2hBNag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/9] dmaengine: qcom: gpi: Use bus width capability
 helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TnVubyBTw6E=?= <nuno.sa@analog.com>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260810-dmaengine-support-wider-dma-masks-v2-4-1f7b798d035f@analog.com>
References: <20260810-dmaengine-support-wider-dma-masks-v2-0-1f7b798d035f@analog.com>
 <20260810-dmaengine-support-wider-dma-masks-v2-4-1f7b798d035f@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 15:15:20 +0000
Message-Id: <20260810151521.632631F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing unregistration of the DMA device on probe error and driver=
 unbind leads to Use-After-Free.
--

--- Patch [4]: [PATCH v2 4/9] dmaengine: qcom: gpi: Use bus width capabilit=
y helpers ---
commit 7a53f944daa4cc2b2af28a305b5fb4e022bb0d4d
Author: Nuno S=C3=A1 <nuno.sa@analog.com>

dmaengine: qcom: gpi: Use bus width capability helpers

Advertise the single supported source and destination bus width through
the new dma_set_src_bus_width() and dma_set_dst_bus_width() helpers
instead of assigning the legacy u32 fields directly.

> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> --- a/drivers/dma/qcom/gpi.c
> +++ b/drivers/dma/qcom/gpi.c
> @@ -2265,8 +2265,15 @@ static int gpi_probe(struct platform_device *pdev)
>  	/* configure dmaengine apis */
>  	gpi_dev->dma_device.directions =3D BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO=
_DEV);
>  	gpi_dev->dma_device.residue_granularity =3D DMA_RESIDUE_GRANULARITY_DES=
CRIPTOR;
> -	gpi_dev->dma_device.src_addr_widths =3D DMA_SLAVE_BUSWIDTH_8_BYTES;
> -	gpi_dev->dma_device.dst_addr_widths =3D DMA_SLAVE_BUSWIDTH_8_BYTES;
> +	ret =3D dma_set_src_bus_width(&gpi_dev->dma_device,
> +				    DMA_SLAVE_BUSWIDTH_8_BYTES);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D dma_set_dst_bus_width(&gpi_dev->dma_device,
> +				    DMA_SLAVE_BUSWIDTH_8_BYTES);
> +	if (ret)
> +		return ret;

[Severity: High]
This is a pre-existing issue, but since we are modifying gpi_probe(), is it
possible that the DMA device is left registered if probe fails later?

Looking at the end of gpi_probe():

	ret =3D dma_async_device_register(&gpi_dev->dma_device);
	if (ret) {
		dev_err(gpi_dev->dev, "async_device_register failed ret:%d", ret);
		return ret;
	}

	ret =3D of_dma_controller_register(gpi_dev->dev->of_node,
					 gpi_of_dma_xlate, gpi_dev);
	if (ret) {
		dev_err(gpi_dev->dev, "of_dma_controller_reg failed ret:%d", ret);
		return ret;
	}

If of_dma_controller_register() fails, the function returns without calling
dma_async_device_unregister(). Since gpi_dev is allocated with devm_kzalloc,
it will be freed automatically by devres, leaving dangling pointers in the =
core
DMA subsystem's device list.

Additionally, the gpi_driver platform driver definition lacks a .remove
callback entirely:

static struct platform_driver gpi_driver =3D {
	.probe =3D gpi_probe,
	.driver =3D {
		.name =3D KBUILD_MODNAME,
		.of_match_table =3D gpi_of_match,
	},
};

Does this mean a manual driver unbind via sysfs or device removal will also
cause a use-after-free for the same reason?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810-dmaengine-=
support-wider-dma-masks-v2-0-1f7b798d035f@analog.com?part=3D4
