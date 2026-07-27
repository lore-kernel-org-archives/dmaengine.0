Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5D842FCB1
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 21:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785187520; cv=none; b=NAlan5U1hVJesXw5V4YiO4YgQTI9l+DOO0pdPS2JoMeXR6crnDysBYRV5Me8swttsSNqce3xXhRlR1c2OGcjWD2IlhgDKUYNS1y3x8mBFV8iwgJ1bOFlY2OaS2yrq0Ve5IuZkeQO6RPqUjHSqQ70JkAeRutmgR/xmVGhIF5IShw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785187520; c=relaxed/simple;
	bh=DyD/VgtBUQoWJPvD7C3pmJvY+EZJSOlB76T1O1z9lFg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jbdxSmr2FRXPArs6yE/C0RjG1mu1QVwtKm/DjdQAldnttHpGXDRbd+jHrMpuK4l6JZSmWf4DYk8uQjdjAmcNeEtE7jOpojX3cM/h4HIw0zzigeQj3prToIZezbqcnE8VjAuvRqGJKBoiGGrD1nuY45CAPvXa+NCKgy3Y08PRM+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WtV/vr2V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WtV/vr2V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F9AC1F000E9;
	Mon, 27 Jul 2026 21:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785187518;
	bh=CgKuYhynoRWOy57CEXmedEvtM9wT9U8dzulHv7899P0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WtV/vr2VMmteRsCU82/KWIRkZVOQECx1mxxL40jJN/2vkobQ+nW1AnQJ1YEt2KJtJ
	 2KibrZhiuAEVg4bnpCsPs2cUbRDKmbBu76st/jEqjitGHFijPVAnP/10yn/Ox5nSDy
	 PjJENk62hbbQVv/zm7rurHhobCoewudt/+GPcSaLv7osGFBx0WhR48P1Z58UqOUqqc
	 DsyONMk0QFvQMv9ZtFA5v1QWRK9a4pYOeScan7w+MLL/TOJBFhLpDqM6e1HLgQ+rEI
	 +JBBSB5QrjZ7LZdIHDhKTyVSORZA+Ne3NA5ey5GZ3EW1Rl9kVQVD+lnn4b26PwWph6
	 wRwEAzozAbkAA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 56/64] dmaengine: omap-dma: use dma_chan_kill_bh
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <152e342e252b9196a372924d76ff3536b4a4bde2.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <152e342e252b9196a372924d76ff3536b4a4bde2.1785183549.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 21:25:17 +0000
Message-Id: <20260727212518.3F9AC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Freeing channel memory in `omap_dma_free` without clearing `od->lc=
h_map` leaves a dangling pointer that can be dereferenced by the interrupt =
handler in the probe error path.
- [High] In `omap_dma_remove`, the shared IRQ is freed before hardware inte=
rrupts are disabled, and the wrong interrupt enable register is cleared.
--

--- Patch [56]: [PATCH v2 56/64] dmaengine: omap-dma: use dma_chan_kill_bh =
---
commit fe56c19ed9d7f6c471a97210acc16fdccedd520f
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: omap-dma: use dma_chan_kill_bh

virt-dma now dispatches completion callbacks through per-channel BH
work instead of its tasklet. Cancel that work during teardown before
channel storage is released.

> diff --git a/drivers/dma/ti/omap-dma.c b/drivers/dma/ti/omap-dma.c
> --- a/drivers/dma/ti/omap-dma.c
> +++ b/drivers/dma/ti/omap-dma.c

[ ... ]

> @@ -1521,7 +1521,7 @@ static void omap_dma_free(struct omap_dmadev *od)
>  			struct omap_chan, vc.chan.device_node);
> =20
>  		list_del(&c->vc.chan.device_node);
> -		tasklet_kill(&c->vc.task);
> +		dma_chan_kill_bh(&c->vc.chan);
>  		kfree(c);

[Severity: High]
This is a pre-existing issue, but does freeing the channel memory here leave
a dangling pointer in od->lch_map?

If of_dma_controller_register() fails during probe, omap_dma_free() is call=
ed
to loop through all channels and free them. If a client has already request=
ed a
channel after dma_async_device_register() succeeded, od->irq_enable_mask wi=
ll
be non-zero and od->lch_map will still contain pointers to these now-freed
channels.

Since devm_request_irq() leaves the interrupt handler active until probe
finishes and devres cleans it up, an incoming interrupt could cause
omap_dma_irq() to read the mask, index into od->lch_map, and dereference
the freed memory.=20

Should od->lch_map be cleared when freeing the channel?

[ ... ]

[Severity: High]
This is also a pre-existing issue, but does omap_dma_remove() clear the wro=
ng=20
IRQ enable register and free the shared IRQ too early?

Looking at omap_dma_remove() in drivers/dma/ti/omap-dma.c:

omap_dma_remove() {
    ...
    devm_free_irq(&pdev->dev, irq, od);
    ...
    if (!omap_dma_legacy(od)) {
        /* Disable all interrupts */
        omap_dma_glbl_write(od, IRQENABLE_L0, 0);
    }
    ...
}

The shared IRQ is freed before hardware interrupts are disabled. It also
writes to IRQENABLE_L0 instead of IRQENABLE_L1, which was used during
setup to enable them.=20

If the hardware asserts an interrupt after the handler is removed, could it
assert the shared line indefinitely and cause an unhandled interrupt storm
since the source is never cleared?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785183549.gi=
t.allen.lkml@gmail.com?part=3D56
