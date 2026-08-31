Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3090B3D6CCF
	for <dmaengine@vger.kernel.org>; Mon, 31 Aug 2026 23:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788218745; cv=none; b=d6hqbiQkqsXCjrYgMdmMN/LiR75PFCK0XVYmAw8621pACYQVOFonAExhtZkYXf2umSwENpfQWQQBxZc/dYB3NC5I9DEfmdx11J/HLuPTi24ghoC0jkH6mwrfxlyU2g6TrWQ6c99NSlx33+HITU40ikUBzcHu/42RAILfya7zZp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788218745; c=relaxed/simple;
	bh=uM708j09j6nSOP7IiMsV0ytTgwnrzIZATjME+J7mX5E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LQNtGvaWSZiDbWMlEwU9ybN3OyBZHiD+b589Nh4mPcqwa94Ah+TTeEq9eq0TQwJRR79w9nCZCMKuAxw5CHKsXsy9rkm8qs+Jz6fJ3ky0NkQM6mW3Wth9bx1agTloNsXxnuMaxBhH7Q4zAEKeBm9qpZCxhbuJm15LVXOJOMwv2y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YCzMOjMl; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YCzMOjMl"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-398fb0feb91so168383a91.0
        for <dmaengine@vger.kernel.org>; Mon, 31 Aug 2026 16:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788218742; x=1788823542; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l6om3FeFy+vwSp6+A3N9tIRqD8PcybsChQtR5r/26Do=;
        b=YCzMOjMlKIBbxKGQfyIXJL0wDV3XHrwSaJm9IsE9msTMi+1ComUtL3RMPHg8jblMsS
         i9SZFQqPSv2T47iC9xdTy4z9S2WnwK3pTOzzWIEUnAxMvxyeOYrxrQ/HsoQQj09MjX6T
         gFiJtMWERQ9/rdQ85YVJtJAyqW84k6QJkPl00Q1d7n1fBpnNRt/ggOd2ALxTQWTTz7jY
         sEYR686A341tVY3Qb0JPYj60mgn+RDvZH9EYYCyieqWyS6dW4J487WpmKHAWBpt4wEUc
         Oku5ADBYL1K6CREiqURAV+415iweRG3GJlQ4bX1sS6TDtQttbuEHYbKYuYc0QF6EFYrl
         ImjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788218742; x=1788823542;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l6om3FeFy+vwSp6+A3N9tIRqD8PcybsChQtR5r/26Do=;
        b=KLAoEI6NZha5X9CQpVZCrRDRHOEA7k/d1Ge3Ss4D/63RlAqEyfnkfdP3/gKJ7UeaVf
         UAgf7X6v688w1hiKZckP7X4NxBeLxM6Mr81jZuYWu6NFqeIFLzLvxkAJZcQLYi1wa1BQ
         T9+cukpqWGiCi5h1vZz4tcAH9wpnA5RORGauxK4/Xoch91XuyZv+VaAz7OPIgg9GlLkm
         B7dAcB1nlmjh/2GMmi07GOAE4lDHg6dxnpuhGfyDpv3T7WmxYy4t2aDbjiulkqTXG06s
         q9a3LQsAySQ0y55AQ5IfvB5tauur0UYy2qYPuje1vmbeZgPZlT4jv+ego9A7jmawWpCX
         cJhA==
X-Gm-Message-State: AFuF++mvyXGgOSCWpxVikopbW1Q2DCnEXbRfv2UlR4lMBhYUNhVT6cms
	iYR2a7/d8ovSUs44NtJwN+JiUHBiN7k4N2FHCqihkmYqkGA9OHNKQDwU
