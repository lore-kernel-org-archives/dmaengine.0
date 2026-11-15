Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794758891;
	b=NAPPc4oJ0q394bpmbBefQyG0vNrXsKT6NnYOqJ2f4Lo5TGjorvWlFPw2qE1Ca756Q4p3
	 72Vu29o1edUZKZH5tkNIGRSz9Q+OiLp/3dpB3sW2b+9jZ2IgNGKeRPbvWL/wJC45VhuRm
	 HGtkfSIvCywM6WdxXPTl9U2arahdAbt84QLSTrvqZigzLSDvXm7jBXy6URhxQI+NjTKhQ
	 XjXApXpmIbFwfOJu1z3MuyJgY5dtDF2j03lo55ww3kSe1Dl3fkBb8Zb+r5Xwv97N29bu8
	 ajttXqGrnsWuQgOGWxPQSiLHr7x7SOINKxteOMzd+FzbTnxrfEaKF0i2GDy/bKy9AUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794758891;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=zDfrKJ94HnRjLGYluUr6li09yhWAW9fMvQaCWhimqKg=;
	b=Wj0adOV5TUR0sZN5G+LMsOZyBJQknwfUuTyQO7h6rWhUqatNHslOyllNbUQqaMt3Owlh
	 imiNKIwem92W0P8Y3HIpszcuMKUGavGVqHJYTl5amYPfbBl1eLcuuy47WEDtmLFjOcvHq
	 kNpO7Mcb8cyHb9hDink8C9zWKHs133C6eSiznCDfYrOx3r5SBtgDqui+M6sjfFmxy265i
	 ERk76CfGSIjWRy9GtiqWoG9u9hchCcLsV6q7zY6VLXdyEW3rRYFAgR6DguhfdJirpozGn
	 hOk0nwFQpDyx3G3AUTy3SibkbQ1lEpCPTf5mk2eG8xdrsgAgIT6sLFNnKEWRj2VAcNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VjffTvRr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B477D606A31A
	for <dmaengine@vger.kernel.org>; Sun, 15 Nov 2026 16:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VjffTvRr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F246A1F000C4;
	Sun, 15 Nov 2026 16:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794758891;
	bh=zDfrKJ94HnRjLGYluUr6li09yhWAW9fMvQaCWhimqKg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VjffTvRr6fl0d/oTOCKn+MhI9W8bebu5EyfZxYFyFeM/xMr5RWDUEbZs1KDr2Qjv2
	 Pv66D4CqQThWk5NDbO2Y+o9oyLr+PfOluDNarS4Kx3sjoqtoZtEREYlzIOFSpDpzQz
	 tKC7Irbv3C4i/KJfP18476jUJdpJIfWsug0nrqdrb4o5YOH6m/zj4wBYCzu/kKEOzi
	 6VZ2DkMi0n8SOU0DCYVnh4JMu7yvph9zUeMY0tb9Y8UN8rQRN+IJ0E9C4Vko/d0XmG
	 4TSrEohAQFXl+WdPBuhl+k1o2ol04OEHOzfTSb/zKcwKwl97BmlKEnjT2Ob525/t0S
	 xhQtQmzPlTvNw==
Message-ID: <sashiko-outbox-215642@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: qcom: bam_dma: Report the residue of packet
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nickolay Goppen" <setotau@mainlining.org>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261115-qcom-bam-dma-metadata-v1-1-52e4de54ffd3@mainlining.org>
References: <20261115-qcom-bam-dma-metadata-v1-1-52e4de54ffd3@mainlining.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 16:08:10 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [High] dmaengine: qcom: bam_dma: missing opening brace in
  bam_fifo_xfer_len()
- [High] dmaengine: qcom: bam_dma: undeclared metadata_ops in
  bam_prep_slave_sg()
- [Medium] dmaengine: qcom: bam_dma: missing read barrier in
  process_channel_irqs()
It also noticed 2 related pre-existing issues this patch does not
introduce:
- [Critical] dmaengine: qcom: bam_dma: ring buffer space miscalculation
  in bam_start_dma() [1]
- [High] dmaengine: qcom: bam_dma: unclocked register access in
  bam_dma_irq() [2]
--

commit e40d68fe8bef09bdcbef42721a06c3fd7ad7197d
Author: Nickolay Goppen <setotau@mainlining.org>

dmaengine: qcom: bam_dma: Report the residue of packet

This commit calculates the number of bytes transferred from the BAM FIFO
descriptors and reports the transfer residue in async_desc->vd.tx_result.re=
sidue
upon descriptor completion.

> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> index e62e411dc8f8b..b5cfe3ce34060 100644
> --- a/drivers/dma/qcom/bam_dma.c
> +++ b/drivers/dma/qcom/bam_dma.c

[ ... ]

