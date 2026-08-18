Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11EF46EC8E
	for <dmaengine@vger.kernel.org>; Tue, 18 Aug 2026 12:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787057472; cv=none; b=TN7/KsOcP8BrRwyJ+UUUSVYbe32MYBEbEs/iIfcJahYYEysDHwCcVxb6k8AUrk7nTVQ00zo/fORuNyIiC1HoiG05POVeacMs3KTJH+EZquNssZ/fqXGkOWO9/dSLxiW2moQHx3LmBlcSlU5aWFcV2GVdKDlcPo0V6z8Ohs9nnPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787057472; c=relaxed/simple;
	bh=LNQQoE/FhZu5JrJeITRdDYQQsKHlmoBjRYImoAZ8CZU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=F0LNJzei2M/8LYgi/A/v3eebDoImODp8lNUlDzBWNz65O/TlKCjTjl3UvGKbVyNu/Uw6vZioiMuHhsuOQzXnfzw9/8+kfusastbhQCSxKvufUdkYuP2DGx89TB6UJ3Nbzhww31Ii6PmHO7ur/6vGFT3fZSG+SSSO/IF8AtlbbN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OlKpEmuB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OlKpEmuB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1398E1F00A3A;
	Tue, 18 Aug 2026 12:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787057464;
	bh=29ZvMkahCvoCUTA+zrHNZsmbFrEzIKRoAnYaFJmraec=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OlKpEmuB9RbxOe/DUT1H1q+tv+tujBISDu0PnSWuZYJ9fuuGrqWaZJ5ZWfZzMo2PR
	 zw9RKY0tzDsmL/lmDgg78MXo9Trp/Q1eUYR5bD9/fV3yT6gq7NOeDmz7n34K20Thur
	 KuStKMCQpX3LbLn6WFs5NPp/hhBFcEAdB9RiGVDRBbbZzUKPaSLhx0GKGlg5GRjmad
	 0Dc7SmwD04fcJMVUCRow1Ny2N+x7FuwU70t9P2aWRWhNPrbEgZ3fgarwaWIhxJRrZZ
	 EgU/Log5+lqHLDW5Jfz8STLMfbA5EwCERLNTh7f1HQNbuS0NvQZryN3ADdh/gW+Ctm
	 rXRKw7f3ckzNQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: sprd-dma: handle runtime PM get failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiawen Liu" <1298662399@qq.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <tencent_72CAD47A90A208C873DD65A726C0A15FC107@qq.com>
References: <tencent_72CAD47A90A208C873DD65A726C0A15FC107@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 12:51:03 +0000
Message-Id: <20260818125104.1398E1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] IRQ handler is registered before IO memory is mapped and virtual c=
hannels are initialized.
--

--- Patch [1]: [PATCH] dmaengine: sprd-dma: handle runtime PM get failure -=
--
commit 7b4114d448d81c577f92d85ac8c943dc9f9107c9
Author: jiawen <1298662399@qq.com>

dmaengine: sprd-dma: handle runtime PM get failure

Route failed runtime-PM acquisition through its existing cleanup path.

Release and disable runtime PM before continuing with the hardware
teardown, so an unsuccessful pm_runtime_get_sync() does not leave
runtime PM enabled.

> diff --git a/drivers/dma/sprd-dma.c b/drivers/dma/sprd-dma.c
> index 087fea3af2e41..19b32a23c882d 100644
> --- a/drivers/dma/sprd-dma.c
> +++ b/drivers/dma/sprd-dma.c
> @@ -1212,7 +1212,7 @@ static int sprd_dma_probe(struct platform_device *p=
dev)
> =20
>  	ret =3D pm_runtime_get_sync(&pdev->dev);

[Severity: High]
This isn't a bug introduced by this patch, but I noticed a pre-existing
issue earlier in sprd_dma_probe() where the IRQ handler is registered
before sdev->glb_base is mapped:

    ret =3D devm_request_irq(&pdev->dev, sdev->irq, dma_irq_handle,
                   0, "sprd_dma", (void *)sdev);
    ...
    sdev->glb_base =3D devm_platform_ioremap_resource(pdev, 0);

If an interrupt is pending from a previous kernel (e.g. kexec) or a
bootloader, the unmasked interrupt could cause dma_irq_handle() to
execute immediately.

Because the handler attempts to read from glb_base:

    u32 irq_status =3D readl(sdev->glb_base + SPRD_DMA_GLB_INT_MSK_STS);

could this cause a NULL pointer dereference and subsequent kernel panic
if the hardware asserts an interrupt before initialization completes?

>  	if (ret < 0)
> -		goto err_rpm;
> +		goto err_register;
> =20
>  	ret =3D dma_async_device_register(&sdev->dma_dev);
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/tencent_72CAD47A90A=
208C873DD65A726C0A15FC107@qq.com?part=3D1
