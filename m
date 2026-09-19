Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DD71ACEDE
	for <dmaengine@vger.kernel.org>; Sat, 19 Sep 2026 22:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789857384; cv=none; b=kkRBFcWeuaq4jLkgoRQ8+OyX8oPpbSra6ZD6vseVvbVjn4HSnfJJVlznTorT4Mbw24toj57glIPrULf2D1pprzy2TC7kr5xc6JriLKe8w057TdJbtecOvlrBB3/lZn1aHv7SWlh5rgz5vF/klDFqedqSzJSxK83f91B4JQqKiUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789857384; c=relaxed/simple;
	bh=R/rHE58ZMsr7EE80zpDwnP5ZelSKFpDFAlTUyjtlLoo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sn1fO+zIeGcIDbyoZKEDxSoH9pbvedq0HALAaxb7SKbUGjCyCOQC5qwsaGZjkdSkVGr0CYUGhFdMf4l3AYJO2p/7UVKSNFRzh/WEUlesVoK7K3k0jd3qqor5yBZze9ujxkYwv6cfapb+ZFWUTT8hFS09o3dWenBBIYY4/VvXMHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QKdE2zJ3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QKdE2zJ3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CD051F000FF;
	Sat, 19 Sep 2026 22:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789857382;
	bh=S2WmGvjHj66bqGVkLSeKjSeE88FRJ+qX66qVXJvuKoo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QKdE2zJ3vY8OFAQ+mvzODD+R8m29KwpfFyHe2Pc3sjF9QuncpiWqmOeH2P8eV45Mg
	 dNvPF+pAsX+KOE7erfgJBQHDDKEUHgtUJXqkq6RZv61KPGS+otjGvH3OQb0quEz9uC
	 OEyGqd4C9Anl//bpaMI6OjqwWKq+eI8Sg7RlM1C+Mg6/IZ5DciPS6WwrovTbnGTOra
	 q+C5P/Bgq/nZU65mVaQnuB8KYKeivX1L5J2nFojdNNSGc6U6EYTFthSP6Fe9uvkALr
	 aN14SjDk5yVcQnKiPxKELPmP8Ot2/h1zyzO+1mtUuhptTXTioodE0t2Q+DMM0s3PgN
	 twPkVWVvSLo2g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 08/23] dmaengine: ste_dma40: Return IRQ_NONE without
 interrupt status
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260920-dma40-fixes-v4-8-d751b2d9c23f@kernel.org>
References: <20260920-dma40-fixes-v4-0-d751b2d9c23f@kernel.org>
 <20260920-dma40-fixes-v4-8-d751b2d9c23f@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 19 Sep 2026 22:36:21 +0000
Message-Id: <20260919223622.6CD051F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dmaengine: ste_dma40: IRQ disabled due to unhandled DSP interrupts
--

commit 93721f73dfcbd1d64fc59b63723c4f215e77a3b2
Author: Linus Walleij <linusw@kernel.org>

dmaengine: ste_dma40: Return IRQ_NONE without interrupt status

This commit modifies the dma40 interrupt handler to track whether an
interrupt is acknowledged. If no matching status bit is found for a
registered channel, it returns IRQ_NONE to allow the generic spurious
interrupt detector to disable a stuck interrupt line.

> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index 633f6a04fdc14..9f725369721b8 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
> @@ -1790,6 +1790,7 @@ static void dma_tasklet(struct tasklet_struct *t)
> =20
>  static irqreturn_t d40_handle_interrupt(int irq, void *data)
>  {
> +	irqreturn_t handled =3D IRQ_NONE;
>  	int i;
>  	u32 idx;
>  	u32 row;

[ ... ]

> @@ -1838,6 +1839,7 @@ static irqreturn_t d40_handle_interrupt(int irq, vo=
id *data)
> =20
>  		/* ACK interrupt */
>  		writel(BIT(idx), base->virtbase + il[row].clr);
> +		handled =3D IRQ_HANDLED;

[Severity: High]
Does returning IRQ_NONE here risk disabling the DMA interrupt line entirely
when another processor (like a DSP) is using the channel?

If a logical channel is owned by another processor, Linux receives the
hardware interrupt because interrupts are enabled for all logical channels.
In this scenario, d40c will be NULL, and d40_handle_interrupt() skips
acknowledging the interrupt and continues processing, leaving handled as
IRQ_NONE:

	if (!d40c) {
		/*
		 * No error because this can happen if something else
		 * in the system is using the channel.
		 */
		continue;
	}

Since other processors can generate frequent DMA completions, Linux could
rapidly accumulate IRQ_NONE returns. Would the core IRQ subsystem's spurious
detector log "nobody cared" and permanently disable the shared DMA interrupt
line, breaking all Linux DMA transfers?

> =20
>  		spin_lock(&d40c->lock);
> =20

[ ... ]

> @@ -1855,7 +1857,7 @@ static irqreturn_t d40_handle_interrupt(int irq, vo=
id *data)
>  	if (ret > 0)
>  		pm_runtime_put_autosuspend(base->dev);
> =20
> -	return IRQ_HANDLED;
> +	return handled;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260920-dma40-fixe=
s-v4-0-d751b2d9c23f@kernel.org?part=3D8
