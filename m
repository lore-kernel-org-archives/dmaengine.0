Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781957;
	b=ATgaWW+t9cjb2ulMo79qqrPF6wd3ERBypsSSAubdjnNdjr6lN0+AdVPP7EpydPX7iq7/
	 cPuFh04HK7foXChZ0FU29fy7HqGFSxgFlAKAvEyKRiDz8Ga9ZA4cQRSokUcPlI6Um4dYr
	 EtK21ehThTQYOS/NmNSD/QgqoPROMlO2N+yQ2USao3SBcynTqNyEGUhu+k6DPP4dbGmJl
	 5HSG618UIc1KKcijPDU9IMu6QH6rS3UUtXwfpGCa0W20TZ68VMFDtcyo8pWjWy4LvdjPE
	 949XLTw4FhJrl++rqWJXu1s9mBLaNNw1hMQ93HDxPHQtxXd5huYaL9OmSHy2linQOpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781957;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qmoiYjlPD+Xn2b6TFwZys1qhd0znVC5RxZEyMOw5DJU=;
	b=LI0M4TeMUnB18OzuXTKBApuzn8aSoE3YDfhi5XWfLYnrKfUFt+EZRiGw0wmIjtcPmkDw
	 px5LagflhdqnOF5EieJQ5e/HZl3/wv3NRlpuB9wwl0FzNxPsQt1i7ogH28vHlCJ2wlOEA
	 IDp7XBrs5hTLLtw9kPI63w/xn9qH+aU8tR4TuDRkUBVY4fjTgX5Y8aCb3rnXRDwlk+k7f
	 ARAXOtMHc6LhSlA0ckTo4Vs/QUm0/Qj0YHOWS3L2/d2C/s/WiLQW08DeRL5IDznIUm1xV
	 nt42out7IqkQqQvkFk6upiXdtnl3WqLvp8wbM0kGpayqasCkN/MEV4Em9MnED2Az6wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="Uab/npfa";
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A47606B82B
	for <dmaengine@vger.kernel.org>; Fri, 27 Nov 2026 12:19:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8A47606B82B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Uab/npfa
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so73366785e9.1
        for <dmaengine@vger.kernel.org>; Fri, 27 Nov 2026 04:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781955; x=1796386755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qmoiYjlPD+Xn2b6TFwZys1qhd0znVC5RxZEyMOw5DJU=;
        b=Uab/npfaAoMERFdLfsRHfMv3D5m93m5Z89zlLOvN9XGRJC00fHgYA4zUAlSvfXPj9V
         2vhJ8kj7KeIQLhpY33KuL2N4AB6FFUSx1Km4kTfwZiuSFoFLRGt62qXBDXECiYrycHSm
         7DsraX4S/HLVemJvM4Z04y6mHbSM2aP8N4qlaRardBRn5fP+16/wHW4elcrq0Yh9WIAe
         oFouu7oGno3RXlYVur2Vz9FRuGGuB6LpoC06IoEddumwCB0Rq01kajUL5LfGu4CPIUZG
         AwatjhOBNbc+nqTweOiBZnxMGyj8LbXEiSFGArP9DFiLZAKaclmrUl4LMHIobozmZop/
         c4aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781955; x=1796386755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qmoiYjlPD+Xn2b6TFwZys1qhd0znVC5RxZEyMOw5DJU=;
        b=i/1nrTwBiyLEX0Yyr076+zLK1fOvEOAt8E2CTRwnKNiRO4M5cwVWrxLI/q8iMfb16y
         SGDQDG3WWhZ4gmcYmtwOTPYFW2dZc5ThBzLd+mhmVzQ0Y9nwATCRX094t9zQicCtnhno
         Q38vrxVPG8G1BAYZ4VcabCtw00pAU7YVihZ48ke1V3qBZoebbT32UIkrln801czWr0TG
         Bqm0AqCN10XSpnwC5IIThxh7cxVNi6ff4AtMnjOP61SUElv+0ZPQlimPIe+0iSoQGSvs
         u/TkJvUAGeFDA/XMRRsAv7Yu7hMU1nemLegMH7LAiSCekKnNEvMDfIGm9WBKbUShq1Ko
         lISA==
