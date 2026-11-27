Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795780212;
	b=ItdpgadFNCuipTUnH7CGWYI5yCPOd4Bu994v8iT4K3+Q6LpTXwYQubTb4/0jbOHIQ4WR
	 ZKXBaD06F9K2hV6x29kYOxXrCFpMw5kTueQ795m8ul62eUYGu6tJemmfHj9/Fc56aoarS
	 yFGn2QNjyrrpxMCGEcVhpPKKYDqIedW+O4R6wGJf6NiNlYiMnxQmqj3y73OxRigF+3qd+
	 armSEjI57mWViP30D/WPv7Hw2/gBhBHrUzYVtYXwfoUqyBZNmoNL5JISEovuVW7snI8/L
	 B429ehZy434bz9KHBHW7k9BpkUzS1IM2RseyYFuS8dlMsAvX0+hA8CFB7Xc2FRE+/lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780212;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=NUNIuHYWKMyIzAV263wqE3xd0y27sd7TburgMVWZeJs=;
	b=U8QImk+Db6SfbI4qdJpbCX2iDtoARurr6Fp9vH8l0XicJ5X6epnzSiJMc8RdhIBFNHCl
	 kJElMx9YLQaXG8QUNahWzb5OmpLM8CeHcFsfgvmQrrPxO1JzOZ4Z/E1ijuTG7eO8Ue4cK
	 IAMel2I+wHT7b4IvH+1iDgVJTGxxpwxA/BnoxuXVsqIldDNHsbcB5BJPDrBmZRH3EkOyM
	 tNatT8lgICBtFXCN4ieS/HyrmLynWCT6RmUkH5+Cv4TKHXagb01FkCJZoY65cuh4cHYGi
	 TIj6eqkOhwJJP2PQNM5lfh1VctXKCsR/OZswGoLAdJz4vNfsWlNl++QAVhDnzVN9Atw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QY9Bj313;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F61D606A32C
	for <dmaengine@vger.kernel.org>; Fri, 27 Nov 2026 11:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QY9Bj313
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBE501F000C1;
	Fri, 27 Nov 2026 11:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795780211;
	bh=NUNIuHYWKMyIzAV263wqE3xd0y27sd7TburgMVWZeJs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QY9Bj313c9jUCzUgNJkK7Qq2usqQ20wYY+MWWhWmYuU7aZEAYzm7/58Tu0ZruFfig
	 UyDeXFt6oVwALcOChbohVbDFBt4irlxy1LIeSWqxTMIOXt9F/GY36t2huVm6wQakN8
	 jCKHOL2fU+Q64mCrCDILSEOl6rTA1BTl4TaJgqksgEFLmFdbOAubLwSU065FmiTbKn
	 F6zVvSXmPZCUDYwM6A25nUS7vCd8bHPIXHtE/SXXSpeLv1XI0aujfw0nIbT+uj2JgQ
	 GnTcZc9e9ONsehiyEOvfCFzdWrBP5FJNg1NgwkdGGxje8ZADmx3nqO2McfORsBkxBF
	 8sY0Vx3h128rg==
Message-ID: <sashiko-outbox-237293@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dmaengine: stm32-dmamux: Unregister the DMA router
 on removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tian Xuechen" <202300460064@mail.sdu.edu.cn>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261127113332.390552-2-202300460064@mail.sdu.edu.cn>
References: <20261127113332.390552-1-202300460064@mail.sdu.edu.cn>
 <20261127113332.390552-2-202300460064@mail.sdu.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 11:50:11 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] dmaengine: stm32-dmamux: missing PM and clock cleanup in
  stm32_dmamux_remove()
--

commit 01371409f62942bd0d2c67aaa136651d1d8545c7
Author: Tian Xuechen <202300460064@mail.sdu.edu.cn>

dmaengine: stm32-dmamux: Unregister the DMA router on removal

This commit adds a platform driver remove callback to unregister the OF
DMA router when the stm32-dmamux device is unbound.

> diff --git a/drivers/dma/stm32/stm32-dmamux.c b/drivers/dma/stm32/stm32-d=
mamux.c
> index 57318715d9f34..6f49d78bfe3de 100644
> --- a/drivers/dma/stm32/stm32-dmamux.c
> +++ b/drivers/dma/stm32/stm32-dmamux.c
> @@ -389,8 +389,14 @@ static const struct of_device_id stm32_dmamux_match[=
] =3D {
>  	{},
>  };
> =20
> +static void stm32_dmamux_remove(struct platform_device *pdev)
> +{
> +	of_dma_router_free(pdev->dev.of_node);
> +}
> +
>  static struct platform_driver stm32_dmamux_driver =3D {
>  	.probe	=3D stm32_dmamux_probe,
> +	.remove	=3D stm32_dmamux_remove,
>  	.driver =3D {
>  		.name =3D "stm32-dmamux",
>  		.of_match_table =3D stm32_dmamux_match,

[Severity: Medium]
Should stm32_dmamux_remove() also disable runtime PM and unprepare
stm32_dmamux->clk?

stm32_dmamux_probe() enables the clock and runtime PM without devm helpers
and unwinds them on error:

drivers/dma/stm32/stm32-dmamux.c:stm32_dmamux_probe() {
    ...
	ret =3D clk_prepare_enable(stm32_dmamux->clk);
    ...
	pm_runtime_set_active(&pdev->dev);
	pm_runtime_enable(&pdev->dev);
    ...
pm_disable:
	pm_runtime_disable(&pdev->dev);
err_clk:
	clk_disable_unprepare(stm32_dmamux->clk);
}

Without matching cleanup on removal, unbinding the device leaks the clock
prepare/enable reference and leaves runtime PM enabled on pdev->dev, which
causes a subsequent rebind to hit an unbalanced pm_runtime_enable()
warning.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127113332.3905=
52-1-202300460064@mail.sdu.edu.cn?part=3D1
