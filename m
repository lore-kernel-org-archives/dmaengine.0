Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445623;
	b=ymX8agzI82skgOEUwk5Ujq6cuk6TcTyeE2X/7QmJh6wOnx7Z0XMd9MJyx2W2mhGyX0RL
	 rIHQEx+xsjoxQUvBKgCqjrPzHfNLKTqx7xdNyS1w4LkmCnmEtz4sXtWzi7HoMaD6ULA+H
	 j67LKTkvxDQjPKQr+qtvlLZwLiaKkJ2OfLhnKyXYG2YYY8y1DyMsNlf9fLL4eRTQ6ZOUJ
	 exyUVjEh+y0XKayLqfEwcj+o4lmRBkDOuZYfXIGJDH2OAwZ4mSFQP0RRjFeGU2yRCL8IB
	 ooddHgcWvwAu9s//kUxri5Dxmwrr6UhsWQ3dXTcaLapnC7//Qz9Mb6cGOIOdD90dNDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445623;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/H68XX0nc4DQMcp3IW1hnsD4xLPw1PDfZHd0l5DhZUM=;
	b=xePBsi3GBrCEPnSFORCK2ts19tDYgliB6+m2Ej3PIQDiTQ2EScNxNpRdfcm/Y/cGjzE/
	 APZc2/mmDyEM4Tly9j966D4j9Me2l4e67eynWgbpNPvOey89oKuzNFfVQeDjRjS2sPTUH
	 fQEiLeH7Y3g413vhIX/TREr+yICoAEvmM3uS+UKJWjl40P379OGCP8uLGq83lYed6mPXW
	 cUj3EOztMoEiGNXSVlF/6WjI6eBVgcAYzJWchOpw5zSUYmxLmA3lVNklRCV0PcCP5GzDf
	 YdP1+yl1CwKR1XQPpXqPtl7vRBX5JBhhLfKI426InXjiOzKqoIfw8RReCoQaqb8A45w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ZnUczZGc;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C52B606A691
	for <dmaengine@vger.kernel.org>; Mon, 23 Nov 2026 14:53:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C52B606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ZnUczZGc
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso31397805e9.0
        for <dmaengine@vger.kernel.org>; Mon, 23 Nov 2026 06:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445621; x=1796050421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/H68XX0nc4DQMcp3IW1hnsD4xLPw1PDfZHd0l5DhZUM=;
        b=ZnUczZGce39WuLbA6SN2SJVn8NtyCeWSFRGoi71yGwH5CFHJAmI9skg+ZpHMMCs482
         WtoA2CviYyBJsEViW2o0/5gO9pPNI+uosQ+aBRug2FpcMlHO/PwdC/FuzSvKln40+eEq
         th5LtGwkkLXfXkK1eDhkaEZR75OFe483bxBd444Sc4CS0MBdgpAZkZHK15lCKchG2cGE
         04NgawBhYWp9EdxDPIHgxazeEYCGHs9jAaGnZ9SHUK3r3HEDqo466oztVBAsyQJ7tzFv
         Y7cnhytK27MgwaNkmUZiv3nztGhAzKAxdWRhfd8ieX0CV1vkkZYZG5E8sNKG/rN59RjZ
         W5wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445621; x=1796050421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/H68XX0nc4DQMcp3IW1hnsD4xLPw1PDfZHd0l5DhZUM=;
        b=enJ12V9Ayy9oiHPryCdfyUw0M9BxzzaZeRAbtwgm5SDwAc1+AZcLqaLKtlIidEajgm
         RGBquWKvhAI3Q753hSRYOU10AyleVshE0gSUId0sj+ejcKm2pVVdjCe4bUIIjsWAjp8/
         kvtS/Tt68mQiVbkyX5ORbJxFM8NgoXG4dxNF/R/BuOdkIi34Pizz8az0mCmjYH4seMk1
         HqMh6+ZtERIqf9RRv1L2VHo4/nbmKwxT3HMUzfUwLDK7KGHpfDv5X2xCd8hl/Vts137q
         ibph7ou92bl3TI6ziJSVPjFtrWLF778IwFevF3P6BQEa23EIlwj9ZVjvJsq3bLKCP9+b
         GVKA==
X-Forwarded-Encrypted: i=1; AL+hErEhE/s6DnLlUFDgEELkgxo4Qy2r0w6+qdU/aYz8R3VExEL5aUQRrAhnixE3xO2ljy8GIOqrr1duYgU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9N9NdjznjkIDDgaNEvOUAg7sMn/OLitxIxrDhIQq1Wp5Ns8tbK
	WXAeg89LPXeH9JqPWZqMIahz4gp+hQNUXgC7pnBIXZ8OhjKRvQjEj7t0VJvtR8FgfLU=
