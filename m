Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795191223;
	b=WKhqo+GDg3YuOxdNoEnie0UQbFCc+VWSYcM+0XIrdEdHhyyqQMfLEYma0VSsVgN9uwow
	 RtoYSjnvb/pwBNu35wC04ZMMIWXegiB+pYgvM6YtC9Pj1o5DjxChVXXk8rUNGUhZ9SUr8
	 ocJUNK2O21qewcTn7obQ0OOOgZU2rXDjyXBEOyg6kAgQ5ncKdNJAJfplWYqzrm/YUILe6
	 fJ6iggUU0WfeJ2kSueQdM/lPDQRWYo35aPW/OlOMFciO0WM5V4RxiWfPa36306UeBiZoZ
	 rMwb42/w1ZxgvxQtprPHqT1+enbYvS9qEH4J5Q71g/n8sKZakZ1Lcjz/36+0RLNsgPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795191223;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=g2P+H9hGjdlaVVrtcSfGiDANZsG3JGuK7/J6qCI3EUI=;
	b=ZQNqTj9m6Df7RDdrYP6umuRmwACoF6UhnGra8GDONtkKu606JFgc/VZ1V6nhPri/0dTd
	 coI/O2D++tnFv9qFmbHLj1V5bAKxuno1Jm+qPcafyFT5M/TsfFxQxt7FmhdL8RJHCIs8D
	 3rPfvn5wzTS/lWs+R+g5ODKNuGo17nWEgRyWS1u/MJebJSTePeIMIrkYQcnSfvdQNBMO6
	 xvBoazWbNeVrctKnMyniV0iUQQHkvZHA7ovq+Fg8OjYUPq12Ar2XBdS55MOVLpW8qlhA1
	 U+vmenDy5sPPWRcgjwijy4kuQCQgIGFHzdkpL4e3zKtvGhoZxGhEHm+h2ECwaV7N+wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="bxbxth9/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FE2606A333
	for <dmaengine@vger.kernel.org>; Fri, 20 Nov 2026 16:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bxbxth9/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04F331F000E1;
	Fri, 20 Nov 2026 16:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795191223;
	bh=g2P+H9hGjdlaVVrtcSfGiDANZsG3JGuK7/J6qCI3EUI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bxbxth9/AJaBIrGkcZhXQayG8xCx0ZONoereOQ4bmGFrYKCvewL9TGT/3IMcOQxdP
	 PnzpGUHSp0FqSZiDuTlbTebk4DivQOaf8RfFg+0jo/sQglQkI3wTqSH4EXMvQbhfxh
	 vkh2rIx/e/iWHW+5BrZCJD2UdVtYK9VlW2A0DOYfn0bmJ0waCa5Z14gtcOsGBOzfSa
	 D/KLWhigN4cDUyJK/k1rt8mh/43h/2xguEBRO0osmiyn0VNrEUUJ4dk2SDvmIq9bTf
	 O14CLYURyczJlqg5Gra0DEHGaM7ICqZiIIdK9rEgYGMp8QVZumwr3Bd88KhysOgLO5
	 ysnjgEicgCoIA==
Message-ID: <sashiko-outbox-225547@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/1] dmaengine: xilinx: xdma: Fix broken PM
 suspend/resume
Reply-To: sashiko-reviews@lists.linux.dev
To: tumic@gpxsee.org
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261120155924.5785-2-tumic@gpxsee.org>
References: <20261120155924.5785-1-tumic@gpxsee.org>
 <20261120155924.5785-2-tumic@gpxsee.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 16:13:42 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] dmaengine: xilinx: xdma: duplicated IRQ setup in
  xdma_irq_reconfig()
--

commit 704030a92f0e7711c7f9e1160147269d5766e4f9
Author: Martin T=C5=AFma <martin.tuma@digiteqautomotive.com>

dmaengine: xilinx: xdma: Fix broken PM suspend/resume

This commit adds noireq PM suspend and resume callbacks to save user IRQ
settings, disable channel interrupts on suspend, and reconfigure DMA
channels and interrupts on resume.

