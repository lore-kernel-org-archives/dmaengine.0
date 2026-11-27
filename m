Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781950;
	b=VRd47BCrNH0zMrSLYYanWpI/duBmUsVZlZzX+4Z+mUPe3JKHFmLwVy76KvhOecG9jQ/b
	 InPzIFfABnOlYLlifoSsW4LLqh6dXYDHSeQyjIpGb3i9OxSvamzFCpk895DnVbbpsBcYc
	 mjvsy3efEJHFLmAPL4DUhMKAVqrYX8uvUBg8kiBKB+570z27uN/EII7Z1T18MHkhXzrIU
	 o3a/WI+JhPFvnU9wcotR5PzvUZAaOmASZxIbf7i8bZQKiSHyy1kskGuqqHJrY7vskPOIl
	 Va0eYARMzJnfuBX/zSUHY4YppI+XRrswdZjm/KjAJyM6G3E5CaFqyxnuRa9DbwouFSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781950;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FJiexXTSlxEVBWHHiNKT7/m3bjHZ5GMDcxr2m0W45pE=;
	b=QqGSrln4Q+No6nxC7lqXsg9+uBoo9WCh9T6oH47FK8vlSE6hHOSaqLHTNI8D9C8GvNg3
	 Y9UXzpkblBF29a6cc4brlwWQr/RcQWE5scshPkImx3n7sLqoDKwlV+NekcBV4Hj/ijnIV
	 AhAz7AKWv/psASXzasIPZZjvgXXaeSWVGYsanIW6++0+KIXDhh+x1yKJCDnsb+pln5XZd
	 oL4UAHLjq9gyburjQh64y5gufQ4U+li51GUjPzXk4DibJZFsoATw7PQyOyYXL4Mzbhw7L
	 mcziBpoiCAXRWmR47QAcP16Jcw3/wUFOJBlNmOs5guKfdzOARKtBm334a6y2+SHnAJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Getvt7G8;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A7D60A6F59
	for <dmaengine@vger.kernel.org>; Fri, 27 Nov 2026 12:19:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08A7D60A6F59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Getvt7G8
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e47347279so4907037f8f.1
        for <dmaengine@vger.kernel.org>; Fri, 27 Nov 2026 04:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781948; x=1796386748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FJiexXTSlxEVBWHHiNKT7/m3bjHZ5GMDcxr2m0W45pE=;
        b=Getvt7G8eSb1RZwibv5o6nlKIuLl1gXVHyInFEKgrdAJ6qq3zNyopzCvxUWXIpXhm4
         xFFWCfUdr11s0yKnQpNP6qNVchSShrzhF1QJ2FN68h97Gp+dYJyboN6QMUNy/489N7NB
         FqOQh4kB11N7qhxxgGe3VPKsqPZ4eHWitUDQLYhv/Z9fl1nKg3p17LRRwPV48RLfl6N7
         Fwga9PhbLkSIOK395H7PsiENgdgBobIq1nEzg6zzwuU8OJFS2Vm/fG1vfuvnnOpRrCXl
         YX5F5OhLU85nyqa7B1rSvMZmlYyfmaMpSif+weHnNiSZ/lsZv0sGxpBrclxKpTb5VY9c
         noMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781948; x=1796386748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FJiexXTSlxEVBWHHiNKT7/m3bjHZ5GMDcxr2m0W45pE=;
        b=OK5g4HhwG56YkkQGLcXBhiWUz+2ks8Scws+ZHM8OkGmr2DOePqva8YzfAIdXWUsUPv
         B8db3o+223Nzl5dLB6P6GNR5k3+liA4l+2CZnsme11OZLnwP+qkXeI13eOeC6Zwm2+wQ
         oi4pfoc9svZ6YREfjWRBjjUnjb9pwuO0W9LP/YXzwZLhIEHCYcxXPrljmmL73eFzgYaq
         prBgTEjwYlEsssYFfGBw0pkVUsNCALL3kq9P2xLxuR0dOLNV8gSTfWpcev0vRYBM5pNE
         9Ig+Y9YIjB0Gxt1U4eoXUtoUrW1+tVWj73SUw9vmT6FxYTyuck6czI8QuOyuQrU4jlPg
         EPCQ==
