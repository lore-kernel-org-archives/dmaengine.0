Return-Path: <SRS0=cXJo=DA=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42528C4363D
	for <dmaengine@archiver.kernel.org>; Wed, 23 Sep 2020 06:34:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 05537221E8
	for <dmaengine@archiver.kernel.org>; Wed, 23 Sep 2020 06:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600842862;
	bh=kre9YirAIHmcHUINQUmzdMjGqHyd2+uFVSP0FrAE+4k=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=guJXWlzxUaotcoxeJ9oAbRxjS9pI6yBKd6lSIsOmnjLp0gBVtljisrUjQBTw5ruWD
	 Sbca04MLFD+m+I2Ryb/jLG6BuKFltBQJktRbObTveut7idMLQ+RYIZWt69+Lin693d
	 SbYBuCIJuolqNkjyw40o/+gwPGX7rBshYFT+T1ws=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726608AbgIWGeV (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 23 Sep 2020 02:34:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:44948 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726179AbgIWGeV (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Wed, 23 Sep 2020 02:34:21 -0400
Received: from localhost.localdomain (unknown [122.171.175.143])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 55D7321D43;
        Wed, 23 Sep 2020 06:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600842861;
        bh=kre9YirAIHmcHUINQUmzdMjGqHyd2+uFVSP0FrAE+4k=;
        h=From:To:Cc:Subject:Date:From;
        b=xy3RWnnVOcZ6oXRBF0ehGw+Bwf4erLcXEM9sv7tK16XtJvOT5YONtrONPXyh51Bd5
         bff3wxkqx5o6Jk1cN8m+Kfm8dI9bzIcW//bMcVQpOCrdXRJDDV/tylY4vLW0n4dopM
         f+EiHFY1AHz7ODGi/KkD+ZgnbNI4NyxnQnV58Axw=
From:   Vinod Koul <vkoul@kernel.org>
To:     dmaengine@vger.kernel.org
Cc:     Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH v3 0/3] dmaengine: Add support for QCOM GSI dma controller
Date:   Wed, 23 Sep 2020 12:04:07 +0530
Message-Id: <20200923063410.3431917-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

This series adds support for Qcom GSI dma controller found on Qualcomm SoCs.
This controller can program the peripheral configuration so we add
additional parameters in dma_slave_config for configuring the peripherals
like spi and i2c.

Changes in v3:
 - Update the i2c tre creation based on testing feedback

Changes in v2:
 - Update the binding and drop qcom specific properties
 - Move peripheral configuration as a pointer
 - Move submit queue for transactions to issue_pending

Vinod Koul (3):
  dt-bindings: dmaengine: Document qcom,gpi dma binding
  dmaengine: add peripheral configuration
  dmaengine: qcom: Add GPI dma driver

 .../devicetree/bindings/dma/qcom,gpi.yaml     |   86 +
 drivers/dma/qcom/Kconfig                      |   12 +
 drivers/dma/qcom/Makefile                     |    1 +
 drivers/dma/qcom/gpi.c                        | 2295 +++++++++++++++++
 include/dt-bindings/dma/qcom-gpi.h            |   11 +
 include/linux/dmaengine.h                     |   91 +
 6 files changed, 2496 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/qcom,gpi.yaml
 create mode 100644 drivers/dma/qcom/gpi.c
 create mode 100644 include/dt-bindings/dma/qcom-gpi.h

-- 
2.26.2

