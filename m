Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794486252;
	b=Gip6SpdKcZEaE/CS9qkj509+EdkT7JdJS3eUS01Jm7x9q+5+rb+kmG3ukRWOMaFIEKyJ
	 JYl6yCz2lKqKOJQqdgYKmhSmET3+7UWknm7FLrzH8G5p2Mg2gQeGO6rBYXazOvRXsf45N
	 Q/+WTxb6FQ1b34vecbWFzwC+ue8SfGZbkU2ieBQ4iGbZg2U4hAyEVHU7fPCwAMP27/GXp
	 SVf3RO1liORKQhA6jHQvokEhRR+dz4eEFptC2UEScLqDDjMTAB19UXQJ9vrgPkiIyTyO5
	 9vhR4nk2E2iIiJjhRgjQW6iXGpBQKg3vkpd2i+Ee2Et/plaYSA8ygHAZgtSaGGZQHwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794486252;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=GsIbIoeOdN4hRu67cJKyoEtdVFyqYqyLk0dos7CScCU=;
	b=22FZh67rifC8dR7eOSpEiTK0ZD9Avcx3TKR5azlfEfAOdOk++VjAb5PaGv/k1vrhvTFC
	 tMZa7IOmX/jaGt9STT4P11jgYjWvGX08d53vQLSbGU0xbHU7fA7zzhDZFpD3C3F2qhSAu
	 t6+0CwN34of7wEr8d0kaO9yxAPGKiL8ZhEo3RZb5LEcYyFz8k+TLnG9sVPm8dWcyBobrm
	 NYdY3j3hVZV3Sp+pQVTAzbnzKIT37iS1rH3aQ8o4tt5Ro/mQe2raCspJrkcf0iLdIlxiU
	 SjrEPPCJRfamVPt1TWajJIMdFbzup4ni1Rg2ozKm6llOv2DN0Z5GzhVPTup+Jqqt0UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xRCnTnlw;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCDA606A33B
	for <dmaengine@vger.kernel.org>; Thu, 12 Nov 2026 12:24:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBCDA606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xRCnTnlw
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b4bd3d98bfso5006692a12.1
        for <dmaengine@vger.kernel.org>; Thu, 12 Nov 2026 04:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794486250; x=1795091050; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GsIbIoeOdN4hRu67cJKyoEtdVFyqYqyLk0dos7CScCU=;
        b=xRCnTnlwyQK/GwQHxD3U4V7068WV71muUSmVB9T+ddX6SRehGgIRfKDBahkM38wTRv
         kNZp5kkNQzsufsP7DK7ZzC+86U4LtwZ/ulFefiWzKJ8kG+5b4enkrM+5Wt3q5Dd4Cud9
         f1SW0m8Ng3vnfQD+16RQHbrBZ0rte2lorC2UhcHuZIPqevOF0tP0IE+QcVf2d2ARWXJR
         Bgw8Zi+IRfyhg15kYLr2z4JdAKyo0ZI4qiEPudMMsoXS3+HTWqJNUSbHsxXS5ideZ7JG
         dBqxoKOUg/XpiFtpkkpYfwXWYXaJBbnyVPEQZu8XpYe3BdCLBvTjtAUpMlO6WlBWvz9C
         25Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794486250; x=1795091050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GsIbIoeOdN4hRu67cJKyoEtdVFyqYqyLk0dos7CScCU=;
        b=TBK5RQffTS+HhQ6/2FwOnSTfzI+rrjkTjzKJNuC3PjAdFB7TyG0M2OrOQG+pfLi1Yb
         wsx7PoEjtpOpDDEKAkqkCMDO+Bv0UoP8FedgWWhK6H2wBsI9ydIO9C3dHhO5DfMh7xc9
         IleVz+ffvuRuvczYLnIhIghCfVFKouJ8gG9vlNWLcnLKry7pOiD1eQ2fjKH6SyPV+XUj
         XG/6DhPJjv468DfzMm3PtZw4FnBx4X5XDz1rcO+4FA6b6mfReyl+AUC41MXQ17qo9e7m
         qmhKdas7NE5ih5ai2mp6FXvY4265BLrKkCYgg/zw8Mtq2wbdaH1mgR9fbJT87JjNXfp9
         m0QQ==
X-Forwarded-Encrypted: i=1; AL+hErH7mAY9Gdk1gOCl5z8gNFG/JUCRrRz8rTlp0KRjrKVO3oPOCSghvg9IxqP3XA5nEXqqXubJRd5zMyc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5KuKBf9cuKFxas1DX3dbPgDiaBylDu5XU7hnnGDFiNGO9ueGP
	NCzG5dHVTHhpmjhRfrhugrxDR+Zvl7/pEjve5iYbWwhn4hW14sBzGP2Y
