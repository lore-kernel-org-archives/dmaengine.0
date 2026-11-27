Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781964;
	b=rw8zjrX8ko9VZPTD0jWGWC3ajFfH8dDc1IuEsEsNNV7aGpr7hPsS6h8f82EnReWsgHFc
	 XS+HFHSgWcDfRIE/ZSRWicfLw8ITjmRzMhfsFlcm5NBwycren4rhrh2HcRuSESp9FTVqd
	 AtS8PBZpAZTqw//+K7wy93NyUPiaXfZkcsacDpgjP+IPwYPnq07AOAw4pmOivwHewriTt
	 5OerA1MZTr6rIIQgVArI4Ea4BMua0E+O+5pt0ONMs5q9QZcGF0+ntRu3cxzsCD4SRsNSY
	 tbWQuaRaiXu4vopKJk1N20s3UCdLHN68iA7RCN/jx0QxRp06p+A3OMRxe+uCVrykwnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781964;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+IW/uZ0j05LJqVLsSY6Erg+izYe5hqVn60TIR3SgAB8=;
	b=sCeK7YRKCOvl3cPwUMvIgiHXbGxB5aNyoAiNGAysEGPzei0czd4eVnOX38tTlm9zDg3q
	 dwilxIANZerHLkL3cKXA2ei6TayX7pJ7XaxnJxxJXpakZXqm/iOV0pRgjhfAmk2S9ojLA
	 ROcXDK3x6qy4f0BwDrvTwS/ml12Vw4ILs8sXE4vM/v0MjsFzu15LXd8PPzB9SXLQx8mVX
	 no/ha/Qtgzdq5F+0wsaNhZF3VuuYsOcnt17FyWl79031hCPA/7O7U3GvFaXRec7perDoK
	 Y8PQJplgs7RHU71Nl0XDcgnwWuXhxdI//zaRJaRulPC8wtTljoYLptZLw4499SSHawA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=RWsFwaDj;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379A2606C6D5
	for <dmaengine@vger.kernel.org>; Fri, 27 Nov 2026 12:19:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 379A2606C6D5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=RWsFwaDj
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4a42b34e930so7034694f8f.2
        for <dmaengine@vger.kernel.org>; Fri, 27 Nov 2026 04:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781963; x=1796386763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+IW/uZ0j05LJqVLsSY6Erg+izYe5hqVn60TIR3SgAB8=;
        b=RWsFwaDj06AcQkXnUrqX7SDxFULhdAZXBD9zPLiKNyDdmryVwjctfsZP3uWZxFP724
         LLBOw5EONTIxs+Gob63p3AElMXNVIT/hL8T9vgTn6A7NV8/j7bQk67aEGPUt+cWT0MSD
         ve3lQZE7IKp/LNkjT+1w9ndILaGzmOwrpdYz0h85UAXF8eNnGFQgAOCpxNTF603Myr6z
         n5V5QH623ZKLo/NeoFZQof7vWqZV+XhX3mzdwllT+gCk/s0cGvQlT0nF15dAR0wFiG7V
         Bit3Pvegw8CYFTw1yhrcpb8cXZnV3686s0teEUYE2g97T5sNt9X3bog5TTxNVJCBd0ki
         cv/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781963; x=1796386763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+IW/uZ0j05LJqVLsSY6Erg+izYe5hqVn60TIR3SgAB8=;
        b=lyK2xNQI4ZtXNTg1f24ZMhMCpbrwhE5tV7QM4C1DPQ+fl3L0/eLFbyz2hDrhGb3Jlm
         C5X/M22EGIgb4bcvpUKgcFoVQ/fSkzrmMs2tA5scdqsZSmGC8wy6Tn2FatvFez2KmE63
         gSp4rIhKcuBByJggJ7lsCxxIugaTvwKdtZ8uoH7C0mwpaL6/TfCHooxY519FoT+6fSHh
         fBjF18HOmsG3csPhpvFrWC29SY/5nmqCpTi2tke2koOvHM1MjFFHh8ldMwX93Pugg8v2
         s9LXEqCmalEvi92nc/L29lVtW7FIH5A/hpaOAkIZTICDFrMReoZ4JWEQOKXVZKmNZY9L
         yorA==
X-Forwarded-Encrypted: i=1; AL+hErFHXVYO50yZIHqDk5bOsBwPgLInAb3QKVNJBCj7QcJXNBxNyYKjuLYGQIAPyvc8GfJwnedlxVzlJiw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dCqsVPTZQcBs++ysCqKqmB0GLUKrZt11/4j9cmwS/q6nbU6AE
	OjLs6HAdBQ8w2oEBDwJzoAHKMoNjlvj8GwnsZL+FOE3T+K42mnN60GaHYNxVa0dqHxM=
