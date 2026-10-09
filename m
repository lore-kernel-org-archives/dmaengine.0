Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385E61B4F0A;
	Fri,  9 Oct 2026 05:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791523999; cv=none; b=ARm1pnoiDyHixu/uSwxnH2QFemC1rYRoeGpCR97xhtP13MgBfLE1nvSmx32fRPOMvW76oYihPq8/NlhHO5jngrVYHyFso8QSDQ8L9GIcuzirHbUAzZf0ZWGefOgUzUCMuedhCK52N5xHfVk0nOIPi66a2kLNCT1MM/81iZ2XyqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791523999; c=relaxed/simple;
	bh=M8RRUsWzibDSZEYgOhogC2boxsaExNn6O1lRXgyFqic=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=TGlqO84Cedw+0rADnTwHLtTCVTtxJ4qY00ZSfI7GL+9hQ64Q8UBQF6uo8yyyRBCiWy/96Bi8C5Sb+L2XOgncA1DhpWjyue7VJe89sKMTiGm1kS12IBinZ+cEsejikhzcOC2xf8m9ufOmv8vTXOs0+LQCXktCgySbEOmCda+MS/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xutew+39; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xutew+39"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 684431F000FF;
	Fri,  9 Oct 2026 05:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791523997;
	bh=nDTuifJ4alpyRPiKQLmjGohFAEJruK2A8vqndBuimgQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Xutew+390tyle5S4ysH+lc7XJp7JNlJnTvJFBSouX/MR4qa+qdF5IMIep4oBTSJAr
	 LLv6i+moXR9ihy+Ul60HIIxX5f4yjU7tCWRlr9OcE7rmlfl4V5RAUL4FZzszWKlgeH
	 VRWBQ6B9eeriFliZI0Dk6FHuQbA087PeJ7bu1wNFjxrZAiPJudMWEHD3fZzb1u6zho
	 OhI6+urhlKwR7uJ9R3GcK404xmBz8fdT0hJgbUwxhSv97Uo1rXxAm+m42nkotwtNA6
	 qyb83M65EyffPzFvUlo6L0NALj8WCggilXMggQelp7zJhfdjaeQwa1uAUClqFonF8P
	 xZHrLGvkBFv7A==
Message-ID: <sashiko-outbox-164900@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/6] dmaengine: arm-dma350: Add CIX Sky1 integration
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jelly Jia" <Jelly.Jia@cixtech.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261009051846.1115962-6-Jelly.Jia@cixtech.com>
References: <20260907033404.596839-1-Jelly.Jia@cixtech.com>
 <20261009051846.1115962-1-Jelly.Jia@cixtech.com>
 <20261009051846.1115962-6-Jelly.Jia@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 05:33:16 +0000
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] dmaengine: arm-dma350: Tasklet Use-After-Free on teardown
- [Medium] dmaengine: arm-dma350: leak of reserved memory on probe error pa=
ths
- [Medium] dmaengine: arm-dma350: leak of reserved memory assignment on pro=
be error
- [Medium] dmaengine: arm-dma350: reserved memory leak in probe error paths
- [Low] kconfig: ARM_DMA350 selects MFD_SYSCON without HAS_IOMEM dependency
--

commit a78806dbf20ce04511d1cbf853c6105e7756c04b
Author: Jelly Jia <Jelly.Jia@cixtech.com>
dmaengine: arm-dma350: Add CIX Sky1 integration support

The CIX Sky1 SoC integrates DMA-350 controllers with custom peripheral
address mapping and interrupt routing. This commit adds device tree matchin=
g,
clock, reset, and syscon-based interrupt routing during probe and resume.
It also introduces support for attaching to a reserved memory region.

> diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
> index ae6a682c9f769..efa6d280bb36e 100644
> --- a/drivers/dma/Kconfig
> +++ b/drivers/dma/Kconfig
> @@ -97,9 +97,13 @@ config ARM_DMA350
>  	depends on ARM || ARM64 || COMPILE_TEST
>  	select DMA_ENGINE
>  	select DMA_VIRTUAL_CHANNELS
> +	select MFD_SYSCON

[Severity: Low]
Is this missing a dependency on HAS_IOMEM? MFD_SYSCON inherently depends on
HAS_IOMEM in drivers/mfd/Kconfig, so this unconditional select can cause
Kconfig unmet direct dependency warnings on architectures without it (e.g.
UML) during COMPILE_TEST. Since the driver uses MMIO functions, should it
depend on HAS_IOMEM?

[ ... ]

> diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
> index e3fbfcce66e8e..e443a9c3189b2 100644
> --- a/drivers/dma/arm-dma350.c
> +++ b/drivers/dma/arm-dma350.c

[ ... ]

> @@ -1201,6 +1264,13 @@ static int d350_probe(struct platform_device *pdev)
>  		dmac->dma.device_prep_dma_memset =3D d350_prep_memset;
>  	}
> =20
> +	if (of_property_present(dev->of_node, "memory-region")) {
> +		ret =3D of_reserved_mem_device_init(dev);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "failed to attach reserved memory\n");
> +	}
> +
>  	platform_set_drvdata(pdev, dmac);
> =20
>  	ret =3D dma_async_device_register(&dmac->dma);

[Severity: Medium]
If dma_async_device_register() or the subsequent of_dma_controller_register=
()
fails here, the function returns directly. Does this code leak the reserved
memory assignment from of_reserved_mem_device_init() above? It seems
of_reserved_mem_device_release() is needed on these error paths.

[ ... ]

> @@ -1223,9 +1293,30 @@ static void d350_remove(struct platform_device *pd=
ev)
> =20
>  	of_dma_controller_free(pdev->dev.of_node);
>  	dma_async_device_unregister(&dmac->dma);
> +	of_reserved_mem_device_release(&pdev->dev);
>  }

[Severity: High]
Can a pending tasklet trigger a use-after-free here?

When d350_remove() is called, dma_async_device_unregister() unregisters the
device, but clients might have freed their channels via
d350_free_chan_resources() without killing the tasklet (since
vchan_free_chan_resources() does not call tasklet_kill()).

If a tasklet is pending, and d350_remove() returns, the dmac structure
will be freed via devres, but the tasklet might still execute and dereferen=
ce
the freed virtual channel. Should tasklet_kill() be called during channel
resource cleanup to prevent this?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009051846.1115=
962-1-Jelly.Jia@cixtech.com?part=3D5
