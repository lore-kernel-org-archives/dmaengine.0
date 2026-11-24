Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795520764;
	b=kYV1ZkJTZN/edD6OrNniQDvxkKRyVj5ye/PvdflqsIStlQ7e+ZdnOxUFU81ODYbXrxuE
	 1BC2aUuxm5VgH4fJsrV7paW9hr4i/Gq3RPPrzB9Du7d8/OMthRY+ep2HdmnjSef9XeXUt
	 OLVmApHhTZo/19GUu3X9AzIF8abXaPreVaS4A7x9qTBloi4QHqH5iKBnlkVKlSRIEq0VE
	 dMzVH+eW6VPQrUGvA3W96btzb1ak6ldy8+krl2yTFWRh31oHjTQifdOlIYeXkNKHCCtvu
	 zUKVFolCXtr3J/+O67rlme92QGpGn0uRf9NA1Zycusdlq0nNvbEVtDZg2z+AwBHNPzw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795520764;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=/JHsj5XYVb93AB37wVwmsxk2ADTrBnbXPrV926MbgJ0=;
	b=CBHoOjYDZJIoFBD4dCUY46VsKqZ4PfqPrbHdpRVtu4BGCb2H8XfP21PCG+ZjmxoNahAb
	 AwdTfiC+VIHecguOUJ/AH50h5DVux5ep6Kit22bCItC+bhORpckUWJsEC1jNkw8kTpRyV
	 6V+KBsFqGUoELho40Tk9JTlgaFUlSElHa0kEoiwSYUWxCPjbESYozZJwOszcNqbMxlniL
	 TH1WRDjnFsGQ0Qjd8TzrPdwCyAHO2cwPDVxncShWql4f1/MUkwb1T1dWYN5NYNlI4Qv53
	 Y30rFQ59RjrPaA90HnNrDHwcMhgWIkZ5LUHN0qyL2yE8doJHCsCn0+kFwCC2L+98Pmg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AqXbJWLq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6556260A262B;
	Tue, 24 Nov 2026 11:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AqXbJWLq
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795520764;
	b=toaNHezfPPfxIlIrMNsRXZ1Hq28k8StVmuBnCiJnsepZuX9G5cV7cLYwsL8tFs4HLyXD
	 JKjCOfnCia9Emeqg6ZYXNpvyBh6Drs/tuPT0LFFwqeBe7YrQJSnHlhg2EgahYcedwnSc4
	 +KbH5d0tyEQc9lWJitkjCFh+KjF4unz4NbqufaI2wzL0TGguuVaNILdwg2mt4fOuIEmF1
	 GjVZt5/4fwZBs4p9HmR9Wvry5ZGmM7wFApNhYkL34f3zduUSUvdmnUa2HY8F0VNA3MdB/
	 RxogX35K1TCuBUTOUVgV00luYaYWrXcldFlsOy0VDpfrsKnv6C1clLLxQB8sMoK6zNA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795520764;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=/JHsj5XYVb93AB37wVwmsxk2ADTrBnbXPrV926MbgJ0=;
	b=jzbejrh1sCIZ4FfluTmsW+LUk3fq/JVwFWlciRGUoxS3/s0KtDr2CQP+JeRZ0Tw6iQ+1
	 +1gtQWpNHYDm6gdd+2gOqub3T+bNaUAtJJ3xQBQuyX3hPkj2kU19+/oohHJEdv0YuPP6i
	 yyvQEI3ML/tWYwqP+LAE7UjsWwx+rlzqQQRfUYNcKmAc3zrljawaqLr9oFFLh225EGRS9
	 Sj0efKbAkVf+0NEBl63NaibRgu4lOTs9zLgR9kS/fFrxsgqGrW8h8UiHxd/zqS4XE42Vg
	 /Gho9rV3i7puPK2uz9mOotXQ5YDq9PtsgeTcXFS2+eih1xHrf3bYf3wZmzc/TmQxVDQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 534011F00AD3;
	Tue, 24 Nov 2026 11:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795520764;
	bh=/JHsj5XYVb93AB37wVwmsxk2ADTrBnbXPrV926MbgJ0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=AqXbJWLqmnGZMpoT/jQoq9oDEesO694i7Ly0Z6llyONuNlg3rjCKPZST6LnrYscdl
	 SwzLGmDigsGqX1Vmp36JUf5NejAxU567YHXXGVhlIAzz0LyESaaDKBFZFHluCHbXde
	 +vN3Obq+XLNURPDJ3Y5bBTy7ZUXFCLvZt02USc5SiNKR4z5W9MXOY8OfzJH8qwHp1A
	 hFkA6Tep4R83G+WLOg0f8rWPd08irykbxLQOGa9aKyj9xGiU9prHWkr68IQL5IiF9z
	 N3OlWc4NnoxWZKGlrVDaRJMuZ5r9D+dEZNuUmPv0fqMMxoVre2HCR0ZCwn8+TPYboO
	 bXF7nf0Z4b32Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7FC194CA23;
	Tue, 24 Nov 2026 11:45:28 +0000 (UTC)
From: Sai Sree Kartheek Adivi via B4 Relay <devnull+s-adivi.ti.com@kernel.org>
Date: Tue, 24 Nov 2026 17:15:17 +0530
Subject: [PATCH v13 15/20] dt-bindings: dma: ti: Add K3 PKTDMA V2
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
Message-Id: <20261124-dma-upstream-v13-v13-15-bd4251fdc6d4@ti.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795520724; l=9145;
 i=s-adivi@ti.com; s=20261124; h=from:subject:message-id;
 bh=g+XPjcM/yGpqSIZFeMbqxUU830r1orA7/OBSg0r3owI=;
 b=P/0MufbImaygPVZfTI4/fvXQRLgwKj/xjwd4dKMCgr5ALBRrotZALo1w8DcIokxBnS88HwxN8
 ua0UwwtjhQbDY7iOt5ZmmoJfjKCbzfOJiwPRkD1Ml3HzY2heVYYBuPY
