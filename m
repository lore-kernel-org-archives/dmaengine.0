Return-Path: <SRS0=BOy8=C2=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BA95C433E2
	for <dmaengine@archiver.kernel.org>; Thu, 17 Sep 2020 07:56:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4F637221EB
	for <dmaengine@archiver.kernel.org>; Thu, 17 Sep 2020 07:56:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726153AbgIQH4J (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Thu, 17 Sep 2020 03:56:09 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:52664 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726348AbgIQHyN (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Thu, 17 Sep 2020 03:54:13 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 41DC4C1419B341F93089;
        Thu, 17 Sep 2020 15:38:08 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0; Thu, 17 Sep 2020
 15:38:05 +0800
From:   Qilong Zhang <zhangqilong3@huawei.com>
To:     <vkoul@kernel.org>, <dan.j.williams@intel.com>
CC:     <dmaengine@vger.kernel.org>
Subject: [PATCH -next] dmaengine: ti: k3-udma: use devm_platform_ioremap_resource_byname
Date:   Thu, 17 Sep 2020 15:44:57 +0800
Message-ID: <20200917074457.52748-1-zhangqilong3@huawei.com>
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
---
 drivers/dma/ti/k3-udma.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index de7bfc02a2de..eb29fdc9ffc1 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -3157,13 +3157,11 @@ static const struct soc_device_attribute k3_soc_devices[] = {
 
 static int udma_get_mmrs(struct platform_device *pdev, struct udma_dev *ud)
 {
-	struct resource *res;
 	int i;
 
 	for (i = 0; i < MMR_LAST; i++) {
-		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-						   mmr_names[i]);
-		ud->mmrs[i] = devm_ioremap_resource(&pdev->dev, res);
+		ud->mmrs[i] = devm_platform_ioremap_resource_byname(pdev,
+								    mmr_names[i]);
 		if (IS_ERR(ud->mmrs[i]))
 			return PTR_ERR(ud->mmrs[i]);
 	}
-- 
2.17.1

