Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699694;
	b=sLSTP/ix9pe4EYGpxvaixOB32KAJMcrllZlsjr0M4gHp+C9w9C0R0frcNR9ihGa3NygD
	 rCZhUolEFyzO094DCY1oVKzQ4ffanSWuwIX6hYBpujm6ZqepDZcYC0/p0EdC+MJtpR351
	 fLbMihAqhzxhPnghXfMoh3QqYxNM2m3f6Km96ihAw+6BRth994JvPCrUqi9S1mJiXx1S8
	 EXBndne0vaTfDGxVVjiAWx8ZW7BkaV9uyPL/tOxM2zSFrQguYRBHslRvQ49rUqbYH5BN1
	 mpNx4B7m0xZdSNHfjfNs+e21vd18DbRVNu6K2ePckHum1gQwgBt9Wiy+5UrZqO35qLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699694;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=HCK+qoZcybpccL8/UdjiQOeq275clZ4WAJC1smngnlo=;
	b=nR6R56Has3sIsoJXv2qkzzCv0Q6/BSaDc0dUYW+O25TY5E+SLgSqU/vAONw1pTte4LF7
	 grZRHbGUyLNhR38QP35qqNzwHWHqBDu1ecBYpwwDOtexGQk9YF9ysHchwFlVvy1R3iAhf
	 +WzXPDhXZdiyV77QIWIWThl4Y4v+cd2uepp5n2pQwqKt+coHRXLEh8E4bjkf3xrKfQfVU
	 VqcRl0bUHJzipuZifAFEu38sY+g+cZK/+xCeKxTcuVZ32gMERnQ1/IO1OTxQhCVpYymLD
	 1/gpNsvzHuYY9PlnB9D0LT0R2RDJkoNSioo6pYZLj85u7XQkFEY3Vrj+Q+Hj4AVoXMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=Pcz7C2l9;
	arc=none smtp.remote-ip=45.254.49.198
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08A0606A321;
	Thu, 26 Nov 2026 13:28:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A08A0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=Pcz7C2l9
Received: from user.localdomain (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 561f6fcbc;
	Thu, 26 Nov 2026 21:28:10 +0800 (GMT+08:00)
From: Tian Xuechen <202300460064@mail.sdu.edu.cn>
To: vkoul@kernel.org
Cc: Frank.Li@kernel.org,
	linux-arm-msm@vger.kernel.org,
	dmaengine@vger.kernel.org,
	liguangshuo@mail.sdu.edu.cn
Subject: [PATCH] dmaengine: qcom: gpi: Unregister the DMA providers on unbind
Date: Thu, 26 Nov 2026 21:28:09 +0800
Message-Id: <20261126132809.4091225-1-202300460064@mail.sdu.edu.cn>
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
X-HM-Tid: 0aa2180acbce03a2kunmac47a51f35d968
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaHhlDVkNLS0MeTE8eThpCGFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlLVUtVS1VLWQ
	Y+
DKIM-Signature: a=rsa-sha256;
	b=Pcz7C2l9x8BConIdvFRbjv+zdMYUtLHAFJTxQ/xSXoFiibEhGu4DbScqdNSFTa/PtSLi+XT0+l3Di2DDeb2Iz0uWwBCbEYr9WNgqbpFHzsvJzsNbcyIulEa+xEGaedmwdiacg+ugYdWU+UTgzR4BCFAvWY4JtQe+/ZatsiCJpFU=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=HCK+qoZcybpccL8/UdjiQOeq275clZ4WAJC1smngnlo=;
	h=date:mime-version:subject:message-id:from;

From: Tian Xuechen <202300460064@mail.sdu.edu.cn>

The GPI driver leaves the DMA device registered if OF controller
registration fails, and leaves both registrations in place on unbind.
Use the managed registration helpers so the OF controller and DMA
device are unregistered before their backing storage is released.

This issue was found by our static analysis tool under development.

Fixes: 5d0c3533a19f ("dmaengine: qcom: Add GPI dma driver")
Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
---
 drivers/dma/qcom/gpi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
index d3c3d0f35afb..d34bcd737b60 100644
--- a/drivers/dma/qcom/gpi.c
+++ b/drivers/dma/qcom/gpi.c
@@ -2284,14 +2284,14 @@ static int gpi_probe(struct platform_device *pdev)
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
+	ret = devm_of_dma_controller_register(&pdev->dev, pdev->dev.of_node,
+					      gpi_of_dma_xlate, gpi_dev);
 	if (ret) {
 		dev_err(gpi_dev->dev, "of_dma_controller_reg failed ret:%d", ret);
 		return ret;

base-commit: 4dce97c6c265544342e716e62fd24bbb232590c5
-- 
2.43.0