X-Forwarded-Encrypted: i=1; AL+hErGOWTX2ouyZFb7ERTcJUp/OqMHE6iFp+ZcTeD7w0mKE0n/KQG2ZYGQWGNdW0vKHixdFKqXNTyRhoV4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FxVm7PXADK+Lx1v70m7HtVf8B0f1jPRNYUqIXvc9MeLXCgykv
	E64VaxiMJHeW6tIO3LT2S/vxGZB7JPCi9Y7cdL504kJblM+K41Yez5/uCsij7AoQpxU=
X-Gm-Gg: AZFdTZd79eW4+xdsz8xwePsUAUrXXBCDj2gD9Gkrpp0oj4vABRY6Qi2AJUZK8qR3Aar
	gZI0tvSQ1CHMX02Q+itUPgbHonsrCqis8Dm+/L6CBTfvzh0I0JDmSUzQy/iMDt7PeBiRgi8vy0g
	T9Zt3gbrfo4S+5PlSHVK9vR71+bjqiUipcYrzhrCDVSUmaYIgH9fVn+AFexnmMdquYBbqJiYkDi
	gtXPFyxap7GrIIUDis8g4qczMcip9SR6ioOpBni37K7NpmnJpTLkGiPAF5UbC1e2TldZj97kf/U
	Mva0+/ck/DEaATWguZhL4XiD7TzuwmHqTFAENyjTDD75i8tkJ4sASXpQXlNe1w6GGFQOpjGqtmx
	iHldJIJXeDZI46tIpic/7ixj86UInv9Y3cl1U3q/BUw+o8p9GMmGjjZz+sLB+sHBFNCU/bfoWLs
	m+lNQpiWa5XNh9tzHSSqxRNHGbQCyVkgV54DKR+aZnb5pPznMY37JjuFu+xPUWsIpyCU6IIfgjV
	n2ifX1ap/rXnEA4+7YpFt/SpBeYNi6Imt17a09oMS5oqsLhvmh14M5fbxQWf5E8ivsmBsEvrYue
	R37LD+LLqCOV6nUb0Td5/JMrwoWCErf4GBBrhN4ZJb18+sa9jw==
X-Received: by 2002:a05:600c:638e:b0:4bb:6c5e:b006 with SMTP id 5b1f17b1804b1-4bb887e265fmr462247745e9.3.1795781955134;
        Fri, 27 Nov 2026 04:19:15 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442693sm623847775e9.1.2026.11.27.04.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:19:14 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dom Cobley <popcornmix@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v4 24/28] dt-bindings: dma: brcm,bcm2835-dma: Add BCM2712 40-bit DMA
Date: Fri, 27 Nov 2026 13:22:14 +0100
Message-ID: <20261127122236.4976-25-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261127122236.4976-1-andrea.porta@suse.com>
References: <20261127122236.4976-1-andrea.porta@suse.com>
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

BCM2712 has six DMA channels (6 to 11) with the same 40-bit programming
model as the BCM2711 ones, each with a dedicated interrupt. Add a
compatible for them.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 .../bindings/dma/brcm,bcm2835-dma.yaml          | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
index d4a7001d6f97..e844fea55fb4 100644
--- a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
@@ -17,7 +17,8 @@ description: |
 
   On BCM2711 the channels 11 to 14 of the same DMA block have a different
   programming model, which allows them to address 40 bits, and are described
-  by a separate node.
+  by a separate node. BCM2712 has six channels with the same programming
+  model, numbered from 6 to 11.
 
   The channel numbers used in the channel mask and in the interrupt names
   always refer to the whole DMA block, also when a node only describes some
@@ -38,11 +39,25 @@ allOf:
           maxItems: 4
       required:
         - interrupt-names
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: brcm,bcm2712-dma
+    then:
+      properties:
+        interrupts:
+          maxItems: 6
+        interrupt-names:
+          maxItems: 6
+      required:
+        - interrupt-names
 
 properties:
   compatible:
     enum:
       - brcm,bcm2711-dma
+      - brcm,bcm2712-dma
       - brcm,bcm2835-dma
 
   reg:
-- 
2.51.0

