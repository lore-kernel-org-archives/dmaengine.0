Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868DF3DEACC
	for <dmaengine@vger.kernel.org>; Tue, 26 May 2026 12:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779796880; cv=none; b=Px8CHe9BBGWacmuai6Y7NMQRMfavjXgULHZofsxVHWPFkdUbjPUBe0SxW9v0JGl7OmNTOHYIxZZGvz2agmOV82ifmwIHegxCqSZyj9T5HMu52LNVNGWz+lzI0ReOxV6h0Wxtm26IMcz6PKq354nL0ImyfFaD6Lw8wZJ9Xe/Yd/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779796880; c=relaxed/simple;
	bh=YgUPd+cjiN+VWjum0iL4ZbUXLLlV5xQMxkP3GBdqrdc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gdCKQXCKBgBzjCFWg6u1azzgSHO+cmzvEk6vWDE+Mx8yWRHGthXOsvw15lDe8RDzjAkacXaluNCqkrOH1jKs2HoY6Y6pxacIIeQkOFi+7gDiIaF2i0qcW5t8fXZhLD1biRCxIjQ0/jZv5km4UNakUSB96Lqek1Yk00REb1j3vPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CSaNyjbH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CSaNyjbH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FD4B1F000E9;
	Tue, 26 May 2026 12:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779796876;
	bh=Nj6PTf6K4MWAJzs8Zxkmxku1B29I3O5bUDq61UUwTVY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CSaNyjbHnC8smZdTc+2aQ08Y8a4t7M8bmkWU9TMThVaF0EQ0bidFfF70qg0wQhgu8
	 hTgXbDOm+u3w5GsmyklrMLuN3aeePPMl4MjSgRsh9Ix7HIQPfdOlzRnMAhkhsB4H1n
	 bPT8eqZ1sxeYKH7Uf8eyx9aupLtNVTl+YJ51cp6HulG6qTVm1Mbw0/YAuCWsc6t+mI
	 pjQ+tVD/B7v37wqgBx4C6l2JeeDOyCN9GW6z97zeYuX/5muGwSBQTEqkJrzKVs64dk
	 DAGIyhKDdf8cfijAgz7+az4wJfFY1J6imyFzESIi6p5bWQe90mtJU1pcdCorlJ/K0v
	 ovWgr7GqGgc8Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dmaengine: Fix device kref underflow in
 dma_chan_put()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shivank Garg" <shivankg@amd.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260526-dmaengine-kref-fix-v2-1-3df60afac01d@amd.com>
References: <20260526-dmaengine-kref-fix-v2-1-3df60afac01d@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 26 May 2026 12:01:14 +0000
Message-Id: <20260526120115.1FD4B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] RCU Use-After-Free during device release.
- [High] Double `list_del_rcu()` leading to list corruption and kernel cras=
h.
--

commit c36a9f0553b166fe38c0d70bbc4a093494dada44
Author: Shivank Garg <shivankg@amd.com>

dmaengine: Fix device kref underflow in dma_chan_put()

This commit fixes a kref underflow in dma_chan_put() by ensuring that the
device reference is dropped only on the last put, matching the slow-path
get. It prevents situations where a fast-path get/put pair drops an extra
reference, leading to a zero kref and a subsequent dma_find_channel()
returning NULL.

> diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
> index 405bd2fbb4a3b..605bfa477a004 100644
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

[Severity: Critical]
This is a pre-existing issue, but does device release here allow an RCU
use-after-free regression?

In dma_issue_pending_all(), the dma_device_list is iterated using
list_for_each_entry_rcu() under rcu_read_lock().

However, when a device is released, dma_device_release() removes it from
the list with list_del_rcu() and immediately calls device->device_release()
(which in many drivers, such as plx_dma.c, directly calls kfree()).

Because there is no synchronize_rcu() or equivalent mechanism to wait
for the RCU grace period before freeing the memory, concurrent RCU
readers in dma_issue_pending_all() can access freed memory, leading to
a use-after-free.

[Severity: High]
This is a pre-existing issue, but can the module unloading sequence
lead to a double list_del_rcu() regression and list corruption?

In dmaengine_get(), if dma_chan_get(chan) returns -ENODEV (which occurs
when the driver module is unloading and try_module_get() fails), it
explicitly calls list_del_rcu(&device->global_node).

Subsequently, the module's exit routine will call
dma_async_device_unregister(), which eventually calls dma_device_put().

If the reference count drops to zero here, dma_device_release() runs and
unconditionally calls list_del_rcu(&device->global_node) again.

Calling list_del_rcu() on an already unlinked list node manipulates
LIST_POISON pointers, predictably leading to a kernel crash.

>  	module_put(dma_chan_to_owner(chan));
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260526-dmaengine-=
kref-fix-v2-0-3df60afac01d@amd.com?part=3D1
