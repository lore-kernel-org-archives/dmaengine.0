Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E57B2E1746;
	Sun, 21 Jun 2026 21:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782079028; cv=none; b=PiGoSckVYf6k8a10UY8VS7MNPU2JP2ctQ6iH7X5JgihXRZTYd56UtPjpfL0MHIie5KnuqblE8UIByVPSMXspEQ8hkcYiZja42hAL2rUw02aiguYPrZHzq5KJoAX9e4Ed2RKauWhGbiUGmBptVdeCKkgvul3k+xTUPN8eal/DgoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782079028; c=relaxed/simple;
	bh=WSzHnHX9otIzl7VLbXciZjP+fb8x9vE84CITYsNjilI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HAgLc26DHfCSRIRcvKbYE/ZRqywYcuowRGbCVgbQ0rk6BFrdI7ysRHenFHGuj+LtETf8L8kZ5TDlqMgpzpT+IVmV++AHLU5JtepszBSuM+o2kcyfgfn4yVwIDrN1CMY5/JGfCg3LlutY8wAl5IipGQPrUU7h/L9p9Bp9b8Nn33s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OAlp2+DY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OAlp2+DY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D98B1F000E9;
	Sun, 21 Jun 2026 21:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782079025;
	bh=UX+r4NSnZ9T1igf0qKBT5XxYpR2NVqXhWK6k86twMmg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OAlp2+DYMfC6xHwSm0UHeYkUP/BZ/b1zFjrfT8im2ZypO/9bUB2NIKBHAwHzRjGXH
	 tFGypfKw8qyYNxGnZaISoy9XC7oND3YOPhL9Rq51H8UgYkMQEXtNUFtBYeAPwCnZZ+
	 f9z/cs2BhlPzwEhB/71s+I+pIotibia43X6bP94Pjazzz9ZtykgWKLUMvwnOo7lpkO
	 MGY7eBvk4km+r8QdkU0B7Oe9mfxO6i0JlapS4nQmUur27hJ1upPiEwroKLJv/2T6VO
	 I+EYTp97JyVtPSphAQOJ135GSjpGdN/KczM9APCZURSFKH9qjtrV7txSFT13x2Je2Y
	 t1dx9dS2H2SOw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/5] dmaengine: sun6i-dma: Refactor to support A733
 interrupt and register handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yuanshen Cao" <alex.caoys@gmail.com>
Cc: dmaengine@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org, linux-sunxi@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <20260621-sun60i-a733-dma-v2-1-340f205891cc@gmail.com>
References: <20260621-sun60i-a733-dma-v2-0-340f205891cc@gmail.com>
 <20260621-sun60i-a733-dma-v2-1-340f205891cc@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 21 Jun 2026 21:57:05 +0000
Message-Id: <20260621215705.6D98B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The interrupt handler incorrectly handles SoCs with more than 8 ch=
annels due to loop truncation and incorrect physical channel index calculat=
ions, causing missed interrupts and state confusion.
- [High] The driver disables hardware clocks and asserts reset before killi=
ng the virtual channel tasklets, which can lead to a bus fault via Use-Afte=
r-Free hardware access.
- [High] Potential deadlock in `sun6i_dma_terminate_all` due to acquiring `=
sdev->lock` with `spin_lock()` in process context while the lock is also us=
ed in softirq context.
- [High] A race condition between `sun6i_kill_tasklet` and `sun6i_dma_start=
_desc` can inadvertently re-enable hardware interrupts right before the IRQ=
 handler is freed.
--

commit f22370211098277a88244ad75b31ec31efb6ead0
Author: Yuanshen Cao <alex.caoys@gmail.com>
Subject: dmaengine: sun6i-dma: Refactor to support A733 interrupt and regis=
ter handling

This commit refactors the sun6i-dma driver to support the Allwinner A733 DMA
controller. It abstracts hardcoded interrupt handling and register dumping
into function pointers within the sun6i_dma_config structure. This allows
a polymorphic approach determined by the hardware configuration.

> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index a9a254dbf8cb9..ef3052c4ab363 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
[ ... ]
> @@ -460,16 +485,16 @@ static int sun6i_dma_start_desc(struct sun6i_vchan =
*vchan)
> =20
>  	vchan->irq_type =3D vchan->cyclic ? DMA_IRQ_PKG : DMA_IRQ_QUEUE;
> =20
> -	irq_val =3D readl(sdev->base + DMA_IRQ_EN(irq_reg));
> +	irq_val =3D sdev->cfg->read_irq_en(sdev, irq_reg);
>  	irq_val &=3D ~((DMA_IRQ_HALF | DMA_IRQ_PKG | DMA_IRQ_QUEUE) <<
>  			(irq_offset * DMA_IRQ_CHAN_WIDTH));
>  	irq_val |=3D vchan->irq_type << (irq_offset * DMA_IRQ_CHAN_WIDTH);
> -	writel(irq_val, sdev->base + DMA_IRQ_EN(irq_reg));
> +	sdev->cfg->write_irq_en(sdev, irq_reg, irq_val);

[Severity: High]
This isn't a bug introduced by this patch, but is there a race condition
between tasklet teardown and interrupt enabling?

During driver teardown, sun6i_kill_tasklet() writes 0 to the hardware
registers without locks to serialize against the tasklet:

sun6i_kill_tasklet() {
    for (i =3D 0; i < DMA_MAX_CHANNELS / sdev->cfg->num_channels_per_reg; i=
++)
        sdev->cfg->write_irq_en(sdev, i, 0);
...

If the tasklet concurrently executes sun6i_dma_start_desc(), it performs a
read-modify-write on the same register here.

If the tasklet reads the register just before sun6i_kill_tasklet() writes 0,
and then writes back its modified value here, could it overwrite the 0 and
re-enable the hardware interrupt right before devm_free_irq() removes the
handler, leading to an unhandled interrupt storm?

> =20
>  	writel(pchan->desc->p_lli, pchan->base + DMA_CHAN_LLI_ADDR);
>  	writel(DMA_CHAN_ENABLE_START, pchan->base + DMA_CHAN_ENABLE);
[ ... ]
> @@ -549,14 +574,14 @@ static irqreturn_t sun6i_dma_interrupt(int irq, voi=
d *dev_id)
>  	u32 status;
> =20
>  	for (i =3D 0; i < sdev->num_pchans / DMA_IRQ_CHAN_NR; i++) {
> -		status =3D readl(sdev->base + DMA_IRQ_STAT(i));
> +		status =3D sdev->cfg->read_irq_stat(sdev, i);

[Severity: High]
This is a pre-existing issue, but does this interrupt handler correctly han=
dle
SoCs with more than 8 channels?

For SoCs with num_pchans > 8 (such as H3 with 12 channels), the outer loop
uses integer division.

For 12 channels, 12 / 8 evaluates to 1, causing the handler to ignore the
second interrupt register and miss all interrupts for channels 8-11.

Additionally, in the inner loop:

for (j =3D 0; (j < DMA_IRQ_CHAN_NR) && status; j++) {
        pchan =3D sdev->pchans + j;

This calculates the physical channel pointer without accounting for the out=
er
loop index i. If an interrupt occurs on channel 8, it maps to physical
channel 0 instead of 8, which clears the wrong completion state and leaks
channel 8's descriptor.

>  		if (!status)
>  			continue;
[ ... ]


[Severity: High]
This is a pre-existing issue in the driver, but is there a potential deadlo=
ck
in sun6i_dma_terminate_all() regarding sdev->lock?

sun6i_dma_terminate_all() acquires the lock in process context without
disabling interrupts:

sun6i_dma_terminate_all() {
    spin_lock(&sdev->lock);
    list_del_init(&vchan->node);
    spin_unlock(&sdev->lock);

If a softirq fires on the same CPU while this lock is held, it will execute
sun6i_dma_tasklet(), which attempts to acquire the exact same lock using
spin_lock_irq(&sdev->lock). This would cause the tasklet to spin forever.
Should sun6i_dma_terminate_all() use spin_lock_bh() or spin_lock_irqsave()
instead?


[Severity: High]
This is a pre-existing issue, but does the teardown sequence in
sun6i_dma_remove() safely handle tasklets?

The driver disables hardware clocks and asserts reset before calling
sun6i_dma_free(), which kills the virtual channel tasklets:

sun6i_dma_remove() {
    clk_disable_unprepare(sdc->clk);
    reset_control_assert(sdc->rstc);

    sun6i_dma_free(sdc);

If a tasklet is scheduled by an interrupt just before removal, could it run
concurrently or immediately after the hardware is powered down? If the clie=
nt
callback within the tasklet calls a DMA engine API, it will attempt to acce=
ss
DMA hardware registers, which could trigger a bus fault since the clocks are
disabled and reset is asserted.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260621-sun60i-a73=
3-dma-v2-0-340f205891cc@gmail.com?part=3D1
