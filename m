Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6034E37B00E
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 21:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785187430; cv=none; b=DVV9FxS/hYygTPbCDiaAMEafS3K34dkutcGw50Mbsmy8B7rJULSu7/B/VxMgpXt3cCKurl0qgP6cy6kS6OYshebdpD7Tvmhq0O8Mdm7wOlwjoJ4thRlgQ1OYn/xotY4JAmcPGWpCcAM9Q4hwKugd3JoYOpOdFb527vcPXYyuMh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785187430; c=relaxed/simple;
	bh=0bOMn+ClBE1dDdK9g2YIJMxxc1cCb1gW6aW4p98Zc9g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AXenPby49mupUVtzZu3r2jgE3bX98Vsn/n0dUH3uX0zRxFMjcfPkt90YtJGVVNosiyHkfcO5GQ7i86NLuOFNn0GndgqXHu9aNLJk4D7IKUwsjdG9frGUgEEgQBbhCflQeAVQ4DsmhZIw4OY8EXQFNj2btqthCFT2JfmstDMeJrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kh8+9LZ6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kh8+9LZ6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0309D1F000E9;
	Mon, 27 Jul 2026 21:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785187429;
	bh=xeLXv9kY9FY3N8C81CVVrjyfEyuU7gWA4fLszMZJosA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Kh8+9LZ6cQWPHZhFBLMFiD7P40TijV5/R7nQkJqo2xl7YJVWKytiGFXdyvuDNEY5g
	 Q1T9+h7cUmxpXDlr9QXy50FzlpsSXJUNlp+MQB7mRsRrBtHtiaj8u3XERhScjxpgSq
	 Rc2y8YQe+nc2Om6FEAUWDbH+K/U9E7MEO3kg6dMx449exFFr6LYrPM25smFUaLdsK5
	 fitdfFOqIFwt6I8fBZzwkpR2fJufssrjwdOG+8EF6QnyRy6rmfK5TviSeQhp8PYW0/
	 kjeENOab9GcgHUngKHF8o8R/ux9Uu3N9NxsHrGgxLZXqRLUX+rEJqPdpnR8Tdg9dJ0
	 3CF4/uJK4EGxg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 59/64] dmaengine: tegra186-gpc: use dma_chan_kill_bh
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: dmaengine@vger.kernel.org, Frank.Li@kernel.org, vkoul@kernel.org
In-Reply-To: <b37cd91a6f4418b9a352cf9893ca238de9af88bf.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <b37cd91a6f4418b9a352cf9893ca238de9af88bf.1785183549.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 21:23:48 +0000
Message-Id: <20260727212349.0309D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Zero-length DMA requests cause an integer underflow when calcu=
lating the hardware word count, resulting in an unbounded 4GB DMA transfer.
- [High] TOCTOU race condition in the interrupt handler `tegra_dma_isr` lea=
ding to a Use-After-Free of `dma_desc`.
- [High] Incorrect teardown order in `tegra_dma_free_chan_resources()` allo=
ws late interrupts to reschedule the channel bottom-half, leading to a Use-=
After-Free.
- [High] Ignored error return from `tegra_dma_terminate_all()` leads to des=
criptor memory leak and active hardware DMA during channel teardown.
- [High] An unsupported DMA slave bus width causes `get_transfer_param()` t=
o silently propagate an error code (-EINVAL) into the DMA hardware's MMIO s=
equence register.
--

--- Patch [59]: [PATCH v2 59/64] dmaengine: tegra186-gpc: use dma_chan_kill=
_bh ---
commit a9e2657d46f0ef7a89cb50bf6bca1e73ae39ee11
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: tegra186-gpc: use dma_chan_kill_bh
   =20
virt-dma now dispatches completion callbacks through per-channel BH
work instead of its tasklet. Cancel that work during teardown before
channel storage is released.

> diff --git a/drivers/dma/tegra186-gpc-dma.c b/drivers/dma/tegra186-gpc-dm=
a.c
> index 64cedef1050ae..1ba8897ec614e 100644
> --- a/drivers/dma/tegra186-gpc-dma.c
> +++ b/drivers/dma/tegra186-gpc-dma.c
> @@ -1284,7 +1284,7 @@ static void tegra_dma_free_chan_resources(struct dm=
a_chan *dc)
>  	tegra_dma_terminate_all(dc);

