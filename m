Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781931;
	b=aAg7I2Eoo2lrh7fpe7POniVO5JbgwV8qmF+Mxx3LbOSsx1no36oS/DL0gjkJmlh9d4bm
	 b5Ei+NAO7FwSEbzjQPv779LSiUxarb8TbldI+ninOLLwuNbuoM6V1FWwzZNGecOPfoTPm
	 05xItOW/eDUOCKbtTbcYSqmnfrawDp8MlUYRZaDnnT0oliPJmRvP+e7QqFzqgry9Jwt3/
	 oqLmUpjxpBkBtMh9RrfyMtrTZhsyzLF5+hdd3Ewpdaqr63I22GdoxgTctT1Wyo5XUwLJ0
	 Fddw7xzM5Cs+0K//b42gnyqXXCapofYBZlfBKybKr8mrOS8FmY5tfY/W1QP42tivcYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781931;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fe54TCs34sdjcHDpXrVtFkvlLgVi62aI0olf7UQPt/k=;
	b=kHYFc9z7pzRmlbSIQ/wUvA+lRc7obElpBrpKppH89BjSRecg0AUInoqfVqivwo/uiDCI
	 yylRWFrM9cZqNofrwaBTjtObQ3wlfRPqnD2pNqMJuxOeO5kn2isNJS6XS3BeWsISb/dBN
	 vpnJ7xFJy27j/tFyV+nj9cDEmmLpL7DiNAcO50lZmm7jEWGqq6ofMCMbwUFBT+Yhq7Hwc
	 fj/j48ZXuCadkNQb545mDm+r1UbU79boTpRryP6shwgtAGquFP72EYNlpUOea8sG0yZfj
	 1vBVni+PkSJqzjPlGICI5RoPTiOW7DQkr/xxyC88yviTBi9Q27NXkVeLrSVfwO8RWow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=H63zCcdE;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC67C60A2607
	for <dmaengine@vger.kernel.org>; Fri, 27 Nov 2026 12:18:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC67C60A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=H63zCcdE
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so52519885e9.0
        for <dmaengine@vger.kernel.org>; Fri, 27 Nov 2026 04:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781929; x=1796386729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fe54TCs34sdjcHDpXrVtFkvlLgVi62aI0olf7UQPt/k=;
        b=H63zCcdE8v8z38ylXUNkl0BtOyn7d6plpHm2Zqev9QRdI3N+jCsz1ux3c58bR/omVs
         Tti5Nt9EfL0oZLwXP6Kg78um7P0Tetfg0nuOuepo++jWs5cKJZJ6pVGywi5Gxd9DAcQM
         xRExX5WT5UyB6FfbHu2rtYVDZBFRlzQG3cgvWz7w0+nrt3r91O/DJYgaSaRtdJh7emiG
         gT0W6/+0b3wYhrS0QVQhW8ACkxBQjB4JGzlxgvrRMWvDCmyeawz/GgaTnvwZgF3Ou9Ol
         kxTMnCRAhKXArM7FjuAgO9KgBwSIRx5nEqpe97fnL9QnTh35A+V/+WnhbgXfoQyi6lDc
         HwUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781929; x=1796386729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fe54TCs34sdjcHDpXrVtFkvlLgVi62aI0olf7UQPt/k=;
        b=kllVbVk+ukLWilrRscgHBLWx4xONfW3dALlyz1Ywv1eqYuKBghjgcyXuOu1GcJ+qzo
         NLo60hh0DjqxZ4T+13/6ll1demc6EZLvyKEi7wcR33GXoS36ijsXwjwRr4j/r9HBrIF9
         HqSOZRtJ4U9U9ONrbP9M9W2c85NZ26yxGSKnmOdSR0qcAOavEpaUgwVw1OxvBgvwOai4
         viN0cAqdkx4cCYjSIZsXJnZw3ZEBXFg/vt1jiXV+G0Smzb3Fy7n6V3urmWhY097mAlQL
         IA2GKOlTk8YQH8MfAcpVzTVPBX2qLM+3UM/jsE236dhjnooFJd6yBm99U+0Im7dF4nlQ
         OWgQ==
