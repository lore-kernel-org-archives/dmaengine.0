Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932E42FD665;
	Thu, 25 Jun 2026 09:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782379279; cv=none; b=KhkOo7CQgcmR9AJTcfakvZdmVGuu+dcm8Sj0GcfFxDWkWwLcfYBwTwWC/L3TyAwIVm2GIjB+zlanjBt9v3/YCVeYmCby8lVsK4WF7wA4BtIvb0OHajF+vfU1Q+aYMCtW1NM7cmXMw1fzY5VhfD7dDGIfqnT6ET19vEcZrnKfvLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782379279; c=relaxed/simple;
	bh=lwhv5b/WmqtM+0FRnJJk7OcV1ke5fouT28ItryejZc4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CCoHtpluB/o72FstGxBiJB9SNn9L8e/AZiXr0PExFRlNPuwKODzhD069O9RSLLEcZjOA9kpkEjas+2sgc76wxlZSgGBRsy7argNwueWIGkVjHQkMIOsttSqajmwc3BO5+HFR4njFCMbgBtHNfnpobAqY7sFF/AqjSy1cqF1yHzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uu7FtSog; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uu7FtSog"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8C001F000E9;
	Thu, 25 Jun 2026 09:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782379277;
	bh=V5iJDybVYPLoX8tIWuO1oSOYbYzxjByZEtoOXZZEB1o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Uu7FtSogfsh1/TsUEzgdwoSQBWNkFG5vJ3tixdsCR/67YmVD6Furdy+HvBTV9Cqyk
	 GJlUnSYCrsZlncPObmImIZp8s0EsTONe9s5xF5V6+0nON6ZpJlIajv6OepeOyq0xlh
	 pgdw5asM/17CGDBA+9Vy5mIHhQxClHje624+g/KFHSZqp5xBF+ds7ePYLOWkrAb65c
	 A/jLEl0eilyDqlZ8CO7CelKMyLh5FDACfx6y7iIA71ZRnxMsuDyXG9YyK5l/pU+UG4
	 4ceDvBgAXAHv4oA8t2sxNTtZjPgCxBLTOSyafyJ9jWJfyQ2BMAjlfw6OgDJHq2zWV+
	 ubxocSsyjvlhw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/5] dmaengine: mcf-edma: Use devm for per-channel
 IRQ registration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jean-Michel Hautbois" <jeanmichel.hautbois@yoseli.org>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org, imx@lists.linux.dev
In-Reply-To: <20260625-b4-edma-dmaengine-v3-5-44be00ace37d@yoseli.org>
References: <20260625-b4-edma-dmaengine-v3-0-44be00ace37d@yoseli.org>
 <20260625-b4-edma-dmaengine-v3-5-44be00ace37d@yoseli.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 09:21:16 +0000
Message-Id: <20260625092116.C8C001F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Replacing explicit `free_irq()` with `devm_request_irq()` introduc=
es a Use-After-Free race condition by deferring IRQ unregistration until af=
ter the virtual channels are torn down.

Pre-existing issues:
- [High] dma_async_device_unregister() fails to clean up channels because f=
sl_edma_cleanup_vchan() improperly empties the channel list beforehand, lea=
ding to a resource leak.
--

commit 3174cb73d4f28e4270bffd2960b8600186152672
Author: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>

dmaengine: mcf-edma: Use devm for per-channel IRQ registration

This patch converts the eDMA transfer interrupt registration to use the
managed devm_request_irq() API with per-channel names. It also adds logic
in the remove path to manually quiesce the hardware since the interrupts
are now freed later by devres.

> diff --git a/drivers/dma/mcf-edma-main.c b/drivers/dma/mcf-edma-main.c
> --- a/drivers/dma/mcf-edma-main.c
> +++ b/drivers/dma/mcf-edma-main.c

[ ... ]

> @@ -249,8 +234,21 @@ static int mcf_edma_probe(struct platform_device *pd=
ev)
>  static void mcf_edma_remove(struct platform_device *pdev)
>  {
>  	struct fsl_edma_engine *mcf_edma =3D platform_get_drvdata(pdev);
> +	struct edma_regs *regs =3D &mcf_edma->regs;
> +	int i;
> +
> +	/*
> +	 * The per-channel interrupts are requested with devm and are only
> +	 * freed after this function returns.  Quiesce the controller first so
> +	 * that no interrupt can fire while the virtual channels are torn down:
> +	 * disable every channel's request and acknowledge any pending
> +	 * interrupt.
> +	 */
> +	for (i =3D 0; i < mcf_edma->n_chans; i++)
> +		fsl_edma_disable_request(&mcf_edma->chans[i]);
> +	iowrite32(~0, regs->inth);
> +	iowrite32(~0, regs->intl);
> =20
> -	mcf_edma_irq_free(pdev, mcf_edma);
>  	fsl_edma_cleanup_vchan(&mcf_edma->dma_dev);

[Severity: High]
Does deferring the IRQ unregistration until after the virtual channels are
torn down introduce a use-after-free race?

Since devm_request_irq() defers freeing the IRQ until after mcf_edma_remove=
()
returns, the driver loses the synchronization barrier that previously waited
for in-flight handlers. The manual hardware quiescence loop does not
synchronize with already executing handlers.

If an interrupt handler executes on another CPU, could it complete the tran=
sfer
and call vchan_cookie_complete(), which executes tasklet_schedule()?

If this happens after fsl_edma_cleanup_vchan() kills the tasklet:

fsl_edma_cleanup_vchan()
        tasklet_kill(&chan->vchan.task);

the tasklet could be placed back on the runqueue. After remove() completes,
devres frees the IRQ and device memory, meaning the scheduled tasklet would
execute on freed memory.

>  	dma_async_device_unregister(&mcf_edma->dma_dev);

[Severity: High]
This isn't a bug introduced by this patch, but does the order of operations
here leave dma_async_device_unregister() operating on an empty list?

Looking at fsl_edma_cleanup_vchan(), it iterates over dmadev->channels and
removes every channel from the list:

fsl_edma_cleanup_vchan() {
        list_for_each_entry_safe(...) {
                list_del(&chan->vchan.chan.device_node);
                ...
        }
}

Immediately after, dma_async_device_unregister() is called, which relies on
iterating over the exact same device->channels list to unregister the
channels.

Because the list was just emptied, the iteration does zero passes, skipping
the core channel unregistration and permanently leaking sysfs entries and
per-cpu memory.

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625-b4-edma-dm=
aengine-v3-0-44be00ace37d@yoseli.org?part=3D5
