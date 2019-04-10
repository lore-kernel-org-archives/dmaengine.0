Return-Path: <SRS0=phoM=SM=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AB32C10F11
	for <dmaengine@archiver.kernel.org>; Wed, 10 Apr 2019 18:34:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F2AE22082A
	for <dmaengine@archiver.kernel.org>; Wed, 10 Apr 2019 18:34:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730210AbfDJSeH (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 10 Apr 2019 14:34:07 -0400
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:49219 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727561AbfDJSeH (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Wed, 10 Apr 2019 14:34:07 -0400
X-Greylist: delayed 363 seconds by postgrey-1.27 at vger.kernel.org; Wed, 10 Apr 2019 14:34:07 EDT
X-Halon-ID: 5945ab33-5bbe-11e9-8e2c-005056917f90
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [89.233.230.99])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id 5945ab33-5bbe-11e9-8e2c-005056917f90;
        Wed, 10 Apr 2019 20:28:02 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     dmaengine@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] dmaengine: rcar-dmac: Update copyright information
Date:   Wed, 10 Apr 2019 20:26:57 +0200
Message-Id: <20190410182657.23034-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org
Message-ID: <20190410182657.yXNOczGjAnfHj0RpgiK0SXugsBOtyDbKcpoyBlF0YJk@z>

From: Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>

Update copyright and string for Gen3.

Signed-off-by: Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/dma/sh/rcar-dmac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
index 2b4f256981695662..580ca1454fe8cf27 100644
--- a/drivers/dma/sh/rcar-dmac.c
+++ b/drivers/dma/sh/rcar-dmac.c
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Renesas R-Car Gen2 DMA Controller Driver
+ * Renesas R-Car Gen2/Gen3 DMA Controller Driver
  *
- * Copyright (C) 2014 Renesas Electronics Inc.
+ * Copyright (C) 2014-2019 Renesas Electronics Inc.
  *
  * Author: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  */
-- 
2.21.0

