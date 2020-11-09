Return-Path: <SRS0=Hdpn=EP=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FB5BC2D0A3
	for <dmaengine@archiver.kernel.org>; Mon,  9 Nov 2020 08:55:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E21532076E
	for <dmaengine@archiver.kernel.org>; Mon,  9 Nov 2020 08:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604912100;
	bh=0jSgpA402jampuOv0Dsy4QYdmYwPUsvT0bHAswyJN/U=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=VT1K144mCcAuwatOOKi9gwk3ki2JTC8gnRQGEm1iPeUPlF4tDmlBtdYpvJ8u0HytU
	 DlEgBJhK8EDavl8sdSBQumuX/yBlDGUzmTTmzMwteO2TiNpx8kwlf1ZepAFc7Xgmef
	 rAAZ497Sp7YbRXV5NNHwth4bJ3HZ/5xrB/mgzFIk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727826AbgKIIy7 (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 9 Nov 2020 03:54:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:44430 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726127AbgKIIy7 (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Mon, 9 Nov 2020 03:54:59 -0500
Received: from localhost.localdomain (unknown [122.171.147.34])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DEF1C206ED;
        Mon,  9 Nov 2020 08:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604912098;
        bh=0jSgpA402jampuOv0Dsy4QYdmYwPUsvT0bHAswyJN/U=;
        h=From:To:Cc:Subject:Date:From;
        b=iM/dwx0zZCUVRrtqMri+DsQ41C2H6Jv4Arj7+UQ2ROiDqXv+7C2lC/3aGP4ZWsykY
         mOCFXp6ov9gcbmNNvD1oS6epF5iUkANA3WKvscgoeW4v4VUVnBnFmlDJiCfqOPgb28
         bpoGw8dOOHQO4ph9eT+w7Sf82PRMg9vAsdaSK77Y=
From:   Vinod Koul <vkoul@kernel.org>
To:     dmaengine@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH v6 0/3] dmaengine: Add support for QCOM GSI dma controller
Date:   Mon,  9 Nov 2020 14:24:47 +0530
Message-Id: <20201109085450.24843-1-vkoul@kernel.org>
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

Changes in v6:
 - Fix error reported by dt tool

Changes in v5:
 - Add acked by Rob
 - Move qcom-gpi-dma.h header to include/linux/dma/
 - rebase and test on v5.10-rc2

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

 .../devicetree/bindings/dma/qcom,gpi.yaml     |   88 +
 drivers/dma/qcom/Kconfig                      |   12 +
 drivers/dma/qcom/Makefile                     |    1 +
 drivers/dma/qcom/gpi.c                        | 2303 +++++++++++++++++
 include/dt-bindings/dma/qcom-gpi.h            |   11 +
 include/linux/dma/qcom-gpi-dma.h              |   83 +
 include/linux/dmaengine.h                     |    5 +
 7 files changed, 2503 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/qcom,gpi.yaml
 create mode 100644 drivers/dma/qcom/gpi.c
 create mode 100644 include/dt-bindings/dma/qcom-gpi.h
 create mode 100644 include/linux/dma/qcom-gpi-dma.h

-- 
2.26.2

