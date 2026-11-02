Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610444;
	b=xNk2qq0lMHEB3REoX/BZUpLWLJ+iCVJmJfLTv+i1avr/qMMMR0X+HRuoE5BP3wwmRLmS
	 BpDNN8Q8IlljYXwb13aAENRnQXcz3tD9NFXCT/ybmkO2Tc/OHcSJjhpT3iBPhXT2dnFpY
	 Qy60h6xZJ2EtUZj11613rpoSHnGNdv0ohHYf+qeNyim75pa62hgHnqCUTSqhyxNjxD9dR
	 WuEhGb3GUlz24Aj20lq0JMENLU84Q3P5Dk8zosahCF07doX1qBtnb4IYMJIpjY0YkpYI+
	 u/dXdHRrOdr3ByrwI7yi5vPtl9zxFUwVKTNdMTJ2g4TG6pwCc5TwJZq77ej3U95RaKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610444;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KU09lcPWfaOUpjyqk/x7UZs5f9b0E6qGqba1GB7ws+M=;
	b=EGGCIOaS1Sw1R0OdcCm0Mr18zy7HQuVPT9m8ByletUkAWUWqReMyHkHxhb3Cboa229mB
	 7QeCGRHwVj5xLS9c0LjggzbbUfTWdftRq3Jcsno/bRPIruEX07/KwHdasQDQJVehYPWEz
	 JAqQkMTZ0K+fVfYoa35LYpxsVdQe1C3ka0wXqdsMNxBBoxav0IxwHWIzA+j4T6TDOi7A0
	 bWhgS+2hfyHrKMr0YNfrvmIzZXUHzOpJ3U3xg9Y9b6e/15Ry76ibTlC+5O+fq4auMzD2+
	 rdBPEMPk4v0p0b6GwuBaIj2quERPG7WstfWYtOgZk6qV3oD1ZEM6JJMB1dAQe3UZKLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="E/CI8LUI";
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8DC606A32F
	for <dmaengine@vger.kernel.org>; Mon,  2 Nov 2026 09:07:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D8DC606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E/CI8LUI
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso16899425e9.0
        for <dmaengine@vger.kernel.org>; Mon, 02 Nov 2026 01:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793610442; x=1794215242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KU09lcPWfaOUpjyqk/x7UZs5f9b0E6qGqba1GB7ws+M=;
        b=E/CI8LUIUW8KK1/wcr1NuiKzFtNhGHQXMR21TJ9vP64xjo/c90nqdMpa5L3iwj5TRv
         xUcVd93UPEajqGPBo/TwyLIAK1Wy/Xf9yMINUo0va6KKIKEKq/YXXfjOXeLzs+nXOSYC
         25Mz6jdDa6wBDBSkyjFHWzewZiNzLemxwAD1FNeJhFYftn1svhPW3EoOIRsfaA7pf5Ct
         jhQ7zlTdYf7rthtJP6B7nMTj1qSvOwSWlJg0bbd0M0IGUR0voVHZuhR2KnSSRXi2ycdX
         CZ4MuuXWIslv2FvSMw3HY+RCuA0ZJFDM1C046a6P1ztR0O3btlKmW5OqhfLKGwuKGhSd
         Jb6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610442; x=1794215242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KU09lcPWfaOUpjyqk/x7UZs5f9b0E6qGqba1GB7ws+M=;
        b=dR2zSUdHBBr8IJQMDpl7ZotIOd0xQ1un7kOr+H4sYwtlODeUKZohaNOCgE/yNwDNRD
         Q89tNuqXWcEc48qNK6J1ILminwWbZVegf3KDM0dLBbLEzpQctcZaL+eP1IXhi+9CIepP
         6g283J0hxgOYnQfbfcsgOdksVkpG3JBJwvxOEBJ1m8Y7AHbqMUltRk6Oe2DAxAb8vvtH
         wqmXYElqTwW9luXwxJF/AcprQRwHH9casVJr94YfEY4VZBEnMknsI+vkaaMmLlf/BxKp
         CeFGK1rgLbb+7Us3qp40D/mC2yCF9HRsJ1XuUQrFAzh+GJIuA0Jarn7ZY2ZXz50IaJrw
         vnSw==
X-Forwarded-Encrypted: i=1; AKwUvBxsWHnXnAoKZoeG30nhxVI/Nhj1BVDdpFh0l+XuhyhOPikFr/Fr1VNgcU89uAvcYc9Jub+o6gcFEiw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJflpf7YE29/WOQF4Hvh+QgaZEc0XJLqlkoZAWplnCrQkvwnImW
	9g6u0QiQtCI9Aq7HMWxHtODBZlWZCMmhm12IBYz1bvQjct48hmg94teq
