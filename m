Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9500C2F60CC
	for <dmaengine@vger.kernel.org>; Tue, 25 Aug 2026 11:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787657140; cv=none; b=TmOKSXmrl45nHfICI2cUubvTz9pyUYsyyh/59x0Ools6QvVq0pKezeAHJtUJg4DdCB9uZ7zuz3aBUmk9sC7p3yXpCy6mzglI0cb4izgLjxYTnUbITrADLcz2+4kLfIzRGu2uF3bNWinNZWtmVCmMZK8R065jWnjiXv6j2ve3+2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787657140; c=relaxed/simple;
	bh=TCg90wejKzNepQmUlr7VlLil2Voh1QXd1sHwSdm29lQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=RWJKsbD/NUuezcsl49vAKM2kZP5C24OPaE9WjzxGGdaHtFHSPFfgGXeEToeuftQ89/iizj7zHvmw7qrGUocdYQ1hOTAMX0z1FBZ620SPa+orBp9Td+poc0XOnbXxkBWLOuYOvvXeG9bSBaTNrlWk0D3lXXQ0dGtoezZ2la0S3zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HNu8kn7X; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HNu8kn7X"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-385b78b4f9bso587216a91.2
        for <dmaengine@vger.kernel.org>; Tue, 25 Aug 2026 04:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787657138; x=1788261938; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Bq7uKHGNUXEgSWPFjEuffT294xcsizEScOhns0j5+Fw=;
        b=HNu8kn7XtvrXRzIsDtMkWsqIkmKtpaYd5JGo9DABJ13Ydoz6hMU+bPDVaAszJB3yst
         jj8eXEGc7hzBKfgyponspHSbpUDduq9ljG2/ft1Dor2xxCqnK8/sS7v2wSuggJe0KD8g
         Xe2890ySRUfnwA5HHHtqOWHSSLjReBofBbtJcrRua2Pz2B5RT8MfFtCM8Qd4CyK5QzHN
         1WQMvOzjsEAs9OvZnr0ub7Z7Z7tWlc9zLc8ZhY6Ef52RXoX4SSy4L2glFiFjksbGgr0Z
         Dah0EKYPob6puN4bnTsGjFMcpyLtECcybQoJZ+zHD5eOtJJOwrQH2v69HgxpXrHuKDVK
         5i6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787657138; x=1788261938;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Bq7uKHGNUXEgSWPFjEuffT294xcsizEScOhns0j5+Fw=;
        b=qjYAKsL+AWr2wVTcl5+in23wUV1QKXf2yHyBaJDng+NflsAMytthSC0WAmsCtR95VQ
         As2bS5NfQICclJkkUR9SBXCTMdHRzsmqmRtd7DO85EBfkqzoSJynRz6owV1zYhANahQj
         M3cGaWdKKXj7NKjeu7LJ/q0A+m+ps8v2fsaBLr6UNwgXWRxB2KUM6SBLBdtkkHaclZjT
         jfLKNPWlnxjJ2exvGX09Dm2LVcqKNWIA5AUTs6izSpei4UVxZJBHPzkYkdBgMf48XUMo
         smT5MZbJd3uCVpwyRA+AwGJB3L+18R5CsyWb2Vlh0i7EQZp4pBEazKKiLR8yNNIvwbZV
         lobw==
X-Gm-Message-State: AFuF++nxs+Rm+zIGNMC4qdpSXJqzmVfc5A/24nTcH9BjZd6YaLxrVESA
	IlfQVbT0zUww/DNON/s1UMIdCpQ7k98YKGlJUaisvAYMaES73+fVnfluzaThrQ==
X-Gm-Gg: AR+sD12hoCZ/uM3kSmVoP/uuHEzNjmogiTCeaK+V2Acz8nVS/oclA9lA+SXcveYAYyY
	6+j77MJX55Nagp2Pk/YQ/uHkU7u9FhNrABP43GgWjdrg5GTYWC0NMq3cX5RmicIJRFAJYRvwAYf
	edyWsXRP6NG76EBtwbTXdi2W0HK5zPaFCBC5YdRGMm6WdXKaiLCJkSNT2M7Aqz2O+7diI0iKPbh
	QCJKl+Z7s3rZDQNlWrZWShynpHb1YDVyu+BBY2fS0glGY1eABZzGiKPFPU7yBkSRaXRYy9YYyzK
	eWoFYYFSIYYN48dTgCA779i+gWPp7QJ9x73aiMrXUdn80k7p5lmFPeGP95VaZsYx4ZrwhH/euXn
	peZgL8+qcoBCAX9rC3gx6j9e5WaOyg9nMPKNBEYIfiZ7VPvGh1gsLt6+Nx5JTbptxn2aC0BYCa8
	6j9RN8RpvaXzB8oaFGgbHXmX8NJy74L5dddh1XJAYZz8NcMIVW8tap7yYQu4hi6ALNaotnv/EmM
	pEAyQ==
