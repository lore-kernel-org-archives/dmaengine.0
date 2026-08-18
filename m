Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56D237DAAE
	for <dmaengine@vger.kernel.org>; Tue, 18 Aug 2026 14:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787063377; cv=none; b=a0R+ztCwzOdiw33VywGqfBKRnf3cQ4O9rcirOjYjeMHE9MsmG1lgFHVYR+yxJwCHMS2tuh3+g/XRUo3EIN84i0aFvU4GcqDhtiRW0O1Mv8k4RUgr/+/8NoGblCS/k2U0rOuLd6SlymPOVhuLMlQ+sUgDbWaQHGlWuOeG2wBWwJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787063377; c=relaxed/simple;
	bh=GN8OC0qmWePc65/nVwGP+m4XJ9TN93CBwZAGUXRbCQA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HQaKGxySZ2pzjVrJAzfxLgAqmrGz8EahrpM5e1cdQqoihkf+dy771MmvwJY0tCz8KgzgslgKH3rNNGFA/m/vvHkY6nVao/X2m30M4ZXKZ44OO0iaJuIgS0LvSSFN5mzoI5Dkrb5fyuDj3GdQedTVQb2rfr7H9m/SOvspVuxZPXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k5PqPSVL; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k5PqPSVL"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d03fcd26a6so7462965ad.2
        for <dmaengine@vger.kernel.org>; Tue, 18 Aug 2026 07:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787063375; x=1787668175; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mwa35nuSoG/2eGYsft3L6cCp2RsoUxnaTuzWFFhRxOA=;
        b=k5PqPSVLyyYH1xsLakWQzA4rWS4P8582oVCP/+2auRdnIjLAJxPiz5pffEM+sY+Mof
         l9cTf6RUPK5qHHfLPIofWG64HJo8IuNy6Ex5R1trMgBUi+mgG/eDe+0Yhcv1JqRz2JuT
         pGKbHvW7CP6RQwK76uHIzWI8IY2oQpYAZcBNaE38MGID+88+vaSx0nUq7YV0Xtx3g42X
         T7U3ARwcSdvzCXoI/solBUuubKhp3KXqLLp5fdZxoAoG0MmkzzssvlDQs+1ONTEiQWMQ
         43l8aaW4q4lQUKfiVJNXOP5w9CIDarxDyaMWdrj8PRVi69plaLHk1Pf2dizsam043u7x
         Ol/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787063375; x=1787668175;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mwa35nuSoG/2eGYsft3L6cCp2RsoUxnaTuzWFFhRxOA=;
        b=eptXa0Dj18LFe8V7IJ2DFK/0X6N33lTXBp3DpZnyBVilPJED/BDIGXpOP2Zwbcisx/
         SPf61LGLoohMe4BpxziBgv12Kq9tucVdu3MI2YEj4VUxTSr3tiUfO6YKmSoi1VpdV0rJ
         E7ifJE5WAML2NCj4zionK/UXm3SCyJeVmeSgGPEhmrJ6Wt88W47f3sZBNjRNgbcNkkJ3
         eutyy33gnx/B1PD96Spipk0RD/z7JqAGZoTw6zaN7+x1n3ZqoPGnikSF28f5DvUNJ9UF
         epBapW+EpBD5mr/yzHjBqKe4br9IIrPhxvc13Fc/9L1XfHU+m61OFz1XXVVXrd+ROVMV
         DVCw==
X-Gm-Message-State: AOJu0YzsJyd5exM1G/Off3ZtebdYXnIgkWZmdqH9W75P3uyFJTfCzAAo
	srIvDTFfQ1ko6F34t3l3s0S/UH9gh+WZgYojWHFA8dpoa7g+Bz0f+wTd
