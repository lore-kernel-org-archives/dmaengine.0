Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678434BB5DE
	for <dmaengine@vger.kernel.org>; Wed, 16 Sep 2026 23:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789599637; cv=none; b=k2jmGj/0RmDhnPF8XZl1uMQIkn4xovjTcBkZSCMZsTfvxHh8aGRSmVD+vx+hs417NNhYV4pUIeLkKO2B/HoKO2PsnLkxMwqnQc3PpYh0pZukvn2kmw4ZgRHg7qB9kqOYkgdWfp8rMVLKRkLRtZZJRRE+95c8qovW7IXZmwWdvGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789599637; c=relaxed/simple;
	bh=xC/M0dD0Otbq8kaZXEWM94lviauSFIVPgpHUsEIHHgo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UXe1PFkDCUBbpw4YTCkJa992WLjSs71h8cndYFS9StQfidQOayNwxAziC5EEGfNuAQxTE6a/dCOing/at8ttFvZUJ2E7KVq096OaaNWV22PnU2ufKQDWyPu26yQkNvbRhBiJjQdj4zv2p5rofdbKIsY3RJADv5vv0zGpPBiBryo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f8LCNCbi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f8LCNCbi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 671171F000FF;
	Wed, 16 Sep 2026 23:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789599625;
	bh=jKdtauhoqYZZBTqlni6qKMO2gFz3WhYmXlnjjljyICQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f8LCNCbi8hLWpMcSWKiy/Y/iB4A/UXRxI/36FBh/Y64Tx4D9DzhvLQdfc3LE05zuD
	 xtnhVGVSKiiyKzS+QytRgvo64FR5Gb9uUg5qn4/NDKghOaok1o3CrHfU3jKo1I8+3M
	 qRc5OCf03o0BLFWCCqk1T3kfsQ5Y0sSE6fgwmhmTXU9kswNB9NPGRHmW3W/YL5Mzyu
	 qyoWqaK6McxtQ6CUv00iE4/10pni7bT7ROBCm+xqMWzbiepU/bqI1uNvQqUlIJBYZN
	 zv3Lqr2xEjAsp1aXs7NeAlVngE2nUBG61cu/wKuOEVkUuHJ00zvlpSTJke/lIRQ/Yi
	 dlAIzg5BhAZsA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: ste_dma40: allow COMPILE_TEST
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260916225241.280606-1-rosenp@gmail.com>
References: <20260916225241.280606-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 23:00:25 +0000
Message-Id: <20260916230025.671171F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] kconfig: STE_DMA40 missing HAS_IOMEM dependency for COMPILE_TEST
--

commit f5b43b7cb15b71f44f87940150c9d52817cad404
Author: Rosen Penev <rosenp@gmail.com>

dmaengine: ste_dma40: allow COMPILE_TEST

This commit loosens the Kconfig dependencies for STE_DMA40 to allow building
on other architectures via COMPILE_TEST. It aims to increase compile covera=
ge
by exposing the driver to more build configurations.

> diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
> index ae6a682c9f769..f16bd4059d84a 100644
> --- a/drivers/dma/Kconfig
> +++ b/drivers/dma/Kconfig
> @@ -559,7 +559,7 @@ config SOPHGO_CV1800B_DMAMUX
> =20
>  config STE_DMA40
>  	bool "ST-Ericsson DMA40 support"
> -	depends on ARCH_U8500
> +	depends on ARCH_U8500 || COMPILE_TEST
>  	select DMA_ENGINE
>  	select SRAM

[Severity: Low]
Does this also need a dependency on HAS_IOMEM?

By allowing COMPILE_TEST in drivers/dma/Kconfig for STE_DMA40 and keeping t=
he
select for SRAM, architectures without HAS_IOMEM (like User-Mode Linux or
some s390 configurations) will trigger unmet dependency build warnings for
SRAM when COMPILE_TEST is enabled.

This can also lead to compilation failures on those architectures due to
missing I/O memory accessors like readl or writel that SRAM might depend on.

Could this be resolved by making STE_DMA40 depend on HAS_IOMEM?

>  	help

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916225241.2806=
06-1-rosenp@gmail.com?part=3D1
