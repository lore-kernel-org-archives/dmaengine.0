Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB59B3C3F7B
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 21:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785187036; cv=none; b=OGZ2gnXIPGa7NfQjpXaBnp2ZtNbBLyFiYIxym8ROJBq2suJViClIbo44NIV8kbsvPAA2x6Qyee+tQ4iA89Dt/mlYev5URrNOJob8S7ACfWhTDrFFyRYMIWTTZ0/LUv4s3IOmeCSv85I26w0rnhLeJhXf/ybnBygC2kWyUV68ekY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785187036; c=relaxed/simple;
	bh=3kZOKvptFWi7CjhkG9fRgoJ5N8aaFWvzB8OUaPMQZAA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=I2na3HdaV/gI8mxoZ6YuuKDmiKrB2NVtzJ79Xl2CFv2ONAWkNcexLKFWp5HSPJCXNK31KnoO/ur7HyM1LgCaFF+i7085Xh6AF/1mnJPNHfmOIMez76L8XfMyrVSl7UVcgM2VKmPGXtjg7WNdH99+IqtuzOlG7q9M1kum02lsjaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AOU106/b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AOU106/b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F9F91F000E9;
	Mon, 27 Jul 2026 21:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785187035;
	bh=MsWP/cWS6qUDDb0yB6PpvhVNQMYkqw+a1bsDz9Q3GUc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AOU106/bC0Hdu4A4o569nIMADilZ0V2SUwTwHE9rP3/pnaBTD5qcZtNsf/noSwds5
	 12ELgG+wT8GDxoLkAOfRn3pmekHkKK5JShmk+v+SMILrSIp1Nxdact/177RTVzShsJ
	 NSIrnWauNHM3E5VhYGYomGCxsowEedgqR+wEvvV1mkiIH2S7R2c4P9OGZBjnWlO98E
	 s8us7phYX1g74vmjy4YuykDg7RQsekh6Oq//+E2ibbxpb2WgrcGWXHnSHCF3017Own
	 O3E33+B08rSrFMBwXziZvFilsWpRKBuVa9EAkXfFjO2Tdh6Q0Ga6948AUc6A0N3ofG
	 3RkiEzCOlxyTQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 47/64] dmaengine: loongson1-apb: kill vchan BH on
 teardown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <22694524f7cc07a687d0f1ff7957af97fa51beb4.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <22694524f7cc07a687d0f1ff7957af97fa51beb4.1785183549.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 21:17:14 +0000
Message-Id: <20260727211715.5F9F91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] The patch series breaks bisectability and leaves the tree unbuilda=
ble by prematurely removing the `task` member from `struct virt_dma_chan` b=
efore updating all consuming drivers.

Pre-existing issues:
- [High] Premature removal of DMA channels from the dma_device channels lis=
t bypasses dmaengine core unregistration, causing massive resource leaks (s=
ysfs nodes, IDA entries, per-CPU memory) and leading to a Use-After-Free vu=
lnerability.
- [High] Flushing the bottom-half work without stopping the hardware and ma=
sking interrupts leaves a race window where an active IRQ can reschedule th=
e bottom-half on freed memory, leading to a Use-After-Free.
--

--- Patch [47]: [PATCH v2 47/64] dmaengine: loongson1-apb: kill vchan BH on=
 teardown ---
commit 3e0d38c61679a38b8f14c3f667abc7411f9f4c83
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: loongson1-apb: kill vchan BH on teardown
   =20
Use dma_chan_kill_bh() for virt-dma cleanup.

[Severity: High]
Does this patch series introduce a build regression that breaks
bisectability?

If the task member was removed from struct virt_dma_chan earlier in this
series, unmodified drivers that still rely on it, such as bcm2835-dma.c in
bcm2835_dma_free_chan_resources(), will fail to build.

Should all consuming drivers be updated to the new API before the task
member is removed from the core virt_dma_chan structure?

> --- a/drivers/dma/loongson/loongson1-apb-dma.c
> +++ b/drivers/dma/loongson/loongson1-apb-dma.c
> @@ -552,7 +552,7 @@ static void ls1x_dma_chan_remove(struct ls1x_dma *dma)
> =20
>  		if (chan->vc.chan.device =3D=3D &dma->ddev) {
>  			list_del(&chan->vc.chan.device_node);

[Severity: High]
This is a pre-existing issue, but does removing the channel from the
device_node list here bypass the dmaengine core unregistration?

When the devres-managed dma_async_device_unregister() later runs, the
channels list will be empty, causing it to silently skip unregistering the
channel devices. This leaks the channel device structures, their IDA
entries, and per-CPU memory.

Furthermore, because the channel device is never unregistered, the IRQ
handler registered via devm_request_irq() in ls1x_dma_alloc_chan_resources()
is never freed and remains active indefinitely. Since the platform device's
devres will eventually free the channel memory, can an active IRQ trigger a
use-after-free on that freed memory?

> -			tasklet_kill(&chan->vc.task);
> +			dma_chan_kill_bh(&chan->vc.chan);

[Severity: High]
This isn't a bug introduced by this patch, but is there a race condition he=
re
since the hardware isn't stopped first?

In ls1x_dma_remove(), the hardware DMA controller is not stopped and its
interrupts are not masked before teardown. Because the IRQ is still active,
a hardware interrupt can fire immediately after dma_chan_kill_bh() returns.

If the interrupt handler calls vchan_cookie_complete(), which then calls
dma_chan_schedule_bh(), it will requeue the work. When the ls1x_dma
structure containing the work item is later freed by devres, could the
workqueue process freed memory and cause a use-after-free or corrupt the
workqueue linked list?

>  		}
>  	}
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785183549.gi=
t.allen.lkml@gmail.com?part=3D47