X-Gm-Gg: AR+sD12eCb7YgxvuXJY/3BJezQse/pT32sU6lF7dRW1h8877yKqwMRaAKbo4jZxkQeq
	98ZTNSM+EvDVcdpEj1XCcC+QR7JyOmToc7zp/MxrGkZBMLCfxASZ/sa9CVcq++AZBCUou8VIXwi
	54UIdAnyNGOVwUJxe/ZvdzGW/t4dV2U2Qr6FR45FpYu7mwO1j9zBdekxsj5CN6LmfgbNTS4C8z9
	/4UaFHCALnD2Jw9naIImyHx7CW8JbtzuyLtZo+7O7AeOkE7CwoTzRFtk9qihd9TK4eZtNshfQf8
	64QpijCv9MKaWt0twsRGLIwjDsY0Zwt+QNvdLhqIu1VN59VTtk5cIQhaK4UzgXgxCUdHzQIieGg
	wNzKth82gca1DVb+qhpzJyBWFEXNRUy1ZlYdDZTtMxuQugreByUVmmuSk3YyBKyu1uK3SVblHM6
	644W5tTlQZO/Y4v8d02ztSL3ucqjRhN/JTl126kd5coYr9VzNFtje7BW0Ucu7+TAfPJeL08ZUP
X-Received: by 2002:a17:903:4585:b0:2cf:9e90:8be with SMTP id d9443c01a7336-2d3b0cd96a6mr307749475ad.4.1787063374733;
        Tue, 18 Aug 2026 07:29:34 -0700 (PDT)
