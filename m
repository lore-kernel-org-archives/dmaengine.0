Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EA124E4B5;
	Wed, 26 Aug 2026 01:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787708724; cv=none; b=cZUSnHpgU80XCVhBMD2NH5YHHarhaDvbPCu39cQ0fjmvECTKGCX99TjV0NWrWEtKXd2ZWr5owB551WfhPbN3aKv3omkOQPd3itf/6pH17urJduh+aumV0MFUnQ860PzK3Vb9WFUwPpN62KIKP+NAnASdzgfXa9lpOjlUmr3UtgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787708724; c=relaxed/simple;
	bh=znWvjyjPjRBYQd3onR0ZHiqq/djqtFmq6dJbJ8N+2Cg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uPsvsxtzh0IJCkvyeVlZA1gH3bu/YEqDS2JUSwF8z8h1GTbogH3r6nESUAnXqQQ7DIuv+dp8nqYkoyHNAObAvaRHghFA0rk50pvN8wHbZhJHkjJvflCMwYf4ZzGmJF2Cndan663oLD+jMmuxmKzTpBGa0mwOIhbQdt+5UHlWKKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=em4Ujvrd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="em4Ujvrd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CAB71F000E9;
	Wed, 26 Aug 2026 01:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787708723;
	bh=w4oZ3tiJpSfpGnH/Xkre6+shbFmRfecApFvw8DqAteY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=em4UjvrdA/+un4f31EtDaLS1pLnJHEX+Sg1hbf85VFtg+b4e3rZJCiom4bXjhKkTL
	 s+izSzzwwhRII1ZJXr+yKpr5u3jFCUm5wghBwblDHlnVXE3bbDgdNQuFIRtVWBimmM
	 8DqR0UrqaqypaqbURm7ZFeuUil2DWgY3zaQ8WOH6WJoPr/MaedHkCxKhePwS+pqv/I
	 5hj1AZYrjZr8lwWMPpTUhYkmLJ4UyNjimqcBMxBOcbjkPOrJWb2MvF6OMJbP1Hi8ZL
	 xDc9e3TOlowZK7jW/OrL1t71gT1ohoGwiJvFslyAtUARyHFoPfQbswD9/rz4ltgnzg
	 YU+XgtFb8GaNA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/5] dmaengine: sun6i-dma: Refactor to support A733
 interrupt and register handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yuanshen Cao" <alex.caoys@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-sunxi@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, robh@kernel.org, vkoul@kernel.org
In-Reply-To: <20260826-sun60i-a733-dma-v4-1-dc2f745f40dc@gmail.com>
References: <20260826-sun60i-a733-dma-v4-0-dc2f745f40dc@gmail.com>
 <20260826-sun60i-a733-dma-v4-1-dc2f745f40dc@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 01:45:22 +0000
Message-Id: <20260826014522.8CAB71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Preexisting logic errors in `sun6i_dma_interrupt` regarding ou=
ter loop integer division truncation and inner loop physical channel indexi=
ng lead to dropped interrupts, unhandled interrupt storms, and use-after-fr=
ee conditions for upper channels (>=3D 8).
- [High] Deadlock risk due to acquiring `sdev->lock` without disabling soft=
irqs in process context.
- [High] Lockless read of `vchan->phy` causes TOCTOU race that can pause or=
 stop unrelated DMA channels.
- [High] Data race on IRQ_EN register during driver remove can cause an unh=
andled IRQ storm.
--

commit c54e18d9ab8b9baf10207d467edd0a2daf494d43
Author: Yuanshen Cao <alex.caoys@gmail.com>

    dmaengine: sun6i-dma: Refactor to support A733 interrupt and register h=
andling
   =20
    The `sun6i-dma` driver currently uses hardcoded logic for interrupt
    handling (reading/writing interrupt enable and status registers) and
    register dumping.
   =20
    To support the Allwinner A733, which has a different register layout and
    interrupt handling logic, add `irq_stride`, `irq_en_offset`, and
    `irq_stat_offset` to `struct sun6i_dma_config`. Implement generic
    `sun6i_read/write_irq_*` functions using these new configuration fields
    to accommodate different hardware revisions.

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

[Severity: Critical]
This is a pre-existing issue, but does this outer loop truncation and inner
loop physical channel indexing lead to dropped interrupts and unhandled
interrupt storms?

