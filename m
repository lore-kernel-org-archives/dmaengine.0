Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D41C4A2600;
	Tue, 15 Sep 2026 17:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789493749; cv=none; b=VG1KqTmHmYDMhHDmN/011RlnOMJl6mhA3tMY1D85JpLYxxbVKHU7Qe7n0i6sZuJ2EO8sdeHnF/8PGyMwqyexxNNpY38C9lKB76lneYKl5aBaGSHt6ln8C+bt+q6unmp/6h8Nj10qfEJ03KpMD6dSQILuiQBdjOvUlEYWhNeYCp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789493749; c=relaxed/simple;
	bh=9FRkHww2ti28VKaHWgA/wFWWs7kgq0/5c9Bhsrzirik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O5rkdPnBNg31+aA/986gyNcMwSASBtfuGqFF3HXYZoQqUij6vcdRONMQUu2Kc3ZW47o5Wz6pzH4hk9vcP+gTVnwnXOh9O/FS7vk6IGnGnMUTiyjpb3Of62CGVDFnEk+hkNZW2j+VGfncSQ+5mKR9I0SS6PdgpFbAuAfs6YL9lxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pgaj2bP5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pgaj2bP5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3EB11F000FF;
	Tue, 15 Sep 2026 17:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789493746;
	bh=39FDW1iBleAYEn7xhDFenbNL76Y5Vr3j48V/WMdQHms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Pgaj2bP5DrqGvx/3WqSGLRb/PQIcCCAc7m4hinrbcCyI2uUaLsCYHyY20o0qiWe9E
	 3RHqreO0iOHfl4AZoje9x9PeFfbrmV0KeHC5JKTvLEwtj4Lg5me7bz+rBmF6BtRhSy
	 AY9N7DIXo+XAZrcm7WgGeeLwC6EshU9/ROmHHy7QnE1Z7Gj9LyqSY5ptG89X1ynQpO
	 wjnAtxFFUXRLjFNTRcc5KFPCFDZFUFM8xN9GsK9CTgoi6PIwPgyjRS3SvqKAnoilEZ
	 YTY18zhIQwLsgIFNwpHPj3dWyNhJDY9/BroRpgJEmcXu9n2SAUZkZJ/3P8j1Zk14rh
	 lOg+hT20tfAkw==
Date: Tue, 15 Sep 2026 18:35:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Frank Li <Frank.Li@nxp.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	Tianchu Chen <flynnnchen@tencent.com>, linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: Re: [PATCH v1 2/7] ASoC: sprd: Replace dma_request_slave_channel()
 by dma_request_chan()
Message-ID: <444f1340-f690-440d-85e7-4fa7d66644d5@sirena.org.uk>
References: <20260915100931.3593242-1-andriy.shevchenko@linux.intel.com>
 <20260915100931.3593242-3-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Eev+jrxCI2X+PyJ/"
Content-Disposition: inline
In-Reply-To: <20260915100931.3593242-3-andriy.shevchenko@linux.intel.com>
X-Cookie: Void where prohibited by law.


--Eev+jrxCI2X+PyJ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 12:04:23PM +0200, Andy Shevchenko wrote:
> Replace dma_request_slave_channel() by dma_request_chan() as suggested
> since the former is deprecated.

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
>  			dev_err(dev, "failed to request dma channel:%s\n",
>  				dma_params->chan_name[i]);
>  			sprd_pcm_release_dma_channel(substream);
> -			return -ENODEV;
> +			return PTR_ERR(data->chan);

sprd_pcm_release_dma_channel() does:

                if (data->chan) {
                        dma_release_channel(data->chan);
                        data->chan =3D NULL;

so this won't DTRT with propagating the return code.

--Eev+jrxCI2X+PyJ/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqpgekACgkQJNaLcl1U
h9Dv6wf8DIt782FfFomog7Ok5wncm/S0jGMUale3g0wtB7TmjZWZulho4w/W+9Op
NQdoSarIoFdY4G5RQQaXN9YY/+b3euC8guuyXq2oU9Qzl25W2xTey7eh/bLshP0D
RC7HQG5RWrDTvJYpyglVFP7TWTTVXtoP7c+2ZMjTps1+Ou6UvJvt/XYuFtS74beB
ol+eLO6z606nI9p3R2rCyMrZhDQUUzAe90WEtBgyAaN/obA4Wi6K0/itsLBIn0xu
9AFytXi9/IsoSIZ+BmgOkN29ZdtHW9dTM6Lo0w2d4YC718HywHRkqRPDcLagd8qc
Wgz7Rz3kFsOpWXRBzsrpPBjNQUUafg==
=1aFq
-----END PGP SIGNATURE-----

--Eev+jrxCI2X+PyJ/--
