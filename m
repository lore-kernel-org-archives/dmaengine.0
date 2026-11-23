Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445648;
	b=eIYwOZPyetniUSG54fX9OgaDHrH7QsGA+MLAs8bv35XXSMzIP2ZYSMcW3ei2IxP/4gJl
	 E3LW/0q2Y90nOng0ArHsmPch5NuiVktAAkXG/jJZQsvSl3DE8s5nUQn+tej7noFFaivVr
	 2+H/wVN9A13aWfydPH2saquwPQRS9+Qadrn0tC1zwGeQxk0l5CbNAubiGNBMO8PKOD1QT
	 Re6Gh8opHrISngbGatR+JdT7g1ibws2LctcXQIeImofKw77LLUemFPAd69rXGQimuMiNR
	 CcVGvBa1X02+9sNx9EKUkpwIRLR8a0Z9DtOf+DqOkNiDbiDzfgbay/jYrGprAR0sE5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445648;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1ORwnkX7J2hOX5n3O1ta3audEQJV0+CKETTB/1+Lf3w=;
	b=C4Ye73mlFh+5+wK/CskYGkqitJMXJ5E2UQVA3PUM3PxgavuPQJFlemFvw21Xagzco2nf
	 Wo5tJ1EArjDP/Cn8MSF0GwwRRGM71d7+NaO/uNqqf5sZVFxqXcW0uI5MO+593P5HLSHC+
	 Vqr3T/uvj4APQiTgi7qoVFV3LGGzqSy51IUtZ/Iw81EcBXy8DFNQ0w8MjLwTQj0bUPacp
	 FmuS6g6L/0WOyHxIQ/z6ZcISDuF/2LWPSX49l06IETApUWTbRhDjTYyhtpPXSArhawEc5
	 5g+fmGG/gWbmkMxgozd8CePE6VjzXNennNXKxDF1wvika4jgjwF6/iDEAxQ+gr6p2lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=AdpIuPTA;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A257606B099
	for <dmaengine@vger.kernel.org>; Mon, 23 Nov 2026 14:54:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A257606B099
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=AdpIuPTA
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4a357b1c649so2009534f8f.3
        for <dmaengine@vger.kernel.org>; Mon, 23 Nov 2026 06:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445645; x=1796050445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1ORwnkX7J2hOX5n3O1ta3audEQJV0+CKETTB/1+Lf3w=;
        b=AdpIuPTAFtxQYe9e3oALunPMgkqq0WHN1wt9+08FmpsjDYbHHpHxDFFVZwKeqUSpHD
         e/I+U4W9fQQHvYUN+JQNJB+TTjjDdKIhytaLLI1AWvxFsJEW/JBrKoXnrLKKT5LtvCcs
         y6VW0kEllA9NWqHJ8Zp0u0LYHEXKQnel2rSLe7Q0X7JIL9SwB9O4HWjIarn6OXpPXZwq
         DBlLLMXg/pkkHqdBzcwPpNgNojFnkhD3ZwRn0K2N+dLT+xWM0lm1b2ADoOq1dOeAiQ/d
         ayYymBoeLQlJmXNJak6YAbfv/y6eV+Bh8VT7+E/Y4wBMbRV2MX07VIXuNbOz98vmIgqu
         0a1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445645; x=1796050445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1ORwnkX7J2hOX5n3O1ta3audEQJV0+CKETTB/1+Lf3w=;
        b=KwIoYZOLZS0n/R6NubsjSF5REubIWsi5jCWhYWrs5AzfpO7UQrrbhZ0tPPXgKlJUkR
         Trma7/YHqicd4eZQbXvpunKvNOYXV1ivhimiXRDw+vQw1FWuPoCG0zr7yntIQ4H43sLa
         H0T9X58TIu6z/floakMjVpKf7rD+8tEvLVQJGksWIGbDxkeJtCcJdjHQ8Y0hvZyZYVlQ
         vNkoUNVehVaogTi7Enfx2WFZv6PjAl4IEQmNDkmh2S4IsIlFzvB2qrv+lzw4b2JnL/i/
         54hxxPm2jexa88JWi1JWgO/H5UCKRpSYDXwKh/PUYSEZ7cIwpEu66q99GFgRzOnxoUJb
         DKQg==
X-Forwarded-Encrypted: i=1; AL+hErEocUAdEbMrluaEzqi21rGic1twNuLcmUsp0/91UnWd15n/iMGC3/JLGySKlcqs+IoIi3t/zjuK+T4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jXNTnYZVYyHO4A0ecSsVcAw26oN8d46zpe4htAUliNUiCLiQO
	O96veCDPs36rwdjgrrs1rUOG9pCCaMSEoGAfZOlsdPzV/lM9YyiKK9gVl8vHPpvT7bE=
X-Gm-Gg: AZFdTZeqaBIc4oSgI0Dv6eW4dq2Bnb5B+k3pk5PSI3aiDZi69NV2kEMUq9BNGF+vxBq
	1wWmENDhpKgLYPsg1nkz7BhkuPNltYgS19OjzeRMNWqU01jFcLZFLKjEmijtMR0atpide1nPP9L
	nDyaEDcAtXxvREdt+n+kgWzzIoO5UTjsgeckMX5V1sDnE3cl7aeBcKTMG/xRAdSp98XTUMFso3X
	8ue+m3Pd+gmEMzwLffqK8jglIdzsA4A9JBmY9rGfKCXDFYndrC4vW0F5viw1pyclZKzK+reOLh9
	qK6FJu+uieQaD4hMAb3RQWaKGNO8amXoa7Kh7GYzW3SU0oYMYXCJnjQn3t8LU3T/DhwUdP/QA+r
	/GnyqI5svPs/VOmdAqHIn3XXG+CkDjmJjtovQhQVthvtbC8tTVVRktLgj5Uwfr6VCnkJrU/ldXO
	emjN0/2IIDqiCebFOGZiDqsjMGZKjNxxrPkeOyKkVc/ugewCGN9rQNzI6TY59SnWXQD4y3zd1Zd
	PMXWaPwsKPiePKldHXDw2X5mCiHLfyLzQq+C+2vBUDdwyrk5mbSMYP2cWv+cLgww6BCTAItlGze
	j5rEuCt62cVLFC/6JssMKxDJwEpsB88g+yXUcMAkT6W6/oM6
X-Received: by 2002:a5d:5d87:0:b0:499:9f62:d64c with SMTP id ffacd0b85a97d-4abaf64be07mr25689240f8f.10.1795445645615;
        Mon, 23 Nov 2026 06:54:05 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf685asm22057256f8f.20.2026.11.23.06.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:54:05 -0800 (PST)
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
Subject: [PATCH v3 24/28] dt-bindings: dma: brcm,bcm2835-dma: Add BCM2712 40-bit DMA
Date: Mon, 23 Nov 2026 15:57:02 +0100
Message-ID: <20261123145728.29082-25-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261123145728.29082-1-andrea.porta@suse.com>
References: <20261123145728.29082-1-andrea.porta@suse.com>
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
index b53652d5146b..0c74cc1d223e 100644
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

