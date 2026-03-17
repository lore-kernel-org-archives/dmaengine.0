Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDCC189F43
	for <dmaengine@vger.kernel.org>; Tue, 17 Mar 2026 20:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773780477; cv=none; b=cUUw6PjYFLz0oOvMoqmRfeVQVPPbnCxkg5znbEkMB9/inX21pggHTR/ndc7yOahXYG3dUSsnL/nGrX0RngMYCnwhGtaVAp4BxADuUDbiSBC9JsM8N/N0t0NBexAUWdvhhidGeWcaMYLaMYJgR1AUIFAjqFtgNndjwLDKn8HDsms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773780477; c=relaxed/simple;
	bh=erbVrTXG97D5FI0eFhcyGQkyScSUPMgDK8m5mqqKgng=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=i4kJrJ4tA0K+eRj/ehdCY796kLgNK2vWKDhH/LiPWEg9MTREXcRHqg/DuecSYkX9w7Fk+trA33+Vo06kRPTMV12A6LUsDLi09rHtrhGtOYCAT08ho8qdUuJBWJ5IroMTEvnkTfp9wtnAbiAGtTkMj/W8ifzuZMNz8qUuyRBtg1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rof47hfl; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rof47hfl"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-485345e1013so1962805e9.1
        for <dmaengine@vger.kernel.org>; Tue, 17 Mar 2026 13:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773780475; x=1774385275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/1Ej2QQkVfR2yUyXwe861yMTinfcJrjiiA4dl00sg28=;
        b=Rof47hfld/mXrYXwzhookdiJABxeKavaD1o5zD7+sgIMaQaFs4qInviaMEuAgk7LDs
         HDQbImb0Ngt4774Wu6NNQwCXGP3/u/fD4dKBQ4W8qQ2ch9pKSR9rncOKgoO+I9XmbRmp
         zaISZ8HGAW/3JTW0YWBt/aUYh0rPaQgw42c4ThD1H/XHjDNPnm2FuW+d/q0gXMgVrFCS
         hQlQHiM2l77jpLwDXW51n/S7EWUnlfrkHRgMqPeAiwrcs+Uv2VnEW2GYsg0bntbskclY
         62ZOwp5sYub8Af5XfthNs+WwPHI01cA5+1Ai7CqZBUiYt7t+yJfijXRm1jiYMEqvcPdj
         4eCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773780475; x=1774385275;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/1Ej2QQkVfR2yUyXwe861yMTinfcJrjiiA4dl00sg28=;
        b=rHoRAypHSGFDaRxovP2q75zBH7jlzHNNrNvBi8zNpkgyaZlZa/2BGC62lDDoE3LNsH
         vfHlD15bxlHBXUlqwdhE9RDjMlZSlyqWryGrFLIvpQxxzzynvNQHlrgsNdnORe3gQ1H4
         +7SPYRjB8fCV/qUIdeWWGCtSGHbtEfiQD8yZ5J4YIJYgbgdtLvKFPldC5lvSMu618ZbF
         c9pM9gVsfycqqGy5eswaXHjzD5znj7xAiQ/crFUr1Lu+9/4T7f2P5xvLSsId7L2dq6ng
         QS6YWxZ/WjQ35+zwhfs7f5p2EIgdTA+M4jSROCV/IZGdQsV5IAcORcGDz83crX1vpC6r
         oBDg==
X-Forwarded-Encrypted: i=1; AJvYcCWSqNE1nfGWzgmXGzzb6zmhiAKY3KS968Iwb83UldOsyR31v091Ko7maCfkYB/kioNMwEQtyr54wLc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgYbX1cK+P+h2LeDRKgcJWQPqrLX4bsBAWt2YKhA8fqmnPXkmC
	mKvZk5f5n+oBWtlTD2TbBupAA/KDpHSXQbr3DPkAKnUy+0UUvu4d2u3O
X-Gm-Gg: ATEYQzxPgkbB3JN8ChP8InKtN5BXPAia1/VxFuyHSinglulJ6ff3yU5AlXxPYyVz0zb
	wSDy7IRLPIhAxKfc9zP5Mfq2JMcRgPpjMhFg94H5zrXhoBX3Qh5V7pwzswBSSsCZ4Nvb7iy+kOk
	HHRF9/PkwNzg4MqeQhUOjdczSR2x6UBu0MjKSkX+l2cTQkOXfA0nunrdfMcWfhU/qzgMFiEfxWK
	n34zrhJtCS8rOtzkqy1RywUvU3JBvbJUkTZhBz7bYxkE13vlZ6uxizbcwx7ZIrb6MCvvaig+cjQ
	6S7X3EkVFHpX5a5LWRmLkWRNM4fg0DWM3GdMavWPB0PXVV/yiRNDjcr0+o8P1nKs7dyxT5Ha1RQ
	iey2Flbfw9dIeM5CWMh4VNY8ti2M/3lm5/ps3XVOhlLO9p60DKlvhe0lij2dlHCJl+1eo2vhDzS
	oI9y/oIyciOfr30wU2XNvEHQ==
X-Received: by 2002:a05:600c:8b18:b0:485:38f1:5cec with SMTP id 5b1f17b1804b1-486f40aca00mr16393135e9.7.1773780474467;
        Tue, 17 Mar 2026 13:47:54 -0700 (PDT)
Received: from localhost ([87.254.0.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b518a2cd3sm1641025f8f.32.2026.03.17.13.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 13:47:53 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] dmaengine: loongson: Fix spelling mistake "Looongson" -> "Looogson"
Date: Tue, 17 Mar 2026 20:46:31 +0000
Message-ID: <20260317204631.120332-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There are a couple of spelling mistakes, one in a comment block and
one in a module description. Fix them.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/dma/loongson/loongson2-apb-cmc-dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/loongson/loongson2-apb-cmc-dma.c b/drivers/dma/loongson/loongson2-apb-cmc-dma.c
index 2f2ef51e41b6..1c9a542edc85 100644
--- a/drivers/dma/loongson/loongson2-apb-cmc-dma.c
+++ b/drivers/dma/loongson/loongson2-apb-cmc-dma.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Looongson-2 Chain Multi-Channel DMA Controller driver
+ * Loongson-2 Chain Multi-Channel DMA Controller driver
  *
  * Copyright (C) 2024-2026 Loongson Technology Corporation Limited
  */
@@ -725,6 +725,6 @@ static struct platform_driver loongson2_cmc_dma_driver = {
 };
 module_platform_driver(loongson2_cmc_dma_driver);
 
-MODULE_DESCRIPTION("Looongson-2 Chain Multi-Channel DMA Controller driver");
+MODULE_DESCRIPTION("Loongson-2 Chain Multi-Channel DMA Controller driver");
 MODULE_AUTHOR("Loongson Technology Corporation Limited");
 MODULE_LICENSE("GPL");
-- 
2.53.0

