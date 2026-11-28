Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795863753;
	b=QO6/UhOxiWhNkU9VgupRSQ9UB8SgDqS8XPk3NTYWZ/x7t1Nxiptgn+A1JA5bCuIWfAqL
	 dhM2xkjK8uDwtevXLDvQFAeLztt2/4IFRy1JbATNAuc/G4ue8D+5qsAsY5Z4sq8x35b6S
	 meLqg2cD8aJGqib+3LXGDp8nWsb7hFMSbZ0TYfxw6D2m5uTus1U1ysnoa95w4xArdULWR
	 YdcUVMnnIy/8FWuLe/N5gdnzH3scBLl8QTOI/ocZwuMwr/1uGFhxqvu+xBz0zMxr3wRqm
	 t5PGlY/3qCrYoQ1nQYXAsV96J04RgIHPbMewXbhsXIOUJkCzbFM8WWrXgJvP4mGbbRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795863753;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=nEl+pJ/KPWn/zVIcSNpUKXctbN5u1pZO1qdZt12k+jg=;
	b=11ivfrfE9YfS9Yk3pa6x1ru7eeQX0K5gqUmTFY83qVbIeoconraTXbBZLbQMZjRgrxAj
	 raabhedyG1Gj0GZczGcqwgoBxIiJifACcB7bcFi5UtB9lyoI6BilhWjwpod8bF7XWcyCN
	 h14/QLo3kYsoc6yy2kF6CdNSUF/8TUk/SoTr/RSji6ALSQ074RT2bED0P7/vD+W8wcTAc
	 YReOGHfsWGlU/DPJ8bhv0j+pFlvA7L9/XB62HZfMZpIP/KRrDL4zmeFCkzNfAfTJN24qR
	 cOvecm3MW1/1kdcKKCdiAPJq4xaJSXHjye4WDNMyoNrv+bBmx/ekrp1+oBSDxw5B0ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b="K/UrUC3U";
	arc=none smtp.remote-ip=45.254.49.198
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B38606A31C
	for <dmaengine@vger.kernel.org>; Sat, 28 Nov 2026 11:02:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66B38606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=K/UrUC3U
Received: from user.localdomain (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5656652ac;
	Sat, 28 Nov 2026 19:02:28 +0800 (GMT+08:00)
From: Tian Xuechen <202300460064@mail.sdu.edu.cn>
To: vkoul@kernel.org,
	alex@sverdlin.org,
	nikita.shubin@maquefel.me,
	arnd@arndb.de
Cc: Frank.Li@kernel.org,
	dmaengine@vger.kernel.org,
	liguangshuo@mail.sdu.edu.cn
Subject: [PATCH] dmaengine: ep93xx: Withdraw the DMA providers on removal
Date: Sat, 28 Nov 2026 19:02:27 +0800
Message-Id: <20261128110227.875382-1-202300460064@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.34.1
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
X-HM-Tid: 0aa221d21e2003a2kunm3fe05c763cbc6a
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaSB8ZVkpDS0gZTk1JHkxMGlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlPS0hVSktJQk
	NDTFVKS0tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=K/UrUC3UB1OEapOCNUvwwQMfVO/4XGhvsWh/ZGNyCQaclAjhFVaIJm1tPnHLXHKC42RuMTwoue9/jq4hg3+RkeEzy37gxE/CMp70m9IiQTJ+1M+IIKqz9uS90h4z+h0GIg7qNlP0NQk5OlWpjp7Jwu/2qoZSZaxhjivsv+PGUj0=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=nEl+pJ/KPWn/zVIcSNpUKXctbN5u1pZO1qdZt12k+jg=;
	h=date:mime-version:subject:message-id:from;

From: Tian Xuechen <202300460064@mail.sdu.edu.cn>

The OF controller and DMA engine are still registered when devres
releases their channel data. Manage both registrations so the OF
controller is withdrawn first, followed by the DMA engine.

This issue was found by our static analysis tool under development.

Fixes: 2e7f55ce4302 ("dmaengine: cirrus: Convert to DT for Cirrus EP93xx")
Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
---
 drivers/dma/ep93xx_dma.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/dma/ep93xx_dma.c b/drivers/dma/ep93xx_dma.c
index 8a0b66a7d886..dc11cf740edf 100644
--- a/drivers/dma/ep93xx_dma.c
+++ b/drivers/dma/ep93xx_dma.c
@@ -1539,28 +1539,19 @@ static int ep93xx_dma_probe(struct platform_device *pdev)
 		edma->hw_interrupt = m2p_hw_interrupt;
 	}
 
-	ret = dma_async_device_register(dma_dev);
+	ret = dmaenginem_async_device_register(dma_dev);
 	if (ret)
 		return ret;
 
-	if (edma->m2m) {
-		ret = of_dma_controller_register(pdev->dev.of_node, ep93xx_m2m_dma_of_xlate,
-						 edma);
-	} else {
-		ret = of_dma_controller_register(pdev->dev.of_node, ep93xx_m2p_dma_of_xlate,
-						 edma);
-	}
+	ret = devm_of_dma_controller_register(&pdev->dev, pdev->dev.of_node,
+					      edma->m2m ? ep93xx_m2m_dma_of_xlate :
+							  ep93xx_m2p_dma_of_xlate, edma);
 	if (ret)
-		goto err_dma_unregister;
+		return ret;
 
 	dev_info(dma_dev->dev, "EP93xx M2%s DMA ready\n", edma->m2m ? "M" : "P");
 
 	return 0;
-
-err_dma_unregister:
-	dma_async_device_unregister(dma_dev);
-
-	return ret;
 }
 
 static const struct ep93xx_edma_data edma_m2p = {

base-commit: 4dce97c6c265544342e716e62fd24bbb232590c5
-- 
2.43.0

