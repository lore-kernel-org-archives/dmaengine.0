Return-Path: <SRS0=y7tq=AG=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE9EAC433DF
	for <dmaengine@archiver.kernel.org>; Thu, 25 Jun 2020 19:17:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D4BC52076E
	for <dmaengine@archiver.kernel.org>; Thu, 25 Jun 2020 19:17:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406552AbgFYTRq (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Thu, 25 Jun 2020 15:17:46 -0400
Received: from mga09.intel.com ([134.134.136.24]:39794 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2406645AbgFYTRp (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Thu, 25 Jun 2020 15:17:45 -0400
IronPort-SDR: eoRVCWE2wCyXA8dHJO5lHmsy5sRZPu02fKUQyCW65eQwhXXqznBjZbnOOPEQzCkX8nW8MXukuN
 9iJn8kM+f0xw==
X-IronPort-AV: E=McAfee;i="6000,8403,9663"; a="146543046"
X-IronPort-AV: E=Sophos;i="5.75,280,1589266800"; 
   d="scan'208";a="146543046"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2020 12:17:44 -0700
IronPort-SDR: YZ3mQBNUgVPWyxiUcWXoVf9QM0WyDrARmJMdawc/qN2Rf551eLQb/ErsW124iI46DA8zZcooBe
 cCMPvwioV04A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,280,1589266800"; 
   d="scan'208";a="312095417"
Received: from djiang5-desk3.ch.intel.com ([143.182.136.137])
  by fmsmga002.fm.intel.com with ESMTP; 25 Jun 2020 12:17:42 -0700
Subject: [PATCH v2] dmaengine: idxd: cleanup workqueue config after disabling
From:   Dave Jiang <dave.jiang@intel.com>
To:     vkoul@kernel.org
Cc:     Yixin Zhang <yixin.zhang@intel.com>,
        Yixin Zhang <yixin.zhang@intel.com>, dmaengine@vger.kernel.org
Date:   Thu, 25 Jun 2020 12:17:42 -0700
Message-ID: <159311264246.1198.11955791213681679428.stgit@djiang5-desk3.ch.intel.com>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

After disabling a device, we should clean up the internal state for
the wqs and zero out the configuration registers. Without doing so can cause
issues when the user reprogram the wqs.

Fixes: c52ca478233c ("dmaengine: idxd: add configuration component of driver")
Reported-by: Yixin Zhang <yixin.zhang@intel.com>
Signed-off-by: Dave Jiang <dave.jiang@intel.com>
Tested-by: Yixin Zhang <yixin.zhang@intel.com>
---

Rebased against dmaengine fixes branch

 drivers/dma/idxd/device.c |   25 +++++++++++++++++++++++++
 drivers/dma/idxd/idxd.h   |    1 +
 drivers/dma/idxd/sysfs.c  |    5 +++++
 3 files changed, 31 insertions(+)

diff --git a/drivers/dma/idxd/device.c b/drivers/dma/idxd/device.c
index 8d79a8787104..8d2718c585dc 100644
--- a/drivers/dma/idxd/device.c
+++ b/drivers/dma/idxd/device.c
@@ -320,6 +320,31 @@ void idxd_wq_unmap_portal(struct idxd_wq *wq)
 	devm_iounmap(dev, wq->dportal);
 }
 
+void idxd_wq_disable_cleanup(struct idxd_wq *wq)
+{
+	struct idxd_device *idxd = wq->idxd;
+	struct device *dev = &idxd->pdev->dev;
+	int i, wq_offset;
+
+	lockdep_assert_held(&idxd->dev_lock);
+	memset(&wq->wqcfg, 0, sizeof(wq->wqcfg));
+	wq->type = IDXD_WQT_NONE;
+	wq->size = 0;
+	wq->group = NULL;
+	wq->threshold = 0;
+	wq->priority = 0;
+	clear_bit(WQ_FLAG_DEDICATED, &wq->flags);
+	memset(wq->name, 0, WQ_NAME_SIZE);
+
+	for (i = 0; i < 8; i++) {
+		wq_offset = idxd->wqcfg_offset + wq->id * 32 + i * sizeof(u32);
+		iowrite32(0, idxd->reg_base + wq_offset);
+		dev_dbg(dev, "WQ[%d][%d][%#x]: %#x\n",
+			wq->id, i, wq_offset,
+			ioread32(idxd->reg_base + wq_offset));
+	}
+}
+
 /* Device control bits */
 static inline bool idxd_is_enabled(struct idxd_device *idxd)
 {
diff --git a/drivers/dma/idxd/idxd.h b/drivers/dma/idxd/idxd.h
index b8f8a363b4a7..908c8d0ef3ab 100644
--- a/drivers/dma/idxd/idxd.h
+++ b/drivers/dma/idxd/idxd.h
@@ -290,6 +290,7 @@ int idxd_wq_enable(struct idxd_wq *wq);
 int idxd_wq_disable(struct idxd_wq *wq);
 int idxd_wq_map_portal(struct idxd_wq *wq);
 void idxd_wq_unmap_portal(struct idxd_wq *wq);
+void idxd_wq_disable_cleanup(struct idxd_wq *wq);
 
 /* submission */
 int idxd_submit_desc(struct idxd_wq *wq, struct idxd_desc *desc);
diff --git a/drivers/dma/idxd/sysfs.c b/drivers/dma/idxd/sysfs.c
index 052dae5d6ddd..2e2c5082f322 100644
--- a/drivers/dma/idxd/sysfs.c
+++ b/drivers/dma/idxd/sysfs.c
@@ -315,6 +315,11 @@ static int idxd_config_bus_remove(struct device *dev)
 		idxd_unregister_dma_device(idxd);
 		spin_lock_irqsave(&idxd->dev_lock, flags);
 		rc = idxd_device_disable(idxd);
+		for (i = 0; i < idxd->max_wqs; i++) {
+			struct idxd_wq *wq = &idxd->wqs[i];
+
+			idxd_wq_disable_cleanup(wq);
+		}
 		spin_unlock_irqrestore(&idxd->dev_lock, flags);
 		module_put(THIS_MODULE);
 		if (rc < 0)

