Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792989202;
	b=Fp2g7bKwEOsWKTDCZnnZ16MqSOHrWW4iPp04Odjc8XPT0tEMarsC/rRS9+KSKdgD7+o7
	 juDzlsodnApkjIXzx24mFX/JrAC9o1BTS4O41Lv7adHe+VomgwbFTYWj9ccmv4GjIsoAr
	 jurSd08XS1Sebk4wr/xW5nxLPdQTAMcKV0UnDsbHkw0mZJx8HanXMfYI40nes3hlbzdnd
	 m8pF5PHZolYrE4ENso3Wyb9RL+Exq3pm9EEs0PW5U6XaHjOT5yXRtZMSNeRxKd4vm7CrC
	 X8t63MyynnVGeO+dLzdQ6NHhzNeCG8i4N171gcak+TAJ4Q0I5si/o9YDMNNHl7rvrAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792989202;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=tNqsvXgqRWXzP/izZ2kYfFH0p1gIT5FKPDmcvcDX+iw=;
	b=YMJRFrBlq+gH0IMxtjMmPqUGT/8WCgevLr8/VWZdpwP6PK7PWH0f1ygQyI0DbqKuVBZI
	 REjpdhO18bMw2UqpYzfwUvIua7w9O6hOE8zMpj6+/+KLBxaWyIAigbpysy3zc1u5JYesz
	 0LdKR90mEvrXRjoR3BsW47BTPr67sGTWUUnIHsYFFSkuJ0X23UIrccehlnI/FRzrBfJCd
	 SMcjDqLtYjxegMmvy3ABHiFV6/+UB0daZtjsUL/taR04urraiToH88wfPofhikHiop01W
	 owvSKQ+zVi5eVJI0qhcYsb8DPVonWMdOrHwYKPaHHMMJRu5xz16tl9xISJ9/RQ5AaXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83D77606A31F;
	Mon, 26 Oct 2026 04:33:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83D77606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.17])
	by gateway (Coremail) with SMTP id _____8BxW_AP2N5q1l0ZAA--.8136S3;
	Mon, 26 Oct 2026 12:33:19 +0800 (CST)
Received: from kernelserver (unknown [223.64.69.17])
	by front1 (Coremail) with SMTP id qMiowJAx1cwI2N5q6jgwAA--.7070S3;
	Mon, 26 Oct 2026 12:33:16 +0800 (CST)
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
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/2] dt-bindings: dma: Document DMA mux support for Loongson-2K0300
Date: Mon, 26 Oct 2026 12:33:05 +0800
Message-ID: <c4ae9695aa266bf714a53b5f46218645fc64347a.1792986696.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1792986696.git.zhoubinbin@loongson.cn>
References: <cover.1792986696.git.zhoubinbin@loongson.cn>
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAx1cwI2N5q6jgwAA--.7070S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgEMCGrexPwvDAAAso
X-Coremail-Antispam: 1Uk129KBj93XoWxKry3uw15Jr1kGr43Cr17Jwc_yoW7tr43pa
	sIkFZakFy0yFyfCa95KFy8Kr15XrZayFy7Xay7XrnrC3yDJ34Yvr43Ka1YvFW7Gr4IvrW7
	XryvgrW2gasrZrcCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBqb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2
	xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_
	Wrv_ZF1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x
	0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
	bVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E74
	80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0
	I7IYx2IY67AKxVW5JVW7JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42
	xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF
	7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU0EfO5UUUUU==

The DMA mux on Loongson-2K0300 is not a standalone hardware block. It is
implemented as part of the chip configuration registers CHIP_CTRL13/14/15,
which route peripheral DMA requests to the physical channels of the CMC
DMA controller.

Document this as a DMA router. The #dma-cells = <3> specifier contains
the peripheral request ID, the target CMC DMA channel, and channel
configuration flags forwarded to the parent DMA controller.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 .../dma/loongson,ls2k0300-dmamux.yaml         | 72 +++++++++++++++++++
 MAINTAINERS                                   |  2 +
 .../dt-bindings/dma/loongson,ls2k-dmamux.h    | 53 ++++++++++++++
 3 files changed, 127 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/loongson,ls2k0300-dmamux.yaml
 create mode 100644 include/dt-bindings/dma/loongson,ls2k-dmamux.h

