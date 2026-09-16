Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BDB36493A
	for <dmaengine@vger.kernel.org>; Wed, 16 Sep 2026 03:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789529445; cv=pass; b=qO68xy4fUATj7Z/Zo3+AF6A9GoJaMhQ7DIlG+wLddProHsu4X2/JpU5Wb92Ruimd4L2e7BqFQ1jLCKJETVNcBABSilO0VUICdHWQh9Xb+u6+1lJrmmZGY/4VnFUT5itNHa1rCB49JWqnu1W9ilebCC6Lsp+wnjL7UcVzt8Ba7VI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789529445; c=relaxed/simple;
	bh=K9IGp7wMzcm0ipHMR8TG9YSgdmNh9Pwyoo0H/rmFIBg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tzYKvPly5EwlfmyGjdl7sBjcz0yIXdCenO+XXgv1kzXVHIfwIAK77hE8RIkrpwCOKTfytrD/NPZHruywhcAvGFYsGuUvSQ4xPWHnkWI50He7L0mco+mWJ1qc8lGpfoDhI7xCOCDxhxRdX2UpQ5bw0NuDEsO098OAXaLQjav9lNc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YE7t3A/y; arc=pass smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YE7t3A/y"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd88a115c1so4900395ad.3
        for <dmaengine@vger.kernel.org>; Tue, 15 Sep 2026 20:30:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789529443; cv=none;
        d=google.com; s=arc-20260327;
        b=rzesY0cHhkK8+KsUkvrqpJ5Qe07XyIhIvTkproc73gyVV6YVqMMfpq0IK6bvX8FTGB
         /rvfc5eczKALuViJ3rPSOXOLd85xQaHSB83jo0xaKfVkuVo7dsh36kZPW3XIS1L7/5jt
         QEJpKs7s7+yLf2+TX5mDJETX4ZNeDQcgAu644unqQYkGcbxchywDeqkNE2o2Y43Baq/3
         UW3NczU8LroW9CY7ZuO0LQOhCJtzfpwjLPhZQnrvuVItltOPTakQ1u3A+pZc9Au5yO5w
         wRoynrlAH0NpI5WjQDQUbf74PKjNl02al9Dx4n5xGaV6Ga4ZnlvpDepoQfRZrRpgU3MS
         mq6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oQBcZLRQSJNhtU+t6MQeVLZ2u/wOeujIUGm2gsEJiuY=;
        fh=zGZBPYMc9W0j65Dv0RobByLEl8523MOb+tR7dC0a43g=;
        b=nXpr7OyTUXULx1NsonpOyC/Ht3A7jvCYZX7omZDALw6PejoZcf08EoOAtnembQAIOo
         gaJZzS3Vjn7mNq1ytUWFLEa5HwV/a1lFrs9DVkuRmaCkiYsejmKUlE0aQcpA6iIh4opy
         ChYgIdb/1oP2AGde4M9RaLiwZ0mzKWmn0ffOCkAVLjeTaQfSsTSLMVprOrpfx7lnsORM
         B97Zvj1NaMp9XdKRLA9qIO9XktrFRk7vrr431nf6J8f7EA609YFPitsZFEENw7YmoIqq
         rdFor1PqWIHCq+i1piSgVb1PsIP28gKIKLNMa3xJdsFUiJUj9kMu1jE5bOUwkP64e3YW
         OMJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789529443; x=1790134243; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oQBcZLRQSJNhtU+t6MQeVLZ2u/wOeujIUGm2gsEJiuY=;
        b=YE7t3A/yJ+mdGE+CO3NN+3g6tybzbT+gL9pQ6Tufy2EGD0TqLgdSnO/XbmA/0oELAO
         mWY04psHGsKYlCCEXn4CD9BVJrsKv/e8vVgVvPdR6juGWHN4upxe/hKdEGB2TJYKuu0A
         psQNSM+F6A1x9k7HI+GqgjPwcza2JGxSN4HculNIWktPAWjkYz0kDJV9n0DakY9r+dVz
         Wjw1Wkkzs7JBix61EypUze3lVK4onQ+eWN/BDxyDj5remMHi8OeFEpCZha58ESb6chUN
         bWhNAe06E5lSW73NrUUxG65jsP6GW+2W5P1GyoLfbkcgDI19KybfF7FWkrqMnfKc+yCh
         KVqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789529443; x=1790134243;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oQBcZLRQSJNhtU+t6MQeVLZ2u/wOeujIUGm2gsEJiuY=;
        b=zUbxGgEr5HEsyOT7cLYdcWZAQY7F8x0efRFoZ4edBPfPN1ixRGAFW5yk+9c+p5kZMF
         tfFLJUFE6EGKzxYl8CMDSpUBIeCSAvD8Ih8OsomkWShZ5a83B41INoGKw4kyh5D87oYQ
         iogOrZZdGmrCmrfc+trPXpwr2uB9SHCB6HBeGMLAF8UU6cf95fgDO4S8bv3G5oZGrzAZ
         NzKvwqjHM56VM6D7XRB2ei4jneJ2vWn55zgebgPtnOz3AITzH3PHK1sxJCE3HdWZKqfi
         B8gglPlHszSKo4ZNNOHg3Wr/AxICY5fwfSCWt3lNjMoV800ns85yzhrl9RoPWlKDEYcB
         DwoA==
