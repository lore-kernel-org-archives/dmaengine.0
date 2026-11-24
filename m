Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795520762;
	b=jdtUWKY0nCRG5Pv4SrEUIS7ai4200l0KBSJgVhduZQpHtbSlUnNOPlurfpoAM4d/TFKO
	 xl6pqyohxBNkMl3NNN3p4LVtF6AswG/t+0W+4ctSD3Kjo9Cj5t4hzCAfQ72Sd5rNMybfw
	 ysKXUgu4CdNZeBP+ehd1xYaXsABwqUnvb8Uk28MEpDRUoLY3UQ1NZ9Is1dBCkhaf7IRSE
	 bMnH69xYLO+EAbq4nRBBSAEONeeA+SQBpIWvokKqeng5kOzZZuf1R0okE7aX+RTRXISmr
	 8k6n+3NtT/FxHyrhe3ozbLjEiv5LJjLWBVrtZe5ni4QsmxonH3YgknCB/HJyuyY0AUw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795520762;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=olZSQhqxi5oFAbp6dAe+Uvx1GfO/ClNgDYNsbDwwxSI=;
	b=WystoYJ7i+lDnPzRwgZQLlXMKifMJD+jdtfKV15NaemfQxjWwJm/uQcQsDYoDoObrcxP
	 DQt7SxcTNODwNrc7njRLYwsAiusvstqOCMVo00JrABm5gn4ViXWLbXEoahfEJjuvAzC68
	 E4BpdCWIHnadxBt1BOemd7ZGb2gH2HG9aTlVeGAp9lpbKs+rBAxZ9GBJNxssTnm4SRrFe
	 C1x5vDuwOBBbuOPkCTCChkqG/9mvdLy1/4oYBGzmjaI+xUT1Y5lVur5Ak4/yzPgAqzQDp
	 dV7O58Hc2hKstzFXXKH2gABZtnVcZiA1fxvKJFXg+6Bf7xPuQSZ8tdSor0RuYNG+ALg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d7dIyhwk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D39360A2611;
	Tue, 24 Nov 2026 11:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d7dIyhwk
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795520762;
	b=O4iRO1IOftWZrbBiYyMTUWieCG2utW78QSJKWBwtATQINVsPBUI+w3W0ExrbYINtWhV2
	 V/by23n7aA2oXzY4P+2Poes07UHJxF56K6xn5g8ISPv02fcwbdie0NqL5RWhVe2BjlDYk
	 KmaXy5DB46lw04I7oNy97REvga3HmxgzcsOXGSml7kjqvIQsSeGH2HKpH1aHkX3KpCAi5
	 W7XosN59f1SMt/1uluffKKHFGCPoPYMejgq60sr1EEI1vsUippyWLN1+sKUFbYKkM35uX
	 3tLb4U4V2cl8zHBUcAKgLJUgPlUEZaUX/QVkmrDAcak3Pj/kMlsXSSPpll3RkGuXmoA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795520762;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=olZSQhqxi5oFAbp6dAe+Uvx1GfO/ClNgDYNsbDwwxSI=;
	b=pbxHUzfI3rlF0G/4HUOr7q9mQG5vE3hZ+WbdD/Pzl660HIJhrmIlOlef/dCTOD+fo9uP
	 LWM4mW4s5aafzyrqYrgIMcJ7oNiTghpNiamHMJ79/AbxmWZFDZKiskYJJFIL8xaPfMc3e
	 vm/TUXycUc3fJ3FwRQWH7oMBKd3oH5/oCMRMzn7p/FkSphLPhkcmsgWHp0DTWnf7v/chl
	 Ao53MAbmoz2PyyAQ6nFqU+FVk8z04b1BGfqJNMbUTugWVEqm2/fw+zo1NgRHYIaa1qPnB
	 XV+ExS9laVJPgz234eoKyyn9x4hrQ+js1AzlbLlUWoyIxoANkjVPLRuF1PW+2lCf9yg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A123F1F0156C;
	Tue, 24 Nov 2026 11:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795520762;
	bh=olZSQhqxi5oFAbp6dAe+Uvx1GfO/ClNgDYNsbDwwxSI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=d7dIyhwkXdif+FNKbcsQG3c86bbv29DDJfo5iyF9LYghAUovaRiqItV701USRUeW/
	 OJ2MbUXKOVebLNg+4W4/vnC1lzlti5/RLRVaUkBRWdOfyFYjfVgBvtfVYUQUGErnMa
	 GuLydd97uB9zF/MADEK86kNQ12r7CRqweuhgfm4YxQz6IPWRxfNKOJeXH4/fHEI3KS
	 bNh55N2BXeMVREb/9UdEeZob5zkj7c+EuWpxg4qRs824FhD/rsAJEt9gCBvVyjXaRz
	 T8YCwpG5gWepf5vXWr01626x5AokLDnKTL1EpH3aRJytkHzaC+8p6NPy/ALHEhwOFw
	 R8VrJriiUy2OA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 642684CA1F;
	Tue, 24 Nov 2026 11:45:28 +0000 (UTC)
