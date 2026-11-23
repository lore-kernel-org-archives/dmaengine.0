Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445646;
	b=Fptm64axkE8Z3muOvSyRpI2M5SxJwP7871fU4wv0BJCGqgSZRWpprTQSh7JlPS/4NMPZ
	 OdxaG2IgdoRrc5ov8ftuX495aB2PKQc0dCEUMaqms7I3ApLowdGCvTktJGCCnYQFYxshs
	 gCUQiGafhSabLOFaHXN+JL04aYimOkkuTDXYmk/UYQ/WQel1earJWGb4VSZkl2mPgjyeM
	 Eo6tnXF6aCj7mDW9jBjPQexSvNlA9JlzBRYSrHg0JZcZ5Bh7qvRHrOoAuh96fs5qBv93h
	 YVCVNFQ/i2YFr4wOSHU/y8VSs/GPysBjvhYD3PhDDFu75KzmCqNQyE1cNMsbYX5C8Kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445646;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sknB6aQ4PlQDo8HZucV1PufjxI6KnBGvn1RhZrHtfHM=;
	b=Vy3x8T2dqJMd7P2tI03nTwdzOaRPsTV9j0ECTttZkIMkWbNGmhX2ciWsbW2y4d0n27uG
	 JLihGT8hGVVny6EJ1BxjaAc5phb4WJaUPDIM+ObNAw5GTvcZ0BmwZ++OA0VQxpID2X5x2
	 1IvnJ+vChBDBh6uuoTKp4v8/J2KcalsoeCteBDS8pysnhw/db4zqWcVkwBpcz2pY/QBYf
	 nQvWxr86V8+mDbWuSqvdKJef19YIdNPtxgPAQWPKOQxwTJSEveIhDdSnTTQjkP8GDp4WS
	 dvT0J5uwJM0nHuV4+SWbIyeXzz88WNbkLy0T+dAl2wLijSoItoZssM/u5py1yMpKGnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="IRC/4nqI";
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2F6606B085
	for <dmaengine@vger.kernel.org>; Mon, 23 Nov 2026 14:54:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D2F6606B085
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=IRC/4nqI
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so42643395e9.1
        for <dmaengine@vger.kernel.org>; Mon, 23 Nov 2026 06:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445644; x=1796050444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sknB6aQ4PlQDo8HZucV1PufjxI6KnBGvn1RhZrHtfHM=;
        b=IRC/4nqIN/TukIVJjlr+quumteedHeJUY624RxL8kTaq93bj/VPPgv6w4dJGH0g9Dx
         EkJeP0YBVbnQwK4lwqwcqmCsFgwDhuc0qy4w3hG+8cmJeJoR38vN8VQF6OhNc04cAjcn
         NkSAX+yhzAh6YYQYvnrS58Wcdk0l1AXYshXjrpvj5siDdDfZqNDKYGThka4tTbYTocVh
         nsqCntJnmfJ/qDhbXMDXshZk1CshSH3yJT31rgjgFF8iCaknQ1KkpyFy1dKYUXI1X697
         Uama9nukcemmJlB1QZffQ/szG20xkvRilbDSRpfNivGJQZOh0PBanvLc3Ym4SqyhYvas
         Z1mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445644; x=1796050444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sknB6aQ4PlQDo8HZucV1PufjxI6KnBGvn1RhZrHtfHM=;
        b=Ryc/xM1q6Kd2V2hazm2J+LcZkKNWIIj4dSgjFDPylUYNitV83lo8co+MXJGWJx3doW
         7AKvq+F9A077lPj0CGz6O4RTCBd1Q1SEHzPgbww7iecB+xq44UXn3GsO3oQ9h3JPPDdO
         zj00btg7g8q6VwS3vj7LH07AhHxemlatV282eMK+nqnUUR0YXfmhevj9/pDzzZ8WelOK
         CkH5w7jOKY3K/WQgyyXbIChXIFuZoFpH/Gv+ka0yjnxEl6Ig1SiI5ZhSpcBPJr7mU+dY
         9J9ali8S+As9nAb5alOqhRGPOy7UyxVnOF6fDRf2YXzkDfNA42mr2qatLPS4xl2FAzyN
         Gpsg==
X-Forwarded-Encrypted: i=1; AL+hErGjsOALTSJUoOL1vkPqERbRHaXsQaDEOWNmEJ4cTUQJxmyd0sGtvwSXi3eao69mhR4LqX/L7x3G7Qw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9839KgwP3Hc6s6B6dTGGl0nZvl56nkrjHHTr7ppls7YOHbSUIq
	RWWvyT+/+PirKN6Qghcz6Mtct/IE/bhukQY106hrslWFXhRfw9ZAP1FwUdBrNDhgung=
X-Gm-Gg: AZFdTZcWkO6fqr+c0d4385o+WQuorwNb5f9PuBVLEjliqfz/c7rtQASRBgugkMkcqqO
	8+/8+DYk2rzrb6Pu8s6lW85tZnUpw/g++MvlStS/ouZXfC5vwna7Gs9DTDfe8Ad6fGMjaAtvoHS
	B/MbplRNrb0u/q0RtLglBvHMOrdnDNL6R5JJ4b+1Mz3IPuiffeGCdvsojJk0FBgRDmwGeX3t/Th
	1m+ua2A4JFT4zyTD4jgpIJlz0FbvLPaFcLOlyjZdaW8K2iMwcoXb1mXxMnbw+2r9n3BjXVFP8T3
	dXw7J3d5+HGFamc2HEYuD/eyk5lrx3pQjbieSdF7zUVW2jfc3hYpFbbdZ9e+Lv9jMT3ozTCylU6
	UkRcoZVw9AodmZgmv9d6QYVft4MSqHKTI6FV+wbXHRFQe7gfod3rO/FTETkuOQ068HsczDRji+4
	iSUB8y35NYc9dJhe9Tqw/Qpvcnl/9Du3OKFi5i69wUnkX4HcQpp9Hvi74f0B+Wy8QINKDTIpLbU
	CMGTBHUFSwHCBTQPXNne5xKogkClrQ9a4gomtH+VSCFSmzyk4jR3cJil4TYc9W5y+VCDmwXrno7
	bNz6197xr7C2CeEspnscEZrAUNE=
X-Received: by 2002:a05:600c:46d3:b0:4a3:12fb:1ee7 with SMTP id 5b1f17b1804b1-4bb88812c9dmr247790145e9.25.1795445644387;
        Mon, 23 Nov 2026 06:54:04 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm663264955e9.4.2026.11.23.06.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:54:04 -0800 (PST)
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
Subject: [PATCH v3 23/28] ARM: dts: bcm2711: Add the 40-bit DMA controller
Date: Mon, 23 Nov 2026 15:57:01 +0100
Message-ID: <20261123145728.29082-24-andrea.porta@suse.com>
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
index f475422796d8..d152edc069bc 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
@@ -436,6 +436,38 @@ emmc2: mmc@7e340000 {
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

