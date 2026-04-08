Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552083C4572;
	Wed,  8 Apr 2026 12:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775652112; cv=none; b=GqSju7c4t3Jv5PRAnDZYZIbk97cWy5MQ8kGDYt6nFsoPC6ZqJsP+xj3K60ZiHuX0WYyWNV2VcwaRvYAwOwmBlwBFnUaMy1UlBYTaptT2bTqQJUP5P9pf+6YlevDnXWeNHnYPqdOz6wjVplDJ5f/jV5mqyW/TRZ1/LsKHZJ9zUFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775652112; c=relaxed/simple;
	bh=tM8m65XuDlt5RZNy9a9VEBHaYpJqz9qh0EbGJHjxdUg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=np8X0GeSDrzmzZaDT9aNFnEatviNQs3/VgUeGVOFbQQq9Vq1rGS5qm/MCD9/824mRGLsZ9DgthnWSQME9q1TuSrUAV6/qZ+wsjbvL/l6AvxuQptiUloJsooBipXMHVMWInwst9Adc07Lr4uxLtLQjmPQ3xxL/jcGyi3mnjrNRJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uEqZsy1D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uEqZsy1D"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EB2A0C2BCAF;
	Wed,  8 Apr 2026 12:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775652112;
	bh=tM8m65XuDlt5RZNy9a9VEBHaYpJqz9qh0EbGJHjxdUg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=uEqZsy1D6iBY0SI0DEX43ndQO/dkztpntLR4jXZ/3MQ3PGBlbmiSqkWqxuszOSGUG
	 eha8J1KGhYJXHomuoYLMZWw7lGWmJkKvfOq4baQEhKA7AeuW7GeY36MrNLhcK/JuTd
	 W2L2HdmhmavX/l9DEEo898uLiZ29x1ZcqsdF+76PcrCHGzwjaOZex+vDExxuA78D7v
	 H70Rguh0cvDqo/1CcMS0kLlGubsaOR5uVimMbz+IUPOp+0Rs6anTwwjLNkQQQVpxjR
	 EJfusfhRNdCGW/ROruaXWMDgecHpndKPnG41yvXiA9RC/5ufgj5pKMdhlmRqoarMHY
	 iRjGNxAZBrNtA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D475B1073CA8;
	Wed,  8 Apr 2026 12:41:51 +0000 (UTC)
From: =?utf-8?q?Nuno_S=C3=A1_via_B4_Relay?= <devnull+nuno.sa.analog.com@kernel.org>
Date: Wed, 08 Apr 2026 13:42:40 +0100
Subject: [PATCH v3 1/4] dmaengine: Fix possible use after free
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260408-dma-dmac-handle-vunmap-v3-1-2456ad292154@analog.com>
References: <20260408-dma-dmac-handle-vunmap-v3-0-2456ad292154@analog.com>
In-Reply-To: <20260408-dma-dmac-handle-vunmap-v3-0-2456ad292154@analog.com>
To: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775652161; l=1349;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=6XbKWWnu/XLY2+T0r/woFDDSj9C/H1ATZbhK/NSCskE=;
 b=+BZ++WfuTRR3OxUZPiujlmtxeI7Iicl4JzpuyEQ9qRfF3aMt3YU53A2ibkdNO0+ntfemOTx7o
 FElg/27DZC+Czle7yzEylssm6eTFQsrpr1KiVOUi9GGgVVu9IB81yvv
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-Endpoint-Received: by B4 Relay for nuno.sa@analog.com/20231116 with
 auth_id=100
X-Original-From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Reply-To: nuno.sa@analog.com

From: Nuno Sá <nuno.sa@analog.com>

In dma_release_channel(), we first called dma_chan_put() and then
checked chan->device->privatecnt for possibly clearing DMA_PRIVATE.
However, dma_chan_put() will call dma_device_put() which could,
potentially (if the DMA provider is already gone for example),
release the last reference of the device and hence freeing
the it.

Fix it, by doing the check before calling dma_chan_put().

Fixes: 0f571515c332 ("dmaengine: Add privatecnt to revert DMA_PRIVATE property")
Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
 drivers/dma/dmaengine.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
index 405bd2fbb4a3..9049171df857 100644
--- a/drivers/dma/dmaengine.c
+++ b/drivers/dma/dmaengine.c
@@ -905,11 +905,12 @@ void dma_release_channel(struct dma_chan *chan)
 	mutex_lock(&dma_list_mutex);
 	WARN_ONCE(chan->client_count != 1,
 		  "chan reference count %d != 1\n", chan->client_count);
-	dma_chan_put(chan);
 	/* drop PRIVATE cap enabled by __dma_request_channel() */
 	if (--chan->device->privatecnt == 0)
 		dma_cap_clear(DMA_PRIVATE, chan->device->cap_mask);
 
+	dma_chan_put(chan);
+
 	if (chan->slave) {
 		sysfs_remove_link(&chan->dev->device.kobj, DMA_SLAVE_NAME);
 		sysfs_remove_link(&chan->slave->kobj, chan->name);

-- 
2.53.0


