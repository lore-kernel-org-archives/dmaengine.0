Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C5D35F170
	for <dmaengine@vger.kernel.org>; Wed, 22 Jul 2026 16:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784736591; cv=none; b=S3x3gvH+QgEdhSUFEYejgB5v4+ae013jvabcMGdI+j89tN39zN0F+VAi9n/WCjDsNoAsCDIscDx0KN0pYv2TDDrUpAlqZVYGviSM+Ix42EL3jCb2ieOBKnmVGe3CbH3UeCaPMGFKCZrdKFL79pyDua66+vv060KCQojdIl/GT8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784736591; c=relaxed/simple;
	bh=E4VPXnsPZn2hY0lmYnupDcRLbD7C4xAPEETsiDTFYs0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UzD2GoyanQ1pVIEtIzZx+TL03RKAJOP2aDaouTG3x0rVn/Sz8YryXqKdOeFDsrhgTmS/KDLo5sVUZiQSoPilHcV9qNJVYo/wP4BTDBn3hmjs6ZqOXodejKsLUb+W2mHCuiNSb2HICKufvNmZfuNyIUU3nfj1lfez1e/F+/CTDEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AEkb10mS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AEkb10mS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ECFB1F000E9;
	Wed, 22 Jul 2026 16:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784736589;
	bh=SWE5MHqNgaW1vTE7vBqJw8nLa6PFvWXIPLvwlwq/cwQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AEkb10mSTpmzzx1xQRrpGvfnHlXPbWe5fRunv+dAQmdFEZDSW867aGhjHeS6uflh2
	 1ndTO41CwhjOoLUudCGCPjhad0GksOQPcwPqxD59DG4U7/mt1r79nGbMuFeoGS4wgf
	 h3lf4vs1ufJN2uo9/NMLkg+irNMOoDnbLe0h/8LB7TSAhsgZurZfZJXjQpoHdu4Zrj
	 ODiuAjVKIxCil7gZcnuRbUSG5R1EGDjDPKO8+V6VIxueEIdRkjHb21d41Pu7hu5loc
	 nwE+08lrq1B0thsWelyycH9VBVcyAfjds7jtgtUut1o6zUO9RfoLYVRxZZzBI9UcxS
	 dB3rEPN9/14+g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] dmaengine: dmatest: Suppress bogus failures when
 stopping a run
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nathan Lynch" <nathan.lynch@amd.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260722-dmatest-fixes-and-fatal-errors-v1-2-8287709987ea@amd.com>
References: <20260722-dmatest-fixes-and-fatal-errors-v1-0-8287709987ea@amd.com>
 <20260722-dmatest-fixes-and-fatal-errors-v1-2-8287709987ea@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 16:09:49 +0000
Message-Id: <20260722160949.7ECFB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Bypassing the error path during thread stop prevents dmaengine_ter=
minate_sync() from being called, leading to a Use-After-Free of the dmatest=
_thread struct by the completion callback.
- [Medium] Bypassed DMA status check when stopping results in unhandled DMA=
 errors.
--

--- Patch [2]: [PATCH 2/4] dmaengine: dmatest: Suppress bogus failures when=
 stopping a run ---
commit 65f43e5ca342a54064656c1ebe548edaa5c088bd
Author: Nathan Lynch <nathan.lynch@amd.com>

dmaengine: dmatest: Suppress bogus failures when stopping a run

Writing 0 to the module 'run' attribute stops the test threads with
kthread_stop(). This commit introduces checks against kthread_should_stop()
to suppress stale failures against transfers that actually succeeded.

> diff --git a/drivers/dma/dmatest.c b/drivers/dma/dmatest.c
> --- a/drivers/dma/dmatest.c
> +++ b/drivers/dma/dmatest.c
[ ... ]
> @@ -848,14 +848,19 @@ static int dmatest_func(void *data)
>  					done->done,
>  					msecs_to_jiffies(params->timeout));
> =20
> -			status =3D dma_async_is_tx_complete(chan, cookie, NULL,
> -							  NULL);
> +			stopping =3D kthread_should_stop();
> +			status =3D stopping ?
> +				dma_sync_wait(chan, cookie) :
> +				dma_async_is_tx_complete(chan, cookie, NULL, NULL);
>  		}
> =20
>  		if (!done->done) {
> -			result("test timed out", total_tests, src->off, dst->off,
> -			       len, 0);
> -			goto error_unmap_continue;
> +			/* stopping: dma_sync_wait() let the transfer finish, not a timeout */
> +			if (!stopping) {
> +				result("test timed out", total_tests, src->off,
> +				       dst->off, len, 0);
> +				goto error_unmap_continue;
> +			}

[Severity: Medium]
By skipping this error path when stopping is true, does this bypass evaluat=
ing
the status returned from dma_sync_wait()?

If a legitimate hardware error or timeout occurs exactly when the thread is
stopped, it looks like it would either falsely report a successful test (if
noverify is set) or misreport it as a data mismatch.

[Severity: High]
Could skipping the goto error_unmap_continue here lead to a use-after-free
in a delayed callback?

If a delayed callback leaves done->done false when stopping, failed_tests
won't be incremented. Later, when dmatest_func() exits:

    if (ret || failed_tests)
        dmaengine_terminate_sync(chan);

Since failed_tests remained 0, the thread exits without synchronizing the
channel. Then dmatest_cleanup_channel() executes:

    put_task_struct(thread->task);
    kfree(thread);
}

/* terminate all transfers on specified channels */
dmaengine_terminate_sync(dtc->chan);

Is there a window where a pending tasklet executes dmatest_callback()
after kfree(thread) but before dmaengine_terminate_sync() is finally called,
leading to a use-after-free on the thread structure?

>  		} else if (status !=3D DMA_COMPLETE &&
>  			   !(dma_has_cap(DMA_COMPLETION_NO_ORDER,
>  					 dev->cap_mask) &&

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-dmatest-fi=
xes-and-fatal-errors-v1-0-8287709987ea@amd.com?part=3D2