X-Gm-Gg: AYBFou2sP0AoS4ZvrmP60yNDZBr+/He0hupuWZPhmydSjCpkGinOC8i0TiZQaCk0tHb
	oHGUUZUh16cyRy+yrjUw7A4OJLpzz+mOR5bVwNYJcSFEMc7NyIOs2gzzoRPFqnF5qDRfBjpZeZG
	bjvEIgv5S1m9WUqOhnvOtwz9hyiJGx7q4oKlO6YHhYVlYN/gKHqScmn8vmAbSClToEooYYuVOka
	N9KNKIaGSnL+tXKYDTIqwYXiSWUkvBhMNnEi4dsf9wBNwlUG/eqdpoSIHeWQkcHnutEd9ptGCjl
	vp9LYoVPmjgtBgxNpS9giPSqVJEk7YAFcG2Qo4ZCH+AKO9/z/u+gOwDAvIpE7j8JrSBM75q7XiI
	HkmCH58syx4xa9EUbdiMWbbzq8ZtpNIBBjnLXwcmPZ+wVe3BZEXk5nrZrz7sJeAIn87jPBKf+c/
	3u+ICJMFFU/mbEKTrmN+uSMdOtnzQnErAvYD1VByYpD8xAJBAxeRd21ycU35k91crXpW+2Q0U=
X-Received: by 2002:a17:90a:e7cb:b0:398:bac0:238e with SMTP id 98e67ed59e1d1-398bac026b0mr15204624a91.6.1788218741556;
        Mon, 31 Aug 2026 16:25:41 -0700 (PDT)
