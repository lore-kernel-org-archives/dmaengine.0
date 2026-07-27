Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5FD3E639E
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 21:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785187127; cv=none; b=pqAA+P6jRCAuO1EI6zk2/dPtw1MO9lk+K8XpowZyfayD2G/oD/cQSORcPkiyVhSWM30i9u1uufimRnbTD3QhdKdGX/HrI0d/TZXxKeaqft3vuyh7+e3xhpZ+Va1zoucuTofGz8oQYy377K/eWc0YKiZym6499w3pU6iQis9eAeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785187127; c=relaxed/simple;
	bh=GAfczg9WB9pQkGVmoYxfu6Ic9uRi/wHtKwOJWuW65yI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GHypyxAJxLEUO6IryfRyPkOt8wrZL6wjfi8VlyObIFxiTD43nHpMerTBFsl8t3V6BGNyKYbcGBaeStNQJ3RYhFNGNP5e0roM9mDHEuRvkcxs+hE0h1+QP76pREKz4M4MN3ynUmKuczLD5/ApJli7eha0YzWP98y+RwdEf7nE2G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YREo5jn3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YREo5jn3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 374161F00A3F;
	Mon, 27 Jul 2026 21:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785187125;
	bh=LO9rLqbi9Bm3kPcFqoTwyICfAExth3tWQhFUVX4p8Bs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YREo5jn38dT9mtHERu0dWQJy4n/P4mPrREEWVlJaPVLyGNWpMfqt2PJ/5JuDRLWIa
	 wTqus6UshDHrjkb5OiACYeI7bcPCHdR6Dc0pnz2qEd4GOp8C52mBg7RKesG6vdNbcS
	 MiE+SAjqXhN0ocbrvuEnQmYjxn6fuq8/JpCSP7mOnYOhJbODxFWNaKSZ7XnV0RC3w4
	 ZhFPwJaD95cZM0sRL+FD3VyI05m7XPnqh//z820HuQziQTDbbtUwfctTVuuamXPNH3
	 Ug6oj62uatsQ1DkEeZkCvcV2KS0te50+drrd78hFDBlc5HypjS7zmFNdzIq0PSZf26
	 uixxk+7r35qcw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 50/64] dmaengine: dw-edma: kill vchan BH on teardown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <61d619b14a5eead4edf6876afaf165a0c0ceec5c.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <61d619b14a5eead4edf6876afaf165a0c0ceec5c.1785183549.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 21:18:44 +0000
Message-Id: <20260727211845.374161F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Virtual DMA descriptors are leaked during channel teardown and=
 release due to missing vchan_free_chan_resources(), leading to memory leak=
s and critical use-after-free memory corruption on channel reuse.
--

--- Patch [50]: [PATCH v2 50/64] dmaengine: dw-edma: kill vchan BH on teard=
own ---
commit 5cb424de4644af7e57a2169fe1e94e001c0d3927
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: dw-edma: kill vchan BH on teardown

This commit modifies the dw-edma driver to use dma_chan_kill_bh() for
cleaning up virt-dma channels during teardown, replacing the older
tasklet_kill() usage.

> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-=
edma-core.c
> index 89a4c498a17b8..a47a4674df838 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c
> @@ -1170,7 +1170,7 @@ int dw_edma_remove(struct dw_edma_chip *chip)
>  	dma_async_device_unregister(&dw->dma);
>  	list_for_each_entry_safe(chan, _chan, &dw->dma.channels,
>  				 vc.chan.device_node) {
> -		tasklet_kill(&chan->vc.task);
> +		dma_chan_kill_bh(&chan->vc.chan);

[Severity: Critical]
This is a pre-existing issue, but does this teardown sequence leak virtual
DMA descriptors because it misses a call to vchan_free_chan_resources()?

If a client queues a DMA transfer, aborts it via
dw_edma_device_terminate_all(), and releases the channel, the aborted
descriptors are not removed from the virt-dma queues because
dw_edma_free_chan_resources() also lacks a call to
vchan_free_chan_resources() to clear the pending lists.

When the channel is requested again and started, could
dw_edma_start_transfer() mistakenly pull a stale descriptor from
vchan_next_desc(), leading to memory corruption and a use-after-free?

>  		list_del(&chan->vc.chan.device_node);
>  	}
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785183549.gi=
t.allen.lkml@gmail.com?part=3D50
