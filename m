Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035EE414DDB
	for <dmaengine@vger.kernel.org>; Thu, 10 Sep 2026 21:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789074895; cv=none; b=HL+g7NJgYMRJdZ3tOTjBFZoJ2A54xyv2HTlVkOwLBzIJzq/ilAzqilLiZ1xS6fZ5U14GcWEMekRJGygW2GktSu5EdwLB6ZHNZLUWhoyH73sozt9nUuGubpLgMYP7jiEBOpd2zatoYzoaVW1LJemVkh9aegcozYwmMhRiU1dHiRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789074895; c=relaxed/simple;
	bh=MH2yDJ/tFnb+zFtp0k+CRfg+1XKdo8LeVSAM8XFURV4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ftZKEnm0dJtwUY0Z3moSIUbmV37j6yk2Ud05iUzQCwwlSlyG50pxYDumFd63DVGxGN0P8r0GWUd8I7IEc2O3P+x1Io9oDu71CNzrYqXSZeW6NYNd7rdZJ7qVEU8z0SyWZRTpb6/NC88/zWXRQNrleN+DyWeizv1UtyoNbQI0pvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R7zXX9+4; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R7zXX9+4"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso193005a91.1
        for <dmaengine@vger.kernel.org>; Thu, 10 Sep 2026 14:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789074883; x=1789679683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fw41YnGlMHWt+H96gIB8JgQsPZ3KBZUxezlstkenKvw=;
        b=R7zXX9+4wrlJasf7HV7EQoGKl8s/C154vY76IHyvxJQvrb/f9bqwRiyo/kgL3Z/NyV
         cQvov0vA4SNFK4ZunMRO5uHX2mcyEIqxX7uOiu7sD4LYQvR3QT3AddTAD0xyx2OQiYwd
         LTm+U9dWAMtX1KSRpdeoaReoJgiO/OQFlhOs9YJkIqfdTntuEZKfCI3KNMeTGGBhdDqZ
         r7IfcnijMRlv+ok7FKyF5hCoUp2NNz+E3/7PP7cweHIUJZXEeF363IMUvPieruvdmuAe
         RoDVmFqTQEpaZgdyCvPTs6NbJ3fADsG8++rTwxXoHhLI8A3WgIiX4NILujUwL5NUZRBb
         KZPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789074883; x=1789679683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fw41YnGlMHWt+H96gIB8JgQsPZ3KBZUxezlstkenKvw=;
        b=oD8yN+PdcR2c9A12AT57z21qNiAqG2Ede3T/FjJr+cCbFsa05+cwjgLQUj9BGb3JAv
         cEVLjSH5aTiaSWEG/+z2d/kbgt+xX0pTUF2eptYE2//1tgf28Vf1Kt/TIwpxXNQ99G/B
         eDGrjNzQKirF0fYpvC+ilr1G25dLdGE/ZNZDiYM/HJeb5qqJdAhVZPT/NWsURw+6OffE
         0RLW9hQmlcwGGNvtYtemK3spv+zWD8bVADATYQTR/aSOz9Io5lkQcdAqOnHch4PVFmTx
         T5QbfK912hfSHfz55PMahuyexNsTBaa+x4eYcSVD/Ur1LcQNyJuhmt3V9xc3b4otO3jV
         C8sQ==
X-Gm-Message-State: AFuF++lsmUEtkCnR7QbpekbDWKIgDm+O7OpiuneP2y1RSwxjFTyiJf4p
	a8Pu8+YQQy1aWMBZgkJyd77JH63w9dwpMBKXj9VQjFOgTgMol6UBH6HxtN8Vx9Fu
X-Gm-Gg: AYBFou3QpazAeE+R5aDwF23lyy6mpszJ9IcjOVSjo5juDBn4w16sQ45WnoAoQUHKakZ
	BxaE0PE27cqCJEcCUcGWe/kaeboWdhXyp4xZ8PW+Ll5JXje6BGsObTa23jAI3/5Dohm2ZkpHByX
	/qqLWStNX8p+drVyoznQPXKH6fgQtUyZG1E/mddJqFLfBJJsIe/3JVVvz3IHK0Wqo3l6hLwh8UP
	4F8BskP4T+9x0f33QZpCkMcEbH0w5YNgT1jYoHihytnIJQC8cDr1lg0MdzTC1KPpDCqTwxv0gpG
	A5SJaVwQDITvutjtY558rOHtcUJ1S4bD0HiKlzn1ezm2HEe9QivRCF/QNw2RZhbhksM/LDcKRMg
	6AoyPzaelFHCd9+XAy2S56AlwBIdNlRNRg5H/gQSFHgYQxIpkbTcuBOZg1rSe5+4AiitFnd9Ikl
	UAxEAs6gas/AyGolMZbWpZT8FizWTX40y8PKJyx3sZRy7A6EfisMIP+QOPyE7pN/QkllS66atKc
	ZvTlbDS3h6vQ3fdU6IJl0d1e4bMId2TleHbkyh51/Cd6kjbo56x/XlJBuN4f3vFhyRanwB7aUwK
	D+qkru46TsTNH43pJ7T6jZKwx8w4aSQBi47oXN2p5zB9J63/
