Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445652;
	b=Nr2E0oPQdLYCOm3s/cm9zAKM4vfHdKgz7Y6Y9yPKuDxNsFt/wLC3cuHIfGk1J5eVj6Ed
	 tkD6uJWMg0SuvLdPMvGGLHnDuGG9wuiVByhBRJkvKwv8UeSVaqRTcO17kTG6BoQXTNKaq
	 FQKV90kMvBAVYHwbZv7VVC86aN2w0hBX/59/Gn0aQGj3lA5DBXxoGcAq/33J3VH2pKecn
	 2SEN2ay7BymbCSrbBk3bPPD8zA5YMxYFlyaHLxx+x5/QoS5Bxmob+glVc3F7dkz2HklBW
	 GQAoLH7ndpVu8EsnW3qrpxBejC8rE7TYNnzfTqUNe6xrvMpv1P6jmKxfZq6XbtGugyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445652;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4LzrFFR+hhT71ELT3fY+ftWxMDxLj5bwX900H4igILI=;
	b=UHOPOHvm59DN1KsaXe4FUxgvCjp5LflpPJaVc9U3FP+EvmQ4O6cqnBl5lFTF/V2i4XaD
	 PxGKQK4EAgUKZiAd9biUp/XzQfoSzlNBMWWV6oDbnBMzTNugmGPWQNpueGMh7xnLbWi7R
	 cdxfO3cMegFX1OYkVzML0zUXN7vp6Xe/wXs0rT5sVInMU0RH7lmvFVoHR54frdWdptEn8
	 z2b1a/l0SFUda/jRFSX3+EeopIUqaeHhKWfmMnr4wzzwqApcV+jMihHvqjuCZNmd0k99Y
	 ezRdyBx7lQsRBu0ZLNGjoGzgE9MotF0QMeQgBeROPQXQYmb/NrJhKzrNm6XYY8Lu0lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=DzYTfl6c;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147D3606D162
	for <dmaengine@vger.kernel.org>; Mon, 23 Nov 2026 14:54:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 147D3606D162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=DzYTfl6c
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-492690dd5daso2569015f8f.1
        for <dmaengine@vger.kernel.org>; Mon, 23 Nov 2026 06:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445650; x=1796050450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4LzrFFR+hhT71ELT3fY+ftWxMDxLj5bwX900H4igILI=;
        b=DzYTfl6cD/WSjpjEKM0f8QXZw/9LFLq5s47ekiK01Yb5jiZqNHvITc49zeK2FSdF1J
         rVH3+eQsQwvlCYZ2dtdeKfeeZKpjDjPs2eXrzgF2J0UxoD1gg5TQQtGsnvtoIQ2rCpVO
         7VvVhInqYDtvDnlXFHkj4b94cB5JXane+2fX/FMXtbQQiVIaajFxeFoDbTF0KnK5pi/D
         hiunvss/Zi/G+8nGPGyosqf21CgmcPIctwjs1vqKcwdZuc1B4bxEFwc9UKJ4C7mhBJVX
         SMmwBg095gqDY09thmHMFZLgkJMI6eYhPTZZSKk6styZ32Ihicvo8zaIfuz3qSakP62b
         tQTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445650; x=1796050450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4LzrFFR+hhT71ELT3fY+ftWxMDxLj5bwX900H4igILI=;
        b=t30aHNHZxlrJ2GNAP4GL1hfloBIi7gUhuZ0teXhu/HFIIp0SnibLBin0IemYj9f2T9
         Flm8c7gt2AOeigX35lvEhEgDZw/9yqHR5YP5n+t4HSuxUpGxh3J7fJ+9KLvAgyc6nsCI
         Onr+XB/fxhNUo6BaTJQ8kCTycEcE71yeo42zL6lhDA55O7Yb2k6zc2tGLsFSPDavKnko
         3ogdZ5m6X5IQp0Ko7m+wHVyr4b0IfitSU5gl+LRnDUvmWyYhoipH10ymsZGN5c4wSpy1
         WhJXb3V9Ja5WgeoSy0XZ/frVqN+GhtiGcB55xHKiJylg/7Vh3zl6sfG3E/XWa+BLlNqe
         AW6Q==
X-Forwarded-Encrypted: i=1; AL+hErEK/ztD2sQV8cAGmYLHUEblEDdr5TG+2WQYYwECcfWt2BWhAFXLA1W1Q77OrT834fRbPZ8kA6Qum9M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6GNc/UpQqq1jUNK4zj/x7Hgocu0RWfOyGbtz5pvoV9ckEabY5
	XktvPycfn7EC6RLBCxTyTtmLIZkF4COs8144tK6/9I2utxXYW6I0+Q+f9y0rl2MiGK4=
