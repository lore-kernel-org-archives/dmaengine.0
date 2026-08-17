Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E442F39B5
	for <dmaengine@vger.kernel.org>; Mon, 17 Aug 2026 21:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787003262; cv=none; b=gRyzUFGdhHTfjdXZk0x0PJ8NrlczE3ZFnkex3Uze89GLhjdXeDSYPG7QxTQHNHYgmvqsUH0SmqQ0uiMA1sYH7nTxh/66KCwnjCWA0/AWmGYE0nFuEq9KAtWfrsvSgBZwY9bl+NQ+KSaqv8P9Ut3AG2Qyw4oG1cKquGwwK91ZePo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787003262; c=relaxed/simple;
	bh=x82f2rFO1TTjFpVekp+USEIM8EAiJutd+tABMnyaNHw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JIz4YzyyTJo6U7tZlkLrBgu5D5IqEHzf8/90SpPBwPzmYOkKbIZS9RpB/LOwUYm7Ras3hafZ2HUwtnhoWwDkhKh4blKsfLRrDtzehjumEGLLUShxnnnzloWrRPb+AZIaEbxgp3R9i3dlrf7Fx2jvcee75yU8oqoC1r80+KxV7OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W8oNtf3H; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W8oNtf3H"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cffd93cdedso5662155ad.3
        for <dmaengine@vger.kernel.org>; Mon, 17 Aug 2026 14:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787003259; x=1787608059; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AbV7RIHYMEgMD35kCL1q43FBlvr9xDn3Pi9g2Kfmf8I=;
        b=W8oNtf3HxAr5/459feLBN3L0OjoxB0x9QD31SdmVurBjCbsuJXbT5GHWcpEv39xtKH
         woUSU35uCzlKrmWek+Y9xy6hmlYTD0PE+PnYHiCkZvQB5Us5UEbRJKQfr67v1BL4FrDQ
         KVI/K5SaZNY52KiZJPqpj8GE6fwvwpE1gOd06yanGpItDJNrWM4HLf+mJPy7Sn7EnJZO
         JbB4NraqEaHjRQ0HDY5E8vwoQqlTKCf+w89lJRu4najIY9rUouElbrLNTjt45+TvqEPR
         mXdMf0D7kUtqfwXL06XPhx6IsnNJYv4PeELefdPDf/TC5/ayDPdeRN+guyBPVLSRBPdU
         5o7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787003259; x=1787608059;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AbV7RIHYMEgMD35kCL1q43FBlvr9xDn3Pi9g2Kfmf8I=;
        b=AMmnXK4BUtugbihxx7rmPtjeGLuNU+551bYrvlSa+jjcrcwqIwWTMX1jDvXytcUPND
         1w/A4d61+62iCZJ9d6QW4S4FeDr51WaaFQkCuLf5eZlo4jXxUxKClMTqAb8BJ5MR6Ez7
         Dd9XfAbwQMXzLVSq3tQqXOL9bEIMAevqSlWorxgpJYmTuVL6MfXSuOqhmgIVdO3JHAJ5
         z8dHJSYWVES9fLzOmidJu+ybrHkjqIIAEXY/v7JXNzxurX9oCuonmLfQX45wRm70u6Bx
         lVbQUg/uu/osYuzl50nKQnw0dyFCNnv77yag3UshLXPJR1oNxPaW9aP/myLZBrgM7oo7
         Hceg==
X-Gm-Message-State: AOJu0YzPr6w+YOi68zLXY7KdwxZx+qhOi+M+kMwEcI6mpdGSsYN5QNng
	dpGkuQSvnLCAZnEKm7zwYtuM2nI0jEBvxVkQXWXEzljnf3c/Md76UCio
