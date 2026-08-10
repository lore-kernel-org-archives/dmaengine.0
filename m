Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6434142A7A0
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786387849; cv=none; b=HL4ishthQGVt705KczqM4NZOXjxRhW2tTI8iS/mCSsC+l9Ki4YqGNHzGVwazd/ta606e5wG+ex6VCPKz3BKjyGRjQp8Em08451OfVYk3fZ0CUeNXpfopK4malQBpcMRx5srQ5dyMHtyCEFfUWi5s7MN1C+TVALIS4NzYnKJFLt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786387849; c=relaxed/simple;
	bh=2CckLYQXY2ppY0sDXFHzST3x0YUSUGDZLYQw6c2Bv7o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fWF9DsDnmVcNhd3opSe7E0urhuT2RtMf4Bcs2hQrz26Cn9Ge4nlil747FJB9kllggFyuGh3FlWinfG8e0VThqJSvD/rTv+F9Ul8bVtcE6T9OHC3OBUS75wCbbxfWarh0OyDirh56WFrsLJMvnJy9cArCBbOiOBoFjb2YpF2O0WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=impG/O6A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="impG/O6A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 090CE1F000E9;
	Mon, 10 Aug 2026 18:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786387846;
	bh=/BqKD5iPn65g8Wv7ea7S30vfdM6D7+/uE+8AQVh/T3c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=impG/O6AV9im+6Wb2yk6/mXy6uonPcGAbxsFqx5h7VrryMykeS4WkLuAps65LEJgE
	 53KWreUkBDJl895aQ9yyp50BmCyH31kyqyox+FwgtmXLEovydMe75mR30+c0XTCNwt
	 4jkiqrpXnBDtv9U8PyMkxEoTW5+I4Gl6O15uaxdIonAQOsXHm0hPgeOwL7nWkq62y7
	 uFcZ9Pwa2a2vkA/m+uRfQw+2TSPqF7FzMb7n8ga659ZslhF6Ps+fVVE1a26RARHaNr
	 sSclk9ekGfjtFB79GptdMJZtppfVjONc+Q4CeAi9ffrDoufayNFIjwuw2SyPkYuiUh
	 XaMmD9veKMt9w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 26/34] dmaengine: mpc512x: route callbacks via
 channel BH
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <c4ed3eb4259edcb339eb69466aba216d51c93559.1786384169.git.allen.lkml@gmail.com>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <c4ed3eb4259edcb339eb69466aba216d51c93559.1786384169.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 18:50:45 +0000
Message-Id: <20260810185046.090CE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

New issues:
- [High] Missing dmaengine_kill_bh() in mpc_dma_remove() leads to Use-After=
-Free of per-channel BH work upon driver unbind.

Pre-existing issues:
- [High] Concurrent execution of completion processing can lead to backward=
 progression of completed_cookie and out-of-order callbacks.
- [High] Inline descriptor processing in `prep_` functions executes callbac=
ks synchronously across all channels, risking deadlocks.
- [High] Missing `device_synchronize` implementation in dma_device to flush=
 the deferred completion work.
- [High] Interrupt handler is requested before tasklet and locks are initia=
lized, and tasklet cleanup is missing in probe error paths.
- [High] mpc_dma_device_terminate_all does not clear mchan->completed, lead=
ing to BUG_ON crash in free_chan_resources.
--

--- Patch [26]: [PATCH v3 26/34] dmaengine: mpc512x: route callbacks via ch=
annel BH ---
commit a8db08e8595cca1d5c7b07d2e006d85529289c2e
Author: Allen Pais <allen.lkml@gmail.com>
Subject: dmaengine: mpc512x: route callbacks via channel BH

This patch modifies the MPC512x DMA driver to handle descriptor completions
through per-channel bottom halves instead of a global tasklet. It introduces
workqueue scheduling and cleanup for the channels to process callbacks, whi=
le
leaving the tasklet to manage IRQ and error handling.

> diff --git a/drivers/dma/mpc512x_dma.c b/drivers/dma/mpc512x_dma.c
> index 0adc8e01057e1..19e0b2f1b2aa3 100644
> --- a/drivers/dma/mpc512x_dma.c
> +++ b/drivers/dma/mpc512x_dma.c
[ ... ]
> +static void mpc_dma_process_chan_completed(struct mpc_dma_chan *mchan)
>  {
>  	dma_cookie_t last_cookie =3D 0;
> -	struct mpc_dma_chan *mchan;
>  	struct mpc_dma_desc *mdesc;
>  	struct dma_async_tx_descriptor *desc;
>  	unsigned long flags;
>  	LIST_HEAD(list);
> -	int i;
> =20
> -	for (i =3D 0; i < mdma->dma.chancnt; i++) {
> -		mchan =3D &mdma->channels[i];
> +	/* Get all completed descriptors */
> +	spin_lock_irqsave(&mchan->lock, flags);
> +	if (!list_empty(&mchan->completed))
> +		list_splice_tail_init(&mchan->completed, &list);
> +	spin_unlock_irqrestore(&mchan->lock, flags);
> =20
> -		/* Get all completed descriptors */
> -		spin_lock_irqsave(&mchan->lock, flags);
> -		if (!list_empty(&mchan->completed))
> -			list_splice_tail_init(&mchan->completed, &list);
> -		spin_unlock_irqrestore(&mchan->lock, flags);
> +	if (list_empty(&list))
> +		return;
> =20
> -		if (list_empty(&list))
> -			continue;
> +	/* Execute callbacks and run dependencies */
> +	list_for_each_entry(mdesc, &list, node) {
> +		desc =3D &mdesc->desc;
> =20
> -		/* Execute callbacks and run dependencies */
> -		list_for_each_entry(mdesc, &list, node) {
> -			desc =3D &mdesc->desc;
> +		dmaengine_desc_get_callback_invoke(desc, NULL);
> =20
> -			dmaengine_desc_get_callback_invoke(desc, NULL);
> +		last_cookie =3D desc->cookie;
> +		dma_run_dependencies(desc);
> -		}
> +	}
> =20
> -		/* Free descriptors */
> -		spin_lock_irqsave(&mchan->lock, flags);
> -		list_splice_tail_init(&list, &mchan->free);
> -		mchan->chan.completed_cookie =3D last_cookie;
> -		spin_unlock_irqrestore(&mchan->lock, flags);
> -	}
> +	/* Free descriptors */
> +	spin_lock_irqsave(&mchan->lock, flags);
> +	list_splice_tail_init(&list, &mchan->free);
> +	mchan->chan.completed_cookie =3D last_cookie;
> +	spin_unlock_irqrestore(&mchan->lock, flags);
> +}

