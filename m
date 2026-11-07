Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794091419;
	b=ZDady9HppTeFrNGnhsaxaj51yJ6GIIUMVsBJ9SK5rR7FMnlkgiwXWvkmUVf/wRjddVCK
	 rP6Cq7nm84H2Gxxe+urOngDL4MLP7pCAIOzL9glyzOarZ8az57lqJG3I7J0mPkfDJaWtW
	 6HEoU+rye1URkYJ1a9ntcf7v7wFOEIH2hlSPCp79bNCpvtj/wA17HhgmzlpKiK4Idf/RH
	 PHOPLzyDC8iCD36jCRYeaeO2N6hLBwiZ7VHR/Q6PgaRJ5PrZBrUK9QUA8qC9Iy9ueqlJy
	 5NWn0Ev2htr6IQusuQyXzoYLT6qEK0UQ/MEm9mZIyB5cZIq41EHtTLC6YLOs+MeIJxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794091419;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=DbcPG+5eRbI4+g13ygMo6Xh9piP/NnySmfotbo/iWfY=;
	b=eAk1YHTFc+lU3P7ZGmHIxRifdyraKv0vUlpumnk4yk4+R3DSTY+aahSEauKqiQNOALxs
	 H2LBc7wijLLLlr0Jl0UwyZF5nt9IfTp3AOEVXBcIWti/LRb1Ia3ca7yQ/wbVzGdSBmXat
	 bp4so8eLSpXWhgarMAlLAPlyzC1+wgA3GS6GFJwj2zeDvsorhf1ZVDmz9kIwjA7Gl5Dz2
	 2l45cWmQBCIxD+7ojNnYqqZKAGu2FHtdGdZec5v2w+BsVHEUdznUDh4YfxNyXxkZQMRu+
	 xwd4WwG6xlYRxQDsLTdC/fP/ExGvIo/IExVUZzdhK1O9jgkwo5bC5zO4rr8bvfvD3kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HsDw7dau;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BF3606A32F;
	Sat,  7 Nov 2026 22:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HsDw7dau
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62DF01F008A1;
	Sat,  7 Nov 2026 22:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794091418;
	bh=DbcPG+5eRbI4+g13ygMo6Xh9piP/NnySmfotbo/iWfY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HsDw7dauZ7qSgxPFBdY2zs5CpdkfYRMM0EK7atJU6Ah/+kY0uUEifwcm/qgAUF1b3
	 txfBV2NJuLY8Lsq1sylHy9+TFResmoIow/6mcDgYNWfRMCZVMwEvN1o8QFdu94+Coq
	 ZiVxAsNsuTEyYOAezmhyU6odAFs7fAS3Vg93oytCOCzy6UJfgN1vXd/sooplLCxEGN
	 q6DW7gNVA74qFz6ZfkRsrBYd1qAE0TXGDSudBidwnCDpKKlPZanM2vYiZeKv//orrB
	 WUfV9RVUtxn5ppemjlWh42f3BsDz9EiYzq1A5238sYGC6NAHbzz+CehNF2lc98nrTB
	 Vt41Kze0caWfQ==
Message-ID: <sashiko-outbox-203372@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] ASoC: sprd: use dmaengine_prep_slave_sg_context()
 instead of device_prep_slave_sg()
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: dmaengine@vger.kernel.org, linux-sound@vger.kernel.org, imx@lists.linux.dev, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261106-rio_sg-v1-3-bc54b4bd8c95@nxp.com>
References: <20261106-rio_sg-v1-0-bc54b4bd8c95@nxp.com>
 <20261106-rio_sg-v1-3-bc54b4bd8c95@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 22:43:38 +0000
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
- [Critical] ASoC: sprd: double-free in sprd_platform_compr_free() [1]
--

commit 7137d268eefd6fca1c12f5ab33b970d39d707688
Author: Frank Li <Frank.Li@nxp.com>

ASoC: sprd: use dmaengine_prep_slave_sg_context() instead of device_prep_sl=
ave_sg()

This commit replaces direct calls to chan->device->device_prep_slave_sg()
with dmaengine_prep_slave_sg_context() in sprd-pcm-compress.c and
sprd-pcm-dma.c.

> diff --git a/sound/soc/sprd/sprd-pcm-compress.c b/sound/soc/sprd/sprd-pcm=
-compress.c
> index f790b959cd4e4..7188adfa3f402 100644
> --- a/sound/soc/sprd/sprd-pcm-compress.c
> +++ b/sound/soc/sprd/sprd-pcm-compress.c
> @@ -236,9 +236,9 @@ static int sprd_platform_compr_dma_config(struct snd_=
soc_component *component,
>  	 * We configure the DMA request mode, interrupt mode, channel
>  	 * mode and channel trigger mode by the flags.
>  	 */
> -	dma->desc =3D dma->chan->device->device_prep_slave_sg(dma->chan, sg,
> -							    sg_num, dir,
> -							    flags, &link);
> +	dma->desc =3D dmaengine_prep_slave_sg_context(dma->chan, sg,
> +						    sg_num, dir,
> +						    flags, &link);
>  	if (!dma->desc) {
>  		dev_err(dev, "failed to prepare slave sg\n");
>  		ret =3D -ENOMEM;

[Severity: Critical]
This problem wasn't introduced by this patch, but can a failure in
sprd_platform_compr_dma_config() or sprd_platform_compr_set_params()
cause a double free of dma->chan in sprd_platform_compr_free() [1]?

The error paths in both functions call dma_release_channel() without
clearing dma->chan to NULL:

sound/soc/sprd/sprd-pcm-compress.c:sprd_platform_compr_dma_config() {
	...
config_err:
	kfree(sg);
sg_err:
	dma_release_channel(dma->chan);
	return ret;
}

sound/soc/sprd/sprd-pcm-compress.c:sprd_platform_compr_set_params() {
	...
params_err:
	dma_release_channel(stream->dma[0].chan);
config_err:
	dma_release_channel(stream->dma[1].chan);
	return ret;
}

When the stream is later closed, sprd_platform_compr_free() checks
if (dma->chan) and calls dma_release_channel() a second time on the same
channel pointer.

[1] https://sashiko.dev/#/bug/linux-2a0aea76-9cc7-47d0-8767-b0cd95e62054

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-rio_sg-v1-=
0-bc54b4bd8c95@nxp.com?part=3D3
