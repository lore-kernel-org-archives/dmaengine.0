Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 522A6C433DB
	for <dmaengine@archiver.kernel.org>; Sun,  3 Jan 2021 13:58:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 24CE7208C7
	for <dmaengine@archiver.kernel.org>; Sun,  3 Jan 2021 13:58:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727043AbhACN6X (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Sun, 3 Jan 2021 08:58:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:35262 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726129AbhACN6X (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Sun, 3 Jan 2021 08:58:23 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 632DE208C7;
        Sun,  3 Jan 2021 13:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609682262;
        bh=w6s5kcebAimhgTVacPtTiUtHsUatLmTZP8NLc4JsnK4=;
        h=From:To:Cc:Subject:Date:From;
        b=OJjp4WMn408IY0DKvguUQR/l+RzDopHMYgkO326QJjAwxCrvQcSEMEbN5lVDulUqy
         qqLYkxW6kHrhJbdrkDpQr/VwVH1sdnXBZNXVs+34m2ccbRtVOZa362iV/v+i3FLQUh
         YTJArNRhdXBW0G4PSHssB1Uk7lRrCiHA/EPSdfK5kWESbtv1eX+o1wQB6aalORtbVx
         PAyPQtFhCIupKKirFvSW1L4Wpj+x+8zJHzFTlUWhGOmBYOcbY/NZVUQXTDPfxpceQN
         MSTK8dZz/AkvmX5/mV3KtblrTYnlnM6RxXsgBrV0fxwpIZiYbdL0RgclXxhK+hNLjS
         VQYGxV8y4LHKg==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Dan Williams <dan.j.williams@intel.com>,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] dmaengine: qcom: fix gpi undefined behavior
Date:   Sun,  3 Jan 2021 14:57:29 +0100
Message-Id: <20210103135738.3741123-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

gcc points out an incorrect error handling loop:

drivers/dma/qcom/gpi.c: In function 'gpi_ch_init':
drivers/dma/qcom/gpi.c:1254:15: error: iteration 2 invokes undefined behavior [-Werror=aggressive-loop-optimizations]
 1254 |  struct gpii *gpii = gchan->gpii;
      |               ^~~~
drivers/dma/qcom/gpi.c:1951:2: note: within this loop
 1951 |  for (i = i - 1; i >= 0; i++) {
      |  ^~~

Change the loop to correctly walk backwards through the
initialized fields rather than off into the woods.

Fixes: 5d0c3533a19f ("dmaengine: qcom: Add GPI dma driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/dma/qcom/gpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
index 8d39d3e24686..9c211104ddbf 100644
--- a/drivers/dma/qcom/gpi.c
+++ b/drivers/dma/qcom/gpi.c
@@ -1948,7 +1948,7 @@ static int gpi_ch_init(struct gchan *gchan)
 	return ret;
 
 error_start_chan:
-	for (i = i - 1; i >= 0; i++) {
+	for (i = i - 1; i >= 0; i--) {
 		gpi_stop_chan(&gpii->gchan[i]);
 		gpi_send_cmd(gpii, gchan, GPI_CH_CMD_RESET);
 	}
-- 
2.29.2

