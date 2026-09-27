Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD00C280035;
	Sun, 27 Sep 2026 00:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790469600; cv=none; b=Y5F5TQEW51Mmz7I3Ye6Th+HLcnoW0WQQxUOrSzMGoBTiZvelMapxKl/WWUboOc88LThMZhrfxVR/l0h7avn0jYMhM8o1pKfZVdJS2EjdpxYLU9jt+FyLl+BoNUdwNV1LHrDTuHnlrsGJO+B63JUgx/X9opAtbt2nLUl8L7qK6eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790469600; c=relaxed/simple;
	bh=GCzP6euvKpSYuYQThYgcbJ04uTy/NJFMXHRYs7e/a1M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WADT/1+LebACT1NYE1pBML9bW1RdKE+BePWCgJPYpCj6SpTieUl5Wy/4k/9sOlZd1sX8lQyQnu4gN7ZAyLx06XGBMZ55j8ZLTyfFCuZ9OGUhf1xb7HruS8BqYefrMA7HDV/zcElyRBpcei/mILhfpj3vJ79RcjT3PVHNDHocDBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=Brvy0TWM; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="Brvy0TWM"
Received: from seu.edu.cn (unknown [223.112.146.162])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4f364003f;
	Sun, 27 Sep 2026 08:39:52 +0800 (GMT+08:00)
From: Slavin Liu <bolin.liu@seu.edu.cn>
To: vkoul@kernel.org
Cc: Frank.Li@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	bolin.liu@seu.edu.cn
Subject: [PATCH 1/2] dmaengine: sun6i: Fix use-after-free in slave sg LLI error cleanup
Date: Sun, 27 Sep 2026 08:39:50 +0800
Message-Id: <20260927003951.11210-1-bolin.liu@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0e04dd51403a1kunm4a399e5a199cc7
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDQhpMVk9LGhgeSkkdSB9NQlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVSkpJVUpPTVVKTUlZV1kWGg8SFR0UWUFZT0tIVUpLSU
	hOQ0NVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=Brvy0TWMlY4NSwnTMHliFyYzDnDuLaujYzQdtIlfTpcArAwP+aDFVpeDSoLCV8fTtJmFYS5BK0SMFRe/s4EnHabAeRUjiMGATmVZ3JtbkVAFRc/YG45+dVd68Yt3PmyMIs4C5bLBhWpwxam39Xte9r9vAoOUvcGwtKIlCGb3IvQ=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=EPZVT0iLAUIySdD3wN4FpEinf/bsqEsqXSgFqjUbfTg=;
	h=date:mime-version:subject:message-id:from;

sun6i_dma_prep_slave_sg() chains one pool-allocated LLI per
scatterlist entry.  When a later dma_pool_alloc() fails (GFP_NOWAIT,
so it does not wait for reclaim, making failure realistic under memory
pressure), the err_lli_free path walks the chain to free what was
built: the loop body hands the current LLI back to the pool with
dma_pool_free(), and the for-loop increment then reads
v_lli->p_lli_next and v_lli->v_lli_next from the memory that was just
freed and may already have been reallocated.

Cache both next fields of the current LLI before freeing it.

Fixes: 4fbd804e009a ("dmaengine: sun6i: Fix memory leaks")
Assisted-by: LLM
Signed-off-by: Slavin Liu <bolin.liu@seu.edu.cn>
---
 drivers/dma/sun6i-dma.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 7704b016aed8..025a43d0298d 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -790,9 +790,14 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_slave_sg(
 	return vchan_tx_prep(&vchan->vc, &txd->vd, flags);
 
 err_lli_free:
-	for (p_lli = txd->p_lli, v_lli = txd->v_lli; v_lli;
-	     p_lli = v_lli->p_lli_next, v_lli = v_lli->v_lli_next)
+	for (p_lli = txd->p_lli, v_lli = txd->v_lli; v_lli;) {
+		dma_addr_t next_p_lli = v_lli->p_lli_next;
+		struct sun6i_dma_lli *next_v_lli = v_lli->v_lli_next;
+
 		dma_pool_free(sdev->pool, v_lli, p_lli);
+		p_lli = next_p_lli;
+		v_lli = next_v_lli;
+	}
 	kfree(txd);
 	return NULL;
 }
-- 
2.34.1

