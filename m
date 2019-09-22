Return-Path: <SRS0=UIJX=XR=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46D61C3A5A2
	for <dmaengine@archiver.kernel.org>; Sun, 22 Sep 2019 19:08:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 137B9206C2
	for <dmaengine@archiver.kernel.org>; Sun, 22 Sep 2019 19:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1569179315;
	bh=9BntkJM+X8b2XhLAQ3602/FseqHcZoM+K3XqsjBTRlA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=u5bU2ZNeL17gud0OnT/6WOJLIOEbi9R9gAOM8wdYz5yYhTMXn85+0vuqXmteOu1hg
	 2nEiOzV7x+Vvtavu9Erk3ltITLLRqkOIPxSzlquibFubpo4qdqbgJBLaSCmAaFt0rX
	 RnC8+A+xy62cCKtN/Pn8plwqT5X5uBwIx/mIxH7o=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438884AbfIVS7k (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Sun, 22 Sep 2019 14:59:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:35000 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2438823AbfIVS7k (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Sun, 22 Sep 2019 14:59:40 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B862D21A4A;
        Sun, 22 Sep 2019 18:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569178779;
        bh=9BntkJM+X8b2XhLAQ3602/FseqHcZoM+K3XqsjBTRlA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bvFLwXS+D696vWVnUNn1JijxNEl9a0dvOs1lP89lWsv9eEN9SU+fGZ0ojvrodfNKH
         RrwqknoWEFb/E+XRH8xgmRqcKSfEGUpYK2gi1dhhP6zVT+QKarf+BQKDxsMi9MsKG0
         ryf7+u/glXnwLDk4rKPM91sKSsVaKnwyKugB/y90=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Stefan Wahren <wahrenst@gmx.net>, Vinod Koul <vkoul@kernel.org>,
        Sasha Levin <sashal@kernel.org>, dmaengine@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 04/60] dmaengine: bcm2835: Print error in case setting DMA mask fails
Date:   Sun, 22 Sep 2019 14:58:37 -0400
Message-Id: <20190922185934.4305-4-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190922185934.4305-1-sashal@kernel.org>
References: <20190922185934.4305-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

From: Stefan Wahren <wahrenst@gmx.net>

[ Upstream commit 72503b25ee363827aafffc3e8d872e6a92a7e422 ]

During enabling of the RPi 4, we found out that the driver doesn't provide
a helpful error message in case setting DMA mask fails. So add one.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Link: https://lore.kernel.org/r/1563297318-4900-1-git-send-email-wahrenst@gmx.net
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/dma/bcm2835-dma.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 6ba53bbd0e161..b984d00bc0558 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -891,8 +891,10 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
 		pdev->dev.dma_mask = &pdev->dev.coherent_dma_mask;
 
 	rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
-	if (rc)
+	if (rc) {
+		dev_err(&pdev->dev, "Unable to set DMA mask\n");
 		return rc;
+	}
 
 	od = devm_kzalloc(&pdev->dev, sizeof(*od), GFP_KERNEL);
 	if (!od)
-- 
2.20.1

