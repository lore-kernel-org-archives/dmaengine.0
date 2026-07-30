Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BD04418CA
	for <dmaengine@vger.kernel.org>; Thu, 30 Jul 2026 14:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785422213; cv=none; b=WZWnOp2IF8Eq2ZlR8lW0V4o43+otheE6zYMfHwowAn4SD3z1gkxderYQGJK9JkX0U9O7Ykyf6uIEtYsW2DsPpB5fRCSQH7uPAjSl/oihjOnclNvZy0OduD4yv/JOzRLBCjh4/FZX/RuqUWbea29zEqnH0nbgGM4slz1pLKhgl5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785422213; c=relaxed/simple;
	bh=iB+cyEXjiu3Cp6nIQ0DxkZ3Dzm4UTT1LPZ+O017R+Sw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Gc6/d0H/niQdAeBGqVg64/NsLd97EybSIl91ObV6w2Rw7JEmlhTQD8BtO5IppT0xdmqEhDG0AhEMqlHlPoLIJLg8CEEerwFNSo6wuseyzjlYVQt1WmxLHrLFRAijLUDdxbGAwIVGcEV4aXz6+tOGPSsFWEK9fpdavHrx9FexHOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jrJMRDb2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jrJMRDb2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CE041F00A3A;
	Thu, 30 Jul 2026 14:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785422211;
	bh=2dcxCqXQxROs88g+oQN7jzaW80h+LKXS+4rB4U3puNw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jrJMRDb2N7FCD7V3Dx3O2K2RKiBRYcn2m1lP+yToXTsmarcrLbBVBxkeAhB/g2a4X
	 m0/XKhVER5Xdm9mvkZ4xy1Eb2XFBC3aMBlPm+Cm7JUoA+lQzgK6Rnsi/LuDFMPUp7e
	 Syeb+b8ztJR5RrsG1fvxvEp+kT0T7VCcJMA3B1IlBLyhPJm3/qsFK9czy80qOWMywc
	 VdLwcsI2hSmFcN2Y9v7WSUm+Oxc0rjAHtr/QnNN2s0Yv4YGzBLkffPImtgII3TfM1g
	 P7IG4HtxN6lkdPKVehdOcXb3ytv/HV0gWObwJqp9rm5oD8dwqE9vqrUvyOrI3w6F/t
	 ekBkvBmw/uI0g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/9] dmaengine: dw-axi-dmac: Use bus width capability
 helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TnVubyBTw6E=?= <nuno.sa@analog.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260730-dmaengine-support-wider-dma-masks-v1-3-3732f1f9d9ca@analog.com>
References: <20260730-dmaengine-support-wider-dma-masks-v1-0-3732f1f9d9ca@analog.com>
 <20260730-dmaengine-support-wider-dma-masks-v1-3-3732f1f9d9ca@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 14:36:51 +0000
Message-Id: <20260730143651.9CE041F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the probe functi=
on contains a high-severity race condition. Early IRQ registration via `dev=
m_request_irq()` with `IRQF_SHARED` before channel registers are initialize=
d and clocks are enabled exposes a fatal race condition.
--

--- Patch [3]: [PATCH 3/9] dmaengine: dw-axi-dmac: Use bus width capability=
 helpers ---
commit b49303c13707fb73ed2de7d6198eee4906bb5793
Author: Nuno S=C3=A1 <nuno.sa@analog.com>

dmaengine: dw-axi-dmac: Use bus width capability helpers

Advertise the supported bus widths through dma_set_src_bus_widths()
and dma_set_dst_bus_widths() instead of assigning the legacy u32 masks
directly. This keeps the driver using the new bitmap representation
while preserving legacy fields during the transition.

> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma=
/dw-axi-dmac/dw-axi-dmac-platform.c
> index bcefaff03b5c6..69cac7e3625f0 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
[ ... ]
> @@ -1482,6 +1468,20 @@ static int dw_probe(struct platform_device *pdev)
>  	unsigned int flags;
>  	u32 i;
>  	int ret;
> +	/*
> +	 * The set of bus widths supported by the DMA controller. DW AXI DMAC
> +	 * supports master data bus width up to 512 bits (for both AXI master
> +	 * interfaces), but it depends on IP block configuration.
> +	 */

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing dw_probe()
I noticed a potential race condition involving early IRQ registration.

If a shared interrupt line fires immediately after devm_request_irq() is
called in axi_req_irqs(), the handler dw_axi_dma_interrupt() will execute.

Could this attempt to read from chip->regs before clocks are enabled via
axi_dma_resume(), potentially causing an external abort?

Additionally, the interrupt handler iterates over dw->chan before
chan->chan_regs is initialized in the subsequent channel initialization loop
in dw_probe():

dw_axi_dma_interrupt() {
    ...
    for (i =3D 0; i < dw->hdata->nr_channels; i++) {
        chan =3D &dw->chan[i];
        status =3D axi_chan_irq_read(chan);
        axi_chan_irq_clear(chan, status);
    ...
}

Can this cause axi_chan_irq_read() to dereference a NULL pointer when
accessing chan->chan_regs?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-dmaengine-=
support-wider-dma-masks-v1-0-3732f1f9d9ca@analog.com?part=3D3
