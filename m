Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3455144E675;
	Sun, 20 Sep 2026 19:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789930805; cv=none; b=coiUwIyqKA4CpNxGurK3bH/kuMbUWX11M9iy8e8apmWxPFom0oTqaUR2buXHV6VOIFJcqVfFy3MybW2PVsCB98NMDug5oRc/uOQwyv++8nEyd3ZTy2u6iGcx1yFaT8xkqFObZRn5lbeQPeNbcmQrH4JVfpUAme/39RKA0GIvGLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789930805; c=relaxed/simple;
	bh=2/zfxR9kGjz4VAet9QAvxCi+Eo5kR70ydJtAJe08vG8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s3e5Goz88uZVNssvZHFxBRpf2WSiR0yt7NrVcvvP42dEeKUkYn1Z1O+96AsAWiuz03M/AT6U77pMF6AKO+Z563qJ34nyxZ3mxU8rYxpPWG+LR3dgVekppHHwiQqzLLL1zcxCr9J8d+nUVjOzELKKn+GXLdBx3eseUG0XTTHoU90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yxo1S5Kd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yxo1S5Kd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AE681F00899;
	Sun, 20 Sep 2026 19:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789930803;
	bh=DKEAaHO/Amez5FFNbbFR0eP3LsiPHdjZ9sZOaizAqkU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Yxo1S5KdB0s7jy9O5A10WDDeyvmRxdylMHz8NiLoX6LpubXmdTUj0yZmG3jvslRvz
	 EVDfLVGr4O9xgfZSDtfmonTJ34s8k0jkjyzOPMfQ3OlIhLgM9cvEKHTcBGNzDdDU9N
	 5tqYjJlh5KloXQmX9XRRif8eHj3brQgVfmbLunHAY9OcPXHizGTUxnhLs3Aj6t6bvv
	 kuWCcIismKgxjfTscT9n3lJyZ917NDbJ3wwCO8n1jUbJtRSPMOgPrUvLFo7nwWXWmk
	 7gwbmBunRHZ/cdlV5k93MzFudvzQzJeD+NpH270gwjNp4woNalIgqUNxa332cGdT2L
	 jgsqp+MFS1NMQ==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 20 Sep 2026 20:59:47 +0200
Subject: [PATCH v5 12/23] dmaengine: ste_dma40: Fix LCLA allocation order
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-dma40-fixes-v5-12-5c55cd7f92f9@kernel.org>
References: <20260920-dma40-fixes-v5-0-5c55cd7f92f9@kernel.org>
In-Reply-To: <20260920-dma40-fixes-v5-0-5c55cd7f92f9@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, sashiko-bot@kernel.org
X-Mailer: b4 0.14.3

d40_lcla_allocate() calculates the number of pages needed for LCLA, but
passes that raw page count as the allocation order to __get_free_pages().
The same value is later passed to free_pages().

Store the allocation order with get_order() instead, and use a separate
byte size for allocation diagnostics, fallback kmalloc() sizing and DMA
mapping.

