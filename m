Return-Path: <SRS0=voDv=Y6=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44709C5DF63
	for <dmaengine@archiver.kernel.org>; Wed,  6 Nov 2019 16:32:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 174C0217F4
	for <dmaengine@archiver.kernel.org>; Wed,  6 Nov 2019 16:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573057929;
	bh=jhBOluiYCulN6apFlRvdHiaY/j9/f6jUmjIwgV1NBgo=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=17VwldYOInQ3FcURlZOlzjiqOR3vIgyx5HjEzEWSI7x3hY3JgMHopLYRf0CjpGb+y
	 c0owg5YqXbOcj8kxq1fLhyff90gAc5TOWqh1fbo3s6LcgHR28mcxeb0mrZaslCZIgj
	 Psu5GPr0js64pS4iEUJVTrI739/Sjvp1ii0DQqj0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727435AbfKFQcI (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 6 Nov 2019 11:32:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:44036 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727321AbfKFQcI (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Wed, 6 Nov 2019 11:32:08 -0500
Received: from localhost.localdomain (unknown [223.226.46.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 72DBE217F4;
        Wed,  6 Nov 2019 16:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573057928;
        bh=jhBOluiYCulN6apFlRvdHiaY/j9/f6jUmjIwgV1NBgo=;
        h=From:To:Cc:Subject:Date:From;
        b=YVc71Lga1sFKZaRp49BRIiWXw51YZqCsOvSa9d6DkMCQvcpwJlBKFtn61lo/jfBo7
         bSiw4an/rwuUGasAcvBlUnEaqnQClxPO7mXTdt8rS+LYPX704vxb54hR6qbK05zeTD
         P6wCIjH2haeQ5jSIZwdUEkU02zPo8E/H9eG7vQg8=
From:   Vinod Koul <vkoul@kernel.org>
To:     dmaengine@vger.kernel.org
Cc:     jaswinder.singh@linaro.org, Vinod Koul <vkoul@kernel.org>,
        kbuild test robot <lkp@intel.com>
Subject: [PATCH 1/2] dmaengine: milbeaut-hdmac: remove redundant error log
Date:   Wed,  6 Nov 2019 22:01:27 +0530
Message-Id: <20191106163128.1980714-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.23.0
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
 drivers/dma/milbeaut-hdmac.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/dma/milbeaut-hdmac.c b/drivers/dma/milbeaut-hdmac.c
index 2bb33535ab9e..8853d442430b 100644
--- a/drivers/dma/milbeaut-hdmac.c
+++ b/drivers/dma/milbeaut-hdmac.c
@@ -431,11 +431,8 @@ static int milbeaut_hdmac_chan_init(struct platform_device *pdev,
 	int irq, ret;
 
 	irq = platform_get_irq(pdev, chan_id);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "failed to get IRQ number for ch%d\n",
-			chan_id);
+	if (irq < 0)
 		return irq;
-	}
 
 	irq_name = devm_kasprintf(dev, GFP_KERNEL, "milbeaut-hdmac-%d",
 				  chan_id);
-- 
2.23.0

