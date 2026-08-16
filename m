Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DF21A8F84
	for <dmaengine@vger.kernel.org>; Sun, 16 Aug 2026 16:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786896154; cv=none; b=iRCK70kP4ZF8TKYWinw4qBcgkxePIP3QtpI9NQz6YWjtpz00uFj7YiqoBA41k57eORJjCCMryd02QdLJU/4YlALxJiCeYfhZXj+xzYagTkb25tX8e3+iUgM1SG5VWfu+B0zLWxT03VlhCXPfkhcR8qj5Vj5YuTJG7FtAlIslhCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786896154; c=relaxed/simple;
	bh=dgXn8w1Q8UgE9V/9StaGh+upfAYTO01fee6u59hVpvw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=c/m4MHRhm7EiFMB8Egbje6lfQqgO62bvaCHZRQQjpKKab6fvmeLGojpPi2CuzebchMtLNYJrBS1vgg9adq120tLufg1lzr/uxP458DxD5YshbqVY3ZRtY1afB8B0Y+6jb381TSKZW3WvpMc5kzTqcUgMRZ3lo6AUtPsgy/YW/4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mPYoes6f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mPYoes6f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A1E41F000E9;
	Sun, 16 Aug 2026 16:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786896153;
	bh=ueyq0amdLYD+eFAXCXfYsbQHkxbI3GeYstyeh8Oz2yA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mPYoes6fo8nFNhBWu76SI7ggNgaCfwn4hhgbRNQtQArwyktCQgPzLHmYd7dZsoQg0
	 rPtkWDYbgawHk+LlWylHL0c8JwuJqA8Cl9KejQ378SqhLWEgeBs4wWbg8YeACQ3Z5q
	 YL0KmcKwX/kEn7EnpaJxtDzVenHXvSev0JLHwgVhr+Eat9MZ3N0QisxpLrwxev/Z6U
	 ku5XZF+pXMwJHCc1lVXIiZaxNZxYxq0U26v7eos1hCmivUNIoytaHBCetLlOXJOH2V
	 PC7xWchIUvf/gdhfkoCDMdqRH9mZ9nRPijqXa7cLBbmRFAJ4f76DBFq1uOHtSu47Hu
	 H0Yx5I5TWHKTg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] dmaengine: Fix device kref underflow in
 dma_chan_put()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shivank Garg" <shivankg@amd.com>
Cc: dmaengine@vger.kernel.org, Frank.Li@kernel.org, vkoul@kernel.org
In-Reply-To: <20260816-dmaengine-kref-fix-v3-1-7e76187145df@amd.com>
References: <20260816-dmaengine-kref-fix-v3-0-7e76187145df@amd.com>
 <20260816-dmaengine-kref-fix-v3-1-7e76187145df@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 16 Aug 2026 16:02:32 +0000
Message-Id: <20260816160233.0A1E41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] dma_chan_put() accesses chan->device->owner after potentially free=
ing chan and chan->device via dma_device_put().
- [High] dma_release_channel() accesses `chan` fields after calling `dma_ch=
an_put()`, which may have freed the channel.
- [High] RCU read-side critical section in `dma_issue_pending_all()` can ac=
cess a synchronously freed `struct dma_device`.
--

--- Patch [1]: [PATCH v3 1/3] dmaengine: Fix device kref underflow in dma_c=
han_put() ---
commit 0f010c1f7452238748341b884bda3d3bba2c74ac
Author: Shivank Garg <shivankg@amd.com>

dmaengine: Fix device kref underflow in dma_chan_put()

This commit fixes a device reference underflow bug by ensuring the device=20
reference is only dropped on the last put of a channel, matching the behavi=
or=20
of the get path.

> diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
> index 6ffd8bd82154a..516d6d9332083 100644
> --- a/drivers/dma/dmaengine.c
> +++ b/drivers/dma/dmaengine.c
> @@ -515,7 +515,9 @@ static void dma_chan_put(struct dma_chan *chan)
>  		chan->route_data =3D NULL;
>  	}
> =20
> -	dma_device_put(chan->device);
> +	/* This channel is not in use anymore, drop the device ref */
> +	if (!chan->client_count)
> +		dma_device_put(chan->device);
>  	module_put(dma_chan_to_owner(chan));

[Severity: High]
This is a pre-existing issue, but does accessing chan after dma_device_put()
risk a use-after-free?

If dma_device_put() drops the last reference to the DMA device, it can
trigger synchronous release of the device memory, which might also free the
embedded dma_chan.

Could dma_chan_to_owner(chan) then dereference freed memory by evaluating
chan->device->owner?

>  }

[Severity: High]
This isn't a bug introduced by this patch, but does dma_release_channel()
also access freed memory under the same conditions?

drivers/dma/dmaengine.c:dma_release_channel() {
	...
	dma_chan_put(chan);

	if (chan->slave) {
		sysfs_remove_link(&chan->dev->device.kobj, DMA_SLAVE_NAME);
	...
}

If dma_chan_put() frees the channel when the last device reference is dropp=
ed,
is it safe to access chan->slave and chan->dev afterwards to tear down
the sysfs links?

[Severity: High]
This is also a pre-existing issue, but does the RCU read side in
dma_issue_pending_all() race with synchronous device release?

dma_issue_pending_all() relies on an RCU read lock to traverse the device l=
ist:

drivers/dma/dmaengine.c:dma_issue_pending_all() {
	...
	rcu_read_lock();
	list_for_each_entry_rcu(device, &dma_device_list, global_node) {
		if (dma_has_cap(DMA_PRIVATE, device->cap_mask))
	...
}

However, dma_device_release() unlinks the device and synchronously frees
it without observing an RCU grace period:

drivers/dma/dmaengine.c:dma_device_release() {
	...
	list_del_rcu(&device->global_node);
	dma_channel_rebalance();

	if (device->device_release)
		device->device_release(device);
	...
}

Could the RCU reader dereference a struct dma_device that was just
freed by dma_device_release()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260816-dmaengine-=
kref-fix-v3-0-7e76187145df@amd.com?part=3D1
