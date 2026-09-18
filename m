Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE8138F65C
	for <dmaengine@vger.kernel.org>; Fri, 18 Sep 2026 11:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789732352; cv=none; b=DMSDD6W0bQHZTqwkcPfgDCd8WXuKGetP13NU+HTZ61cnY6uGxEypuoI0Y1FSUmHxxLHVMlGPrV0yS7brSeCSAEKkqfL3M8BGrzbAQzUQF4QiU+Uh0ExNyS0yNSJlELV+mtR1fU0NtT3iImUcrEX2unneDgXoeaH/07RDerszC10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789732352; c=relaxed/simple;
	bh=IQzm3ziH2lEdfJ/vZc1FD1Cx0pkKjuTQdMcSI7gCIfs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=g1ngaKxoDVmP2irK5oDkfNxaijL9gwXeX9oP+/4rLSciwGAbaCOQuZ+lk4dW2V58ZYqAcvHMcS4gfgHNGoOSfRoN+ohStxpSyGD9JZHPj89oXrjkcrI61FSqqfRSAPTlDCwJv5tCvUlldLFo6tQOEMl/eDRwhnfsr8iPiNzBKKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JTxxpfxv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JTxxpfxv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC8AC1F000FF;
	Fri, 18 Sep 2026 11:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789732350;
	bh=sEyguvbkhhnJ8irHtKArt25A6rT4JMsess8O+hqdojI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JTxxpfxvkep3mqOqoJePhx9Mt52fAqjQgvDBYOpgrzkhs1QnBNl4CDKbp7Cl4LlIb
	 PPcW5k8F3gb3/5zp4gQL3CVrrxtIxzfU/NoevrrpZYSDhEGtgJJa776vSDamYXzA7g
	 U+mJs3xdeUKpNnivf4gAjvejXhmKqpxrYGiYkQLSSiAZFHP5/8qe3CsWGetk+Sd3ZI
	 PAdzh2pOHr3gZtMyX0uhpI+45l1rCF1o8ugPDsyOw1fnyeeHSqiAORyFlFGGuIVSmv
	 3U17m/e79DbBA4RubsoXJPG7UqQnrghEoO3a4xrXfVeuErCcDikdKChfv/Vo1HcYIR
	 B6Q0RKGrN+Mzw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/7] ASoC: sprd: Replace dma_request_slave_channel()
 by dma_request_chan()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260918113727.1898998-3-andriy.shevchenko@linux.intel.com>
References: <20260918113727.1898998-1-andriy.shevchenko@linux.intel.com>
 <20260918113727.1898998-3-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 11:52:29 +0000
Message-Id: <20260918115229.CC8AC1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] sprd: leak of -EPROBE_DEFER to userspace in ioctl paths
--

commit 27b9b3ffed70e1a1411a3993c1e469b1c18205a6
Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

ASoC: sprd: Replace dma_request_slave_channel() by dma_request_chan()

This commit replaces the deprecated dma_request_slave_channel() function
with dma_request_chan() in the Spreadtrum ALSA SoC driver. It also updates
the error handling to propagate all possible errors returned by the new
function back to the caller.

> diff --git a/sound/soc/sprd/sprd-pcm-compress.c b/sound/soc/sprd/sprd-pcm=
-compress.c
> index e5249924b54d9..f394121d417a3 100644
> --- a/sound/soc/sprd/sprd-pcm-compress.c
> +++ b/sound/soc/sprd/sprd-pcm-compress.c
[ ... ]
> @@ -153,12 +154,12 @@ static int sprd_platform_compr_dma_config(struct sn=
d_soc_component *component,
>  		return -EINVAL;
>  	}
> =20
> -	dma->chan =3D dma_request_slave_channel(dev,
> -					      dma_params->chan_name[channel]);
> -	if (!dma->chan) {
> +	chan =3D dma_request_chan(dev, dma_params->chan_name[channel]);
> +	if (IS_ERR(chan)) {
>  		dev_err(dev, "failed to request dma channel\n");
> -		return -ENODEV;
> +		return PTR_ERR(chan);

[Severity: Medium]
Since sprd_platform_compr_dma_config() is called during the ALSA
SNDRV_COMPRESS_SET_PARAMS ioctl path, could this propagate -EPROBE_DEFER
directly to userspace if dma_request_chan() defers probing? Returning
internal kernel errors like -EPROBE_DEFER to userspace can confuse user
applications as it violates UAPI error semantics.

>  	}
> +	dma->chan =3D chan;
> =20
>  	sgt =3D sg =3D kzalloc_objs(*sg, sg_num);
>  	if (!sg) {
> diff --git a/sound/soc/sprd/sprd-pcm-dma.c b/sound/soc/sprd/sprd-pcm-dma.c
> index 2d5ffbe17e814..2a89dc7616bf7 100644
> --- a/sound/soc/sprd/sprd-pcm-dma.c
> +++ b/sound/soc/sprd/sprd-pcm-dma.c
[ ... ]
> @@ -170,15 +170,16 @@ static int sprd_pcm_request_dma_channel(struct snd_=
soc_component *component,
> =20
>  	for (i =3D 0; i < channels; i++) {
>  		struct sprd_pcm_dma_data *data =3D &dma_private->data[i];
> +		struct dma_chan *chan;
> =20
> -		data->chan =3D dma_request_slave_channel(dev,
> -						       dma_params->chan_name[i]);
> -		if (!data->chan) {
> +		chan =3D dma_request_chan(dev, dma_params->chan_name[i]);
> +		if (IS_ERR(chan)) {
>  			dev_err(dev, "failed to request dma channel:%s\n",
>  				dma_params->chan_name[i]);
>  			sprd_pcm_release_dma_channel(substream);
> -			return -ENODEV;
> +			return PTR_ERR(chan);

[Severity: Medium]
Similarly, sprd_pcm_request_dma_channel() is invoked during the
SNDRV_PCM_IOCTL_HW_PARAMS ioctl path. Does returning PTR_ERR(chan) here also
risk leaking -EPROBE_DEFER to userspace if the DMA channel is not yet
available?

>  		}
> +		data->chan =3D chan;
>  	}
> =20
>  	return 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918113727.1898=
998-1-andriy.shevchenko@linux.intel.com?part=3D2
