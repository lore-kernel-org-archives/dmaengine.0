Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7BA3C5826;
	Thu, 18 Jun 2026 07:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781767577; cv=none; b=leq0iiVrjkacdy6ghPqBnMHxM7nj4FnAgwaWwYHQ0B04RirZeNaHjV4yvTDtIs04mmATqVwbYyFit8c+3XhBXVPvTVRFRe4OD0QxSj0QfuPS+Bx1YfxJ17wFvJUgSqMNBiPDe+HDydI67ULxknOLjk4ouJ40GcV+IIv5rLY5o8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781767577; c=relaxed/simple;
	bh=H/JLuSmB+H0EWOQQoDRYCrFv1tVBWOsaRQOh77qHVTY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aObXCp1/hoMl9h4y6ARoS0/xi88OEeclNGfxvncXEBqUkBH5KF0v2mFdUtEM7lDgCkTExIvjaWwCh2oQ2LZeLftKY4zfhk+/J8zIsq7BXOh6xLBCS7UNTo1mmX+DNbshHJcPZweWXmO3U8hq8Zoh9bfyB+nRT/+fIrBXzP3c530=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gnXEuFfb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gnXEuFfb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D3401F000E9;
	Thu, 18 Jun 2026 07:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781767575;
	bh=lKfakM9o3ofUGN9mWR7hUHTUaV6oPgZU68pHQaYNWlI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gnXEuFfb1u30FMwbiTFkQXGAOh/uWAu6LsRAolskBwENkM/esqq00ZZpW77bF/9v2
	 gLs/2aYC37heJxcmFJcmVftKwEI6KSpFHOdhktc/V47MTeRppJBoYh/pUFwU+A9f3i
	 wTv4KjDdVmjpbAXiPui59c5zDJa7vNoDPEgHSbqlW+s+yS9ovqmurP/lVJWueTvefq
	 Tkom5/Kq/berRXhNxvLYXXnK6cSdIDJ1RaC9RbgWM9yWPK3Ld/OAQn9xxrt6dytpyC
	 GgXl9ELlTkNQMyJSoJsmdPgDp0eQuif0/5uAkZqM7NAI9j5ydBoPtGR1Viy7ntHug9
	 62k9haDvfqwBw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V2 3/3] dmaengine: zynqmp_dma: Guard IRQ handler against
 spurious interrupts
Reply-To: sashiko-reviews@lists.linux.dev
To: "Golla Nagendra" <nagendra.golla@amd.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, robh@kernel.org, dmaengine@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260618071056.2024286-4-nagendra.golla@amd.com>
References: <20260618071056.2024286-1-nagendra.golla@amd.com>
 <20260618071056.2024286-4-nagendra.golla@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 18 Jun 2026 07:26:14 +0000
Message-Id: <20260618072615.5D3401F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] The interrupt handler drops valid interrupts when CONFIG_PM is dis=
abled.

Pre-existing issues:
- [High] Memory and runtime PM reference leaks on error paths in zynqmp_dma=
_alloc_chan_resources().
- [High] Missing synchronize_irq() before tasklet_kill() allows the tasklet=
 to run after channel resources and PM references are freed.
--

commit 62db01b8d81ad56c8fb04b0d8f2adecdae634703
Author: Golla Nagendra <nagendra.golla@amd.com>

dmaengine: zynqmp_dma: Guard IRQ handler against spurious interrupts

This commit adds a pm_runtime_get_if_active() check in the
zynqmp_dma_irq_handler() to safely handle spurious interrupts. It
returns IRQ_NONE immediately if the device is not runtime-active,
preventing potential synchronous external aborts.

> diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_=
dma.c
> index a9dfec3c0ca3d..ce9163138be74 100644
> --- a/drivers/dma/xilinx/zynqmp_dma.c
> +++ b/drivers/dma/xilinx/zynqmp_dma.c
> @@ -730,6 +730,9 @@ static irqreturn_t zynqmp_dma_irq_handler(int irq, vo=
id *data)
>  	u32 isr, imr, status;
>  	irqreturn_t ret =3D IRQ_NONE;
> =20
> +	if (pm_runtime_get_if_active(chan->dev) <=3D 0)
> +		return IRQ_NONE;

[Severity: High]
When CONFIG_PM is disabled, the pm_runtime_get_if_active() inline stub
automatically returns -EINVAL. Does this check unconditionally drop valid
interrupts in non-PM configurations?

Because -EINVAL is less than or equal to 0, the handler might always return
IRQ_NONE. This could potentially lead to an unacknowledged interrupt storm
or the kernel permanently disabling the IRQ line.

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but do the error paths in
zynqmp_dma_alloc_chan_resources() leak the runtime PM reference?

drivers/dma/xilinx/zynqmp_dma.c:zynqmp_dma_alloc_chan_resources() {
    ...
    chan->sw_desc_pool =3D kzalloc_objs(*desc, ZYNQMP_DMA_NUM_DESCS);
    if (!chan->sw_desc_pool)
        return -ENOMEM;
    ...
    if (!chan->desc_pool_v)
        return -ENOMEM;
    ...
}

If pm_runtime_resume_and_get() is called earlier, returning directly
on memory allocation failures without calling pm_runtime_put() will
leak the PM reference and previously allocated memory.


[Severity: High]
This is a pre-existing issue, but does zynqmp_dma_synchronize() miss
a required IRQ serialization step?

drivers/dma/xilinx/zynqmp_dma.c:zynqmp_dma_synchronize() {
        struct zynqmp_dma_chan *chan =3D to_chan(dchan);

        tasklet_kill(&chan->tasklet);
}

If zynqmp_dma_irq_handler() is executing concurrently and gets preempted
just before calling tasklet_schedule(), tasklet_kill() might see no
scheduled tasklet and return immediately.=20

When the IRQ handler resumes and schedules the tasklet, could it execute
asynchronously after channel resources and PM references are freed,
potentially causing a synchronous external abort?=20

Would calling synchronize_irq() first resolve this?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618071056.2024=
286-1-nagendra.golla@amd.com?part=3D3