X-Forwarded-Encrypted: i=1; AKwUvBzPgzCXW3Uk5AAOGoG4Sgz0991bJlEtJ61zedDFMuXw0LUqy+b2/+UxC/YczorZGg+GLqORgBayd6A=@vger.kernel.org
X-Gm-Message-State: AFuF++ly4jq3QFgiXdJVuSIboEP+60YTR7Z+thCCwExkzyno/gvPp2Us
	oXuEvjxfu/CNk2WJ8r+Hztt91y4w7vRz2tpubIzMIBCae1SpBM/gPkGkMeC0L77NnNiY/do/e6k
	kv53h1vasdsPHYKO54uE6AylRoC4CcMs=
X-Gm-Gg: AYBFou3IJggxK5Rx5iIzjQ1fMnOA+QT6Ijddim2nH3BMcRhG+xKXb5KTcxX5qU8GNYb
	NFWfrHicaSX4Xb+sAKmZdRWUOdSzw5L7LUiR7rQWui2t5kf5LeD5EjB28w8d5luOuxGzX1+i4Bh
	6w4P8KS95bp5JY9zrOWs+3G9wuGyKswXlvJ7uK35io2ruHQRr37rpa7NrVHRTCjI7ECfy+3MseK
	iNExtugZn0/czRm9Z98l0T3rIwAfQrv8ccngwMbKyZhOGQ6cVCPh8m9vNMU7d5orZM67Da1bOhN
	i6iMXqCDvrtizGINAMPyGH++IOkJhwotzXAYmmxmKQMEH1GYgyIItsSCYmUUGfPNzZk=
X-Received: by 2002:a17:903:1ac5:b0:2cc:864b:539 with SMTP id
 d9443c01a7336-2dd8e003302mr22506815ad.6.1789529443281; Tue, 15 Sep 2026
 20:30:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915100931.3593242-1-andriy.shevchenko@linux.intel.com> <20260915100931.3593242-6-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20260915100931.3593242-6-andriy.shevchenko@linux.intel.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 16 Sep 2026 11:30:15 +0800
X-Gm-Features: AcwNN1XutB8iZg2AF0p02q4kvkV9mnifXUYQQ4fzj9LiCitjAIk_rhIx4BZpDsc
Message-ID: <CAA+D8APje43K1vNagzzH4yX=q1fx0Ntwa28fuFfyhYt5MRCkbg@mail.gmail.com>
Subject: Re: [PATCH v1 5/7] ASoC: fsl_asrc: Replace dma_request_slave_channel()
 by dma_request_chan()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Frank Li <Frank.Li@nxp.com>, Mark Brown <broonie@kernel.org>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, bui duc phuc <phucduc.bui@gmail.com>, 
	Tianchu Chen <flynnnchen@tencent.com>, linux-kernel@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, Dave Penkler <dpenkler@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>, 
	Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Lars-Peter Clausen <lars@metafoo.de>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Olivier Moysan <olivier.moysan@foss.st.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 6:09=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Replace dma_request_slave_channel() by dma_request_chan() as suggested
