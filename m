Return-Path: <SRS0=Ziga=4X=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 518E6C10DCE
	for <dmaengine@archiver.kernel.org>; Fri,  6 Mar 2020 13:50:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 25A232084E
	for <dmaengine@archiver.kernel.org>; Fri,  6 Mar 2020 13:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583502632;
	bh=KL/dHxXT8I9vwsYkvwouoSabSs753IYnG09L9ERnlOk=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=H4S6P366cDfo8KqhZcwWk03JB1FfvYWqdXbnaR6E0ZyTp7IRvArEfC6xY1pNGqwr/
	 2YsBPBSCsfByiV0fNGcrMojwG6eF9KKgffl3n7MIzF4LreEnhdPxNhulVjfZpi8ieg
	 Ix1mJE9Eo9IdjB05i+QHpv0JOe27ctBa6u+u0mMw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726194AbgCFNub (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Fri, 6 Mar 2020 08:50:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:60564 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726090AbgCFNub (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Fri, 6 Mar 2020 08:50:31 -0500
Received: from localhost.localdomain (unknown [122.178.250.113])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 366AF2084E;
        Fri,  6 Mar 2020 13:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583502631;
        bh=KL/dHxXT8I9vwsYkvwouoSabSs753IYnG09L9ERnlOk=;
        h=From:To:Cc:Subject:Date:From;
        b=oLgXrVX9FO7UfLVh4nA33Ip5H3ZV+5w399/+4cRuFl0wqB4AQ/il2jZRB4VSvYsOG
         R4S0f1KjSr+wEYFXeMWi+qi2YoRD7eD9rvv/Uc/olQ4A4go5m6a2cg48AUIhoG5k3q
         NcAj7fNmXemf4MTFB8StLFmqbWZzKRhm1eGz9kUY=
From:   Vinod Koul <vkoul@kernel.org>
To:     dmaengine@vger.kernel.org
Cc:     Vinod Koul <vkoul@kernel.org>
Subject: [PATCH] dmaengine: move .device_release missing log warning to debug level
Date:   Fri,  6 Mar 2020 19:20:18 +0530
Message-Id: <20200306135018.2286959-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

Dmaengine core warns the drivers registering for missing .device_release
implementation. The warning is accurate for dmaengine controllers which
hotplug but not for rest.

So reduce this to a debug log.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/dma/dmaengine.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
index c3b1283b6d31..17909fd1820f 100644
--- a/drivers/dma/dmaengine.c
+++ b/drivers/dma/dmaengine.c
@@ -1151,7 +1151,7 @@ int dma_async_device_register(struct dma_device *device)
 	}
 
 	if (!device->device_release)
-		dev_warn(device->dev,
+		dev_dbg(device->dev,
 			 "WARN: Device release is not defined so it is not safe to unbind this driver while in use\n");
 
 	kref_init(&device->ref);
-- 
2.24.1

