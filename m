Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813EC3C457A
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 21:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785187100; cv=none; b=s3oIomaE7bIvuP/IUJYrjPXlRB0xBFK9dKzElK787b6S1s3ojVPr2qcpCGkpGbPhdVDZb/kxJZFBo9xSkv9I3o1SIDz2d4lVKDiHJ3Q7suO2lTPNfTxtE3pfES9V0t/2NUb5YJiMdv/4a0gs0i6fce9ziMhMkTOKbDetabgUfys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785187100; c=relaxed/simple;
	bh=0LreWxq7dh/W89hY4+dtdlHcPXf+cNui79nHRub8arY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Rg5jfNdzULENDwkMO8lG1phPKP/5dWOtYAcgEGZsJ1yd1GtTnmrspefnj+DAd7sprEpdxUt3v44CldIZRvfrKOluw4ap7TsAxIgzGiVD8E/L5mJpE9a5eEjefpe46+ZqNIPI1fv+wko28K7fpDbE4IpqWnWlET8QKA4AUlnZuqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g4Rznu50; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g4Rznu50"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E54C01F000E9;
	Mon, 27 Jul 2026 21:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785187099;
	bh=UFlyY3Zao484n6vRpDz9lI2OfB45D/a0yCdsrZ6DdRw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g4Rznu50SeMpGQ5UFL+E6BF0FTRjT1wCtlWWghYNP+IvNTtCrrwu8BvP6/gOTM2PU
	 I5SD6A1fAr7BbECGiT/taowpsxJ44GbCLna/5p6yHkoVACi4EuA7QvlmyD0lpU8FSj
	 Fq1hNmV0li/4ZatAvq8k6HnnG8CwnAjJAlHzmWdSoOTBFaiWajyL/FTLfwYFR+EDsH
	 jMKgDAICLRkgqJaxC9lrtANZsXYVAqq3oWF9QpjvuMB3vqQK0Lzi790biiCAVF1o8H
	 SgmQikZvuaRHuJ22YIKr2NhEeLNJTK6vNePK4hcTaeVVjrp+PLbtzziKrfuAaR8tMF
	 SigTcpzF+3XlQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 55/64] dmaengine: dma-axi-dmac: use dma_chan_kill_bh
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <8b42f611df2e037246dbf58d21f3d3bfffe17de1.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <8b42f611df2e037246dbf58d21f3d3bfffe17de1.1785183549.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 21:18:18 +0000
Message-Id: <20260727211818.E54C01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Low] Several other DMA drivers fail to build because they still explicit=
ly reference the removed `task` member in `struct virt_dma_chan`.

Pre-existing issues:
- [High] axi_dmac_terminate_all() frees active descriptors without clearing=
 the vc->cyclic pointer, leading to a Use-After-Free in the completion bott=
om half.
- [High] The driver lacks a devm action or a remove callback to explicitly =
disable the DMA hardware upon device unbind, causing system hangs if the cl=
ock is disabled while a transfer is active.
--

--- Patch [55]: [PATCH v2 55/64] dmaengine: dma-axi-dmac: use dma_chan_kill=
_bh ---
commit d769925844316e4d839799af39da3b91a09472d0
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: dma-axi-dmac: use dma_chan_kill_bh
   =20
virt-dma now dispatches completion callbacks through per-channel BH
work instead of its tasklet. Cancel that work during teardown before
channel storage is released.

> diff --git a/drivers/dma/dma-axi-dmac.c b/drivers/dma/dma-axi-dmac.c
> index d47ff27e1408f..d26bfa852806f 100644
> --- a/drivers/dma/dma-axi-dmac.c
> +++ b/drivers/dma/dma-axi-dmac.c
> @@ -1195,9 +1195,11 @@ static int axi_dmac_detect_caps(struct axi_dmac *d=
mac, unsigned int version)
>  	return 0;
>  }
> =20
> -static void axi_dmac_tasklet_kill(void *task)
> +static void axi_dmac_kill_bh(void *data)
>  {
> -	tasklet_kill(task);
> +	struct dma_chan *chan =3D data;
> +
> +	dma_chan_kill_bh(chan);
>  }

[Severity: Low]
Does this patch series miss updates to other drivers?

Several other DMA drivers fail to build because they still explicitly
reference the removed task member in struct virt_dma_chan. For example:

drivers/dma/qcom/bam_dma.c:bam_dma_remove() {
    ...
    tasklet_kill(&bdev->channels[i].vc.task);
    ...
}

Should these drivers be updated to use dma_chan_kill_bh() as well?

[ ... ]

> @@ -1302,8 +1304,8 @@ static int axi_dmac_probe(struct platform_device *p=
dev)
>  	 * Put the action in here so it get's done before unregistering the DMA
>  	 * device.
>  	 */
> -	ret =3D devm_add_action_or_reset(&pdev->dev, axi_dmac_tasklet_kill,
> -				       &dmac->chan.vchan.task);
> +	ret =3D devm_add_action_or_reset(&pdev->dev, axi_dmac_kill_bh,
> +				       &dmac->chan.vchan.chan);

[Severity: High]
This is a pre-existing issue, but can the system hang if the driver is
unbound while a transfer is active?

The driver relies entirely on devres for teardown and lacks an explicit
remove callback or devm action to halt the DMA hardware.=20

In axi_dmac_probe(), the clock is enabled via devm_clk_get_enabled(). If the
driver is forcefully unbound via sysfs, devres unwinding will disable the
clock.=20

Disabling the clock while the AXI DMA controller is actively performing bus
transactions could stall the AXI bus.

Should an action be added here to gracefully halt the DMA engine prior to
the clock being disabled?

[Severity: High]
This isn't a bug introduced by this patch, but does
axi_dmac_terminate_all() safely handle cyclic descriptor termination?

When a cyclic transfer period completes, it sets vc->cyclic to the active
descriptor and schedules the bottom half.=20

If a client concurrently calls dmaengine_terminate_async(),
axi_dmac_terminate_all() frees the active descriptors without clearing the
vc->cyclic pointer:

drivers/dma/dma-axi-dmac.c:axi_dmac_terminate_all() {
    ...
    list_splice_tail_init(&chan->active_descs, &head);
    spin_unlock_irqrestore(&chan->vchan.lock, flags);

    vchan_dma_desc_free_list(&chan->vchan, &head);
    ...
}

When the scheduled BH runs, could it dereference the dangling vc->cyclic
pointer to fetch the callback, resulting in a use-after-free?

>  	if (ret)
>  		return ret;
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785183549.gi=
t.allen.lkml@gmail.com?part=3D55
