Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412091DDFE;
	Sun, 27 Sep 2026 00:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790469600; cv=none; b=Kk8bNTFHf2no9LNzDILWaRN+QklMj2xu0g9afW5I/gM2uJjjL6j9bTDkTIiFKsnBstY3TAbakYSBSjWOv594vQjPpZCLV7JMOc0uwJQ+fd3kHA7D8xU/9aRKCZYi992hP47jItjQM/dWKReNaxxyMDa7CFJVKwZt7RBAGsldC20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790469600; c=relaxed/simple;
	bh=hY6PEDOCypzgDYKp1Pzq02e0IR+XAqV6pzMOQ7GbZ6M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lS8IknDPhCwQu8J5oztCE67+YrZ3Z8a3a0DLJ59F5ULOTe+qNQ0F0hcflIpK9grUUz9bheEmvN8yuRvfW6stSVS+O1Y8K5lmQk3pmJkgOx9jfYzlCyXtY00TCqenxCiEYzw3/7Rv3fJiAD0nmZc5WdkfuVKmT9xKQTHVZVyF3rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=Qv8ifEVn; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="Qv8ifEVn"
Received: from seu.edu.cn (unknown [223.112.146.162])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4f3640040;
	Sun, 27 Sep 2026 08:39:53 +0800 (GMT+08:00)
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
Subject: [PATCH 2/2] dmaengine: sun6i: Fix use-after-free in cyclic LLI error cleanup
Date: Sun, 27 Sep 2026 08:39:51 +0800
Message-Id: <20260927003951.11210-2-bolin.liu@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260927003951.11210-1-bolin.liu@seu.edu.cn>
References: <20260927003951.11210-1-bolin.liu@seu.edu.cn>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0e04dd8fd03a1kunm4a399e5a199ccb
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCGBkZVksdQk8ZQkMfQx0eTlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVSkpJVUpPTVVKTUlZV1kWGg8SFR0UWUFZT0tIVUpLSU
	hOQ0NVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=Qv8ifEVncZzTPztmWlYQJWRhMdWhrWKsTxnnyfWqrf7IxnVsut/D1vgdJD3prvWSCbAX74CHj0lqZSMWgcgJOzN15vuzXQYjFFAi2FMStlPZsSF0VDYeoE0VmbkLCU7WNjDcBvhQ3o7GK/cBSIJPxdpzYFGfVV9lrDHtLyJeihc=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=hyzCXCa5mKGjYrQQ4pIYenV4b4psqdzT9oL39eHS+S8=;
	h=date:mime-version:subject:message-id:from;

sun6i_dma_prep_dma_cyclic() allocates one pool-allocated LLI per
period (audio drivers routinely use several periods).  When a later
dma_pool_alloc() fails, the err_lli_free path frees each chained LLI
with dma_pool_free() in the loop body while the for-loop increment
reads v_lli->p_lli_next and v_lli->v_lli_next from the LLI that was
just returned to the pool and may already have been handed out again.

Cache both next fields of the current LLI before freeing it.

Same pattern as fixed in the slave sg path in the previous patch.

Fixes: a90e173f3faf ("dmaengine: sun6i: Add cyclic capability")
Assisted-by: LLM
Signed-off-by: Slavin Liu <bolin.liu@seu.edu.cn>
---
 drivers/dma/sun6i-dma.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 025a43d0298d..4d6ee2fbd682 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -876,9 +876,14 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_cyclic(
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