From: Sai Sree Kartheek Adivi via B4 Relay <devnull+s-adivi.ti.com@kernel.org>
Date: Tue, 24 Nov 2026 17:15:16 +0530
Subject: [PATCH v13 14/20] dt-bindings: dma: ti: Add K3 BCDMA V2
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261124-dma-upstream-v13-v13-14-bd4251fdc6d4@ti.com>
References: <20261124-dma-upstream-v13-v13-0-bd4251fdc6d4@ti.com>
In-Reply-To: <20261124-dma-upstream-v13-v13-0-bd4251fdc6d4@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>, 
 Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 sebin.francis@ti.com, Sai Sree Kartheek Adivi <s-adivi@ti.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795520724; l=10154;
 i=s-adivi@ti.com; s=20261124; h=from:subject:message-id;
 bh=jVCUluK1cvGd7oocLuHoN95f+XBuGyRTXDLHcUnGO2k=;
 b=ZCdWDXMVzbACPsecPjM+mr7V53a2UqeySruHgNfERSjm/0eoCq6KvqEIBdbKDsSHcO3SIlFiP
 EwU1KA1abeJDmIARclyDL6wrjFVPBTjv3gdjZTPLXh58H3N1JlDFa40
X-Developer-Key: i=s-adivi@ti.com; a=ed25519;
 pk=EtOwVxmXDuYMgw3DqFtPDBpf8ZvbO89w1fJm4w5yPI8=
X-Endpoint-Received: by B4 Relay for s-adivi@ti.com/20261124 with
 auth_id=1627
X-Original-From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
Reply-To: s-adivi@ti.com
Content-Transfer-Encoding: 7bit

From: Sai Sree Kartheek Adivi <s-adivi@ti.com>

New binding document for Texas Instruments K3 Block Copy DMA (BCDMA) V2.

BCDMA V2 is introduced as part of AM62L.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 .../bindings/dma/ti/ti,am62l-dmss-bcdma.yaml       | 211 +++++++++++++++++++++
 1 file changed, 211 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-bcdma.yaml b/Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-bcdma.yaml
