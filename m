Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794202151;
	b=al/k9HkIB8E8W4hwszpNLbb7DKwUnlUOXtSAHuq34vjMxs5t2AGk8w92Q4j2manjfqBs
	 5xsTfsC8s0gDSzlrp//Yj0SfW+d1cZkaM1stbbetJV35ovujLfunbaKmBjJ5LX3qGe5dA
	 rBOJYm0cybdpbrlMmr108JPSgen3C5xORKXU0bmBGqQLlv4CAhUH+5DqYa3mFY8+v7uhl
	 UomHvjJKhPd0Bskf/L5EPg6DcF37qpYhKW2dSN8NlO0GE+x/PBP/Cf0vzsjJlH98slfVM
	 4zV4+3hX/WLi62c/1J5PdyVUJwc2cMqP0J3AMx2tbCvzyUdKI/iLDlAeNJqGYxw8xVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794202151;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+2wCtwxXKIDkxHcE0WIbk0DNcnVd4qsfVLWBnePcPdM=;
	b=Rd88JlTpRf5byEUJalp4Flu13hp504KGAmqrXhTbt/prfvck72poIIrXy5hGByewpA9S
	 pSI0KkvhQf4j8SHQpBZ9L2kLRMfJdCClI6NJQsAJS1i5hQhcIjGyLIkkfJsJ9rA9GquTI
	 WZCVlupyDEEZGjA09OTCVSXqrcrW05vlRsRGcVAZ8lbnQBdYYMbvq2OUJdYtN4xk3nqzf
	 tSMRcgirgewIA8c6OV8xGd9JudpN9xWCVT1qPXwKXT3Hk3dnYycwKOJmbYMFZYkbgz4EX
	 whkJZR+zjIPLUvF6wDiNJaWn0XyE6LtsVRSXpT+b4Y624qzgieXqYGoal0AsQmLo8ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="LX/HvpaV";
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DE4606D80D
	for <dmaengine@vger.kernel.org>; Mon,  9 Nov 2026 05:29:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3DE4606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LX/HvpaV
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8a594d313a3so244505b3a.1
        for <dmaengine@vger.kernel.org>; Sun, 08 Nov 2026 21:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794202150; x=1794806950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+2wCtwxXKIDkxHcE0WIbk0DNcnVd4qsfVLWBnePcPdM=;
        b=LX/HvpaVQDBWsfT2+0kqohS3rHoUvbJMJyHIyGTYM75vhqzY44mOOPLBOQOMGmRZMc
         fdSEenpF6UfrQx6rMyoOVZ4GED/c28nfS4NqAjp3hbg2HovMPvtZjFz89gtZh148mf3q
         3LbDIHsqHCVgGuemSPtTR4l/uaQUQKEtq0wP7k9NeoNPGOGNlwoBDFEE7xuLGjbXZihb
         IOewJOuL/zQ4bPoCjl4ncxrMrrKtn+izP4xIzIMs7bhPHeTn3ke2Ilc7N+d8OB6zPb2v
         G/+1KoKBborVG/JHGQzrZDgAmhdxsS5R/i6Bv7+cuGec4aS6QcdutHHFAz/GUUpNrum/
         9mjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794202150; x=1794806950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+2wCtwxXKIDkxHcE0WIbk0DNcnVd4qsfVLWBnePcPdM=;
        b=XTDKK0pty2vWNu8lDX4eKGS/aeWnbVD1AvQTH4eOKUJZ773qWLGbJKStQIALhycIOp
         vAnHZO3DO8WX7k2xPVyjB9CUFdXMtYOuHjwYH+iRLJnteUnGn7nrHouZWzBAxhA4pDad
         vIhzUOSPl++4+SDihDf1QaoJdrv1oFb6vbI7DLyWsRbZ1rC5NGMOStO8oOGB+bPyKJQj
         Y1sNiQLHnovuYLOo+sn7+kqtj3y+TSMKh8Fumm7mpFrZTHjSCKo5HE3kDsPTuLTaKCVA
         uhAW9j87ETqT9IzGNhdT+1sNJZDWpG4jveZT8+sMYVy0h9CNKL6P0QKj+sH1cQz7Ncbv
         lKgA==
