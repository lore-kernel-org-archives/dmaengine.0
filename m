Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0C93D5C1D
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785185817; cv=none; b=OrUC3huPly2PUYin+NMhHhEIsqSGrDxORFoX7aiVfh5L4qNbQiMTccYajWyCRh+VJ9tny6PS6w6LVrR4Jyco7ONyNWLn5Az8vOjgmMnoUx4ojYGrIooXY9rUISyfY8oyCRVJYcR3yqCJIAv0G8zl1cYs8Sx0DAN5ML+ErvtI/SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785185817; c=relaxed/simple;
	bh=QWOpAFknGhmZxNn8CvBPrUsmjqlf2Y58xA32AHZ6IJg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tcHV5/9IOuqxXnUv14D4gWE5MGuJ2lIhyyQ2BCWTcSzL0U4hS8diQqiDmunrMViPNadE8JXEsGhMO1bWiNhL13WBRT3EJHIml0O5bYxtKMB+Z0el0uSCa6GaqL5bjG/CUOmKk7o2frbVmPCfzNcYgtFcXpLKYuPL/ApMdVxcyYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cPdBi48x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cPdBi48x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B34C1F000E9;
	Mon, 27 Jul 2026 20:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785185815;
	bh=E/b3r5FPmR2VHqBYKTDaTbyagqdX5LXEAoOgOLYfOLU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cPdBi48xmLnYKemLH8qv2nC37DGbtT8LC9sabG05IZ2P7phyaPcXaPOhTXvnQBShq
	 JY10hUKJWw9Pfsg3R9a7VlQrsMWmrdGqurwHl4bk0bsRpqOyFnP+M4NAaU/Uul/h70
	 UZBBNq4tWqBcL1EQLm44J5YnmGjEEzdzHRTiUqZ67rt6tASgMYlOruz/ijsxSXc32J
	 XDaR5/fu9MCS5FAQdmKU/G/TqlnMmtMHPfr477r1zCc0crlPlt8OVXSoePUhf3ZM7J
	 Swiohb9u/DUiY5JJ8z4MvsI0m4KYwxM8AL9MlXtdTbt30DOWvT69Vz/roiibK2p6i+
	 n+/n62oBiGInw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 04/64] dmaengine: at_xdmac: move irq bottom half to
 dma_chan BH
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <06f8d1586f29e59ffa367c04b49400a81c0f16cf.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <06f8d1586f29e59ffa367c04b49400a81c0f16cf.1785183549.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 20:56:54 +0000
Message-Id: <20260727205655.6B34C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but an initializatio=
n race condition exists: `request_irq()` is called before hardware clocks a=
re enabled and DMA channels are initialized, which can cause a kernel panic=
 or infinite loop.
- [High] This problem wasn't introduced by this patch, but there is a resou=
rce leak and Use-After-Free due to a bypassed cleanup loop in `at_xdmac_rem=
ove()`.
- [High] This problem wasn't introduced by this patch, but the teardown ord=
er is flawed: Hardware clocks and PM runtime are disabled before freeing th=
e IRQ and stopping BH workers.
- [High] This problem wasn't introduced by this patch, but out-of-bounds me=
mory accesses and list corruption occur due to an unchecked `list_first_ent=
ry()` in the BH worker.
- [High] This problem wasn't introduced by this patch, but there is a sleep=
ing in atomic bug: The error handler calls `pm_runtime_resume_and_get()` wh=
ile holding an IRQ-disabled spinlock.
--

--- Patch [4]: [PATCH v2 04/64] dmaengine: at_xdmac: move irq bottom half t=
o dma_chan BH ---
commit 91d37fd9a6c41425b793e9ed1792794d52b35014
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: at_xdmac: move irq bottom half to dma_chan BH

Replace the per-channel tasklet with the shared dma_chan BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

> diff --git a/drivers/dma/at_xdmac.c b/drivers/dma/at_xdmac.c
> index 901971e8bae69..aa918043e37ec 100644
> --- a/drivers/dma/at_xdmac.c
> +++ b/drivers/dma/at_xdmac.c

[ ... ]