X-Gm-Gg: AZFdTZdjKTWYMMAAyC7T5AhWjlGDey1Fi8wd0KkzVqnMvh1KKtxHDj4cqYYLIXfS9NJ
	8BkPTF89q+Iq/HXqklmN+nSH3RY06yWE63n8kNrw1R18VqFAW13JOA+VYlQ3ddnbigGSCbywzN7
	b8QrT1GUpyQeDQzxiJiDmoSjSXJrQFoxSKmuqgOI6jCR+X2NZm5BOLzYPH4pMzfRtXQl68WB78j
	He/kEC3QIW3KTCOfNm/1KRhUYAau37tUTj4c8eRgRDplqH4QBbPhtOdRopnOohUmzV0ftLKPyWt
	7hbwtnCy6o5wAPD/7kHeTQ3P9zgSyrkVbAgBMuYhMy2JLJNdwQzJAZxJza8RjSCMC5AWMy5VOY8
	1P8Nvglax8j08dJBeNJaRwdoVbcHbKwtjOK4UZg4jOPFUmHLED2m++cObQc1bHtnlzSPWXsxGtr
	aeusFbf7FtyVdrYW/iSkcZq4XGH/JdLxF/urjcpxtIGhCcLpLgr/hUw2/L6AvO8OOsIeghkOSPg
	x1bfYOljpJkmNmDbuGtgQS9LXX8Dt9JhsatWQjMzRlXUou6Z5ADnCRXguv+E8f15GdH6UjO1Pvl
	Kmv/3VyXwMIsVlgJ6z6sOV8hI8I=
X-Received: by 2002:a05:6000:299c:10b0:4a7:9630:7b5a with SMTP id ffacd0b85a97d-4abb47b2043mr16463654f8f.47.1795445650449;
        Mon, 23 Nov 2026 06:54:10 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b2c9sm23615057f8f.31.2026.11.23.06.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:54:10 -0800 (PST)
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
Subject: [PATCH v3 28/28] arm64: dts: broadcom: bcm2712: Enable HDMI audio
Date: Mon, 23 Nov 2026 15:57:06 +0100
Message-ID: <20261123145728.29082-29-andrea.porta@suse.com>
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

The HDMI controllers of BCM2712 feed their MAI FIFO through the 40-bit
DMA channels. Describe them, so that vc4 registers the HDMI audio
devices.

The DREQ lines of the HDMI audio changed between the C1 and D0 steppings
(10/17 and 12/13 respectively), while the flags request multi-beat
bursts, wide source reads and the AXI priorities used by the downstream
Raspberry Pi device trees, where these values come from.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts | 9 +++++++++
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi          | 6 ++++++
 2 files changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
index ae4b7c587dbc..97a4b819c01a 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
@@ -8,6 +8,15 @@ / {
 	model = "Raspberry Pi 5 d0 Stepping";
 };
 
+/* The HDMI audio DREQs changed on D0 */
+&hdmi0 {
+	dmas = <&dma40 (12 | (1 << 30) | (1 << 24) | (10 << 16) | (15 << 20))>;
+};
+
+&hdmi1 {
+	dmas = <&dma40 (13 | (1 << 30) | (1 << 24) | (10 << 16) | (15 << 20))>;
+};
+
 &gio_aon {
 	brcm,gpio-bank-widths = <15 6>;
 
diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index 7ba0fc540257..b7d7623ee9c8 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -483,6 +483,9 @@ hdmi0: hdmi@7c701400 {
 			interrupt-names = "cec-tx", "cec-rx", "cec-low",
 					  "hpd-connected", "hpd-removed";
 			ddc = <&ddc0>;
+			/* DREQ 10, burst, wide source reads, priority 10, panic 15 */
+			dmas = <&dma40 (10 | (1 << 30) | (1 << 24) | (10 << 16) | (15 << 20))>;
+			dma-names = "audio-rx";
 			status = "disabled";
 		};
 
@@ -513,6 +516,9 @@ hdmi1: hdmi@7c706400 {
 			interrupt-names = "cec-tx", "cec-rx", "cec-low",
 					  "hpd-connected", "hpd-removed";
 			ddc = <&ddc1>;
+			/* DREQ 17, burst, wide source reads, priority 10, panic 15 */
+			dmas = <&dma40 (17 | (1 << 30) | (1 << 24) | (10 << 16) | (15 << 20))>;
+			dma-names = "audio-rx";
 			status = "disabled";
 		};
 
-- 
2.51.0

