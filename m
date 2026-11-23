Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445641;
	b=XSD/oZ3BOERJozKqO5c8U73DSoq/aJUdvB6ogwz3FBH3Q61wDu11v0FewZpi7jCNeOHz
	 oTCD6FOPDIq1+v4+LhF7nsH9Q3CpqCv/+X59Tg5rg2OA8r4YrQ5dJKeTvocRdN0NfcmPk
	 2KjQ+2m5I+qo5u+XqprJ3KAUovvzWRjSqhLesI2sm277KiJ62UIByaRj+dhzlCU/NyuZI
	 38eK4S0y7TUuQD4+8FlbYfZwKMLv7A8pYSlHTuA1EAjX9+Q47UJ4uJO1spuSO/SZ8H/e4
	 K1mORpfINlb68vs53cZV1FddXHKzk+hWeZRn2WKQxsENCdZQw4g6ktl89/tgdrFjg4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Tj2oyeqk6b69KxFWS01t2IbQgu2lmmzdv80iMVDCm4w=;
	b=KP5ynyMJFuLqf4CM5n9js1sinVaIPmeEEBSbKM5XqxAFXb+sMi2WdGpxHNv+fM/4OE0E
	 pPVfIQfgwmPwCPP2M1urUGZQzRTKluvV+3d6Lcp/4KPCSYcUC0BaJs4snvfWZ65psOsPt
	 WdVHs6SLmPWeVUcTnexq5Ozi8sx2zk0L4xSWZSBl5s+b5ODfLFOQte/4gG2fjeFW6FqDL
	 YYQpclcGHp7NtbZpOPhrAh0OKOWftRMBOCmufYwGV+TiGiai4Fxd+E6Y+2dhflnOjHwmg
	 5MGTGhw9HxDddACb0s22tFS64jeHXRzewUDrhNed2YeEsajx2svK49ZIPIB4Ffm8pOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VZvSaB9t;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030B960A6F71
	for <dmaengine@vger.kernel.org>; Mon, 23 Nov 2026 14:54:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 030B960A6F71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VZvSaB9t
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so33675435e9.3
        for <dmaengine@vger.kernel.org>; Mon, 23 Nov 2026 06:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445639; x=1796050439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tj2oyeqk6b69KxFWS01t2IbQgu2lmmzdv80iMVDCm4w=;
        b=VZvSaB9tF6Ty5DLiTMl2c9D0Ccghyv1P7rffdqVNLDtRDzfGPX7k8Eyx0dZFmcuouf
         2dY3ybu/aq1EISw8yaRXEhTd+UR5AxRdCuoxZQ7V96cWkMTZIwgZfxTt62IS7DqK6K+U
         xICre3QevZeTBW7W90i1HAVVGJXMDkUKlzY8JytG/Phu2WkGXrSdrt229K7ovkFKcVHc
         7xzq59ImKS//GC94ZtOGtN/6VY0F8InOJm47Iw2ajaEvyPqVoerHJwktxPmB3pLFAbRP
         nFJjHrGkW6Jw9bdMs5wA8mEyC2L0xOu+/IkPEtGSVTc9GGCs+ZjScW/FSKFP4MGiO4TX
         N/NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445639; x=1796050439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tj2oyeqk6b69KxFWS01t2IbQgu2lmmzdv80iMVDCm4w=;
        b=TsxOd3C4xzKTYmVU4uChTAtU830QshWMCz8wcbfkt46xNqBcbOGDgTTHhxK1xxI6MI
         H7nrkb2/10zzvzxhjZ/cwoJ4jBc/qpGHIZEZBTzMSj+tVC/5czYzOrn5x4gc4k+4alYd
         C7NvtLa7Izr36ATepXJ6dbHBMqQUXhpCZRuepLSwk63urHNcLaZF1RCP0qT8lqdfAh7X
         e9XfPKnh007gSpRe2q67qbY+4HYdG4YCmQnD5WJmhQswNaoBLb8hNEHeoXp81EGO/Xb+
         b3Jhyx0wOEV89+M4f880iWOMzM1nD526yBMwsWhR6gCwNsXbf3xrN5ZEvfJj004csHF6
         yxBQ==
X-Forwarded-Encrypted: i=1; AL+hErGULoQZPWr//oucrp2u5NYeOhwgw9VoWeXtYItB8Hxc5eB9tVsJdJM4MAVk7QTqa8xE/Wr8ef4uf1g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mnoc6GCgyoX+gCmf3pDU3BfjxV87acXZATR3AZUrkDXsLzf7M
	tYxi5YbJmQkiMf6pAHkITUMzNFqR2/ql+ydk/Wl4jiF86qwI9/ZF2ulgHogD5UEm1n8=
X-Gm-Gg: AZFdTZddmADaC/baXncXgfdfAcZjwYMGRgVtoueq5n/VMeIWHQrgu3NwxS+x5vNNDzx
	6YwTtJQVSeKfiUPA6wQ8VfrK6Le8vyWmj+F8tC/YYZ1MXJKU6tXSjM7QP5orFK4oXsEdaY+I8DR
	DT5VDoFwpYDKPQ8YktxpI2rDEd38rU7WRtR/vKkmTIHORvzJHIcmWfh0NbMpCKfNAakvjh2zWdI
	4j9Wk9S41fnkmkNrj/3+OqBkg+ASYwIOmFabGlM9nM6Jst5L72FhyWd+4+gZNa8xad0hr/CdSQ+
	vaXNwRNvjA9xAthXBYlI13OA5T2UzeVBWYzLRM9XQp3j9KD5qb4/s22W2vQpX12ail4XqhRW5XM
	uo44FAFeI8dU2iDkyJBTSZtvpbFWriK7NeFFgKmT7fw+OP/EuPhM2+5QHVSrD+RVd8BlgF3Z5hD
	0guJ8/Ijr+8j5bQd60ANufHle+5XQoOHe9zdrQHPfS2edbOpfeWef92NLK5aHjtygTHLUPDx71J
	VzTqie2Aii2ShJLTiJWNqWzmSqXUVmwp4v6Js7i8shGOs6xmS90cjL7MvUAmbogqoj3DMKButca
	EnYFDhWFkxFGusN97mMC6o9+lflC
