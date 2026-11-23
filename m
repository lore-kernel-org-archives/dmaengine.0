Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445643;
	b=M+ALZLpTd9BUUPMnk3nPQQ609ZEq3T4xk9nx8IBye8YkYUI76cICohy4vnjgr5fTJKDt
	 teyEXDWPvG/n/jPVWXN0qmJDPcICR9USp9CVOfZXjLor1N0bDYMgMhCr5mv3WCUR+ij6n
	 ffiupGmuh6kr83IiZxJMtmykMVLi8faeOo5tl9qazXzRpVv6J/7Fmq4YLKgifVFubJ+wP
	 adv5fQ5rpRUrGGDFPlQu9ZUUdkss0acmGUh+ECYEeqFykpratWYabzNWJkKfA/f5fC8mr
	 qIJYUnMYC+sOfEw/rNOhuxciisva6iw14nuICM0N5KXSuDn9EVsmLZlPMTGAV5igILQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445643;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2ojavuWL7IswiT9p/75gc6DxtN1C14kg/yxfkQH6rLY=;
	b=yXKU0vqjLLqia3VXP2sOZXsy30EW5SHhmJ0av0ANit1A7ub0zpboduJ1tEwXPakd/Vno
	 WqJSuowq8xtPVtE4567TrWnsp1j6nvQEIXLlOSmVE108xc4THYfj95exdjIz2NFZaflLk
	 20oysojWNfctR+YPiT/tWsc7xCebIZcl3OQvLPSZsfEY7VnTm76fHurite3xOAzx0du9d
	 h/z0UlicfUU9OeYsuxa/qDrKX+QuH1YlE2vPBtZw54lNxyw29q/OADD8YYcwaLDdwU0r8
	 US4Y9os7s/Aeau7S0ttZVjpeAEdVIqqzutgoIkvJSJE+JUfnVxAvtqOT4iUYlrPbIOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=g77FX1do;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7B4606C1A8
	for <dmaengine@vger.kernel.org>; Mon, 23 Nov 2026 14:54:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E7B4606C1A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=g77FX1do
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4ac08f4a0b2so2437980f8f.3
        for <dmaengine@vger.kernel.org>; Mon, 23 Nov 2026 06:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445642; x=1796050442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2ojavuWL7IswiT9p/75gc6DxtN1C14kg/yxfkQH6rLY=;
        b=g77FX1dofGNAbQCzLkV0oWFpCzG9twT+vmYldF/KZ31YTTHjq8FiANr6UygbxVzgVC
         ob/k6JCn2z/t9CoAjeTx9EI4u3nsyv0rRqgY8CuK1LupvIu09qzcNKgtT35OZXLqSuv2
         NTTdu7o7B5OKVftBcY2yskHYNrO0VdZVu2nvjnOJDLrLBy/FeZGO+ET4/TPArXADyJeP
         ArZkCwELVQP5u4fHLYb302TPDJ5TM5T8XOd8/IuD7SCOte2lgEKn2vm0qcsmYhixGYaa
         VNhVWxfcex07ZYMvBgtkQpXmwXgiMFteHq07UvO/llr11roOWfc6BpWbyC0rHeC7pjhL
         lnQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445642; x=1796050442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2ojavuWL7IswiT9p/75gc6DxtN1C14kg/yxfkQH6rLY=;
        b=dC04lla/RTKyj/xZ4Ep5ufJD4mFHGmuxgXz4GESllsZr045Ckjcu+Hoqbb6gkrJZOS
         HcZDEIR4p2ANFnX+RZLFsk0P6nRjbPfF8TTFHSZIv9XLgKS6AK3NUOe/MiR83ROf5Fni
         GS2R04LeF7QxdiBvd/meg19EpSnzTOoZ5xWPbmJJlnopNyacWjIAHAoIhOX7YYWkqsVz
         j75lYViJJ2AGtN6KuCgBxJIlGh3lv41w7XSrr7mjueK1Yz/LBiLxFJtk/pKd/IsO96zQ
         TEpq+uDdhsnV9AxQlVCD5vy5LxYF2c1HVW1eg3ZMtSm5DXGK8KrDebOtamQJUaQV3/Lc
         J4Mg==
X-Forwarded-Encrypted: i=1; AL+hErFUW/D7Aj+VNYVishABOVNJSd/coCHB0vTP0vNCztox3qMWkA4GDDJx5RG1j525yt0+SUFTBvU+sio=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sQm08vn78/wkBD+553SVIuqastIzKFzCnd+0LWvA4cGxHoy5q
	aWcNn+4/n9Fd59awPX+/Pqex2PoGTtVKNpk0zsFG3y7NHSJFGbO6bjxF5wzGVJNwd2Y=
