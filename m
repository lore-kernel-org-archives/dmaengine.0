Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B9536604F
	for <dmaengine@vger.kernel.org>; Sat, 18 Jul 2026 05:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784353524; cv=none; b=kSR/O27z7r2O9T1K5Fqvg0kUc8qkspP4JZCI+Cav378EzCMu4ls7KiHnNY9pBlMXUjgsGVwzJ3EMcbSlXZZYr+qX8xpXcLuNMhqaA2uu1hQa3hJXr8SAyxST7Fli5S5sGtkIgqBS79Tggv7taOl44Qx/xU8aYg+JczADo4zJTTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784353524; c=relaxed/simple;
	bh=B5d7c9EuRRgbJGp0DUD+tJScuLpElIfe1cq7xIljZmg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XJvGbgKKWWsIZsspzq6rSUGpK6ocfvE0CiwrN1OCoB262fplyQOBiywgC6c6yad50hNtcQRQasbzzv2xkOvYc4gEuV2g0pWfOZE92/0O7D/PyRTNmzNxNLp087kAkKWjGRpYoqn06b29E3jqwxr/kWKde8rrrxESLmxQ8AVLKNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B9Lgzu7e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B9Lgzu7e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F8A41F000E9;
	Sat, 18 Jul 2026 05:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784353522;
	bh=TRjPpLWt25dQNIwq7t0ssbd2JGTT4AQV8phlVVti0uk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B9Lgzu7e2f1I32Ki1DxZV2lhb3yAoL55mmY+ZwUPyttXSy0z3IX/iU4GNSTPEVyl2
	 krs7rgM2mXUKM3l8YceAjckNkxcBIxoB7LoE57EWrD1LWydemyLIP0rQrUkap4M4GA
	 FYyqFKNXH8322OiAak7jUXgH6USR94PbBBIGLYxKwniI+lYqGf/Sy0SxXpbwzXym6k
	 U5/2ZxF4Eh0QR3Q/xdFjuX1fFP7MusGyFfs84S4LjkpQLcluHb54RYdrrAlQvR782D
	 jNZvy+zSom5y0HU/aVSMtd91bTjPqPnwe6MD3t83h6tB/7VMnLKkGQAluPTKgBSs/N
	 SWSRjL4UG2cuQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: fsl_raid: don't invoke client callback under
 desc_lock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260718053010.3074329-1-rosenp@gmail.com>
References: <20260718053010.3074329-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 18 Jul 2026 05:45:21 +0000
Message-Id: <20260718054522.5F8A41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unconditional list extraction without list_empty checks in fsl_re_=
free_chan_resources() causes list corruption and kernel panic.
- [High] fsl_re_desc_done() marks the DMA cookie complete before unmapping =
the DMA buffer, causing a TOCTOU race condition.
- [High] Tearing down channel ring resources before unregistering the DMA d=
evice in fsl_re_remove() leads to a Use-After-Free.
- [High] Native CPU variables are directly assigned to __be32 hardware desc=
riptor fields without endianness conversions.
--

--- Patch [1]: [PATCH] dmaengine: fsl_raid: don't invoke client callback un=
der desc_lock ---
commit 1f02130ec4e2af9477cecbe2f9da0fc239f69864
Author: Rosen Penev <rosenp@gmail.com>
Subject: dmaengine: fsl_raid: don't invoke client callback under desc_lock

This patch modifies the descriptor dequeue process to collect completed
descriptors into a local list under the lock. It then releases the lock and
invokes the callbacks before moving the descriptors to the ack queue, which
prevents deadlocks when new work is submitted.

> diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
> --- a/drivers/dma/fsl_raid.c
> +++ b/drivers/dma/fsl_raid.c
[ ... ]
> @@ -196,6 +196,17 @@ static void fsl_re_dequeue(struct tasklet_struct *t)
>  			 FSL_RE_RMVD_JOB(1));
>  	}
>  	spin_unlock_irqrestore(&re_chan->desc_lock, flags);
> +
> +	/* Invoke the client callbacks outside the channel lock. The callback
> +	 * may submit new work which re-acquires desc_lock, so holding it here
> +	 * would deadlock.
> +	 */
> +	list_for_each_entry_safe(desc, _desc, &completed, node) {
> +		fsl_re_desc_done(desc);

[Severity: High]
This is a pre-existing issue, but does fsl_re_desc_done() signal completion
too early?

Looking at fsl_re_desc_done(), it marks the DMA cookie complete before
unmapping the memory:

drivers/dma/fsl_raid.c:fsl_re_desc_done() {
	dma_cookie_complete(&desc->async_tx);
	dma_descriptor_unmap(&desc->async_tx);
	dmaengine_desc_get_callback_invoke(&desc->async_tx, NULL);
}

If a client polling for completion observes the complete cookie on another
CPU, could it access the destination buffer before the cache invalidation
or bounce buffer sync completes?

> +		spin_lock_irqsave(&re_chan->desc_lock, flags);
> +		list_move_tail(&desc->node, &re_chan->ack_q);
> +		spin_unlock_irqrestore(&re_chan->desc_lock, flags);
> +	}
>  }

[Severity: High]
This is a pre-existing issue, but can fsl_re_free_chan_resources() crash if
the free_q empties prematurely?

When a client releases a channel with pending or unacknowledged descriptors,
the loop executes alloc_count times without checking if the list is empty:

drivers/dma/fsl_raid.c:fsl_re_free_chan_resources() {
	...
	while (re_chan->alloc_count--) {
		desc =3D list_first_entry(&re_chan->free_q,
					struct fsl_re_desc,
					node);
	...
}

Does this result in an invalid pointer dereference and list corruption when
list_first_entry() returns the list head itself?

[Severity: High]
This is a pre-existing issue, but does driver removal risk a use-after-free
if a DMA client is still active?

During unbind, fsl_re_remove() destroys the channel rings before
unregistering the DMA device:

drivers/dma/fsl_raid.c:fsl_re_remove() {
	...
	for (i =3D 0; i < re_priv->total_chans; i++)
		fsl_re_remove_chan(re_priv->re_jrs[i]);

	/* Unregister the driver */
	dma_async_device_unregister(&re_priv->dma_dev);
	...
}

If a client issues pending requests in this window, could
fsl_re_issue_pending() copy descriptor structures into the freed ring buffe=
r?

[Severity: High]
This is a pre-existing issue, but does this driver miss endianness conversi=
ons
on hardware structures?

Both fill_cfd_frame() and fsl_re_init_desc() directly assign native CPU
variables to __be32 hardware fields:

drivers/dma/fsl_raid.c:fill_cfd_frame() {
	...
	cf[index].efrl32 =3D efrl;
	cf[index].addr_high =3D upper_32_bits(addr);
	cf[index].addr_low =3D lower_32_bits(addr);
	...
}

drivers/dma/fsl_raid.c:fsl_re_init_desc() {
	...
	desc->hwdesc.lbea32 =3D upper_32_bits(paddr);
	desc->hwdesc.addr_low =3D lower_32_bits(paddr);
	...
}

Will this cause hardware faults or silent data corruption when executed on a
Little-Endian architecture?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260718053010.3074=
329-1-rosenp@gmail.com?part=3D1
