Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69BC3C4B9A;
	Fri, 10 Jul 2026 12:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783686128; cv=none; b=sJN52I7SSDoU37O4/GtJT6tRvQGgRgT1Lhjhfr3GpbxSLT9Tt566eAdR88rNch16+srGGr1B9yOn/HSqB21j4G7gV9yMkR0H2Xy85sH2hSt+tJjbkyS2RQkXUznGjSAP7AuinO6JslII63lfWfOQnxq+ioy57IfKZTJ/iOCYT+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783686128; c=relaxed/simple;
	bh=Ht3McOjXKZsSN0UFXbDrEi1fJi8XOCvBXCxGv/GjQk0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EnCAsu/sa64fheeTxmg/PPL0f16lUt6tR9+LbpNHWu5zR9xSzgNEBnfHIvrEFKcQhyFal1R8sbEeNdIZhlpJSeqRJvIE8t0Q63vaSqLbNRBD3T1lBAvSIu0yNnavumsYr0cSXogMSgwUMqV/PcAFhy1cRMA8B49t4bJ1G9sti/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O/t0HRS5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O/t0HRS5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E38231F00A3A;
	Fri, 10 Jul 2026 12:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783686127;
	bh=oAfzCi/hXxgWYUT/S3XUhFYQszjmWj6cpBPw2Cd8oYQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O/t0HRS5h6+QymqQz5Qw1vR2Eit997r5wQBbjaSQZz25Eew83PM9qtMruViYKKBdt
	 f6+Iq667OLCLNMmC9U/dJPSi1bnoguz7IKf9u1M8LJpC2R3FD2srC59MDuE6/TccOf
	 ph3yXYv3EVb8xK+r3tDSTetDhXpLxJsWu3u1nPbSw5Wad0LnnhViW3hZrhYqR0bmaa
	 5xQq7GtZZDcyXcmuv88vmOj955ePdov5jepfT5lda9ZOi1hts2sdJH6VczQd3No888
	 prYH44atYH4LbA6+HRUX8huC1HoOfz0tOoE9A+J+aSKwymPUu2mN+LFlpBXPCdnLfl
	 YxZf5LRLD/YHQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/2] dmaengine: fsl-edma: Support dynamic
 scatter/gather chaining
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QmVub8OudCBNb25pbg==?= <benoit.monin@bootlin.com>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org, imx@lists.linux.dev
In-Reply-To: <20260710-fsl-edma-dyn-sg-v6-2-831b96be3f31@bootlin.com>
References: <20260710-fsl-edma-dyn-sg-v6-0-831b96be3f31@bootlin.com>
 <20260710-fsl-edma-dyn-sg-v6-2-831b96be3f31@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 12:22:06 +0000
Message-Id: <20260710122206.E38231F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] Dynamically linked descriptors are incorrectly re-executed if =
the hardware completes the entire scatter/gather chain before the interrupt=
 handler runs.
- [Critical] Dynamic scatter/gather chaining loses the `link_sg_id` on mult=
i-TCD descriptors, causing the interrupt handler to incorrectly reap active=
ly executing descriptors.
--

--- Patch [2]: [PATCH v6 2/2] dmaengine: fsl-edma: Support dynamic scatter/=
gather chaining ---
commit 7b2e56fb9781985df561a9463fc3de1f384eab25
Author: Beno=C3=AEt Monin <benoit.monin@bootlin.com>

dmaengine: fsl-edma: Support dynamic scatter/gather chaining
   =20
Implement dynamic linking of scatter/gather transfers to enable
chaining multiple DMA descriptors without stopping the channel.
This avoids waiting for the channel to go idle if there is another
transaction already issued.

> diff --git a/drivers/dma/fsl-edma-common.c b/drivers/dma/fsl-edma-common.c
> index c10190164926a..6cca5dca8d60a 100644
> --- a/drivers/dma/fsl-edma-common.c
> +++ b/drivers/dma/fsl-edma-common.c
> @@ -58,11 +61,29 @@ void fsl_edma_tx_chan_handler(struct fsl_edma_chan *f=
sl_chan)
>  		list_del(&fsl_chan->edesc->vdesc.node);
>  		vchan_cookie_complete(&fsl_chan->edesc->vdesc);
>  		fsl_chan->edesc =3D NULL;
> -		fsl_chan->status =3D DMA_COMPLETE;
> +		if (!(fsl_edma_drvflags(fsl_chan) & FSL_EDMA_DRV_SPLIT_REG) ||
> +		    (edma_readl_chreg(fsl_chan, ch_csr) & EDMA_V3_CH_CSR_DONE)) {
> +			fsl_chan->status =3D DMA_COMPLETE;
> +		}
>  	} else {
>  		vchan_cyclic_callback(&fsl_chan->edesc->vdesc);
>  	}
> =20
> +	if (!fsl_chan->edesc && fsl_chan->status !=3D DMA_COMPLETE) {

[Severity: Critical]
If the hardware completes the entire scatter/gather chain before the interr=
upt
handler runs, fsl_chan->status will be set to DMA_COMPLETE above.

Does this condition then cause the handler to entirely skip reaping the
completed intermediate descriptors?

> +		u8 link_sg_id =3D FIELD_GET(EDMA_TCD_CSR_LINKCH, edma_read_tcdreg(fsl_=
chan, csr));
> +		struct virt_dma_desc *vdesc, *tmp;
> +
> +		list_for_each_entry_safe(vdesc, tmp, &fsl_chan->vchan.desc_issued, nod=
e) {
> +			struct fsl_edma_desc *fsl_desc =3D to_fsl_edma_desc(vdesc);
> +
> +			if (link_sg_id =3D=3D fsl_desc->link_sg_id)
> +				break;
> +
> +			list_del(&vdesc->node);
> +			vchan_cookie_complete(vdesc);
> +		}
> +	}
> +
>  	if (!fsl_chan->edesc)
>  		fsl_edma_xfer_desc(fsl_chan);

[Severity: Critical]
If the intermediate descriptors are not reaped because fsl_chan->status is
DMA_COMPLETE, will fsl_edma_xfer_desc() pop those already-finished descript=
ors
from the desc_issued list and re-submit them, causing duplicate I/O executi=
on?

[ ... ]

> @@ -924,14 +945,74 @@ void fsl_edma_xfer_desc(struct fsl_edma_chan *fsl_c=
han)
[ ... ]
> +static void fsl_edma_link_sg(struct fsl_edma_chan *fsl_chan, struct fsl_=
edma_desc *fsl_desc)
> +{
[ ... ]
> +	first_csr |=3D FIELD_PREP(EDMA_TCD_CSR_LINKCH, fsl_chan->link_sg_id++);
> +	fsl_edma_set_tcd_to_le(fsl_chan, first_tcd, first_csr, csr);
> +	fsl_desc->link_sg_id =3D FIELD_GET(EDMA_TCD_CSR_LINKCH, first_csr);

[Severity: Critical]
This embedded link_sg_id appears to only be set on the first TCD of the
descriptor.

If fsl_desc has multiple TCDs, when the hardware progresses to the second T=
CD,
will it load a link_sg_id of 0?

If an interrupt fires while the second TCD is active, would
fsl_edma_tx_chan_handler() read the hardware CSR as 0 and mistakenly reap t=
he
actively executing descriptor since it won't match fsl_desc->link_sg_id?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710-fsl-edma-d=
yn-sg-v6-0-831b96be3f31@bootlin.com?part=3D2
