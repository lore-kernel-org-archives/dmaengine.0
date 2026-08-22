Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0A6CA6F
	for <dmaengine@vger.kernel.org>; Sat, 22 Aug 2026 19:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787427384; cv=none; b=HsrLsprfOEVuVuC9DcL7yy3QmEVa8azK9TLKa4zoiEznuxVloXbJWU38o524BfnFbMEbIw2MFXOC8Jf0Q3ihnk0AMhtoSYiaUxRxFCc0njwiCo9v9G3xcVXjeJB6HBluXpc+NKmUJozDzhxO7lczBNmiDF6rUD1iZV93O7E4Rzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787427384; c=relaxed/simple;
	bh=cpkSkFs7ubCL/hdAyvpdiVTMRa28t5fASxV9Q4ws4VI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ivlQ8UX7iHwz8qJbvS46Z63J0fDuy8RcnLyRm0U7xbVrYkWHUzGbN4LUISaRCxCmtMOLJ3Me3B862RpL9d7pfc/4MGcKh3WYhLD/mhH9gPEfWrXRPkfrwncM5t7fTbjfqYNboXckmNhV+6ssVEBFX3pfZXH38ltZtDCSpvx2RDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oYKG52B2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oYKG52B2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CA4B1F000E9;
	Sat, 22 Aug 2026 19:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787427382;
	bh=NF3NkaVIr+MelMQAX2rlytccrttcNH3avJ4+uWgXEx0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oYKG52B2QIVTL3G6VbG5phAaSWQSxMDhPHJJuPS+LU4GTcUfjVSZ+KZVP9PAzbgtr
	 3F0+rAEmOJbR6EItXZuFmjJIzWvkv0Um81IoYLFB7dTVKZqZhlK/D7E7XluAulDRQ4
	 biu6KcZSG0eTG+FdMStcUIAAjZhzsnb+I+MoUBCJzKqoeH3W3DVLzP4l0yIYQxqR6+
	 Sr/gNHbISFYUoIUjfx4B9eUOxEa8EtHuuMEDexV/RGPeMDrSfUhGElAafX01PRQYSc
	 e6ddGwmIOL5YxWSzAeP34c0oL63st9zsm39WYfHlzs19uufYjTPHPD1fuPQm15qsyw
	 DfDDDcitwSCCw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/4] dmaengine: wait for RCU readers before releasing
 dma_device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shivank Garg" <shivankg@amd.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260822-dmaengine-kref-fix-v5-4-d4a4ee47d927@amd.com>
References: <20260822-dmaengine-kref-fix-v5-0-d4a4ee47d927@amd.com>
 <20260822-dmaengine-kref-fix-v5-4-d4a4ee47d927@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 22 Aug 2026 19:36:21 +0000
Message-Id: <20260822193622.5CA4B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Double `list_del_rcu` on a device's global_node leading to list co=
rruption (`LIST_POISON2` splats) or kernel panic when a provider module is =
unloaded.
- [High] The exported functions `dma_async_device_channel_register` and `dm=
a_async_device_channel_unregister` call `dma_channel_rebalance()` without h=
olding the required `dma_list_mutex`.
- [High] Lockless TOCTOU race in `dma_issue_pending_all` between `chan->cli=
ent_count` check and `device_issue_pending` execution.
--

--- Patch [4]: [PATCH v5 4/4] dmaengine: wait for RCU readers before releas=
ing dma_device ---
commit 2e3a690f3e98bd55a6714eab025b6c1af7e3d406
Author: Shivank Garg <shivankg@amd.com>

dmaengine: wait for RCU readers before releasing dma_device
   =20
This patch introduces a synchronize_rcu() call before releasing the
dma_device in dma_device_release(). It ensures concurrent RCU readers in
dma_issue_pending_all() have finished traversing the list before the device
is freed.

Link: https://sashiko.dev/#/patchset/20260526-dmaengine-kref-fix-v2-0-3df60=
afac01d@amd.com

> dma_issue_pending_all() walks the dma_device_list with
> list_for_each_entry_rcu() under rcu_read_lock().

[Severity: High]
This is a pre-existing issue, but can this lead to a lockless TOCTOU race
between the client_count check and the execution of device_issue_pending()?

In dma_issue_pending_all(), the code locklessly checks if chan->client_count
is non-zero before calling device->device_issue_pending(chan). Concurrently,
dma_release_channel() or dmaengine_put() could acquire dma_list_mutex,
decrement client_count to zero, and tear down the descriptor rings.=20

If dma_issue_pending_all() stalls between the check and execution, could it
invoke device_issue_pending() on a channel that has just been released and
disabled?

> diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
> index 9214b9272a552..f9bc3e69fe58b 100644
> --- a/drivers/dma/dmaengine.c
> +++ b/drivers/dma/dmaengine.c
> @@ -428,6 +428,7 @@ static void dma_device_release(struct kref *ref)
> =20
>  	list_del_rcu(&device->global_node);

[Severity: High]
This isn't a bug introduced by this patch, but could this unconditional
removal result in a double list_del_rcu() and list corruption during module
unloading?

If try_module_get() fails in dma_chan_get() during a concurrent module
unload, dmaengine_get() or find_candidate() will manually execute
list_del_rcu(&device->global_node).=20

Later, when the unloading module calls dma_async_device_unregister() and
drops the final reference, dma_device_release() is invoked. Will this cause
a second list_del_rcu() on the same node and a kernel panic from
dereferencing LIST_POISON2?

>  	dma_channel_rebalance();

[Severity: High]
This is a pre-existing issue, but is it safe for exported functions to call
dma_channel_rebalance() without holding dma_list_mutex?

When drivers dynamically register or unregister channels using
dma_async_device_channel_register() or dma_async_device_channel_unregister(=
),
they call dma_channel_rebalance() completely unlocked.=20

Since dma_channel_rebalance() mutates the global channel_table and iterates
over dma_device_list without RCU protection, could concurrent structural
modifications to the list lead to data races or list corruption?

> +	synchronize_rcu();
> =20
>  	if (device->device_release)
>  		device->device_release(device);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260822-dmaengine-=
kref-fix-v5-0-d4a4ee47d927@amd.com?part=3D4
