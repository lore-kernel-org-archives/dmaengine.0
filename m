Return-Path: <SRS0=UCgm=6N=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D95FC83004
	for <dmaengine@archiver.kernel.org>; Wed, 29 Apr 2020 07:15:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 545F720731
	for <dmaengine@archiver.kernel.org>; Wed, 29 Apr 2020 07:15:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726430AbgD2HP5 (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 29 Apr 2020 03:15:57 -0400
Received: from foss.arm.com ([217.140.110.172]:34806 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726366AbgD2HP4 (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Wed, 29 Apr 2020 03:15:56 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 475B51FB;
        Wed, 29 Apr 2020 00:15:56 -0700 (PDT)
Received: from login2.euhpc.arm.com. (login2.euhpc.arm.com [10.6.27.34])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8E1E53F305;
        Wed, 29 Apr 2020 00:15:55 -0700 (PDT)
From:   Vladimir Murzin <vladimir.murzin@arm.com>
To:     dmaengine@vger.kernel.org
Cc:     vkoul@kernel.org, seraj.alijan@sondrel.com, vladimir.murzin@arm.com
Subject: [PATCH] dmaengine: dmatest: Restore default for channel
Date:   Wed, 29 Apr 2020 08:15:22 +0100
Message-Id: <20200429071522.58148-1-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

In case of dmatest is built-in and no channel was configured test
doesn't run with:

dmatest: Could not start test, no channels configured

Even though description to "channel" parameter claims that default is
any.

Add default channel back as it used to be rather than reject test with
no channel configuration.

Fixes: d53513d5dc285d9a95a534fc41c5c08af6b60eac ("dmaengine: dmatest: Add support for multi channel testing)

Reported-by: Dijil Mohan <Dijil.Mohan@arm.com>
Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 drivers/dma/dmatest.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/dmatest.c b/drivers/dma/dmatest.c
index a2cadfa..5e1fff9 100644
--- a/drivers/dma/dmatest.c
+++ b/drivers/dma/dmatest.c
@@ -1166,10 +1166,11 @@ static int dmatest_run_set(const char *val, const struct kernel_param *kp)
 		mutex_unlock(&info->lock);
 		return ret;
 	} else if (dmatest_run) {
-		if (is_threaded_test_pending(info))
-			start_threaded_tests(info);
-		else
-			pr_info("Could not start test, no channels configured\n");
+		if (!is_threaded_test_pending(info)){
+			pr_info("No channels configured, continue with any\n");
+			add_threaded_test(info);
+		}
+		start_threaded_tests(info);
 	} else {
 		stop_threaded_test(info);
 	}
-- 
2.7.4

