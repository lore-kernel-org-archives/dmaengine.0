Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D92B4F5E0
	for <dmaengine@vger.kernel.org>; Fri, 11 Sep 2026 17:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789148412; cv=none; b=rR0q8HUgXdCER3619KolHvl7qkJ+Q13OZAg9U4DIOE6PWBlRJJ4J0GAuawT3StSuCYE+G5U4EMV8YhutEuWin+nYWnUCjuQkODaUN+82eoEYD26y8g1lZGGZB/6SqzFIy5MYLP/QkOMmv23X1yrr/iqHMD99dIOkAUe2EMqTZ7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789148412; c=relaxed/simple;
	bh=M9/SqIucHAmGxzvTomJ7xqcLC7tIgoD25q225s637SY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KaUax14eg4l1mQj3ovKtkYo5inFWrkTTeAo+nQ9fNdYFmpF/xzr2jA3r9rJQfovkS+SUppPA6t4iU4zXG6f9/KNR83TN8Gmj7MYY/cXNZNxuU6iDvqOLJ3y96ugoM7egjLnBLEEybhc6Yj08hyhs353Y0hKonI8KrV2VstlwYAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DLAeT1Mu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DLAeT1Mu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 919C31F000FF;
	Fri, 11 Sep 2026 17:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789148400;
	bh=XwHK2zdr5/d4+bjlFH2dT86OIR0awhczBnfaxis+DCU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DLAeT1Mu/xbhEaehP3IdBTno/k4jxHDwahGnIktJXJgJ7utQ6yG8xb5PwyexcWuR2
	 O6EaS2/gttwAE7wYL6Tk9mNzBg1zcHiQjVshpe/KFHuPNJTNjTYQmyee3Rr0SWXuoY
	 tmu/Ar8Td2unJ3x+sWa9LXpINhorIdSxL5isU5FJcvvFKeU/GABcfK5F8UC2ZFaH3p
	 C1vPBUoV5VR543baIfFCYFYqWN3A7AqYIUUsbus6FTmStCtcpTEhoLCXMtiefajyvN
	 39ZbAiOhmEcmhbAOImS0rgr8drxeojwKAhAneaeq7jVuMaCbPonX4FJANJkGJiq/tb
	 /QppaERJqURuA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 05/10] dmaengine: qcom: gpi: Use bus width capability
 helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TnVubyBTw6E=?= <nuno.sa@analog.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260911-dmaengine-support-wider-dma-masks-v4-5-72b8fd4cc78e@analog.com>
References: <20260911-dmaengine-support-wider-dma-masks-v4-0-72b8fd4cc78e@analog.com>
 <20260911-dmaengine-support-wider-dma-masks-v4-5-72b8fd4cc78e@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 17:40:00 +0000
Message-Id: <20260911174000.919C31F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing cleanup for DMA controller and async device registration i=
n error paths and missing .remove method lead to UAF.
--

commit bbcb7726e80023f035efafba93cea9b1b9a4a1c3
Author: Nuno S=C3=A1 <nuno.sa@analog.com>

dmaengine: qcom: gpi: Use bus width capability helpers

This commit uses the new dma_bus_width_set helper to advertise supported
bus widths, replacing legacy assignments.

> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> index a5055a6273af6..3a35bf4c33978 100644
> --- a/drivers/dma/qcom/gpi.c
> +++ b/drivers/dma/qcom/gpi.c

[ ... ]

> @@ -2265,8 +2266,15 @@ static int gpi_probe(struct platform_device *pdev)
>  	/* configure dmaengine apis */
>  	gpi_dev->dma_device.directions =3D BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO=
_DEV);
>  	gpi_dev->dma_device.residue_granularity =3D DMA_RESIDUE_GRANULARITY_DES=
CRIPTOR;
> -	gpi_dev->dma_device.src_addr_widths =3D DMA_SLAVE_BUSWIDTH_8_BYTES;
> -	gpi_dev->dma_device.dst_addr_widths =3D DMA_SLAVE_BUSWIDTH_8_BYTES;
> +	ret =3D dma_bus_width_set(gpi_dev->dma_device.src_bus_widths,
> +				DMA_SLAVE_BUSWIDTH_8_BYTES);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D dma_bus_width_set(gpi_dev->dma_device.dst_bus_widths,
> +				DMA_SLAVE_BUSWIDTH_8_BYTES);
> +	if (ret)
> +		return ret;

[Severity: High]
This is a pre-existing issue, but while looking at the changes in
gpi_probe, I noticed a potential memory corruption issue on the error
path and during driver unbind.

If of_dma_controller_register fails later in gpi_probe, it returns an
error without unregistering the previously registered async DMA device:

gpi_probe() {
    ...
    ret =3D dma_async_device_register(&gpi_dev->dma_device);
    if (ret) {
        dev_err(gpi_dev->dev, "async_device_register failed ret:%d", ret);
        return ret;
    }

    ret =3D of_dma_controller_register(gpi_dev->dev->of_node,
                                     gpi_of_dma_xlate, gpi_dev);
    if (ret) {
        dev_err(gpi_dev->dev, "of_dma_controller_reg failed ret:%d", ret);
        return ret;
    }
    ...
}

Additionally, the platform driver gpi_driver completely lacks a remove
callback. If the driver is manually unbound via sysfs, devres will free
the driver's memory while leaving the DMA device and OF controller globally
registered.

Could this lead to a use-after-free if the dangling dma_device pointer is
accessed by other subsystems? Should the error path and driver teardown
clean up these registrations?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-dmaengine-=
support-wider-dma-masks-v4-0-72b8fd4cc78e@analog.com?part=3D5
