Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9152F3621
	for <dmaengine@vger.kernel.org>; Sun, 30 Aug 2026 06:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788071115; cv=none; b=OyouxuzB7ICe8KLAkldV+1ziLwITRVw9fy8qEsKEm0AqMiXUi0LgN05srFuaUgwHtqxaarCr/1TP9Vzmuzu30LxfH6yvGVjaLF+KR8oWqzrlY6bzcGAjrenV2gXLmmUYglyiaEM0hXhjhVA7IlwbG6lkL07fV/n4+t0s+9SexY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788071115; c=relaxed/simple;
	bh=mybrBSDEs/zdymSCIXRB70Mz/6mepb7nV4ptrAVly1A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XBSfRwk7Fu0wHli9CYSfCGNLW1zaqZVBX+Dlm/xUU9Q7bYNTUVnIqw+4iuQx2BEr2k5h3udAsOiIU8MbEXfhsFnNKmhThbrbNskig8rAhNnxZGe8KIERI158BHOjpTo23NgztWQwnoLFon0a8V5jHOKBhpRFCPDFhSpf8npeE3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lCrJVNmp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lCrJVNmp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3709D1F000E9;
	Sun, 30 Aug 2026 06:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788071113;
	bh=HyL4jiK/JE+3jjfd5Wtn/dq7DQnqVyN7mgTD1Kv9Bc4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lCrJVNmppjDTxwJXXie80Fx+Yvt3Su6uqKFj9IEXh/Rig97LnV7ZCvnCkycsJFXq+
	 2lKM4pES3UFvB3WwD84U1hG3n6wqT2h6bpzNA+m3FbkivS3dLJE0UOS0i/su+SqgdS
	 xfP3MDVkSLsIICVLz5zROeisajLZEb5qhUd8ZqYVli55N9SvjZZY9kQCtmlNIS6/yz
	 n7V3rtR/3sdQmUo4l9kZwZgP2QimK7rNIIyhSAUfH0dHt8L11sOtk4DIKZeJFg3PyZ
	 4GZ3L0UyiBmygvAAz2jYU8k6EXQxrFfIJfNaNukEwvbaDqvFT2JZSIsFmLnGu2UaUs
	 IXGefg0vZ/F8Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: tegra: initialize channel state before
 requesting IRQ
Reply-To: sashiko-reviews@lists.linux.dev
To: "Runyu Xiao" <runyu.xiao@seu.edu.cn>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260830061213.2209331-1-runyu.xiao@seu.edu.cn>
References: <20260830061213.2209331-1-runyu.xiao@seu.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 Aug 2026 06:25:12 +0000
Message-Id: <20260830062513.3709D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Uninitialized `tdc->isr_handler` causes a NULL pointer dereference=
 on early interrupt.
- [High] Uninitialized `tdc->dma_chan.dev` pointer dereference in the ISR e=
rror logging path and tracepoints.
- [High] Missing `tasklet_kill()` on error and remove paths leads to a Use-=
After-Free if an interrupt schedules the tasklet.
- [High] Hardware registers are accessed from the ISR while the device cloc=
k is disabled, leading to a bus hang.
--

commit bf493fa22f6f1d380e6e364bca736ddeb8ce99f4
Author: Runyu Xiao <runyu.xiao@seu.edu.cn>

dmaengine: tegra: initialize channel state before requesting IRQ
   =20
tegra_dma_probe() registers a channel IRQ before initializing the
channel lock, tasklet, waitqueue, and descriptor lists used by the
interrupt path. A pending interrupt can therefore access uninitialized
channel state. Prepare the channel state before requesting its IRQ so
the handler and tasklet always see initialized synchronization and list
objects.

> diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
> index 640b8a218c9ad..23fd294ab00d5 100644
> --- a/drivers/dma/tegra20-apb-dma.c
> +++ b/drivers/dma/tegra20-apb-dma.c
> @@ -1494,6 +1494,19 @@ static int tegra_dma_probe(struct platform_device =
*pdev)
>  		}
> =20
>  		snprintf(tdc->name, sizeof(tdc->name), "apbdma.%d", i);
> +		tdc->tdma =3D tdma;
> +		tdc->id =3D i;
> +		tdc->slave_id =3D TEGRA_APBDMA_SLAVE_ID_INVALID;
> +
> +		tasklet_setup(&tdc->tasklet, tegra_dma_tasklet);
> +		spin_lock_init(&tdc->lock);
> +		init_waitqueue_head(&tdc->wq);
> +
> +		INIT_LIST_HEAD(&tdc->pending_sg_req);
> +		INIT_LIST_HEAD(&tdc->free_sg_req);
> +		INIT_LIST_HEAD(&tdc->free_dma_desc);
> +		INIT_LIST_HEAD(&tdc->cb_desc);
> +
>  		ret =3D devm_request_irq(&pdev->dev, irq, tegra_dma_isr, 0,
>  				       tdc->name, tdc);

[Severity: High]
This isn't a bug introduced by this patch, but moving the initialization he=
re
fails to initialize tdc->isr_handler.

If a spurious interrupt fires before tegra_dma_prep_slave_sg() initializes =
the
handler, and tdc_read() returns a value with TEGRA_APBDMA_STATUS_ISE_EOC set
(such as 0xFFFFFFFF resulting from an abort on an unclocked APB read), will
tegra_dma_isr() unconditionally execute the NULL tdc->isr_handler pointer?

tegra_dma_isr() {
	...
	if (status & TEGRA_APBDMA_STATUS_ISE_EOC) {
		...
		tdc->isr_handler(tdc, false);
	...
}

[Severity: High]
This isn't a bug introduced by this patch, but is tdc->dma_chan.dev
uninitialized at this point?

tdc->dma_chan.dev is dynamically allocated later in
dma_async_device_register(). If a spurious interrupt fires and the interrupt
status does not have TEGRA_APBDMA_STATUS_ISE_EOC set, the ISR falls back to
the error logging path which uses tdc2dev():

tegra_dma_isr() {
	...
	dev_info(tdc2dev(tdc), "Interrupt already served status 0x%08x\n", status);
	...
}

Will tdc2dev() unconditionally dereference the NULL dma_chan.dev pointer?

[Severity: High]
This is a pre-existing issue, but does requesting the IRQ here lead to a
use-after-free if probe fails?

If a spurious interrupt schedules tdc->tasklet and a subsequent probe step =
like
dma_async_device_register() fails, the error path returns without calling
tasklet_kill():

tegra_dma_probe() {
	...
err_pm_disable:
	pm_runtime_disable(&pdev->dev);
	return ret;
}

Devres will then free the tdma and tdc memory. When the scheduled softirq
runs, will it access the freed channel state? The driver unbind path in
tegra_dma_remove() appears to have the same issue.

[Severity: High]
This is a pre-existing issue, but does requesting the IRQ here allow hardwa=
re
registers to be accessed from the ISR while the device clock is disabled?

tegra_dma_init_hw() deliberately disables the DMA clock prior to this loop:

tegra_dma_init_hw() {
	...
	clk_disable(tdma->dma_clk);
}

When devm_request_irq() unmasks the interrupt, an early or spurious interru=
pt
will invoke tegra_dma_isr(), which performs an APB register read:

tegra_dma_isr() {
	...
	status =3D tdc_read(tdc, TEGRA_APBDMA_CHAN_STATUS);
	...
}

Since reading from an unclocked APB register typically hangs the bus on this
hardware, can this lead to a system lockup?

>  		if (ret) {
>  			dev_err(&pdev->dev,
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260830061213.2209=
331-1-runyu.xiao@seu.edu.cn?part=3D1