> @@ -1759,9 +1758,9 @@ static void at_xdmac_handle_error(struct at_xdmac_c=
han *atchan)
>  	/* Then continue with usual descriptor management */
>  }
> =20
> -static void at_xdmac_tasklet(struct tasklet_struct *t)
> +static void at_xdmac_tasklet(struct dma_chan *chan)
>  {
> -	struct at_xdmac_chan	*atchan =3D from_tasklet(atchan, t, tasklet);
> +	struct at_xdmac_chan	*atchan =3D to_at_xdmac_chan(chan);
>  	struct at_xdmac		*atxdmac =3D to_at_xdmac(atchan->chan.device);
>  	struct at_xdmac_desc	*desc;

[Severity: High]
This is a pre-existing issue, but does this function lack a list empty chec=
k?
Later in at_xdmac_tasklet(), the code does:

desc =3D list_first_entry(&atchan->xfers_list, struct at_xdmac_desc,
                        xfer_node);
if (!desc->active_xfer) { ... }

If at_xdmac_device_terminate_all() runs concurrently and empties
xfers_list, resuming the BH worker might resolve an invalid pointer for
the empty list, read out-of-bounds for desc->active_xfer, and corrupt
the list.

[Severity: High]
This is also a pre-existing issue, but can this path sleep while atomic?
In at_xdmac_tasklet(), an IRQ-disabled spinlock is acquired:

spin_lock_irq(&atchan->lock);
...
if (atchan->irq_status & error_mask)
        at_xdmac_handle_error(atchan);

Inside at_xdmac_handle_error(), it calls pm_runtime_resume_and_get(),
which can sleep since the device isn't marked as pm_runtime_irq_safe().
Could this lead to a scheduling while atomic bug if the device's
runtime status is not RPM_ACTIVE?

[ ... ]

> @@ -2317,7 +2316,7 @@ static int at_xdmac_probe(struct platform_device *p=
dev)
>  		return PTR_ERR(atxdmac->clk);
>  	}
> =20
> -	/* Do not use dev res to prevent races with tasklet */
> +	/* Do not use devm resources to prevent races with the BH worker */
>  	ret =3D request_irq(atxdmac->irq, at_xdmac_interrupt, 0, "at_xdmac", at=
xdmac);

[Severity: High]
This isn't a bug introduced by this patch, but an initialization race
condition appears to exist here. Is it safe to call request_irq() before
the hardware clocks are enabled via clk_prepare_enable() and before
dma_async_device_register() initializes the channel count?

If an early or pending interrupt fires immediately after request_irq(),
the handler at_xdmac_interrupt() will execute while the controller's
clock is gated, which could trigger a bus fault.

Even if clocks were enabled, atxdmac->dma.chancnt is still 0 at this point.
The handler would skip the channel check loop, fail to clear the interrupt,
and spin infinitely in its do-while(pending) loop.

[ ... ]

> @@ -2458,7 +2457,7 @@ static void at_xdmac_remove(struct platform_device =
*pdev)
>  	for (i =3D 0; i < atxdmac->dma.chancnt; i++) {
>  		struct at_xdmac_chan *atchan =3D &atxdmac->chan[i];
> =20
> -		tasklet_kill(&atchan->tasklet);
> +		dma_chan_kill_bh(&atchan->chan);
>  		at_xdmac_free_chan_resources(&atchan->chan);
>  	}
>  }

[Severity: High]
This is a pre-existing issue, but does the teardown order in
at_xdmac_remove() and the probe error path risk a bus fault?

In at_xdmac_remove(), clk_disable_unprepare() and pm_runtime_disable() are
called before free_irq(). If a pending interrupt fires before free_irq()
completes, the interrupt handler will attempt to read from the clock-gated
device registers, which could trigger a synchronous external abort.

[Severity: High]
This is another pre-existing issue, but will this cleanup loop ever execute?

Earlier in at_xdmac_remove(), dma_async_device_unregister() is called,
which iterates over all registered channels and decrements device->chancnt
to 0.

When this loop attempts to use atxdmac->dma.chancnt as its limit, it is
completely bypassed, meaning dma_chan_kill_bh() and
at_xdmac_free_chan_resources() are never called, potentially causing a
resource leak and use-after-free for pending BH workers.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785183549.gi=
t.allen.lkml@gmail.com?part=3D4
