Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445651;
	b=pzn4+sSMDeJa51vvnRqHj36/pXilETsR8iL8/egAhH3mzallfjU2J5u/80Rv+jpnGsQ6
	 u1OlAkJeeGtW/WkPMyDcGBDmVM9I4FyWvYfY8TKbjmOjPyzLF1ljOu3N2BQathU0I3thm
	 9+2LXwhBfwzdWrRPb5joSJ4BNHbltbTG48B9s7uZes2J+VlNl4VwR6y+TIjOK0+zkgQSB
	 iy+stHV60YX/XvoTGoYHfIEMHRD+lFfwKYSXe2TwElBU6A+shDAHjdMKtZegSj44kIxfs
	 3YFzxRuq16scQlkuAxO8eSDlixmnCn0uX4exxgQkMEjSO0knZVYJ1yqOz1WUtZ+gACw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445651;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FEdGm/AcXh2womt9GiV7Pf7HrO6Vbc46kckpe+SSelU=;
	b=uHgx/6Je/9goVKmvOZmO+Ojx6gPaqAvXaGlSH96n4hdzAM5sN9YN6rQmfs2rkWJeq6+l
	 muTzEBoaomKF4v6cVTRTNCjRthjqFYsf5S2T0wM4cP6Bqk/2KZCs7Jvusx6ew0YYWxGI1
	 Opq9Umo7UivSbGMbOKBCpKbu7xyowhKX3g4HIOhAKf/NTG3XazGwBVYuw7NfjUSKbjO0d
	 b/LxRcl/SM3vrHvREr0sXdhGYOUltCYqCiBe8NweXIYYCzJDLbHh40oV+cpEN9XxsyoYZ
	 GccIt7dA1v4ewQnOfDbOqhCxNsc+Cfx0Hdi9eKlcFXlkmutim9sHj12WiftM6uAreig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=HL5uLzsn;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F8F606D152
	for <dmaengine@vger.kernel.org>; Mon, 23 Nov 2026 14:54:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1F8F606D152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=HL5uLzsn
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-49465892f7bso2474784f8f.1
        for <dmaengine@vger.kernel.org>; Mon, 23 Nov 2026 06:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445649; x=1796050449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FEdGm/AcXh2womt9GiV7Pf7HrO6Vbc46kckpe+SSelU=;
        b=HL5uLzsnZ0HLGVR9tCA2U0cJX9QOExXCdawGBp8kA/TdqLrTwxqEKO7J5+0hyIpiqw
         Q6vXaVD9pW6ZsRoOzUdxG5bhK+dKc7P66U0qcMArv6mMI5cWA+2NLbEIGZJ2NXAum7Qg
         0+gjxCFuE1HvC3IhRJQcTZv0UKI6f3HPWtx5/sqmT0wBmaKU9fXvFN7XWSwZjsmv4ho2
         qLFT3lS7Li50VOoU81rpMkvgGicgdiaSXZ1AxdwiDW4DzsB0A2yR2i8HxnHIX6HqEL1L
         DuUXLdGzJCT62dBdQ0bGBy/IqIuhHeHJXgK3g3wp/PsuVAH5Xbbm/tD2KMzCBfEGCPdT
         sh+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445649; x=1796050449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FEdGm/AcXh2womt9GiV7Pf7HrO6Vbc46kckpe+SSelU=;
        b=n32relyhIIVknHaFffVGSZl2QvYBj7bHvUho01rppMWUaDj61PhADdnTtC/r7gRMHO
         uvsmeB/vCywbLeaGTu/plh8H5trfL41r5AUQbvXRFBj+wE5JpHUMEfNk6/Ulz0nvoXVe
         ODm/k62uUgM7cDakKgMtN2sx6w5R9J8bIe6Ig0ojjYpyZRMBqkE/5dZZlUtUfHbf0Vrn
         CI+kz5IxRoYQLqmmEgREtPcv8jZlFYIswy2AhTy4pq48U/WFw4lz2rWAOXnbDltiultt
         jAXBjmLDVRscKfWfy5bQv0DhrABb11z91AuHY1M60LU7oNIq307d/vCiJMUfj8khiYjf
         +Pug==
