Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1BCEC47083
	for <dmaengine@archiver.kernel.org>; Wed,  2 Jun 2021 10:07:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BA9C061263
	for <dmaengine@archiver.kernel.org>; Wed,  2 Jun 2021 10:07:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230178AbhFBKJW (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 2 Jun 2021 06:09:22 -0400
Received: from out30-56.freemail.mail.aliyun.com ([115.124.30.56]:59870 "EHLO
        out30-56.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231621AbhFBKJU (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Wed, 2 Jun 2021 06:09:20 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e01424;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0Ub2KBTb_1622628451;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0Ub2KBTb_1622628451)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 02 Jun 2021 18:07:35 +0800
From:   Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To:     dave.jiang@intel.com
Cc:     vkoul@kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: [PATCH] dmaengine: idxd: Fix missing error code in idxd_cdev_open()
Date:   Wed,  2 Jun 2021 18:07:26 +0800
Message-Id: <1622628446-87909-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

The error code is missing in this code scenario, add the error code
'-EINVAL' to the return value 'rc'.

Eliminate the follow smatch warning:

drivers/dma/idxd/cdev.c:113 idxd_cdev_open() warn: missing error code
'rc'.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/dma/idxd/cdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/idxd/cdev.c b/drivers/dma/idxd/cdev.c
index 302cba5..d4419bf 100644
--- a/drivers/dma/idxd/cdev.c
+++ b/drivers/dma/idxd/cdev.c
@@ -110,6 +110,7 @@ static int idxd_cdev_open(struct inode *inode, struct file *filp)
 		pasid = iommu_sva_get_pasid(sva);
 		if (pasid == IOMMU_PASID_INVALID) {
 			iommu_sva_unbind_device(sva);
+			rc = -EINVAL;
 			goto failed;
 		}
 
-- 
1.8.3.1

