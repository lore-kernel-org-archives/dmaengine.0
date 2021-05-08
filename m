Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21452C433ED
	for <dmaengine@archiver.kernel.org>; Sat,  8 May 2021 06:30:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E4F9C6145E
	for <dmaengine@archiver.kernel.org>; Sat,  8 May 2021 06:30:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229925AbhEHGbp (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Sat, 8 May 2021 02:31:45 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:17158 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbhEHGbo (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Sat, 8 May 2021 02:31:44 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Fccmp67kBzncHv;
        Sat,  8 May 2021 14:27:22 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Sat, 8 May 2021 14:30:33 +0800
From:   Zhen Lei <thunder.leizhen@huawei.com>
To:     Dave Jiang <dave.jiang@intel.com>, Vinod Koul <vkoul@kernel.org>,
        "Dan Williams" <dan.j.williams@intel.com>,
        dmaengine <dmaengine@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
CC:     Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 1/1] dmaengine: idxd: remove unused variable 'cdev_ctx'
Date:   Sat, 8 May 2021 14:30:12 +0800
Message-ID: <20210508063012.2624-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.174.177.72]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

GCC reports the following warning with W=1:

drivers/dma/idxd/cdev.c:298:28: warning:
 variable 'cdev_ctx' set but not used [-Wunused-but-set-variable]
  298 |  struct idxd_cdev_context *cdev_ctx;
      |                            ^~~~~~~~

The variable 'cdev_ctx' is not used, remove it to fix the warning.

Fixes: 04922b7445a1 ("dmaengine: idxd: fix cdev setup and free device lifetime issues")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/dma/idxd/cdev.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/dma/idxd/cdev.c b/drivers/dma/idxd/cdev.c
index 302cba5ff779..6c72089ca31a 100644
--- a/drivers/dma/idxd/cdev.c
+++ b/drivers/dma/idxd/cdev.c
@@ -295,9 +295,7 @@ int idxd_wq_add_cdev(struct idxd_wq *wq)
 void idxd_wq_del_cdev(struct idxd_wq *wq)
 {
 	struct idxd_cdev *idxd_cdev;
-	struct idxd_cdev_context *cdev_ctx;
 
-	cdev_ctx = &ictx[wq->idxd->data->type];
 	idxd_cdev = wq->idxd_cdev;
 	wq->idxd_cdev = NULL;
 	cdev_device_del(&idxd_cdev->cdev, &idxd_cdev->dev);
-- 
2.25.1


