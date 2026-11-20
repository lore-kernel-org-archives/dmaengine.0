Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795180251;
	b=z/nrpGKHPkG4wvHeTj3O+mYcOBS7USRkrqW52islnz8aMFjKH0VS7MuM3hkuZSPdaR0s
	 F3jd7mvheyHmlmp8n7yX1l47eV6m9FZMH85ifcvi0HAo3g0UVjptbGO4Ix6p3dvRplCpy
	 cMj2otLgtB6WRD+fdJFrtnYdhQki1s+uZU3uxStzAm8Tc6ME/NE2rHjUp98Szwm+lTWh+
	 JMnD+6j5MLSSzINkH693y0F9dfuds297DdpFsSDbql8ct8HJ3VpTER7X9ydOm7Am3oQ45
	 jusuRdia/kTNkO0r8FWMVM/XYUckorcU5o6P8JriaQsENNdkVsG9g+FJk+S36fFrTqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180251;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=N7LlI+HSiEhByiiV5AAxXSUUcfyy08/aBBICQcerNrQ=;
	b=KZaWvMBgGsVgEUGwWjKekX4QT3uklGtgrhZq4l/dDHZA2PtIU9B1fT9ZeKFo9tQiv0IQ
	 uRWl+Bw285JPyGeCSMRnEeCI65BS7cA8nSSqKV5ZoWtzx7NnsJ395flKHJTFSKfJZXvJv
	 UM6bR3M5ivzsK7KRZeHnWkdpnbrbuyJU9kQR4jhseryH8oF0Nvuqdq3Us3gliJv3FjxtK
	 bDNnTRZ7ao+pNO5TAsM9DiZ+lTa9NqVBfFgBeUdue1QtrQVt8NN9zervTZbGgqMxcRT6n
	 YkDgTEn5J2GvvFNZUXFwWlCOEy/QoJnCGCLhTgkX2A/uBoUfZ9Wx4IBtm7q0wHLMxRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CxTCsdPg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC0A606A33A
	for <dmaengine@vger.kernel.org>; Fri, 20 Nov 2026 13:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CxTCsdPg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D5931F000E1;
	Fri, 20 Nov 2026 13:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795180250;
	bh=N7LlI+HSiEhByiiV5AAxXSUUcfyy08/aBBICQcerNrQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CxTCsdPgBgCI6ftcIeURUXYuilRWOHoRZNSAlNrc3XtN42eDYpGhkTcus4zi6Y+Tm
	 W5vnFpbsJdgocGA81z3db8dKLcOdxThYyGpd/212FoM195dJLYEH7nJ4na3dMDnhj7
	 3W/EcXReWC7Yu29PoLhl/j7Vss+ld4TYvnVTqezAvK774ynt7sCFgBb4egQcyZOPEG
	 /OiZMe+MorV8APio5R07tett17qPsqoGYMw082TtM3OqRW8m6AdWijV08fhgu4pPUO
	 EO2bqPKpcj3pulT+00EdTgevL7NNZbNJABBqT7E8GgjAD4QtxlzEUCkV5SCXN5U5ny
	 Lgc6WFwFcyUOA==
Message-ID: <sashiko-outbox-225187@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: xilinx: xdma: Fix broken PM suspend/resume
Reply-To: sashiko-reviews@lists.linux.dev
To: tumic@gpxsee.org
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261120125254.8678-1-tumic@gpxsee.org>
References: <20261120125254.8678-1-tumic@gpxsee.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 13:10:49 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [High] dmaengine: xilinx: xdma: missing user IRQ mask restore in
  xdma_irq_reconfig()
- [Low] dmaengine: xilinx: xdma: unused function warnings when
  CONFIG_PM_SLEEP=3Dn
- [Low] dmaengine: xilinx: xdma: incomplete kernel-doc on
  xdma_reconfig_channels()
- [Low] dmaengine: xilinx: xdma: duplicated IRQ setup in
  xdma_irq_reconfig()
--

commit 0974145b10560ba9aa27c85ae11ed4e81e50da07
Author: Martin T=C5=AFma <martin.tuma@digiteqautomotive.com>

dmaengine: xilinx: xdma: Fix broken PM suspend/resume

This commit adds system sleep PM suspend and resume callbacks to disable
XDMA channel interrupts on suspend and reconfigure the DMA channels and
IRQ registers on resume.

