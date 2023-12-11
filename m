Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0358EEA;
	Sun, 10 Dec 2023 21:37:08 -0800 (PST)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046056;MF=guanjun@linux.alibaba.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---0VyAqSe0_1702273025;
Received: from localhost(mailfrom:guanjun@linux.alibaba.com fp:SMTPD_---0VyAqSe0_1702273025)
          by smtp.aliyun-inc.com;
          Mon, 11 Dec 2023 13:37:06 +0800
From: 'Guanjun' <guanjun@linux.alibaba.com>
To: dave.jiang@intel.com,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vkoul@kernel.org,
	tony.luck@intel.com,
	fenghua.yu@intel.com
Cc: jing.lin@intel.com,
	ashok.raj@intel.com,
	sanjay.k.kumar@intel.com,
	megha.dey@intel.com,
	jacob.jun.pan@intel.com,
	yi.l.liu@intel.com,
	tglx@linutronix.de,
	guanjun@linux.alibaba.com
Subject: [PATCH v5 1/2] dmaengine: idxd: Protect int_handle field in hw descriptor
Date: Mon, 11 Dec 2023 13:37:03 +0800
Message-Id: <20231211053704.2725417-2-guanjun@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20231211053704.2725417-1-guanjun@linux.alibaba.com>
References: <20231211053704.2725417-1-guanjun@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Guanjun <guanjun@linux.alibaba.com>

The int_handle field in hw descriptor should also be protected
by wmb() before possibly triggering a DMA read.

Fixes: eb0cf33a91b4 (dmaengine: idxd: move interrupt handle assignment)
Signed-off-by: Guanjun <guanjun@linux.alibaba.com>
Reviewed-by: Dave Jiang <dave.jiang@intel.com>
Reviewed-by: Fenghua Yu <fenghua.yu@intel.com>
Reviewed-by: Lijun Pan <lijun.pan@intel.com>
---
 drivers/dma/idxd/submit.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/idxd/submit.c b/drivers/dma/idxd/submit.c
index c01db23e3333..3f922518e3a5 100644
--- a/drivers/dma/idxd/submit.c
+++ b/drivers/dma/idxd/submit.c
@@ -182,13 +182,6 @@ int idxd_submit_desc(struct idxd_wq *wq, struct idxd_desc *desc)
 
 	portal = idxd_wq_portal_addr(wq);
 
-	/*
-	 * The wmb() flushes writes to coherent DMA data before
-	 * possibly triggering a DMA read. The wmb() is necessary
-	 * even on UP because the recipient is a device.
-	 */
-	wmb();
-
 	/*
 	 * Pending the descriptor to the lockless list for the irq_entry
 	 * that we designated the descriptor to.
@@ -199,6 +192,13 @@ int idxd_submit_desc(struct idxd_wq *wq, struct idxd_desc *desc)
 		llist_add(&desc->llnode, &ie->pending_llist);
 	}
 
+	/*
+	 * The wmb() flushes writes to coherent DMA data before
+	 * possibly triggering a DMA read. The wmb() is necessary
+	 * even on UP because the recipient is a device.
+	 */
+	wmb();
+
 	if (wq_dedicated(wq)) {
 		iosubmit_cmds512(portal, desc->hw, 1);
 	} else {
-- 
2.39.3

