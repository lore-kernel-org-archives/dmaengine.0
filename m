Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6409139E6CD
	for <dmaengine@vger.kernel.org>; Tue, 18 Aug 2026 14:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787063442; cv=none; b=SQAHBRPFjQaQ4PicQZYK41z3rZ6uSZTYKXU2lBhlYU4+kJuBjzRvlC1EjnwN/1v/RP9DOie8ra4e3gwwggruHIR++QCtnprijtKIdSBGzalQdz+V5OBhgFRvheAY3VyKDPQhuULqvy2hoCZ/SXtsYtYMpwrNJHZILT0uAQE6K9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787063442; c=relaxed/simple;
	bh=RjKB54fZ+ycZa3KNSkC+6RK1Py5Hy0qRNAElwR43XCo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P47xM+mzLO5ffMwLXBoWLKtBRR6e0V+W8Jc2uq6+sqAwYE4oGXso0kpWzr483zPLoMb2aYHB0W7MTEJNJRMUlASeBWPsrF6TK9XQsVM/AzehTCqCB+bo22jztmAcb3SV5bYiqg6rsufKhy1ybFlctclydgA8+nY9sb71RMyKPrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RSDRrgr3; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RSDRrgr3"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cbe4592c193so268798a12.3
        for <dmaengine@vger.kernel.org>; Tue, 18 Aug 2026 07:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787063439; x=1787668239; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sTsQwO4vbh3rP+YLndWD6GA/YwGvOBXmACUttpnYLcY=;
        b=RSDRrgr3439lXQXSCDZPISBhQj6FVcdX5rlpKBAErvi1wvX/sJqcRGngbAQYTF7pFX
         r2qc4iZIn2021MEi1UiXmb4kWufIdTVKqHP91Ui892ewTyYqSAD8PWndsv6PXjLeXyRk
         LsrHsuWhTiTG/EFY42pzG8ABCL/4bCYBOTuwxspr+0NdsQ8w3J9IbiGoorX4uD3n/D3O
         HjiFAYu6TpPzYT/PJG5nTC+rELGyomxHIEJDGxuwMb7+gfTUCJdhP5D2mcIQZ76hxz9n
         ngWhNKxCQhNvFwWMFz+HgEAQMqAtSRbLDzKK4F7YydQjpTdWJdu4thupvlbozsj8P6TK
         PDhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787063439; x=1787668239;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sTsQwO4vbh3rP+YLndWD6GA/YwGvOBXmACUttpnYLcY=;
        b=BzL9MBPS4Nu2V7GSm7YX+oBh0jBCAEEQjavdKcDGrsujDdgYuyzirVTLtX1vyXBc/B
         sqCGymWMxg22IHalOpU6V9Vjg8XD114oS/q9rdUyOQvWm56wCBVR9xnuVySrM4f4algI
         moKE+6y3Zm+p4eSuNEfB4a0/R0jZNi20guw/QaY6yWWud90oTuCyoIZcKuVOX8dXPaNU
         dBlRo97N0p0petVe/Tz0mqs9Qz5mR1l6Uput1z1/F2cO2P+Ws6B+UbkNNQDZcQDSTcd7
         gHSThPPMGxqs/LBGxSDN4C5mTeMuSxRwf99DTUZM6GK7P5n09BBoAx97Y1WgQwWuygnO
         gnaw==
X-Gm-Message-State: AOJu0YzrMfFqjUlQmksXZluMPqYXRU3AlW3CK4Houy3kC/Lbs5YOixe6
	tHEEOtJj999fZZQCYF/XIYZLBa0UgTPJ3bde/pEvLkWGIeJ+HHKD0NJA
X-Gm-Gg: AR+sD13q+99864YFfg0tHr6/CmittZlp588/SrhYpjFq4yAaZQloXPK11OkhbH9aHkI
	S8Di2ON/pOzxYffTBbJrlMJhDWIDSp07i0rqgL7FVPUrgdjtSTlpPx33kT3XHoNYmSZCuD2JMMT
	ujPvhtQLmueOholQBiBeVdnKGCVVBi/4bU5uMTUrtznAjKQcv3qh07GTwB/62vTu4O1PMyEp2ky
	LQdmz8gzChM/Zjp73G3PEfnyEfU1ZqOM1uFT57GAnXej0dtw3cy+Bqotv5I3LyX5sehF6a6dBNI
	UyIPR9p/Nxo2izBKARA8DAhcjhNHvhet7WcTQIMpxI8S9PUBEBk+OMEFgqe4n8zOMsBO2gHRAdy
	pDTmVc7+NALRrQoapwDleGmBYDu8N+Hh1MTy7mZxzfV+fHvfxrZeZ5gZgt3/+BoaWkykW32tqiK
	a6x9hM8pc7mbgMfh690SXD4kvPhpkNl7rHUDElzsJ1BwVw+SKZoaHgwsqSmcVpu3nqtLNAb8oD
X-Received: by 2002:a17:903:2ce:b0:2c7:ef84:c58e with SMTP id d9443c01a7336-2d3b0827041mr272587835ad.1.1787063437133;
        Tue, 18 Aug 2026 07:30:37 -0700 (PDT)
