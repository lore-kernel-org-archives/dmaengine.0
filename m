Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=204.191.154.188
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794332553;
	b=VnO8A3Q6NCnywMzy5Lv3JtWDXzTGSArl058AEcFXOQh4Nc7rvQZHa7ysJ07Tg93ccgw3
	 RkRJuCLeZqpKWNALb9GPW/etoNMBTs1GgVCM37kmBOK6J4QiN70Uzkn7gfj5fG0TGHhgU
	 RUq7MdipbMUagA+NyZZgLzjbKXL6lEiGP5zQ5jVv+p4pLYrFVYSVYxAYKDgXpm08nvczy
	 k2SF7t7F9xgjeQab0si4fgvgtPpZl23GtBOUXblVzySj3TsAbfrlLw8pGBSmBzA9UY6/P
	 Oj+zw8dX1yyR/4pWuJdALlNBStEeCKCqSXyah7iLDUZ5sl1XifYBTh1tChXwmTu6i8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794332553;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-SA-Exim-Connect-IP:X-SA-Exim-Rcpt-To:
	 X-SA-Exim-Mail-From:X-Spam-Checker-Version:X-Spam-Level:X-Spam-Status:
	 Subject:X-SA-Exim-Version:X-SA-Exim-Scanned;
	bh=6hRmAt6Nv9zxg/FdmenP+WtbZJVt2hCdxtlI/zHA/a4=;
	b=i7PaM9TbCj1qOsp2mL/jpkRgwYrNxZ9VVdOd2dFEKhqxLXc2cnmljrVeDJXQ3nz5Kv5j
	 PE6BonQ6Ar1rPxGKKJwYf5r6nqcwI8XIApltmdlZ+H3LeXFkViJnIaV7Exj/MvUl68ME3
	 r2bV8l6Jb/ZStSqQ4iv9PCTZQkbjAfZlXakmytUT3k/JP1VltFFo0T/jG8Pk53wYNONwz
	 2SIRHR4M0Yh1tQV6r4AKCi9xdUPG+zMUKcEc5IzAG6U2XmhpvplUaT5BGQlXG44ZGY1ol
	 +5hC8Iaa55744WnNmZOWHHI8ZVmaOAt2wGtmvKeojeokQ8k0Ke5hSK7lPCp7Df27f1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deltatee.com;
	spf=pass smtp.mailfrom=deltatee.com;
	dkim=pass header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=rte3d+7V;
	arc=none smtp.remote-ip=204.191.154.188
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E6560A262D;
	Tue, 10 Nov 2026 17:42:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63E6560A262D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deltatee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=rte3d+7V
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Cc:To:From:content-disposition;
	bh=6hRmAt6Nv9zxg/FdmenP+WtbZJVt2hCdxtlI/zHA/a4=; b=rte3d+7V7ASTFLmYzha/MPz6Og
	BTsBcm16K02zDwHx8K+R5XPSTJGx7nIuJPy2GTgXLHJqYFRPJb+JyYIhu2snFHe/68dvkGUDq7ugd
	FeLBZE+pGkUgdAG7uWcwoDnIwQC5i6teAf61Ce9i7TVSQdef1wX41hLpFdpIROhzOZqZ2HH7axio1
	72jTP8nLgmE7jWYvuly6eW+xcph45yWg3XEIwMG0x66ABGYa8WSHrnVALrPTcFfI67ukjycwuisZ9
	Utt42FYR4ZXfBF0VzMil7d8MUY/+EZNz/Og9YCuMZJkzPOoMQpQcP9JeAB2uAYcpJwMXTIZHV0rpN
	mufPtP3Q==;
Received: from donard.priv.deltatee.com ([172.16.1.31])
	by ale.deltatee.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xQprb-00000000o8S-2esx;
	Tue, 10 Nov 2026 11:42:32 -0600
