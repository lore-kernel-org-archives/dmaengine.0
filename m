Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633563655D8
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 21:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785187251; cv=none; b=RS4LQadwyrf2zuaiIfl/jetOpe9a/Zphwp5fyTjfH2JN4U0FYhdtwKCpkaQ7CXnDFtGwR8dnQS3IwtP1pDbrOTj14GiAsl5/alXl53IoBdeFilG0WwKW98scCpOcmz5rYJW+y5eL2B7cT3mlupCpx9LWk6Cxx5BUe3m0/zf0oWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785187251; c=relaxed/simple;
	bh=LPw0dhf5RZRWHNaziJTAzSG0uxvxXV4Glfih4ZCiN6s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lriEMgdujLih2Hh3EAdG1OaSyMBC2QgXSMuYVxDfArbtDqazGMWD4I8xktBCI4Kv47kE25xxPm8Zwou3ZwMwgqCXy5RnQ95ZpOtgIbiCcprgwEXnJ5X3RcYs9eVxEBWAPnV1c40CoKmvV2dQgsil80/VpTMfNKqHgoXXjySnLUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aTD3ZfQl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aTD3ZfQl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B44731F000E9;
	Mon, 27 Jul 2026 21:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785187250;
	bh=+qE1w5yvw9Krqgm98tQWEtBVdqMzE0QSlWlS6S23ypo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aTD3ZfQl+LkuP5L3sN9QN60UYDY08d6cI3FOUct66wFQwqoBv57WKidkZ67LRO3Dg
	 v7OR+2aeCe7hdjPkp7WfSMgws9Iv8ggYAdM2wQEmP6lkCmP6SFesfNfUNnle/UdH3a
	 1Sd5fdKl4goV3sii4d+0sQWZIN1/EN3WEsD44qh+dqDWnH138DcefmzI1nJmwLyC/e
	 MJJEmNNoIzLuy/K1YCBVjKXq2lNnGM+J+Fyzr64rNwHn7qQsAvgsel3h7b3GFW/6C9
	 H/o+Qf5MMgl52K//k0jfNpnldoJZud4rHwXPOI4Te0DPceW88QmDQj5QO9mOx3gEoN
	 q3lInKwEv3n3Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 57/64] dmaengine: edma: use dma_chan_kill_bh
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <e663065044a0e9f193cd621f89d082af99b005d0.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <e663065044a0e9f193cd621f89d082af99b005d0.1785183549.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 21:20:49 +0000
Message-Id: <20260727212049.B44731F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Channel unregistration bypass leading to memory leak and sysfs Use=
-After-Free.
- [High] Missing BH cancellation for `memcpy` channels causing Use-After-Fr=
ee during teardown.
--

--- Patch [57]: [PATCH v2 57/64] dmaengine: edma: use dma_chan_kill_bh ---
commit 03c05180f9212195192cc327d33610888eef85fe
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: edma: use dma_chan_kill_bh

virt-dma now dispatches completion callbacks through per-channel BH work
instead of its tasklet. Cancel that work during teardown before channel
storage is released.

> diff --git a/drivers/dma/ti/edma.c b/drivers/dma/ti/edma.c
> index d97db5af35555..c0b16cd247525 100644
> --- a/drivers/dma/ti/edma.c
> +++ b/drivers/dma/ti/edma.c
> @@ -2560,7 +2560,7 @@ static void edma_cleanupp_vchan(struct dma_device *=
dmadev)
>  	list_for_each_entry_safe(echan, _echan,
>  			&dmadev->channels, vchan.chan.device_node) {
>  		list_del(&echan->vchan.chan.device_node);

[Severity: High]
This is a pre-existing issue, but does removing the channel from the
device list here cause problems during device unregistration?

When a user unbinds the driver, edma_remove() calls this function which
unconditionally removes all slave channels from dmadev->channels. When
dma_async_device_unregister() subsequently runs, it iterates over the
now-empty list and entirely skips unregistering the channels.

Can this cause sysfs device nodes, IDAs, and per-cpu variables to leak?
If the orphaned sysfs attributes (such as in_use or bytes_transferred)
are read after the driver is unbound, could it trigger a use-after-free
since the underlying chan structures are freed by devres?

> -		tasklet_kill(&echan->vchan.task);
> +		dma_chan_kill_bh(&echan->vchan.chan);
>  	}
>  }

[Severity: High]
This is a pre-existing issue, but are we missing a cleanup step for the
memcpy channels?

Looking at edma_remove(), edma_cleanupp_vchan() is explicitly called for
ecc->dma_slave, but it appears to be completely omitted for ecc->dma_memcpy:

drivers/dma/ti/edma.c:edma_remove() {
    ...
    edma_cleanupp_vchan(&ecc->dma_slave);
    ...
    dma_async_device_unregister(&ecc->dma_slave);
    if (ecc->dma_memcpy)
        dma_async_device_unregister(ecc->dma_memcpy);
    ...
}

Because the cleanup is skipped, the BH cancellation is never performed
for dma_memcpy channels. If a background transfer completes and schedules
the BH just before the driver is unbound, could the pending BH execute
after devres has freed the channel structures and cause a use-after-free?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785183549.gi=
t.allen.lkml@gmail.com?part=3D57