X-Gm-Gg: AZFdTZeJDTazG/E+wxoKhtHHokFZUjZDoDIA/7OxBpEPmTzaWzjbQpTozL7kx3sV5ve
	PjHBXZddATaeJoqOwc808SkLe1Dg6IQhLE6IcUH9cBm4aXRG0xMGDB2X2tpi+nugHcezmyFC8cy
	q6ZhhEhyCkMhgW4mYvm+TNrBo9kjn3B97ayDFiynEP9OhpgkEPGQuoomyr9XgDsJr4wSmtLKH6/
	1TKi0JvuK3ijQCndF1EHodaRP9Eeg24Ah5/bZtFddHDwzn2ObaL0U4ap3q9CHs5llqmENCy01cH
	SNXiLN1CkRSAvzep/K44OSZQc+tGIKNRxarkFwGwQ89wFk3i9yJHl4adwPhWxajR2B7rOR3bEEb
	YlTpx2vt6JSg3aRfd9Vjdnigql0KSJ4wfwpHH4b8EfsgTKgB4wc7HMqtELbpZQR9GcgKA86OB0Z
	S4tPJ2I+sHLgdKexmUlb/mNO65Sx8NI7pZEDroFmCE1YwtNmwOdiiFoFhrlUUwzFj1KwSu/BZui
	8pkkZl6ZHtbSTM7oxkPQNbNLxnRmwK+d6La+uMrHIKbezyFwWFgNxuXiyKe79KUgYQbbJfW9DQm
	GND6KNNnzSvnOpuSsr0h/q0jxKY=
X-Received: by 2002:a05:600d:1c:b0:4bb:685e:cc41 with SMTP id 5b1f17b1804b1-4bb8c526ac4mr199511415e9.8.1795445621520;
        Mon, 23 Nov 2026 06:53:41 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906d6a13sm173289665e9.3.2026.11.23.06.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:53:40 -0800 (PST)
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
Subject: [PATCH v3 06/28] dt-bindings: dma: brcm,bcm2835-dma: Document dma-channel-mask and DREQ flags
Date: Mon, 23 Nov 2026 15:56:44 +0100
Message-ID: <20261123145728.29082-7-andrea.porta@suse.com>
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

The available channels are currently described by the vendor specific
brcm,dma-channel-mask property, while the generic dma-channel-mask
property from dma-common.yaml carries exactly the same information.
Allow the generic property and mark the vendor one as deprecated,
requiring at least one of them, so that device trees can provide both
for compatibility with older kernels.

The single specifier cell is also not limited to the DREQ number: the
driver interprets some of the upper bits as per-channel flags (AXI
priorities, wide accesses, burst and write-response handling). Document
the meaning of those bits.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 .../bindings/dma/brcm,bcm2835-dma.yaml        | 26 ++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
index c9b9a5490826..f619e395cf0d 100644
--- a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
@@ -37,15 +37,30 @@ properties:
     maxItems: 16
 
   '#dma-cells':
-    description: The single cell represents the DREQ number.
+    description: |
+      The single cell contains the DREQ number in bits 0-4, optionally
+      combined with the following per-channel flags:
+        bits 16-19: AXI priority
+        bits 20-23: AXI panic priority
+        bit 24: use wide (128-bit) source reads
+        bit 25: use wide (128-bit) destination writes
+        bit 27: do not wait for AXI write responses
+        bit 28: wait for outstanding writes before signalling completion
+        bit 29: do not pause the channel when the debug signal is asserted
+        bit 30: use multi-beat bursts
     const: 1
 
+  dma-channel-mask:
+    maxItems: 1
+
   brcm,dma-channel-mask:
     $ref: /schemas/types.yaml#/definitions/uint32
+    deprecated: true
     description:
       Bitmask of available DMA channels in ascending order that are
       not reserved by firmware and are available to the
       kernel. i.e. first channel corresponds to LSB.
+      Use the generic dma-channel-mask property instead.
 
 unevaluatedProperties: false
 
@@ -54,7 +69,12 @@ required:
   - reg
   - interrupts
   - "#dma-cells"
-  - brcm,dma-channel-mask
+
+anyOf:
+  - required:
+      - dma-channel-mask
+  - required:
+      - brcm,dma-channel-mask
 
 examples:
   - |
@@ -96,7 +116,7 @@ examples:
                         "dma14",
                         "dma-shared-all";
         #dma-cells = <1>;
-        brcm,dma-channel-mask = <0x7f35>;
+        dma-channel-mask = <0x7f35>;
     };
 
 ...
-- 
2.51.0

