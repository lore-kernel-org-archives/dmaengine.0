Return-Path: <SRS0=Pb1s=EJ=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FA7FC4742C
	for <dmaengine@archiver.kernel.org>; Tue,  3 Nov 2020 11:27:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F162C20731
	for <dmaengine@archiver.kernel.org>; Tue,  3 Nov 2020 11:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604402826;
	bh=FAWZqcB8rrnTRfBi5nGT+Xgbjb35tQW4OIlGOvwmpXU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=R2FlptLLETKf/qLv9QPH+9cfvPnvvTnsKngmcq3VGMVJSdRGcEcGCMYsDjCoxnNzG
	 VulEmMmunF/uG4us0gNJEhdehi/oVCKosxA+MAKEUSHN5a808904enANb34fuijFlB
	 62SktgZ4vJ9OFNCjEAK/OGoZ+qgqjWNFnscaps3g=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728718AbgKCL0v (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Tue, 3 Nov 2020 06:26:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:46222 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728711AbgKCL0q (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Tue, 3 Nov 2020 06:26:46 -0500
Received: from localhost.localdomain (unknown [122.179.37.237])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5FF53206BE;
        Tue,  3 Nov 2020 11:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604402806;
        bh=FAWZqcB8rrnTRfBi5nGT+Xgbjb35tQW4OIlGOvwmpXU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=U0vKZovgAuy0VBle6heEOaR3q5J/NZsCQU/1yquDDEylvbVkwZOJV7KOL+RhAHCU+
         TTVGvfzVasMKgmn/nUaxwtDW3SFBeNbot4GNKHePjmHqvUNcQRFrXFqYvR5R58GWOF
         knZd1FnN3x8NENTU+UyVKTvoK9HQCmNAlPwE6Yfo=
From:   Vinod Koul <vkoul@kernel.org>
To:     dmaengine@vger.kernel.org
Cc:     Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH v5 2/3] dmaengine: add peripheral configuration
Date:   Tue,  3 Nov 2020 16:55:43 +0530
Message-Id: <20201103112544.674566-3-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201103112544.674566-1-vkoul@kernel.org>
References: <20201103112544.674566-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

Some complex dmaengine controllers have capability to program the
peripheral device, so pass on the peripheral configuration as part of
dma_slave_config

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 include/linux/dmaengine.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index dd357a747780..493a047ed0a2 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -418,6 +418,9 @@ enum dma_slave_buswidth {
  * @slave_id: Slave requester id. Only valid for slave channels. The dma
  * slave peripheral will have unique id as dma requester which need to be
  * pass as slave config.
+ * @peripheral_config: peripheral configuration for programming peripheral
+ * for dmaengine transfer
+ * @peripheral_size: peripheral configuration buffer size
  *
  * This struct is passed in as configuration data to a DMA engine
  * in order to set up a certain channel for DMA transport at runtime.
@@ -443,6 +446,8 @@ struct dma_slave_config {
 	u32 dst_port_window_size;
 	bool device_fc;
 	unsigned int slave_id;
+	void *peripheral_config;
+	size_t peripheral_size;
 };
 
 /**
-- 
2.26.2

