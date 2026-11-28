Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.71.155.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795863750;
	b=Kv5+kpafHDlUP+sJKDVUL4IX9ZZSLDTZzAWsP9HVzJXhR7nplH72LEKw66DdGoFXXQ5U
	 nQkhpRZTISg6mQxoakbMMBkKfOn9F2+3nynQRiwHhtEIWAg7rpukqMHHO31Jpk779yiEo
	 gIYTyBvGlI1LHIlk9k7egECF/H8SpeZTp2bdogW18eFCgVRWmu+DgK4XJgqySZfUcWxOP
	 K9quAEU4vxqJFMfZ/7MLJmTq13hysX+lPcsaoHOCJNp0b3aMyUrvWlFfWY9Hf2V4nKaAu
	 vh1DZkpbbQZuYkpMOG+x3l5oVVWjiLYlInigV1NkAPnrGMIVeL1buI7eBvPAj71e4LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795863750;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=1WrnuHWVSVNKeUr8exJZIFPj/hy2Q9lcsHkBPFQKxmU=;
	b=w3FdwGjntKonx+k53Igxs6fdLxS4HOfXRvxV3uMroOYCtXT1csgmyFCGQrz/4RwqW24C
	 uLL+6RztT3VwUHRl6z6dsOIiodDQ7irMv9idxKNLYgN4fAgb4mPuVblT0lIKGOatLkbIt
	 4+QucDdfQQtc8l4THbkjChvoJaJyJORA0LjCrJ17Nyuv5dzUiTVG3OCNjoBsyd7/Msdu0
	 ZRU7XM+aTb0UpHwXvwbuwcJgAay9T2ifNyNQ4BXTy4rgsl7fC6gviD12xmutTryVFutVJ
	 d4l3tTRpM+8d0fPVMjZoUG4vWotGspk38vI1l3Ir9XJ4Ir503E7C2BRcNXY01rpS/pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=U5DLvDz0;
	arc=none smtp.remote-ip=101.71.155.101
Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A0E606A31F
	for <dmaengine@vger.kernel.org>; Sat, 28 Nov 2026 11:02:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55A0E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=U5DLvDz0
Received: from user.localdomain (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5656652aa;
	Sat, 28 Nov 2026 19:02:25 +0800 (GMT+08:00)
From: Tian Xuechen <202300460064@mail.sdu.edu.cn>
To: vigneshr@ti.com,
	vkoul@kernel.org,
	peter.ujfalusi@ti.com,
	grygorii.strashko@ti.com
Cc: Frank.Li@kernel.org,
	dmaengine@vger.kernel.org,
	liguangshuo@mail.sdu.edu.cn
Subject: [PATCH 1/2] dmaengine: ti: k3-udma: Withdraw the DMA providers on removal
Date: Sat, 28 Nov 2026 19:02:23 +0800
Message-Id: <20261128110224.875369-2-202300460064@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261128110224.875369-1-202300460064@mail.sdu.edu.cn>
References: <20261128110224.875369-1-202300460064@mail.sdu.edu.cn>
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
X-HM-Tid: 0aa221d2152803a2kunm94af19d73cbc5f
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDSBhLVk1DTxpKGUxNQh4eTFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlLVUtVS1VLWQ
	Y+
DKIM-Signature: a=rsa-sha256;
	b=U5DLvDz0TOvyTgjVCpovblIpeP+Ln9qx5Ukd2291LR5jR6XgGQarWK0wDaXrfT9jy18DjBppOgFqfxBT9g/uOECGX//uHFgj6xCMbF99L2dwB6mbgfk7ypKwIxG8xMh99Kd2RS39WvdN/PsI5/gWLOLxJzimKGYOZsCgHZeUyVs=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=1WrnuHWVSVNKeUr8exJZIFPj/hy2Q9lcsHkBPFQKxmU=;
	h=date:mime-version:subject:message-id:from;

From: Tian Xuechen <202300460064@mail.sdu.edu.cn>

The OF controller and DMA engine remain registered when the driver
is unloaded. Manage the two registrations so they are undone in
reverse order before devres releases the UDMA device.

This issue was found by our static analysis tool under development.

Fixes: 25dcb5dd7b7c ("dmaengine: ti: New driver for K3 UDMA")
Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
---
 drivers/dma/ti/k3-udma.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index 75bd1977fb42..1349585711b8 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -5619,7 +5619,7 @@ static int udma_probe(struct platform_device *pdev)
 	/* Configure the copy_align to the maximum burst size the device supports */
 	ud->ddev.copy_align = udma_get_copy_align(ud);
 
-	ret = dma_async_device_register(&ud->ddev);
+	ret = dmaenginem_async_device_register(&ud->ddev);
 	if (ret) {
 		dev_err(dev, "failed to register slave DMA engine: %d\n", ret);
 		return ret;
@@ -5627,11 +5627,9 @@ static int udma_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, ud);
 
-	ret = of_dma_controller_register(dev->of_node, udma_of_xlate, ud);
-	if (ret) {
+	ret = devm_of_dma_controller_register(dev, dev->of_node, udma_of_xlate, ud);
+	if (ret)
 		dev_err(dev, "failed to register of_dma controller\n");
-		dma_async_device_unregister(&ud->ddev);
-	}
 
 	return ret;
 }

-- 
2.43.0

