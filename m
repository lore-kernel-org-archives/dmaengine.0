Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CA55455638;
	Tue, 22 Sep 2026 09:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790069176; cv=none; b=DJEo4q4G08e4mCG4dCu6xI1uX0B32PKjtLTiOmz4DePmlwUgj8+INMvW4RmQSIS/HpUusfW4Knmx40xcTTo0E3iP+spG7lVdZJj3b2uOcjCVeBv/JT35fJP6jkOR+wM1UJEiVc0LBPqAzuTeCVQOflCYLUkIfY62KBLr89dvHHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790069176; c=relaxed/simple;
	bh=uULZzHMkgX6tBXoRBWNScrm40rG7QqbR8pAkJVN8A3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pqUcVRnMLFIUBzbf+X8pVoh7Y9vbreoUix4z7fNbnjd75NeW8WMCHSxiX/hxgYSkbv5cQl6kZnrPAe33my5UimYW6MyMdkNMx2+hODyWOKI2E13rezdCUqIgrppj3A4LulKHDbxYK/wR1lQP7Le+nXcP51ZylO5PFUh2wq0M50w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.159])
	by gateway (Coremail) with SMTP id _____8DxpvCsSbJqOZcOAA--.42879S3;
	Tue, 22 Sep 2026 17:26:05 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.159])
	by front1 (Coremail) with SMTP id qMiowJAxmM2qSbJqWbUjAA--.9386S3;
	Tue, 22 Sep 2026 17:26:04 +0800 (CST)
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
Subject: [PATCH 1/3] dt-bindings: dma: loongson: Add Loongson-2 DMA mux request IDs
Date: Tue, 22 Sep 2026 17:25:42 +0800
Message-ID: <d8762c697fee7c2184f26968109162d59aef1514.1790068409.git.zhoubinbin@loongson.cn>
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
X-CM-TRANSID:qMiowJAxmM2qSbJqWbUjAA--.9386S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQESCGqx4fQGxQAAsX
X-Coremail-Antispam: 1Uk129KBj93XoWxGw13WFWDuw18ZryUJrWrJFc_yoW5Cryrp3
	sIkFZakFy0yFWfC3yrKF1rKr13Xr15Ary7Jay7Zrs7Zan7Jw1Yqr17Ga1YvrWUWr4fZrWx
	XrykWw47WasrXrgCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvab4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2
	AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAq
	x4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r
	43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF
	7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxV
	WUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU
	2BT5DUUUU

Add DT binding constants for the Loongson-2 DMA mux.

The header defines the peripheral request IDs used in the DMA specifier
<request channel flags> for Loongson-2K0300, covering UART0-9, I2C0-3,
SPI2/3, I2S, ADC and CAN0-3. It also documents the channel-pair semantics
for peripherals that use paired DMA channels.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 MAINTAINERS                                   |  1 +
 .../dt-bindings/dma/loongson,ls2k-dmamux.h    | 56 +++++++++++++++++++
 2 files changed, 57 insertions(+)
 create mode 100644 include/dt-bindings/dma/loongson,ls2k-dmamux.h

diff --git a/MAINTAINERS b/MAINTAINERS
index c31b81eb42d7..b021fb623446 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15347,6 +15347,7 @@ F:	Documentation/devicetree/bindings/dma/loongson,ls2k0300-dma.yaml
 F:	Documentation/devicetree/bindings/dma/loongson,ls2x-apbdma.yaml
 F:	drivers/dma/loongson/loongson2-apb-cmc-dma.c
 F:	drivers/dma/loongson/loongson2-apb-dma.c
+F:	include/dt-bindings/dma/loongson,ls2k-dmamux.h
 
 LOONGSON LS2X I2C DRIVER
 M:	Binbin Zhou <zhoubinbin@loongson.cn>
diff --git a/include/dt-bindings/dma/loongson,ls2k-dmamux.h b/include/dt-bindings/dma/loongson,ls2k-dmamux.h
new file mode 100644
index 000000000000..dcc8df86befb
--- /dev/null
+++ b/include/dt-bindings/dma/loongson,ls2k-dmamux.h
@@ -0,0 +1,56 @@
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
+/* Total number of 2K0300 DMA requests */
+#define LS2K0300_DMA_REQ_MAX		22
+
+#endif /* _DT_BINDINGS_DMA_LOONGSON_LS2K_DMAMUX_H */
-- 
2.52.0

