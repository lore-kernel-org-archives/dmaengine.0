Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610451;
	b=HqT8sgUwuwXJ3GhdSjyFsNA6zNODH5ec3HE5Sw/u9q2LPMHi/usdqwqTSqVBALbpm+ja
	 SBql5k5uzXhy0CaO1Ga37w4jI5QsrvfrpDBkt6QxSSsQVZs/UVW092SUn3o95SpOkRv4G
	 ruVt+IQQq/oL0h/gKdy/nhROHn8L8+VqiZcMD4b0vWfrmVDIeUI7CnLacJiEqlKHbfNS6
	 cxtW20QjgUqJvRjKh4O7UmJUXWcs2oVN72USNq4gfIRBPqRM6vn39mMaX6rg76rdMXgZw
	 gUBl/8gp+aZoRVoJHc6tjQw14cf+VBjDLgOWV9t/INVPXFjk1FUVGMP5ml9/4AZhj0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610451;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aQeMR6moZU6rMmQ102B8sJtQ895cbKKrODc45qACMhE=;
	b=sudkzBBHhtzJi19EbvoabjBjOhNkNFp6HLlA0bkrkJ7Lt3E0+yetHWScHGRhf3+4eGVM
	 SsTLAH0SgZukVL2wKhzPuSP8DhSvhz4SbMskdw+vj+8LZVpGCQIRyu33zosqLyZVBt1rM
	 0ow4jaxlX7PKfLmjDZAEINMraVhZlqM+HB3UUVPmdVohgO4iFz917Clw99QXRRZeGLKqc
	 IM9ox5H04a4uIKVa4FhrPXSLFg9mEQU18sBaSwyyx2oYDFkqdLxbpQ4bVwK4eBmp6XUPz
	 Iqz/BzmDVrM4tG3rgC9GME55HyYY9MIseLx4fwnXNxnwM/e5QCudYx+MPaJPkWUNqCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uoc2XBtq;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C5B606A32D
	for <dmaengine@vger.kernel.org>; Mon,  2 Nov 2026 09:07:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0C5B606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uoc2XBtq
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso17735925e9.1
        for <dmaengine@vger.kernel.org>; Mon, 02 Nov 2026 01:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793610449; x=1794215249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aQeMR6moZU6rMmQ102B8sJtQ895cbKKrODc45qACMhE=;
        b=uoc2XBtqKfZ+hMXPe3UCuX0BRP+sFw959+aYH2jbGIYYhxkcYv2h/KoNuiy/0Tiw9i
         tYyvMOrbBaRT9m/PqT/9zJrFNkpZfJvH8OZoj281PsijCoJgjAU+qRMWVZEhtK7uZNct
         7xnFztglEUxPcbMnrUH0BQhj50VggeSQQv3rgs9lRYS+Gp5cIbhu1kBEaoajF2Agvh4v
         YhvBnU8e+enhVLMGtBuZ56vzWL0dSWgY7Fi+sojZpMK+Upw4xJRdpAfXbBpV+O1JqJDw
         4XyYsG+kWXFpqoUDRIZTp5mnP1uOSILbyq+6ChKbB3V+ybgYs+NjNISPY8bv2gIe2Dik
         74iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610449; x=1794215249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aQeMR6moZU6rMmQ102B8sJtQ895cbKKrODc45qACMhE=;
        b=eHcSPxWoN+FOUZ2vrl2gUEAKVWeieEIRmwO0eFZKbib0HDvcwbj8AyTG4GGHUJ0ZCl
         VL4mPYfWNluP5e9gwHeALCyRy6lrflKprQERXceOqPV2YqI51DuU3stAM78dXMBEHQg+
         QDSaY7Spkd7xWFQUBpfq9Q7yaCCc2uTt/zYWX6UD6J/6FAKPQgPhn0bxw17NfpbJBEYN
         kZqJmjK+rpkMXdQ9AaAlkwEIeGcXDzZgUA19NGUzbN47qx1LihMHOtIY/7S0BhOjDtr1
         5jEjQMJP7/8IxoNfRCM9aTIGjG/NNs7pLzyPsaVQyGWO26Tyr6sl5qdHV2ITVHiPPwOt
         1EDg==