X-Gm-Gg: AYBFou3TRXXN/y9o9mpDXu/4KHeLhek/dmTE+N3w/Oq93APlijHZhuHzLm2rMMNPEr1
	jr2EHLEJJkFCZWbEfzZj5PXCH14cnNbdD5t6qKs+DnGGIgV9nBeMuqYUJsjP0yuql7BN7AN4Z+5
	sUGsjS4IkizvOi7iA3LathamJRynAsljRmglkkDbaz1DM735gycigBCaT5/pZABwjo2kXUMzTWw
	BXc+28Ovig+sl+mEajpS7IbrCL6dE0lFneLGZFAri2NdGBGA5gF82m5zjvwALGD3NWCciOVA879
	kyXbVg/x3vjLPtTMFJ/+JzQ2PQ+goVuNhn2AtRzEhJMRF1LpP9Y1HU102qbg3qGygR3uNyni2UY
	fAwFjEG3TFpJH+hAbfP6/FHo2IGJYc6bjd7ESdQ+vOLkDWIBtpyVSNiz7PnNbqVBWN48VTOw9Bg
	fGN/4pBB9X30UAUoIpTJsJVsgNTJ9sIdasFTzNZZfw16NEZzcskqW606JKWk90iPJbTWAQJtl0e
	jqFcvZzPP507XUrkGyS1k4UOc4rzBmoP/T1ZARbnVULiAKyCoGskeHXIQQMEP6L15fft3unWQfB
	mbGMBf51CAwS3qrMYKuBFnKBSZfe8lJGtbHDWSgt
X-Received: by 2002:a05:6402:5607:b0:6b7:b872:27b6 with SMTP id 4fb4d7f45d1cf-6b7b872305cmr250988a12.13.1794486250115;
        Thu, 12 Nov 2026 04:24:10 -0800 (PST)
Received: from crispy-cucumber.local ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b77918d094sm1835931a12.26.2026.11.12.04.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 04:24:09 -0800 (PST)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 12 Nov 2026 14:23:23 +0200
Subject: [PATCH 2/2] arm64: dts: qcom: sc7180: Add GPI DMA
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-sc7180-gpi-dma-v1-2-2a8eceb49563@gmail.com>
References: <20261112-sc7180-gpi-dma-v1-0-2a8eceb49563@gmail.com>
In-Reply-To: <20261112-sc7180-gpi-dma-v1-0-2a8eceb49563@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Erikas Bitovtas <xerikasxx@gmail.com>, Vitalii Skorkin <nikroksm@mail.ru>
X-Mailer: b4 0.15.2

From: Vitalii Skorkin <nikroksm@mail.ru>

Add support for GPI DMA on SC7180. This SoC uses the same GPI DMA as
SM6350.

Signed-off-by: Vitalii Skorkin <nikroksm@mail.ru>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 101 +++++++++++++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 29e345a6a13f..8bf669ce9f89 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/clock/qcom,lpasscorecc-sc7180.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,videocc-sc7180.h>
+#include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
@@ -881,6 +882,26 @@ opp-384000000 {
 			};
 		};
 
+		gpi_dma0: dma-controller@800000  {
+			compatible = "qcom,sc7180-gpi-dma", "qcom,sm6350-gpi-dma";
+			reg = <0 0x00800000 0 0x60000>;
+			interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH>;
+			dma-channels = <10>;
+			dma-channel-mask = <0x1f>;
+			iommus = <&apps_smmu 0x56 0x0>;
+			#dma-cells = <3>;
+			status = "disabled";
+		};
+
 		qupv3_id_0: geniqup@8c0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0 0x008c0000 0 0x6000>;
