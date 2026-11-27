Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781963;
	b=ukzCJJgKmC+KpoOw9ydorxc7ikSOiQwzb4MYv+PkYkKE8AhngIv/qwa+7vXw1NExUGbX
	 /bc+i5hTCzlPwpGw2w8Mgr9JCeVSvAA8kQ1lK/dralYrJ8YwKOq7wbcETqe9GkAgkucic
	 MC18WWtrRfj84Ygx9pLTzQS4SsjAEkkSRa8LFAuoJL3vWENdtxWHevlrBI1JC5XC2F1OA
	 Fg3O6lWRoRr9xFORbJkHii9LBizKTx8o7du6Bv/nw+GTVqvHzjKLqyyqD9udo0kpr3Sm0
	 kptmWZRFU2gbcaiOBeMDieYqi8iTDSjm0H8zp2ShVrbE2ydeyMULs8+U2P1al7mF1Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781963;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TAUyWjx3s0iBrLHwbOuKPkGMyzRErvYGRD/IpYm7O+8=;
	b=3LvQeFfv8OUU2+QL5wdIwcAksb9r9kBK9V13jhSYpHtgM+7Ax2dQS7jnRSR/ekVbC+FF
	 OupNM5MS6tqng9hTmQ2ONDMGxju7C/OjGY9bF/kaIvW72qHpjghftwfkf5dViQx16gne3
	 2lCoRiux67hKtvCsn9dY34xu3EsLDpBChf/rLd2wkYt+z7JFWcx8IARTKLpKcQBsXYrx0
	 v7uusYDkoXJbFUqTVuzONgT6C67CqBMcW/2D1/YkaPKwI7G7brWnkSODAsgBaRv3hPSUx
	 H+RwwxEsnZYlnSzWpODm57A88m3ML3l6tfRByMqxj+k+qJE02ev25pZ7Qz3hgz/sO8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Dbs8B15w;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA7F606C6C7
	for <dmaengine@vger.kernel.org>; Fri, 27 Nov 2026 12:19:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAA7F606C6C7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Dbs8B15w
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so82160445e9.3
        for <dmaengine@vger.kernel.org>; Fri, 27 Nov 2026 04:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781961; x=1796386761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TAUyWjx3s0iBrLHwbOuKPkGMyzRErvYGRD/IpYm7O+8=;
        b=Dbs8B15wDQXL/Q+K8BykZJHcbFbvg3b30M+fsU/e9aYvv1qvCjPAJVtcmwcgsUBmkt
         UOBZmmcytY+/yY31YseBCFY33BhBHE2iFQ0NR5Q8q5wkk9O8ToDSFTdPz0yS353J0Xss
         qYGzL25GQ6NC76NdGdbi4clxc3n9t4HQR4Nsj37K/frX/pBRn3TBfTUlwMq5oO8w7AfG
         fwz2ny+xEoAgkO9IVsc43XvF63xyBSbEy5+4iTWHG42c87k71Mnd1artF/HyCdOPsiNf
         rzuukal00S+xnXTK06V2gWj6i6lo+iF0bnJmCnWq1kV+hEOiGuUP/0eA8NQQ/dz9OUEv
         rs7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781961; x=1796386761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TAUyWjx3s0iBrLHwbOuKPkGMyzRErvYGRD/IpYm7O+8=;
        b=0+7a6+AyjBUHprUJFG/pwX8xC1PAwT71WP8+js/+TSuIFQF4elByKcSUEeT4fXy/mM
         TYhGiE/LWtvJ1orccg4fpawpOHXeqO9xjciUEYxI0vpRXC+kTAIWE5Ki7kbSsNJQN/kz
         vxyFT0XLjNRxKXhdt4Fk50Xumo26C7PP+PGryOyjyVXXZrkEhONDwOD2nqth5UhtxHkj
         sYVPN8K1UJJKRR6aL2NaTPD6L78+qAO4aHXTUluuanR8MMdMsweQef27K1Sc1sQ6CZwZ
         J/SWFzum423UdFkmHHS35uCglgWewV7EL1TTlAkgcrLTuGaGOZmxNHz1ZOp3+OgN6NUp
         igKA==
