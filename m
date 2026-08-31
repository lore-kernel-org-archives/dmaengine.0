Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6677E3BB107
	for <dmaengine@vger.kernel.org>; Mon, 31 Aug 2026 23:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788218659; cv=none; b=Ut1Sbd18MLoQ2cj/Os+Uo8wLK2hpNa1dslxOhoMs+HECJNmWqYG8NV8ZHzac9xqqU4nwu6qLi9OSmJljCm4u1MjeHmdJOsFblpaINuHUL5cSq+HEmysUfXLyYilbZ1XlKNExXYVbb6Y09fmbfUBNC6raF8USMqMnUebI/N4SGIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788218659; c=relaxed/simple;
	bh=wdCGHEerWJ5cmqLQGOw8nf8LkCX3g+goumJdNXlbraM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n4fYWG7sNnnTFTBi/ALTMIXLLP597q4ma7Wh3IDi2c0B77zeaKYEFFkscspfFEojd3KHeNCoOhgyUd1fZk9WNlk2AiA5c7YfAJ5Rh06HFPs0WoS+afcGdj+9ZHCY630mmJOOYh0zxWz0CR6MF9R80LW6Q9M+pZNkPAf94gAGwpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YZ4QErD/; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YZ4QErD/"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cbedf082ba2so833235a12.1
        for <dmaengine@vger.kernel.org>; Mon, 31 Aug 2026 16:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788218658; x=1788823458; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J4jt4+G+FlNDDgolam7fVa9at5qKQS5ruNcIg62BbRI=;
        b=YZ4QErD/hEDz0RH8rzaOl7HKJUo4QDLiXELppnopyvKbXGD/pZ2DQPLd403vTZZpsy
         2S6sTI4Tm1BEviYgdDnCPOD6mkjaw+JN2VOVtb7CWlSkxc6tGz4Gmts7joKL28Ez4ock
         MCZx+b6sOW/MYQ/uQagfFMDAFRwKSatKDiq3QDjY07vmveTD2iAOihtvSXp/JUmoJpGi
         X4d7sNOhIWChpSLWx/7gwNx1/J+QOXwD1OnGlmIZnnMqbatOLZkqmdGzfXzBGITk5x2I
         zGWdrVg/Cecd6wM7TpV6P7HBoDhdmjGGyBeZ0QYdvzxJXc4IPyIJ7Lc7j0rrdWYMNWRb
         2QLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788218658; x=1788823458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J4jt4+G+FlNDDgolam7fVa9at5qKQS5ruNcIg62BbRI=;
        b=kSeJ5JHB5jwS0VqbvbNXsAm/kVnKNO7wXEukzFRpDh9jOTmjcbJStD7jZtvj0IVEl7
         R8lbNLoajDLNS6v1dbG8qKI45/bIpogvILYhPtGDs30m3Q2bPnx8LB86cTptvifoqbHp
         McPgeMCwfBfscLQbbEjFmcGH4kqILi7n4y6oLtENiFveSFt/v5h49NUbtHGrlq5esqw4
         +J9k/cY9CEWWaFd/yNkgxypZ2n7hMYIUH4z/FAokEx8gVD46QB19b7S1JE4TuAuXqRiJ
         86/Cb+YN6SM180qrNhtogVpDnzXM/LDw/speGON9xDOOAxsEIfhWFfKsh6WvBpErFuhh
         9urQ==
X-Gm-Message-State: AFuF++nNwSK5gcPW1uZfUk3CZ61uVuO3tsBNE2HkNsumk2r1rdX2XUo3
	IpdDKKqRp02w1fwmRgksDlPkiVOdWYtdWCKgEJ8dbIEJ2Nqe9OmchJaa
X-Gm-Gg: AYBFou2tAKDzfLhAVC1auW11sJRW8rabf9GZAaeKyYzM5Knz3cpWiPUCQVIIaXm4z5M
	iDXQ+LHTOXbpQUVLST8A0ovV3Sc6aCBtK+JRyAGV2Gz3SE371ZPXwh93A0RKDt00t1BRsIu03Aj
	cHpEmFKuFDQgwOy7ZUvJ5Q8Og0MGIusjbd7N06ihjAFQd+uUpqa5YgaSnlEE3eWWFWt2D0qW+dz
	LrhafqcQY62Gi6xKfslhIhei9uYcXzfs0y/4XmLIC0ZY49ruRi5xmwpUe6kw3hOLtSMEy5YWILX
	wc141dxsinTA4W+U1gsCa89RzniJ8cXd2jK4WDiYz9x+tcoXEmNsyV6lPPhSu38LVeQ78DXFS3C
	nYB3pihxI5HaBrxoqS5AzhhrVj/FC5u4bC78UZqHScpJBiOf24YUNDgcTaYzNwbascMEr8xSLzG
	GDF8oNWvsBp0YFVvXx+zrDU79qFwRbURIqo3OIqrZDxQsaoZj6SS8gMc97GSYKjKDOSKZwU8o=
X-Received: by 2002:a17:90b:4b87:b0:396:463e:2eeb with SMTP id 98e67ed59e1d1-398ba6dc4f0mr14936225a91.0.1788218657679;
        Mon, 31 Aug 2026 16:24:17 -0700 (PDT)
Received: from [10.60.78.252] ([2409:40c2:5002:4362:354a:8f21:7ceb:c8a6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d75fc49sm1963213a91.12.2026.08.31.16.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 16:24:17 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Tue, 01 Sep 2026 04:53:06 +0530
Subject: [PATCH v3 2/6] dt-bindings: phy: ti,am335x-usb-phy: Convert to DT
 schema
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-ti-am33-usb-v3-2-5e15c617d2e9@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788218595; l=2527;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=wdCGHEerWJ5cmqLQGOw8nf8LkCX3g+goumJdNXlbraM=;
 b=433rLdFjhp/cZxJu80LNeYmwzyv7NpPrsHPWkvaXA3CSzd0fsbH2lnjG9g42jIzAEqebm3YrE
 HYUCmFZ7fZSDHQTZuxLzJhe8aEP7UYjeWCPN8u73ffdOnObKiiu7q5d
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert the TI AM335x USB PHY text bindings to DT schema.
Add undocumented vcc-supply property to match existing DTS usage.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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