X-Forwarded-Encrypted: i=1; AL+hErGwUbkVSeLyjtkpt0dEvYijc9reXQ1uKneFdpm9hVlfRUhq0jop5T8mfIalm7JaRdtGJY0m/EIM20M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/B80gG3/NqBeN2CMt6QyzLpJwrKlVXArFyiflwWaD52Lo+oTx7
	A5s/fRzc+33sWKLsYGu3O45nk79ngz665eh5i3M4PCl1MdZxsWH07TSVNgbOG5xfCpg=
X-Gm-Gg: AZFdTZcgFhHPSryXoWJqeq2dRtMYfaUnQ1vB17KJf0lBw/bNoGbWGLISl0Clb6vu2Ak
	hy16ibEpabz1OsxTFDKuk0t7V6wzcb7XwzXDcDMblQYqu+pmG8XNN+hp595C9whGbAau1rsnGFo
	8dbf2Vnb9GiKN8W7DU6EkQoiBerYLNFIP3C0JcCkQQboRBJ6DlThRlQEz9SMhc0Ef+aQTZnXyym
	Q+QB5woDpWXJUP3ZCTObQmy9A1H0ayr7miBW+1YDJlnRATPA0n2DlBN86AN2xLyPy8yVrHyZKQx
	WiIPEXdxzdKm1j9mWv/NVUoPpw3R5efPykcL52SO3UZzgw2+8Q2O7zwgdjUGK9jPRjtH0bslyLz
	DR2YRVUMOFHtoDWFpEYZIWOy3k92xxhpCucUsQKAAKU9gqWLsxw5YrycwkttWCCXec85XdNtcWJ
	2jHANexMvvrJRm7iFfsQMk2KACFS3GWP/wmT8Z4XoSA4+MCp0JgB4QieCEfCzcCpmn0IR33wJjE
	oFKOWLMbBScAHYZtUiUA8ZRr3DzP6IrN49A4V/hDDLF0C7zd7fgS1wjOemGii9wPp65Jb3Y4NfC
	r5lcFCEPACDQnFxTOt7QtSwxsV4=
X-Received: by 2002:a05:6000:4617:b0:487:27f9:840 with SMTP id ffacd0b85a97d-4abb59e2898mr22790459f8f.53.1795445649226;
        Mon, 23 Nov 2026 06:54:09 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2052c8sm22701444f8f.41.2026.11.23.06.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:54:08 -0800 (PST)
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
Subject: [PATCH v3 27/28] ARM: dts: broadcom: Set the DMA flags of the HDMI audio channel on BCM283x
Date: Mon, 23 Nov 2026 15:57:05 +0100
Message-ID: <20261123145728.29082-28-andrea.porta@suse.com>
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

The upper bits of the DMA specifier of the BCM2835 DMA controller carry
per-channel flags, which nothing uses in the upstream device trees so
far.

Request wide (128-bit) source reads and skip waiting for the AXI write
responses on the HDMI audio channel of BCM283x, as done for years by the
downstream Raspberry Pi device trees. This reduces the bus traffic
needed to feed the MAI FIFO.

BCM2711 is left alone: the downstream device trees route its HDMI audio
through the 40-bit channels, so there is no established set of flags for
its legacy channels.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm/boot/dts/broadcom/bcm2835-common.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi b/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
index 39eea8ce1058..6267f0a67565 100644
--- a/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
@@ -130,7 +130,8 @@ hdmi: hdmi@7e902000 {
 			clocks = <&clocks BCM2835_PLLH_PIX>,
 				 <&clocks BCM2835_CLOCK_HSM>;
 			clock-names = "pixel", "hdmi";
-			dmas = <&dma 17>;
+			/* DREQ 17, no AXI write response wait, wide source reads */
+			dmas = <&dma (17 | (1 << 27) | (1 << 24))>;
 			dma-names = "audio-rx";
 			status = "disabled";
 		};
-- 
2.51.0

