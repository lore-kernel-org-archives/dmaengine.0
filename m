Return-Path: <SRS0=IgV5=6L=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D74ABC54FD0
	for <dmaengine@archiver.kernel.org>; Mon, 27 Apr 2020 11:10:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BDB31206B6
	for <dmaengine@archiver.kernel.org>; Mon, 27 Apr 2020 11:10:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727008AbgD0LKx (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 27 Apr 2020 07:10:53 -0400
Received: from smtp07.smtpout.orange.fr ([80.12.242.129]:40083 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726539AbgD0LKw (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Mon, 27 Apr 2020 07:10:52 -0400
Received: from localhost.localdomain ([92.148.159.11])
        by mwinf5d13 with ME
        id XnAl2200P0F2omL03nAman; Mon, 27 Apr 2020 13:10:51 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 27 Apr 2020 13:10:51 +0200
X-ME-IP: 92.148.159.11
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     okaya@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org,
        vkoul@kernel.org, dan.j.williams@intel.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] dmaengine: qcom_hidma: Simplify error handling path in hidma_probe
Date:   Mon, 27 Apr 2020 13:10:43 +0200
Message-Id: <20200427111043.70218-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

There is no need to call 'hidma_debug_uninit()' in the error handling
path. 'hidma_debug_init()' has not been called yet.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/dma/qcom/hidma.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/dma/qcom/hidma.c b/drivers/dma/qcom/hidma.c
index 411f91fde734..87490e125bc3 100644
--- a/drivers/dma/qcom/hidma.c
+++ b/drivers/dma/qcom/hidma.c
@@ -897,7 +897,6 @@ static int hidma_probe(struct platform_device *pdev)
 	if (msi)
 		hidma_free_msis(dmadev);
 
-	hidma_debug_uninit(dmadev);
 	hidma_ll_uninit(dmadev->lldev);
 dmafree:
 	if (dmadev)
-- 
2.25.1

