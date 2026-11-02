Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610454;
	b=ZJZhwpNPM8BzO29fWCM4vpxdZVeKtzhdb88evdcuDrkOQSg5mjgznF8WG6/UDg3lCpI1
	 hE4MCg4UxF+8tJPI0ZlQqkAXtSGfdDesse5V6W2MA5z1WxDPB7T31KW+vdgSikSFfhHKD
	 wxFlgs31dFdQUcHEyrfgZsfvY6PKPC+my+fF/b/sjqjLhGOoo9Ogix/oYG/kSjbiG4MnS
	 redaJ5OWrPZIzsnx9zjuB/aYmY9qZ/MV10J2+ZnH/TJzHN6/vp+NQX2CA1C145qUyL4CH
	 rrGi/kFUlg/mHT0gtFA/QzQcyGthnfmfcYC2xhY4SRr1AalGSHoH+Ti+IGAXSV7wt7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610454;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ca0mm6wOincCYsxFkpZ3alJVNygD9weGLU+HWZOKny4=;
	b=nW09NHStC1M3MUQ8Sd/6aMqZ5xViwEdjYL/VMDIpFkgUgdH6kHQb9JYwAKrztrr+I7c2
	 f4SzIiuKr8hnEYN3QSEvwayUlfeGcWbzXK9UZf6lbAAeRbND2RvcgOfCaV/wQWIjbOOKg
	 vbBcJhWhG4khexAwkYLOvhU3PtBcmhMBxHHGnlBn9VlG+WbbiTH6+ENpWdsZ3/FRVNwnj
	 wpr9pqN48YQKFr54VvPvPpD1DxQ9FWYgU6HRgAY8QS6y/MpqVMpDZgQxVXSG+yc4Q/PLe
	 +T3Q3aySNNShdffDImcm2dDvMPs8wO/HgQo6rfoi3h5WYBcm4HZNteJSN2f22usR6Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PwPzx3BJ;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135F6606A32D
	for <dmaengine@vger.kernel.org>; Mon,  2 Nov 2026 09:07:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 135F6606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PwPzx3BJ
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so25061995e9.1
        for <dmaengine@vger.kernel.org>; Mon, 02 Nov 2026 01:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793610452; x=1794215252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ca0mm6wOincCYsxFkpZ3alJVNygD9weGLU+HWZOKny4=;
        b=PwPzx3BJSz/awoGWU+IZ3UQnFFWPlLmyalf5Y2n1KQbzx9gJl1U6leoC9n0YQvl9Bl
         x0MuDsWZCQeSdGqXgPei4MFi+Ax3C9Av7eLm4GRkp4ThZe2QFIOO7C4sQw+S05sWgiIP
         cmyFfa29Mxb+CslnWdooX7DcqAbRr7Tn5x1l7hXZhI2w1m7FGd5nHk6u9nqEcx+gzHPS
         xJVFie1OMTy0c83K10SJ+8geGpkNd6Y+oPGiOItFLm4XcJ577p+yr/OYxNGUu1zyO+TT
         23ZJ43dTyUJEMKafAv8cYaF/6JV8s/fh2/prewqwjZwum4Xug77DvgMXXG25TG1gDJwZ
         L6Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610452; x=1794215252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ca0mm6wOincCYsxFkpZ3alJVNygD9weGLU+HWZOKny4=;
        b=SJxltmgN+J3DqZEn12oaBghFr265MSZPPSJ17b1Hp2uwjMr4ovL+Ey62Exu7XFKkX7
         H2SqNmTOmVYN8ktdxtpxtGhMC5uqVuXj2TBiYTvgZFiMdXM80kNMkhjxjZi1fqIhHyZk
         OpfC1jjmkOfN8eAoHRM7ifVzwgjlpBfzMxsxV1+ZL2v/auyMyoTXW+uvVzWIA4ArM27D
         tU6BOhKMSHXkJqF73h8DJBNRreF3DQ2+UF4QeHzdXPu1xpM8SMOJ5cRNE+yVO2I8sgm+
         EYz00EWih/O/vDZULPPjUyQ6wVsVfS/lCqzmlk5/95NHL/TGNPOXFvIMAGEIEslU7yp3
         p2QA==
X-Forwarded-Encrypted: i=1; AKwUvByByPIkxvVaKMFRMJBYk7JHuAIT7gWN67rSBzUaEM2GZSjWYd7gPMGAK88VndLdULvCTPreNFpngKI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKxB6xGl50sMSmLct+4vvf+vjd70l/CS2+oJiFPmHjjjJedG07j
	nAvtyhw2lXuubOJnTjBOczSoFDWZY2kxNwk1BuOLmKEFMh24FCjwSDlo
