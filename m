Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0825B2D24B7
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 05:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784783170; cv=none; b=eaaRD5ik9OvLx5qfp2cawj5cKt16MpsRZBMxUzz+o68KLZMc6KchbRDa77srg5+qfHt8VLDtFl27YYsVD+mhh27MVr2QlFchisVkRdrVkMG4r/IMxK26UzQz8Us99q6dFtx6RWwr0dJnGZoV4dITjsO8hBtTNheKDkoeiR6YNvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784783170; c=relaxed/simple;
	bh=2fXuHKme6drbp9qxm9DooDlMKSKL7xE7RIRVe/fmm9w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J71zconysQLuBUXUw7KXlwkxkMXrlg8OvkaRXSIAbm0jhml5K/VTM5bXC3F9hYIHEJHOoMa1gCFERUNnVoPGu2Ow/ZQyLrLBTLFxjzRWygb5o5V7B30ZoFmO2RJzhhroHJRFyRwYVqohEfG7UM8kPj5MbaND1RBkwBnQmFdQwk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=das/tErc; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="das/tErc"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ceb096e675so2808515ad.0
        for <dmaengine@vger.kernel.org>; Wed, 22 Jul 2026 22:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784783168; x=1785387968; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fskRTNmKCHuMx7B3elKsJMyK2dJDvII2EXTM/GUSwAI=;
        b=das/tErcaLNlGgKU8TNyvNgDokuePnw4stEiqg8wLbO8eOw8foxGfYzGQ3knYN2OoU
         nq+ZZIi8+CwiF0PHGwjrlAnMRwn0wEYCgtauePMYOtyT7hvz7ye4bydFXf55sMNsORjz
         3HVqwA4+i5VARRBnLxIq8gBIJQ+LG5l/FLLLw7A7OGnZI7tYRMT7QX3RPHHAW6LruTUt
         FyxeBuQbFynoqMm3+SVTO4yzkX/K2Jtca73zcZ4vdOM0QdABtYfspxXit7BassOYO2hC
         FB476VeSUSOaeOyHSxnjfMMAevQeqt9ptp+5qu/7hO2a50kIfQkHF2xO/37Mzua4ML1J
         0KvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784783168; x=1785387968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fskRTNmKCHuMx7B3elKsJMyK2dJDvII2EXTM/GUSwAI=;
        b=I39MM86SPeV2BS4Nd/s+kkjB9UhrzI4TNKbeD1/daxc952OwULUDI0GBxIvddlQOZr
         vcZOe5/j4/BwajHjI4K4nBig4mJuq/azHvmuBMDDypkyAjpDt4MmlaKyqX04CBMhvuyj
         F/O3MTTwZKbIGHkvrH2PxSnvop3khxpXMOdalNcDZzIVaKCVebNkMKFPvTLL3Vqsax7Y
         dH02DMNjx3tf5Y48Njjdaz1PiC1WGC5ezItXXNk1JOVqN0Ww+ZTc9bx41jl3NZ8xcr7i
         9wSfe7H6jIZXdJBHzDdtjjE3pOMBSbIdaVpL7zto/tQ/zOY3ZZvFAutoK528KnYQFyC5
         GSJw==
X-Gm-Message-State: AOJu0Yx7HpqaHER/Ot87ztXvBy+7ThK7mYIw4yjH8az9OIEDy5+6WUxL
	otLdJb6X3xKA4z6BnFCj8FlIhJYzMBKAubXPkbCmngnZrOEfkCExF3b/anWH5g==
X-Gm-Gg: AR+sD11yCq+MT0Mgg9ovZxt5nC4tgTzldm2nea3LltCsZ8p37WaGlQMjigzgW4nl1pu
	DeszS6q14qiFzSPaIE027s3Z8B6d1sF9rThGWVJB523V1cDQ2tJEjF2zT7kzCNVBmCdBvv6hRrJ
	I9ctDrHuq+MsxrUR7/xdXeWwQIISztISJa29xyQVHB6RNt/qb4WXsaWNZdZukzUkIapmaLRcd+7
	5L/4/1fKR+XzJEJ3JO4oHzzXf++Up3hclmeUMkyUHFqP9DNK9hw4maAe/1NxlMLE/549+zJNsbL
	IWUcWbRXVak6qI9IvoqmF1I/0U/CCO71DsTiRzKsZIe6HFIebmDNL4CurorKewRBF+JhaVtPQJV
	DGJu1MkdCoRWURoCc3xD8I+bZkJ+JaVx0wFkqp48u5pW0okTTnjEcuz6G8a5mYD/lmugvuhDl9e
	X/1vaJ0xdvs1lZufEeNxsheCd1rtAxgYy6yhqMFTxI8r4lPzPzWMYd5INBRbqpkxkOeOEGGDkGu
	FooxJR/KeavPIPcBpicDSgD6rAQsxQOk/Jtl/6tDC+NiCdBIkbKdas=
X-Received: by 2002:a17:902:fc43:b0:2c9:97a7:3276 with SMTP id d9443c01a7336-2cfa6c87f9fmr20526865ad.39.1784783168285;
        Wed, 22 Jul 2026 22:06:08 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f3b46absm25427275ad.80.2026.07.22.22.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 22:06:07 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:MICROCHIP AT91 DMA DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dmaengine: at_hdmac: ioremap and get irq early
Date: Wed, 22 Jul 2026 22:06:06 -0700
Message-ID: <20260723050606.283453-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The functions can return -EPROBE_DEFER. Call them before anything else
to avoid doing extra work.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/at_hdmac.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
index e5b30a57c477..2f6f5877fc3c 100644
--- a/drivers/dma/at_hdmac.c
+++ b/drivers/dma/at_hdmac.c
@@ -1943,11 +1943,20 @@ static void at_dma_off(struct at_dma *atdma)
 static int __init at_dma_probe(struct platform_device *pdev)
 {
 	struct at_dma		*atdma;
+	void __iomem		*regs;
 	int			irq;
 	int			err;
 	int			i;
 	const struct at_dma_platform_data *plat_dat;
 
+	regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
 	/* setup platform data for each SoC */
 	dma_cap_set(DMA_MEMCPY, at91sam9rl_config.cap_mask);
 	dma_cap_set(DMA_INTERLEAVE, at91sam9g45_config.cap_mask);
@@ -1968,13 +1977,7 @@ static int __init at_dma_probe(struct platform_device *pdev)
 	if (!atdma)
 		return -ENOMEM;
 
-	atdma->regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(atdma->regs))
-		return PTR_ERR(atdma->regs);
-
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
-		return irq;
+	atdma->regs = regs;
 
 	/* discover transaction capabilities */
 	atdma->dma_device.cap_mask = plat_dat->cap_mask;
-- 
2.55.0