> diff --git a/drivers/dma/xilinx/xdma.c b/drivers/dma/xilinx/xdma.c
> index 9d827c9a12674..779a5f4b9db70 100644
> --- a/drivers/dma/xilinx/xdma.c
> +++ b/drivers/dma/xilinx/xdma.c
> @@ -398,6 +398,27 @@ static int xdma_xfer_stop(struct xdma_chan *xchan)
>  			    CHAN_CTRL_RUN_STOP);
>  }
> =20
> +/**
> + * xdma_reconfig_channels - Reconfigure DMA channels
> + * @xdev: DMA device pointer
> + * @chans: channels configuration
> + */
> +static int xdma_reconfig_channels(struct xdma_device *xdev,
> +				  struct xdma_chan *chans,
> +				  u32 chan_num)
> +{
> +	int i, ret;
> +
> +	for (i =3D 0; i < chan_num; i++) {
> +		/* init channel hardware */
> +		ret =3D xdma_channel_init(&(chans[i]));
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}

[Severity: Low]
The kernel-doc comment for xdma_reconfig_channels() omits @chan_num, which
causes a W=3D1 kernel-doc warning.  Also, @xdev is unused here since
xdma_channel_init() retrieves it from chan->xdev_hdl.

> @@ -1018,6 +1039,45 @@ static int xdma_set_vector_reg(struct xdma_device =
*xdev, u32 vec_tbl_start,
>  	return 0;
>  }
> =20
> +/**
> + * xdma_irq_reconfig - Reconfigure IRQs
> + * @xdev: DMA device pointer
> + */
> +static int xdma_irq_reconfig(struct xdma_device *xdev)
> +{
> +	u32 user_irq_start;
> +	int ret;
> +
> +	/* config hardware IRQ registers */
> +	ret =3D xdma_set_vector_reg(xdev, XDMA_IRQ_CHAN_VEC_NUM, 0,
> +				  XDMA_CHAN_NUM(xdev));
> +	if (ret) {
> +		xdma_err(xdev, "failed to set channel vectors: %d", ret);
> +		return ret;
> +	}
> +
> +	/* config user IRQ registers if needed */
> +	user_irq_start =3D XDMA_CHAN_NUM(xdev);
> +	if (xdev->irq_num > user_irq_start) {
> +		ret =3D xdma_set_vector_reg(xdev, XDMA_IRQ_USER_VEC_NUM,
> +					  user_irq_start,
> +					  xdev->irq_num - user_irq_start);
> +		if (ret) {
> +			xdma_err(xdev, "failed to set user vectors: %d", ret);
> +			return ret;
> +		}
> +	}
> +
> +	/* enable interrupt */
> +	ret =3D regmap_write(xdev->rmap, XDMA_IRQ_CHAN_INT_EN_W1S, ~0);

[Severity: High]
Does xdma_irq_reconfig() leave user interrupts disabled after resume?
It reprograms XDMA_IRQ_USER_VEC_NUM and re-enables channel interrupts via
XDMA_IRQ_CHAN_INT_EN_W1S, but never restores XDMA_IRQ_USER_INT_EN (and
xdma_suspend() does not mask or save it).  When the PCIe device loses
register state across suspend/resume, any user IRQs previously enabled via
xdma_enable_user_irq() (such as the SPI, I2C and video error IRQs enabled
during probe by mgb4) remain masked after resume.

> +	if (ret) {
> +		xdma_err(xdev, "failed to enable interrupt: %d", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}

[Severity: Low]
This isn't a bug, but xdma_irq_reconfig() duplicates the vector and
interrupt enable register setup at the end of xdma_irq_init().  Could
xdma_irq_init() call xdma_irq_reconfig() instead?

[ ... ]

> @@ -1297,15 +1357,57 @@ static int xdma_probe(struct platform_device *pde=
v)

[ ... ]

> +static const struct dev_pm_ops xdma_dev_pm_ops =3D {
> +	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(xdma_suspend, xdma_resume)
> +};
> +
>  static struct platform_driver xdma_driver =3D {
>  	.driver		=3D {
>  		.name =3D "xdma",
> +		.pm =3D &xdma_dev_pm_ops,
>  	},

[Severity: Low]
When CONFIG_PM_SLEEP is disabled, SET_NOIRQ_SYSTEM_SLEEP_PM_OPS() expands
to nothing and leaves xdma_suspend() and xdma_resume() unused, triggering
-Wunused-function warnings.  Using DEFINE_NOIRQ_DEV_PM_OPS() and
pm_sleep_ptr(&xdma_dev_pm_ops) avoids the warning.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120125254.8678=
-1-tumic@gpxsee.org?part=3D1
