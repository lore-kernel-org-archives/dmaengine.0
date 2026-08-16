Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677805477E
	for <dmaengine@vger.kernel.org>; Sun, 16 Aug 2026 16:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786896636; cv=none; b=e6KHWlSUBZJp51rqvezQL1JrATAsorJaIP84E/2SAyC+g8S0zQTbDFrzK22A8rHnrTE0eUGJbjWgfnxqwXFhoLbSP3oIRJGw+yrK3olC3LhbKkB0ZFxGQFI7k0a/K5SXeSWpXAHVOGzq9Ey0v+YBhA/gSbL+FEW4fKrVwYSUrX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786896636; c=relaxed/simple;
	bh=O3G1AIgPW6Op998B+N1XFp3t2Y69SMa7wNouTNiYRP4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=X5Yj3/GNz1JkVzhsY0AGsCCYth9im0Cimy4R6dXehgpxBrLZbmR2jHGbYGLlskAqVxICasa4TrZounGHQyZp5ZBOGZYcgJnMqchkKmUnR3V+DzQ8ahIejnlnfIi2uig6gBIx7KnrQzoyiHIgYOGJJzOPvUCI0n5xY/K57+5FjMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ch2VmAfj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ch2VmAfj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4ADB1F000E9;
	Sun, 16 Aug 2026 16:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786896635;
	bh=ErlRjwxKner+ZcFTciU8W7QbFaj5erdMa+61iiOb0YY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ch2VmAfjNGGH72L/eWir3KbRS8H5Kxustl09cVseXRDEWUKARA5X+rm2C54RPWfko
	 rEImL+f0QGPKHnonsVEIJ3v9YywIKcx3UWWwN/kIlcTsfoqvdU92SGDR3a8CNzN3uH
	 rR+c/LSm3LyRxrR5SXnFYNu5ZwijTTacSeFPvL3ka39ms1ElgaGpnfm8TtN5AtDoYT
	 OVvf7nnTm/DiZXvpi7FMA7Z8UGbdnPEv32AwNdA56pdmg7opBOjY78FJEzfD0eWcpz
	 qf7CovvJnHyVfvxOJgkxCyhdezqP+neWFYzBp/c3gzalkvxI2tA6hALyQAVcjtjLuU
	 7hxA690+mswaQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] dmaengine: wait for RCU readers before releasing
 dma_device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shivank Garg" <shivankg@amd.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260816-dmaengine-kref-fix-v3-3-7e76187145df@amd.com>
References: <20260816-dmaengine-kref-fix-v3-0-7e76187145df@amd.com>
 <20260816-dmaengine-kref-fix-v3-3-7e76187145df@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 16 Aug 2026 16:10:34 +0000
Message-Id: <20260816161034.C4ADB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Double list_del_rcu() causes list corruption when DMA provider mod=
ule unloads concurrently with a channel request.
- [High] A Time-of-Check to Time-of-Use (TOCTOU) race condition between `dm=
a_issue_pending_all()` and `dma_chan_put()` leads to memory corruption by o=
perating on freed DMA channel resources.
--

--- Patch [3]: [PATCH v3 3/3] dmaengine: wait for RCU readers before releas=
ing dma_device ---
commit 6738eea6e01509c5c24f2cdb086fe3fd0ffab13a
Author: Shivank Garg <shivankg@amd.com>

dmaengine: wait for RCU readers before releasing dma_device

dma_issue_pending_all() walks the dma_device_list with
list_for_each_entry_rcu() under rcu_read_lock(). dma_device_release()
unlinks the device with list_del_rcu() and then calls
device->device_release(). This patch adds synchronize_rcu() before
freeing the device so RCU readers are guaranteed to have finished.

Link: https://sashiko.dev/#/patchset/20260526-dmaengine-kref-fix-v2-0-3df60=
afac01d@amd.com

> diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
> index bf491eb10596d..29b128aa0beaa 100644
> --- a/drivers/dma/dmaengine.c
> +++ b/drivers/dma/dmaengine.c
> @@ -429,6 +429,12 @@ static void dma_device_release(struct kref *ref)
>  	list_del_rcu(&device->global_node);

[Severity: High]
This isn't a bug introduced by this patch, but can this lead to a double
list_del_rcu() execution and list corruption if the module is unloaded
concurrently with a channel request?

If a thread calls dmaengine_get() or find_candidate(), it iterates
dma_device_list and calls dma_chan_get(). If another thread concurrently
unloads the module:

1. dma_chan_get() calls try_module_get(), which fails and returns -ENODEV
2. dmaengine_get() evaluates -ENODEV and eagerly deletes the device via
   list_del_rcu(&device->global_node)
3. Later, the unloading thread unregisters the device, which invokes
   dma_device_release()
4. dma_device_release() unconditionally calls
   list_del_rcu(&device->global_node) again on the already removed node

Calling list_del_rcu() twice on the same node poisons the prev pointer,
which can cause a panic in __list_del_entry().

>  	dma_channel_rebalance();
> =20
> +	/*
> +	 * Wait for RCU readers (e.g. dma_issue_pending_all()) that may still
> +	 * be traversing dma_device_list before the device is freed.
> +	 */
> +	synchronize_rcu();

[Severity: High]
This is a pre-existing issue, but does dma_issue_pending_all() still have
a TOCTOU race condition with dma_chan_put() that could lead to memory
corruption?

While this synchronize_rcu() protects the dma_device itself during driver
unbind, it doesn't seem to protect against channel release.

If dma_issue_pending_all() evaluates chan->client_count locklessly
under rcu_read_lock():

Thread A:
dma_issue_pending_all()
    if (chan->client_count)
        // preempted here

Thread B:
dma_release_channel()
    dma_chan_put()
        // drops client_count to 0
        chan->device->device_free_chan_resources(chan);

Thread A resumes:
    device->device_issue_pending(chan);

The driver writes to the hardware, forcing it to fetch from the newly
freed DMA ring. Can the hardware be safely started here if the resources
were just freed?

> +
>  	if (device->device_release)
>  		device->device_release(device);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260816-dmaengine-=
kref-fix-v3-0-7e76187145df@amd.com?part=3D3
