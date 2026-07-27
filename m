Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8A53E5ED1
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 21:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785186708; cv=none; b=mEnbW6F1sb8RbCrLdPOzyDux+FNbBz6rJnnbXs1Bc7uyQQnIK8ntXJ+/X4wQdB4+ZtAa0JojTgMDVA2cye4w57pDRd9DdYeljejHoZsmOl5VHE+UvQvUGVq31clO49rnyD1AupV4eHStm/8TGU8e8bdvroIwLh6D+j135mtltnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785186708; c=relaxed/simple;
	bh=8RuJlE9J1poQ1eZpjyPT32FmIGM/85sGjZRyO7hgd+o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ecC52sLT+r+azi3uyqpvhxeMaFtaCk+/U5lki4nzbd7gJ2a7fjI38OIsC+4gXb4+9XbxbTSGHnWmllVh45L5JsE7lseKE6rnlicfdcN//RLjeuLHV6+VXqMAMDvNBzgqOk/tN4DvO3CDZh/PoIIrGXIk5AhL620iKE4Hd44yeg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kbXoHmBO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kbXoHmBO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D154F1F00A3A;
	Mon, 27 Jul 2026 21:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785186707;
	bh=QyUw30yYveF4SeiK2SJmDmSLfZ0iXdoUcRGN8q4SK/0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kbXoHmBOEZAFIwre78mDLBlbhVz4WdVxb9Qc6TVoGbI6zTf7nhf93I/Es5EEAbenW
	 Xd8T/8612zTNlB15cGJzIZWC1O7DXOFqpqWwt/XbLPOcCA71WLte7+J58BwCz6L+M+
	 xWBWXy8+tZU3kilzd2JSmm2pcy/Isdobg0uiUO5qghaoo48Txi8uIzVAgCaaJ9wSTb
	 +rB1bPMoCD/gCRfC/IYgHhOkmK+erf7eABIXMYzNDr50EzoKxUVPa0q5Jmmf5y5lrU
	 XpJ9SxTyZQyIE4klmlNc9pIw2uNYvoUJnvPEgxQBaMcyh7jb+6ieiJ3JK9/cH566JK
	 mix+kwabRCqHw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 40/64] dmaengine: dw-axi-dmac: kill vchan BH on
 teardown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <fccc3e3233ac3232c17b41a6a67dd51c1bde18e2.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <fccc3e3233ac3232c17b41a6a67dd51c1bde18e2.1785183549.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 21:11:46 +0000
Message-Id: <20260727211146.D154F1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Manual deletion of DMA channels from the device list in dw_remove(=
) sabotages the DMA engine core's unregistration process, leading to memory=
, IDA, and sysfs leaks.
- [High] Flushing the completion bottom half (dma_chan_kill_bh) after disab=
ling hardware clocks can cause a system hang if a client callback issues a =
new transfer.
--

--- Patch [40]: [PATCH v2 40/64] dmaengine: dw-axi-dmac: kill vchan BH on t=
eardown ---
commit d93e02ecaf0e9550e4241cd3c6ed8d45227cb4a9
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: dw-axi-dmac: kill vchan BH on teardown

This commit updates virt-dma cleanup during teardown to use
dma_chan_kill_bh() instead of tasklet_kill().

> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma=
/dw-axi-dmac/dw-axi-dmac-platform.c
> index bcefaff03b5c6..5a5d569b188d3 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> @@ -1663,7 +1663,7 @@ static void dw_remove(struct platform_device *pdev)
>  	list_for_each_entry_safe(chan, _chan, &dw->dma.channels,
>  				 vc.chan.device_node) {
>  		list_del(&chan->vc.chan.device_node);

[Severity: High]
This isn't a bug introduced by this patch, but does calling list_del()
on the channel here sabotage the DMA engine core's unregistration process?

The DMA core's dma_async_device_unregister() uses the device->channels list
to tear down each channel. By manually removing the channels from this list
in dw_remove(), the core teardown logic sees an empty list and skips channel
unregistration.

Does this leak the channel's IDA, its sysfs device node (dmaXchanY), and
its dynamically allocated per-CPU memory (chan->local)?

> -		tasklet_kill(&chan->vc.task);
> +		dma_chan_kill_bh(&chan->vc.chan);

[Severity: High]
This is a pre-existing issue, but does flushing the bottom half here risk
a system hang?

Earlier in dw_remove(), the hardware clocks are disabled via
axi_dma_suspend(). If a client callback (invoked by the bottom half flush)
submits a new DMA transfer, the driver will attempt to read or write DMA
controller registers to start the transfer.

Can accessing these registers without clocks enabled cause a synchronous
external abort?

>  	}
>  }
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785183549.gi=
t.allen.lkml@gmail.com?part=3D40
