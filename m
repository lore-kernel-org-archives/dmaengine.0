Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F083C433E0
	for <dmaengine@archiver.kernel.org>; Tue, 26 Jan 2021 21:54:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6B95220656
	for <dmaengine@archiver.kernel.org>; Tue, 26 Jan 2021 21:54:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727154AbhAZVxc (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Tue, 26 Jan 2021 16:53:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:43456 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730690AbhAZU7w (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Tue, 26 Jan 2021 15:59:52 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 41FE022B2C;
        Tue, 26 Jan 2021 20:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611694749;
        bh=r1DnF68db4pj69f6C9y4zn8Zrxsw78hsx34tX5XZlws=;
        h=From:To:Cc:Subject:Date:From;
        b=FKxcTAs2Nt9QXSA+JjF1S7d2WLJ5bGZKzZuX2102Tmcz01CvDMA3nHGve6+er3L4B
         n06YQC3gjq4ix7gig3tDB/XHhn+ad7xXkzFNwezMST3oAAbMisqCfcPWJDBSEjdE48
         q7rIBr60Gx4ByzIkavEEK8JSweHOI9+gVuO9KjjIqg6iOOrGTnVu3Csyj2AHA+0cRw
         fufj51zBvqFlhy056EnFdTid8Lf8TtWej57bgGzU0TYjk+Pg4yUK9B4C+2HVBIsNma
         FfdX2R2xcxxwnyGjoby3q8kdm4EuAYVCr8EHpx6CEthhjbBlETUzr4NL2gV3qvULtO
         iJUh8fJXVpu1g==
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     dmaengine@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH] dmaengine: stedma40: fix 'physical' typo
Date:   Tue, 26 Jan 2021 14:59:06 -0600
Message-Id: <20210126205906.2918099-1-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

From: Bjorn Helgaas <bhelgaas@google.com>

Fix misspelling of "physical".

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/dma/ste_dma40.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 4256e55bbf25..265d7c07b348 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -78,7 +78,7 @@ static int dma40_memcpy_channels[] = {
 	DB8500_DMA_MEMCPY_EV_5,
 };
 
-/* Default configuration for physcial memcpy */
+/* Default configuration for physical memcpy */
 static const struct stedma40_chan_cfg dma40_memcpy_conf_phy = {
 	.mode = STEDMA40_MODE_PHYSICAL,
 	.dir = DMA_MEM_TO_MEM,
-- 
2.25.1