X-Gm-Gg: AYBFou3qhJZCu08kvfUx40kafl+6DFVnr2zLERJY9KMeiQlXvFOLQ/Iv97opgjQSNhy
	2qxQfb/LpFKWxaMMDFP7pyRxQ1J8CNv7he7A7XAMUiTwKkkvlTxMoRqKOg/fX62Uyn7f1c4QASN
	tOwrdjdwQlc6UP+RzJhiVd3vsxve8zWI6EZCRzsBOhqIpCXuirimp2XT4BdSiM6ODx1TLlHvri9
	GseRWn6BQEOUb4rqllkjAiUUnZ2r36G1E4KLvY+h0MA68YWbEDNl0tQD89VeQzL13b4hn+EZaK+
	ut4mhAjQgNy+6lXh4lOyaATtFb9N5KavKbS+ASuHqHEtVbCc7a1h8H60EJwxDWnN5teuzfDwLNx
	Z0HoyA08+g6leBhP/OgH09Xot7fYh+FKsX6btAgA6tp4KreB6SWEtJkeuvCEnAREJXa0VFc/J24
	SeJT95yMRFTY3KM6AWre7prFBfHBrQG4LBAhOiZ502+xzEsbHkfUGfgb4JvdAxLLX4Ycj3NmXVg
	k+GKBtQl8UPbXNsY7I99r+6Sww3GPL5GqHGHxvPYqLwsjyzwY0IrelCgUXnJRx7wvsaarxeSzMg
	qLkRuVkkeOEiLtpRuE493+Y4fMjrwdVI0lxp6r1BD48jUnqQka1r44/NwXB3n75UASA3l/q17ZC
	zP4Zpi0XRODySBbVBam8SNjk7N5ut5WYBg9znqUA5XidFeUEeDyQC763GXSYobSjnTkfVQu3nA1
	PTRgfRsgfwJ2gRfheJYqw7FMKD1RkY6MP4MA==
X-Received: by 2002:a05:600c:1d28:b0:4a2:1612:637a with SMTP id 5b1f17b1804b1-4ac1793fb6bmr263102145e9.16.1793610441541;
        Mon, 02 Nov 2026 01:07:21 -0800 (PST)
Received: from cypher.home.roving-it.com ([2001:8b0:fb11:0:3889:86e0:d449:e2e1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm417879945e9.3.2026.11.02.01.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:07:20 -0800 (PST)
From: Peter Robinson <pbrobinson@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com
Cc: Peter Robinson <pbrobinson@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH 1/9] dt-bindings: dma: brcm,bcm2835-dma: Add BCM2711 and BCM2712
Date: Mon,  2 Nov 2026 09:06:51 +0000
Message-ID: <20261102090713.896324-2-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102090713.896324-1-pbrobinson@gmail.com>
References: <20261102090713.896324-1-pbrobinson@gmail.com>
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

Add compatibles for the BCM2711 40-bit DMA4 channels, which are
described by a separate node covering channels 11-14, and for the
BCM2712 DMA controllers. The register address of a node identifies its
first channel, allowing a controller to be split across nodes.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>

---
 .../bindings/dma/brcm,bcm2835-dma.yaml        | 31 +++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
index c9b9a5490826c..31d97a10a0ea9 100644
--- a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
@@ -9,18 +9,27 @@ title: BCM2835 DMA controller
 maintainers:
   - Nicolas Saenz Julienne <nsaenz@kernel.org>
 
-description:
+description: |
   The BCM2835 DMA controller has 16 channels in total. Only the lower
   13 channels have an associated IRQ. Some arbitrary channels are used by the
   VideoCore firmware (1,3,6,7 in the current firmware version). The channels
   0, 2 and 3 have special functionality and should not be used by the driver.
 
+  BCM2711 channels 11 to 14 are 40-bit capable DMA4 channels, described by a
+  separate brcm,bcm2711-dma node. BCM2712 has 40-bit addressing on all
+  channels, with channels 6 to 11 being DMA4 channels. A controller may be
+  split across several nodes, the register address identifies the first
+  channel of a node.
+
 allOf:
   - $ref: dma-controller.yaml#
 
 properties:
   compatible:
-    const: brcm,bcm2835-dma
+    enum:
+      - brcm,bcm2835-dma
+      - brcm,bcm2711-dma
+      - brcm,bcm2712-dma
 
   reg:
     maxItems: 1
@@ -99,4 +108,22 @@ examples:
         brcm,dma-channel-mask = <0x7f35>;
     };
 
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    dma-controller@7e007b00 {
+      compatible = "brcm,bcm2711-dma";
+      reg = <0x7e007b00 0x400>;
+      interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
+      interrupt-names = "dma11",
+                        "dma12",
+                        "dma13",
+                        "dma14";
+      #dma-cells = <1>;
+      brcm,dma-channel-mask = <0x7000>;
+    };
+
 ...
-- 
2.56.0