[Severity: High]
This is a pre-existing issue, but can concurrent execution of completion
processing lead to out-of-order callbacks or backward progression of
completed_cookie?

If mpc_dma_prep_memcpy() calls mpc_dma_process_completed() synchronously
while the BH work executes concurrently, both paths take mchan->lock,
splice a batch of completed descriptors to a local list, and drop the lock
to execute callbacks.=20

If Thread A splices older descriptors and Thread B subsequently splices new=
er
ones, Thread B might finish first and update completed_cookie. When Thread A
finishes, could it overwrite completed_cookie with the older value?

> =20
> -/* process completed descriptors */
> -static void mpc_dma_process_completed(struct mpc_dma *mdma)
> +/* process completed descriptors */
> +static void mpc_dma_process_completed(struct mpc_dma *mdma)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < mdma->dma.chancnt; i++)
> +		mpc_dma_process_chan_completed(&mdma->channels[i]);
>  }

[Severity: High]
This is a pre-existing issue, but does iterating over all channels here risk
cross-channel deadlocks?

When mpc_dma_prep_memcpy() or mpc_dma_prep_slave_sg() run out of free
descriptors, they call mpc_dma_process_completed() directly, running
callbacks inline for all channels.=20

If a client calls the prep_ function with a lock held, and a callback for
another channel attempts to acquire the same lock, could this cause an ABBA
deadlock?

[ ... ]
> @@ -551,6 +568,8 @@ static void mpc_dma_free_chan_resources(struct dma_ch=
an *chan)
>  	unsigned long flags;
>  	LIST_HEAD(descs);
> =20
> +	dmaengine_kill_bh(&mchan->chan);
> +
>  	spin_lock_irqsave(&mchan->lock, flags);
> =20
>  	/* Channel must be idle */

[Severity: High]
This is a pre-existing issue, but does mpc_dma_device_terminate_all() leave
completed descriptors on the list, causing a crash here?

mpc_dma_device_terminate_all() disables channel requests and splices
prepared, queued, and active lists back to the free list, but it completely
ignores mchan->completed.

If a hardware completion interrupt fires just before terminate_all is calle=
d,
completed descriptors remain in mchan->completed. When the client subsequen=
tly
calls dma_release_channel(), will mpc_dma_free_chan_resources() assert
BUG_ON(!list_empty(&mchan->completed)) and crash the kernel?

[ ... ]
> @@ -1007,6 +1026,7 @@ static int mpc_dma_probe(struct platform_device *op)
>  		INIT_LIST_HEAD(&mchan->completed);
> =20
>  		spin_lock_init(&mchan->lock);
> +		dmaengine_init_bh(&mchan->chan, mpc_dma_chan_bh);
>  		list_add_tail(&mchan->chan.device_node, &dma->channels);
>  	}
> =20

[Severity: High]
Is it possible for per-channel BH work to remain queued after the driver is
unbound?

The new workqueue is initialized here, but looking at mpc_dma_remove(), it
only calls tasklet_kill(&mdma->tasklet) and does not iterate over channels
to call dmaengine_kill_bh().

Could this cause the workqueue to execute mpc_dma_chan_bh() on freed memory=
=20
if the driver is forcefully unbound via sysfs while DMA is active?

[Severity: High]
This is a pre-existing issue, but is the driver missing a device_synchronize
callback?

Without this callback implemented in struct dma_device,
dmaengine_terminate_sync() will return immediately without waiting for
the bottom-half to finish.

If the client frees its DMA buffers immediately after terminate_sync()
returns, will the pending workqueue execute callbacks that access the
freed memory?

[Severity: High]
This is a pre-existing issue, but is it safe to request the interrupt before
the tasklet and locks are initialized?

In mpc_dma_probe(), request_irq() is called before tasklet_setup(),
per-channel list initialization, and spin_lock_init().

If a pending interrupt from the hardware fires immediately, could the ISR
execute on uninitialized spinlocks and lists, or call tasklet_schedule()
on a zero-initialized tasklet? Additionally, if probe fails later, the
error path frees the IRQ but fails to call tasklet_kill(), which could
allow a pending tasklet to run after devres frees the mdma structure.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786384168.gi=
t.allen.lkml@gmail.com?part=3D26