Received: from [10.90.163.252] ([2409:40c2:501a:6e15:dc3f:c23f:e55e:d03d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327b43d488dsm9043527eec.29.2026.08.18.07.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 07:30:36 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Tue, 18 Aug 2026 19:58:46 +0530
Subject: [PATCH v2 4/7] dt-bindings: usb: ti,musb-am33xx: Convert to DT
 schema
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-ti-am33-usb-v2-4-66fd44d66824@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787063337; l=5174;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=RjKB54fZ+ycZa3KNSkC+6RK1Py5Hy0qRNAElwR43XCo=;
 b=xyff7burBnQ3TJ4gTsz8zLFzT2xvB6mMe4FZPf2B7MbG+j43SU7iw690LvBHMXGhE6aIvVMwM
 sOYdWZ5iyImDzIKs5OFddLrsXwU39r6CsBJIu3aXckV7pRwOL0zNEyT
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert the TI AM33xx MUSB text bindings to DT schema.
Changes during conversion:
- Allow an optional vbus interrupt used in am335x-bone-common.
- Add the interface-type and phy-names properties natively used by the
  dm816x hardware.
- Allow 0 or 1 for mentor,multipoint. While the text binding mandated 1,
  the Mentor USB IP natively supports both single and multipoint
  configurations as used in existing DTS.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../devicetree/bindings/usb/am33xx-usb.txt         |  25 -----
 .../devicetree/bindings/usb/ti,musb-am33xx.yaml    | 113 +++++++++++++++++++++
 2 files changed, 113 insertions(+), 25 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/am33xx-usb.txt b/Documentation/devicetree/bindings/usb/am33xx-usb.txt
index 8832843c7d7c..5973f88bcc65 100644
--- a/Documentation/devicetree/bindings/usb/am33xx-usb.txt
+++ b/Documentation/devicetree/bindings/usb/am33xx-usb.txt
@@ -17,31 +17,6 @@ Reset module
 - reg-names: "phy_ctrl" for the "USB control registers" and "wakeup" for
   the USB wake up control register.
 
-USB
-~~~
-- compatible: ti,musb-am33xx
-- reg: offset and length of "USB Controller Registers", and offset and
-  length of "USB Core" register space.
-- reg-names: control for the ""USB Controller Registers" and "mc" for
-  "USB Core" register space
-- interrupts: USB interrupt number
-- interrupt-names: mc
-- dr_mode: Should be one of "host", "peripheral" or "otg".
-- mentor,multipoint: Should be "1" indicating the musb controller supports
-  multipoint. This is a MUSB configuration-specific setting.
-- mentor,num-eps: Specifies the number of endpoints. This is also a
-  MUSB configuration-specific setting. Should be set to "16"
-- mentor,ram-bits: Specifies the ram address size. Should be set to "12"
-- mentor,power: Should be "500". This signifies the controller can supply up to
-  500mA when operating in host mode.
-- phys: reference to the USB phy
-- dmas: specifies the dma channels
-- dma-names: specifies the names of the channels. Use "rxN" for receive
-  and "txN" for transmit endpoints. N specifies the endpoint number.
-
-The controller should have an "usb" alias numbered properly in the alias
-node.
-
 Example:
 ~~~~~~~~
 The following example contains all the nodes as used on am335x-evm:
diff --git a/Documentation/devicetree/bindings/usb/ti,musb-am33xx.yaml b/Documentation/devicetree/bindings/usb/ti,musb-am33xx.yaml
new file mode 100644
index 000000000000..cc01edc75d11
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/ti,musb-am33xx.yaml
@@ -0,0 +1,113 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/ti,musb-am33xx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI AM33xx/DM816 MUSB
+
+maintainers:
+  - Ravi B <ravibabu@ti.com>
+  - Ajay Kumar Gupta <ajay.gupta@ti.com>
+
+allOf:
+  - $ref: /schemas/usb/usb-drd.yaml#
+
+properties:
+  compatible:
+    enum:
+      - ti,musb-am33xx
+      - ti,musb-dm816
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: mc
+      - const: control
+
+  interrupts:
+    minItems: 1
+    maxItems: 2
+
+  interrupt-names:
+    minItems: 1
+    items:
+      - const: mc
+      - const: vbus
+
+  mentor,multipoint:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Indicates the musb controller supports multipoint.
+    enum: [0, 1]
+
+  mentor,num-eps:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Specifies the number of endpoints.
+    const: 16
+
+  mentor,ram-bits:
+    description: Specifies the ram address size.
+    const: 12
+
+  mentor,power:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Controller supply capacity (in mA) when operating in host mode.
+    const: 500
+
+  phys:
+    maxItems: 1
+
+  dmas:
+    minItems: 1
+    maxItems: 30
+
+  dma-names:
+    minItems: 1
+    maxItems: 30
+    items:
+      pattern: "^(rx|tx)([1-9]|1[0-5])$"
+
+  phy-names:
+    const: usb2-phy
+
+  interface-type:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Describes the type of interface between the controller and the PHY.
+    enum: [ 0, 1 ]
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+  - dr_mode
+  - mentor,multipoint
+  - mentor,num-eps
+  - mentor,ram-bits
+  - mentor,power
+  - phys
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    usb@47401000 {
+        compatible = "ti,musb-am33xx";
+        reg = <0x47401400 0x400>,
+              <0x47401000 0x200>;
+        reg-names = "mc", "control";
+        interrupts = <18>;
+        interrupt-names = "mc";
+        dr_mode = "otg";
+        mentor,multipoint = <1>;
+        mentor,num-eps = <16>;
+        mentor,ram-bits = <12>;
+        mentor,power = <500>;
+        phys = <&usb0_phy>;
+        dmas = <&cppi41dma 0 0 &cppi41dma 1 0>;
+        dma-names = "rx1", "tx1";
+    };
+

-- 
2.55.0

