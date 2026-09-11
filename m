Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4CC4AA3FE
	for <dmaengine@vger.kernel.org>; Fri, 11 Sep 2026 17:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789148423; cv=none; b=etYQ8ShlbOybKcH9y/KtQT17Q4XO53+fQVa+kdkEwL2kwwVYGpbGRAgG+gdIYjxuqYT+7FuLE7BwgdrRucfqnz9NPc/6rHQGEaXrxNgdsZ+XX4bUwDBtHiDk5YoPY0bIZmDS45Qxt+wXOKcuJNbcMi56VwoEwCVfuQ2jRKeadbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789148423; c=relaxed/simple;
	bh=5hapq4zU2xCArAcHQovvxdS1xHgPn4ZWld/Z+fmr3HY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EaPU+W56oDKcxnAZQTHaQ8B4KTH7SnoODitpVeYCcZ9wpfBF1nEwPJz8MGmzKZ9k7eak+10dQgoE9iBCtgR4M9rtJrCT/laz3whiZnM8nKuIgbYeXTicA2G78asUc/uyKG8+jB8FnCf2LB68jqk/JsXpqvDxvYFMAO3096LYZa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TKlVk3VK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TKlVk3VK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E7A71F00898;
	Fri, 11 Sep 2026 17:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789148412;
	bh=kT4TMRLCBPXIyy3190t0+xnOJptzRIP95OpmM9Fx0HA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TKlVk3VKgbc82CT1FRQpz9DVmK3KEB3l/sXn178O1ttRteytuLciN32951krEjN50
	 46dfniFcVzFLpc4GCdQ2lDSotYOUXeqAg18I17OsUAyiLdDBw510qyg2ZshYrMQGfh
	 wMigWgGoxSczq4ONoQEaA49u1mqceZfOK+mblnu8s2/Brz4wktsAAZHD0JAenjxS/C
	 TTBGWR9/OVpRCgJiXTLU24xK2IoICTWSwfxbaalSpk0AbhnO6At1MZYujtDikrRZIJ
	 n52UyCs4ksoPvq3+LUjCCNidt5o0DP+YE2BIa4aF5L3Isn2w2vEmw2xJiEDU4qi4oQ
	 SHcXFrxBNEd+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 04/10] dmaengine: dw-axi-dmac: Use bus width
 capability helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TnVubyBTw6E=?= <nuno.sa@analog.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260911-dmaengine-support-wider-dma-masks-v4-4-72b8fd4cc78e@analog.com>
References: <20260911-dmaengine-support-wider-dma-masks-v4-0-72b8fd4cc78e@analog.com>
 <20260911-dmaengine-support-wider-dma-masks-v4-4-72b8fd4cc78e@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 17:40:11 +0000
Message-Id: <20260911174012.0E7A71F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The interrupt handler is registered with IRQF_SHARED before channe=
l registers are initialized, risking a fatal NULL pointer dereference.
- [High] Out-of-bounds write in axi_req_irqs due to unbounded irq_count fro=
m platform metadata.
- [High] Missing check for negative error code from platform_irq_count sile=
ntly aborts IRQ registration but falsely returns success.
--

commit 547df6badf50a7c40c7c108bf82e51bb78feaed7
Author: Nuno S=C3=A1 <nuno.sa@analog.com>

dmaengine: dw-axi-dmac: Use bus width capability helpers

Advertise the supported bus widths through dma_bus_width_set_many()
instead of assigning the legacy u32 masks directly. This keeps the
driver using the new bitmap representation while preserving legacy
fields during the transition.

> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma=
/dw-axi-dmac/dw-axi-dmac-platform.c
> index eebed2474210d..ca0ab8dc5f596 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
[ ... ]
> @@ -1482,6 +1469,20 @@ static int dw_probe(struct platform_device *pdev)
>  	unsigned int flags;
>  	u32 i;
>  	int ret;
> +	/*
> +	 * The set of bus widths supported by the DMA controller. DW AXI DMAC
> +	 * supports master data bus width up to 512 bits (for both AXI master
> +	 * interfaces), but it depends on IP block configuration.
> +	 */
> +	enum dma_slave_buswidth buswidths[] =3D {
> +		DMA_SLAVE_BUSWIDTH_1_BYTE,
> +		DMA_SLAVE_BUSWIDTH_2_BYTES,
> +		DMA_SLAVE_BUSWIDTH_4_BYTES,
> +		DMA_SLAVE_BUSWIDTH_8_BYTES,
> +		DMA_SLAVE_BUSWIDTH_16_BYTES,
> +		DMA_SLAVE_BUSWIDTH_32_BYTES,
> +		DMA_SLAVE_BUSWIDTH_64_BYTES,
> +	};
> =20
>  	chip =3D devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
>  	if (!chip)

[Severity: High]
This is a pre-existing issue, but does axi_req_irqs() properly handle a
negative error code from platform_irq_count()?

If platform_irq_count() returns a negative error (like -EPROBE_DEFER):

drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:axi_req_irqs() {
    ...
    int irq_count =3D platform_irq_count(pdev);

    for (i =3D 0; i < irq_count; i++) {
        ...
    }
    return 0;
}

The loop will evaluate to false immediately, and the function falsely
returns 0. This silently aborts IRQ registration and causes dw_probe() to
continue without deferring probe or registering interrupts.


[Severity: High]
This is a pre-existing issue, but can the loop in axi_req_irqs() cause an
out-of-bounds write?

drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:axi_req_irqs() {
    ...
    int irq_count =3D platform_irq_count(pdev);

    for (i =3D 0; i < irq_count; i++) {
        chip->irq[i] =3D platform_get_irq(pdev, i);
        ...
    }
}

The chip->irq array has a fixed size of DMAC_MAX_CHANNELS (32). If
platform_irq_count() returns an unbounded value greater than 32 from the
platform metadata, this will write past the end of the array and corrupt
adjacent memory.


[Severity: High]
This is a pre-existing issue, but could there be a NULL pointer dereference
if a shared interrupt fires early during dw_probe()?

In axi_req_irqs(), the interrupt is registered with IRQF_SHARED:

drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:axi_req_irqs() {
    ...
        ret =3D devm_request_irq(chip->dev, chip->irq[i], dw_axi_dma_interr=
upt,
                               IRQF_SHARED, KBUILD_MODNAME, chip);
    ...
}

However, the channel registers are initialized after this call returns,
in dw_probe():

drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:dw_probe() {
    ...
    ret =3D axi_req_irqs(pdev, chip);
    if (ret)
        return ret;

    INIT_LIST_HEAD(&dw->dma.channels);
    for (i =3D 0; i < hdata->nr_channels; i++) {
        struct axi_dma_chan *chan =3D &dw->chan[i];
        ...
        chan->chan_regs =3D chip->regs + COMMON_REG_LEN + i * CHAN_REG_LEN;
    ...
}

If another device sharing the same IRQ line triggers an interrupt before
the channel registers are initialized, dw_axi_dma_interrupt() will read
from the uninitialized (NULL) chan->chan_regs:

drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:dw_axi_dma_interrupt() {
    ...
    for (i =3D 0; i < dw->hdata->nr_channels; i++) {
        chan =3D &dw->chan[i];
        status =3D axi_chan_irq_read(chan);
        ...
    }
}

Will this cause a panic if the handler tries to access chan->chan_regs?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-dmaengine-=
support-wider-dma-masks-v4-0-72b8fd4cc78e@analog.com?part=3D4
