Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C08327E1A1
	for <dmaengine@vger.kernel.org>; Tue,  2 Jun 2026 07:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780384335; cv=none; b=lDvN/casxxm8mf0xcIojshoMFkxM9HR7RnfYEvOybmumha3EwCZG90OjsyTclSd+o72wL69VVckDjb82/53b+RbvrZeAde5QQ91X2qJ1Ae0Ctj5hPO9+lIMmCvlpbq2aOY2tIObGg98dRk620vlDVgIRQg+lSOJTkeTfHvuPm1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780384335; c=relaxed/simple;
	bh=eLKZNi3zvcpOT35FkEshq7gFNGR+EaJMfUlGKsND2GI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=K0AjEg8fM8cyGJXH+E8inHYyrtIISnsiitlUCtkgkbp9HS9AsCAKJsw9HEpr+QNuY9vBVVOGCFCjANlz3i47X6cEGbacHniZS3KAAJSdzcE7roIH5gtnvvGVbydqJn4pgrunFajvAL46Q+I7XIKo+54CCSYEPRsvlJHSbHClMYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oOiGOt97; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oOiGOt97"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C74BF1F00893;
	Tue,  2 Jun 2026 07:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780384334;
	bh=L4XtUpg8ProSkJ0879ryTb8JX8liBk7+JM+DLAOrgVo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oOiGOt97PpW5ZEQckCbK+FrLnkmi00lRMKSbEVGwFtWpAHobxdUy28PUB2RCm+tSN
	 cA7C2h8q1jYbLjGgzcyiaOR5FJMGF0wVCrGZPq4f0EhafapWFljeF8BEvLSJWlJAXZ
	 UxAZiZgR7M1U1MH7avajGE+Trc9DpIe9uxdm0DJPb/PuriYEnzgEjm6GEZ+vdPmz+v
	 DlH/qWC2sLj6Trhyso2cBMJFYQ6p0ckOEhh8kbje0LCm5zumhzt5tt8rl63AK/ILPr
	 dI61fVV3rl1jt2kteunuSUMbtYMZTw0951rUFvf0vI6NP1VO+jJLyP7sjZRpkUG45o
	 um0TBbbUINYlw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: qcom: gpi: set DMA_PRIVATE capability
Reply-To: sashiko-reviews@lists.linux.dev
To: "Icenowy Zheng" <zhengxingda@iscas.ac.cn>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260602070344.3707256-1-zhengxingda@iscas.ac.cn>
References: <20260602070344.3707256-1-zhengxingda@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 07:12:13 +0000
Message-Id: <20260602071213.C74BF1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing `dma_async_device_unregister()` in the `gpi_probe()` error=
 path leads to a use-after-free.
- [High] Missing `.remove` callback in the platform driver leads to use-aft=
er-free on device unbind.
- [High] Dangling pointer in `gchan->config` causes UAF on channel realloca=
tion.
- [High] Incorrect channel references in `gpi_ch_init` error path teardown.
- [Medium] Memory leak of transfer ring (`ch_ring`) on initialization error.
--

commit feffda385397d82950af98c34adbb7888fd69b46
Author: Icenowy Zheng <zhengxingda@iscas.ac.cn>

dmaengine: qcom: gpi: set DMA_PRIVATE capability

This commit sets the DMA_PRIVATE capability for the GPI DMA controller.
It restricts the controller from being used as a general-purpose DMA
accelerator since it is only responsible for QUP peripherals.

> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> index c9a6f610ffd9f..a5055a6273af6 100644
> --- a/drivers/dma/qcom/gpi.c
> +++ b/drivers/dma/qcom/gpi.c
> @@ -2260,6 +2260,7 @@ static int gpi_probe(struct platform_device *pdev)
>  	/* clear and Set capabilities */
>  	dma_cap_zero(gpi_dev->dma_device.cap_mask);
>  	dma_cap_set(DMA_SLAVE, gpi_dev->dma_device.cap_mask);
> +	dma_cap_set(DMA_PRIVATE, gpi_dev->dma_device.cap_mask);
> =20
>  	/* configure dmaengine apis */
>  	gpi_dev->dma_device.directions =3D BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO=
_DEV);