X-Gm-Gg: AYBFou0AYh4JCu7Tw3LjCtcVp4Hx1UaY5RTevdPJ3xNmJ6xgL6k5E4fRylWQAMi1atv
	4ZYe9cofFlJwnm+TfBcIUqcZaEOuYlU0xJQAU9eENFEdL3o27AvQBU2SEhx3aE+gtAwlBJHR9TQ
	xthbQr3AueMQd7dxhnopJgTMgSAjyx9uTk+u0e34uGxvCL+TgUaVVNvC3j/O8YH+y1C0x0tDfll
	7LA4QobPHCpQ+Yn/80XUvRDJaiTkiiol0yzPch+bWPGITrxqPVDMXW82DP/3alPlPWz5WOlZ8fm
	7nElvf4CJMfTfNAJsBzqHj1OZN+xCDjQ8xRuNSGgns7h+K3q7IxF3ySziO0MnJnEj8idHN/DF2a
	AkMZ4T21fEyqehUz+C/5eLHkUmN5KKOFPNHi71SLeK8tFXal/lRlqSh/P80wwmIlwYSU5UrRH1n
	za2RW22kOHCRmqq47rgM/WSoSNOLVdR0dk3RnfLUMq+544cUo4MYMt4W7VeqJv7s6BZ6ZrUphFd
	wu2SGZ6JzYi2R4MvniBK1lEReU/t/FHhbyY9m9MFZtUmVyKLypZmhiv8T5a4gTJgbouC89zAmhb
	ogPkf+63EVASxjSrfPRyWQ+xmwjdFPs11eqiyzby9YAF2ayldoK9/d0RiTRKSdHQ6ACnnwAja5b
	cEr5Wq8ppAoPQSgync+uU8Emc9tVVrvRwQqjHy/esDXhwKTG3zoZDZLZP0Kr0gok7bSQRy2AaLp
	32fgp5oXTRu2yr2sYK+Bsgq0rXIKRCyG0tgg==
X-Received: by 2002:a05:600c:5249:b0:4a7:7f3f:6f8e with SMTP id 5b1f17b1804b1-4ac1228b5bfmr210076365e9.0.1793610452115;
        Mon, 02 Nov 2026 01:07:32 -0800 (PST)
Received: from cypher.home.roving-it.com ([2001:8b0:fb11:0:3889:86e0:d449:e2e1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm417879945e9.3.2026.11.02.01.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:07:31 -0800 (PST)
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
Subject: [PATCH 8/9] arm64: dts: broadcom: bcm2712: Add DMA controllers
Date: Mon,  2 Nov 2026 09:06:58 +0000
Message-ID: <20261102090713.896324-9-pbrobinson@gmail.com>
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

Describe the BCM2712 legacy DMA channels (0-5) and the DMA4
channels (6-11) as separate nodes, both disabled for boards
to enable. Node labels follow the Raspberry Pi downstream tree.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 40 +++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index edae2f3584a8d..be4e94c9e7695 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -546,6 +546,46 @@ axi: axi {
 			     <0x18 0x00000000  0x18 0x00000000  0x04 0x00000000>,
 			     <0x1c 0x00000000  0x1c 0x00000000  0x04 0x00000000>;
 
+		dma32: dma-controller@1000010000 {
+			compatible = "brcm,bcm2712-dma";
+			reg = <0x10 0x00010000 0x0 0x600>;
+			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dma0",
+					  "dma1",
+					  "dma2",
+					  "dma3",
+					  "dma4",
+					  "dma5";
+			#dma-cells = <1>;
+			brcm,dma-channel-mask = <0x0035>;
+			status = "disabled";
+		};
+
+		dma40: dma-controller@1000010600 {
+			compatible = "brcm,bcm2712-dma";
+			reg = <0x10 0x00010600 0x0 0x600>;
+			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>, /* dma4 6 */
+				     <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>, /* dma4 7 */
+				     <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>, /* dma4 8 */
+				     <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>, /* dma4 9 */
+				     <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>, /* dma4 10 */
+				     <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>; /* dma4 11 */
+			interrupt-names = "dma6",
+					  "dma7",
+					  "dma8",
+					  "dma9",
+					  "dma10",
+					  "dma11";
+			#dma-cells = <1>;
+			brcm,dma-channel-mask = <0x0fc0>;
+			status = "disabled";
+		};
+
 		pcie0: pcie@1000100000 {
 			compatible = "brcm,bcm2712-pcie";
 			reg = <0x10 0x00100000 0x00 0x9310>;
-- 
2.56.0

