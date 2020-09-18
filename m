Return-Path: <SRS0=veQE=C3=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11833C43463
	for <dmaengine@archiver.kernel.org>; Fri, 18 Sep 2020 06:30:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C87E821481
	for <dmaengine@archiver.kernel.org>; Fri, 18 Sep 2020 06:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600410626;
	bh=IQhmDb9Gvirr9W7TU/bGaxVy/Wzg/SI9mkPG47dyJY0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=JSreJ1aarU094BknRrzVp3n/Zv1rns1j8qTDPWhR8Nzm86NO3snirVUj2R67a+CNI
	 i2YxQ8uHrTGtxoIzi2cm2HvTA2YSiSB+nSoLmk9EfTrWqtZuJu9IAVFAl5I9V9XR0T
	 Q1DhsY8NnNSuJ6JNc+/LQKhTpq6DtgU1KJTKrLRo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726411AbgIRGaW (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Fri, 18 Sep 2020 02:30:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:33214 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726402AbgIRGaV (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Fri, 18 Sep 2020 02:30:21 -0400
Received: from localhost.localdomain (unknown [136.185.124.244])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7D42B2100A;
        Fri, 18 Sep 2020 06:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600410620;
        bh=IQhmDb9Gvirr9W7TU/bGaxVy/Wzg/SI9mkPG47dyJY0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mIiIVX25MRM14GAKz6rgjg1AHEg7VMtBhzzpalo1LPrRncpqxS/ozdPcV5GMCgfUK
         zdPhdT/PWBrjzoR94cYXGy1WxenfMOPfqIH78Kt43nhNajSKY94KVwHbXw4e1Y5cTi
         amXL+v5Sbq6CYIu8Gnxgo0Q9q0XhnPK8A5qSiqqs=
From:   Vinod Koul <vkoul@kernel.org>
To:     dmaengine@vger.kernel.org
Cc:     Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH v2 1/3] dt-bindings: dmaengine: Document qcom,gpi dma binding
Date:   Fri, 18 Sep 2020 11:59:53 +0530
Message-Id: <20200918062955.2095156-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200918062955.2095156-1-vkoul@kernel.org>
References: <20200918062955.2095156-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

Add devicetree binding documentation for GPI DMA controller
implemented on Qualcomm SoCs

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 .../devicetree/bindings/dma/qcom,gpi.yaml     | 86 +++++++++++++++++++
 include/dt-bindings/dma/qcom-gpi.h            | 11 +++
 2 files changed, 97 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/qcom,gpi.yaml
 create mode 100644 include/dt-bindings/dma/qcom-gpi.h

diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
new file mode 100644
index 000000000000..82f404bc8745
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies Inc GPI DMA controller
+
+maintainers:
+  - Vinod Koul <vkoul@kernel.org>
+
+description: |
+  QCOM GPI DMA controller provides DMA capabilities for
+  peripheral buses such as I2C, UART, and SPI.
+
+allOf:
+  - $ref: "dma-controller.yaml#"
+
+properties:
+  compatible:
+    enum:
+      - qcom,gpi-dma
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description:
+      Interrupt lines for each GPII instance
+    maxItems: 13
+
+  "#dma-cells":
+    const: 3
+    description: >
+      DMA clients must use the format described in dma.txt, giving a phandle
+      to the DMA controller plus the following 3 integer cells:
+      - channel: if set to 0xffffffff, any available channel will be allocated
+        for the client. Otherwise, the exact channel specified will be used.
+      - seid: serial id of the client as defined in the SoC documentation.
+      - client: type of the client as defined in dt-bindings/dma/qcom-gpi.h
+
+  iommus:
+    maxItems: 1
+
+  dma-channels:
+    maxItems: 1
+
+  dma-channel-mask:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - "#dma-cells"
+  - iommus
+  - dma-channels
+  - dma-channel-mask
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/dma/qcom-gpi.h>
+    gpi_dma0: dma-controller@800000 {
+        compatible = "qcom,gpi-dma";
+        #dma-cells = <3>;
+        reg = <0x00800000 0x60000>;
+        iommus = <&apps_smmu 0x0016 0x0>;
+        dma-channels = <13>;
+        dma-channel-mask = <0xfa>;
+        interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>;
+    };
+
+...
diff --git a/include/dt-bindings/dma/qcom-gpi.h b/include/dt-bindings/dma/qcom-gpi.h
new file mode 100644
index 000000000000..71f79eb7614c
--- /dev/null
+++ b/include/dt-bindings/dma/qcom-gpi.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (c) 2020, Linaro Ltd.  */
+
+#ifndef __DT_BINDINGS_DMA_QCOM_GPI_H__
+#define __DT_BINDINGS_DMA_QCOM_GPI_H__
+
+#define QCOM_GPI_SPI		1
+#define QCOM_GPI_UART		2
+#define QCOM_GPI_I2C		3
+
+#endif /* __DT_BINDINGS_DMA_QCOM_GPI_H__ */
-- 
2.26.2

