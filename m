Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF952737F9
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 21:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785187545; cv=none; b=EaKgCpXvt1H65ffXtWDbEKcXJvygm+dduI+yhF4IKctGjAkAwvgfF/AkilefvStJDzfr5sxJtZ0KgHDlOgvQac5qLMCB0VStieBNnST8Nk90oZKhM4OwFCXmClwXGNNtbXz1i03Pp7p9xW5gX3lkc67GDk79IaYDc+Fa+zbbLJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785187545; c=relaxed/simple;
	bh=5sTJ5/q74/9X4eiJIB6s8WI6tMlJwH/eUAcaPAKewuQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RKA/R4Q4LNg+6In70t0d0LXLtUDykohChWB/XR+Iv9ux3pkVx6qTuFzhSu/1uGwMOw8XtMALKq8iLNCU8gElojbJV1EeUiTYe3RPt+ii6llVMSIeK+G0WGYesnwMb8/SSmNkivub9I+pAZlmZwA1LGfIOvj7Zbjvp+hY9+I0jYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lrtt/HrJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lrtt/HrJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BC011F000E9;
	Mon, 27 Jul 2026 21:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785187544;
	bh=kSFJdnFYlufuEnzLEbT4pMy4Ml1AXeBAQjIjGQOiPYg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lrtt/HrJA7DLctemmCzp++MLYjmWtZRfToBiPMi1Be5YLw4sWiRL4AeI/46qlDIBZ
	 6+JTn+E5c1z12Up3Z9yq51O918A68MuLR4jWChcdGoIC1atji+O8OQOfqaQIuP7uvt
	 Wdwy5ll23t6IL5QDK+RPIv5FKIBJpRay3pjtJlaDPDN00O8MJRCiMrWILKpfvtMFEx
	 10bB3J80FQTjlz2adlrdRUAs7ruLHBxhBmAmyKVlKUhZ6Y///CMSWAHEEziuykpIu4
	 metSw3ibZM79ihOjWfb75JKKEChQo2pwl3FB1HheJwK/MlK5CNOVhxcT4qoryCp4St
	 XZU0KejbNS3+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 62/64] dmaengine: hidma: defer callbacks via channel
 BH
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: dmaengine@vger.kernel.org, Frank.Li@kernel.org, vkoul@kernel.org
In-Reply-To: <1648cb3a6b6c85009831e1dd263a6336bd31638a.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <1648cb3a6b6c85009831e1dd263a6336bd31638a.1785183549.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 21:25:43 +0000
Message-Id: <20260727212544.1BC011F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

New issues:
- [Critical] The per-channel bottom-half (BH) is cancelled too late during =
driver unbind, allowing it to execute after the hardware context is destroy=
ed and dereference a NULL pointer.
- [High] Missing synchronization and cancellation of BH during channel term=
ination leads to use-after-free and memory leaks.

Pre-existing issues:
- [Critical] List manipulation without holding the channel lock in `hidma_t=
erminate_channel` causes list corruption and data races.
- [High] Sleeping function called in atomic context and unsafe PM hardware =
access.
- [High] Unbalanced pm_runtime usage counter causing premature device suspe=
nsion.
- [High] Invalid pointer dereference due to missing list emptiness check in=
 `hidma_callback`.
--

--- Patch [62]: [PATCH v2 62/64] dmaengine: hidma: defer callbacks via chan=
nel BH ---
commit 3c9c3e0127e064313b46165b6ad21a91d6575ed1
Author: Allen Pais <allen.lkml@gmail.com>
Subject: dmaengine: hidma: defer callbacks via channel BH

Move descriptor callback processing out of the low-level completion
path and schedule it through per-channel BH work. Drain that work while
freeing channels so callbacks cannot outlive channel storage.

> diff --git a/drivers/dma/qcom/hidma.c b/drivers/dma/qcom/hidma.c
> index c939635be21d2..1f875a499ab3f 100644
> --- a/drivers/dma/qcom/hidma.c
> +++ b/drivers/dma/qcom/hidma.c
> @@ -90,7 +90,13 @@ static inline struct hidma_chan *to_hidma_chan(struct =
dma_chan *dmach)
> =20
>  static void hidma_free(struct hidma_dev *dmadev)
>  {
> -	INIT_LIST_HEAD(&dmadev->ddev.channels);
> +	struct hidma_chan *mchan, *next;
> +
> +	list_for_each_entry_safe(mchan, next, &dmadev->ddev.channels,
> +				 chan.device_node) {
> +		dma_chan_kill_bh(&mchan->chan);

[Severity: Critical]
Does flushing the bottom half here happen too late in the teardown sequence?

During driver unbind, hidma_remove() calls hidma_ll_uninit() before
hidma_free().

hidma_ll_uninit() explicitly sets lldev->trepool =3D NULL. When hidma_free()
then calls dma_chan_kill_bh(), it synchronously flushes the pending bottom
half:

hidma_chan_bh()
  hidma_process_completed()
    hidma_ll_status()
      tre =3D &lldev->trepool[tre_ch];

Since trepool is already NULL, won't this cause a deterministic NULL pointer
dereference?

> +		list_del(&mchan->chan.device_node);
> +	}
>  }
> =20
>  static unsigned int nr_desc_prm;

