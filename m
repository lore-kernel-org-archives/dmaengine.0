Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78A16C432BE
	for <dmaengine@archiver.kernel.org>; Sat, 28 Aug 2021 09:01:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5269D6115B
	for <dmaengine@archiver.kernel.org>; Sat, 28 Aug 2021 09:01:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233610AbhH1JCe (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Sat, 28 Aug 2021 05:02:34 -0400
Received: from mx21.baidu.com ([220.181.3.85]:58272 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233446AbhH1JCe (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Sat, 28 Aug 2021 05:02:34 -0400
Received: from BC-Mail-Ex30.internal.baidu.com (unknown [172.31.51.24])
        by Forcepoint Email with ESMTPS id 4C6A161F9DE55F7980D0;
        Sat, 28 Aug 2021 17:01:42 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex30.internal.baidu.com (172.31.51.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Sat, 28 Aug 2021 17:01:42 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.62.11) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Sat, 28 Aug 2021 17:01:41 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <vkoul@kernel.org>
CC:     <dmaengine@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Cai Huoqing <caihuoqing@baidu.com>
Subject: [PATCH] dmaengine: sa11x0: Make use of the helper macro SET_NOIRQ_SYSTEM_SLEEP_PM_OPS()
Date:   Sat, 28 Aug 2021 17:01:17 +0800
Message-ID: <20210828090117.1814-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.32.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [172.31.62.11]
X-ClientProxiedBy: BC-Mail-Ex18.internal.baidu.com (172.31.51.12) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

Use the helper macro SET_NOIRQ_SYSTEM_SLEEP_PM_OPS() instead of the
verbose operators ".suspend_noirq /.resume_noirq/.freeze_noirq/
.thaw_noirq/.poweroff_noirq/.restore_noirq", because the
SET_NOIRQ_SYSTEM_SLEEP_PM_OPS() is a nice helper macro that could
be brought in to make code a little clearer, a little more concise.

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/dma/sa11x0-dma.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/dma/sa11x0-dma.c b/drivers/dma/sa11x0-dma.c
index 1e918e284fc0..38f318b2f80d 100644
--- a/drivers/dma/sa11x0-dma.c
+++ b/drivers/dma/sa11x0-dma.c
@@ -1072,12 +1072,7 @@ static int sa11x0_dma_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops sa11x0_dma_pm_ops = {
-	.suspend_noirq = sa11x0_dma_suspend,
-	.resume_noirq = sa11x0_dma_resume,
-	.freeze_noirq = sa11x0_dma_suspend,
-	.thaw_noirq = sa11x0_dma_resume,
-	.poweroff_noirq = sa11x0_dma_suspend,
-	.restore_noirq = sa11x0_dma_resume,
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(sa11x0_dma_suspend, sa11x0_dma_resume)
 };
 
 static struct platform_driver sa11x0_dma_driver = {
-- 
2.25.1