X-Forwarded-Encrypted: i=1; AL+hErGgI4pyVs5Grfv01KzHS1pUHaWvNyVSCmEatn9GHHtT1ZLrj0ugvw8J3pZTVGrlAhVF5dAfhwLE5bE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ec9b4GmRUYsYcJ+j8qmTCMvYPaVBkbUnATjrNFzhWbHShwd/+
	QIbwgXAVylvCFHmZqtty/zzRv4Jf9gZbYKSn+bxXyIUm+yhRpO50SWwZ
X-Gm-Gg: AYBFou2HHPzADNp3e7AVbiaXKqbCQOUpJbWIz2LvPlnZxtoTaJLuRFdAQVz59nZOAge
	0NLNeTrydrBDs0PSHh6n3tIaT5j0Kh8gK8ZBqy3yYTGa1Jk4HzWhj/ijjxDX+1j94aXdtOHFahN
	yg5WLmXTN6vg7x6zdw5pMyNnuYsqHiOtnSc55OC5cd8oVLpKy0NtcIFcoVatBsSYSth5iLMHEa4
	aNHkokReOOSspzpaVGIaVrYvUxjQpmQYCzd87ISXEE8jsMfL6/Za6oB9RtaEnjgqYzq1AwqCsgU
	2dtROcJP7iVVpx26IH5mngbp35/2O2EncN1j4nhgcbP1h1yYic1mqEs5B0bGzWe4X/mn66bsgO6
	zrbmEUWtCri9t6DHosVpcFHCnE/aJ6ZqE7efAuIls5FOo8L1t11MlMkpj08zyDaiv3X4019YRLx
	stUExUjM7PA9zdFRSnrkimA8fztYl9IRH1B/CHYevffjKOTwtMvqVY9vJyUK/gcGHvHtyEp+o6e
	614KgRJh6F7Qz2Ly9q4M+0pDRAIDNmFzv2L8wFQhjOYWU417mo2S19P69+pBMVTtbRDPWGngSUT
	9jNMraCAR9EM0HUR2CaAjT0EVT7wkOLsdgzdix1eCYnTtQ89hIUEaglLeIrs/xn4S9SDpNOs8rd
	kgKIkTM8NvEcQtH8=
X-Received: by 2002:a05:6a20:ef1a:b0:3e5:904c:78d3 with SMTP id adf61e73a8af0-3eed5ce2668mr2545295637.69.1794202149963;
        Sun, 08 Nov 2026 21:29:09 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb9681385fsm1180899a12.6.2026.11.08.21.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 21:29:09 -0800 (PST)
From: Shan-Chun Hung <shanchun1218@gmail.com>
To: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	vkoul@kernel.org,
	Frank.Li@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	kees@kernel.org,
	gustavoars@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Cc: Shan-Chun Hung <shanchun1218@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: dma: nuvoton,ma35d1-pdma: Document MA35D1 PDMA controller
Date: Mon,  9 Nov 2026 13:28:59 +0800
Message-Id: <20261109052900.2960473-2-shanchun1218@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261109052900.2960473-1-shanchun1218@gmail.com>
References: <20261109052900.2960473-1-shanchun1218@gmail.com>
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add binding for Nuvoton MA35D1 PDMA controller.

Signed-off-by: Shan-Chun Hung <shanchun1218@gmail.com>
---
 .../bindings/dma/nuvoton,ma35d1-pdma.yaml     | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml

diff --git a/Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml b/Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml
new file mode 100644
index 000000000000..d05971662a5d
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/nuvoton,ma35d1-pdma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 PDMA controller
+
+description:
+  The MA35D1 SoC has four Peripheral DMA (PDMA) controllers. Each controller
+  has 10 channels and performs memory-to-memory, memory-to-peripheral and
+  peripheral-to-memory transfers.
+
+maintainers:
+  - Shan-Chun Hung <shanchun1218@gmail.com>
+
+allOf:
+  - $ref: dma-controller.yaml#
+
+properties:
+  compatible:
+    const: nuvoton,ma35d1-pdma
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
+  resets:
+    maxItems: 1
+
+  "#dma-cells":
+    const: 2
+    description:
+      The first cell is the PDMA channel number. The second cell is the
+      peripheral request source number, as listed in the reference manual.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - "#dma-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        dma-controller@40080000 {
+            compatible = "nuvoton,ma35d1-pdma";
+            reg = <0x0 0x40080000 0x0 0x2000>;
+            interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&clk PDMA0_GATE>;
+            resets = <&sys MA35D1_RESET_PDMA0>;
+            #dma-cells = <2>;
+        };
+    };
+
+...
-- 
2.25.1

