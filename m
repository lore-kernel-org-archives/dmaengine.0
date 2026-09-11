Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C862B48643A
	for <dmaengine@vger.kernel.org>; Fri, 11 Sep 2026 22:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789164850; cv=none; b=T9ZoYwa0M9Dwpgq3rnWo/+e0Qafc5FQKQS1LnKTcrMZiN1g+VS3FGRB9gBso8sLhe/wykVG0prOOkwx+aLM0ycadwW+DAvCVFLqtiJMxpLZ71ecQhvdlqDAGfVELBKfzbsETejxGcselQQoVkTO/RD7o40eN/nsoQsudbFj7G5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789164850; c=relaxed/simple;
	bh=iQqTd2I8+/9ViVLICicWuVjqLvKbHtmL3JuKfkb/OEU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=M9rb5PNZcAcu9MydRuRei/m0E/Ns2aRy9DgsDYgdGH4Cbs82n5ISgJtUjfDKuf2RbGScXv0QZDdkL4LJq1z+htdXUTtXUHJuz973rNte2qAYl1qJnJaA+StkRxaplZvaBxiqikP6tZh2yDWF8wIHWHv5zAK63CB9vgSEiQlIcho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XcmXm31L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XcmXm31L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23ECC1F000FF;
	Fri, 11 Sep 2026 22:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789164847;
	bh=vuPc3fWbNQJ3ig+Rx9O7MwwufidWw32PJxnGoO0als0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XcmXm31LA8BdmX2BD1CcM5raCGnHkp4Ku/pgWcYTqYclRDvFS2cyMK/B6dMTZpMVd
	 UCtqbO4qAsipu48csFTjBR2TF+NbFD4QeAjqsph/KXmrQUxm3W4NNu7WOmqSrdxxzV
	 t+oTCeGdIR8rDF2/qJ51aPRHPtP6unwYGEWQIoQ7mNPITnWz2K0gTIYSVMmMBzYsKs
	 yIGlbdGzv8nxgAaN7GbEM3sU8PpD+vIUMTgEU0chbyvcOAZaCiBRJwGuQZBFZWwQ7z
	 Onc4Lkd4xL5t5KyiQvTww6HlRFcfqwIFEBSeEzAN8vF8DwZvyUOKQ1D6Yh2V0t/Khz
	 hdtJdSRencKbg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv3] dmaengine: fsldma: convert to
 platform_get_irq_optional()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260911220439.177474-1-rosenp@gmail.com>
References: <20260911220439.177474-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 22:14:06 +0000
Message-Id: <20260911221407.23ECC1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The return value of dma_async_device_register() is completely igno=
red, leading to silent failures and a potential zombie driver state that co=
rrupts core DMA IDA state on removal.
- [High] Missing tasklet_kill() before freeing the DMA channel structure le=
ads to a potential Use-After-Free if a tasklet is scheduled during teardown.
--

commit d7e04e63631501d249cff16deb847b2b702a2b37
Author: Rosen Penev <rosenp@gmail.com>

dmaengine: fsldma: convert to platform_get_irq_optional()

Replace the per-controller irq_of_parse_and_map() call with
platform_get_irq_optional(). The controller IRQ is optional when absent
and the driver falls back to per-channel IRQs.

> diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
> index 22d62d958abd9..dd2937e443673 100644
> --- a/drivers/dma/fsldma.c
> +++ b/drivers/dma/fsldma.c

[ ... ]

> @@ -1300,7 +1307,6 @@ static int fsldma_of_probe(struct platform_device *=
op)
>  		if (fdev->chan[i])
>  			fsl_dma_chan_remove(fdev->chan[i]);

[Severity: High]
This is a pre-existing issue, but does fsl_dma_chan_remove() fail to
explicitly kill the tasklet before freeing the channel structure?

During device removal or probe error paths, fsldma_free_irqs() calls
free_irq(). If a hardware interrupt executes just before free_irq(), it
schedules chan->tasklet. free_irq() waits for the hardirq handler to finish
but does not wait for pending softirqs.

The driver then calls fsl_dma_chan_remove() which invokes kfree(chan)
without calling tasklet_kill(&chan->tasklet).

When the softirq scheduler subsequently runs the tasklet, could
dma_do_tasklet() dereference the freed chan pointer and cause a
use-after-free?


[Severity: High]
This is another pre-existing issue, but does fsldma_of_probe() ignore the
return value of dma_async_device_register() just before this error path?

fsldma_of_probe() does this right before the out_free_fdev label:

    dma_async_device_register(&fdev->common);
    return 0;

If dma_async_device_register() fails, the driver returns success but the
device is not successfully registered. On driver teardown, fsldma_of_remove=
()
will call dma_async_device_unregister() with this unregistered device.

Could this lead to a double-free or mis-free in the IDA allocator, freeing
an ID it never successfully acquired and corrupting the DMA engine ID
namespace?

>  	}
> -	irq_dispose_mapping(fdev->irq);
>  	iounmap(fdev->regs);
>  out_free:
>  	kfree(fdev);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911220439.1774=
74-1-rosenp@gmail.com?part=3D1
