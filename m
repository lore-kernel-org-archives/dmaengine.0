Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D646541A923
	for <dmaengine@vger.kernel.org>; Tue, 15 Sep 2026 10:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789467916; cv=none; b=IVul9jBp0luRyo/5o3x+EMw3djFZvBglT7R1jGCy+Rc+DMZBqbpTzPMxdkvv36xDMZXlulANLzMM/z4CpWyIfvpLCJ1Zd/2Z7p4QkAs5vCVyZp7Jv/U9CMpSz4IlQ0UqwkeF/MSTiHBf2L7W5n/g77bEfw/KD7CJmFZLw3n04B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789467916; c=relaxed/simple;
	bh=yd01HTZ++LRL8zDYQmqE6x2zQNjDUNlAfB41YpJOF8E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aJEO6/H/FMjy+jjGUPNWhII81IbahKSBydqPjGXmwDyYeUkEniCxq89itiXtsVAFjhqEpGu++3eOuaqKN4S/0oU4u/61nbxuMMM1+dxU1xYko0wwCqZ2FsXph61SwBPEyivfvqXz1MBBn/Lhwn/EEob93a0gB7lxT3DZvnQWeiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MXzcArvA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MXzcArvA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D7C01F00893;
	Tue, 15 Sep 2026 10:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789467913;
	bh=j3C6mNVdtpVz7CzpUWRROUzGKu8E81Yjbbx4VIJx0s8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MXzcArvAU75JoL0cTsATzGggmebRKGo6Bk1okFGcpEmzJQqSudjFa49DBrUGWSkef
	 vWJHnFPS7HY1hHEyiTSbGc3ebNhNPfjFX9WAGAzbs8WUoLYIJp2NiNpihLHlIYft69
	 q9owVuri/FD+/cGlcV2zhs+SVjFksVAtdzBYenbieD94hbxKKvVx7p648PHHezJ4A7
	 uTBvGlfvFjzMgt6jpSegDoxwrKnGEnRAZvwt7BDgfFy0HlbuM/at+jlrGIHgaprZj/
	 1N+KZfnrvRI0Tc64z7OJOw3qPqrppFTLxyzCuK+1pPRXg1u8CkQ4OaO4Jcl6bkXEg+
	 DBzb+EVK/n3FA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 5/7] ASoC: fsl_asrc: Replace
 dma_request_slave_channel() by dma_request_chan()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260915100931.3593242-6-andriy.shevchenko@linux.intel.com>
References: <20260915100931.3593242-1-andriy.shevchenko@linux.intel.com>
 <20260915100931.3593242-6-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 10:25:12 +0000
Message-Id: <20260915102513.1D7C01F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] sound: fsl_asrc: dma_release_channel() dereferences ERR_PTR in fsl=
_asrc_dma_hw_free
--

commit 6b21fbae024779272022d29e64403ad02a43c0a2
Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: ASoC: fsl_asrc: Replace dma_request_slave_channel() by dma_request=
_chan()

This patch replaces the deprecated dma_request_slave_channel() API with
dma_request_chan() across the fsl_asrc driver.

> diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
> index 2f662bdf14d07..5cd12781c6042 100644
> --- a/sound/soc/fsl/fsl_asrc_dma.c
> +++ b/sound/soc/fsl/fsl_asrc_dma.c
> @@ -191,9 +191,10 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_com=
ponent *component,
>  	dma_params_fe->maxburst =3D dma_params_be->maxburst;
> =20
>  	pair->dma_chan[!dir] =3D asrc->get_dma_channel(pair, !dir);
> -	if (!pair->dma_chan[!dir]) {
> +	ret =3D PTR_ERR_OR_ZERO(pair->dma_chan[!dir]);
> +	if (ret) {
>  		dev_err(dev, "failed to request DMA channel\n");
> -		return -EINVAL;
> +		return ret;
>  	}

[Severity: High]
Will this cause a panic in fsl_asrc_dma_hw_free() if get_dma_channel()
fails?

Since dma_request_chan() returns an ERR_PTR on failure, pair->dma_chan[!dir]
will now store an ERR_PTR instead of NULL when the DMA channel request fail=
s.

If hw_params fails here, the ALSA PCM core handles the failure by invoking
the component's hw_free callback to clean up partially allocated resources.
That function checks if the channel pointer is truthy:

sound/soc/fsl/fsl_asrc_dma.c:fsl_asrc_dma_hw_free() {
    ...
    if (pair->dma_chan[!dir])
        dma_release_channel(pair->dma_chan[!dir]);
    ...
}

Since an ERR_PTR evaluates to true, dma_release_channel() is called with the
ERR_PTR, which will cause an invalid memory access and an immediate kernel
panic when it attempts to read chan->client_count.

Does fsl_asrc_dma_hw_free() need to be updated to use IS_ERR_OR_NULL()
instead, or should we reset pair->dma_chan[!dir] to NULL here on failure?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915100931.3593=
242-1-andriy.shevchenko@linux.intel.com?part=3D5