[Severity: High]
This is a pre-existing issue, but does the error path in gpi_probe() leave
the DMA device registered if of_dma_controller_register() fails?

If of_dma_controller_register() returns an error:

drivers/dma/qcom/gpi.c:gpi_probe() {
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

Since gpi_dev is managed by devm_kzalloc, devres will automatically free
it upon probe failure. Will the DMA subsystem retain the unregistered
device in its global lists, causing a use-after-free when the list is
subsequently traversed?

[Severity: High]
This is a pre-existing issue, but does the lack of a remove callback in
gpi_driver expose a use-after-free vulnerability during device unbind?

drivers/dma/qcom/gpi.c:gpi_driver {
    static struct platform_driver gpi_driver =3D {
        .probe =3D gpi_probe,
        .driver =3D {
            .name =3D KBUILD_MODNAME,
            .of_match_table =3D gpi_of_match,
        },
    };
}

If a user unbinds the device via sysfs, devres will free the associated
memory including gpi_dev and the embedded dma_device. Because there is no
remove callback to call dma_async_device_unregister(), will the DMA
subsystem's global lists retain pointers to the freed dma_device?

[Severity: Medium]
This is a pre-existing issue, but can this error path leak the transfer
ring memory?

drivers/dma/qcom/gpi.c:gpi_alloc_chan_resources() {
    ...
    ret =3D gpi_alloc_ring(&gchan->ch_ring, CHAN_TRES,
                 sizeof(struct gpi_tre), gpii);
    if (ret)
        goto xfer_alloc_err;

    ret =3D gpi_ch_init(gchan);

    mutex_unlock(&gpii->ctrl_lock);

    return ret;
}

If gpi_ch_init() fails, the function returns the error directly without
freeing ch_ring. Since the allocation failed, the DMA core will not invoke
gpi_free_chan_resources() to clean up the channel. Does this mean the DMA
memory allocated for the ring is permanently leaked?

[Severity: High]
This is a pre-existing issue, but does freeing gchan->config without
setting it to NULL cause a use-after-free on channel reallocation?

drivers/dma/qcom/gpi.c:gpi_free_chan_resources() {
    ...
    kfree(gchan->config);
    ...
}

If the channel is requested again and the consumer calls
dmaengine_slave_config():

drivers/dma/qcom/gpi.c:gpi_peripheral_config() {
    ...
    new_config =3D krealloc(gchan->config, config->peripheral_size, GFP_NOW=
AIT);
    ...
}

Since gchan->config persists across allocations, could krealloc() be called
with a dangling pointer from a previous channel lifetime?

[Severity: High]
This is a pre-existing issue, but does the error teardown in gpi_ch_init()
use the wrong channel reference?

drivers/dma/qcom/gpi.c:gpi_ch_init() {
    ...
error_start_chan:
    for (i =3D i - 1; i >=3D 0; i--) {
        gpi_stop_chan(&gpii->gchan[i]);
        gpi_send_cmd(gpii, gchan, GPI_CH_CMD_RESET);
    }
    i =3D 2;
error_alloc_chan:
    for (i =3D i - 1; i >=3D 0; i--)
        gpi_reset_chan(gchan, GPI_CH_CMD_DE_ALLOC);
    ...
}

Instead of passing the iterated channel &gpii->gchan[i], the teardown code
passes the top-level function argument gchan to gpi_send_cmd() and
gpi_reset_chan(). Could this repeatedly issue reset commands to the exact
same channel while failing to uninitialize the other allocated channels?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602070344.3707=
256-1-zhengxingda@iscas.ac.cn?part=3D1
