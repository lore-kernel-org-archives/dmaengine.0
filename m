Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E761C433B4
	for <dmaengine@archiver.kernel.org>; Tue, 18 May 2021 10:43:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4334D611CC
	for <dmaengine@archiver.kernel.org>; Tue, 18 May 2021 10:43:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239741AbhERKok (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Tue, 18 May 2021 06:44:40 -0400
Received: from mga04.intel.com ([192.55.52.120]:20176 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1348610AbhERKoe (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Tue, 18 May 2021 06:44:34 -0400
IronPort-SDR: hAUtomZS8GmQvoAIRxHAkAuiYgYUrU3tafJ6Or0rjV/+U8buHOqIXTPqh0fwbIyFvRWCRADVqQ
 2XhgUsGfcOkQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9987"; a="198728246"
X-IronPort-AV: E=Sophos;i="5.82,309,1613462400"; 
   d="scan'208";a="198728246"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2021 03:43:14 -0700
IronPort-SDR: h3hK1kA0zIXpcLNi2j/uTS5NozyN6ehTj/fX7souad6EYmGjv/R+5VQ9NPXQ9W69fL8j/4VOnn
 0246U9awDQWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,309,1613462400"; 
   d="scan'208";a="439376607"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 18 May 2021 03:43:12 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 0DF7E12F; Tue, 18 May 2021 13:43:32 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] dmaengine: hsu: Account transferred bytes
Date:   Tue, 18 May 2021 13:43:23 +0300
Message-Id: <20210518104323.37632-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210518104323.37632-1-andriy.shevchenko@linux.intel.com>
References: <20210518104323.37632-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

Bump statistics for transferred bytes at the event of the successful transfer.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/dma/hsu/hsu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma/hsu/hsu.c b/drivers/dma/hsu/hsu.c
index 025d8ad5a63c..92caae55aece 100644
--- a/drivers/dma/hsu/hsu.c
+++ b/drivers/dma/hsu/hsu.c
@@ -201,6 +201,7 @@ EXPORT_SYMBOL_GPL(hsu_dma_get_status);
  */
 int hsu_dma_do_irq(struct hsu_dma_chip *chip, unsigned short nr, u32 status)
 {
+	struct dma_chan_percpu *stat;
 	struct hsu_dma_chan *hsuc;
 	struct hsu_dma_desc *desc;
 	unsigned long flags;
@@ -210,6 +211,7 @@ int hsu_dma_do_irq(struct hsu_dma_chip *chip, unsigned short nr, u32 status)
 		return 0;
 
 	hsuc = &chip->hsu->chan[nr];
+	stat = this_cpu_ptr(hsuc->vchan.chan.local);
 
 	spin_lock_irqsave(&hsuc->vchan.lock, flags);
 	desc = hsuc->desc;
@@ -221,6 +223,7 @@ int hsu_dma_do_irq(struct hsu_dma_chip *chip, unsigned short nr, u32 status)
 		} else {
 			vchan_cookie_complete(&desc->vdesc);
 			desc->status = DMA_COMPLETE;
+			stat->bytes_transferred += desc->length;
 			hsu_dma_start_transfer(hsuc);
 		}
 	}
-- 
2.30.2

