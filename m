Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781956;
	b=OUo25elBvQqupbquNp7DZjRszpmzA79MtHVsGR15/7Gq8qtSjjPSFdnugUzKZ2i1GP5o
	 /ppPY9htO0OsN3N0abIqF6/Ia7wy+ZoTffY7p5XsvZuA+r0lzkbK1Z4hjlBlxm8B1RB+3
	 dbIsoWjD0cn3ZC8Ts+ve7hapIT1tjDBxWZZ0Z2rDgve4is87AnxZYhDiZTNpO7zJHs8ct
	 AKlPJ1Wd/J0pGl6aA8dKe6nDt28mtECORVXd3U2o9wiSY2SdvLoOK09oRRYAx+48ShLKZ
	 tBs7xk3p7C2fDpsNPjV2WlGb1fG4EZwz6LOnWnN5y7VLTf4rU01s9hlA0JXcfVqqALg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781956;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=T2wzmkkVZfBCgK0gyDtXImqh4zosYpUCndScJCPC2/A=;
	b=AeLkJmFgbXZFRi9xqfJurNt8pZ/kaLe556y8W0M3FGX7ZRGP4hZ32akq0IO3x8vQL9k6
	 PSrIt2T0fvlk1yWWuW1VQ3BUf0dfUZDkU72nTvCdd/ypf/g8ZsFLdA9tu390j3S5/72tO
	 3Tc3VZN72CwoV/TFca5JnIXd/oZ9/a5If+VfDVcFp2Q1U+D1zgBekzdWNsEXQ86g4OCgY
	 dHftB2kgMw86pqLWS1kVAqsDdNuXEIBWG/405RbUdaPeVH+h3mh02dCQh0rdV7Msus6Um
	 GhUkZVbO0kqOzoYYa/36nQwuOsHeYed2VkeLEBSFT3JTdhkCTcZrvh320hVaWJqiqmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=K5XMeS2F;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB94606B81C
	for <dmaengine@vger.kernel.org>; Fri, 27 Nov 2026 12:19:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DB94606B81C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=K5XMeS2F
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so64998485e9.1
        for <dmaengine@vger.kernel.org>; Fri, 27 Nov 2026 04:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781954; x=1796386754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T2wzmkkVZfBCgK0gyDtXImqh4zosYpUCndScJCPC2/A=;
        b=K5XMeS2FYjKidBWHlWThP2dCMDaWsyj1ULF+T3aAs2fLzGynYIIzaauoGFpCQfy1BU
         k0CqWpzUbXuKSBSbYnnjtGzxIHrEZHgKLo/3bghWoarl3Jg7RijxcloYVaO78CAFGpd4
         Wlo3wI3v00lCeh821rs9CrBkQD9i+Y1iXTj+CRW17XnTPcE+OUnc/NeBoPmPqVezf27q
         bQoT7ZezQB9IAyNH8WE3FAnALIaTBLchV9svJKlpaM5kE32jf3/hmeSHtRCXBHS6mrFR
         dPiFAz+ON2XxwkKAZDrHwb7cgOeKPunXpDyN4IeMFHejmO5SPeFUSudjRz6tNiruX+yt
         wXAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781954; x=1796386754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T2wzmkkVZfBCgK0gyDtXImqh4zosYpUCndScJCPC2/A=;
        b=2D/iUdFWLNe22KJx2ZjUWzOyazoUrXi1te57A+yaZFsjYncuoJhLU+kA3xDyduPj9g
         ex2dppVjgDO+7Z/AW5m9Jk4XiJAVBqxruhdMB5npOjDAlGcO2GsEfAnvCSQAiTEODJRN
         0YvbMAF7c6FIvONbRbssl92a4hXmdHLfULNb7smnvo0Faj5G4fsLk02IVrqo/JF4jOYP
         CsXZDP7fCaSdO0Cx9rZ1HB1rbNXKdliiC18eXV2mVmitT+OGLB6t/DzV8vDOAgVo7pMH
         BTiCsoVCM5ji/VN+/2DJuIHq/mGmfoRrqYVua/dd2wwhk3A6v1BZX9e5MDQZRpReU3lI
         CdWg==
X-Forwarded-Encrypted: i=1; AL+hErGSMKvgZUs9+nj4uaYLHZMM5RCbFUeJkc5rbdGXZiVrqXTuvMkatWYQUD1g2dGz9bUkiEJJlTojfZg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kKm+13qJ+H/2WOq1DuzTotAM0c70vNW/EYwE6v/jhQ3aIwDxc
	MlxGCgxCa9azGp6ma+vlA3Gf5kjWiWjhH+GgqXPF98Evu6ge8/O8MI8jRlu2Hwso9YA=
