Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A86A329C7C
	for <dmaengine@vger.kernel.org>; Mon,  8 Jun 2026 04:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780894424; cv=none; b=JPMIh6QgZuvFCqugKFf3Z1aYN8OWOaGsYDUozbNYznnrVwfDITFi4DPmRN73SajS9HgDGfcbusyYFAvUVYeqRLT5sztINRjoFxw6HiDDfbZjD6Il/R+MVKOudIqurCrAwNRvavTB8VJq95kwQszx6TccT2bVg9+L6jRzGFv7IV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780894424; c=relaxed/simple;
	bh=11RGwLkj26xqPdN0wscC2AFma7LM/lWRQj+dLXsSXQo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CY8MC/IB0pcJP5ZFk8Tj78eaup5zvviI5qtOZfTN1xJ2B/3uT/k0uAz1NdUEHciRTP41gcKjYWWS1lyk/7fwFOy2plwpGVOL76N8PRa/RvKqxLLWUOvMwWM4anogqX8z94DAaVkJyUhRryv/aLRAg45L8oyPTK5EyL85qxLzHb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pLV0JfS0; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pLV0JfS0"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2bf22d29dabso25251175ad.2
        for <dmaengine@vger.kernel.org>; Sun, 07 Jun 2026 21:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780894422; x=1781499222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jgvJ9+4PgpXMrVBHtZnQjq8CEK1hGoHMz+18CbE8EQY=;
        b=pLV0JfS0gYmdUz6DriNrCndd5Xazut3iROHO9IIHj9g6zsSQ5hMX+hEeNF/KcRF7Eb
         nOqWTfFMG0oeUFDoVbneiGHw9KK85mmcwnMXZokJXb6tC/xEziEafULo/l3eNsb7ozyN
         iFyhVyKb636aONpE3gJc39FRcRRx9khHwMKLNBs8bZPtLZqImBOTCh+YrS+qTpeGT7jr
         DNt2N4xi63HNAECrxycuUF2wzl+jq6htQqtL/1V1UcNLX3SUebddnlyaGXPW7vF3HyIT
         CcoGnVYBAfe61pUJkIMlj3mI9c4oFw6OXkW+8/akNnGdupJ8Xluidn+5qCqXOxHKzL9c
         L0Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780894422; x=1781499222;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jgvJ9+4PgpXMrVBHtZnQjq8CEK1hGoHMz+18CbE8EQY=;
        b=muy5OmFwHblFiZNJx3Bislehx+y3kM2iQopHlT/Z48GMsR4x8fQRGz6oCNXQ6GGJHX
         N8SlRGbWk/bzZDEscRfS+1YLfCPxs7G2hBXN3Fmabio5fNR/j96Q1/nJff3uBxs+OePl
         IBRJR6NINKRxJQfdhtlu57SNinSej727o9Q6As9I2fbtOXZgw/hB52ieSRwMvtM1RfHC
         +lGxi0NMU2rkoCIW1T9xY8FI77xuURJMVGL8WhtSLf+i8cRlO+/rSeJFqWkRaZYdQDvG
         xom7gpSVuMqU7/zjZN6lnwHsFzQph9pfEMJ193YXmuap0Uw+FJjNFqf+CJn8rWo2O1xZ
         TwyQ==
X-Gm-Message-State: AOJu0YwhpKIKIXa+3jS0ct3ERrAmxaQ4v92wPmJgLu9XqIITCKKIQKwD
	T3khyP2r2WkfhdD8lCqUny02zvCC+fE6BBOkwDezxopL8LXH8hSDL74vG4bBlA==
X-Gm-Gg: Acq92OE+ksxiXbK7RYN8PWCwCqvoCl0GYJlOf3ARv+zgliYNibsRJWFnvaS2GehJROE
	C3gKWjuKUklCZKTCP/Y08lzGgypT1VFm9SWpwM6SiHcGiAkekmpIYny7+Cyf6mGFPjkgQjqqQDR
	nWGeEUZgfdph6UALTfx3a9zjbdILsu9BFeJFUBReIxAIuyIezoCFUhuu1uyRqn7r+b0zjGqk/4I
	MiANITV5O6M5PBfcjUd+DcNR7Ti8r2Jn8ZWGxDZRwmUmxcqRF3qODNuCt+szQ8OpoPS2XMBKS/F
	ZougFsRr1U8ZKGD53ZyveAvmGUx1IpadU8G4nRaaImMG5U5khHmW4wdyi0yPVT9pJrKEwNgLDyQ
	ERfwCyqYXOvgEDVcUYvjnju/GQaZDcU6pYLeXirLa8nAYGvAadmYE0bP//M2bO7NeRS7Tectz8o
	RVTXlzeVRKwNfd7kEmZbdt9TpzCmLJ1uFLAFDgnnBDchYC3KdlPwsjFg4Y8MoUtAmfCOVF448m0
	PBagJuewibncGkOzkjenvWPn9oL8y6vJZt53otOjc0vMg==
X-Received: by 2002:a17:903:3c6f:b0:2c2:7baf:139f with SMTP id d9443c01a7336-2c27baf148emr18097875ad.30.1780894421834;
        Sun, 07 Jun 2026 21:53:41 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d389sm162552855ad.16.2026.06.07.21.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 21:53:41 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Laxman Dewangan <ldewangan@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv3] dmaengine: tegra210-adma: use
Date: Sun,  7 Jun 2026 21:53:24 -0700
Message-ID: <20260608045324.4980-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simpler to call the proper function.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v3: change subject
 v2: reword commit message
 drivers/dma/tegra210-adma.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/tegra210-adma.c b/drivers/dma/tegra210-adma.c
index 14e0c408ed1e..be2ad6e28618 100644
--- a/drivers/dma/tegra210-adma.c
+++ b/drivers/dma/tegra210-adma.c
@@ -1073,14 +1073,9 @@ static int tegra_adma_probe(struct platform_device *pdev)
 		}
 	} else {
 		/* If no 'page' property found, then reg DT binding would be legacy */
-		res_base = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-		if (res_base) {
-			tdma->base_addr = devm_ioremap_resource(&pdev->dev, res_base);
-			if (IS_ERR(tdma->base_addr))
-				return PTR_ERR(tdma->base_addr);
-		} else {
-			return -ENODEV;
-		}
+		tdma->base_addr = devm_platform_ioremap_resource(pdev, 0);
+		if (IS_ERR(tdma->base_addr))
+			return PTR_ERR(tdma->base_addr);

 		tdma->ch_base_addr = tdma->base_addr + cdata->ch_base_offset;
 	}
--
2.54.0

