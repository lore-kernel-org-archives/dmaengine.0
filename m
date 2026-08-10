Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01FD33A1683;
	Mon, 10 Aug 2026 10:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786357211; cv=none; b=bdV4djP+tM1zQiO7kZkZNg/bDURsylnbiONSacfqt6TMk2kI/CivK1lw1akrQfOMs0mLFsmVGR8Z6i5km5ZddndULSmkcdx/Y8A4/ZBLNfdVHSY6yaL7TvjTmbqLK0RIz/zlwGadxJZ0h1kpo2j6au2gF7I4IOZrKf//kd3QsNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786357211; c=relaxed/simple;
	bh=R+MfiREWTJoYo6X0hI6hCTT5xNUis+3/j08VJeBJShk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tX3T0m2NvFlwGSC/z9daNB105KDZCzJFu4Y1SWiqRDkqJr5fF9W5BtUzqaEo7msqdkskimQS+N6hCV7xDwC64DorXgPbwQc2p1/7kBt6Q0lhHkpP9/yY3MsasEVhLBy0QvxjAQtN0fVnpHXYB0Ul07ZJrme6D64sDVt8YZ4aeRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tbb4Nk29; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tbb4Nk29"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39B501F000E9;
	Mon, 10 Aug 2026 10:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786357209;
	bh=oJiVV1bSytCy1oZ2X966uElv6FZ4kcLsEpg8h8Gtx74=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Tbb4Nk291iChp3JTymXCepf0FEhcUY4a6ffwlxJrGBRUG4Sb7KzC4PduaxDXl/uWd
	 270CSq7qM543BcJjCDacvCnYHUbqYT0gj+TqzRDLdCu3rpAGrlKTNIZV+EA4hqYeAa
	 z1xdjUVwLg+umSj3WvfxtI06I6a6wGut5D/xzL9CL6GI7+FlHdLwB6FjjqR6EpWrT6
	 6yQliZsUaZg54hCfg0SlcJDMD3qeJ2mphvm+uxFpua1uwDC1c8syPyB8PUCrxc/eAG
	 2gd1BP8U2q3FZ0bNPvu2lQj5oLifxRCuoMhGvUpiYjIOxdxP4DyXLM5xOCME40MOzN
	 wFggWgNbNPBKA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V3 5/6] dmaengine: zynqmp_dma: Add new compatible string
 for Versal Net
Reply-To: sashiko-reviews@lists.linux.dev
To: "Golla Nagendra" <nagendra.golla@amd.com>
Cc: Frank.Li@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260810100452.426320-6-nagendra.golla@amd.com>
References: <20260810100452.426320-1-nagendra.golla@amd.com>
 <20260810100452.426320-6-nagendra.golla@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 10:20:08 +0000
Message-Id: <20260810102009.39B501F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] The `has_reset` field is introduced but completely unused, missing=
 the required hardware reset logic.

Pre-existing issues:
- [High] `zynqmp_dma_chan_probe()` hardcodes the `platform_get_irq()` error=
 return to `-ENXIO`, breaking probe deferral.
- [High] `zynqmp_dma_reset()` silently drops active and pending DMA descrip=
tors without invoking their callbacks, causing deadlocks for client drivers.
- [High] `zynqmp_dma_device_terminate_all()` does not command the hardware =
to stop, leading to potential memory corruption.
--

--- Patch [5]: [PATCH V3 5/6] dmaengine: zynqmp_dma: Add new compatible str=
ing for Versal Net ---
commit 93c6838fba5eee0dddf024579d8474fed6b7dee5
Author: Golla Nagendra <nagendra.golla@amd.com>

dmaengine: zynqmp_dma: Add new compatible string for Versal Net

This patch introduces the amd,versal-net-dma-1.0 compatible string and its
SoC-specific match data. It also adds a has_reset field to zynqmp_dma_config
to indicate whether the compatible requires a per-channel reset during prob=
e.

> diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_=
dma.c
> index b03171e37e278..7561416b8e626 100644
> --- a/drivers/dma/xilinx/zynqmp_dma.c
> +++ b/drivers/dma/xilinx/zynqmp_dma.c
> @@ -259,13 +259,20 @@ struct zynqmp_dma_device {
>  };
> =20
>  struct zynqmp_dma_config {
> +	bool has_reset;
>  	u32 offset;
>  };
> =20
>  static const struct zynqmp_dma_config versal2_dma_config =3D {
> +	.has_reset =3D true,
>  	.offset =3D IRQ_REG_OFFSET,
>  };
> =20
> +/* offset =3D 0: Versal Net uses base IRQ register address */
> +static const struct zynqmp_dma_config versal_net_dma_config =3D {
> +	.has_reset =3D true,
> +};
> +

[Severity: High]
Does this configuration actually perform a hardware reset?

The patch introduces the has_reset flag and sets it to true for versal2 and
versal-net, but looking at zynqmp_dma_chan_probe(), the match data is
retrieved without ever checking this flag or invoking any reset functions:

drivers/dma/xilinx/zynqmp_dma.c:zynqmp_dma_chan_probe() {
    ...
	match_data =3D of_device_get_match_data(&pdev->dev);
	if (match_data)
		chan->irq_offset =3D match_data->offset;
    ...
}

Does the omission of the reset implementation leave the DMA hardware in an
uninitialized state during probe, potentially causing back-to-back usage
failures?

While reviewing this patch, I also noticed a few pre-existing issues in the
same file:

[Severity: High]
This isn't a bug introduced by this patch, but zynqmp_dma_chan_probe()
hardcodes the platform_get_irq() error return to -ENXIO, which discards
probe deferral errors like -EPROBE_DEFER:

drivers/dma/xilinx/zynqmp_dma.c:zynqmp_dma_chan_probe() {
    ...
	chan->irq =3D platform_get_irq(pdev, 0);
	if (chan->irq < 0)
		return -ENXIO;
    ...
}

Does this permanent probe failure prevent the DMA controller from working w=
hen
the interrupt controller is not yet ready during boot?

[Severity: High]
This is a pre-existing issue, but zynqmp_dma_reset() silently drops active =
and
pending DMA descriptors without invoking their callbacks:

drivers/dma/xilinx/zynqmp_dma.c:zynqmp_dma_reset() {
    ...
	spin_lock_irqsave(&chan->lock, irqflags);
	zynqmp_dma_complete_descriptor(chan);
	spin_unlock_irqrestore(&chan->lock, irqflags);
	zynqmp_dma_chan_desc_cleanup(chan);
	zynqmp_dma_free_descriptors(chan);
    ...
}

Because zynqmp_dma_complete_descriptor() only completes the first descripto=
r in
the active_list, the remaining active and pending descriptors are silently
recycled by zynqmp_dma_free_descriptors(). Could this strand waiting client
drivers and cause deadlocks when a hardware error occurs?

[Severity: High]
This is a pre-existing issue, but zynqmp_dma_device_terminate_all() does not
command the hardware to stop:

drivers/dma/xilinx/zynqmp_dma.c:zynqmp_dma_device_terminate_all() {
    ...
	writel(ZYNQMP_DMA_IDS_DEFAULT_MASK, chan->regs + ZYNQMP_DMA_IDS);
	zynqmp_dma_free_descriptors(chan);

	return 0;
}

The function merely masks interrupts and frees software descriptors, but ne=
ver
clears the ZYNQMP_DMA_ENABLE bit or issues a hardware stop command. If a cl=
ient
driver calls dmaengine_terminate_all() and frees the DMA buffers, could the=
 DMA
controller continue to read/write the in-flight physical memory in the
background and corrupt memory?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810100452.4263=
20-1-nagendra.golla@amd.com?part=3D5