X-Gm-Gg: AZFdTZdtJu9UenBysSAJOz0pAeCsHyOl+PGiHx5KghhLbqgx4nLottu6QdllpW/d0IM
	x2+arC2qVvLWnM3mJ81mXhq5SrKHjek4SVwM3WVkFtfH+/PU+k/uX7ef2+1y4xBWtc8rEmqw5uv
	JdM1gjQE9eDXEz7C6uuwm3ghZt6bSsjOLZSCk6q8A+tK/ztf+GOIT4LwNgLO7MsZ+zTGfgVGyqL
	gVJniRVs8jL0ZsZp8pmugcyLN7YLTHqe0oZ5Vt6NGsPf3ZRus92dcazDBgnwLBbyaD89w6uQnAJ
	SOpA9j3KJHRc62yCqWSmjDynTSELF+x913a5kGSXpoWbxL/Db3XCtDlZAe//uKSfPQhlOBz4qVN
	d2TMMU3bqtw4+Ou5Yxv0BL4Yasq7fGQDeweCKzHxbbM0IbnruwLdxvy7LIhbvnvUmqJzGgnQZs0
	tYZw2tY86N4VD1ZDuifYVEyedLP/Ie1SIyyy63soNDDsTOYRQUoxXjySZl8QxWeuT/8pV8p7ivu
	dHMqj7eFvXbOifRQj7AV2CQZk1ovPrd5KYib0G7armJ/SGtvt3k/Wg520h3kTVrqQQUolV12nty
	AQAjcqYQLCLghr2bAcZyxGpSDn6O
X-Received: by 2002:a05:600c:848a:b0:4a2:1960:6fa with SMTP id 5b1f17b1804b1-4bb887fb678mr459954025e9.4.1795781954018;
        Fri, 27 Nov 2026 04:19:14 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b216esm746847685e9.12.2026.11.27.04.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:19:13 -0800 (PST)
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
Subject: [PATCH v4 23/28] ARM: dts: bcm2711: Add the 40-bit DMA controller
Date: Fri, 27 Nov 2026 13:22:13 +0100
Message-ID: <20261127122236.4976-24-andrea.porta@suse.com>
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

BCM2711 has 4 DMA channels with a 40-bit address range, allowing them
to access the whole memory of a Pi 4. Add a node describing them.

The 40-bit channels see the RAM at its CPU physical address and the
peripherals at 0x4_7c000000. Describe this through the dma-ranges of a
dedicated bus, rather than adding them to the scb bus, as the latter
would change the DMA configuration of the PCIe and Ethernet controllers
too. The RAM window skips the peripheral window of the CPU address map,
so that the peripheral FIFOs are not translated 1:1.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm/boot/dts/broadcom/bcm2711.dtsi | 32 +++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm2711.dtsi b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
index 5e3b4bb39396..390b8853696f 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
@@ -432,6 +432,38 @@ emmc2: mmc@7e340000 {
 		};
 	};
 
+	/*
+	 * The 40-bit DMA channels see the RAM at its CPU physical address,
+	 * and the peripherals in the upper part of their address space. Give
+	 * them their own bus, so as to not affect the other devices.
+	 */
+	dma40-bus@fe007b00 {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		ranges = <0x0 0x7e007b00  0x0 0xfe007b00  0x0 0x00000400>;
+		dma-ranges = <0x0 0x00000000  0x0 0x00000000  0x0 0xfc000000>,
+			     <0x1 0x00000000  0x1 0x00000000  0x3 0x00000000>,
+			     <0x4 0x7c000000  0x0 0xfc000000  0x0 0x03800000>;
+
+		dma40: dma-controller@7e007b00 {
+			compatible = "brcm,bcm2711-dma";
+			reg = <0x0 0x7e007b00  0x0 0x400>;
+			interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>, /* dma4 11 */
+				     <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>, /* dma4 12 */
+				     <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>, /* dma4 13 */
+				     <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>; /* dma4 14 */
+			interrupt-names = "dma11",
+					  "dma12",
+					  "dma13",
+					  "dma14";
+			#dma-cells = <1>;
+			/* The VPU firmware uses DMA channel 11 for VCHIQ */
+			dma-channel-mask = <0x7000>;
+		};
+	};
+
 	pmu {
 		compatible = "arm,cortex-a72-pmu";
 		interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.51.0