> since the former is deprecated.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Shengjiu Wang
> ---
>  sound/soc/fsl/fsl_asrc.c     |  2 +-
>  sound/soc/fsl/fsl_asrc_dma.c | 13 +++++++------
>  sound/soc/fsl/fsl_asrc_m2m.c |  8 ++++----
>  sound/soc/fsl/fsl_easrc.c    |  2 +-
>  4 files changed, 13 insertions(+), 12 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> index b24737add001..ae682bf450f6 100644
> --- a/sound/soc/fsl/fsl_asrc.c
> +++ b/sound/soc/fsl/fsl_asrc.c
> @@ -638,7 +638,7 @@ static struct dma_chan *fsl_asrc_get_dma_channel(stru=
ct fsl_asrc_pair *pair,
>
>         sprintf(name, "%cx%c", dir =3D=3D IN ? 'r' : 't', index + 'a');
>
> -       return dma_request_slave_channel(&asrc->pdev->dev, name);
> +       return dma_request_chan(&asrc->pdev->dev, name);
>  }
>
>  static int fsl_asrc_dai_startup(struct snd_pcm_substream *substream,
> diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
> index 2f662bdf14d0..5cd12781c604 100644
> --- a/sound/soc/fsl/fsl_asrc_dma.c
> +++ b/sound/soc/fsl/fsl_asrc_dma.c
> @@ -191,9 +191,10 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_com=
ponent *component,
>         dma_params_fe->maxburst =3D dma_params_be->maxburst;
>
>         pair->dma_chan[!dir] =3D asrc->get_dma_channel(pair, !dir);
> -       if (!pair->dma_chan[!dir]) {
> +       ret =3D PTR_ERR_OR_ZERO(pair->dma_chan[!dir]);
> +       if (ret) {
>                 dev_err(dev, "failed to request DMA channel\n");
> -               return -EINVAL;
> +               return ret;
>         }
>
>         ret =3D snd_dmaengine_pcm_prepare_slave_config(substream, params,=
 &config_fe);
> @@ -404,9 +405,9 @@ static int fsl_asrc_dma_startup(struct snd_soc_compon=
ent *component,
>
>         /* Request a dummy dma channel, which will be released later. */
>         tmp_chan =3D asrc->get_dma_channel(pair, dir);
> -       if (!tmp_chan) {
> +       ret =3D PTR_ERR_OR_ZERO(tmp_chan);
> +       if (ret) {
>                 dev_err(dev, "failed to get dma channel\n");
> -               ret =3D -EINVAL;
>                 goto dma_chan_err;
>         }
>
> @@ -497,9 +498,9 @@ static int fsl_asrc_dma_pcm_new(struct snd_soc_compon=
ent *component,
>
>         /* Request a dma channel, which will be released later. */
>         chan =3D asrc->get_dma_channel(pair, IN);
> -       if (!chan) {
> +       ret =3D PTR_ERR_OR_ZERO(chan);
> +       if (ret) {
>                 dev_err(dev, "failed to get dma channel\n");
> -               ret =3D -EINVAL;
>                 goto dma_chan_err;
>         }
>
> diff --git a/sound/soc/fsl/fsl_asrc_m2m.c b/sound/soc/fsl/fsl_asrc_m2m.c
> index 4bc40f328f58..e440cc083ebb 100644
> --- a/sound/soc/fsl/fsl_asrc_m2m.c
> +++ b/sound/soc/fsl/fsl_asrc_m2m.c
> @@ -503,16 +503,16 @@ static int fsl_asrc_m2m_comp_task_create(struct snd=
_compr_stream *stream,
>
>         /* Request dma channels */
>         pair->dma_chan[IN] =3D asrc->get_dma_channel(pair, IN);
> -       if (!pair->dma_chan[IN]) {
> +       ret =3D PTR_ERR_OR_ZERO(pair->dma_chan[IN]);
> +       if (ret) {
>                 dev_err(dev, "[ctx%d] failed to get input DMA channel\n",=
 pair->index);
> -               ret =3D -EBUSY;
>                 goto err_dma_channel_in;
>         }
>
>         pair->dma_chan[OUT] =3D asrc->get_dma_channel(pair, OUT);
> -       if (!pair->dma_chan[OUT]) {
> +       ret =3D PTR_ERR_OR_ZERO(pair->dma_chan[OUT]);
> +       if (ret) {
>                 dev_err(dev, "[ctx%d] failed to get output DMA channel\n"=
, pair->index);
> -               ret =3D -EBUSY;
>                 goto err_dma_channel_out;
>         }
>
> diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
> index aced16d1228a..d30cc3e90215 100644
> --- a/sound/soc/fsl/fsl_easrc.c
> +++ b/sound/soc/fsl/fsl_easrc.c
> @@ -1433,7 +1433,7 @@ static struct dma_chan *fsl_easrc_get_dma_channel(s=
truct fsl_asrc_pair *ctx,
>         /* Example of dma name: ctx0_rx */
>         sprintf(name, "ctx%c_%cx", index + '0', dir =3D=3D IN ? 'r' : 't'=
);
>
> -       return dma_request_slave_channel(&easrc->pdev->dev, name);
> +       return dma_request_chan(&easrc->pdev->dev, name);
>  };
>
>  static const unsigned int easrc_rates[] =3D {
> --
> 2.50.1
>
