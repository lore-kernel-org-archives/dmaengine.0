Return-Path: <SRS0=rv+v=C7=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC916C2D0E2
	for <dmaengine@archiver.kernel.org>; Tue, 22 Sep 2020 11:58:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 756BC2395C
	for <dmaengine@archiver.kernel.org>; Tue, 22 Sep 2020 11:58:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726533AbgIVL6v (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Tue, 22 Sep 2020 07:58:51 -0400
Received: from mga14.intel.com ([192.55.52.115]:20059 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726522AbgIVL6v (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Tue, 22 Sep 2020 07:58:51 -0400
IronPort-SDR: 5LCEebTDri5tZuu1b6Ub3nKb7MZYP9e1PHDXPAUeYx6VDgjex81r6UPc5EblbDsVOB81vRHAdR
 wzjfWQHN9A2Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9751"; a="159875894"
X-IronPort-AV: E=Sophos;i="5.77,290,1596524400"; 
   d="scan'208";a="159875894"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2020 04:58:50 -0700
IronPort-SDR: H6xQVAtSobNRjl5LKAYnh08FLJHIOK0yX+FfGDT0zPy8nUH83B+/0Ug1KUvhkcJ46qa95Lq27P
 89vaTWqOgYZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,290,1596524400"; 
   d="scan'208";a="341995097"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 22 Sep 2020 04:58:49 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 369231B4; Tue, 22 Sep 2020 14:58:48 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Vladimir Murzin <vladimir.murzin@arm.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH v2 3/3] dmaengine: dmatest: Return boolean result directly in filter()
Date:   Tue, 22 Sep 2020 14:58:47 +0300
Message-Id: <20200922115847.30100-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200922115847.30100-1-andriy.shevchenko@linux.intel.com>
References: <20200922115847.30100-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

There is no need to have a conditional for boolean expression when
function returns bool. Drop unnecessary code and return boolean
result directly.

While at it, drop unneeded casting from void *.

Cc: Vladimir Murzin <vladimir.murzin@arm.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Tested-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
v2: added tag (Peter)
 drivers/dma/dmatest.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/dma/dmatest.c b/drivers/dma/dmatest.c
index f04f32bdf8f7..2575c8128d95 100644
--- a/drivers/dma/dmatest.c
+++ b/drivers/dma/dmatest.c
@@ -1070,13 +1070,7 @@ static int dmatest_add_channel(struct dmatest_info *info,
 
 static bool filter(struct dma_chan *chan, void *param)
 {
-	struct dmatest_params *params = param;
-
-	if (!dmatest_match_channel(params, chan) ||
-	    !dmatest_match_device(params, chan->device))
-		return false;
-	else
-		return true;
+	return dmatest_match_channel(param, chan) && dmatest_match_device(param, chan->device);
 }
 
 static void request_channels(struct dmatest_info *info,
-- 
2.28.0

