Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849FE3F3260
	for <dmaengine@vger.kernel.org>; Mon,  7 Sep 2026 06:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788762830; cv=none; b=fISQ7nheHjF0qj/xcn3nyg5qaCOLUi/koCaA+hMBanLo9B5/f+kJX90XT57kpSVb7NnM6VyJjZNUFT9NPD3fCNzYfLDEI1M25TG528WNZsZ8Kxx/H2EAO4pZNeAoX7kAr3lG+jqjGVYrtLVPH6buMoc9L0hDxsiYcg9ls3hRsY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788762830; c=relaxed/simple;
	bh=EupwhBBA0XKHCYmRNKSbJlq9cupLkfPTP3S7D6QZ2DQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tN6aY1Kt9u9xoymSAxQyG4EUPOZPlrKij6lwfW0p1zx/WKOShuKRZ4yfrHToZbOF11IQnGcde/13adGo1VT6EwLat7HZeTU14dkOuP1pvf8XwskF6KxQ/JSWLO3JYTdC3q2q0lzkQO5yF/AyuY+E8ezEoSDAE1iKyubKZLruXwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nZIfiRLB; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nZIfiRLB"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d942c7cc2fso24964055ad.3
        for <dmaengine@vger.kernel.org>; Sun, 06 Sep 2026 23:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788762829; x=1789367629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kLzy/P7iaMHDyU2RTvFBICZbCqw+7JdGE4URD73Sj1U=;
        b=nZIfiRLBhxeLPmXfq7g6Es+Jx25Q7KVZmbCHU+i2wUvORJsmkuWVaYavnOCBAxtBYy
         fnOLsjhIF3KvImyZhxK0FWOWxJYnOlfUSjNYw32xEOZPmZipf1a7kDVZYVlIpmK8uUX1
         5SW7QGVLVthfLVg1oQcUu5h4AA72uFpkQnuh3n5VVr92ru71Bmfcb3c1t+wt9SVScDtj
         76FPR+BmdxYDRPS2nFQO8JGQuOyZAVPP6Hu14ghjOBp87rj4jnTA9tWuzibW9SRSZboC
         YNx7r0nfMSC5usqiliTNXD+Jq0voqjN9dYhCuo/M2vD2XOKLx0t4w+SWl/bIMKPOkIN0
         AjCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788762829; x=1789367629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kLzy/P7iaMHDyU2RTvFBICZbCqw+7JdGE4URD73Sj1U=;
        b=FtT9UquuHg1varUOW+VDp/C+hazS/ePjeYJlVL8L2RnpDZ/2JiEQ1RQPFzjQppoW5m
         Lc7j/4JOQvwDt6OZljwDfcwwQ+JlXH13AKWg8jInkLZ++cCKOrLFEFL+9sM6xC6Qrsjy
         wylyiRJkMVUKZIjU3K1lHDQtCeaL0Xcs0CKXzc48DjrfMvoGLwPJW49JykiROTDBFwQ8
         VT1bo0ylmJ76cLdrBjdX8HjK9Bu8MzUw/GDPU4ZxU5qo/zfFrBdOayBbsPW34XnVV1CJ
         uc8lskQ8O+1CRDBUKo6yE0SDAiAPXWcgPHY2FLGBxNUvoanw6EpFCYpG6AHysAgEQHgj
         a9xg==
X-Gm-Message-State: AFuF++mtQSSHGnWlH7pVR58DeTNinzNdPnhtQggt3cn0tHETtFS1NWOz
	lF+AMVjp7Hoe+ds9p2dCdvsWJyzWt9P/Zn4DLGhoGa3P7dUC5ghZvJxQutAmsI33ncg=
X-Gm-Gg: AYBFou2o6+A+E/YAi2xsx2OQiY4OldvF3DGLUZmJBfNdh8o+ozbp8uvJZOcLlmKDQfP
	eGsYz/EwTqeGAzBUvs+wNFtW2C5l3iSG172SNAHskOcHxgM/et444cGpQVI/KN+CWaDd8D1XLTU
	yboDP1Od3nICw/SRaHzW8hXRHaLgT8Tl/laKyISsZdxuP6NQFkb4JP2fmVDUs+UmqZhcVt+OWi8
	otoWBlcwBKqcT4bkpY6y4C2uGvdSQi7pzIpT4MfU3V+R/X8LFALP+fFjtNzePoXkXQIZLo/OHOF
	ccpvMaVFAk2zKO1JAe36aYhSMzedCYDn6TNEsULSulDvgMsCIb2fGPHv+6RzN4OI+yb+PTVqSk2
	k7f/s7ToAJNh7hV11ezn13DCnRBqiYlUFK2WLkCVam5KgPNJUUg2UxePjO/JPlP28sBMuRkV9Bv
	9nsJPJuyzQGqm0CJqahO/EDm9AU0jQrcOyOpTd4eAJlLmFgS3nnEyd+X421sVas1g0tOTl2iSD9
	GB/xyokQFHpSQ==
