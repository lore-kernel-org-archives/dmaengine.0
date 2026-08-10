Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A092B2F12DA
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786387475; cv=none; b=kCMRY1Wr2ihzzMEYFk6IlivD7W9u9BcjXIhqM2dDjUssG6qZigwqsu/wuxrOErMghOTm3Hl/sqTXPROXgK43si+vohNEY0iENs1hLIB0PwhGTVrBDTy01d4heMe1tOLqIeQPeFuCNI2ZBZEHyvbnI5FrxU8sdBr9N2+MgcBLYyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786387475; c=relaxed/simple;
	bh=QRiFQC1Bck2dxuTp4yloK+56tvX7NPHyJ/GtFSj236g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=G/cBKo1aSd+5sJm7wPc2UZRNmu7qhI14V99dtBS/nEMMMH8WM4/o51HzjtQvKVzvirGlAnBBGCUZ1gvBeooiF0wDQk8CQvM8hPFgFJij5vOSaGxmKYmZxSzyO3BtTiYrInBTlzH9rcLWyHSO59vdOPPxotDhAsk6+RJ9QtP0ZWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Im9OoEJz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Im9OoEJz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 409E51F00A3A;
	Mon, 10 Aug 2026 18:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786387474;
	bh=hteF/ZJdKH5bCAEVeCDCE2PFKs8zZi+l3GBBdQCHueU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Im9OoEJzur3CN68FqHZr21OjVKgaTuwITRIJm0YpIhIE+TvvBdnN3os+XnZa2cVRI
	 ndlh44LVKQGM0itrC5xXK9jT9dFSZHEa3Wa+jZcku7d1TQ5r3T1yzblZ+boC2QlLo7
	 dPjyG1M894EPmm5L57SX/8XiNW0eAdcKDBFanzXS1BoBD801kcxOouNgG8nzGOeUwg
	 wTm0jzmbfnhc9xs4pLQy/+5/SLafPuBgigTgRPkeglL2ZIgy4xsn9Lh7pr+3fOwqQf
	 cbKbjN3XAmr4L/4lRkux1lyM8RwF/ZKTIAr0hI8TvbIfDZIKWkGYeUyemwg8k8eeDX
	 lM8IsB+O05JGQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 31/34] dmaengine: dw: defer callbacks via channel BH
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: dmaengine@vger.kernel.org, Frank.Li@kernel.org, vkoul@kernel.org
In-Reply-To: <51d53a46331dd58a67e71cb8c53c6e67f4b5503e.1786384169.git.allen.lkml@gmail.com>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <51d53a46331dd58a67e71cb8c53c6e67f4b5503e.1786384169.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 18:44:33 +0000
Message-Id: <20260810184434.409E51F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but dropping the cha=
nnel lock during list iteration in `dwc_scan_descriptors` causes a Use-Afte=
r-Free if `dwc_terminate_all` runs concurrently.
--

--- Patch [31]: [PATCH v3 31/34] dmaengine: dw: defer callbacks via channel=
 BH ---
commit 15e9633a2c2daf5f60e16d885a4f6398581bad8b
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: dw: defer callbacks via channel BH

This commit defers DMA descriptor callbacks to a per-channel bottom half
workqueue instead of running them from the controller tasklet. It introduces
a completed_list to hold descriptors pending callbacks and adds a synchroni=
ze
hook to ensure termination waits for the BH to complete.

> diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
> index dd75f97a33b3d..2765acfe56443 100644
> --- a/drivers/dma/dw/core.c
> +++ b/drivers/dma/dw/core.c
[ ... ]
> @@ -965,6 +982,11 @@ static int dwc_terminate_all(struct dma_chan *chan)
>  	return 0;
>  }
> =20

[Severity: High]
This isn't a bug introduced by this patch, but dropping the channel lock
during list iteration in dwc_scan_descriptors() causes a Use-After-Free if
dwc_terminate_all() runs concurrently.

dwc_scan_descriptors() iterates over dwc->active_list using
list_for_each_entry_safe(). The loop iterator caches _desc (the next elemen=
t).
Before processing the next element, the lock is dropped to call
dwc_descriptor_complete():

	list_for_each_entry_safe(desc, _desc, &dwc->active_list, desc_node) {
		...
		spin_unlock_irqrestore(&dwc->lock, flags);
		dwc_descriptor_complete(dwc, desc, true);
		spin_lock_irqsave(&dwc->lock, flags);
	}

If dwc_terminate_all() runs concurrently on another CPU, it acquires the lo=
ck,
splices active_list into a local list, and frees all of its descriptors:

	spin_lock_irqsave(&dwc->lock, flags);
	...
	list_splice_init(&dwc->active_list, &list);
	spin_unlock_irqrestore(&dwc->lock, flags);

	list_for_each_entry_safe(desc, _desc, &list, desc_node)
		dwc_descriptor_complete(dwc, desc, false);

When dwc_scan_descriptors() regains the lock, it advances the iterator to
_desc, which has now been freed.

Can we address this to prevent memory corruption when channel operation and
termination occur concurrently?

> +static void dwc_synchronize(struct dma_chan *chan)
> +{
> +	dmaengine_kill_bh(chan);
> +}
> +
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786384168.gi=
t.allen.lkml@gmail.com?part=3D31
