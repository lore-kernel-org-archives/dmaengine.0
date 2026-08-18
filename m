Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F373D3D18
	for <dmaengine@vger.kernel.org>; Tue, 18 Aug 2026 03:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787025516; cv=none; b=IjamRdyNb8CDKKNh8FPxR4TMVOh/uTHa/qnZQG25a5PMAq/PaUeV46hLu3qPPBUWlAraoWM7PRM+r7nmk07X0FReKydqvO1uqSc7P4QG3yvNSt0fWBx8FZUyrHasQr1OjpANFScWrGJ79j+r4jIBshm+MS4F0SY+nHmT8Fj4eB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787025516; c=relaxed/simple;
	bh=bFG4mJUE9vNao0xCzhE5l42zb+dUNprH5nfQ6UG5joc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rSFWph1vHgyRGudVMtdBYUd6DebTf5OsNoZrrb+d+UHLnbvEL19wwRj3gDxuLNlQk7WhvaNyJaHPiTor5kqJkvFRNIMh+r/d0y7tqC3db7UKPQocVUm6PPXWtI0w+ttyklARwEgif7UnowPm2d+RTAPBUshBmEppfuLzhF5GI4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TrVPrFWv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TrVPrFWv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9343F1F000E9;
	Tue, 18 Aug 2026 03:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787025514;
	bh=8xrTZIHTFzCetaesSGovQ6urows9O41EMn6sGxBZwQM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TrVPrFWv4hU8i8ea4N6Fwn1YpX2LzW08oUQ50etNQ7fq0BrDQ3ZFvILHtp3dZjWx2
	 kiYVqT3dW+Axrig+cJ7ZBb9YYBFmLa0AXzhb2rBIjkxvoaxiEddzILTtBekmlFS9Hb
	 nHZ6A1UMhfpjzCmqJdh+eqRGTWiFKY7Fb5HsD53LK+dXonUt6V1JLcH8B8Gx8ey6Z1
	 pCpiHm7ls6EB1Tiv35b5cgmpyGmdXphJDeHoVMw9bz8Okf/x7X+pDVZW6qWOPSHb2D
	 c63vSOfUDSwjuhMsGVrtPcWwQ2EBywRF4vcPaaysrt9rnEIZp0F3q9qmkLwPQb9Ujj
	 WpXV2wr0CYLGw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/4] dmaengine: Fix device kref underflow in
 dma_chan_put()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shivank Garg" <shivankg@amd.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260818-dmaengine-kref-fix-v4-2-c6ef991462a0@amd.com>
References: <20260818-dmaengine-kref-fix-v4-0-c6ef991462a0@amd.com>
 <20260818-dmaengine-kref-fix-v4-2-c6ef991462a0@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 03:58:34 +0000
Message-Id: <20260818035834.9343F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Dereferencing `chan->device->owner` in `dma_chan_put()` after `dma=
_device_put(chan->device)` may access freed device memory.
- [High] Accessing `chan` members in `dma_release_channel()` after dropping=
 the final reference in `dma_chan_put()`.
- [High] Traversing the RCU list in `dma_issue_pending_all` races with devi=
ce memory freeing due to a missing RCU grace period.
- [High] New channels can be requested and allocated from a DMA device that=
 has already been unregistered and unbound.
--

--- Patch [2]: [PATCH v4 2/4] dmaengine: Fix device kref underflow in dma_c=
han_put() ---
commit 7dc19aec12ae9d7422f3459f7a5276b21afb0ad9
Author: Shivank Garg <shivankg@amd.com>

dmaengine: Fix device kref underflow in dma_chan_put()

This commit addresses a device reference counting underflow by ensuring
dma_device_put() is only called when chan->client_count reaches zero. It
matches the slow-path reference taken in dma_chan_get().

> diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
> index 77638dc16e71d..3ae53e11e54a6 100644
> --- a/drivers/dma/dmaengine.c
> +++ b/drivers/dma/dmaengine.c
> @@ -520,7 +520,9 @@ static void dma_chan_put(struct dma_chan *chan)
>  		chan->route_data =3D NULL;
>  	}
> =20
> -	dma_device_put(chan->device);
> +	/* This channel is not in use anymore, drop the device ref */
> +	if (!chan->client_count)
> +		dma_device_put(chan->device);
>  	module_put(dma_chan_to_owner(chan));

[Severity: High]
This is a pre-existing issue, but does this code risk a use-after-free of t=
he
device memory?

When dma_device_put() drops the final reference, the driver's release callb=
ack
can free the device memory. Evaluating dma_chan_to_owner(chan) immediately
afterward will dereference chan->device->owner from the potentially freed
device.

[Severity: High]
This isn't a bug introduced by this patch, but can we access a freed channel
structure in dma_release_channel()?

dma_release_channel() calls dma_chan_put(chan). If this drops the last devi=
ce
reference, the DMA device and its embedded dma_chan structures can be freed.

Immediately following this, dma_release_channel() accesses the channel to
perform cleanup tasks:

drivers/dma/dmaengine.c:dma_release_channel() {
	...
	dma_chan_put(chan);

	if (chan->slave) {
		sysfs_remove_link(&chan->dev->device.kobj, DMA_SLAVE_NAME);
		sysfs_remove_link(&chan->slave->kobj, chan->name);
		kfree(chan->name);
	...
}

Does this sequence cause memory corruption if the channel is freed?

[Severity: High]
This is a pre-existing issue, but is there a race condition between
traversing the RCU list and freeing device memory?

dma_issue_pending_all() iterates over dma_device_list under an RCU read loc=
k:

drivers/dma/dmaengine.c:dma_issue_pending_all() {
	rcu_read_lock();
	list_for_each_entry_rcu(device, &dma_device_list, global_node) {
	...
}

Concurrently, dma_device_release() removes a device from the list and
immediately calls its release callback without waiting for an RCU grace
period:

drivers/dma/dmaengine.c:dma_device_release() {
	...
	list_del_rcu(&device->global_node);
	dma_channel_rebalance();

	if (device->device_release)
		device->device_release(device);
}

If the driver synchronously frees the memory, could the concurrent traversal
in dma_issue_pending_all() dereference a freed pointer?

[Severity: High]
This isn't a bug introduced by this patch, but can new channels be requested
from a DMA device that has already been unregistered?

When a driver is unbound, dma_async_device_unregister() sets DMA_PRIVATE
to hide the device and drops its kref:

drivers/dma/dmaengine.c:dma_async_device_unregister() {
	...
	dma_cap_set(DMA_PRIVATE, device->cap_mask);
	...
}

However, if the device has other active channels, it remains in the list.
When __dma_request_channel() searches for a candidate, it calls
private_candidate():

drivers/dma/dmaengine.c:private_candidate() {
	...
	if (dev->chancnt > 1 && !dma_has_cap(DMA_PRIVATE, dev->cap_mask))
		list_for_each_entry(chan, &dev->channels, device_node) {
	...
}

Because DMA_PRIVATE is set, this multi-channel exclusivity check is bypasse=
d.
Could this allow an idle channel to be allocated and its hardware accessed
even after the driver has completed its cleanup and powered off the hardwar=
e?

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818-dmaengine-=
kref-fix-v4-0-c6ef991462a0@amd.com?part=3D2
