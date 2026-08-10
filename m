Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752FC3B8959
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786386944; cv=none; b=dy7EAONKkiI+JdUAefrPZqryE9ddx8K4VGOsscA8qhoCUY+Nga4sg4QGAD+kziLK/NjsnAbgSzgvn3bnsbsVaFpcq5zEQ/54RvBy22HQO31xN6Vpn8HUHQFG1An//zWkSbh7wPcTDBzY424lXZ5iH0O3rfPUXsVhFMLp7yqEvqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786386944; c=relaxed/simple;
	bh=M/+bqOYG6E8Mc6q0pf5+cU83EBmXaGWlOEoIfGtwN5Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=r6IrRVww3OpqVbZsOObcb98rpkNG56/zUhwKi7cymqltqfOTK32VC5wWRPFTQPGn067qqOehJrnhPs5OstRtbzk1o5RYf667O6IkOT2qrpjV2/32lUgPU4sNW217QCADO4Hg9t2M5u2MMKv0pVgld4o2SbOM6TqMyUeo+pwIAG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=STWXHWDz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="STWXHWDz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3EE81F000E9;
	Mon, 10 Aug 2026 18:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786386942;
	bh=Ve+EhHWjROnDTS8J93mMH7tEInYc6cLSJ/Rs7f4FY28=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=STWXHWDzrO2i6dxUKdfLxSZiOUVITicSrOWw67o5WF+v0OTWDXgcNLCCqEox42Gmd
	 +dQchz1pjyZXGZHt+8qiQr+K4JYfL8dSvLxKXmhvledtgSI549ii3tMjhx5SS5GKua
	 nRAZqKyQJQL7Tp4BvMrdLIeoHUWVXrSHv37hSy3TAbji4vCIslvyltOMvUjgMkX084
	 TswF/4ZEqWo0sjaBjOlfzdxJ3pAYeUAFi8embStakujnc3TeKEPy7o3fOq2te5MyqY
	 gFauJPj/g++uON9JFarYKBsGTzlqCMABNxOPy5BXKN5seDm820UAeANekZTQFtybYU
	 UxIeosju5Bo9A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 04/34] dmaengine: at_xdmac: move irq bottom half to
 dmaengine BH
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <452a0aad787e4d64a057f13f47302782e9b3752e.1786384168.git.allen.lkml@gmail.com>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <452a0aad787e4d64a057f13f47302782e9b3752e.1786384168.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 18:35:42 +0000
Message-Id: <20260810183542.A3EE81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Hard lockup due to premature IRQ registration before software init=
ialization and clock enablement.
- [High] Out-of-bounds access due to lack of BH synchronization and missing=
 empty-list validation in `at_xdmac_tasklet`.
- [High] Out-of-bounds memory access on empty transfer list in `at_xdmac_tx=
_status()`.
- [High] Contract violation allowing Use-After-Free due to missing `.device=
_synchronize` callback.
- [High] Hardware access fault in `at_xdmac_remove()` due to invalid teardo=
wn order.
- [High] Sleeping PM runtime calls executed while holding an atomic spinloc=
k.
- [High] Use-after-free and memory leak in `at_xdmac_remove()` due to skipp=
ed cleanup loop.
--

--- Patch [4]: [PATCH v3 04/34] dmaengine: at_xdmac: move irq bottom half t=
o dmaengine BH ---
commit 2d0fd6f4bc8cb0e5708fc858f4f33ecff4ef0fc8
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: at_xdmac: move irq bottom half to dmaengine BH

Replace the per-channel tasklet with the shared dmaengine BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

> diff --git a/drivers/dma/at_xdmac.c b/drivers/dma/at_xdmac.c
> index 901971e8bae69..5a970f9f38314 100644
> --- a/drivers/dma/at_xdmac.c
> +++ b/drivers/dma/at_xdmac.c
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
>  	struct dma_async_tx_descriptor *txd;

[Severity: High]
This is a pre-existing issue, but can this lead to an out-of-bounds access
if the transfer list is empty?

If at_xdmac_device_terminate_all() is called, it removes all pending
transfers from atchan->xfers_list but does not synchronize with or cancel
a pending BH worker. If a hardware interrupt schedules the BH just before
termination, at_xdmac_tasklet() will run concurrently or immediately after
terminate_all().

The BH unconditionally invokes list_first_entry() without a list_empty()
check:

desc =3D list_first_entry(&atchan->xfers_list, struct at_xdmac_desc,
                        xfer_node);
