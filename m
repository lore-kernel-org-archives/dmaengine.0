Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44483E7BBF
	for <dmaengine@vger.kernel.org>; Mon, 31 Aug 2026 23:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788218702; cv=none; b=piSWHd1jCZ//ybv+Wv48hwhLF8Rki1vlNaNCzDm7BphduDYQ3MEynbvWiyRDiqInmGMMc1I9MBWtZRxyMWm34Knn9go8qEs3wbnQPEIVHRdYk742fi+rMjTPRcC8W67PjBuISpETAzrAc+5Pes6XcUlwkqG7v0bk5oc4YzcY99I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788218702; c=relaxed/simple;
	bh=WBrVAh2dl8UJKYGy/bCn2gBe1W2WzeDKN1Fq4A99l8c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TfPKqgRKi/BCMxN0FiRuolQ83DRmzV/gw3dOcDlZg5AB73L2poKXk5aS3lzYgQeLSg00FP4ARt+EMNkl7BtYPxEOTHejpBQGHOTgQvX/lIerRKNgi+pIbSs75s06ewIlZfoT5vUfjzEmaHFPROyBnebnmhyLSZkVmbjCoE49jZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PIOEVkSt; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PIOEVkSt"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-385b78b4f9bso795360a91.2
        for <dmaengine@vger.kernel.org>; Mon, 31 Aug 2026 16:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788218700; x=1788823500; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I2f1MFzQHcHK1Gr7vYedM+Hgn+oOUGoRn3RcTHV7nos=;
        b=PIOEVkStyOHty1skV9UY043stR/L9hqx/c/UDiyldT201xdJR5ZXpHY5WvLvW4uZw4
         jRcHtZ1vC2AB2Fr1h6nRKsNhZ2YAEncRPyfzAzTPG3w5aLS5voYu5/BE0cWaSVkDQ1Xe
         /2h/0MOGlLT5Gd1BWTGkOeU4uQOpW4VV13q/TlFNoJQnqQKv3V2xpBiSXF4gaWz1Zzll
         zZn28SKEp7s0KDyGQHgE9zHS9x3kmfgOlIAX+ZJen/StJjZc0eIrgvcjIMcUmZTl9SHX
         WTIkqSQ/jiXK3g0aDEcFao42WIo2ZgHffPBEYi98r5GFLhPWWHrGJs99iABDnFfYBOYN
         pgOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788218700; x=1788823500;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I2f1MFzQHcHK1Gr7vYedM+Hgn+oOUGoRn3RcTHV7nos=;
        b=nEq8g8WJtVxNPe8Fi7zTUH7Ayiv9ilXlv51B1PFxzXPGU7VHth4NH1MmZ2lutc0642
         4vwW2kbd3GjAbwDT8hKWbBuTWgermDDLdEFJNd28UpijlQoNZTFBEGvIcjMyQmfp406X
         nA4q7ZChlFSqRXt2Kj8CM452dwGP1Yv5otHuZsw3DOmKVycBmzJyMriqVbTFNTuQqApS
         Snk7VtSdWFJLS7RlyondLpSZEThmMKIEzCz2tVNF+qCb7xJBV+EHEbB3Jy/Ys7C2AlfZ
         A4zJrr6q/ioaFy07KpX8po5O+F3MicWB36bzntuemXOefS1WPX0fEn+wMxaB8m3D1Br2
         iOPA==
X-Gm-Message-State: AFuF++k6LK1ierwrQSwHsZNpJzdDVtnGJYs6X2HEwfH4CYSNW6amHM9T
	nM+uCv7YdzgWi/D40RCMhme0zhqtATEGeVSXgbjoPjLLDH9teLANo0Ei