> @@ -447,6 +448,30 @@ static inline void __iomem *bam_addr(struct bam_devi=
ce *bdev, u32 pipe,
>  		r.ee_mult * bdev->ee;
>  }
> =20
> +/**
> + * bam_fifo_xfer_len - bytes transferred for a completed descriptor chunk
> + * @bchan: BAM channel the chunk was queued on
> + * @async_desc: BAM async descriptor owning the chunk
> + *
> + * For RX pipes the BAM overwrites the size field of the descriptor that
> + * ended the transfer with the number of bytes actually written to memor=
y,
> + * which can be less than the buffer size (e.g. an IPA packet).  Those
> + * values live in the FIFO copy, not in async_desc->desc[].
> + */
> +
> +static u32 bam_fifo_xfer_len(struct bam_chan *bchan,
> +			     const struct bam_async_desc *async_desc)
> +	struct bam_desc_hw *fifo =3D PTR_ALIGN(bchan->fifo_virt,
> +					     sizeof(struct bam_desc_hw));
> +	u32 len =3D 0;
> +	unsigned int i;
> +
> +	for (i =3D bchan->head; i < bchan->head + async_desc->xfer_len; i++)
> +		len +=3D le16_to_cpu(fifo[i % MAX_DESCRIPTORS].size);
> +
> +	return len;
> +}

[Severity: High]
bam_fifo_xfer_len() is missing its opening '{' after the parameter list,
which breaks the build when CONFIG_QCOM_BAM_DMA is enabled.

[Severity: Critical]
This problem wasn't introduced by this patch, but in bam_start_dma(), the
producer side of the same descriptor FIFO ring buffer miscalculates
available space [1] and can overwrite in-flight DMA descriptors:

drivers/dma/qcom/bam_dma.c:bam_start_dma() {
	...
		avail =3D CIRC_SPACE(bchan->tail, bchan->head,
				   MAX_DESCRIPTORS + 1);
	...
		bchan->tail +=3D async_desc->xfer_len;
		bchan->tail %=3D MAX_DESCRIPTORS;
}

CIRC_SPACE() is called with MAX_DESCRIPTORS + 1 (4096), which returns 4095
when the ring is empty (tail =3D=3D head), while bchan->tail and bchan->head
wrap modulo MAX_DESCRIPTORS (4095).  Enqueuing 4095 descriptors wraps
bchan->tail back to bchan->head, making a full ring appear empty so
subsequent submissions overwrite active descriptors before hardware
processes them.

> @@ -732,6 +757,8 @@ static struct dma_async_tx_descriptor *bam_prep_slave=
_sg(struct dma_chan *chan,
>  		} while (remainder > 0);
>  	}
> =20
> +	async_desc->vd.tx.metadata_ops =3D &metadata_ops;
> +
>  	return vchan_tx_prep(&bchan->vc, &async_desc->vd, flags);
>  }
> =20

[Severity: High]
metadata_ops is not declared anywhere in this file or its included headers,
which causes compilation to fail.

> @@ -881,6 +908,11 @@ static u32 process_channel_irqs(struct bam_device *b=
dev)
>  			if (avail < async_desc->xfer_len)
>  				break;
> =20
> +			async_desc->transferred +=3D
> +				bam_fifo_xfer_len(bchan, async_desc);
> +			async_desc->vd.tx_result.residue =3D
> +				async_desc->length - async_desc->transferred;
> +
>  			/* manage FIFO */
>  			bchan->head +=3D async_desc->xfer_len;
>  			bchan->head %=3D MAX_DESCRIPTORS;

[Severity: Medium]
Can bam_fifo_xfer_len() read stale fifo[].size values before the hardware
descriptor writeback is observed?

bchan->fifo_virt is allocated with dma_alloc_wc() (Normal Non-Cacheable
memory on ARM/ARM64, which allows speculative loads), and earlier in
process_channel_irqs() BAM_P_SW_OFSTS is read with readl_relaxed():

drivers/dma/qcom/bam_dma.c:process_channel_irqs() {
	...
		offset =3D readl_relaxed(bam_addr(bdev, i, BAM_P_SW_OFSTS)) &
				       P_SW_OFSTS_MASK;
}

Because readl_relaxed() has no read barrier and the address of
fifo[i % MAX_DESCRIPTORS].size does not depend on offset, the CPU can
speculatively load the initial buffer size written by bam_start_dma()
instead of the byte count written back by the BAM hardware, reporting the
wrong residue to clients.  Using readl() for BAM_P_SW_OFSTS or adding a
dma_rmb() before reading fifo[].size would order the reads.

[Severity: High]
This problem wasn't introduced by this patch, but bam_dma_irq() calls
process_channel_irqs() before acquiring a runtime PM reference [2]:

drivers/dma/qcom/bam_dma.c:bam_dma_irq() {
	...
	srcs |=3D process_channel_irqs(bdev);
	...
	ret =3D pm_runtime_get_sync(bdev->dev);
}

If a shared or spurious interrupt fires while the BAM controller is
runtime-suspended with its clocks disabled, the readl_relaxed() of
BAM_IRQ_SRCS_EE at the start of process_channel_irqs() accesses an
unclocked register and triggers a synchronous external abort.

[1] https://sashiko.dev/#/bug/linux-a877fd6c-244a-404b-88a7-7d77506711a9
[2] https://sashiko.dev/#/bug/linux-0ca05019-399c-4f9d-a7e1-d74c7ddced75

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115-qcom-bam-d=
ma-metadata-v1-1-52e4de54ffd3@mainlining.org?part=3D1