X-Received: by 2002:a05:600c:a0d:b0:4a1:825a:56fd with SMTP id 5b1f17b1804b1-4bb88826c1fmr237377065e9.32.1795445639349;
        Mon, 23 Nov 2026 06:53:59 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm280462825e9.2.2026.11.23.06.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:53:59 -0800 (PST)
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
Subject: [PATCH v3 19/28] ARM: dts: broadcom: Describe the peripheral window in dma-ranges
Date: Mon, 23 Nov 2026 15:56:57 +0100
Message-ID: <20261123145728.29082-20-andrea.porta@suse.com>
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

The DMA controllers of the BCM283x family and of BCM2711 see the
peripherals at their VideoCore bus addresses, i.e. at the child
addresses of the soc bus. This translation is not described by the
dma-ranges property, which only covers the RAM, so that the DMA engine
driver cannot translate the CPU physical addresses of the peripheral
FIFOs and had to rely on its clients providing bus addresses instead.

Add the peripheral window to dma-ranges, mirroring the ranges property
(minus the ARM local peripherals, which are not reachable by the DMA
controllers), so that dma_map_resource() can do the translation.

This does not change the bus DMA limit of the devices on these buses,
which is still given by the RAM window except on BCM2835, where it is
raised from 0x5fffffff to 0x7fffffff without affecting the DMA mask
derived from it.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm/boot/dts/broadcom/bcm2711.dtsi | 8 ++++++--
 arch/arm/boot/dts/broadcom/bcm2835.dtsi | 3 ++-
 arch/arm/boot/dts/broadcom/bcm2836.dtsi | 3 ++-
 arch/arm/boot/dts/broadcom/bcm2837.dtsi | 3 ++-
 4 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm2711.dtsi b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
index 5e3b4bb39396..f475422796d8 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
@@ -41,8 +41,12 @@ soc {
 		ranges = <0x7e000000  0x0 0xfe000000  0x01800000>,
 			 <0x7c000000  0x0 0xfc000000  0x02000000>,
 			 <0x40000000  0x0 0xff800000  0x00800000>;
-		/* Emulate a contiguous 30-bit address range for DMA */
-		dma-ranges = <0xc0000000  0x0 0x00000000  0x40000000>;
+		/*
+		 * Emulate a contiguous 30-bit address range for DMA, and
+		 * let the DMA controllers reach the peripherals
+		 */
+		dma-ranges = <0xc0000000  0x0 0x00000000  0x40000000>,
+			     <0x7c000000  0x0 0xfc000000  0x03800000>;
 
 		/*
 		 * This node is the provider for the enable-method for
diff --git a/arch/arm/boot/dts/broadcom/bcm2835.dtsi b/arch/arm/boot/dts/broadcom/bcm2835.dtsi
index 15cb331febbb..3a9719e2fadc 100644
--- a/arch/arm/boot/dts/broadcom/bcm2835.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2835.dtsi
@@ -35,7 +35,8 @@ cpu@0 {
 
 	soc {
 		ranges = <0x7e000000 0x20000000 0x02000000>;
-		dma-ranges = <0x40000000 0x00000000 0x20000000>;
+		dma-ranges = <0x40000000 0x00000000 0x20000000>,
+			     <0x7e000000 0x20000000 0x02000000>;
 	};
 
 	arm-pmu {
diff --git a/arch/arm/boot/dts/broadcom/bcm2836.dtsi b/arch/arm/boot/dts/broadcom/bcm2836.dtsi
index 783fe624ba68..4ab7769c056a 100644
--- a/arch/arm/boot/dts/broadcom/bcm2836.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2836.dtsi
@@ -8,7 +8,8 @@ / {
 	soc {
 		ranges = <0x7e000000 0x3f000000 0x1000000>,
 			 <0x40000000 0x40000000 0x00001000>;
-		dma-ranges = <0xc0000000 0x00000000 0x3f000000>;
+		dma-ranges = <0xc0000000 0x00000000 0x3f000000>,
+			     <0x7e000000 0x3f000000 0x01000000>;
 
 		local_intc: interrupt-controller@40000000 {
 			compatible = "brcm,bcm2836-l1-intc";
diff --git a/arch/arm/boot/dts/broadcom/bcm2837.dtsi b/arch/arm/boot/dts/broadcom/bcm2837.dtsi
index c281697142b1..ba44cfb07668 100644
--- a/arch/arm/boot/dts/broadcom/bcm2837.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2837.dtsi
@@ -7,7 +7,8 @@ / {
 	soc {
 		ranges = <0x7e000000 0x3f000000 0x1000000>,
 			 <0x40000000 0x40000000 0x00001000>;
-		dma-ranges = <0xc0000000 0x00000000 0x3f000000>;
+		dma-ranges = <0xc0000000 0x00000000 0x3f000000>,
+			     <0x7e000000 0x3f000000 0x01000000>;
 
 		local_intc: interrupt-controller@40000000 {
 			compatible = "brcm,bcm2836-l1-intc";
-- 
2.51.0