For the outer loop, integer division truncates the number of loops for SoCs
with non-multiple-of-8 channel counts (e.g., H3 with 12 channels). This
ignores interrupts for channels 8-11, causing unhandled hardware interrupts
and CPU hangs.

For the inner loop, does the array offset use only `j` without `i`? For
channels in higher registers (like channel 8, where `i=3D1`), this incorrec=
tly
attributes the interrupt to channels 0-7 instead of
`i * num_channels_per_reg + j`.

This causes the DMA framework to prematurely complete active transfers on t=
he
wrong channels, leading to use-after-free conditions, data corruption, and
dropped interrupts for the true channel.

Note that for the newly supported A733 SoC, which uses
`num_channels_per_reg =3D 1`, all interrupts for channels 1-15 will incorre=
ctly
map to channel 0, rendering the DMA controller completely non-functional.

[ ... ]

> @@ -1072,9 +1104,11 @@ static struct dma_chan *sun6i_dma_of_xlate(struct =
of_phandle_args *dma_spec,
> =20
>  static inline void sun6i_kill_tasklet(struct sun6i_dma_dev *sdev)
>  {
> +	int i;
> +
>  	/* Disable all interrupts from DMA */
> -	writel(0, sdev->base + DMA_IRQ_EN(0));
> -	writel(0, sdev->base + DMA_IRQ_EN(1));
> +	for (i =3D 0; i < 2; i++)
> +		sun6i_write_irq_en(sdev, i, 0);

[Severity: High]
This is a pre-existing issue, but can this unlocked write to the IRQ_EN
register race with the tasklet's read-modify-write and leave interrupts
enabled?

During driver unload, sun6i_kill_tasklet() writes 0 to the IRQ_EN register
to disable hardware interrupts without any lock. Concurrently, if a channel
is still completing, sun6i_dma_tasklet() can run on another CPU, calling
sun6i_dma_start_desc() which performs an unprotected read-modify-write on
the same IRQ_EN register.

The tasklet can overwrite the 0 written by sun6i_kill_tasklet() with a
non-zero interrupt enable mask. Because the hardware interrupt is left
enabled but the IRQ handler is immediately freed by devm_free_irq(), any
subsequent DMA interrupt assertion will trigger an unhandled IRQ storm,
permanently hanging the CPU.

[ ... ]

Additionally, there are a few other pre-existing issues in this file:

[Severity: High]
This is a pre-existing issue, but does acquiring sdev->lock without
disabling softirqs in process context create a deadlock risk?

Functions like sun6i_dma_terminate_all() and sun6i_dma_pause() can be
called from process context, acquiring sdev->lock using plain spin_lock():

drivers/dma/sun6i-dma.c:sun6i_dma_terminate_all() {
    ...
    spin_lock(&sdev->lock);
    list_del_init(&vchan->node);
    spin_unlock(&sdev->lock);
    ...
}

Concurrently, sun6i_dma_tasklet() executes in softirq context and acquires
the same lock using spin_lock_irq(&sdev->lock). If a hardware interrupt
occurs on the same CPU while the process context holds sdev->lock, the
returning interrupt will trigger do_softirq().

The sun6i_dma_tasklet() will then execute, attempting to acquire sdev->lock
and spinning forever, causing a CPU deadlock.

[Severity: High]
This is a pre-existing issue, but does a lockless read of vchan->phy cause
a TOCTOU race that can pause or stop unrelated DMA channels?

In sun6i_dma_pause(), sun6i_dma_terminate_all(), sun6i_dma_resume(), and
sun6i_dma_tx_status(), vchan->phy is read into a local pchan variable
before any locks are acquired:

drivers/dma/sun6i-dma.c:sun6i_dma_pause() {
    ...
    struct sun6i_pchan *pchan =3D vchan->phy;
    ...
}

Concurrently, sun6i_dma_tasklet() can finish a transfer, clear vchan->phy,
and immediately reallocate the physical channel to a completely different
virtual channel. The original functions then proceed to use the stale
pchan pointer without holding locks, inadvertently stopping, pausing, or
querying an unrelated active DMA transfer. Can this lead to data corruption
and hardware timeouts?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826-sun60i-a73=
3-dma-v4-0-dc2f745f40dc@gmail.com?part=3D1
