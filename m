Return-Path: <SRS0=voDv=Y6=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47E57C5DF63
	for <dmaengine@archiver.kernel.org>; Wed,  6 Nov 2019 16:32:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 13FE02187F
	for <dmaengine@archiver.kernel.org>; Wed,  6 Nov 2019 16:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573057931;
	bh=UPtPfF84kJmerAR8ODzUcUrcSkzXPV5RdNC910/MOrA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=GfkLD+wqbuRc/nzex9YY4vU3JrWrrdjzV9eRcvPg7Gy23oYHSVoTgrwxf4QyLo6Kn
	 B/gUD9wBojxd/Sw+NKcP4dtg9VIqY8zRYiwbqkPO3v3ANCMB8DIYJljwsJhm4uuu9J
	 VajAkULjmhcNjLgKrRbcxcbK6T+l2SzsP28vK3gA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727625AbfKFQcK (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 6 Nov 2019 11:32:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:44076 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727321AbfKFQcK (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Wed, 6 Nov 2019 11:32:10 -0500
Received: from localhost.localdomain (unknown [223.226.46.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A39F22067B;
        Wed,  6 Nov 2019 16:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573057930;
        bh=UPtPfF84kJmerAR8ODzUcUrcSkzXPV5RdNC910/MOrA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Q3j94BBoGTEvkJE8Oa0DtJRiNDJax2881WdNcXl+7Ud2OhX7PEUzuwIpY+IW9JyBo
         hhcCQfiqZUZzWnDBl65pcPuEssgahKuFoXHUYrmvPQxfX27Wea56YXbBCn0jYR0En4
         uKlUfYHAFfreM7BqTdo8BWY0FCG1+7ziiSD5KG+o=
From:   Vinod Koul <vkoul@kernel.org>
To:     dmaengine@vger.kernel.org
Cc:     jaswinder.singh@linaro.org, Vinod Koul <vkoul@kernel.org>,
        kbuild test robot <lkp@intel.com>
Subject: [PATCH 2/2] dmaengine: milbeaut-xdmac: remove redundant error log
Date:   Wed,  6 Nov 2019 22:01:28 +0530
Message-Id: <20191106163128.1980714-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191106163128.1980714-1-vkoul@kernel.org>
References: <20191106163128.1980714-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

platform_get_irq() prints the error message, so caller need not do so,
remove the error line in this driver for platform_get_irq()

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/dma/milbeaut-xdmac.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/dma/milbeaut-xdmac.c b/drivers/dma/milbeaut-xdmac.c
index 3d5b1926a58d..ab3d2f395378 100644
--- a/drivers/dma/milbeaut-xdmac.c
+++ b/drivers/dma/milbeaut-xdmac.c
@@ -269,11 +269,8 @@ static int milbeaut_xdmac_chan_init(struct platform_device *pdev,
 	int irq, ret;
 
 	irq = platform_get_irq(pdev, chan_id);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "failed to get IRQ number for ch%d\n",
-			chan_id);
+	if (irq < 0)
 		return irq;
-	}
 
 	irq_name = devm_kasprintf(dev, GFP_KERNEL, "milbeaut-xdmac-%d",
 				  chan_id);
-- 
2.23.0