X-Forwarded-Encrypted: i=1; AL+hErGF65NLbJ5u11l53MS+kcCZ5FrvPyy1RPRmO9WJda6u4KIV33ODTrhRXD6EO4xWwijLIfooumBZfjQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GeMkb8TF9NlPacspCXquK0wgnoK25vhqVdfc/5hrYOV4fTwVp
	SeD7DiQ07cWYyyaqTlPBWXnBYRnvbW5hiFeCct15DGmBYPbQSKauEGKRZy5qCdisYQI=
X-Gm-Gg: AZFdTZf/a3sm9hEufyga1Ie9eIdJhMFRlWdj9imUwIKZsdI+dAtZoRoLFV2w4FhM5sO
	sYuC+JNXGcTBqm9Rm5NnCqsVurIoCC8ZHDOc/0FuAoI3OXoXi/jV0OTFXY+FjPbQntnLSreWAQE
	JFZI8aV7kXxOJ7f4xJYpBiIiQ2pRHogFtCRFmxwb7rKXjoCd59y/eismjSDkesEbwkQGPUSV0bz
	bJLaUUtGuF7xlaBYCyYQHY9qMwpuDUvUbLvwQtBqQc62sSt7Y7zJ47Iavm2drDZJWMk6VC4RVJ3
	C9sCcJfkB3nL65zbKaRemf19WGXZOO3RA4wwcN8oTlWzTlkyXvim0hh9ETEbgB0WBFYtc3wXsa1
	EW1+5vXyCtdXhArKpVQrLUk1RSyRQ/4p6kRpFimfNBFdyt4eQ9OamjtKZ8lK9d/VzyyjlhGM95H
	eN1OQnQYscD5MHHI/HGAPbiAxGlhyBjl/OyF06gRz2bAvQSnruunSga4fdEd4xM+zWZXeA/QrQr
	9Mly12eLU9WdgGYwMZMUpTBXMWFiEMvXa5SvfwFy06Kmws2IpRjDLTXS1qVmVqKxo37c4Xiic8J
	utb+0Z5xbTpzl4SU7XSupKYlP0E6
X-Received: by 2002:a05:600c:a085:b0:49f:e8bf:8f9b with SMTP id 5b1f17b1804b1-4bb887ca0dfmr515690305e9.4.1795781929355;
        Fri, 27 Nov 2026 04:18:49 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm568064995e9.9.2026.11.27.04.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:18:49 -0800 (PST)
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
Subject: [PATCH v4 06/28] dt-bindings: dma: brcm,bcm2835-dma: Allow the generic dma-channel-mask
Date: Fri, 27 Nov 2026 13:21:56 +0100
Message-ID: <20261127122236.4976-7-andrea.porta@suse.com>
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

The available channels are currently described by the vendor specific
brcm,dma-channel-mask property, while the generic dma-channel-mask
property from dma-common.yaml carries exactly the same information.
Allow the generic property and mark the vendor one as deprecated,
requiring at least one of them, so that device trees can provide both
for compatibility with older kernels.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 .../devicetree/bindings/dma/brcm,bcm2835-dma.yaml  | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
index f81740e49301..51ad8bc33d5b 100644
--- a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
@@ -51,12 +51,17 @@ properties:
         bit 30: use multi-beat bursts
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
 
@@ -65,7 +70,12 @@ required:
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
@@ -107,7 +117,7 @@ examples:
                         "dma14",
                         "dma-shared-all";
         #dma-cells = <1>;
-        brcm,dma-channel-mask = <0x7f35>;
+        dma-channel-mask = <0x7f35>;
     };
 
 ...
-- 
2.51.0

