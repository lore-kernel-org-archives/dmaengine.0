Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED97439F6D
	for <dmaengine@vger.kernel.org>; Wed, 22 Jul 2026 16:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784737394; cv=none; b=eZnyubFkxCarvuOXiK7W04Gp8HW91TscBgA7+FGTls3C34GmCknMjT1EDdMpPfWC98uyNCA2qhTclTEBtIUyOg+OALHEy1ewS05/x1Sk7qorrPShH6pVZ0vlgFTlmWlHfh+omOljaSQf5ato1kTQQLNq12qKXTBaJupuER8+TdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784737394; c=relaxed/simple;
	bh=tHnZM8RnQtWfyvWtbp43Xmx6kVmx7OIqNJmSDsqriEY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hXtz/NGPgVy2Vo8Ngp0heTXaO6vNZHhfrulf1zkNEjsshjfiJz31g3w4OkGWrWIVgq8kdSymH3Bi3iGboa9S1Ar/T8moJAF7Vre4SFMvxtqf4gRy9gpE02wAs72rumPjQIgYfLJc3Y5tS1Y45HfnSDJRXYqy7BGDXs1vwEyskOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UQMF2OgW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UQMF2OgW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CFE51F00A3A;
	Wed, 22 Jul 2026 16:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784737393;
	bh=2jZOZ06F3HlcgSM5oGwozwcVP7Yr0sHx2QJ4r0clSWE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UQMF2OgWrsUQAdgq+cEaT/RtcIBTAi30SN5jUliS6xz77cWy8hUBxgxy86H3CP1/u
	 EGczb2NxLAjQCdHv8ebL0FZcnC9vjrcJTaHbnOOaC7PJpNR5u24D6qPLRBY3CBMJLy
	 Lc00YqZ/ngDMn8OAKWzbwW4ai8oMwCip1tMFoc0soFhQM/kfF6qk1layiF94hBcKR8
	 FlVppnU3iScq1fm05QxY5IyWqSkGichYxf0DiP/R0zrog241RFahwjLEd0NRqCH2Fu
	 ylqpCnty5Ke8XMhAw2LERcwd8vhgWp/VLcp6ODlnkL2CPUF/OtGlEkhrDpTuJYkJN2
	 ea2ykssxhh0BA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] dmaengine: dmatest: Terminate channel before
 freeing threads
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nathan Lynch" <nathan.lynch@amd.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260722-dmatest-fixes-and-fatal-errors-v1-3-8287709987ea@amd.com>
References: <20260722-dmatest-fixes-and-fatal-errors-v1-0-8287709987ea@amd.com>
 <20260722-dmatest-fixes-and-fatal-errors-v1-3-8287709987ea@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 16:23:12 +0000
Message-Id: <20260722162313.1CFE51F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Spurious WARN_ON due to racing callback execution and thread shutd=
own.

Pre-existing issues:
- [High] Incomplete fix leaves Use-After-Free for drivers lacking terminate=
_all support.
--

--- Patch [3]: [PATCH 3/4] dmaengine: dmatest: Terminate channel before fre=
eing threads ---
commit 45380ad31d07f2d946845ad6c99217e3ae5ea8ae
Author: Nathan Lynch <nathan.lynch@amd.com>

dmaengine: dmatest: Terminate channel before freeing threads

This commit modifies dmatest_cleanup_channel() to stop all threads first,
flush the channel, and only then free the thread memory. This prevents
pending callbacks from accessing freed memory.

> diff --git a/drivers/dma/dmatest.c b/drivers/dma/dmatest.c
> index 3267c7e86f5d5..0d7752c2451a9 100644
> --- a/drivers/dma/dmatest.c
> +++ b/drivers/dma/dmatest.c
> @@ -959,18 +959,23 @@ static void dmatest_cleanup_channel(struct dmatest_=
chan *dtc)
>  	struct dmatest_thread	*_thread;
>  	int			ret;
> =20
> -	list_for_each_entry_safe(thread, _thread, &dtc->threads, node) {
> +	/* stop all threads first */
> +	list_for_each_entry(thread, &dtc->threads, node) {
>  		ret =3D kthread_stop(thread->task);
>  		pr_debug("thread %s exited with status %d\n",
>  			 thread->task->comm, ret);
> +	}
> +
> +	/* flush the channel (e.g. vchan_synchronize() -> tasklet_kill()) */
> +	dmaengine_terminate_sync(dtc->chan);

[Severity: High]
Could this trigger a spurious WARN_ON when flushing pending callbacks?

When a test is stopped, kthread_stop() runs, and dmatest_func() sets
thread->done to true before exiting.

dmatest_cleanup_channel() then calls dmaengine_terminate_sync() which flush=
es
any pending callbacks.

Since thread->done is already true, will the pending dmatest_callback() read
it and incorrectly fall into the warning path?

drivers/dma/dmatest.c:dmatest_callback() {
    ...
    } else {
        /* ... */
        WARN(1, "dmatest: Kernel memory may be corrupted!!\n");
    }
}

[Severity: High]
This is a pre-existing issue, but does ignoring the return value of
dmaengine_terminate_sync() leave a use-after-free risk for drivers that lack
terminate_all support?

If a driver doesn't support device_terminate_all, dmaengine_terminate_sync()
returns -EINVAL and skips dmaengine_synchronize():

include/linux/dmaengine.h:dmaengine_terminate_sync() {
    ...
    ret =3D dmaengine_terminate_async(chan);
    if (ret)
        return ret;

    dmaengine_synchronize(chan);
    return 0;
}

If synchronization is skipped, couldn't the hardware transfer still finish
and fire the tasklet after we proceed to kfree(thread) below, causing
dmatest_callback() to access freed memory?

> +
> +	/* now it is safe to free the thread memory */
> +	list_for_each_entry_safe(thread, _thread, &dtc->threads, node) {
>  		list_del(&thread->node);
>  		put_task_struct(thread->task);
>  		kfree(thread);
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-dmatest-fi=
xes-and-fatal-errors-v1-0-8287709987ea@amd.com?part=3D3