X-Gm-Gg: AZFdTZfgQxILNbTdhz4fyRKjl3253D5u+BjKWsD594xzQ4sjoRqF+eJzLG+rLeQlQ6+
	2NLksST6rXwLLSByDC8TfxTkBWm3ds2N9vJn+1x2rgvUOcgWdjDVYvaXPYtvdffhh62kIG171Yr
	8ZsZ6kBzUL+UOcRusoNSlCM3uBB8UJTQIm689yZWidndoSWJvAdiAwiO8vzfzluOXw0feaZIXtU
	o75FPEd7LqyHF7VXeDXOKPzo/bs4ceIGCrrRczHn5hXBcXPB782bkIJPb62mRmhLpNeRD8u+JcV
	0lQFI25pkwt0PqxZRCbdK5pT7G61P4swRpYWaIt4q6OPE9YxjYl9T1gwQI0f7cc6g0UJqeD/VWB
	4E3vD75EMI4SORzrXYgMoVxJxYR7palYUmUyomm7FTZ4ebtr/9u2d5BjWhU+weTa8KAx8KZeMuj
	f3D7HrioA8SQdibmAavE067SgXz27cWQojEpOrBHdLA9mU0WtofCzQOugW2DhJTHOI0CgNF98sj
	kX/Z900u+aiS+VDfqwK52MREXUD1mK4fQryt1lZCK9p7fVPAFodVvq43p6LzJGyD0YAf9E54GbK
	M/vEFKYz5r0ycToBDwP48TcqhP0=
X-Received: by 2002:adf:e886:0:b0:48e:3ebc:d242 with SMTP id ffacd0b85a97d-4abb2dda339mr17523667f8f.37.1795445641765;
        Mon, 23 Nov 2026 06:54:01 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm26379033f8f.21.2026.11.23.06.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:54:01 -0800 (PST)
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
Subject: [PATCH v3 21/28] dt-bindings: dma: brcm,bcm2835-dma: Add BCM2711 40-bit DMA
Date: Mon, 23 Nov 2026 15:56:59 +0100
Message-ID: <20261123145728.29082-22-andrea.porta@suse.com>
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

On BCM2711 the last four channels of the DMA block (11 to 14) have a
different programming model allowing them to address 40 bits, and are
described by a separate node with their own compatible. Each of them
has a dedicated interrupt.

Constrain the interrupt names, whose numbering refers to the whole DMA
block also for nodes describing a subset of the channels, and require
them for the new compatible.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 .../bindings/dma/brcm,bcm2835-dma.yaml        | 47 ++++++++++++++++++-
 1 file changed, 45 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
index f619e395cf0d..b53652d5146b 100644
--- a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
@@ -9,18 +9,41 @@ title: BCM2835 DMA controller
 maintainers:
   - Nicolas Saenz Julienne <nsaenz@kernel.org>
 
-description:
+description: |
   The BCM2835 DMA controller has 16 channels in total. Only the lower
   13 channels have an associated IRQ. Some arbitrary channels are used by the
   VideoCore firmware (1,3,6,7 in the current firmware version). The channels
   0, 2 and 3 have special functionality and should not be used by the driver.
 
+  On BCM2711 the channels 11 to 14 of the same DMA block have a different
+  programming model, which allows them to address 40 bits, and are described
+  by a separate node.
+
+  The channel numbers used in the channel mask and in the interrupt names
+  always refer to the whole DMA block, also when a node only describes some
+  of its channels.
+
 allOf:
   - $ref: dma-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: brcm,bcm2711-dma
+    then:
+      properties:
+        interrupts:
+          maxItems: 4
+        interrupt-names:
+          maxItems: 4
+      required:
+        - interrupt-names
 
 properties:
   compatible:
-    const: brcm,bcm2835-dma
+    enum:
+      - brcm,bcm2711-dma
+      - brcm,bcm2835-dma
 
   reg:
     maxItems: 1
@@ -35,6 +58,8 @@ properties:
   interrupt-names:
     minItems: 1
     maxItems: 16
+    items:
+      pattern: "^dma([0-9]|1[0-4]|-shared-all)$"
 
   '#dma-cells':
     description: |
@@ -119,4 +144,22 @@ examples:
         dma-channel-mask = <0x7f35>;
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
+      dma-channel-mask = <0x7000>;
+    };
+
 ...
-- 
2.51.0

