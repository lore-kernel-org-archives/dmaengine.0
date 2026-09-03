Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79C53B0AC6
	for <dmaengine@vger.kernel.org>; Thu,  3 Sep 2026 06:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788418645; cv=none; b=bDVl6cGtVUSRVDIEAAw7vgNKrh8GbhQB8jYyO3l12IL7+eRWp53b82fweExiFkHBckhMfA3c9sJb64nNPdlEKfVvRcd9Px7D9xsuBOigIb+IPvlSN/wD7ZMO6HHWlZsOP6HYlX7TYH5wgmMlaLUMxAA7V0XXPFXCqWfrBkuSzfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788418645; c=relaxed/simple;
	bh=GvlqyCumGhzrry2m4fpzULL1Mc5yj+ZfAYmbB/cW0zY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=adPC8VDDDheTjzZJ9hoHG+3CCAHHiB5mh7DgGEf3zUamEjKDXEoju1m1kp+0yyOwzP16d+5lcDbMFFCaZH2xK4D34dIbWC+TWjVM3dIqY0xb+12655zI9GxOiWQe9pFmJyyyU0q0oh2V4mcLRSISXqEvtoy+jK9Q+I51fIopX5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fnYOTamw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fnYOTamw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C0121F00A3A;
	Thu,  3 Sep 2026 06:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788418644;
	bh=OAaanRr5/YJ1ndMXoSWNIfiqtCWLdVIPmn7nKwbdcco=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fnYOTamwNpi4IfHaEhChYnyHHMs3CNAtrY22rMYi64zWk7Ccc3PPiBWcgjQdZHcEB
	 NtLwz3N3CjmEg1O8naTV8WM4Sd4c+mseHf2GAj6j7elIIioluhBUG1Yqpxh4zniXR8
	 ga+N0ugzDZAzvZXE+NGcYxnx0VxYwbbTpIXffXlowxX3oCkvV5/8IHVyAdzjXd+OKo
	 YpCQqutrYMSeQfypsYFMuIQrQWyGU9Ovromr+jM9s1NfVCSFSDrook070CD3z7Lck9
	 gSASt+RGiEw9Vh+jv1DksqMGgKF4NBw87aUMgRdLo50oZMe91aZRCstH9J3srxhqbY
	 LOr3sZbJ1KBTw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] dmaengine: dw-edma: Configure remote interrupt
 routing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: dmaengine@vger.kernel.org, Frank.Li@kernel.org, vkoul@kernel.org
In-Reply-To: <20260903064533.2269557-3-den@valinux.co.jp>
References: <20260903064533.2269557-1-den@valinux.co.jp>
 <20260903064533.2269557-3-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 06:57:23 +0000
Message-Id: <20260903065724.1C0121F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Overly restrictive check in dw_edma_device_config_irq_mode uncondi=
tionally rejects valid repeated dmaengine_slave_config calls.
--

commit a84fcfcb09487df4c48ca1e301c604e49afc0e26
Author: Koichiro Den <den@valinux.co.jp>

dmaengine: dw-edma: Configure remote interrupt routing

An endpoint function can reserve an endpoint-local channel while the RC
programs it through an exposed register window. Such a channel must route
interrupts remotely and ignore them on the endpoint. Use dma_slave_config
to set per-channel interrupt routing on idle channels of a local
eDMA-compatible instance.

> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-=
edma-core.c
> index a678c70a78fe6..e3786d960a431 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c
> @@ -177,48 +177,79 @@ dw_edma_get_default_irq_mode(struct dw_edma_chan *c=
han)
>  						  DW_EDMA_CH_IRQ_REMOTE;
>  }
> =20
> +static int dw_edma_device_config_irq_mode(struct dw_edma_chan *chan,
> +					  enum dw_edma_ch_irq_mode mode)
> +{
> +	if (!(chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL) ||
> +	    (mode !=3D DW_EDMA_CH_IRQ_LOCAL && mode !=3D DW_EDMA_CH_IRQ_REMOTE))
> +		return -EINVAL;
> +
> +	guard(spinlock_irqsave)(&chan->vc.lock);
> +
> +	if (chan->configured || chan->status !=3D EDMA_ST_IDLE ||
> +	    chan->request !=3D EDMA_REQ_NONE)
> +		return -EBUSY;

[Severity: High]
Does this unconditionally reject valid repeated dmaengine_slave_config() ca=
lls?

A caller that populates dma_slave_config.peripheral_config with
DW_EDMA_CH_CONFIG_IRQ_MODE and calls dmaengine_slave_config() multiple times
to update standard fields (like src_addr or dst_addr) will face an unexpect=
ed
-EBUSY error on all calls after the first.

This happens because chan->configured is set to true at the end of
dw_edma_device_config(), so subsequent calls fail here even if the requested
IRQ mode is identical and the channel is idle.

Should this gracefully allow the call if chan->irq_mode =3D=3D mode?

> +
> +	WRITE_ONCE(chan->irq_mode, mode);
> +
> +	return 0;
> +}
> +
>  static int dw_edma_device_config(struct dma_chan *dchan,
>  				 struct dma_slave_config *config)
>  {

[ ... ]

> +	if (flags & DW_EDMA_CH_CONFIG_IRQ_MODE) {
> +		switch (chan->dw->chip->mf) {
> +		case EDMA_MF_EDMA_LEGACY:
> +		case EDMA_MF_EDMA_UNROLL:
> +		case EDMA_MF_HDMA_COMPAT:
> +			break;
> +		default:
> +			return -EINVAL;
>  		}
> =20
> -		if (cfg_non_ll || non_ll)
> -			chan->non_ll =3D true;
> -	} else if (config->peripheral_config) {
> -		dev_err(dchan->device->dev,
> -			"peripheral config param applicable only for HDMA\n");
> -		return -EINVAL;
> +		ret =3D dw_edma_device_config_irq_mode(chan, dw_config->irq_mode);
> +		if (ret)
> +			return ret;
>  	}
> =20
> +	chan->non_ll =3D non_ll;
>  	memcpy(&chan->config, config, sizeof(*config));
>  	chan->configured =3D true;

[Severity: High]
This is where chan->configured is set to true on the first call, triggering
the -EBUSY on all subsequent calls to dw_edma_device_config_irq_mode().

> =20
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903064533.2269=
557-1-den@valinux.co.jp?part=3D2