diff --git a/Documentation/devicetree/bindings/dma/loongson,ls2k0300-dmamux.yaml b/Documentation/devicetree/bindings/dma/loongson,ls2k0300-dmamux.yaml
new file mode 100644
index 000000000000..df607d9ff599
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/loongson,ls2k0300-dmamux.yaml
@@ -0,0 +1,72 @@
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
+      1. Peripheral request ID: This describes the corresponding bit field
+         for that peripheral in the configuration register; see (
+         include/dt-bindings/dma/loongson,ls2k-dmamux.h) for details.
+      2. Physical DMA channel (0-7): This not only represents the DMA
+         channel used by the peripheral but is also converted into a value for
+         the corresponding bit field in the configuration register, indicating
+         the legitimacy of that peripheral using that channel.
+         Specifically:
+         - I2S/SPI/UART/I2C: Require adjacent channels in pairs; valid
+            values are 0/1, 2/3, 4/5, 6/7;
+         - SM3/SM4/DES/AES: Single channel; valid values are limited to 0/1;
+         - CAN/ADC: Single channel; valid values range from 0 to 7.
+      3. DMA Channel Configuration: A 32-bit mask used to specify
+         device-specific DMA channel configurations.
+         - Bit 6: Peripheral Address Increment Mode
+            0x0: Disabled
+            0x1: Enabled
+         - Bit 7: Memory Address Increment Mode
+            0x0: Disabled
+            0x1: Enabled
+         - Bits 12-13: Priority
+            0x0: Low
+            0x1: Medium
+            0x2: High
+            0x3: Very High
+
+  dma-requests:
+    const: 22
+
+required:
+  - compatible
+  - reg
+  - dma-requests
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
index 42f5165019ee..78622b255f88 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15351,9 +15351,11 @@ M:	Binbin Zhou <zhoubinbin@loongson.cn>
 L:	dmaengine@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/dma/loongson,ls2k0300-dma.yaml
+F:	Documentation/devicetree/bindings/dma/loongson,ls2k0300-dmamux.yaml
 F:	Documentation/devicetree/bindings/dma/loongson,ls2x-apbdma.yaml
 F:	drivers/dma/loongson/loongson2-apb-cmc-dma.c
 F:	drivers/dma/loongson/loongson2-apb-dma.c
+F:	include/dt-bindings/dma/loongson,ls2k-dmamux.h
 
 LOONGSON LS2X I2C DRIVER
 M:	Binbin Zhou <zhoubinbin@loongson.cn>
diff --git a/include/dt-bindings/dma/loongson,ls2k-dmamux.h b/include/dt-bindings/dma/loongson,ls2k-dmamux.h
new file mode 100644
index 000000000000..1e2907ab069d
--- /dev/null
+++ b/include/dt-bindings/dma/loongson,ls2k-dmamux.h
@@ -0,0 +1,53 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Loongson-2 SoC DMA Mux dt-bindings
+ *
+ * DMA specifier format:
+ *   dmas = <&dma_mux <request> <channel> <flags>>;
+ *
+ * The <channel> cell selects a physical CMC DMA channel (0-7)
+ * For peripherals using channel pairs (UART, I2C, SPI2/3, I2S),
+ * the channel number selects the pair: 0/1 -> pair 0, 2/3 -> pair 1,
+ * 4/5 -> pair 2, 6/7 -> pair 3.
+ *
+ * Copyright (C) 2026 Loongson Technology Corporation Limited
+ */
+
+#ifndef _DT_BINDINGS_DMA_LOONGSON_LS2K_DMAMUX_H
+#define _DT_BINDINGS_DMA_LOONGSON_LS2K_DMAMUX_H
+
+/* UART controllers */
+#define LS2K0300_DMA_UART0		0
+#define LS2K0300_DMA_UART1		1
+#define LS2K0300_DMA_UART2		2
+#define LS2K0300_DMA_UART3		3
+#define LS2K0300_DMA_UART4		4
+#define LS2K0300_DMA_UART5		5
+#define LS2K0300_DMA_UART6		6
+#define LS2K0300_DMA_UART7		7
+#define LS2K0300_DMA_UART8		8
+#define LS2K0300_DMA_UART9		9
+
+/* I2C controllers */
+#define LS2K0300_DMA_I2C0		10
+#define LS2K0300_DMA_I2C1		11
+#define LS2K0300_DMA_I2C2		12
+#define LS2K0300_DMA_I2C3		13
+
+/* SPI controllers (IO mode) */
+#define LS2K0300_DMA_SPI2		14
+#define LS2K0300_DMA_SPI3		15
+
+/* I2S controller */
+#define LS2K0300_DMA_I2S		16
+
+/* ADC controller */
+#define LS2K0300_DMA_ADC		17
+
+/* CAN-FD controllers */
+#define LS2K0300_DMA_CAN0		18
+#define LS2K0300_DMA_CAN1		19
+#define LS2K0300_DMA_CAN2		20
+#define LS2K0300_DMA_CAN3		21
+
+#endif /* _DT_BINDINGS_DMA_LOONGSON_LS2K_DMAMUX_H */
-- 
2.52.0

