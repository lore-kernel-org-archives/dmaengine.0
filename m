Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D20D8C433F5
	for <dmaengine@archiver.kernel.org>; Sun,  2 Oct 2022 23:05:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229495AbiJBXFc (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Sun, 2 Oct 2022 19:05:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229961AbiJBXEq (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Sun, 2 Oct 2022 19:04:46 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46D3A4507C;
        Sun,  2 Oct 2022 16:00:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BEA1FB80C03;
        Sun,  2 Oct 2022 22:53:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72519C433D6;
        Sun,  2 Oct 2022 22:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664751210;
        bh=MLYHlpHej6WatiXz/o2H6bBtG1Sl1y9g5508EWQT3AE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RG6Nu2XJoEUHI8uxv3v2xl72JNGNQirPDcM5fkFFKr/trlmcFTPAeFixZcl4LsM3u
         HfsKQIco0WaD5+D6nXdYYombW990LElKO4x0X0UaSBZK8l5RVq+z5vy4nem9eIfDD2
         nbLynjujc2LmvBNziWCLJfzGLbpaLa8Z0f/0GijqwnXtfg9KTsxVg4Q8GIuOPchnnE
         nhOo1PkhgjiLpUkd3Ijyy04Pq5Xh5egPsFuye27wMMJi7rzef05l/9EixWasUJ7Gfz
         Cv4UgnI9181+Is9IwLYt79814hgTTWJFou6cuy1OPo2WCRMWd7E+VAo3Sk1qBSwVK3
         QIzXb7YwCx70w==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Swati Agarwal <swati.agarwal@xilinx.com>,
        Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
        Vinod Koul <vkoul@kernel.org>, Sasha Levin <sashal@kernel.org>,
        michal.simek@xilinx.com, lars@metafoo.de, adrianml@alumnos.upm.es,
        shravya.kumbham@xilinx.com, dmaengine@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 4.14 2/6] dmaengine: xilinx_dma: Report error in case of dma_set_mask_and_coherent API failure
Date:   Sun,  2 Oct 2022 18:53:17 -0400
Message-Id: <20221002225323.240142-2-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221002225323.240142-1-sashal@kernel.org>
References: <20221002225323.240142-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

From: Swati Agarwal <swati.agarwal@xilinx.com>

[ Upstream commit 8f2b6bc79c32f0fa60df000ae387a790ec80eae9 ]

The driver does not handle the failure case while calling
dma_set_mask_and_coherent API.

In case of failure, capture the return value of API and then report an
error.

Addresses-coverity: Unchecked return value (CHECKED_RETURN)

Signed-off-by: Swati Agarwal <swati.agarwal@xilinx.com>
Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Link: https://lore.kernel.org/r/20220817061125.4720-4-swati.agarwal@xilinx.com
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/dma/xilinx/xilinx_dma.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index 9319349e69d2..b4d00bc461db 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -2585,7 +2585,11 @@ static int xilinx_dma_probe(struct platform_device *pdev)
 		xdev->ext_addr = false;
 
 	/* Set the dma mask bits */
-	dma_set_mask_and_coherent(xdev->dev, DMA_BIT_MASK(addr_width));
+	err = dma_set_mask_and_coherent(xdev->dev, DMA_BIT_MASK(addr_width));
+	if (err < 0) {
+		dev_err(xdev->dev, "DMA mask error %d\n", err);
+		goto disable_clks;
+	}
 
 	/* Initialize the DMA engine */
 	xdev->common.dev = &pdev->dev;
-- 
2.35.1