X-Developer-Key: i=s-adivi@ti.com; a=ed25519;
 pk=EtOwVxmXDuYMgw3DqFtPDBpf8ZvbO89w1fJm4w5yPI8=
X-Endpoint-Received: by B4 Relay for s-adivi@ti.com/20261124 with
 auth_id=1627
X-Original-From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
Reply-To: s-adivi@ti.com
Content-Transfer-Encoding: 7bit

From: Sai Sree Kartheek Adivi <s-adivi@ti.com>

New binding document for Texas Instruments K3 Packet DMA (PKTDMA) V2.

PKTDMA V2 is introduced as part of AM62L.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 .../bindings/dma/ti/ti,am62l-dmss-pktdma.yaml      | 189 +++++++++++++++++++++
 1 file changed, 189 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-pktdma.yaml b/Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-pktdma.yaml
new file mode 100644
index 0000000000000..caeacd4cf5ab3
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-pktdma.yaml
@@ -0,0 +1,189 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2026 Texas Instruments Incorporated
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/ti/ti,am62l-dmss-pktdma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments K3 DMSS PKTDMA V2
+
+maintainers:
+  - Sai Sree Kartheek Adivi <s-adivi@ti.com>
+
+description:
+  The PKTDMA V2 is intended to perform similar functions as the packet mode
+  channels of K3 UDMA-P. PKTDMA V2 only includes Split channels to service
+  PSI-L based peripherals.
+
+  The peripherals can be PSI-L native or legacy, non PSI-L native peripherals
+  with PDMAs. PDMA is tasked to act as a bridge between the PSI-L fabric and the
+  legacy peripheral.
+
+allOf:
+  - $ref: /schemas/dma/dma-controller.yaml#
+
+properties:
+  compatible:
+    const: ti,am62l-dmss-pktdma
+
+  reg:
+    items:
+      - description: Packet DMA Control & Status
+      - description: Channel Realtime
+      - description: Ring Realtime
+
+  reg-names:
+    items:
+      - const: gcfg
+      - const: chanrt
+      - const: ringrt
+
+  "#dma-cells":
+    const: 2
+    description: |
+      cell 1: Flow ID for the peripheral
+        This is the hardware flow index assigned to the peripheral. TX and RX
+        flow indices are mixed across the valid range. For XYMF peripherals
+        (SPI, CRC32) each chip-select/FIFO has a distinct flow ID; use the
+        flow ID for the specific direction and chip-select being requested.
+
+        Please refer to the device documentation for the flow map.
+
+      cell 2: ASEL value for the channel
+
+  interrupts:
+    maxItems: 78
+    description:
+      Interrupts for DMA channels.
+
+  interrupt-names:
+    minItems: 78
+    maxItems: 78
+    items:
+      pattern: "^(t|r)x-([0-9]|1[0-3]|1[6-9]|2[0-9]|3[0-9]|4[0-7]|6[4-9]|7[0-9]|9[6-9]|10[0-9]|11[01])$"
+    description:
+      The name of the interrupt corresponding to the DMA flow.
+      TX flows use the "tx-" prefix, RX flows use the "rx-" prefix.
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
+    dma-controller@485c0000 {
+        compatible = "ti,am62l-dmss-pktdma";
+        reg = <0x485c0000 0x4000>,
+              <0x48900000 0x80000>,
+              <0x47200000 0x100000>;
+        reg-names = "gcfg", "chanrt", "ringrt";
+
+        #dma-cells = <2>;
+
+        interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 362 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 366 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 367 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 378 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 500 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 501 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 502 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 503 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 504 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 505 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 509 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 510 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 511 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 512 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 513 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 514 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 515 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 484 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 485 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 486 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 487 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 488 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 489 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 490 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 491 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 492 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 493 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 494 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 495 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 496 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 497 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 498 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 499 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "rx-0", "tx-1", "rx-2", "tx-3", "rx-4",
+                          "tx-5", "rx-6", "tx-7", "rx-8", "tx-9",
+                          "rx-10", "tx-11", "rx-12", "tx-13",
+                          "rx-16", "tx-17", "rx-18", "tx-19",
+                          "rx-20", "tx-21", "rx-22", "tx-23",
+                          "rx-24", "tx-25", "rx-26", "tx-27",
+                          "rx-28", "tx-29", "rx-30", "tx-31",
+                          "rx-32", "tx-33", "rx-34", "tx-35",
+                          "rx-36", "tx-37", "rx-38", "tx-39",
+                          "rx-40", "tx-41", "rx-42", "tx-43",
+                          "rx-44", "tx-45", "rx-46", "tx-47",
+                          "tx-64", "tx-65", "tx-66", "tx-67",
+                          "tx-68", "tx-69", "tx-70", "tx-71",
+                          "tx-72", "tx-73", "tx-74", "tx-75",
+                          "tx-76", "tx-77", "tx-78", "tx-79",
+                          "rx-96", "rx-97", "rx-98", "rx-99",
+                          "rx-100", "rx-101", "rx-102", "rx-103",
+                          "rx-104", "rx-105", "rx-106", "rx-107",
+                          "rx-108", "rx-109", "rx-110", "rx-111";
+    };

-- 
2.55.0