X-Forwarded-Encrypted: i=1; AKwUvBw1F37qT5l+UG+WAXYklx8sH3FwaB9gmFgH02Q4UhzmTsDvjTRXmzKDnGSaQ2U/amX33Keyfjj8YA8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLgTRvnV1Q9ZIRP0G7Bd9lrr3HYo6z3p0E1b+CtxS8lz6EUf7uH
	PQ/DJm6gti+vzsKuSbBfdP9nDJOO9zOTyDnIANF4qe0ka/C9EDhQ3cW6
X-Gm-Gg: AYBFou3MWRohi9Z9I6gGeB6NiTdW4VcblIOzKQMQG4ArHoS/niCsVtyCGZxvBlWqTub
	FFi1BbmlqrULHYEbg2i4ES8Z7Mqj/wRCChr4iV2VRPfUwMZL002lJUpQevKI7SBP4UitMNbvS2Z
	1GXZHAuGJ0COawMpuNx3m6qKbSWnot9jfwE+34tkh+lXJWTTScAZ1iqEWIwcLTlWQLKh6slPZ+U
	tXS+NF7gYELTVsh4eBC10ZdMLeAfLX61h2Dw4W6cDagLLeVK8Cg15rO0h3RPc2RBKXUahjugPrV
	v8HM11tL0uQcdlYfW89yK8RYXLjbRi8Q3tCAQMcrbQy9aoao39DRk5wSvthCsl2VUp4iKqjNycw
	nJu9LXb0/PrUFncnnXSzgKbYTyCmCzt86P2Fyz0ms+nddRK5RhYaHsqbt6hGS0642RIxdQwXQFH
	aUcoodVcQui7zIGxST+r4c1fcHz40PXQFbYGaDoQyTJQy2OJ3qgAS2CpYyTt95wks681td1ndr7
	U2excgjbLK0coKMLL1OW+JKZJowfTFi6tum0teLbkBbZGf/dQfASd8++4cipAoZ+1gC+bxscH0q
	UNYxRGEYOJ6MKcYDrsX2elglq0SxPWKyq64SkA5DILpF7RATDPo90ziAxn4mqyRTH+bz/4CRtcJ
	LKVP8L/u5HW7YxrJkFpHE/ZhdCQZu6pjlKF5dOL1NYYd7eF5znWEh9ZEdbeXE8M2w2m9nbI38+b
	vCNphevYvEsUoh
X-Received: by 2002:a05:600c:540f:b0:4a3:18ca:806 with SMTP id 5b1f17b1804b1-4ac17d1a1f1mr235827335e9.20.1793610448975;
        Mon, 02 Nov 2026 01:07:28 -0800 (PST)
Received: from cypher.home.roving-it.com ([2001:8b0:fb11:0:3889:86e0:d449:e2e1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm417879945e9.3.2026.11.02.01.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:07:28 -0800 (PST)
From: Peter Robinson <pbrobinson@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH 6/9] ARM: dts: bcm2711: Add 40-bit DMA controller
Date: Mon,  2 Nov 2026 09:06:56 +0000
Message-ID: <20261102090713.896324-7-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102090713.896324-1-pbrobinson@gmail.com>
References: <20261102090713.896324-1-pbrobinson@gmail.com>
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

Describe the four DMA4 channels (11-14) of BCM2711. They sit
on the SCB so they can reach all of memory.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm2711.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm2711.dtsi b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
index 5e3b4bb393967..9d70bea17b11c 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
@@ -602,6 +602,22 @@ genet_mdio: mdio@e14 {
 			};
 		};
 
+		dma40: dma-controller@7e007b00 {
+			compatible = "brcm,bcm2711-dma";
+			reg = <0x0 0x7e007b00 0x400>;
+			interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>, /* dma4 11 */
+				     <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>, /* dma4 12 */
+				     <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>, /* dma4 13 */
+				     <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>; /* dma4 14 */
+			interrupt-names = "dma11",
+					  "dma12",
+					  "dma13",
+					  "dma14";
+			#dma-cells = <1>;
+			brcm,dma-channel-mask = <0x7800>;
+			status = "disabled";
+		};
+
 		xhci: usb@7e9c0000 {
 			compatible = "brcm,bcm2711-xhci", "brcm,xhci-brcm-v2";
 			reg = <0x0 0x7e9c0000 0x100000>;
-- 
2.56.0

