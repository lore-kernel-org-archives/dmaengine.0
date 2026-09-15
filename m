Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE5B47F769
	for <dmaengine@vger.kernel.org>; Tue, 15 Sep 2026 10:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789467690; cv=none; b=mgOb+JripDWupw5D0aVMwWBYAfx7LbzUlUF9QEeqTNWV6D+RjL8e2uGUyn/E6/zfcqnbldglc5pZPAFFJ8TsV+Wp+tNNbJJpSw5vvtkeGs79JnFQ7X0Nj8uTQF50daGjUuPY+CvnlJb1ACUX2czJETWPxBBxA+n4qDtkgPBiw5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789467690; c=relaxed/simple;
	bh=AuleZe46vlCRmywU97oUuntxQ33otCEIr1QXkSA1NzY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SkDpfEls1DVD/+kLKvOGCCuHFKiwWn0o+NrpF1wIdcDUHVBW2eq/bY8VXCC2ZpL8+AS67EtnWXZlq9P3bryhEM3o/wwcnrtK2Vae+np5zLmD/EQg90QbUNj+124FLx9VtUHkK1NpKdoZ+88Y9Pe0N8kANSuYIwNZYJdWOFz0qpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FK5IGYV2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FK5IGYV2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F10841F00893;
	Tue, 15 Sep 2026 10:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789467689;
	bh=iR9o4/ycWln+wh7Umhvyy5wh17++cv/6Rard5O70dIk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FK5IGYV2wpgY/uEimLiuq1FI7/sygLjJtb4HGe+AP9DuiGd98PBwO+KtAMwZ+npTJ
	 mtAniZ35/G/aL7brCGoHqJXQfUjp1Q0irP4f7T4P2B9MVj1b4hxHpOuMb/a7BFFf1e
	 3oibdCqt/oeOZ5av7xOavZOALEFmWoHLDiCKqqljqhXDvNwgt2TytugA5KoNwPLvFo
	 htxKSxfRpEtCjTQf5V5I0q7sRyOGnsT+f+RWeX2oM3DU0cJ1dFTGlZ1a8xs9xRLiup
	 9761rxIrBLZyV8gHsQNoD2qqn1JqLndm7tyum6RxVKDb1HtNyojElMbgugpCzMbX80
	 PdjhTfVUEwQDw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 4/7] ASoC: pxa: Replace dma_request_slave_channel()
 by dma_request_chan()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260915100931.3593242-5-andriy.shevchenko@linux.intel.com>
References: <20260915100931.3593242-1-andriy.shevchenko@linux.intel.com>
 <20260915100931.3593242-5-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 10:21:28 +0000
Message-Id: <20260915102128.F10841F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] UAPI: -EPROBE_DEFER leaked to user-space open() via pxa2xx_pcm_o=
pen()
--

commit 44587eacc45895505692b413ada6ab4975034283
Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

ASoC: pxa: Replace dma_request_slave_channel() by dma_request_chan()

This commit replaces the deprecated dma_request_slave_channel() with
dma_request_chan().

> diff --git a/sound/soc/pxa/pxa2xx-pcm-lib.c b/sound/soc/pxa/pxa2xx-pcm-li=
b.c
> index 88a9d32263021..0ccf88aa11389 100644
> --- a/sound/soc/pxa/pxa2xx-pcm-lib.c
> +++ b/sound/soc/pxa/pxa2xx-pcm-lib.c
[ ... ]
> @@ -107,9 +108,12 @@ static int pxa2xx_pcm_open(struct snd_pcm_substream =
*substream)
>  	if (ret < 0)
>  		return ret;
> =20
> -	return snd_dmaengine_pcm_open(
> -		substream, dma_request_slave_channel(snd_soc_rtd_to_cpu(rtd, 0)->dev,
> -						     dma_params->chan_name));
> +	chan =3D dma_request_chan(snd_soc_rtd_to_cpu(rtd, 0)->dev, dma_params->=
chan_name);
> +	ret =3D PTR_ERR_OR_ZERO(chan);
> +	if (ret)
> +		return ret;

[Severity: Medium]
Will this leak the kernel-internal -EPROBE_DEFER error code to user-space?

If dma_request_chan() fails because the DMA driver isn't loaded yet, it
can return -EPROBE_DEFER.  Since pxa2xx_pcm_open() returns this directly,=20
the -EPROBE_DEFER error code would be passed up to snd_pcm_open() and=20
returned to the user-space application calling open() on the ALSA device.

In the old code, dma_request_slave_channel() returned NULL on failure,
and snd_dmaengine_pcm_open() mapped that NULL to -ENXIO. Could we map the
error here to a standard user-facing error like -ENXIO when=20
dma_request_chan() fails?

> +
> +	return snd_dmaengine_pcm_open(substream, chan);
>  }
> =20
>  static int pxa2xx_pcm_close(struct snd_pcm_substream *substream)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915100931.3593=
242-1-andriy.shevchenko@linux.intel.com?part=3D4