X-Gm-Gg: AZFdTZcvSZu95dCanvEl6FzwDxKx26l3pF/fhMh7DOxB+4GVTOcr+904b8dtEblU35z
	EVpenplTWrI1e1qGmFDSQjQziFFgNDJuROVn/wZReiqQ1bvQdZRREni9FVAa1k6CGY6U0NGIwfQ
	DfXWtFpqDvAcnrsXuuZ+q9A+xUgh9JJttLkEuUfRBvWGrsFPwNPvcwSg1DYfOuWASnQX012rSWr
	JsnzC7uW+/hqfM/TbSCor5ner/yBDqvxONR6ukn/XD7YWhk9F7EugK3BJ6Qv+4FWKA1la6VcXEB
	O8+mC8YD5oImWZUdEBEm+sEZlxYHQKS0oSSKloleZpnlVkpCbybINwRXoItDJiMRYo3V5zsFd6k
	JJk2xTBmMwceoQbUF0/+vZ917dLX2QV+p9c99NMKI3h7yaE5AeAgnzAvJT5Jpoep0meaOe5JQxH
	eyf4szEt6VqmNNCQo/6g0CEoUWYZU1VH23bt2pG2WrFYMtv113vjoz10q7b3koJlLOMFEW8mpGJ
	3sDA+rCXC0WrSs3Py/fkLDwp4cKtLujHvBs+ItdHDImq4MBhyI6/2ceZiOarSmnubjGhOK7jDxh
	ujjNbPogCCpxFZjd2f8Bfk/LsO4/
X-Received: by 2002:a05:6000:290b:b0:4b7:8363:682 with SMTP id ffacd0b85a97d-4b7836306d3mr23949156f8f.16.1795781962728;
        Fri, 27 Nov 2026 04:19:22 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b2c9sm48478454f8f.31.2026.11.27.04.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:19:22 -0800 (PST)
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
Subject: [PATCH v4 28/28] arm64: dts: broadcom: bcm2712: Enable HDMI audio
Date: Fri, 27 Nov 2026 13:22:18 +0100
Message-ID: <20261127122236.4976-29-andrea.porta@suse.com>
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

The HDMI controllers of BCM2712 feed their MAI FIFO through the 40-bit
DMA channels. Describe them, so that vc4 registers the HDMI audio
devices.

The DREQ lines of the HDMI audio changed between the C1 and D0 steppings
(10/17 and 12/13 respectively), while the flags request multi-beat
bursts, wide source reads and the AXI priorities used by the downstream
Raspberry Pi device trees, where these values come from.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 .../arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts | 15 +++++++++++++++
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi         | 11 +++++++++++
 2 files changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
index ae4b7c587dbc..80073bec01b2 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
@@ -8,6 +8,21 @@ / {
 	model = "Raspberry Pi 5 d0 Stepping";
 };
 
+/* The HDMI audio DREQs changed on D0 */
+&hdmi0 {
+	dmas = <&dma40 (12 | BCM2835_DMA_FLAG_BURST |
+			BCM2835_DMA_FLAG_WIDE_SOURCE |
+			BCM2835_DMA_FLAG_PRIORITY(10) |
+			BCM2835_DMA_FLAG_PANIC_PRIORITY(15))>;
+};
+
+&hdmi1 {
+	dmas = <&dma40 (13 | BCM2835_DMA_FLAG_BURST |
+			BCM2835_DMA_FLAG_WIDE_SOURCE |
+			BCM2835_DMA_FLAG_PRIORITY(10) |
+			BCM2835_DMA_FLAG_PANIC_PRIORITY(15))>;
+};
+
 &gio_aon {
 	brcm,gpio-bank-widths = <15 6>;
 
diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index 7ba0fc540257..bedbd7a359f6 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: (GPL-2.0 OR MIT)
+#include <dt-bindings/dma/brcm,bcm2835-dma.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/soc/bcm2835-pm.h>
 
@@ -483,6 +484,11 @@ hdmi0: hdmi@7c701400 {
 			interrupt-names = "cec-tx", "cec-rx", "cec-low",
 					  "hpd-connected", "hpd-removed";
 			ddc = <&ddc0>;
+			dmas = <&dma40 (10 | BCM2835_DMA_FLAG_BURST |
+					BCM2835_DMA_FLAG_WIDE_SOURCE |
+					BCM2835_DMA_FLAG_PRIORITY(10) |
+					BCM2835_DMA_FLAG_PANIC_PRIORITY(15))>;
+			dma-names = "audio-rx";
 			status = "disabled";
 		};
 
@@ -513,6 +519,11 @@ hdmi1: hdmi@7c706400 {
 			interrupt-names = "cec-tx", "cec-rx", "cec-low",
 					  "hpd-connected", "hpd-removed";
 			ddc = <&ddc1>;
+			dmas = <&dma40 (17 | BCM2835_DMA_FLAG_BURST |
+					BCM2835_DMA_FLAG_WIDE_SOURCE |
+					BCM2835_DMA_FLAG_PRIORITY(10) |
+					BCM2835_DMA_FLAG_PANIC_PRIORITY(15))>;
+			dma-names = "audio-rx";
 			status = "disabled";
 		};
 
-- 
2.51.0

