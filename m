Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B45DC433E9
	for <dmaengine@archiver.kernel.org>; Thu, 24 Dec 2020 13:23:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E2CC7224B1
	for <dmaengine@archiver.kernel.org>; Thu, 24 Dec 2020 13:23:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728727AbgLXNXP (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Thu, 24 Dec 2020 08:23:15 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:10360 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726746AbgLXNXO (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Thu, 24 Dec 2020 08:23:14 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4D1rMD6XT0z7HsC;
        Thu, 24 Dec 2020 21:21:44 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Thu, 24 Dec 2020 21:22:18 +0800
From:   Zheng Yongjun <zhengyongjun3@huawei.com>
To:     <vkoul@kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     <dave.jiang@intel.com>, <dan.j.williams@intel.com>,
        Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: [PATCH v2 -next] dma: idxd: use DEFINE_MUTEX() for mutex lock
Date:   Thu, 24 Dec 2020 21:22:54 +0800
Message-ID: <20201224132254.30961-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.138.68]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

mutex lock can be initialized automatically with DEFINE_MUTEX()
rather than explicitly calling mutex_init().

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 drivers/dma/idxd/init.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/dma/idxd/init.c b/drivers/dma/idxd/init.c
index 0a4432b063b5..2297c93dd527 100644
--- a/drivers/dma/idxd/init.c
+++ b/drivers/dma/idxd/init.c
@@ -27,7 +27,7 @@ MODULE_AUTHOR("Intel Corporation");
 #define DRV_NAME "idxd"
 
 static struct idr idxd_idrs[IDXD_TYPE_MAX];
-static struct mutex idxd_idr_lock;
+static DEFINE_MUTEX(idxd_idr_lock);
 
 static struct pci_device_id idxd_pci_tbl[] = {
 	/* DSA ver 1.0 platforms */
@@ -481,7 +481,6 @@ static int __init idxd_init_module(void)
 	pr_info("%s: Intel(R) Accelerator Devices Driver %s\n",
 		DRV_NAME, IDXD_DRIVER_VERSION);
 
-	mutex_init(&idxd_idr_lock);
 	for (i = 0; i < IDXD_TYPE_MAX; i++)
 		idr_init(&idxd_idrs[i]);
 
-- 
2.22.0

