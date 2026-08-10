Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDDF43847B
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786387528; cv=none; b=sgy6r6CMngNejtYIiFnt0gPqmh7tQFe2csrKe5Uun8d0wu/tX+i8nWldHOhGPMBKcbXYiklqcKP85ZzHrmTorEwyUAVr7qtQ8MPNmPgikEIRTBRfNLlZkSYobR5IejDcRMYnhMKVZIUA44Uz9ViK0PXUIRQ/+DqAKUN2qGSKzOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786387528; c=relaxed/simple;
	bh=JsN9X3VqADDLFGz0U2osGeRNCG9PpOxSGsPMGdF8TjI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kWWxDa/5Mu5CbfWbRJguERPIvisf4O/qPrCdifd07F7psY6UJ+x7/iSm6e92+wAXSKUYSywXeYyRLSosF0RvMWfzb4oWEGQNoMpLu261bMidCP4GKvqLNJjzWLKvXBwC1T2WI1CMX4veGQzlQUKbFc3DMLjpeJORL2y212niNvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cLtwZZx2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cLtwZZx2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8FFB1F000E9;
	Mon, 10 Aug 2026 18:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786387527;
	bh=CcPpL1YIb4n+f29qVEvfNgKcnrj3ja4XXjn2UTojyoo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cLtwZZx2IQCZHbzEYl0VkdfnE5c6g4Kh7/wfEC7ir+SkSo0MNdJpxBiwNdwYPZES3
	 C+j7NH4Qg2CkgexQZUUiqtogNVp52pNOabKq91pot+lVq8u5GQDr70vZIuGNi5BmSC
	 1kqMqgCpHDQqqJGnwD+xgMfJx+6+oUH4l10vkr09NVZR5PUkfmiLBhI4I5w8tKfnr3
	 yIPjECVrzyc+2I8Jw1gglfodCdo+mxkWBDYb6LDa4mewTcP3cbTPCvEsYG9m5wyrPq
	 W+b6/0ch2/Zt0033hEt5wVMB0CM3vLPZlpTSWjtGFN90YNPU7jpaDrTlwVV3Be0bZ7
	 uycdQ3CDWfdGg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 32/34] dmaengine: hidma: defer callbacks via channel
 BH
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <702687c28f440bf017c6e57f630bb65d22d3b217.1786384169.git.allen.lkml@gmail.com>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <702687c28f440bf017c6e57f630bb65d22d3b217.1786384169.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 18:45:25 +0000
Message-Id: <20260810184526.D8FFB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Use-After-Free of client callbacks and descriptors due to missing =
BH synchronization on channel release.
- [High] NULL pointer dereference in `hidma_remove` due to incorrect teardo=
wn ordering.

Pre-existing issues:
- [High] List corruption due to data race on `mchan->free` between channel =
termination and BH execution.
--

--- Patch [32]: [PATCH v3 32/34] dmaengine: hidma: defer callbacks via chan=
nel BH ---
commit d556674c4ac10d8d6acb039e370582921643ddd7
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: hidma: defer callbacks via channel BH
   =20
Move descriptor callback processing out of the low-level completion
path and schedule it through per-channel BH work. Drain that work while
freeing channels so callbacks cannot outlive channel storage.

> diff --git a/drivers/dma/qcom/hidma.c b/drivers/dma/qcom/hidma.c
> index 7a7f302a96991..82790682cfc88 100644
> --- a/drivers/dma/qcom/hidma.c
> +++ b/drivers/dma/qcom/hidma.c
> @@ -91,7 +91,13 @@ static inline struct hidma_chan *to_hidma_chan(struct =
dma_chan *dmach)
> =20
>  static void hidma_free(struct hidma_dev *dmadev)
>  {
> -	INIT_LIST_HEAD(&dmadev->ddev.channels);
> +	struct hidma_chan *mchan, *next;
> +
> +	list_for_each_entry_safe(mchan, next, &dmadev->ddev.channels,
> +				 chan.device_node) {
> +		dmaengine_kill_bh(&mchan->chan);

[Severity: High]
Can this cause a NULL pointer dereference during device teardown?

During module unload, hidma_remove() calls hidma_ll_uninit() before
hidma_free():

drivers/dma/qcom/hidma.c:hidma_remove() {
    ...
    hidma_ll_uninit(dmadev->lldev);
    hidma_free(dmadev);
    ...
}

hidma_ll_uninit() clears the lower-level structures and sets lldev->trepool
to NULL.

When hidma_free() then calls dmaengine_kill_bh(), it flushes any pending
BH work, which calls hidma_process_completed() and eventually
hidma_ll_status().

drivers/dma/qcom/hidma_ll.c:hidma_ll_status() {
    ...
    tre =3D &lldev->trepool[tre_ch];
    ...
}

Since lldev->trepool is already NULL, does this crash if there is pending
work?

> +		list_del(&mchan->chan.device_node);
> +	}
>  }
> =20
>  static unsigned int nr_desc_prm;
> @@ -156,6 +162,13 @@ static void hidma_process_completed(struct hidma_cha=
n *mchan)
>  	}
>  }
> =20
> +static void hidma_chan_bh(struct dma_chan *chan)
> +{
> +	struct hidma_chan *mchan =3D to_hidma_chan(chan);
> +
> +	hidma_process_completed(mchan);

[Severity: High]
This is a pre-existing issue, but does moving the completion handling to an
asynchronous BH significantly widen a data race window?

In hidma_terminate_channel(), descriptors are moved to the free list without
holding mchan->lock:

drivers/dma/qcom/hidma.c:hidma_terminate_channel() {
    ...
        /* move myself to free_list */
        list_move(&mdesc->node, &mchan->free);
    ...
}

If a client terminates a channel while a completion is pending, this unlock=
ed
access can run concurrently with the BH executing hidma_process_completed():

drivers/dma/qcom/hidma.c:hidma_process_completed() {
    ...
        spin_lock_irqsave(&mchan->lock, irqflags);
        list_move(&mdesc->node, &mchan->free);
        spin_unlock_irqrestore(&mchan->lock, irqflags);
    ...
}

Can this concurrent modification corrupt the mchan->free list?

> +}
> +
>  /*
>   * Called once for each submitted descriptor.
>   * PM is locked once for each descriptor that is currently

[ ... ]

> @@ -204,6 +217,7 @@ static int hidma_chan_init(struct hidma_dev *dmadev, =
u32 dma_sig)
>  	mchan->dmadev =3D dmadev;
>  	mchan->chan.device =3D ddev;
>  	dma_cookie_init(&mchan->chan);
> +	dmaengine_init_bh(&mchan->chan, hidma_chan_bh);

[Severity: High]
Does this leave the BH work unsynchronized during channel release?

If a client calls dmaengine_terminate_sync() and dma_release_channel(), the
driver currently lacks a device_synchronize callback, so
dmaengine_terminate_sync() returns immediately.

When hidma_free_chan_resources() is called, it frees descriptors:

drivers/dma/qcom/hidma.c:hidma_free_chan_resources() {
    ...
    hidma_terminate_channel(dmach);
    ...
    kfree(mdesc);
    ...
}

Since dmaengine_kill_bh() isn't called here, can an unflushed BH execute
hidma_process_completed() later and cause a use-after-free on these
descriptors and the client callbacks?

> =20
>  	INIT_LIST_HEAD(&mchan->free);
>  	INIT_LIST_HEAD(&mchan->prepared);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786384168.gi=
t.allen.lkml@gmail.com?part=3D32