Received: from logang by donard.priv.deltatee.com with local (Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xQpqg-00000002cVv-3aW6;
	Tue, 10 Nov 2026 11:41:34 -0600
From: Logan Gunthorpe <logang@deltatee.com>
To: dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.li@nxp.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Sashiko <sashiko-bot@kernel.org>
Date: Tue, 10 Nov 2026 11:39:27 -0600
Message-ID: <20261110173927.624629-7-logang@deltatee.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261110173927.624629-1-logang@deltatee.com>
References: <20261110173927.624629-1-logang@deltatee.com>
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, Frank.li@nxp.com, logang@deltatee.com, vkoul@kernel.org, sashiko-bot@kernel.org
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Level: 
Subject: [PATCH v2 6/6] dmaengine: plx_dma: don't invoke client callbacks with ring_lock held
X-SA-Exim-Version: 4.2.1 (built Sun, 23 Feb 2025 07:57:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)

plx_dma_process_desc() and plx_dma_abort_desc() invoke the client's
completion callback with ring_lock held. A callback that submits a new
transfer, which is common, deadlocks taking the same lock in
plx_dma_prep_memcpy().

Copy and clear the callback and advance tail under ring_lock, then drop
it to invoke the callback. To keep callbacks in order and ensure
plx_dma_free_chan_resources() can't return while one is still running
from plx_dma_remove(), serialize completion with a new complete_lock
held across the whole loop. plx_dma_tx_status() only trylocks it, so a
callback that polls the channel won't deadlock.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/dmaengine/20260717223217.B6FBF1F000E9@smtp.kernel.org
Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
---
 drivers/dma/plx_dma.c | 45 ++++++++++++++++++++++++++++++++++++-------
 1 file changed, 38 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/plx_dma.c b/drivers/dma/plx_dma.c
index d1bdff1b7310..394ca5483434 100644
--- a/drivers/dma/plx_dma.c
+++ b/drivers/dma/plx_dma.c
@@ -108,6 +108,8 @@ struct plx_dma_dev {
 	void __iomem *bar;
 	struct tasklet_struct desc_task;
 
+	/* serializes descriptor completion and callback invocation */
+	spinlock_t complete_lock;
 	spinlock_t ring_lock;
 	bool ring_active;
 	int head;
@@ -132,12 +134,15 @@ static struct plx_dma_desc *plx_dma_get_desc(struct plx_dma_dev *plxdev, int i)
 	return plxdev->desc_ring[i & (PLX_DMA_RING_COUNT - 1)];
 }
 
-static void plx_dma_process_desc(struct plx_dma_dev *plxdev)
+static void plx_dma_process_desc_unlocked(struct plx_dma_dev *plxdev)
 {
+	struct dmaengine_desc_callback cb;
 	struct dmaengine_result res;
 	struct plx_dma_desc *desc;
 	u32 flags;
 
+	lockdep_assert_held(&plxdev->complete_lock);
+
 	spin_lock_bh(&plxdev->ring_lock);
 
 	while (plxdev->tail != plxdev->head) {
@@ -166,22 +171,35 @@ static void plx_dma_process_desc(struct plx_dma_dev *plxdev)
 
 		dma_cookie_complete(&desc->txd);
 		dma_descriptor_unmap(&desc->txd);
-		dmaengine_desc_get_callback_invoke(&desc->txd, &res);
+		dmaengine_desc_get_callback(&desc->txd, &cb);
 		desc->txd.callback = NULL;
 		desc->txd.callback_result = NULL;
-
 		plxdev->tail++;
+
+		spin_unlock_bh(&plxdev->ring_lock);
+		dmaengine_desc_callback_invoke(&cb, &res);
+		spin_lock_bh(&plxdev->ring_lock);
 	}
 
 	spin_unlock_bh(&plxdev->ring_lock);
 }
 
+static void plx_dma_process_desc(struct plx_dma_dev *plxdev)
+{
+	spin_lock_bh(&plxdev->complete_lock);
+	plx_dma_process_desc_unlocked(plxdev);
+	spin_unlock_bh(&plxdev->complete_lock);
+}
+
 static void plx_dma_abort_desc(struct plx_dma_dev *plxdev)
 {
+	struct dmaengine_desc_callback cb;
 	struct dmaengine_result res;
 	struct plx_dma_desc *desc;
 
-	plx_dma_process_desc(plxdev);
+	spin_lock_bh(&plxdev->complete_lock);
+
+	plx_dma_process_desc_unlocked(plxdev);
 
 	spin_lock_bh(&plxdev->ring_lock);
 
@@ -193,14 +211,18 @@ static void plx_dma_abort_desc(struct plx_dma_dev *plxdev)
 
 		dma_cookie_complete(&desc->txd);
 		dma_descriptor_unmap(&desc->txd);
-		dmaengine_desc_get_callback_invoke(&desc->txd, &res);
+		dmaengine_desc_get_callback(&desc->txd, &cb);
 		desc->txd.callback = NULL;
 		desc->txd.callback_result = NULL;
-
 		plxdev->tail++;
+
+		spin_unlock_bh(&plxdev->ring_lock);
+		dmaengine_desc_callback_invoke(&cb, &res);
+		spin_lock_bh(&plxdev->ring_lock);
 	}
 
 	spin_unlock_bh(&plxdev->ring_lock);
+	spin_unlock_bh(&plxdev->complete_lock);
 }
 
 static void __plx_dma_stop(struct plx_dma_dev *plxdev)
@@ -337,7 +359,15 @@ static enum dma_status plx_dma_tx_status(struct dma_chan *chan,
 	if (ret == DMA_COMPLETE)
 		return ret;
 
-	plx_dma_process_desc(plxdev);
+	/*
+	 * If another context is already completing descriptors (possibly
+	 * a callback on this CPU that is polling the channel), let it
+	 * finish rather than waiting on it.
+	 */
+	if (spin_trylock_bh(&plxdev->complete_lock)) {
+		plx_dma_process_desc_unlocked(plxdev);
+		spin_unlock_bh(&plxdev->complete_lock);
+	}
 
 	return dma_cookie_status(chan, cookie, txstate);
 }
@@ -518,6 +548,7 @@ static int plx_dma_create(struct pci_dev *pdev)
 	if (!plxdev)
 		return -ENOMEM;
 
+	spin_lock_init(&plxdev->complete_lock);
 	spin_lock_init(&plxdev->ring_lock);
 	tasklet_setup(&plxdev->desc_task, plx_dma_desc_task);
 
-- 
2.47.3

