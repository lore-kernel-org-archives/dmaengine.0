Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DC43BCD13
	for <dmaengine@vger.kernel.org>; Wed, 22 Jul 2026 15:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784735875; cv=none; b=dXikX39McRDIcbPI9RNXu1VUueKTpQ56kZD4tT9AGnEQ5wNp9R+yiD55rjQPHzkxLU0cJgxE01FTg2Sdq/UkEcNGyesn4TbF1Y4gIUgbPxXFo39eRPgdP10UZVmblp4F2878hw7twpoLrvrwDsedMvx7lbdvicraZlEuR1aE9XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784735875; c=relaxed/simple;
	bh=s1aPptTmVPYnFT15GC18SNP4VN0HVGohNlQyT0cx7f0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UH22/ab5dEBMH420ig+WKlhrywKN4aYoRfpmXlTvoG8UxsFKrbraglOvDc+hf2qDEL1U3Jc2lnhx3flJuJEIwYzVV6AndskXAa4Aa78YAY+wurPX+jt3Kgsni/QZyOZDWWqhqrsnNUk851lkezjGCfOXQ/+QZAeUi6c5V2BE5Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nUC8QSNC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nUC8QSNC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 289771F000E9;
	Wed, 22 Jul 2026 15:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784735871;
	bh=EwxCT7cl9vIoq5ECCjtiknKLieyPdNyGYF9Zh03KN84=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nUC8QSNCteG46gi+4AKyLZQl5JyFizlzjiqt15L1TOQZvtgdjuaQiAo7VqaXZDzOn
	 pzUhuxhBZC1A9X2OTOHKto+FB+2IcxQ9Mm1mVugwcLx5CLGfjjwJiTkJS5K5hNVtMq
	 QRA9J+8niJK78dcMBvDM2g/MmUhOsLMiPCWgCHPY3gkSJm1i3bZJjvM8M7PV+3s2Ab
	 RqlNWNSXaqzab+aLuIXFjaf4YaaZgb3imTliNHAlcO1RiQ86AEDwh68uFHAwLzmeT7
	 SkzIb/876d4q2liN1wYrWHWTIf9oJ8fEqQ/phrtyP5rqudXGGWn+pSS14tYv+7JlDn
	 0j6CY7qDfKqmQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] dmaengine: dmatest: Don't forcibly terminate
 channel in polled mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nathan Lynch" <nathan.lynch@amd.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260722-dmatest-fixes-and-fatal-errors-v1-1-8287709987ea@amd.com>
References: <20260722-dmatest-fixes-and-fatal-errors-v1-0-8287709987ea@amd.com>
 <20260722-dmatest-fixes-and-fatal-errors-v1-1-8287709987ea@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 15:57:50 +0000
Message-Id: <20260722155751.289771F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Removing dmaengine_terminate_sync(chan) from the polled mode path =
causes the test to unmap DMA buffers while the hardware might still be acti=
vely processing the queued descriptor.

Pre-existing issues:
- [High] Test data buffers are freed before pending DMA transfers are termi=
nated at the end of the test thread, creating a race window where active DM=
A hardware can corrupt freed slab memory.
--

--- Patch [1]: [PATCH 1/4] dmaengine: dmatest: Don't forcibly terminate cha=
nnel in polled mode ---
commit ff3488aa5c4eb22b5aa3631448708f7560e37c84
Author: Nathan Lynch <nathan.lynch@amd.com>

dmaengine: dmatest: Don't forcibly terminate channel in polled mode
   =20
This commit removes the call to dmaengine_terminate_sync() from the
main thread loop for polled transfers. This prevents disruptive
terminations when multiple threads are concurrently submitting descriptors.

> diff --git a/drivers/dma/dmatest.c b/drivers/dma/dmatest.c
> index 2ae3469397f37..60bc448f42eeb 100644
> --- a/drivers/dma/dmatest.c
> +++ b/drivers/dma/dmatest.c
> @@ -837,7 +837,6 @@ static int dmatest_func(void *data)
> =20
>  		if (params->polled) {
>  			status =3D dma_sync_wait(chan, cookie);
> -			dmaengine_terminate_sync(chan);
>  			if (status =3D=3D DMA_COMPLETE)

[Severity: High]
By removing the termination here, does this code leave the hardware running
if dma_sync_wait() times out?

If dma_sync_wait() returns DMA_ERROR on a timeout, done->done remains false.
The loop then eventually branches to error_unmap_continue without terminati=
ng
the pending transfer.

This error path calls dmaengine_unmap_put(), unmapping the buffers while the
hardware might still be actively processing the queued descriptor. Could th=
is
lead to active DMA memory corruption?

[Severity: High]
This is a pre-existing issue, but does dmatest_func() free test buffers
before terminating pending DMA transfers during thread cleanup?

Looking at the error handling and exit path at the end of the test thread:

dmatest_func() {
    ...
    err_dst:
        dmatest_free_test_data(dst);
    err_src:
        dmatest_free_test_data(src);
    ...
    err_thread_type:
        dmaengine_terminate_sync(chan);
    ...
}

If a transfer had timed out and was left running, could the DMA hardware
execute the pending descriptor in the window between freeing the slab
memory and terminating the channel?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-dmatest-fi=
xes-and-fatal-errors-v1-0-8287709987ea@amd.com?part=3D1
