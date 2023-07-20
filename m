Return-Path: <dmaengine-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BBCFEB64DC
	for <dmaengine@archiver.kernel.org>; Thu, 20 Jul 2023 11:43:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229569AbjGTLnr (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Thu, 20 Jul 2023 07:43:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230062AbjGTLnq (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Thu, 20 Jul 2023 07:43:46 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 243F31724;
        Thu, 20 Jul 2023 04:43:44 -0700 (PDT)
Received: from kwepemi500020.china.huawei.com (unknown [172.30.72.55])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4R69lY0w77zVjD4;
        Thu, 20 Jul 2023 19:42:17 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 kwepemi500020.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 20 Jul 2023 19:43:41 +0800
From:   Jie Hai <haijie1@huawei.com>
To:     <vkoul@kernel.org>
CC:     <dmaengine@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] dmaengine: dmatest: fix timeout caused by kthread_stop
Date:   Thu, 20 Jul 2023 19:41:02 +0800
Message-ID: <20230720114102.51053-1-haijie1@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.69.192.56]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500020.china.huawei.com (7.221.188.8)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

The change introduced by commit a7c01fa93aeb ("signal: break
out of wait loops on kthread_stop()") causes dmatest aborts
any ongoing tests and possible failure on the tests. This patch
use wait_event_timeout instead of wait_event_freezable_timeout
to avoid interrupting ongoing tests by signal brought by
kthread_stop().

Signed-off-by: Jie Hai <haijie1@huawei.com>
---
 drivers/dma/dmatest.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/dmatest.c b/drivers/dma/dmatest.c
index ffe621695e47..c06b8b16645a 100644
--- a/drivers/dma/dmatest.c
+++ b/drivers/dma/dmatest.c
@@ -827,7 +827,7 @@ static int dmatest_func(void *data)
 		} else {
 			dma_async_issue_pending(chan);
 
-			wait_event_freezable_timeout(thread->done_wait,
+			ret = wait_event_timeout(thread->done_wait,
 					done->done,
 					msecs_to_jiffies(params->timeout));
 
-- 
2.33.0

