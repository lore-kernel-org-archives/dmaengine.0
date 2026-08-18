Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B925938642A
	for <dmaengine@vger.kernel.org>; Tue, 18 Aug 2026 14:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787063398; cv=none; b=d1koGD0nR0UuYvZNz+uB7Ipg+pkKT1cv+tzrwMKliixppj3KQIxuiVoU5iPPU6tsZF2Qj3u7CzbkGtCdNaVlkvGjakd+JMf9/boU1JHSMxMbX36Cn2y5sTH2olv+AN13Y+Dqy9JsNQv8w6bMXs7PduAyRJ630tn2gGefJjnDqCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787063398; c=relaxed/simple;
	bh=x82f2rFO1TTjFpVekp+USEIM8EAiJutd+tABMnyaNHw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aPvG7lngRZ8ichSNcY6oO4Tq0MS7J+uQQeyp+WxSk3YSnq7HLzM055NispYxaO3IBBMMI0l+KykpNywjK6e1Ba2PMm0sb92dEGIDaHoxRG3M/znx/tqZc3kM+tbZvCdcNaGVQ5pcLFggOQDp62wmNyvCPLtNDDFlIEIY2gizi7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bI0ZQg1L; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bI0ZQg1L"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d027b7c8easo11392245ad.3
        for <dmaengine@vger.kernel.org>; Tue, 18 Aug 2026 07:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787063396; x=1787668196; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AbV7RIHYMEgMD35kCL1q43FBlvr9xDn3Pi9g2Kfmf8I=;
        b=bI0ZQg1LQ5SeEZaOlzPm9AzZ5T75sshhhzLFD6tShHglSZYq+rXdpfTG80JJ4/Pcum
         zmPq3ScbI0AjfMucicRPNrwFUS1P+nCSkr4E1uBAeJSUrdc3/CM7Y1Fe2sgVa8whZo2Q
         WzjqmGcCHDlozg0Xqx7wf/LjMA0yy9wi51y9ws4HMMFwBjzVem1pgawrsY/K7l8NoWoq
         rqjAcBWQODy9w3Z+VuPiHEFTaOBLe+eR3pwTGtyxOGYtY7hNGZiZvh3lRShu/liEbXn/
         i04y21Xxq6T/3Ba12Zj/m2xn7FGztkhl9jkUyXcNlFVZRlRCR8lPExB6JV0aBRG7MuCv
         J6eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787063396; x=1787668196;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AbV7RIHYMEgMD35kCL1q43FBlvr9xDn3Pi9g2Kfmf8I=;
        b=gEpGS5ZklBpIyy3oXXyruNDKJjy8hKZP+LR+81eaNCTpJnZREmUyWyDe9DqbYsWm9l
         g78bHxpvk0IMizGjMWLj3mbAPl1ym1WkfuqNqNLJYu58kExh7uYQCOmcbzgFlMxbShGB
         h1yjQCHSbE/URmBZliU8X0eDYSO3a/iCdY1uVRdZucMfbbTYccyaYOMaCFN3It2D7wsX
         5LMUZs34xHvLKwBWvlOALn6ovbGvcpIWPp4fwR4OXYpMqElvNu4mKXjpRMhfwecA9oc6
         kRAZQ5/24qpF4TzezlCkKJ+0jeH2+FgeE7olGRZdHGFvncr/JNLGItmOiPnR0BM7Z4Uo
         4+pg==
X-Gm-Message-State: AOJu0Ywr6GtO9JDHpLAT4dcBxMQKquIpix0Yfq2rXD3ibyLsxfI2Qthu
	rAsFqFa2lVPBG4V1YmHkw4HEe2E7XMiHPsWZx41Ada/V9S9uQmSs8IzB
X-Gm-Gg: AR+sD12/ACmjA4Iq8uR9hlfSUgLRvCH7h5Z8JYUJi4W/YBIWImtsEGuXkzJKVhlvQ6S
	Q9Z4jhTpMX790WDXtDx4TNeE/9xM43HQg1kvfNcxI2JQV2VkSSQFy4atmkNjNWOSAyjO7Tt9Fim
	6fl3PN8nsaHXGLMBE0ccwMx9T3hwopeHxd+aCPAmj+n/k7w6kNLlMvpugulvLF7OUZ7AWs/oc/4
	uu5NkON9o9uJYzhrcjOCWAB8AC/R3cowC3tSQoN5qlbu95+l7TPfsgiOk3HX9KmvFq8sJoUC1lt
	Hmg09uYtbunPbK67KtuKw4B3VZ0OcmuM0BuNyocCKYhq/P97lWC5xLFFk30pf8/KCI2P/UiOmHj
	+EQeSrP6uRCooAVQJphYHSivcWyF8/+xTsA2B+k6jsrRGYl7MfmnBEcjhr8W8pXBg/cW+uSnaLg
	3PqWYO9V2T3Bv1XXAC+iubQScMBrK2/RoXe2lZAZLnx26PNiEMjaXfWZD7swW4SjkKoRyoIxu8
X-Received: by 2002:a17:903:2451:b0:2c9:d298:6c0a with SMTP id d9443c01a7336-2d3b0d7af99mr259247595ad.2.1787063395970;
        Tue, 18 Aug 2026 07:29:55 -0700 (PDT)
Received: from [10.90.163.252] ([2409:40c2:501a:6e15:dc3f:c23f:e55e:d03d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327b43d488dsm9043527eec.29.2026.08.18.07.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 07:29:55 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Tue, 18 Aug 2026 19:58:44 +0530
Subject: [PATCH v2 2/7] dt-bindings: phy: ti,am335x-usb-phy: Convert to DT
 schema
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-ti-am33-usb-v2-2-66fd44d66824@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787063337; l=2477;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=x82f2rFO1TTjFpVekp+USEIM8EAiJutd+tABMnyaNHw=;
 b=sEuhDNSAfdBHS5mDJZE37ho8OYAT2uqjvOXGzw1LAuvfii4SuSCLU7ba2h4sAFx31yOczsJ2D
 G/PaEK37gq3Aq50W06wrpN9eRGRBiRUA1FB4xK1Gl2W6MS2H+4a/Ekj
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