X-Received: by 2002:a17:903:3c30:b0:2ca:de3:15eb with SMTP id d9443c01a7336-2d64a9d1a92mr283520425ad.0.1787657137689;
        Tue, 25 Aug 2026 04:25:37 -0700 (PDT)
Received: from [10.40.19.4] ([123.252.204.197])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-328272232besm8780086eec.21.2026.08.25.04.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 04:25:37 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Tue, 25 Aug 2026 16:55:22 +0530
Subject: [PATCH v4] dt-bindings: dma: ti,dma-crossbar: Convert to DT schema
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-ti-dma-crossbar-v4-1-b0bc78cf071e@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XNTQ7CIBCG4asY1mIYoJS68h7GBeWnJbHFQEM0T
 e8u7arRGJfvJM83M0o2epvQ+TCjaLNPPowl+PGAdK/GzmJvSiNKqCA1kXjy2AwK6xhSalXEyko
 OoCvTSIqKekTr/HNbvN5K9z5NIb62BxnW6++tDBiwE7RuBKfSAbt0g/L3kw4DWrcy/eNp8VRpY
 oR1xjLx6dnOA/v2rPia8Yo0LQOhYe+XZXkD9clKuy4BAAA=
X-Change-ID: 20260708-ti-dma-crossbar-ae8411c5d982
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Peter Ujfalusi <peter.ujfalusi@gmail.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787657131; l=8133;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=TCg90wejKzNepQmUlr7VlLil2Voh1QXd1sHwSdm29lQ=;
 b=+J1Arlu+MyQuPX+il98P0x7yQ+FI4nK5WmLYINtKa3EgFvF+3jnM6E+i1LZmDJYENch3FJkcu
 +ZqFYJhkBBIBLmsn9I0G7P78w/fFHRec4uj/xLmdCpdAEQyM1wGX/Zd
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert Texas Instruments DMA Crossbar from text to DT schema.
Modify MAINTAINERS file to correctly point to new yaml file.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Changes in v4:
- Rebased to latest mainline.
- Link to v3: https://lore.kernel.org/r/20260713-ti-dma-crossbar-v3-1-734509b316c1@gmail.com

Changes in v3:
- Add else block to validate dma-cells property better
- Link to v2: https://lore.kernel.org/r/20260708-ti-dma-crossbar-v2-1-2ac0d6efde36@gmail.com

Changes in v2:
- Removed the unmatched `ti,omap4430-sdma` compatible string from the
  example block and trim down example
- Restored dropped documentation regarding client dma-cells
  configuration into the top-level description block.
- Updated the MAINTAINERS file to replace the old .txt reference with
  the new .yaml file path.
- Added constraints on its inner tuple dimensions of
  ti,reserved-dma-request-ranges
- Link to v1: https://lore.kernel.org/r/20260708-ti-dma-crossbar-v1-1-f62796428f13@gmail.com

To: Vignesh Raghavendra <vigneshr@ti.com>
To: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: dmaengine@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 .../bindings/dma/ti,dra7-dma-crossbar.yaml         | 94 ++++++++++++++++++++++
 .../devicetree/bindings/dma/ti-dma-crossbar.txt    | 68 ----------------
 MAINTAINERS                                        |  2 +-
 3 files changed, 95 insertions(+), 69 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/ti,dra7-dma-crossbar.yaml b/Documentation/devicetree/bindings/dma/ti,dra7-dma-crossbar.yaml