new file mode 100644
index 0000000000000..76184485ebcba
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-bcdma.yaml
@@ -0,0 +1,211 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2026 Texas Instruments Incorporated
+# Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/ti/ti,am62l-dmss-bcdma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments K3 DMSS BCDMA V2
+
+maintainers:
+  - Sai Sree Kartheek Adivi <s-adivi@ti.com>
+
+description:
+  The BCDMA V2 is intended to perform similar functions as the TR
+  mode channels of K3 UDMA-P.
+  BCDMA V2 includes block copy channels and Split channels.
+
+  Block copy channels mainly used for memory to memory transfers, but with
+  optional triggers a block copy channel can service peripherals by accessing
+  directly to memory mapped registers or area.
+
+  Split channels can be used to service PSI-L based peripherals.
+  The peripherals can be PSI-L native or legacy, non PSI-L native peripherals
+  with PDMAs. PDMA is tasked to act as a bridge between the PSI-L fabric and the
+  legacy peripheral.
+
+allOf:
+  - $ref: /schemas/dma/dma-controller.yaml#
+
+properties:
+  compatible:
+    const: ti,am62l-dmss-bcdma
+
+  reg:
+    items:
+      - description: BCDMA Control & Status Registers region
+      - description: Block Copy Channel Realtime Registers region
+      - description: Channel Realtime Registers region
+      - description: Ring Realtime Registers region
+
+  reg-names:
+    items:
+      - const: gcfg
+      - const: bchanrt
+      - const: chanrt
+      - const: ringrt
+
+  "#dma-cells":
+    const: 4
+    description: |
+      cell 1: Trigger type for the channel
+        0 - disable / no trigger
+        1 - internal channel event
+        2 - external signal
+        3 - timer manager event
+
+      cell 2: parameter for the trigger:
+        if cell 1 is 0 (disable / no trigger):
+          Unused, ignored
+        if cell 1 is 1 (internal channel event):
+          channel number whose TR event should trigger the current channel.
+        if cell 1 is 2 or 3 (external signal or timer manager event):
+          index of global interfaces that come into the DMA.
+
+          Please refer to the device documentation for global interface indexes.
+
+      cell 3: Channel ID for the peripheral
+        This is the mapped_channel_id assigned to the peripheral in the PSI-L
+        endpoint map. For XYMF peripherals (SPI, CRC32) each chip-select/FIFO
+        has a distinct channel ID; use the channel ID for the specific
+        direction and chip-select being requested. Use 0 for triggered
+        block-copy channels (cell 1 != 0).
+
+        Please refer to the device documentation for the channel map.
+
+      cell 4: ASEL value for the channel
+
+  interrupts:
+    maxItems: 75
+    description:
+      Interrupts for DMA channels.
+
+  interrupt-names:
+    minItems: 75
+    maxItems: 75
+    items:
+      pattern: "^chan([0-9]|1[0-3]|1[6-9]|2[0-9]|3[0-9]|4[0-7]|4[89]|5[0-3]|6[4-8]|8[01]|12[89]|13[0-9]|14[0-3])$"
+    description:
+      The name of the interrupt corresponding to the DMA channel.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - "#dma-cells"
+  - interrupts
+  - interrupt-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    dma-controller@485c4000 {
+        compatible = "ti,am62l-dmss-bcdma";
+        reg = <0x485c4000 0x4000>,
+              <0x48880000 0x10000>,
+              <0x48800000 0x80000>,
+              <0x47000000 0x200000>;
+        reg-names = "gcfg", "bchanrt", "chanrt", "ringrt";
+
+        #dma-cells = <4>;
+
+        interrupts = <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 361 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 365 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 372 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 376 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 377 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 384 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 385 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 386 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 387 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 388 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 389 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 482 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 482 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 548 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 548 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 516 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 517 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 518 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 519 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 520 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 521 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 522 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 523 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 524 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 525 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 526 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 527 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 528 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 529 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "chan0", "chan1", "chan2", "chan3", "chan4",
+                          "chan5", "chan6", "chan7", "chan8", "chan9",
+                          "chan10", "chan11", "chan12", "chan13",
+                          "chan16", "chan17", "chan18", "chan19",
+                          "chan20", "chan21", "chan22", "chan23",
+                          "chan24", "chan25", "chan26", "chan27",
+                          "chan28", "chan29", "chan30", "chan31",
+                          "chan32", "chan33", "chan34", "chan35",
+                          "chan36", "chan37", "chan38", "chan39",
+                          "chan40", "chan41", "chan42", "chan43",
+                          "chan44", "chan45", "chan46", "chan47",
+                          "chan48", "chan49", "chan50", "chan51",
+                          "chan52", "chan53", "chan64", "chan65",
+                          "chan66", "chan80", "chan81", "chan67",
+                          "chan68", "chan128", "chan129", "chan130",
+                          "chan131", "chan132", "chan133", "chan134",
+                          "chan135", "chan136", "chan137", "chan138",
+                          "chan139", "chan140", "chan141", "chan142",
+                          "chan143";
+    };

-- 
2.55.0


