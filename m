Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D7E426694
	for <dmaengine@vger.kernel.org>; Tue, 15 Sep 2026 10:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789467567; cv=none; b=JD8BjoTuWRC3BGm+N1j+tVGNFHCN6OMErRK/jQ0t8SsgMJoxiqlauMSor+AhvYU/Izs3XzOYi4kJJG0t0VSAkXFXhDE7YoXQrDqoMRSO2wlikjn2r7rKkHh/3FaMF8iVW0dQZFD2MRDa6ApQI4YnYAnJZKSysMElslnr83tSbG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789467567; c=relaxed/simple;
	bh=vbw2JYtsYgOaqoxOdYI3HtCEZD/bRt1Zev0WZPM23+k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UxSHIijE3HsHGSITAqPuQK2hrAs7yJ6ova8NUtrK+FCUOgXWBxIr+GO1llzTVuC3BlIAvjAtHLDevCe1717S7P2r+XEfzDl47m3d5dm2U/3fIO+TEbfOKQmfAJYMhYeubfkFRAGFbY3zsH1uOUC21YAmdV06Q5VS7XYlbhQPs8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dr+WuT7p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dr+WuT7p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CF461F000FF;
	Tue, 15 Sep 2026 10:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789467565;
	bh=4zibu2yhknhsPbO6atSwJF0WqMxeDDf7gPw6khJuiDE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Dr+WuT7p2xI8himVEdS4GEgQQMWCXbjrT2rLShKVA7v2af04ca2MTYydy1+VZ1vss
	 ST8nRq87TjPKnPgGI45SYEZE5I7bXKa+iXCRfM2qxdpimyH4Mp2bRnS+zdmuw+Dfni
	 EPmckCSdE+nIwKYHQEYdjFnhgVF/0gxTVn8kiHVytyte+dQTKK4X8jUeyPWWirMIX0
	 mKhmTRxGmOsQhluw44fpSakcjEBkIFV8PzU2JlnAQMi66ZZH1Bs3v1GXBB/UIAET9d
	 trk3KEjPLT9Rd9RMvbT+hwCw7Iw4fpytqiYDA0YXpNIEqFqLx9+3w5lv3p55r2vOnb
	 2mqFI1snUOyYA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/7] ASoC: sprd: Replace dma_request_slave_channel()
 by dma_request_chan()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260915100931.3593242-3-andriy.shevchenko@linux.intel.com>
References: <20260915100931.3593242-1-andriy.shevchenko@linux.intel.com>
 <20260915100931.3593242-3-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 10:19:24 +0000
Message-Id: <20260915101925.1CF461F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] ASoC: sprd: crash in dma_release_channel() due to ERR_PTR leak
--

commit 5e4c398ebe4c03b68c30e555198977e4ad4905e4
Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

ASoC: sprd: Replace dma_request_slave_channel() by dma_request_chan()

This commit replaces deprecated dma_request_slave_channel calls with
dma_request_chan. It updates the error checking from NULL checks to
IS_ERR.

> diff --git a/sound/soc/sprd/sprd-pcm-compress.c b/sound/soc/sprd/sprd-pcm=
-compress.c
> index e5249924b54d9..5613c25fffd73 100644
> --- a/sound/soc/sprd/sprd-pcm-compress.c
> +++ b/sound/soc/sprd/sprd-pcm-compress.c
> @@ -153,11 +153,10 @@ static int sprd_platform_compr_dma_config(struct sn=
d_soc_component *component,
>  		return -EINVAL;
>  	}
> =20
> -	dma->chan =3D dma_request_slave_channel(dev,
> -					      dma_params->chan_name[channel]);
> -	if (!dma->chan) {
> +	dma->chan =3D dma_request_chan(dev, dma_params->chan_name[channel]);
> +	if (IS_ERR(dma->chan)) {

[Severity: High]
If dma_request_chan fails, does this leak the error pointer into the compre=
ss
stream's persistent dma array?

When the file descriptor is closed or cleaned up, the free path in
sprd_platform_compr_free() will attempt to release the channel:

    if (dma->chan) {
        dma_release_channel(dma->chan);
        dma->chan =3D NULL;
    }

Since the error path doesn't clear the error pointer from dma->chan, the if
check evaluates to true. Will dma_release_channel() then dereference the er=
ror
pointer and crash?

>  		dev_err(dev, "failed to request dma channel\n");
> -		return -ENODEV;
> +		return PTR_ERR(dma->chan);
>  	}
> =20
>  	sgt =3D sg =3D kzalloc_objs(*sg, sg_num);
> diff --git a/sound/soc/sprd/sprd-pcm-dma.c b/sound/soc/sprd/sprd-pcm-dma.c
> index f509a4601de25..1586eff61120a 100644
> --- a/sound/soc/sprd/sprd-pcm-dma.c
> +++ b/sound/soc/sprd/sprd-pcm-dma.c
> @@ -171,13 +171,12 @@ static int sprd_pcm_request_dma_channel(struct snd_=
soc_component *component,
>  	for (i =3D 0; i < channels; i++) {
>  		struct sprd_pcm_dma_data *data =3D &dma_private->data[i];
> =20
> -		data->chan =3D dma_request_slave_channel(dev,
> -						       dma_params->chan_name[i]);
> -		if (!data->chan) {
> +		data->chan =3D dma_request_chan(dev, dma_params->chan_name[i]);
> +		if (IS_ERR(data->chan)) {

[Severity: High]
By directly assigning the return value here, does the error pointer become
visible to the cleanup function on failure?

When dma_request_chan fails, sprd_pcm_release_dma_channel() is called
immediately below. That function loops through the channels and checks:

    if (data->chan) {
        dma_release_channel(data->chan);
    }

This condition evaluates to true for an error pointer, blindly passing it to
dma_release_channel. Could this lead to a kernel panic when the invalid poi=
nter
is dereferenced?

>  			dev_err(dev, "failed to request dma channel:%s\n",
>  				dma_params->chan_name[i]);
>  			sprd_pcm_release_dma_channel(substream);
> -			return -ENODEV;
> +			return PTR_ERR(data->chan);
>  		}
>  	}
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915100931.3593=
242-1-andriy.shevchenko@linux.intel.com?part=3D2
