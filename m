Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6427296BC8;
	Wed, 26 Aug 2026 02:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787712932; cv=none; b=Pbs20eTflyBKX8WeWP+8M9zxcVDvaTMg6g49yFPWl8/rl+jvHfIw0veEhTy+tIJQ0/mdlvPvReVLnoTYm0nlETWm150UVF+Raqm0KeD5+cdhFunLgOA+Ut7ZiRuhv4ezGPIiL4emz1spGzW4HxoiRVeAHtnIPx82jGn3lVy1YZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787712932; c=relaxed/simple;
	bh=fjPoFaEMyWRamgZALCGB+ljJGPglXfmzL1HtO2Qi2eM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DRj7E+NZLN9Wg1coF+8gK7yt4nOTlXR7lzpu7KpxPjR6QPr7pY5cd0a/17V8rNZ1pk7P09K794S0rDO+PP2ehYd71AYYoAPpgUUPo9kdzounKOVM0Ge7mcg/E6bQXGMPUEK/Tfs66TSiDXwPm3kvu7b02FNARSLYCvKo/2SVclQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MYkGTU2a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MYkGTU2a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 229431F000E9;
	Wed, 26 Aug 2026 02:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787712931;
	bh=7NTXxw6054FE2EPXoGqyW/jFNIk/8M9lPpCtI6tTYKs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MYkGTU2a5a5KDpLO6w486snhBy783w32TfRvhsB5uf51xPKFVUIYJHgE5C4vAvyD0
	 2V4B2qM/ba0L0l+Fs3qB2mwqv7ivruRAaIFUBgEo2fjcqo3x2MiloAY6AFJslu3waA
	 wfNbfLejM3k28bzETya9w6vA/lSYjsYk4niSjHO9iykfOKjHYXATi4d8kU3JFQi5l/
	 mIlaB3luTDIfdE+nFFVgTl9/JljGv1SbYIsIZIle5HKbxwU+FaOAuo/foQ5xvEkNrV
	 Hb9NoTkfrWZJOW4XR0btnvahIJBeeKWQHRNnpqQchb9xnt9J7SQnFTMV5EuOY8cZIg
	 XLD0jvSwiYYVQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/5] dmaengine: sun6i-dma: Refactor to support A733
 interrupt and register handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yuanshen Cao" <alex.caoys@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260826-sun60i-a733-dma-v5-1-abc5229b441e@gmail.com>
References: <20260826-sun60i-a733-dma-v5-0-abc5229b441e@gmail.com>
 <20260826-sun60i-a733-dma-v5-1-abc5229b441e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 02:55:30 +0000
Message-Id: <20260826025531.229431F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Pre-existing logic errors in `sun6i_dma_interrupt` fundamentally b=
reak interrupt handling for physical channels >=3D 8 via integer division t=
runcation and misdirected channel array indexing. This actively breaks the =
newly added A733 support as well as existing SoCs.
--

commit e5054eef1eb5c40444453238af77d7ab1cfceae5
Author: Yuanshen Cao <alex.caoys@gmail.com>

dmaengine: sun6i-dma: Refactor to support A733 interrupt and register handl=
ing
   =20
This patch refactors the sun6i-dma driver to support flexible register layo=
uts
and interrupt handling. It introduces irq_stride, irq_en_offset, and
irq_stat_offset to struct sun6i_dma_config to accommodate hardware variatio=
ns.
These changes specifically enable support for the Allwinner A733 SoC.

> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index f47a326dd7ffa..f305fbfb35453 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
[ ... ]
> @@ -549,14 +581,14 @@ static irqreturn_t sun6i_dma_interrupt(int irq, voi=
d *dev_id)
>  	u32 status;
> =20
>  	for (i =3D 0; i < sdev->num_pchans / DMA_IRQ_CHAN_NR; i++) {

[Severity: High]
This is a pre-existing issue, but does this integer division truncate parti=
al
register blocks?

For example, on the 12-channel H3 SoC, 12 / 8 =3D 1, causing the loop to dr=
op
i=3D1 and permanently abandon interrupts for channels 8-11. Interrupts for =
these
upper physical channels are completely ignored, which can lead to unrecover=
able
hardware interrupt storms and system hangs when a device allocates them.

> -		status =3D readl(sdev->base + DMA_IRQ_STAT(i));
> +		status =3D sun6i_read_irq_stat(sdev, i);
>  		if (!status)
>  			continue;
> =20
>  		dev_dbg(sdev->slave.dev, "DMA irq status %s: 0x%x\n",
>  			str_high_low(i), status);
> =20
> -		writel(status, sdev->base + DMA_IRQ_STAT(i));
> +		sun6i_write_irq_stat(sdev, i, status);
> =20
>  		for (j =3D 0; (j < DMA_IRQ_CHAN_NR) && status; j++) {
>  			pchan =3D sdev->pchans + j;

[Severity: High]
This is also a pre-existing issue, but does this indexing fail to include t=
he
outer loop's base channel offset (e.g., i * DMA_IRQ_CHAN_NR)?

This blindly routes interrupts from upper registers (e.g., channels 8-15) to
physical channels 0-7, causing premature transfer completions and cross-cha=
nnel
data corruption.

Furthermore, for the newly introduced A733, where num_channels_per_reg is 1,
the inner loop always evaluates j as 0. This means every interrupt from any
channel maps to pchans[0], rendering the entire DMA controller non-function=
al.

I have verified that this is not fixed in any subsequent patch in this seri=
es.

>  			vchan =3D pchan->vchan;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826-sun60i-a73=
3-dma-v5-0-abc5229b441e@gmail.com?part=3D1
