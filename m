Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445650;
	b=BgeEzRiDUb1P88TaItQhd0wDiMp12OAMJClHAjZ0UJDvQaKYIQQef0sM8GszrIn0Vcm3
	 b6WRlQOrcpeSDore/m24e8iXnwbE818jeO+rn09d0/vLkt7/J7JYRWSqYxPDTpk2nNuXo
	 84kmyfMBALScjnnRFMwas0wwY0oNyzNIHvxxKfFoKcUw/H4sk0QgI0OjT5GL46Sj5jxqJ
	 6fRf9ExetbKAn/R7M9Z1mzS46E3slN/joHSOWtV3WVN0fNYmsPMai0XkZig2ucUnMTRiI
	 Hu3yCLbA/qSoZ3WIwmdYFnEk7VsI5ZwDFcJrqvEa953BaQLw6fhqoCLIBpaVmeEftKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445650;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CvCuLCHfMisjweCDS5uzzO6qtUvgznQmoV5SoBwLBW8=;
	b=Gno10pNHjfQ/mp3E8RVpD+NXpaJ3flw4rTPW3iRC6j5iEX+vRnHDr1aFieZGt2tBBNAK
	 9+pXzyvC4BlTZH3RE4KI2S2tCVutxNPKkOgz8n0WqObucGOkfgTC8vud/hIYWK6Iu0+g3
	 ac9uKrswRd9eXLKlP5L7S6NKDSpQAz00CP3PrPwLMpU4ZFOkH9Qw/rxXcA0PTxGUZF3Az
	 iTtxnTfJQ7Ad/dv96ldas9GJ2+xP+0YQ73hMQnlI98oFxdWWyjOVuE4vyog7ktg5caZqM
	 V3phNIWU0c881KVyFIwtTAppVyTOAB5g4NCqISc5ob7wzmHSc3Gidz3xGepcSohXcvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ZHm8I3Rl;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF9860A263A
	for <dmaengine@vger.kernel.org>; Mon, 23 Nov 2026 14:54:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BF9860A263A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ZHm8I3Rl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so32909905e9.2
        for <dmaengine@vger.kernel.org>; Mon, 23 Nov 2026 06:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445648; x=1796050448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CvCuLCHfMisjweCDS5uzzO6qtUvgznQmoV5SoBwLBW8=;
        b=ZHm8I3RlPULgupz8zhDeBLJOtUroOq1eF5fwGhlR/FevpHDlyFVhNHnOu1bYZWhiPf
         99n1B3FA73S5Jifn+cYwa0DOOKKCQgjKC9VVrfKUA/gnXFtOJwH5crYBb7q3bgfWCuqN
         CEXS290uLgButbzC0JcaHHDLZvZ5OjYySbC9T9bauGm65dLIcdXXSglpFk6NiW1tk+wO
         rbLXvEabhaVAQv425dgRqkf/9FM5u69Lk02l2VdzRYqTuSGj/Oeqoimhg8d1ZamyuXqr
         ziNKhyXxj9AFKGvliUYu7VlF1KVJVfCtAqmId4qmAnVaFRawB6jjZXPXNqchSLUHF8ze
         LScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445648; x=1796050448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CvCuLCHfMisjweCDS5uzzO6qtUvgznQmoV5SoBwLBW8=;
        b=bz1MgI2c2nUYTcJUoA7YLzZWhoKYAZ3+M+NLE83VapCvpqcGQiXX9pRA6PgRRaf/uM
         zss6pozMv2GBEE45+RgVfW6PJnb9y8xZP8XJ0naj9LfBwCUJ6nkm3CLdRozU17iBxT2J
         ipy8GruU/AS1Xa/rq/rjbnK24zOKPNafXB0VOESiPVw3N3v57ifvyglmaA3RtFdLiBN6
         aoXXJ1GJRpKbSpKByAuTOIbSP8W7WFI5uzRGme3uIhP5XozFdILKGFRv13GpoRROy5dY
         /3GTmF52hyHnxZOUtED0XKRiRQvLR23oZP0K3uek2byugQ8RUDqfgrfxpgCbUuCjD7qH
         q1iw==
X-Forwarded-Encrypted: i=1; AL+hErGs89A0bqIMyGX91XXWYNqb2D590TWqu636P+D8JZFCCfId1h3mSGQ860NirLar1ykf5IovTuXSp3Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+O+cBxpGB6mjJiI/yBY7bApBrQYRaeZ7NaAXa5NQJIVEXJORhy
	xeKRCN1OTisnyo297b47mwy7kpS1dQAwQoVKTdXdsJlev07AwwHXFdB/4ojc40U4fcc=
X-Gm-Gg: AZFdTZfzfuT4hvSdmybECzCxYsQHgmlTKcs+eGmYUdvUQo9X8PVDuu9rsIh5MUxkMXp
	GqEzRG+bCzVk0BfG4qvVBdkDUPFbSytV3Jb2yGcIHdhmaH/gRYJbcGzGJ21+Ccjq7E8khktNXqt
	/aFHOlKqrpQ0jADliDcgzfyqIdXRZ7n9njQK3f5hJw4xtB6jOusqFmwoGxpmrJtBM39b+P58yxI
	m+Hjvb0n5Bkg/M62VTAd0KVGO85ZyxbDk93fT3hvICzr9sK+88coy+UpesLpMFUQtN7F9i7GFRD
	K5KQCQwZbfMGgbCsrzydrbO5ZGkZyUNGCYsPwdno/ckNFCyfMo6bm7+sKJ5K5cwazS9zgncfOcp
	OEJqVYkdnxGjo+HHN5ciJY/SvnxyjVbYVDjr+1oE+9WiZI9bJ/ke1cmcXS0G7U2PBd65JLT4tCg
	YSiF4lJtU+NSDL9YcXqJZ2kRlbzsynMp4i9ftgcN4D2PDAO1DB3tF5M0bmm1yzxdKZymlGcopcQ
	lwxyF5b5bhGRPIvBzS47lvcTgRzAoLAkA4XaEhaswAPb0DqwU0QAE7sfiitZOxkJ7MW0TCpZbqV
	8bxclI6a+nVTxotNGLTidNY3AFLqBNaejf96TGFbTt9MRBks
X-Received: by 2002:a05:600c:3b84:b0:4bb:6f45:2a6d with SMTP id 5b1f17b1804b1-4bb888074bbmr287799025e9.12.1795445648030;
        Mon, 23 Nov 2026 06:54:08 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884911e3sm422624865e9.6.2026.11.23.06.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:54:07 -0800 (PST)
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
Subject: [PATCH v3 26/28] arm64: dts: broadcom: bcm2712: Add the 40-bit DMA controller
Date: Mon, 23 Nov 2026 15:57:04 +0100
Message-ID: <20261123145728.29082-27-andrea.porta@suse.com>
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

