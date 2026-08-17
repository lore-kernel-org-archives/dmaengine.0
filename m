Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658E044BCB4
	for <dmaengine@vger.kernel.org>; Mon, 17 Aug 2026 19:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786995636; cv=none; b=q1/blyi3q89Zqn4qSiKkLr5O1XKlffTMrR37863+OfeTk0wPjCfoB6GKuJyzI6yz/Lou2L4j10kv2/K9Wn7xEQYwWmHkohWrttyFuJdJ5vWC2Qjk/dHDXrSAN8OdntW2Kq09sAlg1DYC4LNVY5SfaqbQJDt2mXV3PMnHrMhlC2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786995636; c=relaxed/simple;
	bh=sAj58mxbOQzF06AIfTB/6+v9oo/sBAxWM+eiBUCJ82E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=a7SSZXHZe9P0dwJdNywJFOBbwECFLakoFw4qAbbpa0Jq4AsscJP4piEqI90jYtHUaCPbbUvxcZIZ5j2HyBXN/Y86lWdO89s0HNE2YZPmnQ+scXfGzi6s7SbN96sEdx29stS8W0ikSnf4ZDKtlz+wCkMshGedKe516eSjyBhk6XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QUJjr0ST; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QUJjr0ST"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C27C41F000E9;
	Mon, 17 Aug 2026 19:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786995635;
	bh=w0ticotMV64i9HX1pIupyQ3GaLNr55FBT0+C011zHyc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QUJjr0STT20ScF3iuk89DI2O1I2O52DWE2Oc9hbG8JRhdQeW91mXTmE2otssdjswT
	 Es+0o3KqHIV4q26J27MtNXYeVIgK9RFVbObtagIHeI5rBJOWdFvMMvAmCE//aIiKtn
	 +RoFHFUY0l515m89ypFfu9wDy0igAt3+2gU8XAchW0euVOSPJuw88G2sJ9PhB5b0rZ
	 9KVIj1X7JOLsGllPZEehZqHyGcJlQcu+6zRB65kxqPC0mDQmNIc+ucW7HpclsXvUE5
	 jr5I/d54F7Cfg/rfRjq4HPmbSKliWCDZBd87Nbe1hpRhOnl899ur6yQc3muul/zwSs
	 WZPGdrn0NqoFg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: dmatest: fix race between wait for thread
 and thread start
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cosmin Tanislav" <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260817192557.437474-1-cosmin-gabriel.tanislav.xa@renesas.com>
References: <20260817192557.437474-1-cosmin-gabriel.tanislav.xa@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 19:40:34 +0000
Message-Id: <20260817194034.C27C41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] TOCTOU race in pending flag update allows premature wait complet=
ion.

Pre-existing issues:
- [High] Lockless list traversal in wait condition causes Use-After-Free ke=
rnel crash.
--

--- Patch [1]: [PATCH] dmaengine: dmatest: fix race between wait for thread=
 and thread start ---
commit 6a5e8f24ddb4b9e471d1801d58f2c91b07f83d13
Author: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

dmaengine: dmatest: fix race between wait for thread and thread start

This commit addresses a race condition in the dmatest module where the wait
module parameter could cause an early exit if the worker thread has not yet
started. It attempts to resolve this by clearing the pending flag immediate=
ly
after waking up the worker thread.

> When the wait module parameter is set to true, dmatest_init() waits for
> the !is_threaded_test_run() condition to become true.

[Severity: High]
This is a pre-existing issue, but does evaluating this condition repeatedly
in wait_event() without holding a lock lead to a use-after-free?

Looking at is_threaded_test_run(), it iterates over info->channels and
dtc->threads without holding info->lock:

drivers/dma/dmatest.c:is_threaded_test_run() {
    ...
    list_for_each_entry(dtc, &info->channels, node) {
        ...
    }
    ...
}

If stop_threaded_test() is executed concurrently via sysfs, it can modify
the list nodes. Since the traversal in is_threaded_test_run() happens
without holding the lock, could this hit freed memory and result in a
direct use-after-free?

> diff --git a/drivers/dma/dmatest.c b/drivers/dma/dmatest.c
> index 2ae3469397f37..2d2eb43eee7cc 100644
> --- a/drivers/dma/dmatest.c
> +++ b/drivers/dma/dmatest.c
[ ... ]
> @@ -1142,6 +1141,7 @@ static void run_pending_tests(struct dmatest_info *=
info)
>  		thread_count =3D 0;
>  		list_for_each_entry(thread, &dtc->threads, node) {
>  			wake_up_process(thread->task);
> +			thread->pending =3D false;

[Severity: Medium]
Could this order of operations introduce a race window?

If wake_up_process() makes the thread runnable immediately, could a
concurrent wait_event() evaluate a stale pending state before it is
cleared here?

Would swapping these operations to clear the pending flag strictly before
the wakeup prevent concurrent wait_event() evaluations from exiting
prematurely?

>  			thread_count++;
>  		}
>  		pr_info("Started %u threads using %s\n",

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817192557.4374=
74-1-cosmin-gabriel.tanislav.xa@renesas.com?part=3D1