X-Forwarded-Encrypted: i=1; AL+hErGeGpLGARc4ZAk7SR3BVs6SZ3Vz/3zLDYYl/dfxpLtaIB+gvgwnotu/WlUpgh6AfZkPUn6Gd8am1jU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/807LfxYwdcStHWOoDFATb/1DcKHucs9kHg1oD3iwowO1DRFTm
	0QVsDLMdzfRRw/DntZM7d6wqvHxXRISkK72Z61a7OKVgXnZC0l2fEYfMBi/vqU9rrb0=
X-Gm-Gg: AZFdTZcWD983C7Fpbtb3KRhJwy4PGTUhpc2Q2tvs5iettwtjI4ui9noqnKmRIT7QezG
	qN7sX5KTmRpK4FhJYoHIU2ZHOu5dLM6beuSyvZp75U0uwiBUlclc8NJGW4G0F9DyBvallTbRgv9
	9RvOaBWBj86Bs0VNKTz5Lqbz+aDHP4qH82GiWgIzxXs5Yp9cJE0MYH8pSy2wC1tjbPiM7KyUiKR
	Gpz82pfpRjTpj0+qEmNWdanS9Fyojw/UkZznB1g1jCBESRcYmtIodzG+LpfPr6wMARTqv3Zzb5M
	9xRlPoTQlN4eoH4bbWQpmUEFSAOzsxnANJKnYOFOtk08bglfhZ8G8WHk/9s7EGharOcyiPQZV1+
	Wy3D6Td5XqIBr6Aa33A5jm5zMao4TbFDQiYLTB1S4oPBTiVFBRNlV66SrYTwGSMhmG/TWNaILzG
	GWdGANARJCVL2neQvdAFzwMFQqe4dnzSaNLqa+I4sSDDUWOS8+9dfObOJIa2UGhPZ9OS6WHvzSO
	QkZ+X/QAdajkKfY4yKK/ZWjYXam7WGdvjPN/B233D6fafwuDt1PS8M9lKFu4oFRqDk8LNmEPoMr
	kDeYV4a5IimNmoxJ+YoITiY5hkCAeQtGJnlFMx4Jds5zjH2+MA==
X-Received: by 2002:a05:600c:4e0d:b0:4bb:69b2:d3b3 with SMTP id 5b1f17b1804b1-4bb8881eea5mr489175485e9.27.1795781961245;
        Fri, 27 Nov 2026 04:19:21 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90655f5asm451150685e9.1.2026.11.27.04.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:19:20 -0800 (PST)
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
Subject: [PATCH v4 27/28] ARM: dts: broadcom: Set the DMA flags of the HDMI audio channel on BCM283x
Date: Fri, 27 Nov 2026 13:22:17 +0100
Message-ID: <20261127122236.4976-28-andrea.porta@suse.com>
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
 arch/arm/boot/dts/broadcom/bcm2835-common.dtsi | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi b/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
index 39eea8ce1058..77c7c13014d2 100644
--- a/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
@@ -4,6 +4,8 @@
  * bcm2835, bcm2836 and bcm2837 implementations.
  */
 
+#include <dt-bindings/dma/brcm,bcm2835-dma.h>
+
 / {
 	interrupt-parent = <&intc>;
 
@@ -130,7 +132,8 @@ hdmi: hdmi@7e902000 {
 			clocks = <&clocks BCM2835_PLLH_PIX>,
 				 <&clocks BCM2835_CLOCK_HSM>;
 			clock-names = "pixel", "hdmi";
-			dmas = <&dma 17>;
+			dmas = <&dma (17 | BCM2835_DMA_FLAG_NO_WAIT_RESP |
+				      BCM2835_DMA_FLAG_WIDE_SOURCE)>;
 			dma-names = "audio-rx";
 			status = "disabled";
 		};
-- 
2.51.0

