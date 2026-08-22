Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D443632AAA8
	for <dmaengine@vger.kernel.org>; Sat, 22 Aug 2026 19:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787427450; cv=none; b=eQTsVw6Dksdk8XYXC8SNxlD2cGYS6x3mwyNw1rC+/WA2D+SgEO11zfKp/vFFdbqWTt9HssirTP9ai6dcJoou97erKSCGx4s7yyp9YNLW9nYorGfFXD9/eMDbWvoztLsk9R/SC9eOGsgwrvsiZCH0oAmafUv9VfJwrx7MJ43dM3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787427450; c=relaxed/simple;
	bh=Eu4FomL2jFTqXnltOpNqR7zZe+bTkkZzbTXJOXWDpes=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kq4YaU1s7t3IrOMP1fUnpWHxwq5lHTO5w/jxP7pshZ1HyLhYNgxG1dfLqnKdOsM9Aw5iJhAHAAUgc69qcmOz16aEAld+e12NU2aC2u4eI/KvroljYTVgUt+pZQLHQzmfD4do97TVQ6ICZBVSfQqzcZlv+FNFarqkXd71ziMaByM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ER6dZhIj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ER6dZhIj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 424F21F000E9;
	Sat, 22 Aug 2026 19:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787427448;
	bh=0S3k4hru0h1768x1fbJJmuaK/L//DVZxFMdFYNt0b5Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ER6dZhIjTb3Tg8XQwRpH9YS3keXmEWFHrx0gUZSVPe3viwhuO7PICkbKN0d1Sek6P
	 M6kCqO8zoP/X9OBP0dHfEyemPNcuTtVQr1cxuBcvXINmBxued0zqD8BMvt1rK+uWiX
	 RUQcbuXnYhmUNfqtFOcSHA5hGlH2Lr9yg+Ge30y4YDegH8NSHH//HNepPNoM8ejtvf
	 kWGTIAaXl1haQxWf8aB2dUuXBVbMGR4UXBtYgDyksI0v4Cn92fhBYiTaKGhFmOXJTm
	 A/+RhgQW2UPrwsz9VYIAS3he4opZkW5fK0/z/VkZitwFu6WMG/5Yoa1ibZDICX5lcc
	 sq5yUyaq6PWYw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/4] dmaengine: fix use-after-free in dma_chan_put()
 and dma_release_channel()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shivank Garg" <shivankg@amd.com>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260822-dmaengine-kref-fix-v5-3-d4a4ee47d927@amd.com>
References: <20260822-dmaengine-kref-fix-v5-0-d4a4ee47d927@amd.com>
 <20260822-dmaengine-kref-fix-v5-3-d4a4ee47d927@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 22 Aug 2026 19:37:27 +0000
Message-Id: <20260822193728.424F21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unpatched Use-After-Free in dma_release_channel() due to dereferen=
cing the channel after dma_chan_put().
- [High] Leaked channel, device, and module references in dmaengine_put() f=
or unregistered public devices.
- [High] Double list_del_rcu() on device->global_node causes list corruptio=
n and kernel panic.
--

--- Patch [3]: [PATCH v5 3/4] dmaengine: fix use-after-free in dma_chan_put=
() and dma_release_channel() ---
commit f921c2034a3380b885abc856562df23d25421487
Author: Shivank Garg <shivankg@amd.com>

dmaengine: fix use-after-free in dma_chan_put() and dma_release_channel()

When dma_device_put() drops the last reference on chan->device->ref,
dma_device_release() runs and may free the dma_device along with its
channels. This patch caches the module owner in dma_chan_put() before the
put so the trailing module_put() does not need chan->device, preventing
a use-after-free caught by kasan.

Link: https://sashiko.dev/#/patchset/20260518-dmaengine-kref-fix-v1-1-4d612=
5048fb7@amd.com

> diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
> index f2760b039d932..9214b9272a552 100644
> --- a/drivers/dma/dmaengine.c
> +++ b/drivers/dma/dmaengine.c
[ ... ]
> @@ -523,7 +526,7 @@ static void dma_chan_put(struct dma_chan *chan)
>  	/* This channel is not in use anymore, drop the device ref */
>  	if (!chan->client_count)
>  		dma_device_put(chan->device);
> -	module_put(dma_chan_to_owner(chan));
> +	module_put(owner);
>  }

[Severity: High]
This isn't a regression introduced by this patch, but since this commit
addresses a use-after-free involving dma_chan_put(), does
dma_release_channel() have a similar issue?

If dma_async_device_unregister() was called earlier, dropping the base devi=
ce
reference, calling dma_release_channel() will invoke dma_chan_put(). This
decrements the client count to zero, calls dma_device_put(), and drops the
final reference, freeing the device and its embedded channel structure.

However, immediately after dma_chan_put(), dma_release_channel() dereferenc=
es
the freed channel:

drivers/dma/dmaengine.c:dma_release_channel() {
	...
	dma_chan_put(chan);

	if (chan->slave) {
		sysfs_remove_link(&chan->dev->device.kobj, DMA_SLAVE_NAME);
	...
}

Does this cause a use-after-free when accessing chan->slave, chan->dev,
and chan->name?

[Severity: High]
This is a pre-existing issue, but I noticed a potential resource leak in
how unregistered public devices are handled.

When dmaengine_get() allocates public channels, it increments
chan->client_count and takes device and module references. If the device is
subsequently unregistered, dma_async_device_unregister() sets the
DMA_PRIVATE flag to hide it:

drivers/dma/dmaengine.c:dma_async_device_unregister() {
	...
	dma_cap_set(DMA_PRIVATE, device->cap_mask);
	...
}

When dmaengine_put() runs later, it explicitly skips any device with
DMA_PRIVATE set:

drivers/dma/dmaengine.c:dmaengine_put() {
	...
		if (dma_has_cap(DMA_PRIVATE, device->cap_mask))
			continue;
		list_for_each_entry(chan, &device->channels, device_node)
			dma_chan_put(chan);
	...
}

Since dma_chan_put() is never called for the channels of the unregistered
device, does this permanently leak chan->client_count, the module reference,
and the device kref?

[Severity: High]
This is a pre-existing issue, but is there a risk of list corruption due to=
 a
double list deletion?

In find_candidate() and dmaengine_get(), if dma_chan_get() fails with -ENOD=
EV
(such as when the backing module is being unloaded), they proactively remove
the device from the list:

drivers/dma/dmaengine.c:find_candidate() {
	...
			if (err =3D=3D -ENODEV) {
				...
				list_del_rcu(&device->global_node);
	...
}

When the driver's exit routine subsequently executes
dma_async_device_unregister(), it drops the device reference and eventually
invokes dma_device_release(). This unconditionally deletes the node again:

drivers/dma/dmaengine.c:dma_device_release() {
	...
	list_del_rcu(&device->global_node);
	...
}

Can this double list_del_rcu() on device->global_node corrupt the
doubly-linked list?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260822-dmaengine-=
kref-fix-v5-0-d4a4ee47d927@amd.com?part=3D3
