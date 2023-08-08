Return-Path: <dmaengine-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3FD3C04A6A
	for <dmaengine@archiver.kernel.org>; Tue,  8 Aug 2023 19:21:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236073AbjHHTVt (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Tue, 8 Aug 2023 15:21:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236071AbjHHTVe (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Tue, 8 Aug 2023 15:21:34 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46BA943CD9
        for <dmaengine@vger.kernel.org>; Tue,  8 Aug 2023 09:45:01 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.56])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RKtcj3Cm3ztRrm;
        Tue,  8 Aug 2023 21:01:57 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 8 Aug
 2023 21:05:25 +0800
From:   Ruan Jinjie <ruanjinjie@huawei.com>
To:     <dmaengine@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Vinod Koul <vkoul@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH -next] dmaengine: mediatek: Remove redundant of_match_ptr()
Date:   Tue, 8 Aug 2023 21:04:56 +0800
Message-ID: <20230808130456.4079339-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

The driver depends on CONFIG_OF, it is not necessary to use
of_match_ptr() here.

Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
---
 drivers/dma/mediatek/mtk-uart-apdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c b/drivers/dma/mediatek/mtk-uart-apdma.c
index c51dc017b48a..98b4ddeaaff4 100644
--- a/drivers/dma/mediatek/mtk-uart-apdma.c
+++ b/drivers/dma/mediatek/mtk-uart-apdma.c
@@ -644,7 +644,7 @@ static struct platform_driver mtk_uart_apdma_driver = {
 	.driver = {
 		.name		= KBUILD_MODNAME,
 		.pm		= &mtk_uart_apdma_pm_ops,
-		.of_match_table = of_match_ptr(mtk_uart_apdma_match),
+		.of_match_table = mtk_uart_apdma_match,
 	},
 };
 
-- 
2.34.1

