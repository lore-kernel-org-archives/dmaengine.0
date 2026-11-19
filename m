Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795053301;
	b=4Z00/B3/wMhJOGBBbu+VruXUTtdjoPBMYBvDBVEjXqkG70CmOevEicWQhJX9688qLaWT
	 dc3WEmcNG+9X9H52Ql+UbE/2A4uHuGqKEy7K6n3liv5Cpq4LpBVbTATWHYB9bSSekxDGh
	 eaw0pUFmAlXxP3JX3l8RYlPNkYpThRyjeJ4epylOlIzxrQ+PFPjc7hZhsp5ML/wiiUSa7
	 e+DlpWsdO/nPIsLtBCX6rbNJFkxDsclQ3IUMUrkye1UdqvEPB9sNwk3R7DTfKCb35wduN
	 LHuwqwQvv3/zoQMk8vCLx2NSj2j75jxg2eTWhtUN0iULROYm9WcQo/EfVfe39bt1dnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795053301;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tjBxBXExyy9WLefYOQ4nHcOgOQ5o+ZNc0xlxhA3bZ8E=;
	b=41kWVQN/CUPhlL2d7LgqjaGczU9efrkJeqcFhFbdEIg+RhOyGT8/ksvh4d6OXVLhBRW/
	 txvPcPN4CNTBwCtCFrV6N46mz6DKbeG72DF8rkQt0ROhfcfe3cKzy6L7cnk+Kaa6QTu+m
	 Vnpr/Iulqhzf6LfN9DfwhuxJxie9g2fjCcI7IbhsY3X5o9MdnonNL9vrLxR73fMKVccBa
	 9mwGuNRXZGzciiXol9ep4apg+NIBddRQQpQIDRDybm8oXOMEoo/TR3bpupwWER+FVmDif
	 KRJKsXWst5c3JuhkUoL+Aott1N51vmWkSDypu/TJu5jkMIOtHfUITnF1ZJpgggVW20w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yiDpmAby;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CEC760A2618
	for <dmaengine@vger.kernel.org>; Thu, 19 Nov 2026 01:55:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CEC760A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yiDpmAby
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3acb11973c3so1467543a91.3
        for <dmaengine@vger.kernel.org>; Wed, 18 Nov 2026 17:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795053300; x=1795658100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tjBxBXExyy9WLefYOQ4nHcOgOQ5o+ZNc0xlxhA3bZ8E=;
        b=yiDpmAbyEafa+Bp5TnuXax0bY7p1lXAGnYEyqXmuMV5ajdev7k2TECoemjX6fe/7v5
         zsDZNStqvnScyh0UBRWmwPPMYLYTkH9ZmmYesSJ60RChor5miC0PQMXYt8iEBxgYWCQ+
         RH1ZSrSSH2T8DEWV/aKxc3aR/yxQBE3obLRAcmMc0R33nW8Xdw2MFLtXj8KAct24cV5k
         caDScZtQPTVTY4Pg0cQnfOZyjLVOBGwZTWMcCExLfi+dTfyCnH/UxqB8M1h0kFItcgpA
         r/30T6Bu9zQcxrqzQ8K93WwLadVtLD3LQk/w0r+hOi78DK19M/4Acx/Fei8pmpkpDYfY
         Ry5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795053300; x=1795658100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tjBxBXExyy9WLefYOQ4nHcOgOQ5o+ZNc0xlxhA3bZ8E=;
        b=xlLFkFXuihFUuvnheyI0XAYikmvBKIXXQz1sxh4XUsY93B9SBW4W9Ag86zi2SOIGQ5
         hgXIXua/3/haDCPLD2A/NBMpfyMefFsKOK8o8EjZgxgLOoT1wt4gJndEjbpYFOTjSuZs
         yX2VLauL/91njECllVz4j9aZQeXFGuk3/LhxgpvVvCxjZiSda3cz7nHkHDZZdIkdHsYY
         47IocNJhMzDftfv9Ug7rMCMaozT4heyEI4yItsMbQiKyINhpER+iEqkmo/dahKzBr0Zd
         hPnwnSTIyN/18NB4KdzowndEVVe2DGgKn2xrgzu5PVHCInbh6nVjEcXJhPa5WLdB2kaQ
         BgBg==
X-Forwarded-Encrypted: i=1; AL+hErHIlRl+GkdPCk7CnFksxLWchcbhOMrfZitkV1qg3oqe/1jiniM0eYvshLt5jdfIqGSlm9Wkk0hQ2Pc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WreDiPUg/olnPTUBoLbuai3jG3MfObSxAbonCDFAoVJ6f+mmI
	meqbq0VqvtyPk7NVg8W+NT8ZtKhnB79upshQMBmAr4fyEfXSMvv+MISU
X-Gm-Gg: AZFdTZdTLKKqJR1I19msHTXIRR5oDmPUSrLJ7GIXQDKhkON72GB2S1A7LBldhhPbwFy
	oxxkK1e2N/1hk1amt+UKq54kzCKNNCG08qOJdPL/uBAnUhamd6XfQEJevreLb5uLK06+Ha+jWfq
	Xs/Hbz5rSI0OnZo+2MT6SzS04NxJDj57wS62NNMzXQS/puFornSaF114kY/4lsx6vGXkHwsO2sa
	7IrQN/NLfqx4Bmg0O1SIOqUMGoKNkH1sE7LZj/N+MRRcHyI2jVXJjx7qojCg6LeUY1aeqG2F3Jw
	5UG7yKAlCi0OJ6BeNjEmV+QlgR1TtHe07P+J1pR5Mch4GLG7n/Y6WLxJ6exoYP24Tj2yTlNPud1
	rtiRD+fV/WdWeqk8KUdtE/DzB2bG3hZ6BC3IVjPVBlw1Q45rbLrZ/+s8yDADjpf+5gWwXEsXvAM
	7lnKn8qCyrVpbHW49FAvudoKxKC0Y+IRoeQOMqc5cTqDc8F9BieBjyAVqZ+Ezo0VwzoLVAA67fz
	A2F0gX7Y0q5ERKW0goxk8Y9n5WfhVIzTMOys3BvieuDfS9ZB+kJxkQh40z/bNkBKOdgN1qNEjMM
	4nl6vH12VI0uqWyp09juyZljBPYkXXQTop9+UsimNzarR5GmaFONhuVhc9aPx83Qww/SVezEb/+
	WZNCg3Ju51ze28SY=
X-Received: by 2002:a17:90b:3d8f:b0:3ab:b39f:41b9 with SMTP id 98e67ed59e1d1-3b3d07cd7c6mr4085733a91.61.1795053299722;
        Wed, 18 Nov 2026 17:54:59 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3fe03c3d4sm773081a91.14.2026.11.18.17.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 17:54:59 -0800 (PST)
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
Cc: Shan-Chun Hung <shanchun1218@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v3 1/2] dt-bindings: dma: nuvoton,ma35d1-pdma: Document MA35D1 PDMA controller
Date: Thu, 19 Nov 2026 09:54:46 +0800
Message-Id: <20261119015447.160470-2-shanchun1218@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261119015447.160470-1-shanchun1218@gmail.com>
References: <20261119015447.160470-1-shanchun1218@gmail.com>
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
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

