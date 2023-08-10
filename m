Return-Path: <dmaengine-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6697EB64DD
	for <dmaengine@archiver.kernel.org>; Thu, 10 Aug 2023 02:20:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230162AbjHJCU5 (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 9 Aug 2023 22:20:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbjHJCU4 (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Wed, 9 Aug 2023 22:20:56 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56C0710FE
        for <dmaengine@vger.kernel.org>; Wed,  9 Aug 2023 19:20:55 -0700 (PDT)
Received: from dggpemm500006.china.huawei.com (unknown [172.30.72.56])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RLrFr1QcSzVkCQ;
        Thu, 10 Aug 2023 10:18:56 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500006.china.huawei.com (7.185.36.236) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 10 Aug 2023 10:20:52 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 10 Aug
 2023 10:20:51 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <dmaengine@vger.kernel.org>
CC:     <vkoul@kernel.org>, <yangyingliang@huawei.com>
Subject: [PATCH -next] dmaengine: mcf-edma: remove unnecessary resource check
Date:   Thu, 10 Aug 2023 10:17:49 +0800
Message-ID: <20230810021749.3096598-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

The resources are already checked in probe path, so there is
no need do this check in remove path.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/dma/mcf-edma.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/dma/mcf-edma.c b/drivers/dma/mcf-edma.c
index 9413fad08a60..875cae55f2dd 100644
--- a/drivers/dma/mcf-edma.c
+++ b/drivers/dma/mcf-edma.c
@@ -150,25 +150,19 @@ static void mcf_edma_irq_free(struct platform_device *pdev,
 
 	res = platform_get_resource_byname(pdev,
 			IORESOURCE_IRQ, "edma-tx-00-15");
-	if (res) {
-		for (irq = res->start; irq <= res->end; irq++)
-			free_irq(irq, mcf_edma);
-	}
+	for (irq = res->start; irq <= res->end; irq++)
+		free_irq(irq, mcf_edma);
 
 	res = platform_get_resource_byname(pdev,
 			IORESOURCE_IRQ, "edma-tx-16-55");
-	if (res) {
-		for (irq = res->start; irq <= res->end; irq++)
-			free_irq(irq, mcf_edma);
-	}
+	for (irq = res->start; irq <= res->end; irq++)
+		free_irq(irq, mcf_edma);
 
 	irq = platform_get_irq_byname(pdev, "edma-tx-56-63");
-	if (irq != -ENXIO)
-		free_irq(irq, mcf_edma);
+	free_irq(irq, mcf_edma);
 
 	irq = platform_get_irq_byname(pdev, "edma-err");
-	if (irq != -ENXIO)
-		free_irq(irq, mcf_edma);
+	free_irq(irq, mcf_edma);
 }
 
 static struct fsl_edma_drvdata mcf_data = {
-- 
2.25.1

