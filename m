Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781962;
	b=QVk/QmmT9pQm4c9EGHb8+cQzwPFGh9ZoFZZxZRErekO7cv7xndFR7k8mFJTt+sYd5pDE
	 3NDIMR9XflJTEYUKIjxIzekxIHYX0uX/PrhhZpXVYoP1c9LOLYdVExm9JavJdIoqxZGmH
	 QFGbsdPxDt5F7JyaBDqLdOOlxuJgxf0amt2KWTp+z/gwHc9uP/M9w2cailxYSYRwl+MP2
	 t/ULVTP5b7qVy1+WrioSwW4sgNjHyzCk/aJPCIHyn4/gUAIAsIcUdHPMrFfI4/BeGfe5j
	 0i7Jii/F2rDzCUTazG1918+5jh+76lhkTNVWV4IaA9KouXFMXxKUalww1rF1YboGgWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781962;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CvCuLCHfMisjweCDS5uzzO6qtUvgznQmoV5SoBwLBW8=;
	b=tpdFUmnsShOEawSUcnVMYTwoX9M6oKC9k49ST7TsdwAqv2qU2EE2t2IhhPiKC8D0u221
	 xDRa2Ey39xulzna4YqXK15v6bHykoswzdz/ereka1nTtBxtqwN9dK02+IdHs86EF8cS7T
	 jY5OeG+SimyH8iN2Mn6IH6IGxJvl/tsnjkIe4bmrvI525sk3VxJBczxRFioWEyjsI/TWT
	 V/JRNSiGur45aAhF5W4G7jzJ+Ni//8Vq1nWrtmFP68Idt1lA2AUvxN7VKYc0Pj8KFi/3t
	 KTm9rHo41GIkX2Hw8PP1va2hCWCq8oD/FpEGnSWXX3WbOo9oM2OugcvLLEbbquRBd5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=MQ9lQQJL;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1B460A3807
	for <dmaengine@vger.kernel.org>; Fri, 27 Nov 2026 12:19:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F1B460A3807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=MQ9lQQJL
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-492f0a1b685so5733560f8f.0
        for <dmaengine@vger.kernel.org>; Fri, 27 Nov 2026 04:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781960; x=1796386760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CvCuLCHfMisjweCDS5uzzO6qtUvgznQmoV5SoBwLBW8=;
        b=MQ9lQQJL9N9Hsur/539YVDoKAS5MaLP2BhDa1btEqFLdswuokZguf2Bz9VTkPXSHi1
         Yc7NUOMB95y9l4QECTegd/FLy2HC2P+bwPexKDaZd16a68gaXsFzsSW3tH5gGS/zUxrE
         J5mUtzMA4hNEUDqXO3Kl1dMAOshGfzSyf5FjQoUbkk8wg7aKjit3tutPoNODFhP/LWcA
         YbEc9fqp5J4j+cQwI0Q93MM3jOVucW2MIC4jNI6Wvk0NLOnelPwuwClFLDk2/f8Tn61K
         alN6+Y5FxfAePD8RrOm/1fP79SCu8J7yw0pB91moaT7wNaWY7hC2hYK4Y2SP3SRrjYaW
         h08w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781960; x=1796386760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CvCuLCHfMisjweCDS5uzzO6qtUvgznQmoV5SoBwLBW8=;
        b=DIArKGr/VIbaAnzJSFvyWyV3AbgIKJHgy+9gDWuMhRHA/JRv6m3B7fU3grQGLRo5Pv
         d5xD6JbCWLWM7gSM1ONLqff0FT0mcbES7qMrV6XaNIvjTAfNpxn6CNlGlA8Wtzo88cY7
         jQasxh9zNuv17bWVeEiOBoRSHgfq+tRBRsTl22euVDxktmZc6lKqpt+uHgyuPNG3IYWr
         Ib3wMjS2eEiKgFuvpwNFXsYD9B/7G/xAEspa6NJXb11YjM66+++p0V5At6LRNOpbom9a
         49N8xVhFrSB5kaFuSHHOmSbDFqwvEqYjsB1XlQU3dq2zzQcyB9X5I2jxngacjlNyCeI2
         M+1w==