new file mode 100644
index 000000000000..873cedd1427d
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/ti,dra7-dma-crossbar.yaml
@@ -0,0 +1,94 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/ti,dra7-dma-crossbar.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments DMA Crossbar (DMA request router)
+
+maintainers:
+  - Vignesh Raghavendra <vigneshr@ti.com>
+  - Bhargav Joshi <j.bhargav.u@gmail.com>
+
+description:
+  When requesting channel via ti,dra7-dma-crossbar, the DMA client must request
+  the DMA event number as crossbar ID (input to the DMA crossbar). For
+  ti,am335x-edma-crossbar the meaning of parameters of dmas for clients dmas =
+  <&edma_xbar 12 0 1>; where <12> is the DMA request number, <0> is the TC the
+  event should be assigned and <1> is the mux selection for in the crossbar.
+  When mux 0 is used the DMA channel can be requested directly from edma node.
+
+properties:
+  compatible:
+    enum:
+      - ti,dra7-dma-crossbar
+      - ti,am335x-edma-crossbar
+
+  reg:
+    maxItems: 1
+
+  "#dma-cells":
+    minimum: 1
+    maximum: 3
+
+  dma-requests:
+    minimum: 1
+    maximum: 256
+
+  dma-masters:
+    maxItems: 1
+
+  ti,dma-safe-map:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Safe routing value for unused request lines
+
+  ti,reserved-dma-request-ranges:
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    description:
+      DMA request ranges which should not be used when mapping xbar input to
+      DMA request, they are either allocated to be used by for example the DSP
+      or they are used as memcpy channels in eDMA.
+    items:
+      items:
+        - description: starting DMA request line number
+        - description: number of consecutive lines to reserve
+
+required:
+  - compatible
+  - reg
+  - "#dma-cells"
+  - dma-requests
+  - dma-masters
+
+allOf:
+  - $ref: dma-router.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,am335x-edma-crossbar
+    then:
+      properties:
+        "#dma-cells":
+          const: 3
+
+    else:
+      properties:
+        "#dma-cells":
+          enum: [1, 2]
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    dma-router@4a002b78 {
+        compatible = "ti,dra7-dma-crossbar";
+        reg = <0x4a002b78 0xfc>;
+        #dma-cells = <1>;
+        dma-requests = <205>;
+        ti,dma-safe-map = <0>;
+        /* Protect the sDMA request ranges: 10-14 and 100-126 */
+        ti,reserved-dma-request-ranges = <10 5>, <100 27>;
+        dma-masters = <&sdma>;
+    };
diff --git a/Documentation/devicetree/bindings/dma/ti-dma-crossbar.txt b/Documentation/devicetree/bindings/dma/ti-dma-crossbar.txt
deleted file mode 100644
index 1f9831540c97..000000000000
--- a/Documentation/devicetree/bindings/dma/ti-dma-crossbar.txt
+++ /dev/null
@@ -1,68 +0,0 @@
-Texas Instruments DMA Crossbar (DMA request router)
-
-Required properties:
-- compatible:	"ti,dra7-dma-crossbar" for DRA7xx DMA crossbar
-		"ti,am335x-edma-crossbar" for AM335x and AM437x
-- reg:		Memory map for accessing module
-- #dma-cells:	Should be set to match with the DMA controller's dma-cells
-		for ti,dra7-dma-crossbar and <3> for ti,am335x-edma-crossbar.
-- dma-requests:	Number of DMA requests the crossbar can receive
-- dma-masters:	phandle pointing to the DMA controller
-
-The DMA controller node need to have the following poroperties:
-- dma-requests:	Number of DMA requests the controller can handle
-
-Optional properties:
-- ti,dma-safe-map: Safe routing value for unused request lines
-- ti,reserved-dma-request-ranges: DMA request ranges which should not be used
-		when mapping xbar input to DMA request, they are either
-		allocated to be used by for example the DSP or they are used as
-		memcpy channels in eDMA.
-
-Notes:
-When requesting channel via ti,dra7-dma-crossbar, the DMA client must request
-the DMA event number as crossbar ID (input to the DMA crossbar).
-
-For ti,am335x-edma-crossbar: the meaning of parameters of dmas for clients:
-dmas = <&edma_xbar 12 0 1>; where <12> is the DMA request number, <0> is the TC
-the event should be assigned and <1> is the mux selection for in the crossbar.
-When mux 0 is used the DMA channel can be requested directly from edma node.
-
-Example:
-
-/* DMA controller */
-sdma: dma-controller@4a056000 {
-	compatible = "ti,omap4430-sdma";
-	reg = <0x4a056000 0x1000>;
-	interrupts =	<GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
-			<GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
-			<GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
-			<GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
-	#dma-cells = <1>;
-	dma-channels = <32>;
-	dma-requests = <127>;
-};
-
-/* DMA crossbar */
-sdma_xbar: dma-router@4a002b78 {
-	compatible = "ti,dra7-dma-crossbar";
-	reg = <0x4a002b78 0xfc>;
-	#dma-cells = <1>;
-	dma-requests = <205>;
-	ti,dma-safe-map = <0>;
-	/* Protect the sDMA request ranges: 10-14 and 100-126 */
-	ti,reserved-dma-request-ranges = <10 5>, <100 27>;
-	dma-masters = <&sdma>;
-};
-
-/* DMA client */
-uart1: serial@4806a000 {
-	compatible = "ti,omap4-uart";
-	reg = <0x4806a000 0x100>;
-	interrupts-extended = <&gic GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
-	ti,hwmods = "uart1";
-	clock-frequency = <48000000>;
-	/* Requesting crossbar input 49 and 50 */
-	dmas = <&sdma_xbar 49>, <&sdma_xbar 50>;
-	dma-names = "tx", "rx";
-};
diff --git a/MAINTAINERS b/MAINTAINERS
index 549df316f487..804d2c231be3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26922,7 +26922,7 @@ TEXAS INSTRUMENTS DMA DRIVERS
 M:	Vignesh Raghavendra <vigneshr@ti.com>
 L:	dmaengine@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/dma/ti-dma-crossbar.txt
+F:	Documentation/devicetree/bindings/dma/ti,dra7-dma-crossbar.yaml
 F:	Documentation/devicetree/bindings/dma/ti-edma.txt
 F:	Documentation/devicetree/bindings/dma/ti/
 F:	drivers/dma/ti/

---
base-commit: 66498c75b4f8017f62d720d9b59675bdf3abce91
change-id: 20260708-ti-dma-crossbar-ae8411c5d982

Best regards,
--  
Bhargav