[ ... ]

> @@ -155,6 +161,13 @@ static void hidma_process_completed(struct hidma_cha=
n *mchan)
>  	}
>  }
> =20
> +static void hidma_chan_bh(struct dma_chan *chan)
> +{
> +	struct hidma_chan *mchan =3D to_hidma_chan(chan);
> +
> +	hidma_process_completed(mchan);
> +}
> +

[Severity: High]
Does the bottom half work need to be cancelled when a client terminates the
channel?

When a client calls dma_release_channel() or dmaengine_terminate_sync(), the
framework eventually calls hidma_free_chan_resources(), which frees the
descriptors.

If the bottom half executes concurrently or after this teardown:

hidma_chan_bh()
  hidma_process_completed()
    list_for_each_entry_safe(mdesc, next, &list, node) {
      dmaengine_desc_callback_invoke(&cb, &result);
    }

Won't it dereference descriptors that were just freed, causing a use-after-=
free,
and subsequently leak orphaned descriptors onto mchan->free?

>  /*
>   * Called once for each submitted descriptor.
>   * PM is locked once for each descriptor that is currently
> @@ -181,7 +194,7 @@ static void hidma_callback(void *data)
>  	}
>  	spin_unlock_irqrestore(&mchan->lock, irqflags);

[Severity: Critical]
This is a pre-existing issue, but does hidma_terminate_channel() safely
handle concurrent callbacks?

In hidma_terminate_channel(), the lock is dropped before the hardware is
paused:

hidma_terminate_channel()
  spin_unlock_irqrestore(&mchan->lock, irqflags);
  rc =3D hidma_ll_disable(dmadev->lldev);

During this window, a completed transaction can trigger hidma_callback()
which modifies the list without holding a lock on the local list:

hidma_callback()
  if (mdesc->node.next) {
    list_move_tail(&mdesc->node, &mchan->completed);
  }

Since hidma_terminate_channel() subsequently modifies the same list
locklessly, can this race with hidma_prep_dma_memcpy() and cause severe
list corruption?

[Severity: High]
This is a pre-existing issue, but does hidma_callback() correctly handle an
empty active list?

When updating the running descriptor, the code uses list_first_entry():

hidma_callback()
  mchan->running =3D list_first_entry(&mchan->active,
                                    struct hidma_desc, node);

If mchan->active is empty, list_first_entry() does not return NULL but
rather an invalid pointer computed from the list head itself.

If hidma_tx_status() is subsequently called, won't it dereference this
invalid pointer via mchan->running->desc.cookie and cause an out-of-bounds
memory read?

> -	hidma_process_completed(mchan);
> +	dma_chan_schedule_bh(&mchan->chan);
> =20
>  	if (queued) {
>  		pm_runtime_mark_last_busy(dmadev->ddev.dev);
>  		pm_runtime_put_autosuspend(dmadev->ddev.dev);

[Severity: High]
This isn't a bug introduced by this patch, but is the pm_runtime usage
counter decrement balanced with the increment?

In hidma_issue_pending(), pm_runtime_get() is called only once per
submitted batch of descriptors.

However, the hardware triggers hidma_callback() for each individual
descriptor, and pm_runtime_put_autosuspend() is unconditionally called here
for every single descriptor.

If a client submits a batch of multiple descriptors, won't this underflow
the PM usage count and trigger device auto-suspension while hardware
operations are still in flight?

[Severity: High]
This is a pre-existing issue, but does the tasklet safely call sleeping PM
functions?

The driver implements hidma_issue_task() as a tasklet, which runs in
softirq (atomic) context, but it calls pm_runtime_get_sync():

hidma_issue_task()
  pm_runtime_get_sync(dmadev->ddev.dev);

Since pm_runtime_get_sync() will sleep if the device is suspended, doesn't
this trigger a sleeping in atomic bug?

Furthermore, in hidma_issue_pending(), if the asynchronous pm_runtime_get()
returns 0, the code falls through and immediately calls hidma_ll_start().
Doesn't this access hardware registers while the device is still unclocked
or powered off?

>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785183549.gi=
t.allen.lkml@gmail.com?part=3D62