> diff --git a/drivers/dma/xilinx/xdma.c b/drivers/dma/xilinx/xdma.c
> index 9d827c9a12674..fa006c9bae23c 100644
> --- a/drivers/dma/xilinx/xdma.c
> +++ b/drivers/dma/xilinx/xdma.c
[ ... ]
> @@ -398,6 +400,28 @@ static int xdma_xfer_stop(struct xdma_chan *xchan)
>  			    CHAN_CTRL_RUN_STOP);
>  }
> =20
> +/**
> + * xdma_reconfig_channels - Reconfigure DMA channels
> + * @xdev: DMA device pointer
> + * @chans: channels configuration
> + * @chan_num: number of channels
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
> +
>  /**
>   * xdma_alloc_channels - Detect and allocate DMA channels
>   * @xdev: DMA device pointer
> @@ -1018,6 +1042,53 @@ static int xdma_set_vector_reg(struct xdma_device =
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
> +	/* reconfigure hardware IRQ registers */
> +	ret =3D xdma_set_vector_reg(xdev, XDMA_IRQ_CHAN_VEC_NUM, 0,
> +				  XDMA_CHAN_NUM(xdev));
> +	if (ret) {
> +		xdma_err(xdev, "failed to reset channel vectors: %d", ret);
> +		return ret;
> +	}
> +
> +	/* reconfigure user IRQ registers if needed */
> +	user_irq_start =3D XDMA_CHAN_NUM(xdev);
> +	if (xdev->irq_num > user_irq_start) {
> +		ret =3D xdma_set_vector_reg(xdev, XDMA_IRQ_USER_VEC_NUM,
> +					  user_irq_start,
> +					  xdev->irq_num - user_irq_start);
> +		if (ret) {
> +			xdma_err(xdev, "failed to reset user vectors: %d", ret);
> +			return ret;
> +		}
> +	}
> +
> +	/* reenable channels interrupts */
> +	ret =3D regmap_write(xdev->rmap, XDMA_IRQ_CHAN_INT_EN_W1S, ~0);
> +	if (ret) {
> +		xdma_err(xdev, "failed to reenable channel IRQs: %d", ret);
> +		return ret;
> +	}
> +
> +	/* reenable user interrupts */
> +	ret =3D regmap_write(xdev->rmap, XDMA_IRQ_USER_INT_EN_W1S,
> +			   xdev->pm_usr_irq);
> +	if (ret) {
> +		xdma_err(xdev, "failed to reenable user IRQs: %d", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}

[Severity: Low]
This isn't a bug, but xdma_irq_reconfig() duplicates the IRQ vector and
channel interrupt enable setup at the end of xdma_irq_init():

drivers/dma/xilinx/xdma.c:xdma_irq_init() {
    ...
	/* config hardware IRQ registers */
	ret =3D xdma_set_vector_reg(xdev, XDMA_IRQ_CHAN_VEC_NUM, 0,
				  XDMA_CHAN_NUM(xdev));
	if (ret) {
		xdma_err(xdev, "failed to set channel vectors: %d", ret);
		goto failed_init_c2h;
	}

	/* config user IRQ registers if needed */
	user_irq_start =3D XDMA_CHAN_NUM(xdev);
	if (xdev->irq_num > user_irq_start) {
		ret =3D xdma_set_vector_reg(xdev, XDMA_IRQ_USER_VEC_NUM,
					  user_irq_start,
					  xdev->irq_num - user_irq_start);
		if (ret) {
			xdma_err(xdev, "failed to set user vectors: %d", ret);
			goto failed_init_c2h;
		}
	}

	/* enable interrupt */
	ret =3D regmap_write(xdev->rmap, XDMA_IRQ_CHAN_INT_EN_W1S, ~0);
	if (ret)
		goto failed_init_c2h;
    ...
}

Since xdev->pm_usr_irq is 0 during probe and XDMA_IRQ_USER_INT_EN_W1S is
write-1-to-set, could xdma_irq_init() call xdma_irq_reconfig(xdev) instead
of repeating this sequence?

Also, the xdev argument to xdma_reconfig_channels() is unused.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120155924.5785=
-1-tumic@gpxsee.org?part=3D1