Received: from [10.60.78.252] ([2409:40c2:5002:4362:354a:8f21:7ceb:c8a6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d75fc49sm1963213a91.12.2026.08.31.16.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 16:25:41 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Tue, 01 Sep 2026 04:53:10 +0530
Subject: [PATCH v3 6/6] dt-bindings: usb: ti,da830-musb: Convert to DT
 schema
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-ti-am33-usb-v3-6-5e15c617d2e9@gmail.com>
References: <20260901-ti-am33-usb-v3-0-5e15c617d2e9@gmail.com>
In-Reply-To: <20260901-ti-am33-usb-v3-0-5e15c617d2e9@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andrzej Siewior <bigeasy@linutronix.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Ravi B <ravibabu@ti.com>, Kumar Gupta <ajay.gupta@ti.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, Bin Liu <b-liu@ti.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-omap@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788218595; l=5263;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=uM708j09j6nSOP7IiMsV0ytTgwnrzIZATjME+J7mX5E=;
 b=3rKnxP+0ubnqPfB1KGJfmvBJbDtMtM57d7hApu3Tc/BQkJgnnS2cvdQ9c2FKRUcp3mct7jCXb
 bSBnPJPSyxvANvstRgX8Nl2s+b9M+nb2iECTqjA9qQdy6JJ//qSvH5L
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert the TI DA8xx/OMAP-L1x MUSB text bindings to DT schema. Since
DA8xx MUSB node acts as a parent bus for the CPPI41 DMA controller add
required #address-cells, #size-cells, and ranges properties.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../devicetree/bindings/usb/da8xx-usb.txt          |  69 -------------
 .../devicetree/bindings/usb/ti,da830-musb.yaml     | 113 +++++++++++++++++++++
 2 files changed, 113 insertions(+), 69 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/da8xx-usb.txt b/Documentation/devicetree/bindings/usb/da8xx-usb.txt
deleted file mode 100644
index 00320d92d3bb..000000000000
--- a/Documentation/devicetree/bindings/usb/da8xx-usb.txt
+++ /dev/null
@@ -1,69 +0,0 @@
-TI DA8xx MUSB
-~~~~~~~~~~~~~
-For DA8xx/OMAP-L1x/AM17xx/AM18xx platforms.
-
-Required properties:
-~~~~~~~~~~~~~~~~~~~~
- - compatible : Should be set to "ti,da830-musb".
-
- - reg: Offset and length of the USB controller register set.
-
- - interrupts: The USB interrupt number.
-
- - interrupt-names: Should be set to "mc".
-
- - dr_mode: The USB operation mode. Should be one of "host", "peripheral" or "otg".
-
- - phys: Phandle for the PHY device
-
- - phy-names: Should be "usb-phy"
-
- - dmas: specifies the dma channels
-
- - dma-names: specifies the names of the channels. Use "rxN" for receive
-   and "txN" for transmit endpoints. N specifies the endpoint number.
-
-Optional properties:
-~~~~~~~~~~~~~~~~~~~~
- - vbus-supply: Phandle to a regulator providing the USB bus power.
-
-Example:
-	usb_phy: usb-phy {
-		compatible = "ti,da830-usb-phy";
-		#phy-cells = <0>;
-	};
-	usb0: usb@200000 {
-		compatible = "ti,da830-musb";
-		reg = <0x00200000 0x1000>;
-		ranges;
-		#address-cells = <1>;
-		#size-cells = <1>;
-		interrupts = <58>;
-		interrupt-names = "mc";
-
-		dr_mode = "host";
-		vbus-supply = <&usb_vbus>;
-		phys = <&usb_phy 0>;
-		phy-names = "usb-phy";
-
-		dmas = <&cppi41dma 0 0 &cppi41dma 1 0
-			&cppi41dma 2 0 &cppi41dma 3 0
-			&cppi41dma 0 1 &cppi41dma 1 1
-			&cppi41dma 2 1 &cppi41dma 3 1>;
-		dma-names =
-			"rx1", "rx2", "rx3", "rx4",
-			"tx1", "tx2", "tx3", "tx4";
-
-
-		cppi41dma: dma-controller@201000 {
-			compatible = "ti,da830-cppi41";
-			reg =  <0x201000 0x1000
-				0x202000 0x1000
-				0x204000 0x4000>;
-			reg-names = "controller", "scheduler", "queuemgr";
-			interrupts = <58>;
-			#dma-cells = <2>;
-			dma-channels = <4>;
-		};
-
-	};
diff --git a/Documentation/devicetree/bindings/usb/ti,da830-musb.yaml b/Documentation/devicetree/bindings/usb/ti,da830-musb.yaml
new file mode 100644
index 000000000000..fefae735b34d
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/ti,da830-musb.yaml
@@ -0,0 +1,113 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/ti,da830-musb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI DA8xx MUSB
+
+maintainers:
+  - Bin Liu <b-liu@ti.com>
+
+allOf:
+  - $ref: /schemas/usb/usb-drd.yaml#
+
+properties:
+  compatible:
+    const: ti,da830-musb
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    const: mc
+
+  phys:
+    maxItems: 1
+
+  phy-names:
+    const: usb-phy
+
+  dmas:
+    minItems: 1
+    maxItems: 8
+
+  dma-names:
+    minItems: 1
+    maxItems: 8
+    items:
+      pattern: "^(rx|tx)[1-4]$"
+
+  vbus-supply:
+    description: Phandle to a regulator providing the USB bus power.
+
+  clocks:
+    maxItems: 1
+
+  clock-ranges: true
+
+  ranges: true
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+patternProperties:
+  "^dma-controller@[0-9a-f]+$":
+    $ref: /schemas/dma/ti/ti,cppi41.yaml#
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - phys
+  - phy-names
+  - ranges
+  - "#address-cells"
+  - "#size-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    usb@200000 {
+        compatible = "ti,da830-musb";
+        reg = <0x00200000 0x1000>;
+        ranges;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        interrupts = <58>;
+        interrupt-names = "mc";
+
+        dr_mode = "host";
+        vbus-supply = <&usb_vbus>;
+        phys = <&usb_phy 0>;
+        phy-names = "usb-phy";
+
+        clocks = <&psc1 1>;
+        clock-ranges;
+
+        dmas = <&cppi41dma 0 0>, <&cppi41dma 1 0>,
+               <&cppi41dma 2 0>, <&cppi41dma 3 0>,
+               <&cppi41dma 0 1>, <&cppi41dma 1 1>,
+               <&cppi41dma 2 1>, <&cppi41dma 3 1>;
+        dma-names = "rx1", "rx2", "rx3", "rx4",
+                    "tx1", "tx2", "tx3", "tx4";
+
+        dma-controller@201000 {
+            compatible = "ti,da830-cppi41";
+            reg = <0x201000 0x1000>,
+                  <0x202000 0x1000>,
+                  <0x204000 0x4000>;
+            reg-names = "controller", "scheduler", "queuemgr";
+            interrupts = <58>;
+            #dma-cells = <2>;
+            dma-channels = <4>;
+        };
+    };

-- 
2.55.0

