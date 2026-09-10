Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A43496D39
	for <dmaengine@vger.kernel.org>; Thu, 10 Sep 2026 20:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789071443; cv=none; b=d4qziZ1EjSD1Vt7zisih1YQf1+KtA++ZCjhnlVpj83NXhB7Cm5ujseUMeVCMZlxAgZi2gqtag8piMBkYKVA6pYvyfvds6yMhIhi93Eoyt9yZJPVUA5md/1TmeD/2T5w6Dq90TxSCKCdkWB+KZZjOspoDuZbzSndwvePYeFd17N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789071443; c=relaxed/simple;
	bh=G/cP6UqyeX+HmALzm0d1PxDkYH2O1I4EirGf6HRRVMc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fJ3MvJqQuqTyW6Q+boWy1HaKk9vHpVzaxz37xKN7AUCWpFLutmvqauAZV6zPNqSDK36UNiDbp7fxQNAZL6hqVsdA46snf8Sdji/It5DYfxnGTBsu95QvPyQzjD/ls4nGgvV/B/ZHzmjnUzRJTu59yq9idDmWdGvJcbBbjq8lTrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EZV7sbCY; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EZV7sbCY"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5c675de8e1dso176602e0c.2
        for <dmaengine@vger.kernel.org>; Thu, 10 Sep 2026 13:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789071441; x=1789676241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KwhPXIRNKGfA57MPcx1w8oLAn8z573P69PHwnx4/WWA=;
        b=EZV7sbCYp33jD/jl3q4uqQ8yi7X14EJP1/kD0tdtcE3hwndlhH3/5IQhzgEPvmMnW5
         tqDrQ0r9HffKU+ZTEkzaAMTHQNjUrd/YJvbkg0wspz2+Bg55QxhJsfAXv5eWF8VNU5dc
         pSVR0re44EsaqXOsFDtExv+9JFRHGjeuwaKHrKP82Ilrvet4z+M8yynCUoDx5/JAvrLQ
         y4OplbKijHuuhgz2cMRs5827oSyxquHt5td8ffk+TwQEQf/mcgPCXZxM/ANdb0/splG3
         fqebMScxjSiYeQScT2pCCEGUpIn9cCcl8XouS+T6y//AXTyOV7gX8L2bH0vvsi5h6s6Y
         mZpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789071441; x=1789676241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KwhPXIRNKGfA57MPcx1w8oLAn8z573P69PHwnx4/WWA=;
        b=nCpL6I/5YvKS/mho8mjrcHSOd8jwi8eoyiJ5FAXoopxAtw23b2n/rkvQ57lYESbidA
         24NNbcWqZF8qQRzFgbGXLaO4aIx4MMSXhKlVB1wtNhSjbQqtIT/FWftAWDz5Ztf+m2ps
         57yPmwLLZ0MYAwJBbx4DbmsOovSPWsFxBG1/aIW2hnDMZgI6+RoVnIzP9BwtkFBfn7Bl
         RMKdGWUrwSfZyCc1y+V4JIuy4iNN6MQYnD5CcoRyDGo/NBWvfi3GOwAuMePJnk5dw7TA
         t18Vp58AdMBRXMRITq1N8XAUMdH/2Xv+q90tRGSOSsjj3J3NAF9mLwYiOevqCGLjK9/L
         bHUg==
X-Gm-Message-State: AFuF++mJTzarMZufKGDMM5EeyUUPRjGOBcZSkfuRmISi9cAm1+G+AkWw
	deLy6oqe5ttlYWOfifwGChpZlC73uTU041b9NeQVoqHQnsiYl/823H0aw6ASWA==
X-Gm-Gg: AYBFou21JVG2gHvt2eIBWQqDnLgu4fdrxeLo/QlDi2agAsn9dpEyAYTOGFDOwNj6QMv
	ySxuERlmfz4PjglIUTaSr3mbzV+UqQw9bW1ghu0/24nB6O/zBOTiNqKcl1PuLvHyWYrEPkTUkD3
	krLQuGMxHT2MgLkLaHrTBjjf+p9VitK1EAr1QbdGp+H/eNrthc0KsE7X6ub55WnXwhDM6Zbih67
	7ClqjHqzx1eBsgZh76unwmfpsOYcbNi2/GFzSew1HU4URqBufwhSCdwZAhopvUPwI9udyty83zZ
	nEjAfS0jGeqqTqN/sW6HQ9IKLGXY0rt+6AQtwS+t6wxcnxMPsFp3oI+joFZelOeM21dNRj0CaCX
	865l4F80+N1sdiEuyvRZ7bhIwoKqaudrRSlGKAHYB8EJxgYDiNxZ455BqXEwOY0XWwmOU3mnXzW
	hIV0Up5nlE2BBXzQpqa+LgOSGsnBz6OodKAdP5IuCcXnQW8OLr84ARf+MfijhKHDhb4fhnb+0p9
	Jnt2Uhbubxi9RnRkIUdC8Yki5IZ2z9Mq1LuKET/HUzaPGx2ApidCI9Yaw1fRVt4fP3YRztP0Zin
	iql/Z2HszD2mpMjD1ylsFeIgGX71yIW7YMocVzWjp/hFW/LN
