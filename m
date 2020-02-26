Return-Path: <SRS0=Ogb6=4O=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E20B6C4BA0B
	for <dmaengine@archiver.kernel.org>; Wed, 26 Feb 2020 10:18:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BC22520838
	for <dmaengine@archiver.kernel.org>; Wed, 26 Feb 2020 10:18:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727377AbgBZKSp (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 26 Feb 2020 05:18:45 -0500
Received: from mga17.intel.com ([192.55.52.151]:44035 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726494AbgBZKSp (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Wed, 26 Feb 2020 05:18:45 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Feb 2020 02:18:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,487,1574150400"; 
   d="scan'208";a="256269452"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 26 Feb 2020 02:18:43 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 91286190; Wed, 26 Feb 2020 12:18:42 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
        Dan Williams <dan.j.williams@intel.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/4] dmaengine: Use negative condition for better readability
Date:   Wed, 26 Feb 2020 12:18:39 +0200
Message-Id: <20200226101842.29426-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200226101842.29426-1-andriy.shevchenko@linux.intel.com>
References: <20200226101842.29426-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

When negative condition is in use we may decrease indentation level
and make the main part of logic better visible.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/dmaengine.h | 35 ++++++++++++++++++-----------------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index 9f3f5582816a..ae56a91c2a05 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -618,10 +618,11 @@ static inline void dmaengine_unmap_put(struct dmaengine_unmap_data *unmap)
 
 static inline void dma_descriptor_unmap(struct dma_async_tx_descriptor *tx)
 {
-	if (tx->unmap) {
-		dmaengine_unmap_put(tx->unmap);
-		tx->unmap = NULL;
-	}
+	if (!tx->unmap)
+		return;
+
+	dmaengine_unmap_put(tx->unmap);
+	tx->unmap = NULL;
 }
 
 #ifndef CONFIG_ASYNC_TX_ENABLE_CHANNEL_SWITCH
@@ -1408,11 +1409,12 @@ static inline enum dma_status dma_async_is_complete(dma_cookie_t cookie,
 static inline void
 dma_set_tx_state(struct dma_tx_state *st, dma_cookie_t last, dma_cookie_t used, u32 residue)
 {
-	if (st) {
-		st->last = last;
-		st->used = used;
-		st->residue = residue;
-	}
+	if (!st)
+		return;
+
+	st->last = last;
+	st->used = used;
+	st->residue = residue;
 }
 
 #ifdef CONFIG_DMA_ENGINE
@@ -1489,12 +1491,11 @@ static inline int dmaengine_desc_set_reuse(struct dma_async_tx_descriptor *tx)
 	if (ret)
 		return ret;
 
-	if (caps.descriptor_reuse) {
-		tx->flags |= DMA_CTRL_REUSE;
-		return 0;
-	} else {
+	if (!caps.descriptor_reuse)
 		return -EPERM;
-	}
+
+	tx->flags |= DMA_CTRL_REUSE;
+	return 0;
 }
 
 static inline void dmaengine_desc_clear_reuse(struct dma_async_tx_descriptor *tx)
@@ -1510,10 +1511,10 @@ static inline bool dmaengine_desc_test_reuse(struct dma_async_tx_descriptor *tx)
 static inline int dmaengine_desc_free(struct dma_async_tx_descriptor *desc)
 {
 	/* this is supported for reusable desc, so check that */
-	if (dmaengine_desc_test_reuse(desc))
-		return desc->desc_free(desc);
-	else
+	if (!dmaengine_desc_test_reuse(desc))
 		return -EPERM;
+
+	return desc->desc_free(desc);
 }
 
 /* --- DMA device --- */
-- 
2.25.0