X-Received: by 2002:a17:90b:39a7:b0:398:9bd1:3214 with SMTP id 98e67ed59e1d1-39d9c223eb3mr998245a91.21.1789074882649;
        Thu, 10 Sep 2026 14:14:42 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d95091214sm1359226a91.3.2026.09.10.14.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 14:14:41 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Yuri Tikhonov <yur@emcraft.com>,
	Anatolij Gustschin <agust@denx.de>,
	Dan Williams <djbw@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dmaengine: ppc4xx: fix format specifiers for size_t arguments
Date: Thu, 10 Sep 2026 14:14:40 -0700
Message-ID: <20260910211440.65618-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several dev_err, dev_dbg, pr_debug, and printk calls use %d or %u
format specifiers for size_t arguments (len, pool_size).  Fix them
to use %zu to avoid warnings on 64-bit builds.

Fixes: 12458ea06efd7 ("ppc440spe-adma: adds updated ppc440spe adma driver")
Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/ppc4xx/adma.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/ppc4xx/adma.c b/drivers/dma/ppc4xx/adma.c
index 279a431ccae3..bcc54d584e2b 100644
--- a/drivers/dma/ppc4xx/adma.c
+++ b/drivers/dma/ppc4xx/adma.c
@@ -799,7 +799,7 @@ static int ppc440spe_chan_xor_slot_count(size_t len, int src_cnt,
 	if (likely(len <= PPC440SPE_ADMA_XOR_MAX_BYTE_COUNT))
 		return slot_cnt;
 
-	printk(KERN_ERR "%s: len %d > max %d !!\n",
+	printk(KERN_ERR "%s: len %zu > max %d !!\n",
 		__func__, len, PPC440SPE_ADMA_XOR_MAX_BYTE_COUNT);
 	BUG();
 	return slot_cnt;
@@ -1989,7 +1989,7 @@ static struct dma_async_tx_descriptor *ppc440spe_adma_prep_dma_memcpy(
 	spin_lock_bh(&ppc440spe_chan->lock);
 
 	dev_dbg(ppc440spe_chan->device->common.dev,
-		"ppc440spe adma%d: %s len: %u int_en %d\n",
+		"ppc440spe adma%d: %s len: %zu int_en %d\n",
 		ppc440spe_chan->device->id, __func__, len,
 		flags & DMA_PREP_INTERRUPT ? 1 : 0);
 	slot_cnt = slots_per_op = 1;
@@ -2030,7 +2030,7 @@ static struct dma_async_tx_descriptor *ppc440spe_adma_prep_dma_xor(
 	BUG_ON(len > PPC440SPE_ADMA_XOR_MAX_BYTE_COUNT);
 
 	dev_dbg(ppc440spe_chan->device->common.dev,
-		"ppc440spe adma%d: %s src_cnt: %d len: %u int_en: %d\n",
+		"ppc440spe adma%d: %s src_cnt: %d len: %zu int_en: %d\n",
 		ppc440spe_chan->device->id, __func__, src_cnt, len,
 		flags & DMA_PREP_INTERRUPT ? 1 : 0);
 
@@ -2279,7 +2279,7 @@ static struct ppc440spe_adma_desc_slot *ppc440spe_dma01_prep_pq(
 	unsigned long op = 0;
 	unsigned char mult = 1;
 
-	pr_debug("%s: dst_cnt %d, src_cnt %d, len %d\n",
+	pr_debug("%s: dst_cnt %d, src_cnt %d, len %zu\n",
 		 __func__, dst_cnt, src_cnt, len);
 	/*  select operations WXOR/RXOR depending on the
 	 * source addresses of operators and the number
@@ -2553,7 +2553,7 @@ static struct dma_async_tx_descriptor *ppc440spe_adma_prep_dma_pq(
 	BUG_ON(!dst_cnt);
 
 	dev_dbg(ppc440spe_chan->device->common.dev,
-		"ppc440spe adma%d: %s src_cnt: %d len: %u int_en: %d\n",
+		"ppc440spe adma%d: %s src_cnt: %d len: %zu int_en: %d\n",
 		ppc440spe_chan->device->id, __func__, src_cnt, len,
 		flags & DMA_PREP_INTERRUPT ? 1 : 0);
 
@@ -4077,7 +4077,7 @@ static int ppc440spe_adma_probe(struct platform_device *ofdev)
 					adev->pool_size, &adev->dma_desc_pool,
 					GFP_KERNEL);
 	if (adev->dma_desc_pool_virt == NULL) {
-		dev_err(&ofdev->dev, "failed to allocate %d bytes of coherent "
+		dev_err(&ofdev->dev, "failed to allocate %zu bytes of coherent "
 			"memory for hardware descriptors\n",
 			adev->pool_size);
 		initcode = PPC_ADMA_INIT_COHERENT;
-- 
2.55.0

