Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE12399D0B
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 21:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785186411; cv=none; b=CiiuuixJQPGHy03qB5caMpakXhQ173WjtaxlecTti7W+oGuRxjxkfsACy9j/vFL18fSaK3Tih+r4KH0AnkOZt6PY2ST2MSySwUntuVqRaHKRCiR1do+6532yEFCB8wcf7FqMr8Jf61PmwvVWwHvPcV21TSoRn42PdU+8ZSo+qWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785186411; c=relaxed/simple;
	bh=OkIy9u+eiUM9JKMWkPeCMahrB+ubdevZnrnfRelqUC4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TpLmoXX9b/RFSUs9jRDcXfhWHwTh5aRlZj28Vy2DxLLTSWJFlTmkAwTnxw7bNwlQ/E+3lQbKJkqXrnT4kgNcr/F2ysf4klk1OL5smJt8Evg5snyE8foQ+r68ZBhgSWb8kKKCjpT4eyDO+HkjEg6y4YMFOkgUw3fyWQ65/d8NAws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g6t1SLat; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g6t1SLat"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D9441F00A3A;
	Mon, 27 Jul 2026 21:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785186410;
	bh=OkIy9u+eiUM9JKMWkPeCMahrB+ubdevZnrnfRelqUC4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g6t1SLatO341r7cabm9xKs4gZ4ZC8NMmh9L8WHE5yzwZiOXWr1PDhUYbmdxApZIuP
	 hjTPNOj/i9YWMkRmcQgMn7FGGvpEcUeI1U80PZwbhsue1lFfgy+bh7x9dH9ZiAEjaP
	 MrxjzN3YajPU7dKUdPyQYB70yX7PkSVNkqmlFRq2QTHdONkWE5sb3l3OJk4mx0t5lm
	 104SqjUs73TUz5Y+t9clTR6hoUjP2zVz6yPk37s7B7MPBe7SwKSF6HD8rGU/mGHN6l
	 x93BnzIYhQzj3jfMDXdQCdv5UyVCsUYzCq6UJtSLOj8LxihfLywlIpBcQeVdINo+Bl
	 /hWek3og15jsw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 35/64] dmaengine: altera-msgdma: use channel BH
 helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: dmaengine@vger.kernel.org, Frank.Li@kernel.org, vkoul@kernel.org
In-Reply-To: <b32241f06e946fd7bf92a4f2baccd23396db630b.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <b32241f06e946fd7bf92a4f2baccd23396db630b.1785183549.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 21:06:49 +0000
Message-Id: <20260727210650.0D9441F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The device interrupt is requested before essential locks, lists, a=
nd bottom-half structures are initialized, risking a crash if an interrupt =
fires early.
- [High] Missing dma_async_device_unregister() in the probe error path caus=
es Use-After-Free.
--

--- Patch [35]: [PATCH v2 35/64] dmaengine: altera-msgdma: use channel BH h=
elpers ---
Note: The format of this review has been altered to use a free-form summary=
=20
rather than inline diff quoting due to strict recitation restrictions.

commit bf40fd1cbe95a4c51ca6b86e4123ac5282a06f01
Author: Allen Pais <allen.lkml@gmail.com>
Subject: dmaengine: altera-msgdma: use channel BH helpers

Replace the device tasklet with the per-channel BH helper so completion=20
handling runs via dma_chan_*_bh.

[Severity: High]
This isn't a bug introduced by this patch, but looking at msgdma_probe() in=
=20
drivers/dma/altera-msgdma.c, the interrupt is requested via=20
devm_request_irq() before mdev->lock, the pending_list, and the bottom-half=
=20
structures are initialized.

If a pending hardware interrupt fires immediately, could msgdma_irq_handler=
()=20
execute and attempt to acquire the uninitialized mdev->lock? Furthermore, i=
f=20
it then calls msgdma_start_transfer(), it appears list_first_entry_or_null(=
)=20
on the zero-initialized pending_list would return an invalid pointer. Would=
=20
this cause a page fault during list_splice_tail_init() when it subsequently=
=20
evaluates list_empty() inside the splice operations? Is it possible to move=
=20
the devm_request_irq() call after all these structures and lists are fully=
=20
initialized?

[Severity: High]
This is also a pre-existing issue, but I have a question about the error=20
handling further down in msgdma_probe().

If of_dma_controller_register() fails with an error other than -EINVAL or=20
-ENODEV, the code jumps to the fail label and calls msgdma_dev_remove().=20
However, msgdma_dev_remove() only cleans up the IRQ and bottom half, withou=
t=20
calling dma_async_device_unregister().

Since dma_async_device_register() was already called earlier in the probe=20
function, won't devres subsequently free the mdev structure while the DMA=20
engine core still holds pointers to its embedded dma_dev and channels? Coul=
d=20
this lead to a use-after-free if the DMA engine core later traverses its=20
channel lists? Does dma_async_device_unregister() need to be added to the=20
cleanup path?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785183549.gi=
t.allen.lkml@gmail.com?part=3D35
