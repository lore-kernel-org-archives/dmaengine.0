Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31AB5C433EF
	for <dmaengine@archiver.kernel.org>; Wed,  8 Sep 2021 09:32:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0688761158
	for <dmaengine@archiver.kernel.org>; Wed,  8 Sep 2021 09:32:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245528AbhIHJd3 (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 8 Sep 2021 05:33:29 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:15393 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346064AbhIHJd2 (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Wed, 8 Sep 2021 05:33:28 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.56])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4H4Gyp3fJmzR3hH;
        Wed,  8 Sep 2021 17:28:18 +0800 (CST)
Received: from dggpemm500004.china.huawei.com (7.185.36.219) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Wed, 8 Sep 2021 17:32:17 +0800
Received: from huawei.com (10.174.28.241) by dggpemm500004.china.huawei.com
 (7.185.36.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Wed, 8 Sep 2021
 17:32:17 +0800
From:   Bixuan Cui <cuibixuan@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <dmaengine@vger.kernel.org>
CC:     <dave.jiang@intel.com>, <vkoul@kernel.org>,
        <john.wanghui@huawei.com>
Subject: [PATCH -next] dmaengine: idxd: Use list_move_tail instead of list_del/list_add_tail
Date:   Wed, 8 Sep 2021 17:28:26 +0800
Message-ID: <20210908092826.67765-1-cuibixuan@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.28.241]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500004.china.huawei.com (7.185.36.219)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

Using list_move_tail() instead of list_del() + list_add_tail()

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Bixuan Cui <cuibixuan@huawei.com>
---
 drivers/dma/idxd/irq.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/dma/idxd/irq.c b/drivers/dma/idxd/irq.c
index ca88fa7a328e..79fcfc4883e4 100644
--- a/drivers/dma/idxd/irq.c
+++ b/drivers/dma/idxd/irq.c
@@ -221,8 +221,7 @@ static void irq_process_work_list(struct idxd_irq_entry *irq_entry)
 
 	list_for_each_entry_safe(desc, n, &irq_entry->work_list, list) {
 		if (desc->completion->status) {
-			list_del(&desc->list);
-			list_add_tail(&desc->list, &flist);
+			list_move_tail(&desc->list, &flist);
 		}
 	}
 
-- 
2.17.1

