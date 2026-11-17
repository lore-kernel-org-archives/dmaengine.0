Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=204.191.154.188
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794934357;
	b=iqy2lP5xnf5nS3cFRNS0V2Fr0/Q8aGEzR9z8goz3aBCzTpU19IRDjGgwZUNSl7JCwJJj
	 qWSf283/fFuqrHaUIukQ09yB65/RJYQACT5pHDXd1hgecEcX1M7ks4qSxG3H2lYJhSJkv
	 8nGdqQLSRi1XI6XMsvNYndcWb9KPHdhNuNCQxF3NleIv2CKC988UOifQEkiQiZR5OaHS5
	 q8gTQq2TvDyZwce20oA11q9jHufQ/YmhCg0rQ4vGrGg+R4pRWlv1bGzopbhHhvlp7VkGd
	 s1k7ZU5Fr39bSbQxb3s8xz/LmO9BH6w3QNKda+9ki2IQnD5bKMHLmThGBrum7u4dtGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794934357;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-SA-Exim-Connect-IP:X-SA-Exim-Rcpt-To:
	 X-SA-Exim-Mail-From:X-Spam-Checker-Version:X-Spam-Level:X-Spam-Status:
	 Subject:X-SA-Exim-Version:X-SA-Exim-Scanned;
	bh=MGxOimM5MwVxunTMPXf1eXM/vKgrxjzG3aM8xXRKgdQ=;
	b=pRQf/jB/9ArrMVwlIkgCGJncUjbGEH9evy+CPBUK68/zHG1oFOYshRNU+DvnukBjdjKL
	 n5Wjp+KBizip89SiGlAEzVXnzdKJ/ktJu4RHQCKbnqxIQlbpRBAZO+TOKyprS8Z/nmzNL
	 wUnhE4hIeym8UJU+jrWPaxNNNxCOa5SfVG6VhojOGC29dZIdrzzhU/mEw7dYHt43hQFbf
	 WzPNHIvWST4SA+zrlN61FUtSm2Ry68A0/WpkQau8ZurGqcm2xgB9g2gUinic0WeFVVmbc
	 fU9+Y8pNRoYm8DvMmOS5DYxxZL8MW48+Br3WkTSOlEDP1fEM1vT24VRV1sl7ZRzM5hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deltatee.com;
	spf=pass smtp.mailfrom=deltatee.com;
	dkim=pass header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=pLykzw23;
	arc=none smtp.remote-ip=204.191.154.188
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391C8606A8A2;
	Tue, 17 Nov 2026 16:52:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 391C8606A8A2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deltatee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=pLykzw23
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Cc:To:From:content-disposition;
	bh=MGxOimM5MwVxunTMPXf1eXM/vKgrxjzG3aM8xXRKgdQ=; b=pLykzw238OIbF0n7/WQBSR8Mfp
	/zGmWqvhUG6cSuaj6hU9HxNjj7JrIfxYQAv2Z3QXy9DZU6N4vQ1ZK/ec00OiLh7c3syjsjkxJizSR
	lCuPGC46x363woEAFP/k+plXzB3sHudzLA2qgGH0hC7yw1ZnBJQE7lutY89b8dIWwLFLz8DA7zmkG
	WS7VneZeSlo414CjoTweJxNRZLJnbY1HABogQ08gPBSoBKn/LstqRyakxpxXIwivFajniZHbgrKiY
	xK4ePFUF3g4C5E5opagG09QhtOWOJxdNU+POdJ095g6q5cjmNRtR3HEsU8F0pOaucwGWwQ4ilo5Ah
	hjrF1XHw==;
Received: from donard.priv.deltatee.com ([172.16.1.31])
	by ale.deltatee.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xTMQ1-00000001R9Y-1IWW;
	Tue, 17 Nov 2026 10:52:31 -0600
