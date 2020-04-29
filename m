Return-Path: <SRS0=UCgm=6N=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18A3AC83004
	for <dmaengine@archiver.kernel.org>; Wed, 29 Apr 2020 12:21:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EC4F221D7F
	for <dmaengine@archiver.kernel.org>; Wed, 29 Apr 2020 12:21:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726524AbgD2MVy (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 29 Apr 2020 08:21:54 -0400
Received: from mga06.intel.com ([134.134.136.31]:9509 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726910AbgD2MVy (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Wed, 29 Apr 2020 08:21:54 -0400
IronPort-SDR: 5R6Ds+tvbZAdR/a0e83SDPA3JgyUGtQIGNlsg9A+TWOjQdsUP7NNzFwQW5iECKso0p8fxBJ93/
 YGVrPcDECslg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2020 05:21:54 -0700
IronPort-SDR: deLMml/5pKKwe28N/qWV9JHXJ41tso/4Xzb13/QrUBEZadUqRCTBa4qrf/eWAAo7ezXSSEc9un
 syaTFSxTPViA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,332,1583222400"; 
   d="scan'208";a="367790908"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 29 Apr 2020 05:21:52 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 9CBFA11D; Wed, 29 Apr 2020 15:21:51 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Vinod Koul <vkoul@kernel.org>,
        Dan Williams <dan.j.williams@intel.com>,
        dmaengine@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/2] dmaengine: Include dmaengine.h into dmaengine.c
Date:   Wed, 29 Apr 2020 15:21:50 +0300
Message-Id: <20200429122151.50989-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

Compiler is not happy about non-static functions due to missed inclusion

.../dmaengine.c:682:18: warning: no previous prototype for ‘dma_get_slave_channel’ [-Wmissing-prototypes]
  682 | struct dma_chan *dma_get_slave_channel(struct dma_chan *chan)
      |                  ^~~~~~~~~~~~~~~~~~~~~
.../dmaengine.c:713:18: warning: no previous prototype for ‘dma_get_any_slave_channel’ [-Wmissing-prototypes]
  713 | struct dma_chan *dma_get_any_slave_channel(struct dma_device *device)
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~

Include missed header to satisfy compiler.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/dma/dmaengine.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
index d31076d9ef2588..ee7f51d9da7ddc 100644
--- a/drivers/dma/dmaengine.c
+++ b/drivers/dma/dmaengine.c
@@ -53,6 +53,8 @@
 #include <linux/mempool.h>
 #include <linux/numa.h>
 
+#include "dmaengine.h"
+
 static DEFINE_MUTEX(dma_list_mutex);
 static DEFINE_IDA(dma_ida);
 static LIST_HEAD(dma_device_list);
-- 
2.26.2