X-Forwarded-Encrypted: i=1; AL+hErF+mEGmbknaTdbn8zO5CL2ZSfZAZwy+zYrzGq1a3EnFlgpHTfj3JVoEL2RilW7yIiLurKd/v+kAUjc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fmF0YqWn5TnqI29AXOuDJvHSwAkV2Kkvh6iGQXYKpqvvxeaP1
	TSE/d6864kwCKplyvis92YSAxW4z55HGPxmLE+yD67nMq/h0bdMAzx6fOdJXt69+9Mg=
X-Gm-Gg: AZFdTZddciLXaOMrpXABT5j1gyqKtqRh63SrmqiBRVE+DRPUZecdNLBGUHBUDSY6i+W
	HWnBdv5bn9tKUiutaBu1ELzJiUnb0Wd6Pn3WRwl001g02kf6yF7nLmq3ti3ddVY5xxJwWxF9zZ2
	2rgIHzaJ240jAiuiRK8tkPoHs/+i4WlnMSveYvZ/MkH9jZKiEcKtronff7K8/VaeUKcnbNnvHwZ
	QhH7dl6LYF9CQYhgVseab8yjIXdFH6Iw0ZOOeuFVrSBRBDVTvRKtQAt3Az35IrRci/w1vgNBUwl
	RNvHEWQ/I1jNjg3GRgwIeGCayjNigfw3CxW+K74C+Cgp+7nMvz1L71cwlrhSfR0fvAlCzdsaLdm
	9d9JDcSteEP94Hgf4IYITCOsuD0HwODy728HR1FYCFXDFm4ioJAPNsOOo0thMqGwRxbT+ZlLr4O
	8Ua5gg/qWI3dv1GxfolrzVVcPOT7HMCYEYeReeX6CbxSgllNFGe34iNM+cLfEdroeUpo+7YW1AE
	W0G42Go/X9hrRCEgwPdKqG/YCRY+1/q61I0Gu+pl7geE3KzygCKUrhu4sRrppGTkZ5qhXUA8vhG
	/aU3ojLXexJ/qC9ap2svhDMIK9k0RqhTwxcuSxm3Mm5ko7qlxw==
X-Received: by 2002:a05:6000:2489:b0:48e:2108:4d28 with SMTP id ffacd0b85a97d-4abb1baaa3emr48985418f8f.13.1795781959788;
        Fri, 27 Nov 2026 04:19:19 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989e3sm47186924f8f.52.2026.11.27.04.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:19:19 -0800 (PST)
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
Subject: [PATCH v4 26/28] arm64: dts: broadcom: bcm2712: Add the 40-bit DMA controller
Date: Fri, 27 Nov 2026 13:22:16 +0100
Message-ID: <20261127122236.4976-27-andrea.porta@suse.com>
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

BCM2712 has six DMA channels (6 to 11) with a 40-bit address range. Add a
node describing them. The axi bus already describes a 1:1 translation for
both the RAM and the peripherals in its dma-ranges.

Channel 11 is used by the VPU firmware.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index edae2f3584a8..7ba0fc540257 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -676,6 +676,26 @@ iommuc: iommuc@1000005b00 {
 			reg = <0x10 0x5b00 0x0 0x80>;
 		};
 
+		dma40: dma-controller@1000010600 {
+			compatible = "brcm,bcm2712-dma";
+			reg = <0x10 0x00010600 0x00 0x600>;
+			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dma6",
+					  "dma7",
+					  "dma8",
+					  "dma9",
+					  "dma10",
+					  "dma11";
+			#dma-cells = <1>;
+			/* The VPU firmware uses DMA channel 11 for VCHIQ */
+			dma-channel-mask = <0x07c0>;
+		};
+
 		mip0: msi-controller@1000130000 {
 			compatible = "brcm,bcm2712-mip";
 			reg = <0x10 0x00130000 0x00 0xc0>,
-- 
2.51.0