Received: from [10.90.163.252] ([2409:40c2:501a:6e15:dc3f:c23f:e55e:d03d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327b43d488dsm9043527eec.29.2026.08.18.07.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 07:29:34 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Tue, 18 Aug 2026 19:58:43 +0530
Subject: [PATCH v2 1/7] dt-bindings: dma: ti,cppi41: Convert to DT schema
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260818-ti-am33-usb-v2-1-66fd44d66824@gmail.com>
References: <20260818-ti-am33-usb-v2-0-66fd44d66824@gmail.com>
In-Reply-To: <20260818-ti-am33-usb-v2-0-66fd44d66824@gmail.com>
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
 Sergei Shtylyov <sshtylyov@ru.mvista.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-omap@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787063337; l=5446;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=GN8OC0qmWePc65/nVwGP+m4XJ9TN93CBwZAGUXRbCQA=;
 b=/ICcEratZ3o2rpqEdLfMo+aQDlLKJjcSt5vgcEdD+6hRQzXd+n584IbHXRbjb3nvO6Zd16Afc
 gyQClNz1JY3AIE+fwrKHNSLQmXV0KSnbXKrPyKXfsHd7uaHpIO+dQOx
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert TI CPPI 4.1 DMA controller text bindings to DT schema. Add
ti,am3359-cppi41 and ti,da830-cppi41 into single schema since they share
the same hardware IP block and driver. Add undocumented #dma-requests
and power-domains properties to match existing DTS usage.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../devicetree/bindings/dma/ti/ti,cppi41.yaml      | 109 +++++++++++++++++++++
 .../devicetree/bindings/usb/am33xx-usb.txt         |  14 ---
 .../devicetree/bindings/usb/da8xx-usb.txt          |  12 ---
 3 files changed, 109 insertions(+), 26 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/ti/ti,cppi41.yaml b/Documentation/devicetree/bindings/dma/ti/ti,cppi41.yaml
new file mode 100644
index 000000000000..a8c28e8ada07
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/ti/ti,cppi41.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/ti/ti,cppi41.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI CPPI41 DMA Controller
+
+maintainers:
+  - Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+
+properties:
+  compatible:
+    enum:
+      - ti,am3359-cppi41
+      - ti,da830-cppi41
+
+  reg:
+    minItems: 3
+    maxItems: 4
+
+  reg-names:
+    minItems: 3
+    maxItems: 4
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    const: glue
+
+  "#dma-cells":
+    const: 2
+
+  dma-channels:
+    description: Number of DMA channels supported.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  dma-requests:
+    description: Number of DMA requests supported.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  power-domains:
+    maxItems: 1
+
+  "#dma-channels":
+    description: Deprecated, use dma-channels instead.
+    deprecated: true
+
+  "#dma-requests":
+    description: Deprecated, use dma-requests instead.
+    deprecated: true
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - "#dma-cells"
+  - dma-channels
+
+allOf:
+  - $ref: /schemas/dma/dma-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,am3359-cppi41
+    then:
+      properties:
+        reg:
+          minItems: 4
+        reg-names:
+          items:
+            - const: glue
+            - const: controller
+            - const: scheduler
+            - const: queuemgr
+        power-domains: false
+      required:
+        - interrupt-names
+        - interrupts
+        - dma-requests
+    else:
+      properties:
+        reg:
+          maxItems: 3
+        reg-names:
+          items:
+            - const: controller
+            - const: scheduler
+            - const: queuemgr
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    dma-controller@7402000 {
+        compatible = "ti,am3359-cppi41";
+        reg = <0x47400000 0x1000>,
+              <0x47402000 0x1000>,
+              <0x47403000 0x1000>,
+              <0x47404000 0x4000>;
+        reg-names = "glue", "controller", "scheduler", "queuemgr";
+        interrupts = <17>;
+        interrupt-names = "glue";
+        #dma-cells = <2>;
+        dma-channels = <30>;
+        dma-requests = <256>;
+    };
diff --git a/Documentation/devicetree/bindings/usb/am33xx-usb.txt b/Documentation/devicetree/bindings/usb/am33xx-usb.txt
index 654ffc62d013..8431de346129 100644
--- a/Documentation/devicetree/bindings/usb/am33xx-usb.txt
+++ b/Documentation/devicetree/bindings/usb/am33xx-usb.txt
@@ -51,20 +51,6 @@ USB
 The controller should have an "usb" alias numbered properly in the alias
 node.
 
-DMA
-~~~
-- compatible: ti,am3359-cppi41
-- reg: offset and length of the following register spaces: USBSS, USB
-  CPPI DMA Controller, USB CPPI DMA Scheduler, USB Queue Manager
-- reg-names: glue, controller, scheduler, queuemgr
-- #dma-cells: should be set to 2. The first number represents the
-  endpoint number (0 … 14 for endpoints 1 … 15 on instance 0 and 15 … 29
-  for endpoints 1 … 15 on instance 1). The second number is 0 for RX and
-  1 for TX transfers.
-- dma-channels: should be set to 30 representing the 15 endpoints for
-  each USB instance.
-- #dma-channels: deprecated
-
 Example:
 ~~~~~~~~
 The following example contains all the nodes as used on am335x-evm:
diff --git a/Documentation/devicetree/bindings/usb/da8xx-usb.txt b/Documentation/devicetree/bindings/usb/da8xx-usb.txt
index fb2027a7d80d..00320d92d3bb 100644
--- a/Documentation/devicetree/bindings/usb/da8xx-usb.txt
+++ b/Documentation/devicetree/bindings/usb/da8xx-usb.txt
@@ -27,18 +27,6 @@ Optional properties:
 ~~~~~~~~~~~~~~~~~~~~
  - vbus-supply: Phandle to a regulator providing the USB bus power.
 
-DMA
-~~~
-- compatible: ti,da830-cppi41
-- reg: offset and length of the following register spaces: CPPI DMA Controller,
-  CPPI DMA Scheduler, Queue Manager
-- reg-names: "controller", "scheduler", "queuemgr"
-- #dma-cells: should be set to 2. The first number represents the
-  channel number (0 … 3 for endpoints 1 … 4).
-  The second number is 0 for RX and 1 for TX transfers.
-- dma-channels: should be set to 4 representing the 4 endpoints.
-- #dma-channels: deprecated
-
 Example:
 	usb_phy: usb-phy {
 		compatible = "ti,da830-usb-phy";

-- 
2.55.0

