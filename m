Return-Path: <dmaengine-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38F41C001DE
	for <dmaengine@archiver.kernel.org>; Wed, 16 Aug 2023 02:08:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241174AbjHPCHa (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Tue, 15 Aug 2023 22:07:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241181AbjHPCHS (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Tue, 15 Aug 2023 22:07:18 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50ACB2127
        for <dmaengine@vger.kernel.org>; Tue, 15 Aug 2023 19:07:17 -0700 (PDT)
Received: from dggpeml500003.china.huawei.com (unknown [172.30.72.53])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RQWdR0xJqztRc4;
        Wed, 16 Aug 2023 10:03:39 +0800 (CST)
Received: from huawei.com (10.175.103.91) by dggpeml500003.china.huawei.com
 (7.185.36.200) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Wed, 16 Aug
 2023 10:07:15 +0800
From:   Yu Liao <liaoyu15@huawei.com>
To:     <vkoul@kernel.org>
CC:     <liaoyu15@huawei.com>, <liwei391@huawei.com>,
        <dmaengine@vger.kernel.org>
Subject: [PATCH -next 2/2] dmaengine: mcf-edma: use struct_size() helper
Date:   Wed, 16 Aug 2023 10:03:55 +0800
Message-ID: <20230816020355.3002617-2-liaoyu15@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230816020355.3002617-1-liaoyu15@huawei.com>
References: <20230816020355.3002617-1-liaoyu15@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500003.china.huawei.com (7.185.36.200)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

Make use of the struct_size() helper instead of an open-coded version,
in order to avoid any potential type mistakes or integer overflows that,
in the worst scenario, could lead to heap overflows.

Signed-off-by: Yu Liao <liaoyu15@huawei.com>
---
 drivers/dma/mcf-edma.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/dma/mcf-edma.c b/drivers/dma/mcf-edma.c
index 9413fad08a60..444b5c1bd7dc 100644
--- a/drivers/dma/mcf-edma.c
+++ b/drivers/dma/mcf-edma.c
@@ -180,7 +180,6 @@ static int mcf_edma_probe(struct platform_device *pdev)
 {
 	struct mcf_edma_platform_data *pdata;
 	struct fsl_edma_engine *mcf_edma;
-	struct fsl_edma_chan *mcf_chan;
 	struct edma_regs *regs;
 	int ret, i, len, chans;
 
@@ -197,7 +196,7 @@ static int mcf_edma_probe(struct platform_device *pdev)
 		chans = pdata->dma_channels;
 	}
 
-	len = sizeof(*mcf_edma) + sizeof(*mcf_chan) * chans;
+	len = struct_size(mcf_edma, chans, chans);
 	mcf_edma = devm_kzalloc(&pdev->dev, len, GFP_KERNEL);
 	if (!mcf_edma)
 		return -ENOMEM;
-- 
2.25.1

