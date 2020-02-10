Return-Path: <SRS0=OtPq=36=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3FABC352A3
	for <dmaengine@archiver.kernel.org>; Mon, 10 Feb 2020 15:19:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D81062080C
	for <dmaengine@archiver.kernel.org>; Mon, 10 Feb 2020 15:19:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728323AbgBJPTU (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 10 Feb 2020 10:19:20 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:37598 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729125AbgBJPTU (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Mon, 10 Feb 2020 10:19:20 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id E09515932046115772BD;
        Mon, 10 Feb 2020 23:19:08 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.439.0; Mon, 10 Feb 2020
 23:19:02 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <dave.jiang@intel.com>, <vkoul@kernel.org>,
        <dan.j.williams@intel.com>
CC:     <dmaengine@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] dmaengine: idxd: remove set but not used variable 'idxd_cdev'
Date:   Mon, 10 Feb 2020 23:18:55 +0800
Message-ID: <20200210151855.55044-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

drivers/dma/idxd/cdev.c: In function idxd_cdev_open:
drivers/dma/idxd/cdev.c:77:20: warning:
 variable idxd_cdev set but not used [-Wunused-but-set-variable]

commit 42d279f9137a ("dmaengine: idxd: add char driver to
expose submission portal to userland") involed this.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/dma/idxd/cdev.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/dma/idxd/cdev.c b/drivers/dma/idxd/cdev.c
index 1d73478..8dfdbe3 100644
--- a/drivers/dma/idxd/cdev.c
+++ b/drivers/dma/idxd/cdev.c
@@ -74,12 +74,10 @@ static int idxd_cdev_open(struct inode *inode, struct file *filp)
 	struct idxd_device *idxd;
 	struct idxd_wq *wq;
 	struct device *dev;
-	struct idxd_cdev *idxd_cdev;
 
 	wq = inode_wq(inode);
 	idxd = wq->idxd;
 	dev = &idxd->pdev->dev;
-	idxd_cdev = &wq->idxd_cdev;
 
 	dev_dbg(dev, "%s called\n", __func__);
 
-- 
2.7.4


