Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B78A3D5666
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 21:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785186549; cv=none; b=PyIb5I8BKoHALVp/nUK8RFBLxsMW424YxjxTGn9N8iFtt10vZlKvnZ1xwj/3drLP6bBPSZPb/aoCJ1SHI/UnDBkXKGpSRf+wcpmvtYVHI+Co2d+YEZ4ppKpAQTRTDISRSLFKdL1m0wd3tbE3/8/nhVneCz6B/FzpZ3KWq3cdiiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785186549; c=relaxed/simple;
	bh=KNsxrLPKgARIzmqLnDlev6eeb1A50vVIYPa+b3PFdV8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=X08/EZ+tC/T3TslMr0z96Wgj08OiHUxpUmnSE0tVOEtfQT/g8zwoT8PQZEpWwBKPlbYbZ9MV7twwuIM2F1i0bfe2Bmw9U2LBemrq2ErFN+I7iZ1WCXgnQ/5KYLekVCOTx0p9XiRr0DTd87AvDKM6AbCbQC0BgHl7bubVJ32dYNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mQHWEmUK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mQHWEmUK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10E381F000E9;
	Mon, 27 Jul 2026 21:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785186548;
	bh=JG2OXUoQcy7XVy3chazdgvzH9hx+6BOWJ7RHmlUoiJI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mQHWEmUKvIM9wKwORxRZkuph+2IgYZA08qKL4mRf4Ly7MQPA58PaMcQDtCOspn3T5
	 5zRp7b0Rz+EeCekEEWs08sn9OkpOMq7fAnGANQijzb8Ut+GhDmph/0DS2Kn6/WdpHB
	 WG56TRY0hSSykRI7BU/voHegJA0iC36YtP2IkR05OKQjFL4GGYjUrcfjw6cNetx9gk
	 wUVd44i2JlRfTkT20MPXevQM5ipgA671JYy5EDAEX+egmd2R6Xboyt2d9cvndZpLsD
	 FZxNPOksZJy0NzBxVLSygE0SZJKm0M9eJafygAvRsUOb/c50LGERTSWu553jU0ddy9
	 x5mosmLP1kOTA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 44/64] dmaengine: mtk-hsdma: kill vchan BH on
 teardown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <0bfe8c4b14ebc7446d0424bbe811c310e86bef51.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <0bfe8c4b14ebc7446d0424bbe811c310e86bef51.1785183549.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 21:09:07 +0000
Message-Id: <20260727210908.10E381F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Killing channel bottom-halves before disabling hardware interrupts=
 allows pending work to be maliciously re-queued and executed after channel=
 memory is freed.
- [High] Manual removal of virtual channels from the device list bypasses t=
he DMA core's cleanup, leaking per-CPU memory and sysfs resources.
--

--- Patch [44]: [PATCH v2 44/64] dmaengine: mtk-hsdma: kill vchan BH on tea=
rdown ---
commit 2d206408161f8be2e557e668a6b7dd498f1ec43d
Author: Allen Pais <allen.lkml@gmail.com>
Subject: dmaengine: mtk-hsdma: kill vchan BH on teardown

This commit replaces the tasklet cleanup with dma_chan_kill_bh() for virt-d=
ma
cleanup in the mtk-hsdma driver's teardown path.

> diff --git a/drivers/dma/mediatek/mtk-hsdma.c b/drivers/dma/mediatek/mtk-=
hsdma.c
> index a43412ff5eddc..1c98fcedf3acd 100644
> --- a/drivers/dma/mediatek/mtk-hsdma.c
> +++ b/drivers/dma/mediatek/mtk-hsdma.c
> @@ -1020,7 +1020,7 @@ static void mtk_hsdma_remove(struct platform_device=
 *pdev)
>  		vc =3D &hsdma->vc[i];
> =20
>  		list_del(&vc->vc.chan.device_node);

[Severity: High]
This is a pre-existing issue, but does removing the channel from the device
list here bypass the DMA core's cleanup?

The core function dma_async_device_unregister() relies on iterating over the
device->channels list to execute __dma_async_device_channel_unregister(),
which frees the per-CPU memory and unregisters the sysfs devices. Because t=
he
list is emptied preemptively before calling dma_async_device_unregister(),
the core cleanup loop might be bypassed, which could lead to leaking per-cpu
variables and orphaned sysfs nodes.

> -		tasklet_kill(&vc->vc.task);
> +		dma_chan_kill_bh(&vc->vc.chan);
>  	}
> =20
>  	/* Disable DMA interrupt */

[Severity: High]
This is also a pre-existing issue, but does killing the channel bottom-halv=
es
before disabling hardware interrupts allow pending work to be maliciously
re-queued?

mtk_hsdma_remove() terminates the asynchronous workers here, but the interr=
upt
is disabled and synchronized later in the function:

	/* Disable DMA interrupt */
	mtk_dma_write(hsdma, MTK_HSDMA_INT_ENABLE, 0);

	/* Waits for any pending IRQ handlers to complete */
	synchronize_irq(hsdma->irq);

If an interrupt triggers or is handled concurrently during this window, the
ISR (mtk_hsdma_irq) could complete descriptors and call
vchan_cookie_complete(), which re-schedules the channel's bottom-half onto
the workqueue. Since the driver continues unbinding and eventually frees the
channel structures, the re-scheduled work might execute later and access
freed memory.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785183549.gi=
t.allen.lkml@gmail.com?part=3D44