Fixes: 508849ade23c ("DMAENGINE: ste_dma40: allocate LCLA dynamically")
Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/dmaengine/20260819225114.AE1511F000E9@smtp.kernel.org/
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 33 ++++++++++++++++-----------------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 52d39883da51..33cd93e90bc4 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -423,8 +423,8 @@ struct d40_desc {
  * @dma_addr: DMA address, if mapped
  * @base_unaligned: The original kmalloc pointer, if kmalloc is used.
  * This pointer is only there for clean-up on error.
- * @pages: The number of pages needed for all physical channels.
- * Only used later for clean-up on error
+ * @alloc_order: Order used for the LCLA page allocation.
+ * Only used later for clean-up on error.
  * @lock: Lock to protect the content in this struct.
  * @alloc_map: big map over which LCLA entry is own by which job.
  */
@@ -432,7 +432,7 @@ struct d40_lcla_pool {
 	void		*base;
 	dma_addr_t	dma_addr;
 	void		*base_unaligned;
-	int		 pages;
+	unsigned int	 alloc_order;
 	spinlock_t	 lock;
 	struct d40_desc	**alloc_map;
 };
@@ -3597,6 +3597,7 @@ static void __init d40_hw_init(struct d40_base *base)
 static int __init d40_lcla_allocate(struct d40_base *base)
 {
 	struct d40_lcla_pool *pool = &base->lcla_pool;
+	size_t lcla_size = SZ_1K * base->num_phy_chans;
 	unsigned long *page_list;
 	int i, j;
 	int ret;
@@ -3612,20 +3613,20 @@ static int __init d40_lcla_allocate(struct d40_base *base)
 	if (!page_list)
 		return -ENOMEM;
 
-	/* Calculating how many pages that are required */
-	base->lcla_pool.pages = SZ_1K * base->num_phy_chans / PAGE_SIZE;
+	base->lcla_pool.alloc_order = get_order(lcla_size);
 
 	for (i = 0; i < MAX_LCLA_ALLOC_ATTEMPTS; i++) {
 		page_list[i] = __get_free_pages(GFP_KERNEL,
-						base->lcla_pool.pages);
+						base->lcla_pool.alloc_order);
 		if (!page_list[i]) {
 
-			d40_err(base->dev, "Failed to allocate %d pages.\n",
-				base->lcla_pool.pages);
+			d40_err(base->dev, "Failed to allocate %zu bytes.\n",
+				lcla_size);
 			ret = -ENOMEM;
 
 			for (j = 0; j < i; j++)
-				free_pages(page_list[j], base->lcla_pool.pages);
+				free_pages(page_list[j],
+					   base->lcla_pool.alloc_order);
 			goto free_page_list;
 		}
 
@@ -3635,7 +3636,7 @@ static int __init d40_lcla_allocate(struct d40_base *base)
 	}
 
 	for (j = 0; j < i; j++)
-		free_pages(page_list[j], base->lcla_pool.pages);
+		free_pages(page_list[j], base->lcla_pool.alloc_order);
 
 	if (i < MAX_LCLA_ALLOC_ATTEMPTS) {
 		base->lcla_pool.base = (void *)page_list[i];
@@ -3645,10 +3646,9 @@ static int __init d40_lcla_allocate(struct d40_base *base)
 		 * alignment, try with allocating a big buffer.
 		 */
 		dev_warn(base->dev,
-			 "[%s] Failed to get %d pages @ 18 bit align.\n",
-			 __func__, base->lcla_pool.pages);
-		base->lcla_pool.base_unaligned = kmalloc(SZ_1K *
-							 base->num_phy_chans +
+			 "[%s] Failed to get %zu bytes @ 18 bit align.\n",
+			 __func__, lcla_size);
+		base->lcla_pool.base_unaligned = kmalloc(lcla_size +
 							 LCLA_ALIGNMENT,
 							 GFP_KERNEL);
 		if (!base->lcla_pool.base_unaligned) {
@@ -3660,8 +3660,7 @@ static int __init d40_lcla_allocate(struct d40_base *base)
 						 LCLA_ALIGNMENT);
 	}
 
-	pool->dma_addr = dma_map_single(base->dev, pool->base,
-					SZ_1K * base->num_phy_chans,
+	pool->dma_addr = dma_map_single(base->dev, pool->base, lcla_size,
 					DMA_TO_DEVICE);
 	if (dma_mapping_error(base->dev, pool->dma_addr)) {
 		pool->dma_addr = 0;
@@ -3905,7 +3904,7 @@ static int __init d40_probe(struct platform_device *pdev)
 
 	if (!base->lcla_pool.base_unaligned && base->lcla_pool.base)
 		free_pages((unsigned long)base->lcla_pool.base,
-			   base->lcla_pool.pages);
+			   base->lcla_pool.alloc_order);
 
 	kfree(base->lcla_pool.base_unaligned);
 

-- 
2.55.0

