Return-Path: <SRS0=/re0=C6=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37CC8C43464
	for <dmaengine@archiver.kernel.org>; Mon, 21 Sep 2020 09:30:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E5E4721D43
	for <dmaengine@archiver.kernel.org>; Mon, 21 Sep 2020 09:30:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726417AbgIUJaN (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 21 Sep 2020 05:30:13 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:13793 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726347AbgIUJaN (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Mon, 21 Sep 2020 05:30:13 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 0A0955EA154BBD9885CC;
        Mon, 21 Sep 2020 17:30:11 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.487.0; Mon, 21 Sep 2020
 17:30:08 +0800
From:   Qilong Zhang <zhangqilong3@huawei.com>
To:     <vkoul@kernel.org>, <dan.j.williams@intel.com>,
        <peter.ujfalusi@ti.com>
CC:     <dmaengine@vger.kernel.org>
Subject: [PATCH -next v2] dmaengine: ti: k3-udma: use devm_platform_ioremap_resource_byname
Date:   Mon, 21 Sep 2020 17:37:01 +0800
Message-ID: <20200921093701.102208-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

From: Zhang Qilong <zhangqilong3@huawei.com>

Use the devm_platform_ioremap_resource_byname() helper instead of
calling platform_get_resource_byname() and devm_ioremap_resource()
separately.

Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
Acked-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 drivers/dma/ti/k3-udma.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index de7bfc02a2de..bb4bdd90a745 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -3157,13 +3157,10 @@ static const struct soc_device_attribute k3_soc_devices[] = {
 
 static int udma_get_mmrs(struct platform_device *pdev, struct udma_dev *ud)
 {
-	struct resource *res;
 	int i;
 
 	for (i = 0; i < MMR_LAST; i++) {
-		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-						   mmr_names[i]);
-		ud->mmrs[i] = devm_ioremap_resource(&pdev->dev, res);
+		ud->mmrs[i] = devm_platform_ioremap_resource_byname(pdev, mmr_names[i]);
 		if (IS_ERR(ud->mmrs[i]))
 			return PTR_ERR(ud->mmrs[i]);
 	}
-- 
2.17.1