X-Gm-Gg: AYBFou2zfymYSPWuRtV9xVcsx41fWQcKJDpixY8DR5/3dJGU0IQhHAjx5EdjF8Z/YXi
	IjOu1CMq84E/4KFF3bRcXTQ+cJeeDEWAeWebNZ8MuHlAOgGpSqFNZXgNp3u05Kiw2Lf5aUnoX8o
	pSYJFQ2Wg6D2G/0e+FzoasYAEp9ATg964rGI2JeHt2byWInUxbNxBTGzQ5Yk26y+fxcCbdzkkkl
	Q8Xi4W69QJy0wvqiQoNJ6mPNJEjSzaPEtkLhJjdTs3c0q0c3DcYtemRHKK1CmhblaJWxt6eiVb3
	BDsuws0ALYVJ/ElBRYJeVbXcq5UcDow7YYe0DVMZ++E2O3j4qplZ9rJrWnP1bB2B/4Nv0R73uN1
	WOBidQCe4U7FztJcZCSuLxOVM9XcDDI2qIFU6SOwIbPiDGZDWlqHhE/fpT0lIaUCL1vW6urdPwp
	TnNf7b8V9dqDO7VkobRfdb6hgGDQaFCmpTq1UT/TX8M6BPO4InZwD/gFDRzlkJKJoCI2M4a80=
X-Received: by 2002:a17:90a:d403:b0:38f:aa76:88b with SMTP id 98e67ed59e1d1-398babbb56fmr15866363a91.4.1788218699965;
        Mon, 31 Aug 2026 16:24:59 -0700 (PDT)
Received: from [10.60.78.252] ([2409:40c2:5002:4362:354a:8f21:7ceb:c8a6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d75fc49sm1963213a91.12.2026.08.31.16.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 16:24:58 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Tue, 01 Sep 2026 04:53:08 +0530
Subject: [PATCH v3 4/6] dt-bindings: usb: ti,am335x-usb-ctrl-module:
 Convert to DT schema
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-ti-am33-usb-v3-4-5e15c617d2e9@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788218595; l=2531;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=WBrVAh2dl8UJKYGy/bCn2gBe1W2WzeDKN1Fq4A99l8c=;
 b=PrUWAD8e1Wj6MZVJOd+5GcYQfmkOigONZ2BF6CqeZ9Pp250pErMagc4593CxI0anBHddpK9QH
 T1/skBp4CYHDpOn59vKaQxDkb6rTvMVOCMbZh1kfidhWsIs83gr1u2B
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert the TI AM335x USB Control Module text bindings to DT schema. No
functional changes.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../devicetree/bindings/usb/am33xx-usb.txt         |  9 -----
 .../bindings/usb/ti,am335x-usb-ctrl-module.yaml    | 38 ++++++++++++++++++++++
 2 files changed, 38 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/am33xx-usb.txt b/Documentation/devicetree/bindings/usb/am33xx-usb.txt
index 5973f88bcc65..94312ad8ec8c 100644
--- a/Documentation/devicetree/bindings/usb/am33xx-usb.txt
+++ b/Documentation/devicetree/bindings/usb/am33xx-usb.txt
@@ -8,15 +8,6 @@ The glue layer contains multiple child nodes. It is required to have
 at least a control module node, USB node and a PHY node. The second USB
 node and its PHY node are optional. The DMA node is also optional.
 
-Reset module
-~~~~~~~~~~~~
-- compatible: ti,am335x-usb-ctrl-module
-- reg: offset and length of the "USB control registers" in the "Control
-  Module" block. A second offset and length for the USB wake up control
-  in the same memory block.
-- reg-names: "phy_ctrl" for the "USB control registers" and "wakeup" for
-  the USB wake up control register.
-
 Example:
 ~~~~~~~~
 The following example contains all the nodes as used on am335x-evm:
diff --git a/Documentation/devicetree/bindings/usb/ti,am335x-usb-ctrl-module.yaml b/Documentation/devicetree/bindings/usb/ti,am335x-usb-ctrl-module.yaml
new file mode 100644
index 000000000000..f8ac0af745c6
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/ti,am335x-usb-ctrl-module.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/ti,am335x-usb-ctrl-module.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI AM335x USB Control Module
+
+maintainers:
+  - Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+
+properties:
+  compatible:
+    const: ti,am335x-usb-ctrl-module
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: phy_ctrl
+      - const: wakeup
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+additionalProperties: false
+
+examples:
+  - |
+    control@44e10000 {
+        compatible = "ti,am335x-usb-ctrl-module";
+        reg = <0x44e10620 0x10>,
+              <0x44e10648 0x4>;
+        reg-names = "phy_ctrl", "wakeup";
+    };

-- 
2.55.0

