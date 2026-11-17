Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794909809;
	b=sJVIjsDSD2r+xsgeVzI6LofM/aUBt40ICf2n2WOQsl/GfRJrGLTrVZnLhhKTUi/oxA2n
	 HYJIaxatldNuODwFSGaoBm0QWe1ilPjdN5mBB1YDxxG8eP/mv8EOTYtN768n1Ny23+Q7M
	 0eVEqfWLqMkGROxwd8orYLrrtDWGiVFPVFDYIY7I0DWvjz5DFA/XuzhT3buJpKlVgaIO4
	 WmiUPBUsjMgQBraEYElu8RB7nsxQ/FtluPSfk3j2WbE0Wav2oQhcVwVWzMkLE1ciGHLxs
	 RXLQCql2dqQj/3ypY5XWs82xfHttHvOiFZEV5WwXMDT9/1v4jThMGlDCi8hmGNTkxjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794909809;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=x615HlYEsKnCEFXZ3oCysMk89efIRH/MFWMSDC/Isxs=;
	b=uDvkYg60yj0A3AALL6bx2b9t4wBk0QVVVlkyaq4Z+vWuN4xJ0MS7u1ohLNlQBdJDYi0r
	 Brp2tIjiWy+U5C17NfIPJxemdt9MbH0MXytmAur5+juWdS+6viwMuYIK1McpfiJZ0hqR2
	 QB63zQkM1cmXPpKcMcYlsgvM3/5q4Y0OLj305TvLWdVjw4wCM8e73EErZQPGI615OwR0E
	 qz1iCsBgT0tpLPgbSju6jiaLcIkCKjMpKAjJKpyPR1nOJhPs5wLPRqYu+RVJW1UvtXvDY
	 rFD0QFXl3PKKRk37QepRXVayxXqp2rFyNiegK2aiUSq8KaY/kSpuDtNjLD0ZO8GEFMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hSwvP1hb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03BD606A31C;
	Tue, 17 Nov 2026 10:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hSwvP1hb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6A501F000CA;
	Tue, 17 Nov 2026 10:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794909809;
	bh=x615HlYEsKnCEFXZ3oCysMk89efIRH/MFWMSDC/Isxs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hSwvP1hb4I76P85w99em61ZwfBXKvqElK052mcQXF0eWTnAYYoIb73lIvuodoSFJo
	 nsuAc2SzyqnHumnf5g8wDJYFgk8wbrCK3w7rCJcfDuOgldCwXD5ClkKM890Wznahth
	 6n8fKwveWTRk0yQ+qYvB5AnqgrOKDtqupgLzb7aHz6Oxl7NVQ9dtSBCZBr5IWkzCdP
	 /ImpVb7MDc5bdavT0sVAYvrvwqb85jPFAUm+xYBP9IdFSJO+4hq2vvAtvsv0l6R0hP
	 8nZH9CZxVkCrFjRgkfIyBbb3shok2SPacznF6AgSu/JkyZPfUb8TbQW/Ab3pwcddqx
	 CWOEHrPGJN/YA==
Message-ID: <sashiko-outbox-218565@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 04/10] dmaengine: arm-dma350: Serialize IRQ and
 termination state
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jelly Jia" <Jelly.Jia@cixtech.com>
Cc: devicetree@vger.kernel.org, dmaengine@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261117094335.1393735-5-Jelly.Jia@cixtech.com>
References: <20261117094335.1393735-1-Jelly.Jia@cixtech.com>
 <20261117094335.1393735-5-Jelly.Jia@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 10:03:28 +0000
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
- [Medium] dmaengine: arm-dma350: stale CH_STATUS bits left latched
  across stop and teardown
--

commit 2d57cff302a30b3310a5e4ef93f2c69bd2b47684
Author: Jelly Jia <Jelly.Jia@cixtech.com>

dmaengine: arm-dma350: Serialize IRQ and termination state

This commit serializes CH_STATUS sampling and active descriptor handling
under the channel lock, and waits for STOPCMD and IRQ completion during
channel synchronization and resource teardown.

> diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
> index 266df7923d7f8..af1b030b955f5 100644
> --- a/drivers/dma/arm-dma350.c
> +++ b/drivers/dma/arm-dma350.c

[ ... ]