if (!desc->active_xfer) {

Since the list was emptied, would this return a bogus pointer and corrupt
memory when accessed?

[Severity: High]
This is also a pre-existing issue, but does at_xdmac_tx_status() have a
similar out-of-bounds memory access risk on an empty transfer list?

When at_xdmac_tx_status() is called, it checks if the cookie status is
DMA_IN_PROGRESS. If a client terminates all transfers and then checks the
status of a pending cookie, at_xdmac_tx_status() traverses the empty list
without a list_empty() check:

desc =3D list_first_entry(&atchan->xfers_list, struct at_xdmac_desc, xfer_n=
ode);
if (!desc->active_xfer) {

Would this also result in a bogus pointer dereference?

[Severity: High]
This is a pre-existing issue, but can this code sleep while holding an
atomic spinlock?

Functions like at_xdmac_tasklet() and at_xdmac_issue_pending() acquire the
atomic spinlock atchan->lock using spin_lock_irqsave(). While holding this
lock, they call into execution paths like at_xdmac_advance_work() and
at_xdmac_start_xfer() that eventually invoke pm_runtime_resume_and_get():

spin_lock_irqsave(&atchan->lock, flags);
at_xdmac_advance_work(atchan);
spin_unlock_irqrestore(&atchan->lock, flags);

Since the device is configured with autosuspend and does not use
pm_runtime_irq_safe(), couldn't this PM runtime call sleep when attempting
to resume the device, violating atomic context rules and risking deadlocks?

> [ ... ]
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
This isn't a bug introduced by this patch, but could this lead to a hard
lockup due to premature IRQ registration before software initialization and
clock enablement?

If an interrupt is asserted right after request_irq() is called in
at_xdmac_probe(), the interrupt handler at_xdmac_interrupt() will execute
while the hardware clock is still disabled.=20

Additionally, atxdmac->dma.chancnt is initialized much later in
dma_async_device_register(). Because it evaluates to 0, the handler's
internal processing loop is completely skipped:

for (i =3D 0; i < atxdmac->dma.chancnt; i++) {
    if (!((1 << i) & pending))
        continue;

This means the device interrupt is never acknowledged or cleared. Would this
result in the ISR spinning infinitely in its "while (pending);" loop,
locking up the CPU?

> [ ... ]
> @@ -2397,7 +2396,7 @@ static int at_xdmac_probe(struct platform_device *p=
dev)
>  		spin_lock_init(&atchan->lock);
>  		INIT_LIST_HEAD(&atchan->xfers_list);
>  		INIT_LIST_HEAD(&atchan->free_descs_list);
> -		tasklet_setup(&atchan->tasklet, at_xdmac_tasklet);
> +		dmaengine_init_bh(&atchan->chan, at_xdmac_tasklet);
> =20
>  		/* Clear pending interrupts. */
>  		while (at_xdmac_chan_read(atchan, AT_XDMAC_CIS))

[Severity: High]
This is a pre-existing issue, but does this violate the dmaengine contract
allowing a use-after-free due to a missing .device_synchronize callback?

According to the dmaengine core rules, any driver utilizing asynchronous
contexts for callbacks (like BH workers) must implement the
.device_synchronize API. at_xdmac does not provide this callback when
registering the DMA device callbacks.

Consequently, dmaengine_synchronize() acts as a no-op. Could clients free
memory buffers associated with a DMA completion while the BH worker is still
accessing them or hasn't finished running?

> [ ... ]
> @@ -2458,7 +2457,7 @@ static void at_xdmac_remove(struct platform_device =
*pdev)
>  	for (i =3D 0; i < atxdmac->dma.chancnt; i++) {
>  		struct at_xdmac_chan *atchan =3D &atxdmac->chan[i];
> =20
> -		tasklet_kill(&atchan->tasklet);
> +		dmaengine_kill_bh(&atchan->chan);
>  		at_xdmac_free_chan_resources(&atchan->chan);
>  	}
>  }

[Severity: High]
This is a pre-existing issue, but could this cause a hardware access fault
in at_xdmac_remove() due to an invalid teardown order?

In at_xdmac_remove(), the driver calls clk_disable_unprepare(atxdmac->clk)
before calling free_irq(). If a spurious interrupt fires or if the ISR is
currently running on another CPU, it will attempt to access device
registers after the clock has been turned off. Might this cause the system
to hang or trigger a synchronous external abort?

[Severity: High]
This is also a pre-existing issue, but does this cause a use-after-free
and memory leak because the cleanup loop is skipped?

In at_xdmac_remove(), dma_async_device_unregister() is called before this
channel cleanup loop. dma_async_device_unregister() internally decrements
atxdmac->dma.chancnt to 0.=20

Consequently, the loop condition (i < atxdmac->dma.chancnt) evaluates to
false immediately, and the loop is skipped entirely. This prevents
dmaengine_kill_bh() and at_xdmac_free_chan_resources() from executing.

If a BH worker is scheduled, could it run after the device memory is freed
by devres, leading to a use-after-free while also leaking all pre-allocated
descriptors?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786384168.gi=
t.allen.lkml@gmail.com?part=3D4
