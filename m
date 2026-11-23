Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795397683;
	b=bNGpf8+kw/GTMfdIizJ+EFlvNjy2L8VmsPsmHdh510uwPOpzhVYxWPoz7CZP9v2//9O9
	 ArLxv/TaePKjXrlM3HbAogVEyAkdykrPgTIJO5y9kI1HQf0R1C8fP0+/IMIxFcjpB2uwl
	 H/ZoiRDIArft310lArk9jLU70YUxo3+Adk9fXICJPAPWFAP2bw6BxjZnuqiM+igejGXrC
	 /El0xh9j7WXfElf8wLa+eVg9i347SL0JxkKQk/Zeq2JmAiTvgFrV5pZEqHuuWP4EUYluN
	 JG401u848J0SXa+ihBgumtMDPrckoNZOYHc+ufRrQ51TinZwnymzf5DwHkNyku9Mb9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795397683;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5/VwKPEtknYBtvdaZ1doKbOyLX4HRUsZajYlLvy1bx4=;
	b=DE53J3xBhnl/SuJ1izhEr1Egl4iRvk7xwjuDbgfjuKwU7oa0X31fZMYG1EhdZmuPnJrW
	 vL/Kon3d7y7HNGG7ClaHjlQiSEVdzrcwISHHGhAgxeLW8IvhP8wkjWwTar19dPhEGCicN
	 EaSejgqe5wx34syJvyo8VMYzI1NDJBSSo1nJK2ZzP621u+8cn1hiouFh15hx7HkNdsqz8
	 1IjYjd73CCiIdCgXPQ5zvuQqVtBsAhVKYSwCCUGT1xEzwWH4ayP9AvZ9auwoetq7Ner4b
	 b+7WcP0kmRgmb53J4GzX5MaqcbxvhKGq/C20ZUyZoydsllVrI3wwUOfuGjSt3mrfkVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W8f9Ffhg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34DE606A31A;
	Mon, 23 Nov 2026 01:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W8f9Ffhg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 458B01F000C6;
	Mon, 23 Nov 2026 01:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795397683;
	bh=5/VwKPEtknYBtvdaZ1doKbOyLX4HRUsZajYlLvy1bx4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W8f9FfhggWCRl9Q6TLwMG2HTgFRvkPJFHM+sDbSXkrCgdRnugAlLUz23yVpcSmKnt
	 cM+ZhbxO0sXryxGDjhoN3l7Yt64t7CRy4Tooyzi6t1vo2h63uO0sDlUW8dBcPfpRU8
	 JpHkxMmoo/Pgw9n5RxOE5DTSRSuiXrHFpXDYKb80LcNY9UA8zRCG0y8HJQvPoo90gg
	 S53LzmkqTfNCaW+rjSqGyyaioPHC+Z8xLYNRxfFPs97Rxce8QGY1sE6Fdg0kT/3Ec+
	 owVLGQrs/gxR3fpFNydwQHBdy0lKEdwlPZZ0GUk/SmenQOIgsmhPSn4hrJDgkwaL1i
	 dAYHjb6caRHGQ==
Message-ID: <sashiko-outbox-228520@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] dmaengine: fsl-edma: use dmaengine_get_dma_device()
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: imx@lists.linux.dev, dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261123-edma-fixes-v1-3-59d5da374a16@nxp.com>
References: <20261123-edma-fixes-v1-0-59d5da374a16@nxp.com>
 <20261123-edma-fixes-v1-3-59d5da374a16@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 01:34:42 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [High] dmaengine: fsl-edma: unchecked dma_pool_create() in
  fsl_edma_alloc_chan_resources() [1]
--

commit d7d84b7032569e7e063763bff448d75503da9441
Author: Peng Fan <peng.fan@nxp.com>

dmaengine: fsl-edma: use dmaengine_get_dma_device()

This commit uses dmaengine_get_dma_device() instead of chan->device->dev
when creating the TCD pool and mapping slave DMA resources.

> diff --git a/drivers/dma/fsl-edma-common.c b/drivers/dma/fsl-edma-common.c
> index 513b0f4e5be21..62cd60179bc6f 100644
> --- a/drivers/dma/fsl-edma-common.c
> +++ b/drivers/dma/fsl-edma-common.c

[ ... ]

> @@ -1090,7 +1090,7 @@ int fsl_edma_alloc_chan_resources(struct dma_chan *=
chan)
>  	if (fsl_edma_drvflags(fsl_chan) & FSL_EDMA_DRV_HAS_CHCLK)
>  		clk_prepare_enable(fsl_chan->clk);
> =20
> -	fsl_chan->tcd_pool =3D dma_pool_create("tcd_pool", chan->device->dev,
> +	fsl_chan->tcd_pool =3D dma_pool_create("tcd_pool", dmaengine_get_dma_de=
vice(chan),
>  				fsl_edma_drvflags(fsl_chan) & FSL_EDMA_DRV_TCD64 ?
>  				sizeof(struct fsl_edma_hw_tcd64) : sizeof(struct fsl_edma_hw_tcd),
>  				32, 0);

[Severity: High]
This problem wasn't introduced by this patch, but can a failure in
dma_pool_create() lead to a NULL pointer dereference [1]?

fsl_edma_alloc_chan_resources() does not check fsl_chan->tcd_pool for NULL
and still returns 0.  A subsequent transfer preparation then passes the
NULL fsl_chan->tcd_pool to dma_pool_alloc() in fsl_edma_alloc_desc().

[1] https://sashiko.dev/#/bug/linux-39a3675f-2d52-4af1-8fbc-609bc1c22d2a

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-edma-fixes=
-v1-0-59d5da374a16@nxp.com?part=3D3
