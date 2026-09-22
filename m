Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0D522BE053;
	Tue, 22 Sep 2026 09:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790069176; cv=none; b=lsyULqwCf2N6VVV9c0Z1D8FpCVjI7FilgFdwhRr4FT/VFvr+rjR2txcG33ileYb9yBVKx97iLktB3/UNLBxgxZCZN0GwzDupC0jhTG0VVDRpzjfdyeII7rHa0z0gIcEvjmF6KUb/x83P3JQ4WxL39Eps6IhvqpdoGbLTCTvPp+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790069176; c=relaxed/simple;
	bh=W41Vu38HHxl1LSaw42Lwrf3KLmOZDkcCH0+JkLBeA+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TgTyIfSq0daITXC4ZQ7l4xsH6iLjqgQk+Zt6e3RTCITqCDxQnZ4kTQ99ltssLAhQKP2tudxyEZIzVkQIINeNczpSCYy90T6ryLFa07dUs21nXmzD0L37WmEok68TALz4FFRXPAW5qMVvoVQxQwCcyjkW6tYmHArUV1tO932r//s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.159])
	by gateway (Coremail) with SMTP id _____8CxfdKuSbJqPJcOAA--.42490S3;
	Tue, 22 Sep 2026 17:26:06 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.159])
	by front1 (Coremail) with SMTP id qMiowJAxmM2qSbJqWbUjAA--.9386S4;
	Tue, 22 Sep 2026 17:26:05 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org
Cc: Huacai Chen <chenhuacai@kernel.org>,
	devicetree@vger.kernel.org,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH 2/3] dt-bindings: dma: loongson: Add Loongson-2K0300 DMA mux support
Date: Tue, 22 Sep 2026 17:25:43 +0800
Message-ID: <fdd9fa87058b75fda0dbb805de7989fcd279137c.1790068409.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1790068409.git.zhoubinbin@loongson.cn>
References: <cover.1790068409.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxmM2qSbJqWbUjAA--.9386S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgESCGqx8fgF-QAAsz
X-Coremail-Antispam: 1Uk129KBj93XoWxXw4UGFWUuw1kAw43Zw1kZwc_yoW5WF4kpF
	17CrsagrW0qFy3A395JFy8Cw1fZ3s2yF12qa9rtw1qkrZ8Jas0vw4akFn0va17CrWIgFW7
	ZF9a9rWUWF1kArcCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvab4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAq
	x4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r
	43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF
	7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxV
	W8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU
	cCD7UUUUU

The DMA mux on Loongson-2K0300 is not a standalone hardware block. It is
implemented as part of the chip configuration registers CHIP_CTRL13/14/15,
which route peripheral DMA requests to the physical channels of the CMC
DMA controller.

Document this as a DMA router. The #dma-cells = <3> specifier contains
the peripheral request ID, the target CMC DMA channel, and channel
configuration flags forwarded to the parent DMA controller.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 .../dma/loongson,ls2k0300-dmamux.yaml         | 49 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/loongson,ls2k0300-dmamux.yaml

diff --git a/Documentation/devicetree/bindings/dma/loongson,ls2k0300-dmamux.yaml b/Documentation/devicetree/bindings/dma/loongson,ls2k0300-dmamux.yaml
new file mode 100644
index 000000000000..12b8f8af51e9
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/loongson,ls2k0300-dmamux.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/loongson,ls2k0300-dmamux.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Loongson-2 APB DMA MUX (DMA request router)
+
+maintainers:
+  - Binbin Zhou <zhoubinbin@loongson.cn>
+
+allOf:
+  - $ref: /schemas/dma/dma-router.yaml#
+
+properties:
+  compatible:
+    const: loongson,ls2k0300-dmamux
+
+  reg:
+    maxItems: 1
+
+  '#dma-cells':
+    const: 3
+    description: |
+      Each cell represents the following:
+      1. The peripheral request id (see
+         include/dt-bindings/dma/loongson,ls2k-dmamux.h)
+      2. The physical CMC DMA channel (0-7) that is passed to the real
+         DMA controller
+      3. Bitfield representing DMA channel configuration that is passed
+         to the real DMA controller
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/dma/loongson,ls2k-dmamux.h>
+    dma-router@16000134 {
+        compatible = "loongson,ls2k0300-dmamux";
+        reg = <0x16000134 0xc>;
+        #dma-cells = <3>;
+        dma-masters = <&dma>;
+        dma-requests = <22>;
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index b021fb623446..dc976938c58c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15344,6 +15344,7 @@ M:	Binbin Zhou <zhoubinbin@loongson.cn>
 L:	dmaengine@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/dma/loongson,ls2k0300-dma.yaml
+F:	Documentation/devicetree/bindings/dma/loongson,ls2k0300-dmamux.yaml
 F:	Documentation/devicetree/bindings/dma/loongson,ls2x-apbdma.yaml
 F:	drivers/dma/loongson/loongson2-apb-cmc-dma.c
 F:	drivers/dma/loongson/loongson2-apb-dma.c
-- 
2.52.0

