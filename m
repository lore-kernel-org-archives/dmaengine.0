Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677093C3432
	for <dmaengine@vger.kernel.org>; Thu, 20 Aug 2026 08:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787213138; cv=none; b=R8F5DPQ7IvLHJvJ9TqcQXEdQnpQByGRKznxBZrPABhfTGRsO82ueQg8+3VpGrXAP2utZYyUzLd0CqpKvNofvzZX5/grq67FqV/CgJoau73PNnUqwDYrq18UtSRY/j8IsYBxmWIK8JVqGyA6rsWTa2lza57ZpK/SYb/UnGql4aRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787213138; c=relaxed/simple;
	bh=JRmcL9L9u/X6rUj75QvuZjS7WTOOvrdY9SD/1oecze8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JK+FXeQiEEecF3GP9TacSqliqVlJMNWjdx6BRAloucEC3qpq/s16WQcvkouKcTa3x+FaElsyveiwV6JVWkc3Ydtrm0OviDeXZ/UalZUi/4NZPqZpLSaJ/wDcVg96g8IzKfrGN5SRTvWi/vP8oiCemQTv1jCKBw0DmnPLh6b+9DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JrOtbhzd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JrOtbhzd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C637F1F00A3A;
	Thu, 20 Aug 2026 08:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787213137;
	bh=Z0dAKa0P6+GlabS5Pn3yjvq9r4W3nAIGB4dl/2DdxdY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JrOtbhzddQvFkuzaC83qrIc9OMNnnd7Oy8W/EMrrBBh8wHiiEPu9JH/lVJX1EbY+J
	 8tRQ2XGgeUyHM9PWXLrhAW7BCATCjdVjTxmIuirc9UzzuOkzdhw/WQ3B49gs2JAo8/
	 2tc6tXeDNSDcRyLVGdBAK3kj1Mq0aXZoo8qiKe46OhrJ2lP5xJg8hnthUuKT6XCvOt
	 Y3o+osWGfmILX8FLLEFMCKycLxgUZwkQ6hD2m/+dy4fhsCjQtKXvbe4X5bxHP9EO0i
	 ht2G4J9SefPEZUMlUboenu77zlkdeo4NZIQ/nY9bcYNtVjjZlBryCNsc31NZgIjQ9r
	 joQhKhzI+4zLA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Triet Hoang" <triet.hoang.dev@gmail.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260820075330.2065377-1-triet.hoang.dev@gmail.com>
References: <20260820075330.2065377-1-triet.hoang.dev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 08:05:36 +0000
Message-Id: <20260820080536.C637F1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing tasklet teardown on probe error path leads to Use-After-Fr=
ee.
- [High] Tasklet scheduled before initialization causes NULL pointer derefe=
rence, and missing teardown causes Use-After-Free.
- [High] Clock disabled immediately after relaxed writes can lead to lost w=
rites or bus stalls.
--

--- Patch [1]: [PATCH] dmaengine: Convert to DEFINE_SIMPLE_DEV_PM_OPS() ---
commit 362f0670618631761830584ae4ebaa28847cc39c
Author: Triet Hoang <triet.hoang.dev@gmail.com>

dmaengine: Convert to DEFINE_SIMPLE_DEV_PM_OPS()

This commit converts the deprecated SIMPLE_DEV_PM_OPS to
DEFINE_SIMPLE_DEV_PM_OPS and pm_sleep_ptr(). It drops the __maybe_unused
annotations from the suspend and resume callbacks, reducing kernel size
when PM configurations are disabled.

> diff --git a/drivers/dma/k3dma.c b/drivers/dma/k3dma.c
> index e84f197fea76f..e0138f5bfd65f 100644
> --- a/drivers/dma/k3dma.c
> +++ b/drivers/dma/k3dma.c
[ ... ]
> -#ifdef CONFIG_PM_SLEEP
>  static int k3_dma_suspend_dev(struct device *dev)
>  {
>  	struct k3_dma_dev *d =3D dev_get_drvdata(dev);

[Severity: High]
This is a pre-existing issue, but I noticed a potential problem with how
the clock is disabled in k3_dma_suspend_dev().

The suspend function calls k3_dma_enable_dma(d, false), which uses
writel_relaxed() to mask interrupts. Since writel_relaxed() performs posted
writes, they are not guaranteed to reach the peripheral immediately.

Right after this, the clock is disabled via clk_disable_unprepare(d->clk).

Can disabling the clock while a bus write is still in-flight cause the write
to be lost (leaving interrupts unmasked) or trigger a system-wide bus stall?
Should there be a dummy readback to flush the bus before the clock is
disabled?

[ ... ]
>  static struct platform_driver k3_pdma_driver =3D {
>  	.driver		=3D {
>  		.name	=3D DRIVER_NAME,
> -		.pm	=3D &k3_dma_pmops,
> +		.pm	=3D pm_sleep_ptr(&k3_dma_pmops),
>  		.of_match_table =3D k3_pdma_dt_ids,
>  	},
>  	.probe		=3D k3_dma_probe,

[Severity: High]
This is a pre-existing issue, but I noticed a potential initialization and
teardown issue in k3_dma_probe().

The probe function requests an IRQ and unmasks interrupts via
k3_dma_enable_dma(d, true) before the tasklet is initialized:

    k3_dma_enable_dma(d, true);

    ret =3D dma_async_device_register(&d->slave);
    if (ret)
        goto dma_async_register_fail;
    ...
    tasklet_setup(&d->task, k3_dma_tasklet);

If an interrupt fires immediately, k3_dma_int_handler() could call
tasklet_schedule(&d->task). Since d->task is zero-allocated and hasn't
been initialized by tasklet_setup() yet, wouldn't this cause a NULL
pointer dereference?

Additionally, if the probe fails later (for example, in
dma_async_device_register()), the error path relies on devres to free
memory but omits tasklet_kill(). Does this leave pending virtual channel
tasklets pointing to freed memory, causing a use-after-free?

> diff --git a/drivers/dma/pch_dma.c b/drivers/dma/pch_dma.c
> index bf805f1024f64..e6d7c72fce3ce 100644
> --- a/drivers/dma/pch_dma.c
> +++ b/drivers/dma/pch_dma.c
[ ... ]
>  static struct pci_driver pch_dma_driver =3D {
>  	.name		=3D DRV_NAME,
>  	.id_table	=3D pch_dma_id_table,
>  	.probe		=3D pch_dma_probe,

[Severity: High]
This is a pre-existing issue, but looking at pch_dma_probe(), there appears
to be a missing tasklet teardown on the error path.

The probe function requests an IRQ with IRQF_SHARED. If a shared interrupt
fires, pd_irq() executes, reads the device status, and might schedule
pd_chan->tasklet if the hardware status bits are non-zero.

If the probe subsequently fails (e.g., in dma_async_device_register()),
the error path calls free_irq() and frees the memory, but omits calling
tasklet_kill(&pd_chan->tasklet):

err_free_pool:
        dma_pool_destroy(pd->pool);
err_free_irq:
        free_irq(pdev->irq, pd);
err_iounmap:

Could the tasklet remain queued and execute after pd is freed, resulting in
a use-after-free?

>  	.remove		=3D pch_dma_remove,
> -	.driver.pm	=3D &pch_dma_pm_ops,
> +	.driver.pm	=3D pm_sleep_ptr(&pch_dma_pm_ops),
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820075330.2065=
377-1-triet.hoang.dev@gmail.com?part=3D1