> @@ -458,28 +482,44 @@ static void d350_start_next(struct d350_chan *dch)
>  static void d350_issue_pending(struct dma_chan *chan)
>  {
>  	struct d350_chan *dch =3D to_d350_chan(chan);
> -	unsigned long flags;
> =20
> -	spin_lock_irqsave(&dch->vc.lock, flags);
> +	guard(spinlock_irqsave)(&dch->vc.lock);
> +
>  	if (vchan_issue_pending(&dch->vc) && !dch->desc)
>  		d350_start_next(dch);
> -	spin_unlock_irqrestore(&dch->vc.lock, flags);
>  }
> =20
>  static irqreturn_t d350_irq(int irq, void *data)
>  {
>  	struct d350_chan *dch =3D data;
> -	struct device *dev =3D dch->vc.chan.device->dev;
> -	struct virt_dma_desc *vd =3D &dch->desc->vd;
> +	struct virt_dma_desc *vd;
> +	struct d350_desc *desc;
> +	u32 residue;
>  	u32 ch_status;
> +	u32 irq_status;
> +	u32 errinfo =3D 0;
> +
> +	/* Keep the sampled status paired with the active descriptor. */
> +	guard(spinlock)(&dch->vc.lock);
> =20
>  	ch_status =3D readl(dch->base + CH_STATUS);
> -	if (!ch_status)
> +	irq_status =3D ch_status & (CH_STAT_INTR_DONE | CH_STAT_INTR_ERR);
> +	if (!irq_status)
>  		return IRQ_NONE;
> =20
> -	if (ch_status & CH_STAT_INTR_ERR) {
> -		u32 errinfo =3D readl_relaxed(dch->base + CH_ERRINFO);
> +	/* INTR bits are read-only; clearing W1C STAT_ERR also clears ERRINFO. =
*/
> +	if (irq_status & CH_STAT_INTR_ERR)
> +		errinfo =3D readl_relaxed(dch->base + CH_ERRINFO);
> +
> +	writel_relaxed(ch_status & (CH_STAT_DONE | CH_STAT_ERR),
> +		       dch->base + CH_STATUS);

[ ... ]

> @@ -513,6 +549,7 @@ static int d350_alloc_chan_resources(struct dma_chan =
*chan)
>  	struct d350_chan *dch =3D to_d350_chan(chan);
>  	int ret =3D request_irq(dch->irq, d350_irq, IRQF_SHARED,
>  			      vchan_chan_name(&dch->vc), dch);
> +
>  	if (!ret)
>  		writel_relaxed(CH_INTREN_DONE | CH_INTREN_ERR, dch->base + CH_INTREN);
> =20
> @@ -524,7 +561,11 @@ static void d350_free_chan_resources(struct dma_chan=
 *chan)
>  	struct d350_chan *dch =3D to_d350_chan(chan);
> =20
>  	writel_relaxed(0, dch->base + CH_INTREN);
> +	d350_terminate_all(chan);
> +	d350_wait_for_stop(dch);
> +
>  	free_irq(dch->irq, dch);
> +	vchan_synchronize(&dch->vc);
>  	vchan_free_chan_resources(&dch->vc);
>  }

[Severity: Medium]
Can clearing CH_INTREN before stopping the channel leave CH_STAT_DONE or
CH_STAT_ERR latched in CH_STATUS across channel teardown?

In DMA-350, CH_STAT_DONE and CH_STAT_ERR are sticky W1C bits, whereas
CH_STAT_INTR_DONE and CH_STAT_INTR_ERR are gated by CH_INTREN.  Because
d350_free_chan_resources() clears CH_INTREN before calling
d350_terminate_all() and d350_wait_for_stop(), a transfer that completes or
faults just before CH_INTREN is cleared (or while stopping) leaves
CH_STAT_DONE or CH_STAT_ERR set while CH_STAT_INTR_DONE and
CH_STAT_INTR_ERR read as 0.  Even if d350_irq() is already in flight, it
now checks irq_status and returns IRQ_NONE without clearing CH_STATUS.

When the channel is later re-allocated in d350_alloc_chan_resources() and
CH_INTREN_DONE | CH_INTREN_ERR is written to CH_INTREN, the stale status
bit immediately asserts an interrupt that can race with d350_start_next()
and prematurely complete or fail a newly started transfer.  Clearing
CH_STAT_DONE | CH_STAT_ERR after d350_wait_for_stop() (or before enabling
CH_INTREN) would avoid this.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117094335.1393=
735-1-Jelly.Jia@cixtech.com?part=3D4
