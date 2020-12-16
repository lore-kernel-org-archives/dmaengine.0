Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00FBEC4361B
	for <dmaengine@archiver.kernel.org>; Wed, 16 Dec 2020 13:07:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B2111233A1
	for <dmaengine@archiver.kernel.org>; Wed, 16 Dec 2020 13:07:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725958AbgLPNHJ (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 16 Dec 2020 08:07:09 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:9214 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725274AbgLPNHI (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Wed, 16 Dec 2020 08:07:08 -0500
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CwwNJ5KvRzkq4d;
        Wed, 16 Dec 2020 21:05:36 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Wed, 16 Dec 2020 21:06:18 +0800
From:   Zheng Yongjun <zhengyongjun3@huawei.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <dan.j.williams@intel.com>, <vkoul@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: [PATCH -next] qcom: bam_dma: Delete useless kfree code
Date:   Wed, 16 Dec 2020 21:06:49 +0800
Message-ID: <20201216130649.13979-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.138.68]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

The parameter of kfree function is NULL, so kfree code is useless, delete it.
Therefore, goto expression is no longer needed, so simplify it.

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 drivers/dma/qcom/bam_dma.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 4eeb8bb27279..78df217b3f6c 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -630,7 +630,7 @@ static struct dma_async_tx_descriptor *bam_prep_slave_sg(struct dma_chan *chan,
 			     GFP_NOWAIT);
 
 	if (!async_desc)
-		goto err_out;
+		return NULL;
 
 	if (flags & DMA_PREP_FENCE)
 		async_desc->flags |= DESC_FLAG_NWD;
@@ -670,10 +670,6 @@ static struct dma_async_tx_descriptor *bam_prep_slave_sg(struct dma_chan *chan,
 	}
 
 	return vchan_tx_prep(&bchan->vc, &async_desc->vd, flags);
-
-err_out:
-	kfree(async_desc);
-	return NULL;
 }
 
 /**
-- 
2.22.0

