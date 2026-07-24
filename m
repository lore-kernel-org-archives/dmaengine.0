Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022A24756B8
	for <dmaengine@vger.kernel.org>; Fri, 24 Jul 2026 23:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784935387; cv=none; b=nUgOkycu6Skm0lIZASWSerk72KUu8kD8bBFHYHrAXdK4wPuG+yE7B7ugq/1WKn7ROktAA6Md/6gev8XBO7WoWzof8knqteEIjVHs0NbTnF7XoWmxhsst+TyEgObrUnEIl952EISCT+R8Eu5diFh65u2GHwcpusTahkJ3Vii4ZX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784935387; c=relaxed/simple;
	bh=3ZGWXISsjF8lL5z+RPaUpb0GJkUQ1n0Yr3mcTRITdEw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bo8xdtanp8p4muRZGDkA+j1xMvKFWSjwAVAmUuVtqow3+1Os9ffMsj6td5tvMaQRnjbe3z6wwCjY8O9oaEnyE8Q8OlT9WIjMlzrFWE/MGCdRN6Wb23ZuXC5+VV7Cd0B8b8okHH3CISL27Hc4pTR4zQpRyOjLMOnvix91MB9DmtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DBmvhGN8; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DBmvhGN8"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-84536ecfc5bso1227885b3a.2
        for <dmaengine@vger.kernel.org>; Fri, 24 Jul 2026 16:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784935385; x=1785540185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ak3a7+5iHL+DI779EzdC6NLfZP9M06vxpEidoqxCeoA=;
        b=DBmvhGN8AnK0fX1oFNesxpjAh6f7uGBikYDR/ocgBaYzulG0SyWFpQhrKJLGb+p3hz
         bDkmcDQhrJTAIpjb8F/OwnxPqDYAhZRKJZYrjiKeKUxDlcTq1hcvjlNyxWd1/OUDoaeY
         e88Kxo4KgU7BZ2kJ7SHEKqQf2yjiWN513pfZlXo4l+ZWeUz7dUEs2nWRwc2Q+fFhNW/9
         fjH4GuvHfCeMdH/guBK8Vm8aKR0AZQvej0CaXWvhRo9/ZGavRBu5QaY+YbmFJqDBY1yN
         PjakvwTXJE+q8WTmr67V3RIdrokt0/QIcC05o/UcWakSocODWiTzk5NFFQs3pvYvUww6
         3FRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784935385; x=1785540185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ak3a7+5iHL+DI779EzdC6NLfZP9M06vxpEidoqxCeoA=;
        b=gTnUkvTYdQJHDk9jH3W6XDL8U+puPAd1A4JJ082Pihq/YEdtnCoaQrTBSbiP7dR0gA
         2KT0GNEFs4Jp2nU7pLiGEyAUO4X6Aot98vVy9bc1GNH9IBJOLMu9s0iPLcQtJTeh6SM7
         XAuYTcN/+jpizMq8ko3ImfWI8cgYwwM2voTFyRqJoiq0o0LqEX5nk1pqUlUzmA1RIUE0
         yuuENM1jM4Sj18aMq2pAMkv7EWwOAPPI/VaNjTrMjYtQKZfhQI43D/Hp8auzgdAuoLaX
         tm6QD07KZ8pHUZ0vCKpS66Rj5FETVVqay8E/Ao65zwDE3w1NGZWeZVtsOYIncq6pi0SR
         cn7A==
X-Gm-Message-State: AOJu0YxgxLOkaiE8ZyAv9rbfqM/81DRrABO9JnU9Ak/+42qmxyN/PRBt
	KsPnf9MF0ef9JjL6BvPXSDgiOEXe2H4+TNbJ+TPuLmlUWW3ZkBq3bQxlVNoiZQ==
X-Gm-Gg: AR+sD10/Dy5ABMqiMT31/RPPYyXVpBByLHuMh3J9OC0mepIx7CFLTbU0YvclP1KPDCw
	cubXPGWrM1YJlPIflclUN7Qu5njskuO9KgeKXSf2ODhm4vpEoQO71kQ43iZt4jMEy8otzP3JYNq
	O9wDmpOq+Tl5KxasoaBHblqLp8LNeSQLfCwUHSgRIZrEdwyKojNyD1CuPkZ+PKiqvTIo/eNSh/k
	TKDC9dmjJXbn4XnvGDV57+77XB3Un4qqwyJIJYJ4OctEODaEkkqSLXmG8IJbU8eeyKx7683wUUb
	CRRkfB+CZepv5OwHxnHaxpfzJxzkBBYDYBVa6vrcEDe1NtLWwbxD0HVMP9KWziZ498qlPj/NZzx
	RDcMMScaol+eVXEBorH0dtotWl16k9qlgf6qeDsyBWdG+n2pa3ZAHr6SMHy4RMBq3/SQv5w1IYJ
	2gWqiKPt1uqCtHPrSqvvWfdQaRLwAQTWXp9MONgAxHSjvrGXGTTTF1d4jgVlwRBd2s1Avl6GdQA
	ejdd74HM+IDAABTOP46/m5phvxqHx5nUlNH6qhHqgNT06J8l1eOa1I=
X-Received: by 2002:a05:6a00:178e:b0:84a:2d5c:528c with SMTP id d2e1a72fcca58-84e5958d84fmr206478b3a.61.1784935385215;
        Fri, 24 Jul 2026 16:23:05 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5341d8f0sm510545b3a.44.2026.07.24.16.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 16:23:04 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:MICROCHIP AT91 DMA DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dma: at_hdmac: add device_synchronize callback
Date: Fri, 24 Jul 2026 16:23:01 -0700
Message-ID: <20260724232301.50237-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement the device_synchronize callback for the atmel
DMA driver by adding atc_synchronize() which calls
vchan_synchronize() on the associated virt channel.

This ensures proper synchronization of pending descriptors
when requested by the DMA framework.

Assisted-by: OpenCode:Big-Pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/at_hdmac.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
index bb501c0baa7e..d587f5809814 100644
--- a/drivers/dma/at_hdmac.c
+++ b/drivers/dma/at_hdmac.c
@@ -1617,6 +1617,13 @@ static int atc_resume(struct dma_chan *chan)
 	return 0;
 }
 
+static void atc_synchronize(struct dma_chan *chan)
+{
+	struct at_dma_chan *atchan = to_at_dma_chan(chan);
+
+	vchan_synchronize(&atchan->vc);
+}
+
 static int atc_terminate_all(struct dma_chan *chan)
 {
 	struct at_dma_chan	*atchan = to_at_dma_chan(chan);
@@ -2040,6 +2047,7 @@ static int __init at_dma_probe(struct platform_device *pdev)
 	atdma->dma_device.device_free_chan_resources = atc_free_chan_resources;
 	atdma->dma_device.device_tx_status = atc_tx_status;
 	atdma->dma_device.device_issue_pending = atc_issue_pending;
+	atdma->dma_device.device_synchronize = atc_synchronize;
 	atdma->dma_device.dev = &pdev->dev;
 
 	/* set prep routines based on capability */
-- 
2.55.0