X-Received: by 2002:a05:6122:e20e:b0:5c8:2ad8:1484 with SMTP id 71dfb90a1353d-5c84606d388mr3029053e0c.1.1789071440114;
        Thu, 10 Sep 2026 13:17:20 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f202516sm4432646d6.3.2026.09.10.13.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 13:17:19 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Xuelin Shi <xuelin.shi@freescale.com>,
	Harninder Rai <harninder.rai@freescale.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dmaengine: fsl_raid: fix 64-bit ring base address programming
Date: Thu, 10 Sep 2026 13:17:17 -0700
Message-ID: <20260910201717.44891-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver claims a 40-bit DMA mask via dma_set_mask(40), but the
inbound/outbound ring base addresses were programmed by masking the
physical address with FSL_RE_ADDR_BIT_MASK (0xF) into the high register
and shifting it right by FSL_RE_ADDR_BIT_SHIFT (4) into the low register.

This truncates the upper address bits and, worse, places the lowest 4
bits of the address into the high register. For any ring allocated above
the 64 GB boundary the hardware reads/writes the wrong physical memory,
causing silent data corruption.

Program the registers correctly: the low register takes bits [31:0] and
the high register takes bits [39:32] of the 40-bit DMA address. Replace
the broken FSL_RE_ADDR_BIT_* macros with FSL_RE_ADDR_HIGH_MASK.

Fixes: ad80da658bbc ("dmaengine: Driver support for FSL RaidEngine device.")
Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/fsl_raid.c | 14 +++++++++-----
 drivers/dma/fsl_raid.h |  3 +--
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
index befb4bb69d54..7343833b3b34 100644
--- a/drivers/dma/fsl_raid.c
+++ b/drivers/dma/fsl_raid.c
@@ -715,15 +715,19 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
 		goto err_free_1;
 	}
 
-	/* Program the Inbound/Outbound ring base addresses and size */
+	/* Program the Inbound/Outbound ring base addresses and size.
+	 * The DMA rings are 64-bit addresses split into high/low registers.
+	 * The driver supports a 40-bit DMA mask, so the low register holds
+	 * bits [31:0] and the high register holds bits [39:32].
+	 */
 	out_be32(&chan->jrregs->inbring_base_h,
-		 chan->inb_phys_addr & FSL_RE_ADDR_BIT_MASK);
+		 upper_32_bits(chan->inb_phys_addr) & FSL_RE_ADDR_HIGH_MASK);
 	out_be32(&chan->jrregs->oubring_base_h,
-		 chan->oub_phys_addr & FSL_RE_ADDR_BIT_MASK);
+		 upper_32_bits(chan->oub_phys_addr) & FSL_RE_ADDR_HIGH_MASK);
 	out_be32(&chan->jrregs->inbring_base_l,
-		 chan->inb_phys_addr >> FSL_RE_ADDR_BIT_SHIFT);
+		 lower_32_bits(chan->inb_phys_addr));
 	out_be32(&chan->jrregs->oubring_base_l,
-		 chan->oub_phys_addr >> FSL_RE_ADDR_BIT_SHIFT);
+		 lower_32_bits(chan->oub_phys_addr));
 	out_be32(&chan->jrregs->inbring_size,
 		 FSL_RE_RING_SIZE << FSL_RE_RING_SIZE_SHIFT);
 	out_be32(&chan->jrregs->oubring_size,
diff --git a/drivers/dma/fsl_raid.h b/drivers/dma/fsl_raid.h
index adbfede330a7..748047996bbc 100644
--- a/drivers/dma/fsl_raid.h
+++ b/drivers/dma/fsl_raid.h
@@ -66,8 +66,7 @@
 #define FSL_RE_RING_SIZE		0x400
 #define FSL_RE_RING_SIZE_MASK		(FSL_RE_RING_SIZE - 1)
 #define FSL_RE_RING_SIZE_SHIFT		8
-#define FSL_RE_ADDR_BIT_SHIFT		4
-#define FSL_RE_ADDR_BIT_MASK		(BIT(FSL_RE_ADDR_BIT_SHIFT) - 1)
+#define FSL_RE_ADDR_HIGH_MASK		0xFF
 #define FSL_RE_ERROR			0x40000000
 #define FSL_RE_INTR			0x80000000
 #define FSL_RE_CLR_INTR			0x80000000
-- 
2.55.0