X-Received: by 2002:a17:90b:5287:b0:38e:6a44:671b with SMTP id 98e67ed59e1d1-39b25eeeef9mr33408081a91.0.1788762828715;
        Sun, 06 Sep 2026 23:33:48 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14332405e92sm17093204c88.8.2026.09.06.23.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:33:48 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Michal Simek <michal.simek@amd.com>
Cc: dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dmaengine: fix typos in comments
Date: Mon,  7 Sep 2026 12:03:43 +0530
Message-ID: <20260907063343.22255-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/dma/bcm-sba-raid.c        | 8 ++++----
 drivers/dma/ppc4xx/xor.h          | 2 +-
 drivers/dma/xilinx/xilinx_dpdma.c | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/bcm-sba-raid.c b/drivers/dma/bcm-sba-raid.c
index 0de03611252e..485fcde390dd 100644
--- a/drivers/dma/bcm-sba-raid.c
+++ b/drivers/dma/bcm-sba-raid.c
@@ -734,7 +734,7 @@ sba_prep_dma_memcpy(struct dma_chan *dchan, dma_addr_t dst, dma_addr_t src,
 	struct sba_device *sba = to_sba_device(dchan);
 	struct sba_request *first = NULL, *req;
 
-	/* Create chained requests where each request is upto hw_buf_size */
+	/* Create chained requests where each request is up to hw_buf_size */
 	while (len) {
 		req_len = (len < sba->hw_buf_size) ? len : sba->hw_buf_size;
 
@@ -877,7 +877,7 @@ sba_prep_dma_xor(struct dma_chan *dchan, dma_addr_t dst, dma_addr_t *src,
 	if (unlikely(src_cnt > sba->max_xor_srcs))
 		return NULL;
 
-	/* Create chained requests where each request is upto hw_buf_size */
+	/* Create chained requests where each request is up to hw_buf_size */
 	while (len) {
 		req_len = (len < sba->hw_buf_size) ? len : sba->hw_buf_size;
 
@@ -1356,7 +1356,7 @@ sba_prep_dma_pq(struct dma_chan *dchan, dma_addr_t *dst, dma_addr_t *src,
 	if (!(flags & DMA_PREP_PQ_DISABLE_Q))
 		dst_q = &dst[1];
 
-	/* Create chained requests where each request is upto hw_buf_size */
+	/* Create chained requests where each request is up to hw_buf_size */
 	while (len) {
 		req_len = (len < sba->hw_buf_size) ? len : sba->hw_buf_size;
 
@@ -1626,7 +1626,7 @@ static int sba_probe(struct platform_device *pdev)
 	sba->dev = &pdev->dev;
 	platform_set_drvdata(pdev, sba);
 
-	/* Number of mailbox channels should be atleast 1 */
+	/* Number of mailbox channels should be at least 1 */
 	ret = of_count_phandle_with_args(pdev->dev.of_node,
 					 "mboxes", "#mbox-cells");
 	if (ret <= 0)
diff --git a/drivers/dma/ppc4xx/xor.h b/drivers/dma/ppc4xx/xor.h
index da1230df2817..0931e18cd0d3 100644
--- a/drivers/dma/ppc4xx/xor.h
+++ b/drivers/dma/ppc4xx/xor.h
@@ -12,7 +12,7 @@
 
 #include <linux/types.h>
 
-/* Number of XOR engines available on the contoller */
+/* Number of XOR engines available on the controller */
 #define XOR_ENGINES_NUM		1
 
 /* Number of operands supported in the h/w */
diff --git a/drivers/dma/xilinx/xilinx_dpdma.c b/drivers/dma/xilinx/xilinx_dpdma.c
index d9a3542c4531..bcc188e70441 100644
--- a/drivers/dma/xilinx/xilinx_dpdma.c
+++ b/drivers/dma/xilinx/xilinx_dpdma.c
@@ -1032,7 +1032,7 @@ static int xilinx_dpdma_chan_wait_no_ostand(struct xilinx_dpdma_chan *chan)
 {
 	int ret;
 
-	/* Wait for a no outstanding transaction interrupt upto 50msec */
+	/* Wait for a no outstanding transaction interrupt up to 50msec */
 	ret = wait_event_interruptible_timeout(chan->wait_to_stop,
 					       !xilinx_dpdma_chan_ostand(chan),
 					       msecs_to_jiffies(50));
-- 
2.48.1

