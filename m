Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E26CC49EA6
	for <dmaengine@archiver.kernel.org>; Mon, 14 Jun 2021 23:56:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 72D9361029
	for <dmaengine@archiver.kernel.org>; Mon, 14 Jun 2021 23:56:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231733AbhFNX6p (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 14 Jun 2021 19:58:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231742AbhFNX6n (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Mon, 14 Jun 2021 19:58:43 -0400
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [IPv6:2001:4b7a:2000:18::170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7F33C0613A2
        for <dmaengine@vger.kernel.org>; Mon, 14 Jun 2021 16:56:39 -0700 (PDT)
Received: from localhost.localdomain (83.6.168.161.neoplus.adsl.tpnet.pl [83.6.168.161])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id F1B191F91B;
        Tue, 15 Jun 2021 01:56:35 +0200 (CEST)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] dmaengine: qcom: gpi: Add SM8250 compatible
Date:   Tue, 15 Jun 2021 01:56:29 +0200
Message-Id: <20210614235630.445501-2-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210614235630.445501-1-konrad.dybcio@somainline.org>
References: <20210614235630.445501-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

SM8250 seems to work just fine, so add a shiny new compatible for it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 drivers/dma/qcom/gpi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
index 43ac3ab23d4c..1a1b7d8458c9 100644
--- a/drivers/dma/qcom/gpi.c
+++ b/drivers/dma/qcom/gpi.c
@@ -2282,6 +2282,7 @@ static int gpi_probe(struct platform_device *pdev)
 static const struct of_device_id gpi_of_match[] = {
 	{ .compatible = "qcom,sdm845-gpi-dma" },
 	{ .compatible = "qcom,sm8150-gpi-dma" },
+	{ .compatible = "qcom,sm8250-gpi-dma" },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, gpi_of_match);
-- 
2.32.0

