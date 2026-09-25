Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E93379EE0;
	Fri, 25 Sep 2026 16:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790352250; cv=none; b=m/iACO8bJBzdpONf2uDdwgM/MDVgqBkyHPHRiBvZ17526JBQHYPudrxwY+s1oENGMajKO81Rm7au8sy3Rqj8F1aNZ3/5b25MO56qh/2yTvPQIvsultJf86IJp1fOubbiKzlDCeqla3scC03A6ZnsWAKlqGfm77JCp+VOh76/+6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790352250; c=relaxed/simple;
	bh=9Jto7j3sikA/nkJV1mt/HQlvGPt/8wbWVWEffKK84bE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S87xBqOK+Y7dl3CzbFuB2bmVBrMOJsYVCXaoHJ7b+177A0VSJYh7xUuY7csJ85JIP8XgM9MbcwEd8GTL4GCSGN/JVjdKgBI3bTQ4Gg492JU8nat/6IwJdYgQ/1zh/htZ40nrJS+aBa7Me2G1QrNdEjSKdcD6a6oFCKLaXW6WGlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f9JURWmh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f9JURWmh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63D331F00893;
	Fri, 25 Sep 2026 16:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790352247;
	bh=PdUhTJyqYs6LsUong4GBO+vl8JOnxjMn7PR7ZJyWKro=;
	h=From:To:Cc:Subject:Date;
	b=f9JURWmhW0PrLSGgu7gAvuvSfzdpxeyMvWAf2U+oOx0juEAtQaMkB2+9+mnh2xuq7
	 +nYlk3qRBh2wy4n0/4DDIJE0Tx1A+qK2jTMxX6JkFPTsc5a0rL7PP8ObgWg5nBqUmw
	 fV0fIGeZKlK8RzKlDw9gOZuJUgIf+WQf/fXce2y+N8GAiO66jQhzp/K4JHSDzTxGED
	 QkhPDVGl86EdFpYo9sZ4FTDIlJud4eRdpBXFA6cio+Iogawoku+N/y4tuQ547lUzod
	 H1rBy/Ltf8tmnSn5WcOdfVE0PXgThsdQ8pLZBhBOrCBa+WZC1eKAhOxl9I0cd+qDa5
	 FKY9N2v6+y1Yw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wei Xu <xuwei5@hisilicon.com>
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: dma: Convert hisilicon,k3-dma-1.0 to DT schema
Date: Fri, 25 Sep 2026 11:03:52 -0500
Message-ID: <20260925160354.1722583-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the hisilicon,k3-dma-1.0 binding to DT schema format.

Add dma-channel-mask, dma-no-cci, dma-type and interrupt-names
properties which were not documented.

The "hisilicon,hisi-pcm-asp-dma-1.0" doesn't have clocks, so make it
optional.

Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/dma/hisilicon,k3-dma-1.0.yaml    | 87 +++++++++++++++++++
 .../devicetree/bindings/dma/k3dma.txt         | 47 ----------
 2 files changed, 87 insertions(+), 47 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/dma/hisilicon,k3-dma-1.0.yaml
 delete mode 100644 Documentation/devicetree/bindings/dma/k3dma.txt

diff --git a/Documentation/devicetree/bindings/dma/hisilicon,k3-dma-1.0.yaml b/Documentation/devicetree/bindings/dma/hisilicon,k3-dma-1.0.yaml
new file mode 100644
index 000000000000..7a7aab5f4c66
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/hisilicon,k3-dma-1.0.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/hisilicon,k3-dma-1.0.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Hisilicon K3 DMA controller
+
+maintainers:
+  - Wei Xu <xuwei5@hisilicon.com>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - hisilicon,k3-dma-1.0
+          - hisilicon,hisi-pcm-asp-dma-1.0
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  '#dma-cells':
+    const: 1
+
+  dma-channels:
+    description: Number of physical DMA channels supported.
+    maximum: 32
+
+  dma-requests:
+    description: Number of virtual DMA request lines supported.
+    maximum: 32
+
+  dma-channel-mask:
+    description: Bitmask of usable DMA channels.
+
+  dma-no-cci:
+    type: boolean
+    description: DMA is not coherent with the CCI.
+
+  dma-type:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: SoC-specific DMA type name.
+    enum:
+      - hi3660_dma
+      - hi6220_dma
+
+  interrupt-names:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - '#dma-cells'
+  - dma-channels
+  - dma-requests
+
+allOf:
+  - $ref: dma-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: hisilicon,k3-dma-1.0
+    then:
+      required:
+        - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    dma@fcd02000 {
+        compatible = "hisilicon,k3-dma-1.0";
+        reg = <0xfcd02000 0x1000>;
+        #dma-cells = <1>;
+        dma-channels = <16>;
+        dma-requests = <27>;
+        interrupts = <0 12 4>;
+        clocks = <&pclk>;
+    };
diff --git a/Documentation/devicetree/bindings/dma/k3dma.txt b/Documentation/devicetree/bindings/dma/k3dma.txt
deleted file mode 100644
index 10a2f15b08a3..000000000000
--- a/Documentation/devicetree/bindings/dma/k3dma.txt
+++ /dev/null
@@ -1,47 +0,0 @@
-* Hisilicon K3 DMA controller
-
-See dma.txt first
-
-Required properties:
-- compatible: Must be one of
--              "hisilicon,k3-dma-1.0"
--              "hisilicon,hisi-pcm-asp-dma-1.0"
-- reg: Should contain DMA registers location and length.
-- interrupts: Should contain one interrupt shared by all channel
-- #dma-cells: see dma.txt, should be 1, para number
-- dma-channels: physical channels supported
-- dma-requests: virtual channels supported, each virtual channel
-		have specific request line
-- clocks: clock required
-
-Example:
-
-Controller:
-		dma0: dma@fcd02000 {
-			compatible = "hisilicon,k3-dma-1.0";
-			reg = <0xfcd02000 0x1000>;
-			#dma-cells = <1>;
-			dma-channels = <16>;
-			dma-requests = <27>;
-			interrupts = <0 12 4>;
-			clocks = <&pclk>;
-		};
-
-Client:
-Use specific request line passing from dmax
-For example, i2c0 read channel request line is 18, while write channel use 19
-
-		i2c0: i2c@fcb08000 {
-			compatible = "snps,designware-i2c";
-			dmas =	<&dma0 18          /* read channel */
-				 &dma0 19>;        /* write channel */
-			dma-names = "rx", "tx";
-		};
-
-		i2c1: i2c@fcb09000 {
-			compatible = "snps,designware-i2c";
-			dmas =	<&dma0 20          /* read channel */
-				 &dma0 21>;        /* write channel */
-			dma-names = "rx", "tx";
-		};
-
-- 
2.53.0

