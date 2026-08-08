Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301BD126C02
	for <dmaengine@vger.kernel.org>; Sat,  8 Aug 2026 12:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786191366; cv=none; b=SyY76BhWDHO0eV0EFjSuD/ck90JRYp14Wp7wScLcO6KUJAsv23iRZJC4VVc/yQJXAR780reWvt51bgRHZMSF/tmtJijIlIGs1RfrDGDjE3R70qE8o6Xebn/ildd5STWtm1+hcXUsPdVyAM+fa1CqKWXjUkxaek+Xu1JZOOBwI+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786191366; c=relaxed/simple;
	bh=MeASbPZL7upLJS3T9vm+s6rXyLe/rU7zvpqDa2LgV74=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ghMuexjj2YbSXiPaJJVCmfEqCKvea1npQ1/ROdWSLkNbXShiJsJn5zLiG0+zi4+s2k8pO3h/IbRfiZ99zG1EFVHVmNEz/msSIlkqLN13DJ9cpeGrpevJp4dBR3vZgWuJIlTXxxNkGMPgTb/R41+Z8S07DBznfqC6msTK+d9vLqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bseszlaq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bseszlaq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F00F41F000E9;
	Sat,  8 Aug 2026 12:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786191363;
	bh=7tKHGCAanUReWoBzI2Iqe9nIqP1/SnmfO3/+SwwyWcw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bseszlaqMSS0i3bc9DPZCKD5igXBRrH39dhkqVPnK2vbCh/boN4EGItAuiN/gp6lD
	 OTmaDHlpYC7BHFWsbYvHaneP0U1ulSeT6Ual5guLQDGnWgzsiBOn8lFikdUHHxXC2T
	 CY7CGIyfSdE8Jqy4VMlRdsZFxcTP+s+R9UhOIiLUH3mG1TBR5d2LHBm1npFM1qAGaY
	 2zGX5+BN967PG+R9hd9JZGjighV8YmiakOz+o3J9yWbK3boWsF+k0fPgIpw2SZMyLX
	 RitgviPreLi0A3B5WCRoM0fWcnP7u4BeNuNP8eufSOp7ibRFhDpOXWCq/0ePt6LS/S
	 RiIhJ7l5h/Kpg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: xilinx: zynqmp_dma: fix autosuspend cleanup
 during teardown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guangshuo Li" <lgs201920130244@gmail.com>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260808115228.2798481-1-lgs201920130244@gmail.com>
References: <20260808115228.2798481-1-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 12:16:02 +0000
Message-Id: <20260808121602.F00F41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The probe error path mishandles runtime PM state, leaking the usag=
e count, leaving clocks enabled, and causing double-disable of PM.
- [High] Manual invocation of the runtime suspend callback during remove() =
races with the PM core, potentially leading to double clock disable or leak=
ed clocks.
- [High] If pm_runtime_resume_and_get() fails during probe, the success pat=
h unconditionally calls pm_runtime_put_sync_autosuspend(), which underflows=
 the usage count and triggers a kernel warning.
- [High] Fallback manual PM resume in probe is not cleanly undone during de=
vice removal, leaking clocks.
- [High] Overriding the return value of platform_get_irq() to -ENXIO breaks=
 deferred probing.
- [High] Dropping a spinlock during list traversal in the cleanup tasklet c=
auses double-free and infinite loops.
- [High] Memory and PM reference leak in zynqmp_dma_alloc_chan_resources() =
on failure paths.
--

--- Patch [1]: [PATCH] dmaengine: xilinx: zynqmp_dma: fix autosuspend clean=
up during teardown ---
commit 84d893f1819f6fc2e37ae0cbd28a5db284008c1e
Author: Guangshuo Li <lgs201920130244@gmail.com>

dmaengine: xilinx: zynqmp_dma: fix autosuspend cleanup during teardown

This commit addresses an unbalanced usage_count by adding missing calls
to pm_runtime_dont_use_autosuspend() in the probe failure and remove paths.

> diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_=
dma.c
> index f6a812e49ddca..635c3f6cc5c2f 100644
> --- a/drivers/dma/xilinx/zynqmp_dma.c
> +++ b/drivers/dma/xilinx/zynqmp_dma.c
> [ ... ]
> @@ -1152,6 +1154,7 @@ static int zynqmp_dma_probe(struct platform_device =
*pdev)
>  err_disable_pm:
>  	if (!pm_runtime_enabled(zdev->dev))
>  		zynqmp_dma_runtime_suspend(zdev->dev);
> +	pm_runtime_dont_use_autosuspend(zdev->dev);
>  	pm_runtime_disable(zdev->dev);
>  	return ret;
>  }

[Severity: High]
This is a pre-existing issue, but does this error path mishandle runtime
PM state?

If pm_runtime_resume_and_get() succeeds but a subsequent step like
zynqmp_dma_chan_probe() fails, execution jumps to err_disable_pm. Because
pm_runtime_enabled() is true, zynqmp_dma_runtime_suspend() is skipped, leav=
ing
hardware clocks on. It also never calls pm_runtime_put_noidle() to drop the
usage count.

Conversely, if pm_runtime_resume_and_get() initially fails, the driver calls
pm_runtime_disable() and falls back to manual resume. If probe then fails,
err_disable_pm calls pm_runtime_disable() a second time, incrementing
disable_depth to 2 and breaking PM permanently.

