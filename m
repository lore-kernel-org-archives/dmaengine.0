Return-Path: <SRS0=veQE=C3=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C00C4C43464
	for <dmaengine@archiver.kernel.org>; Fri, 18 Sep 2020 02:02:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 82E3423119
	for <dmaengine@archiver.kernel.org>; Fri, 18 Sep 2020 02:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600394526;
	bh=S2yWY6GVlUKNXC6TiofSvJRC76+LiIQlEzBMael9vcE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=xdjBS8oyea066cbtxbqO3vM5UxuJHXjqe3ZTQFHxX8ioaNf9E5jpZd+3UaWA+1zzM
	 m26owHP+RZKhMmYnTPY8kM37LCCehtNdSQMhAv6YFMdf5dUSt46BjUUwERhGsWL4rL
	 Kn2Hq6Jg9d3T9L10DW0Ym+R7rXkv5IZZLVmyHSaQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726621AbgIRCCG (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Thu, 17 Sep 2020 22:02:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:47008 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726618AbgIRCCF (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Thu, 17 Sep 2020 22:02:05 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 69EE8235F9;
        Fri, 18 Sep 2020 02:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600394525;
        bh=S2yWY6GVlUKNXC6TiofSvJRC76+LiIQlEzBMael9vcE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PSulnH6vMTx/LJPCmJlPhlvYmnYCu9u/EWTO4EIksc0dYOcfYZTnVPU0PuCzM9yB9
         mCDGRDCGkEhxi52rywR5qyMWLRpaRAWuYbkMLlz2IqhFufFZOcGmL94YOyvdEdzkbD
         i9q94qXWU4qFuxJGaiGdhWO2FY/7CLAG1ZDH5b7g=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Satendra Singh Thakur <sst2005@gmail.com>,
        Vinod Koul <vkoul@kernel.org>, Sasha Levin <sashal@kernel.org>,
        dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.4 046/330] dmaengine: mediatek: hsdma_probe: fixed a memory leak when devm_request_irq fails
Date:   Thu, 17 Sep 2020 21:56:26 -0400
Message-Id: <20200918020110.2063155-46-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200918020110.2063155-1-sashal@kernel.org>
References: <20200918020110.2063155-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

From: Satendra Singh Thakur <sst2005@gmail.com>

[ Upstream commit 1ff95243257fad07290dcbc5f7a6ad79d6e703e2 ]

When devm_request_irq fails, currently, the function
dma_async_device_unregister gets called. This doesn't free
the resources allocated by of_dma_controller_register.
Therefore, we have called of_dma_controller_free for this purpose.

Signed-off-by: Satendra Singh Thakur <sst2005@gmail.com>
Link: https://lore.kernel.org/r/20191109113523.6067-1-sst2005@gmail.com
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/dma/mediatek/mtk-hsdma.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/mediatek/mtk-hsdma.c b/drivers/dma/mediatek/mtk-hsdma.c
index 1a2028e1c29e9..4c58da7421432 100644
--- a/drivers/dma/mediatek/mtk-hsdma.c
+++ b/drivers/dma/mediatek/mtk-hsdma.c
@@ -997,7 +997,7 @@ static int mtk_hsdma_probe(struct platform_device *pdev)
 	if (err) {
 		dev_err(&pdev->dev,
 			"request_irq failed with err %d\n", err);
-		goto err_unregister;
+		goto err_free;
 	}
 
 	platform_set_drvdata(pdev, hsdma);
@@ -1006,6 +1006,8 @@ static int mtk_hsdma_probe(struct platform_device *pdev)
 
 	return 0;
 
+err_free:
+	of_dma_controller_free(pdev->dev.of_node);
 err_unregister:
 	dma_async_device_unregister(dd);
 
-- 
2.25.1

