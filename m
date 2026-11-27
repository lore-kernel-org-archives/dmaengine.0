Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795777452;
	b=hU7BxliWXVRIocvgiQOcoO4ic2rhqGSTRMnjKBttBZzuQv2lAg9Wj46/5puMZGjnnnzk
	 YLX/+LZs0f+NJ0YiBf7jmxkisE6lKduwRKnk5g2+EdqRlo9MdHXq9zciC9nlcDCDNoA/Y
	 6XBvY1AuCMb26pu7/cy6yoE+XoNbBEGnJHLUmkNhxSvqUHO1BhEgVDYeABfshv7xRoTEt
	 WvcAjooEfRJth0E959Fg0C5Dnl28LKQE7XPMBkHW8osZ9cNtT2eolXK+Bzc5DH/U0XPHW
	 kFyon94REomyxH7Xdq0HvErfDvTnfO9t34ccC3bdarlH2vApcj7YiYRxIKMYyiysQZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795777452;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=YdfK4Qp5Bx9gzFSwkUXW3KuZo6hwNcU1xldTy43PvIA=;
	b=01IhcXoRCKZSor6MnSEx1AjNQ/jJk4/mtWssOI5ytvqqQZOlRA5W2S5Ii8f8AVr30Q++
	 Pj0Mj/C4qxkDjw9/8Y8wq+rhNM+/xq6vW/n7TlOu5JSmSxodxjHnOQVT/E7dP5W2PF5vm
	 YYR+2Sx5eJQXOEp6yu1wM1cqX0hu3tvhF+8ryvn51vdnHLTy33OYPrUnTB0lBmKuJvy4Q
	 2uAU0MMelFhGkBsm0brwCNylMOQXWBEXPQc6VU4tviT35IDTPcKrLhOOCjvThNQtLPchw
	 yzlP/0AKhYDaEDqfu2wQYAg6ZiEsXsSeTsF00KKezk6e2d0AT0aoowdoQTkm13sUEpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=gifcjVT7;
	arc=none smtp.remote-ip=45.254.49.197
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18EF606A327;
	Fri, 27 Nov 2026 11:04:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A18EF606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=gifcjVT7
Received: from user.localdomain (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5641a2c40;
	Fri, 27 Nov 2026 19:04:06 +0800 (GMT+08:00)
From: Tian Xuechen <202300460064@mail.sdu.edu.cn>
To: vkoul@kernel.org
Cc: Frank.Li@kernel.org,
	Frank.li@oss.nxp.com,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2] dmaengine: qcom: gpi: Use managed APIs to register the DMA engine
Date: Fri, 27 Nov 2026 19:04:06 +0800
Message-Id: <20261127110406.379425-1-202300460064@mail.sdu.edu.cn>
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
X-HM-Tid: 0aa21cad42b803a2kunmf7f0fd8d394a91
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaGBhNVh4dHR9JTUNLQ0JMGlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlPS0hVSktJQk
	NDTFVKS0tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=gifcjVT7idZS6u1faDHGrESt5ugSlj21VSzAzW6Ks0dh1gzGlg0GfARY1R1yzwK/iVB0aUg0KemUJs3d+QGsKU0JiOxSpiwU9vtwvBaXsJz/deIM3PGdpXHPF8NThtwqAfYW19RiZOl7z8d/o3zlECgqIJLloDQ24J9Mjty0VIw=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=YdfK4Qp5Bx9gzFSwkUXW3KuZo6hwNcU1xldTy43PvIA=;
	h=date:mime-version:subject:message-id:from;

The GPI driver leaves the DMA device registered if OF controller
registration fails, and leaves both registrations in place on unbind.
Use the managed registration helpers so the OF controller and DMA
device are unregistered before their backing storage is released.

This issue was found by our static analysis tool under development.

Fixes: 5d0c3533a19f ("dmaengine: qcom: Add GPI dma driver")

Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
---
Changes in v2:
  - Update the subject as requested by Frank Li.
  - Align the managed OF registration call continuation.

 drivers/dma/qcom/gpi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
index 665d8a0bbaf8..f0cfc9b254f4 100644
--- a/drivers/dma/qcom/gpi.c
+++ b/drivers/dma/qcom/gpi.c
@@ -2293,14 +2293,14 @@ static int gpi_probe(struct platform_device *pdev)
 	gpi_dev->dma_device.device_resume = gpi_resume;
 
 	/* register with dmaengine framework */
-	ret = dma_async_device_register(&gpi_dev->dma_device);
+	ret = dmaenginem_async_device_register(&gpi_dev->dma_device);
 	if (ret) {
 		dev_err(gpi_dev->dev, "async_device_register failed ret:%d", ret);
 		return ret;
 	}
 
-	ret = of_dma_controller_register(gpi_dev->dev->of_node,
-					 gpi_of_dma_xlate, gpi_dev);
+	ret = devm_of_dma_controller_register(gpi_dev->dev, gpi_dev->dev->of_node,
+					      gpi_of_dma_xlate, gpi_dev);
 	if (ret) {
 		dev_err(gpi_dev->dev, "of_dma_controller_reg failed ret:%d", ret);
 		return ret;

base-commit: 2e02fb103be058cf8b2fb24112a74a2715e090f0
-- 
2.43.0