[Severity: High]
This is also a pre-existing issue, but does the success path of probe
unconditionally underflow the usage count if the fallback manual resume
path was taken?

drivers/dma/xilinx/zynqmp_dma.c:zynqmp_dma_probe() {
    ...
	ret =3D of_dma_controller_register(pdev->dev.of_node,
					 of_zynqmp_dma_xlate, zdev);
	if (ret) {
        ...
	}

	pm_runtime_put_sync_autosuspend(zdev->dev);

	return 0;
    ...
}

If pm_runtime_resume_and_get() fails, it drops its internal reference. The
failure path handles the error by calling pm_runtime_disable() and falling
back to manual resume.

If the rest of the probe succeeds, the function reaches
pm_runtime_put_sync_autosuspend() at the end. Even though runtime PM is
disabled, this function passes the RPM_GET_PUT flag to the PM core, which
calls rpm_drop_usage_count(), unconditionally decrementing the count below =
0.

> [ ... ]
> @@ -1172,6 +1175,7 @@ static void zynqmp_dma_remove(struct platform_devic=
e *pdev)
>  	zynqmp_dma_chan_remove(zdev->chan);
>  	if (pm_runtime_active(zdev->dev))
>  		zynqmp_dma_runtime_suspend(zdev->dev);

[Severity: High]
This isn't a bug introduced by this patch, but does the manual invocation of
the runtime suspend callback race with the PM core?

Because runtime PM is still enabled during this manual check and suspend,
the auto-suspend timer or a PM workqueue can concurrently invoke the suspend
callback, which can cause unbalanced clk_disable_unprepare() calls.

Should pm_runtime_disable() be called before attempting manual suspend
management to serialize state and ensure no async operations are running?

[Severity: High]
This is also a pre-existing issue, but is the pm_runtime_active() check
bypassing the hardware suspend if the fallback PM path was taken during pro=
be?

If pm_runtime_resume_and_get() fails during probe, the driver disables PM a=
nd
manually calls zynqmp_dma_runtime_resume() to turn on clocks. In this
fallback state, the PM core's runtime status remains RPM_SUSPENDED.

During zynqmp_dma_remove(), the pm_runtime_active() check returns false,
so zynqmp_dma_runtime_suspend() is incorrectly skipped and clocks are left
permanently enabled.

> +	pm_runtime_dont_use_autosuspend(zdev->dev);
>  	pm_runtime_disable(zdev->dev);
>  }

[Severity: High]
This isn't a bug introduced by this patch, but does overriding the return v=
alue
of platform_get_irq() break deferred probing?

drivers/dma/xilinx/zynqmp_dma.c:zynqmp_dma_chan_probe() {
    ...
	zynqmp_dma_init(chan);
	chan->irq =3D platform_get_irq(pdev, 0);
	if (chan->irq < 0)
		return -ENXIO;
    ...
}

platform_get_irq() can return -EPROBE_DEFER if the interrupt controller is
not yet ready. By swallowing the actual error code and unconditionally
returning -ENXIO, the driver prevents the kernel from retrying the probe
later.

[Severity: High]
This is a pre-existing issue, but can dropping the spinlock during list
traversal cause an infinite loop?

drivers/dma/xilinx/zynqmp_dma.c:zynqmp_dma_chan_desc_cleanup() {
    ...
			spin_unlock_irqrestore(&chan->lock, irqflags);
			dmaengine_desc_callback_invoke(&cb, NULL);
			spin_lock_irqsave(&chan->lock, irqflags);
    ...
}

The code iterates over chan->done_list using list_for_each_entry_safe().
To invoke a DMA callback, it drops chan->lock.

While dropped, a concurrent call to zynqmp_dma_device_terminate_all() can
acquire the lock and call zynqmp_dma_free_descriptors(), which moves all
descriptors from chan->done_list to chan->free_list.

When the tasklet reacquires the lock, its next pointer now points to an
element in chan->free_list. The tasklet loop incorrectly continues traversi=
ng
free_list until it crashes, never hitting the done_list list head to termin=
ate
the loop.

[Severity: High]
This isn't a bug introduced by this patch, but do these error paths leak
memory and the PM usage counter?

drivers/dma/xilinx/zynqmp_dma.c:zynqmp_dma_alloc_chan_resources() {
    ...
	chan->sw_desc_pool =3D kzalloc_objs(*desc, ZYNQMP_DMA_NUM_DESCS);
	if (!chan->sw_desc_pool)
		return -ENOMEM;

	chan->desc_pool_v =3D dma_alloc_coherent(chan->dev,
					       (2 * ZYNQMP_DMA_DESC_SIZE(chan) *
					       ZYNQMP_DMA_NUM_DESCS),
					       &chan->desc_pool_p, GFP_KERNEL);
	if (!chan->desc_pool_v)
		return -ENOMEM;
    ...
}

pm_runtime_resume_and_get() increments the device's PM usage count earlier =
in
this function. If kzalloc_objs() fails, it returns -ENOMEM without dropping
the PM reference via pm_runtime_put().

If dma_alloc_coherent() fails, it returns -ENOMEM without freeing the
just-allocated chan->sw_desc_pool and without dropping the PM reference.
The dmaengine core does not invoke device_free_chan_resources() when
allocation fails.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260808115228.2798=
481-1-lgs201920130244@gmail.com?part=3D1
