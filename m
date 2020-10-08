Return-Path: <SRS0=pC2y=DP=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D21FC04EBE
	for <dmaengine@archiver.kernel.org>; Thu,  8 Oct 2020 12:32:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C43FD21D43
	for <dmaengine@archiver.kernel.org>; Thu,  8 Oct 2020 12:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602160340;
	bh=ySoQckmFJh8rm9F+Ix3Hhff1OcUz1ve3KxVHcsZ+2xA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=DBcMAsPx7DmuTsjsyx48veti8MsG3+YOxL7SoE6kUfk+0lkXFBiljfLJ0rQ1Dy1n9
	 /PN9SQmwcvLC7/PvHnJ3xEPXTP/fd97DQtxs2dzV/KZsTR+FsTsGI9Cki59G7596oA
	 bXd6xaWPX2TYKK/sTE87/h6zhAvmsVN3RshX46XQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729944AbgJHMcR (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Thu, 8 Oct 2020 08:32:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:58002 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729942AbgJHMcQ (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Thu, 8 Oct 2020 08:32:16 -0400
Received: from localhost.localdomain (unknown [122.182.224.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 987BB2083B;
        Thu,  8 Oct 2020 12:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602160335;
        bh=ySoQckmFJh8rm9F+Ix3Hhff1OcUz1ve3KxVHcsZ+2xA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mI5CoUeHWcffAjGKN3ozZqTb3SB5WHq24a0X7oVEUdvQwGB3gnZ0ZuHwmWjtT4YCE
         VzuV6wWCAB1hIqSPSwLECNvMgx5BkSob4Xd2aAxwHzcju4vAIu157bSL9ieDwoIXgr
         lEpMZRRXaO8Ef2e4OMv8n7XMJC+2D8egHO4O1Vns=
From:   Vinod Koul <vkoul@kernel.org>
To:     dmaengine@vger.kernel.org
Cc:     Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH v4 2/3] dmaengine: add peripheral configuration
Date:   Thu,  8 Oct 2020 18:01:50 +0530
Message-Id: <20201008123151.764238-3-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201008123151.764238-1-vkoul@kernel.org>
References: <20201008123151.764238-1-vkoul@kernel.org>
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
index 6fbd5c99e30c..a15dc2960f6d 100644
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

