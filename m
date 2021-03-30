Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF933C433C1
	for <dmaengine@archiver.kernel.org>; Tue, 30 Mar 2021 06:48:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 79C9261989
	for <dmaengine@archiver.kernel.org>; Tue, 30 Mar 2021 06:48:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231269AbhC3Grq (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Tue, 30 Mar 2021 02:47:46 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:15097 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231184AbhC3Gr2 (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Tue, 30 Mar 2021 02:47:28 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F8g1X2sqxz19JWl;
        Tue, 30 Mar 2021 14:45:20 +0800 (CST)
Received: from localhost.localdomain (10.67.165.24) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.498.0; Tue, 30 Mar 2021 14:47:16 +0800
From:   Hao Fang <fanghao11@huawei.com>
To:     <vkoul@kernel.org>, <dmaengine@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <prime.zeng@hisilicon.com>,
        <fanghao11@huawei.com>
Subject: [PATCH] dmaengine: k3dma: use the correct HiSilicon copyright
Date:   Tue, 30 Mar 2021 14:44:44 +0800
Message-ID: <1617086684-54834-1-git-send-email-fanghao11@huawei.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.165.24]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

s/Hisilicon/HiSilicon/g.
It should use capital S, according to
https://www.hisilicon.com/en/terms-of-use.

Signed-off-by: Hao Fang <fanghao11@huawei.com>
---
 drivers/dma/k3dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/k3dma.c b/drivers/dma/k3dma.c
index d0b2e60..ecdaada9 100644
--- a/drivers/dma/k3dma.c
+++ b/drivers/dma/k3dma.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright (c) 2013 - 2015 Linaro Ltd.
- * Copyright (c) 2013 Hisilicon Limited.
+ * Copyright (c) 2013 HiSilicon Limited.
  */
 #include <linux/sched.h>
 #include <linux/device.h>
@@ -1039,6 +1039,6 @@ static struct platform_driver k3_pdma_driver = {
 
 module_platform_driver(k3_pdma_driver);
 
-MODULE_DESCRIPTION("Hisilicon k3 DMA Driver");
+MODULE_DESCRIPTION("HiSilicon k3 DMA Driver");
 MODULE_ALIAS("platform:k3dma");
 MODULE_LICENSE("GPL v2");
-- 
2.8.1