X-Gm-Gg: AR+sD10EqyCi729rfmXVlwRMN/wqmDx/+rfBGa65kYV7PtVUbbNdVNiUjhZiL1wZvBm
	kS6b09CSuX5UhixXU1+a8NbbD6ltOOv6/UeB2hGtKRkzu5LV3IsKC71CfGhSGAwiAxbqWPuh5Wc
	QBpFZrL8PQxee1ezsMk6lLf9FJB2LUvmuKd7UFKc/LA1RVSpPBVGzEsdsZWGooWy+yOdDWIgo4H
	IJxXIrFIl3Al4X9W/5vaV6u3cNWxeCu+QPSFOtsAj6/o3E0INzlTYJ/B86JrWflKLsVLr23zD5l
	J2JcFfIIzfSgQFOHEhypHjgxLHpTGuXbBvsScV/cI+ZCAwTulxOReauYhW9zBhJl18e8QfhBZSg
	HYcjKxahZpVGVb2pXbE8CjtqO8YoAKDH5OGiRynowUyWO4r/hfJa1FrmzWRKCnHXJxLnD+r6UjM
	ZQSAxkvq+vn4Y7MpfQiPNd+hIPKWmCS7uoV5a/xvInGXYYIm4m/QPI24gcW/EkirJR+w0L9sbBn
	A==
X-Received: by 2002:a17:903:2ce:b0:2c7:ef84:c58e with SMTP id d9443c01a7336-2d3b0827041mr219544715ad.1.1787003258858;
        Mon, 17 Aug 2026 14:47:38 -0700 (PDT)
Received: from [10.112.173.252] ([2409:40c2:5053:3384:1c8f:aa2d:e07e:6d3d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3267c388e3csm10153024eec.21.2026.08.17.14.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 14:47:38 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Tue, 18 Aug 2026 03:16:32 +0530
Subject: [PATCH 2/7] dt-bindings: phy: ti,am335x-usb-phy: Convert to DT
 schema
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-ti-am33-usb-v1-2-69ac5f92df45@gmail.com>
References: <20260818-ti-am33-usb-v1-0-69ac5f92df45@gmail.com>
In-Reply-To: <20260818-ti-am33-usb-v1-0-69ac5f92df45@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787003201; l=2477;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=x82f2rFO1TTjFpVekp+USEIM8EAiJutd+tABMnyaNHw=;
 b=xQkPjwuZse8OJWLFHr5jkhzUEk1s0slcPTBDT1bUKVvPkldm8oswiucbLVPFXWOV3PZZEUBPk
 OnGAKmqQ+gIBh2C+PSzghXuJkChgNxDAZePiB4N03yFOUP1Unchuq+e
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert the TI AM335x USB PHY text bindings to DT schema.
Add undocumented vcc-supply property to match existing DTS usage.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../devicetree/bindings/phy/ti,am335x-usb-phy.yaml | 49 ++++++++++++++++++++++
 .../devicetree/bindings/usb/am33xx-usb.txt         |  9 ----
 2 files changed, 49 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/ti,am335x-usb-phy.yaml b/Documentation/devicetree/bindings/phy/ti,am335x-usb-phy.yaml
new file mode 100644
index 000000000000..b28cd42ece5e
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/ti,am335x-usb-phy.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/ti,am335x-usb-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI AM335x USB PHY
+
+maintainers:
+  - Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+
+properties:
+  compatible:
+    const: ti,am335x-usb-phy
+
+  reg:
+    maxItems: 1
+
+  reg-names:
+    const: phy
+
+  ti,ctrl_mod:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Reference to the reset module node.
+
+  "#phy-cells":
+    const: 0
+
+  vcc-supply:
+    description: Phandle to the regulator that provides power to the PHY.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - ti,ctrl_mod
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    usb-phy@47401300 {
+        compatible = "ti,am335x-usb-phy";
+        reg = <0x47401300 0x100>;
+        reg-names = "phy";
+        ti,ctrl_mod = <&ctrl_mod>;
+        #phy-cells = <0>;
+    };
diff --git a/Documentation/devicetree/bindings/usb/am33xx-usb.txt b/Documentation/devicetree/bindings/usb/am33xx-usb.txt
index 8431de346129..8832843c7d7c 100644
--- a/Documentation/devicetree/bindings/usb/am33xx-usb.txt
+++ b/Documentation/devicetree/bindings/usb/am33xx-usb.txt
@@ -17,15 +17,6 @@ Reset module
 - reg-names: "phy_ctrl" for the "USB control registers" and "wakeup" for
   the USB wake up control register.
 
-USB PHY
-~~~~~~~
-compatible: ti,am335x-usb-phy
-reg: offset and length of the "USB PHY" register space
-ti,ctrl_mod: reference to the "reset module" node
-reg-names: phy
-The PHY should have a "phy" alias numbered properly in the alias
-node.
-
 USB
 ~~~
 - compatible: ti,musb-am33xx

-- 
2.55.0

