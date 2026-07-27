Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0553E2AD6
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 21:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785186444; cv=none; b=qI4Knol2uH53vPmEMvIaUTtIiPB5zhlUlJQwUcwUZ2L2IY7Z0Icpp6a9wo3XC8/ZkcEsh2yVU4hiU31iBmTD3MZuB3NEb/V7g+0LQXooTXpoChCIBaJS+7U+qliLuKZNH/1fZqfKAjrJ9ZxHWADyfXzDAmLCSJJ4FdnrRq+mH2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785186444; c=relaxed/simple;
	bh=IZKibR/6N47f5yt8d/LvQPFvgtZasRmifebYOyywMGc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tD7wroWkgHOTmSzSHSYqJPHSLH1rtPpsLGStpqJFT1gRt00rIjzk6fx26NUFckhYy31+u4k4Gbdxf1yDsMMTzEymYujgrDUkFXXaYmd7Q6jwovOf7bnDNHMGFKl4+0ddvo0XItP+lXtS1EEhWOzYkzc1qy+lEsbiCAVij4tZMcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZydAmpqD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZydAmpqD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 200551F000E9;
	Mon, 27 Jul 2026 21:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785186443;
	bh=yBLGFzN20MtyVIVdFJqH3mCkY9aPuTNakRnwSI214+k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZydAmpqDnBxO1PLoLZ+mrfvmwnCxPFNk3ycNcNK7XDrVUOcGaXI2ueoTWb5MfHCUA
	 r6pl3aXzrFR2+3Ytfph0tJajFmfavLLVk4iWbc0s7i6jWspNE2ZVnCmKcpkbFyy+GG
	 X8T7L8q15bqFFiveiAR+ycInYVmI98RxiJRyO76cXysvxdeJ5JBwIWmu1/xvU2PYkj
	 pnWUklX6xWALK11tIK1XLE4ybYa4i4FR62GT4m+usrl+mMsSMLpyQ4aJuZeN7AtBKl
	 Jm0fpXN2nwcGf9Jj1kLv3kWqqDonFQvQLrQohZ5GLg7qkNGKvSkdRPhqrn9XbIdfUV
	 V1yqLPTmWxN0w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 36/64] dmaengine: sprd-dma: kill vchan BH on teardown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <6b93116a29794e917499ab4f84caf7138ee810b0.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <6b93116a29794e917499ab4f84caf7138ee810b0.1785183549.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 21:07:22 +0000
Message-Id: <20260727210723.200551F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver prematurely removes channels from `sdev->dma_dev.channe=
ls` before calling `dma_async_device_unregister()`, causing the core DMA fr=
amework to silently skip unregistering them, which leaks per-CPU memory, ID=
As, and sysfs nodes, leading to a Use-After-Free.
- [High] IRQ is requested before the MMIO base is mapped and clocks are ena=
bled, leading to a guaranteed NULL pointer dereference or bus hang if an in=
terrupt is pending.
--

--- Patch [36]: [PATCH v2 36/64] dmaengine: sprd-dma: kill vchan BH on tear=
down ---
commit 90cb440f02a76b9f95f830c9b7cd74c3b47c9d5f
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: sprd-dma: kill vchan BH on teardown
   =20
Use dma_chan_kill_bh() for virt-dma cleanup.

> diff --git a/drivers/dma/sprd-dma.c b/drivers/dma/sprd-dma.c
> index 087fea3af2e41..42a0c1c34337b 100644
> --- a/drivers/dma/sprd-dma.c
> +++ b/drivers/dma/sprd-dma.c
> @@ -1253,7 +1253,7 @@ static void sprd_dma_remove(struct platform_device =
*pdev)
>  	list_for_each_entry_safe(c, cn, &sdev->dma_dev.channels,
>  				 vc.chan.device_node) {
>  		list_del(&c->vc.chan.device_node);

[Severity: High]
This isn't a bug introduced by this patch, but removing the channels from
sdev->dma_dev.channels here causes the core dma framework to skip
unregistering them when dma_async_device_unregister() is called later in
this function:

drivers/dma/dmaengine.c:dma_async_device_unregister() {
    ...
    list_for_each_entry_safe(chan, n, &device->channels, device_node)
        __dma_async_device_channel_unregister(device, chan);
    ...
}

By emptying the channel list early, the sysfs nodes for the channels are
never unregistered.

Since the driver data is devres-managed and freed after unbind, does this
leave orphaned sysfs nodes pointing to freed memory, leading to a
use-after-free if a user reads the sysfs files?

> -		tasklet_kill(&c->vc.task);
> +		dma_chan_kill_bh(&c->vc.chan);
>  	}
> =20
>  	of_dma_controller_free(pdev->dev.of_node);

[Severity: High]
This is another pre-existing issue, but there appears to be a null pointer
dereference risk during probe in this driver.

The interrupt is requested before the mmio base is mapped:

drivers/dma/sprd-dma.c:sprd_dma_probe() {
    ...
    ret =3D devm_request_irq(&pdev->dev, sdev->irq, dma_irq_handle,
                           0, "sprd_dma", (void *)sdev);
    ...
    sdev->glb_base =3D devm_platform_ioremap_resource(pdev, 0);
    ...
}

If an interrupt is already pending when devm_request_irq() unmasks it,
the interrupt handler will fire immediately and dereference the uninitializ=
ed
glb_base pointer:

drivers/dma/sprd-dma.c:dma_irq_handle() {
    ...
    u32 irq_status =3D readl(sdev->glb_base + SPRD_DMA_GLB_INT_MSK_STS);
    ...
}

Should the memory mapping and clock enablement be done before requesting
the interrupt to avoid this panic during boot or module load?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785183549.gi=
t.allen.lkml@gmail.com?part=3D36
