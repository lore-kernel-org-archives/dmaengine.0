Return-Path: <SRS0=i/ze=CY=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31B1EC433E2
	for <dmaengine@archiver.kernel.org>; Tue, 15 Sep 2020 03:03:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F03B1208DB
	for <dmaengine@archiver.kernel.org>; Tue, 15 Sep 2020 03:03:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726068AbgIODD5 (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 14 Sep 2020 23:03:57 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:12281 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726034AbgIODD4 (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Mon, 14 Sep 2020 23:03:56 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 1A8CDBD57C749919D858;
        Tue, 15 Sep 2020 11:03:52 +0800 (CST)
Received: from huawei.com (10.175.113.32) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0; Tue, 15 Sep 2020
 11:03:44 +0800
From:   Liu Shixin <liushixin2@huawei.com>
To:     Sean Wang <sean.wang@mediatek.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Vinod Koul <vkoul@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
CC:     <dmaengine@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        "Liu Shixin" <liushixin2@huawei.com>
Subject: [PATCH -next] dmaengine: mediatek: simplify the return expression of mtk_uart_apdma_runtime_resume()
Date:   Tue, 15 Sep 2020 11:26:22 +0800
Message-ID: <20200915032622.1772309-1-liushixin2@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.32]
X-CFilter-Loop: Reflected
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

Simplify the return expression.

Signed-off-by: Liu Shixin <liushixin2@huawei.com>
---
 drivers/dma/mediatek/mtk-uart-apdma.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c b/drivers/dma/mediatek/mtk-uart-apdma.c
index 29f1223b285a..27c07350971d 100644
--- a/drivers/dma/mediatek/mtk-uart-apdma.c
+++ b/drivers/dma/mediatek/mtk-uart-apdma.c
@@ -624,14 +624,9 @@ static int mtk_uart_apdma_runtime_suspend(struct device *dev)
 
 static int mtk_uart_apdma_runtime_resume(struct device *dev)
 {
-	int ret;
 	struct mtk_uart_apdmadev *mtkd = dev_get_drvdata(dev);
 
-	ret = clk_prepare_enable(mtkd->clk);
-	if (ret)
-		return ret;
-
-	return 0;
+	return clk_prepare_enable(mtkd->clk);
 }
 #endif /* CONFIG_PM */
 
-- 
2.25.1