X-Forwarded-Encrypted: i=1; AL+hErE5J2MapfZnb6rQmnL+0pg0ZOCzzF44GlbmlIEPIjMR7IODPtHjwjxkKWxTvzWwQAitmnpShGlbzVE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9TSJ8jIzusTKUkOzTw4ii0rvJkRe5X4TX2zcy6G/2P6HDWUN7p
	TRtTMx/vKGtPSc72vGsGAr/jd8MZY2vp8qk6DuQdaluWUDyQGOWK1CrnKzU9VKWNqug=
X-Gm-Gg: AZFdTZeqIfBEG3r6fVsccXIdFdULlFU+8UG5EXyZ0vFsiEEQh0RCbtGSd1cnIsVoq2A
	NTSOMB4FQ8AUT9z4M8dD6qt17sOHwyTa/zg3IhyjKyHD1UWXGYNW1p4VLpqtSqE0dUKbno+jqkX
	QCDoPqkTCWXMwpILOpLJ3x+NvqPz8OF9J+D24LnZObfIMxqyfAT25LBJgVX3yUImrT54aZfeNpY
	3l8qzLasoTr9K/p4/gLewkgCEYi9H0N5r1ekRgoZdy+axRXyVN1AWdBN9CriblTBWXe86ZR6UwL
	rxByQwU92NoanFTMmyeZjpxcZetPK3C8PGWkxnanTIjdWeeheoiBasyLmb0o/NDpNBSwLl6rK8U
	IHfCd9goNBJqgJZyGK/TRq8JKESWLXUQchiec9rNVHorwntfmUqNn15IUqpF/Xgni/ayDiurcyK
	F1vMYC/ExNq43XujmfgmXlD4JmGq/acHBpk7DlJJIhseo2V4OdRzF4SVSGYYJ3c+NKvpIwnwref
	Kbmr8cP73U8GC1gHb9zODqZzDQS1qALM6ghNHp0e8mAWycpyZV/+KgnjnIOVbmpI7WyriwAe3jV
	FB2VOaKBSlCcCj+6Swp7F1v8C/GH
X-Received: by 2002:a5d:5d08:0:b0:4a6:4f91:284c with SMTP id ffacd0b85a97d-4abb83116bdmr54504811f8f.51.1795781948269;
        Fri, 27 Nov 2026 04:19:08 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm47947814f8f.3.2026.11.27.04.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:19:07 -0800 (PST)
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
Subject: [PATCH v4 19/28] ARM: dts: broadcom: Describe the peripheral window in dma-ranges
Date: Fri, 27 Nov 2026 13:22:09 +0100
Message-ID: <20261127122236.4976-20-andrea.porta@suse.com>
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

The DMA controllers of the BCM283x family see the peripherals at their
VideoCore bus addresses, i.e. at the child addresses of the soc bus.
This translation is not described by the dma-ranges property, which only
covers the RAM, so that the DMA engine driver cannot translate the CPU
physical addresses of the peripheral FIFOs and had to rely on its
clients providing bus addresses instead.

Add the peripheral window to dma-ranges, mirroring the ranges property
(minus the ARM local peripherals, which are not reachable by the DMA
controllers), so that dma_map_resource() can do the translation.

This does not change the bus DMA limit of the devices on these buses,
which is still given by the RAM window except on BCM2835, where it is
raised from 0x5fffffff to 0x7fffffff without affecting the DMA mask
derived from it. On BCM2836/BCM2837 the highest CPU address covered by
dma-ranges grows from 0x3effffff to 0x3fffffff, which does not affect the
size of ZONE_DMA as there is no RAM above 0x3f000000.

BCM2711 is deliberately left alone: its peripherals sit at 0xfc000000 and
above, so describing them in the dma-ranges of the soc bus would raise
the highest CPU address reachable through it from 1 GiB to almost 4 GiB.
On arm64, of_dma_get_max_cpu_address() would then no longer be limited
by the soc bus, growing ZONE_DMA and the SWIOTLB buffer beyond the RAM
the legacy DMA masters can reach. The legacy DMA controller of BCM2711
keeps using the ranges fallback of the DMA engine driver, which yields
the same addresses.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm/boot/dts/broadcom/bcm2835.dtsi | 3 ++-
 arch/arm/boot/dts/broadcom/bcm2836.dtsi | 3 ++-
 arch/arm/boot/dts/broadcom/bcm2837.dtsi | 3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

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

