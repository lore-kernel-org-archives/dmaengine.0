Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2DD1A9FBC;
	Sun, 30 Aug 2026 14:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788100074; cv=none; b=FJ80hpncYucQpjLKCxrp9x/68RihnXKQ70P4/H7aZSY+m+y9+zz3jEyWemUL/kM6cH3AYWsP51gLaTE5tPykPEoLeRz8Svwf+RcmEQKc8VZ3fY37cergDnZyeJ96T+W8BbSZ3xLpZG2J/T3RbwLYGwaTQEZWrX+U5Z95VW0acZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788100074; c=relaxed/simple;
	bh=j7uHLKzGiCWAUPoc4xUeK0aUl9/07IWGy1syeHfS8F4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=apotT9swMLcGCcOh9tq6IZLVVgp6QYXTdLeoIBXHPjCaGvZnW1RruGrUSqDksqHQS3es8jOcjhegzZmXVH3AFE6vrXTepJIPN1SsxR+h/GXF6cdiViT3dDfftKTXFnLrXPLkop/bbH/a2oWLOc19LLOdTrCv/p/1+xVtqohOxDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oj8nQzHT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oj8nQzHT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDC241F000E9;
	Sun, 30 Aug 2026 14:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788100073;
	bh=ooJd94K+UjtP3m82PCIjtQUGjqixkmobZd1VP8jmShk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Oj8nQzHTOIo+UmqVWlzT6P540/DyTx+FKkAfB9OLSGgp6o5sL61y3ao5phJyzAcFm
	 MrxKlYYy3eXYZuhJ25omCmcfkjTdhNmit4FFledXruSmbtrwzMdxeDbbQ2iE+PHC60
	 7yprPMy65TLjnDoA0a2TIYYtbkgWmmXS2MPCGJ62MbOc7DyN7JB48ziRIlquuStgUs
	 HTCoC0MJWyBYMSuGNymaNuhTIXiF7UL5IMmuHbxelwyM7XAVj06vTC5jL2ZcjfilTT
	 4O/LXJmWEESt1TwrSFuEYJ0TXjVEwwwAQvH67TFHQ20e4BaTFLvSFXI0gpl4vBVZSU
	 K4Bnb/ZInuIyA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: fsl-edma: make channel resource allocation
 transactional
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pengpeng Hou" <pengpeng@iscas.ac.cn>
Cc: imx@lists.linux.dev, vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260830140925.30268-1-pengpeng@iscas.ac.cn>
References: <20260830140925.30268-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 Aug 2026 14:27:52 +0000
Message-Id: <20260830142752.CDC241F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Pending vchan tasklet is not synchronized before destroying the ch=
annel's DMA pool in fsl_edma_free_chan_resources, causing a use-after-free =
race.
--

commit 4815c2b1d9762a4bc22fe65a8797f16c559c652f
Author: Pengpeng Hou <pengpeng@iscas.ac.cn>

    dmaengine: fsl-edma: make channel resource allocation transactional

This commit modifies fsl_edma_alloc_chan_resources to properly handle clock
enable failures and DMA pool allocation failures. It checks these prerequis=
ites
and ensures resources are correctly unwound on failure.

> diff --git a/drivers/dma/fsl-edma-common.c b/drivers/dma/fsl-edma-common.c
> index bb7531c456dfa..02b92d1464cca 100644
> --- a/drivers/dma/fsl-edma-common.c
> +++ b/drivers/dma/fsl-edma-common.c
[ ... ]
> @@ -873,7 +880,9 @@ int fsl_edma_alloc_chan_resources(struct dma_chan *ch=
an)
>  		free_irq(fsl_chan->txirq, fsl_chan);
>  err_txirq:
>  	dma_pool_destroy(fsl_chan->tcd_pool);
> -	clk_disable_unprepare(fsl_chan->clk);
> +err_pool:
> +	if (fsl_edma_drvflags(fsl_chan) & FSL_EDMA_DRV_HAS_CHCLK)
> +		clk_disable_unprepare(fsl_chan->clk);
> =20
>  	return ret;
>  }

[Severity: High]
This is a pre-existing issue, but while we are looking at channel resource
management, is there a use-after-free race when destroying the DMA pool in
fsl_edma_free_chan_resources()?

drivers/dma/fsl-edma-common.c:fsl_edma_free_chan_resources() {
    ...
	vchan_dma_desc_free_list(&fsl_chan->vchan, &head);
	dma_pool_destroy(fsl_chan->tcd_pool);
	fsl_chan->tcd_pool =3D NULL;
    ...
}

If a client driver releases an active DMA channel without explicitly calling
dmaengine_terminate_sync() beforehand, dma_release_channel() synchronizes
running tasklets and then calls free_chan_resources.

Because free_chan_resources disables the active hardware itself without
subsequently killing the tasklet again, an interrupt can fire right after t=
he
initial synchronization but before the hardware is disabled.

This interrupt will schedule the vchan_complete tasklet, which then executes
concurrently with or after free_chan_resources destroys the tcd_pool.

Can this lead to a use-after-free when the tasklet attempts to free
descriptors into the destroyed pool via vchan_vdesc_fini()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260830140925.3026=
8-1-pengpeng@iscas.ac.cn?part=3D1