Received: from logang by donard.priv.deltatee.com with local (Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xTMPB-0000000388b-1vfw;
	Tue, 17 Nov 2026 10:51:37 -0600
From: Logan Gunthorpe <logang@deltatee.com>
To: dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.li@nxp.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Sashiko <sashiko-bot@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Date: Tue, 17 Nov 2026 10:51:31 -0600
Message-ID: <20261117165135.746241-3-logang@deltatee.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117165135.746241-1-logang@deltatee.com>
References: <20261117165135.746241-1-logang@deltatee.com>
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
X-SA-Exim-Rcpt-To: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, logang@deltatee.com, vkoul@kernel.org, sashiko-bot@kernel.org, Frank.li@nxp.com, Frank.Li@nxp.com
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Level: 
Subject: [PATCH v3 2/6] dmaengine: plx_dma: fix descriptor ring leak in alloc_chan_resources()
X-SA-Exim-Version: 4.2.1 (built Sun, 23 Feb 2025 07:57:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)

If the device is removed between plx_dma_alloc_desc() and the pdev
check, the error path frees hw_ring but leaks desc_ring and every
descriptor in it.

Add plx_dma_free_desc() and use it here, in plx_dma_free_chan_resources()
and in the plx_dma_alloc_desc() error path.

Fixes: c2dbcaa8c672 ("dmaengine: plx-dma: Implement hardware initialization and cleanup")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/dmaengine/20260717223217.B6FBF1F000E9@smtp.kernel.org
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
---
 drivers/dma/plx_dma.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/dma/plx_dma.c b/drivers/dma/plx_dma.c
index 0a7ad2473cb1..5b0e32fec79b 100644
--- a/drivers/dma/plx_dma.c
+++ b/drivers/dma/plx_dma.c
@@ -374,6 +374,16 @@ static irqreturn_t plx_dma_isr(int irq, void *devid)
 	return IRQ_HANDLED;
 }
 
+static void plx_dma_free_desc(struct plx_dma_dev *plxdev)
+{
+	int i;
+
+	for (i = 0; i < PLX_DMA_RING_COUNT; i++)
+		kfree(plxdev->desc_ring[i]);
+
+	kfree(plxdev->desc_ring);
+}
+
 static int plx_dma_alloc_desc(struct plx_dma_dev *plxdev)
 {
 	struct plx_dma_desc *desc;
@@ -398,9 +408,7 @@ static int plx_dma_alloc_desc(struct plx_dma_dev *plxdev)
 	return 0;
 
 free_and_exit:
-	for (i = 0; i < PLX_DMA_RING_COUNT; i++)
-		kfree(plxdev->desc_ring[i]);
-	kfree(plxdev->desc_ring);
+	plx_dma_free_desc(plxdev);
 	return -ENOMEM;
 }
 
@@ -424,7 +432,7 @@ static int plx_dma_alloc_chan_resources(struct dma_chan *chan)
 	if (!rcu_dereference(plxdev->pdev)) {
 		rcu_read_unlock();
 		rc = -ENODEV;
-		goto out_free_hw_ring;
+		goto out_free_desc;
 	}
 
 	writel(PLX_REG_CTRL_RESET_VAL, plxdev->bar + PLX_REG_CTRL);
@@ -443,6 +451,8 @@ static int plx_dma_alloc_chan_resources(struct dma_chan *chan)
 
 	return PLX_DMA_RING_COUNT;
 
+out_free_desc:
+	plx_dma_free_desc(plxdev);
 out_free_hw_ring:
 	dma_free_coherent(plxdev->dma_dev.dev, ring_sz, plxdev->hw_ring,
 			  plxdev->hw_ring_dma);
@@ -454,7 +464,6 @@ static void plx_dma_free_chan_resources(struct dma_chan *chan)
 	struct plx_dma_dev *plxdev = chan_to_plx_dma_dev(chan);
 	size_t ring_sz = PLX_DMA_RING_COUNT * sizeof(*plxdev->hw_ring);
 	int irq = -1;
-	int i;
 
 	spin_lock_bh(&plxdev->ring_lock);
 	plxdev->ring_active = false;
@@ -474,10 +483,7 @@ static void plx_dma_free_chan_resources(struct dma_chan *chan)
 
 	plx_dma_abort_desc(plxdev);
 
-	for (i = 0; i < PLX_DMA_RING_COUNT; i++)
-		kfree(plxdev->desc_ring[i]);
-
-	kfree(plxdev->desc_ring);
+	plx_dma_free_desc(plxdev);
 	dma_free_coherent(plxdev->dma_dev.dev, ring_sz, plxdev->hw_ring,
 			  plxdev->hw_ring_dma);
 
-- 
2.47.3