[Severity: High]
This isn't a bug introduced by this patch, but should we check the return
value of tegra_dma_terminate_all() here?

If tegra_dma_terminate_all() fails due to a hardware timeout, it returns ea=
rly
without moving the active descriptor to the terminated list and without
disabling the hardware.

Since the caller ignores the return value, vchan_free_chan_resources() might
fail to locate and free the active descriptor. Could this leave the hardware
executing a transfer into client memory that may be subsequently freed?

>  	synchronize_irq(tdc->irq);
> =20
> -	tasklet_kill(&tdc->vc.task);
> +	dma_chan_kill_bh(&tdc->vc.chan);

[Severity: High]
This is a pre-existing issue, but does killing the bottom-half before freei=
ng
the IRQ expose a race window?

If the DMA hardware remains active after a timeout, and dma_chan_kill_bh() =
is
called before free_irq(), could a late interrupt fire and invoke
vchan_cookie_complete() or vchan_cyclic_callback()?

This would re-queue the bottom-half work. After vchan_free_chan_resources()
subsequently frees all descriptors, the queued bottom-half might execute and
dereference the freed memory.

>  	tdc->config_init =3D false;
>  	tdc->slave_id =3D -1;
>  	tdc->sid_dir =3D DMA_TRANS_NONE;


While reviewing the file, I noticed a few other pre-existing issues:

[Severity: High]
This isn't a bug introduced by this patch, but does tegra_dma_isr() have a
race condition leading to a use-after-free of dma_desc?

drivers/dma/tegra186-gpc-dma.c:tegra_dma_isr() {
    ...
    struct tegra_dma_desc *dma_desc =3D tdc->dma_desc;
    ...
    spin_lock_irqsave(&tdc->vc.lock, flags);
    ...
    if (!dma_desc)
        goto irq_done;
    ...
}

The shared descriptor pointer is cached into a local variable before acquir=
ing
the spinlock.

If the ISR is delayed while another CPU calls tegra_dma_terminate_all(), the
descriptor is freed. Could a subsequent DMA transfer quickly trigger another
interrupt, causing the delayed ISR to acquire the lock, pass the check, and
dereference the stale local pointer?


[Severity: High]
This is a pre-existing issue, but do zero-length DMA requests cause an
integer underflow when calculating the hardware word count?

In tegra_dma_prep_dma_memset():

drivers/dma/tegra186-gpc-dma.c:tegra_dma_prep_dma_memset() {
    ...
    sg_req[0].wcount =3D ((len - 4) >> 2);
    ...
}

The same calculation exists in tegra_dma_prep_dma_memcpy() and
tegra_dma_prep_slave_sg().

If a client requests a 0-length DMA transfer, the length checks appear to p=
ass.
The computation then underflows to 0x3FFFFFFF. Because the hardware
interprets this as N+1 words, could this trigger an unbounded 4GB DMA
transfer?


[Severity: High]
This isn't a bug introduced by this patch, but does get_transfer_param()
silently propagate an error code to the MMIO sequence register?

drivers/dma/tegra186-gpc-dma.c:get_transfer_param() {
    ...
    *mmio_seq =3D get_bus_width(tdc, tdc->dma_sconfig.dst_addr_width);
    *burst_size =3D tdc->dma_sconfig.dst_maxburst;
    *slave_bw =3D tdc->dma_sconfig.dst_addr_width;
    *csr =3D TEGRA_GPCDMA_CSR_DMA_MEM2IO_FC;
    return 0;
}

If a client configures an unsupported dst_addr_width, get_bus_width() retur=
ns
-EINVAL. This negative error code is assigned directly to *mmio_seq, and the
function still returns 0 for success.

Could this signed error be bitwise-ORed with other flags and written direct=
ly
to the hardware register, corrupting the configuration bitfields?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785183549.gi=
t.allen.lkml@gmail.com?part=3D59