@@ -908,6 +929,9 @@ i2c0: i2c@880000 {
 						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config",
 							"qup-memory";
+				dmas = <&gpi_dma0 0 0 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 0 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SC7180_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 				status = "disabled";
@@ -928,6 +952,9 @@ spi0: spi@880000 {
 				interconnects = <&qup_virt MASTER_QUP_CORE_0 0 &qup_virt SLAVE_QUP_CORE_0 0>,
 						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_0 0>;
 				interconnect-names = "qup-core", "qup-config";
+				dmas = <&gpi_dma0 0 0 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 0 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
 				status = "disabled";
 			};
 
@@ -962,6 +989,9 @@ i2c1: i2c@884000 {
 						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config",
 							"qup-memory";
+				dmas = <&gpi_dma0 0 1 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 1 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SC7180_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 				status = "disabled";
@@ -982,6 +1012,9 @@ spi1: spi@884000 {
 				interconnects = <&qup_virt MASTER_QUP_CORE_0 0 &qup_virt SLAVE_QUP_CORE_0 0>,
 						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_0 0>;
 				interconnect-names = "qup-core", "qup-config";
+				dmas = <&gpi_dma0 0 1 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 1 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
 				status = "disabled";
 			};
 
@@ -1016,6 +1049,9 @@ i2c2: i2c@888000 {
 						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config",
 							"qup-memory";
+				dmas = <&gpi_dma0 0 2 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 2 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SC7180_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 				status = "disabled";
@@ -1052,6 +1088,9 @@ i2c3: i2c@88c000 {
 						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config",
 							"qup-memory";
+				dmas = <&gpi_dma0 0 3 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 3 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SC7180_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 				status = "disabled";
@@ -1072,6 +1111,9 @@ spi3: spi@88c000 {
 				interconnects = <&qup_virt MASTER_QUP_CORE_0 0 &qup_virt SLAVE_QUP_CORE_0 0>,
 						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_0 0>;
 				interconnect-names = "qup-core", "qup-config";
+				dmas = <&gpi_dma0 0 3 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 3 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
 				status = "disabled";
 			};
 
@@ -1106,6 +1148,9 @@ i2c4: i2c@890000 {
 						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config",
 							"qup-memory";
+				dmas = <&gpi_dma0 0 4 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 4 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SC7180_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 				status = "disabled";
@@ -1142,6 +1187,9 @@ i2c5: i2c@894000 {
 						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config",
 							"qup-memory";
+				dmas = <&gpi_dma0 0 5 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 5 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SC7180_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 				status = "disabled";
@@ -1162,6 +1210,9 @@ spi5: spi@894000 {
 				interconnects = <&qup_virt MASTER_QUP_CORE_0 0 &qup_virt SLAVE_QUP_CORE_0 0>,
 						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_0 0>;
 				interconnect-names = "qup-core", "qup-config";
+				dmas = <&gpi_dma0 0 5 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 5 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
 				status = "disabled";
 			};
 
@@ -1182,6 +1233,26 @@ uart5: serial@894000 {
 			};
 		};
 
+		gpi_dma1: dma-controller@a00000 {
+			compatible = "qcom,sc7180-gpi-dma", "qcom,sm6350-gpi-dma";
+			reg = <0 0x00a00000 0 0x60000>;
+			interrupts = <GIC_SPI 645 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 646 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 647 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 648 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 649 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 650 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 651 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 652 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 653 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 654 IRQ_TYPE_LEVEL_HIGH>;
+			dma-channels = <10>;
+			dma-channel-mask = <0x3f>;
+			iommus = <&apps_smmu 0x4d6 0x0>;
+			#dma-cells = <3>;
+			status = "disabled";
+		};
+
 		qupv3_id_1: geniqup@ac0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0 0x00ac0000 0 0x6000>;
@@ -1209,6 +1280,9 @@ i2c6: i2c@a80000 {
 						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config",
 							"qup-memory";
+				dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 0 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SC7180_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 				status = "disabled";
@@ -1229,6 +1303,9 @@ spi6: spi@a80000 {
 				interconnects = <&qup_virt MASTER_QUP_CORE_1 0 &qup_virt SLAVE_QUP_CORE_1 0>,
 						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>;
 				interconnect-names = "qup-core", "qup-config";
+				dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 0 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
 				status = "disabled";
 			};
 
@@ -1263,6 +1340,9 @@ i2c7: i2c@a84000 {
 						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config",
 							"qup-memory";
+				dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 1 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SC7180_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 				status = "disabled";
@@ -1299,6 +1379,9 @@ i2c8: i2c@a88000 {
 						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config",
 							"qup-memory";
+				dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 2 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SC7180_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 				status = "disabled";
@@ -1319,6 +1402,9 @@ spi8: spi@a88000 {
 				interconnects = <&qup_virt MASTER_QUP_CORE_1 0 &qup_virt SLAVE_QUP_CORE_1 0>,
 						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>;
 				interconnect-names = "qup-core", "qup-config";
+				dmas = <&gpi_dma1 0 2 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 2 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
 				status = "disabled";
 			};
 
@@ -1353,6 +1439,9 @@ i2c9: i2c@a8c000 {
 						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config",
 							"qup-memory";
+				dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 3 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SC7180_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 				status = "disabled";
@@ -1389,6 +1478,9 @@ i2c10: i2c@a90000 {
 						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config",
 							"qup-memory";
+				dmas = <&gpi_dma1 0 4 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 4 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SC7180_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 				status = "disabled";
@@ -1409,6 +1501,9 @@ spi10: spi@a90000 {
 				interconnects = <&qup_virt MASTER_QUP_CORE_1 0 &qup_virt SLAVE_QUP_CORE_1 0>,
 						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>;
 				interconnect-names = "qup-core", "qup-config";
+				dmas = <&gpi_dma1 0 4 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 4 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
 				status = "disabled";
 			};
 
@@ -1443,6 +1538,9 @@ i2c11: i2c@a94000 {
 						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config",
 							"qup-memory";
+				dmas = <&gpi_dma1 0 5 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 5 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SC7180_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 				status = "disabled";
@@ -1463,6 +1561,9 @@ spi11: spi@a94000 {
 				interconnects = <&qup_virt MASTER_QUP_CORE_1 0 &qup_virt SLAVE_QUP_CORE_1 0>,
 						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>;
 				interconnect-names = "qup-core", "qup-config";
+				dmas = <&gpi_dma1 0 5 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 5 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
 				status = "disabled";
 			};
 

-- 
2.56.1

