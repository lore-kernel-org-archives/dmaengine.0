Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87BF36A358
	for <dmaengine@vger.kernel.org>; Fri, 28 Aug 2026 15:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787931208; cv=none; b=bbJ3Qnsr5MHhIG2QTC1ryG0oLgmVWAEokHSpNTrqLzBRN/qNeb79IrVbpfLZfqvqrddmSYtKihNY4cVSq/fI6m42Dh+bdGppGLlRt07LiQoQ9Rg7SSwCYfcWFufZE3j0RfFgvTEzPdBr/V1atsKejOeeB3mgZBaMH4bvrzC6pfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787931208; c=relaxed/simple;
	bh=nGe7Vur09h6CDjaWdIGzFFJMcx3j8KUJF8JUjWh66K4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fOCtzXhymtM0925MHnWoBE7b+GwK0lvlocaY9gCapLiKBftcWriVUvZ94e5ObP083IwFrwaChwU5t9zJikPKFJQLeaftAZUUdESyiue9T+27vrar4iUVJfnDfdRzuXKEOSKZFnGrFDzHVZQRFd1bGYh/6UAcuOH8Y+AG9fMvA2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HIv9m4Ub; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HIv9m4Ub"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3878C1F000E9;
	Fri, 28 Aug 2026 15:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787931206;
	bh=G4t3xr6Qumts6ygU76mLJaXu4NA29QBmzo0Aw428ycs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HIv9m4UbRpMBPxDvMmj0j1ShjlRGDNv9zQTMPPswcyDYwHAO66g62EQMr7u7nQEGP
	 TZvDSd/hlQupCPPHwBVQcTYkqqEe1MZvFPNShAxdFQM8CezY/YOTMhu0MnbOknMVCN
	 EdbTGV9vlD0Z2Fd25HMPtDM92YjgBYRTXUNZE2uWiEOykSwlhaWIjW7xc9r8v5NwZh
	 mxGhNPQzyMADjkNvMuZWFjpSfmw0/rSELVdPTn1KLTfcOIO6xMs72jAx2VGL6fBgZ1
	 Lx4tKFnwR18lHyptE/GkXbOvPKQ+eEGf0wD6dP+nccpjol8RSrL9jNJihISv5htUBa
	 iE9lU9jtj8Lbg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] dmaengine: dmatest: fix race between wait for thread
 and thread start
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cosmin Tanislav" <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260828151024.2081478-1-cosmin-gabriel.tanislav.xa@renesas.com>
References: <20260828151024.2081478-1-cosmin-gabriel.tanislav.xa@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 15:33:25 +0000
Message-Id: <20260828153326.3878C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Lockless list traversal in `is_threaded_test_run()` leads to a Use=
-After-Free if tests are stopped concurrently via sysfs.
- [High] DMA buffers are unmapped while the DMA channel might still be acti=
ve on test timeout.
--

commit 4cbd6a56dbdbb6c68ca92f35dcbdd675bb35d0b1
Author: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

dmaengine: dmatest: fix race between wait for thread and thread start

This commit clears the pending flag before waking up the worker thread to
prevent a race condition where dmatest_init() stops waiting early. This avo=
ids
a situation where kthread_stop() interrupts the wait during module removal,
which previously caused an incorrect timeout message.

> diff --git a/drivers/dma/dmatest.c b/drivers/dma/dmatest.c
> index 2ae3469397f37..f654a00e00404 100644
> --- a/drivers/dma/dmatest.c
> +++ b/drivers/dma/dmatest.c
> @@ -610,7 +610,6 @@ static int dmatest_func(void *data)
>  	ret =3D -ENOMEM;
> =20
>  	smp_rmb();
> -	thread->pending =3D false;
>  	info =3D thread->info;
>  	params =3D &info->params;
>  	chan =3D thread->chan;

[Severity: High]
This isn't a bug introduced by this patch, but it is a pre-existing issue.
Are the DMA buffers unmapped while the DMA channel might still be active on=
 a
test timeout?

When a test times out (which this patch helps prevent during teardown),
dmatest_func() jumps to unmap the buffers:

drivers/dma/dmatest.c:dmatest_func() {
    ...
		if (!done->done) {
			result("test timed out", total_tests, src->off, dst->off,
			       len, 0);
			goto error_unmap_continue;
		}
    ...
error_unmap_continue:
		dmaengine_unmap_put(um);
		failed_tests++;
    ...
}

However, the hardware DMA transfer is never explicitly terminated via
dmaengine_terminate_sync() before continuing to the next iteration.

If swiotlb bounce buffers are in use, unmapping returns the bounce buffer to
the free pool while the DMA engine is still running and writing to it. When
the bounce buffer is reallocated to another device (e.g., a network card), =
the
stuck DMA engine will corrupt that device's data.

Could we explicitly terminate the DMA transfer on timeout before unmapping?

> @@ -1141,6 +1140,7 @@ static void run_pending_tests(struct dmatest_info *=
info)
> =20
>  		thread_count =3D 0;
>  		list_for_each_entry(thread, &dtc->threads, node) {
> +			thread->pending =3D false;
>  			wake_up_process(thread->task);
>  			thread_count++;
>  		}

[Severity: High]
This isn't a bug introduced by this patch, but it is a pre-existing issue.
Does wait_event() evaluate is_threaded_test_run() locklessly, causing a
use-after-free if tests are stopped concurrently via sysfs?

As mentioned in the commit message, dmatest_init() calls wait_event():

drivers/dma/dmatest.c:dmatest_init() {
    ...
	if (params->iterations && wait)
		wait_event(thread_wait, !is_threaded_test_run(info));
    ...
}

The wait_event() macro evaluates the condition continuously by traversing t=
he
info->channels and dtc->threads lists locklessly:

drivers/dma/dmatest.c:is_threaded_test_run() {
    ...
	list_for_each_entry(dtc, &info->channels, node) {
        ...
		list_for_each_entry(thread, &dtc->threads, node) {
    ...
}

Concurrently, an unprivileged or privileged user can write to module parame=
ters
(e.g., echo 0 > /sys/module/dmatest/parameters/run), which acquires
info->lock, calls stop_threaded_test(), removes the elements from the list
with list_del(), and frees them.

drivers/dma/dmatest.c:stop_threaded_test() {
    ...
	list_for_each_entry_safe(dtc, _dtc, &info->channels, node) {
		list_del(&dtc->node);
        ...
		dmatest_cleanup_channel(dtc);
    ...
}

This concurrent modification drops the element from the list and poisons
pointers before freeing, leading to a use-after-free for the lockless reade=
r.
Could we use appropriate locking when evaluating the condition in wait_even=
t()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828151024.2081=
478-1-cosmin-gabriel.tanislav.xa@renesas.com?part=3D1
