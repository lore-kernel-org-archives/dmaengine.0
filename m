Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795777452;
	b=wrVXcQJDj0gWjT3Ujq/BZxkClJzi/5xypNveNLo5E/Etaaw4VYFEQ+pmhCrmM+jE1p3l
	 gzfjNClNKYOX0uGBcrBFJesp91THisflvM0RFygRAi2xea9+PI6tcVjKXNMY+VU4rHOsX
	 TdQZnDaK5nvp2qTXRnDmDC0TYDoRX1AlrUkmF14jixur1dNKP2/8OpPwsqf1Ketj7UPUQ
	 ZxSdo/BXg32qdUXGWEpRD4x6f2iaI7lKzWzJutcsEW/wYAUVm4c+ED/ZJVRpfaBbm2wKm
	 a02CFDOQ7OfyFdnEw7akQ+yugmwCNzZtrzO2a4RKXQULET1wTHap20vhoAGPFUGAi/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795777452;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=alSIZIsekIUQhonhUr/B6iYQ/WUEy+yWuBJPxD0PpPw=;
	b=OY+ENDEZbrtsw6AbbGtPqVKndX9j1XIKKdOuLXKi5nVE4N65DgHvSKR0xtANJCn3yt/M
	 fRxzS3EwWBft9CkV7jL/j0fkpmSZGYv7wGvTyxTv32xhIXxR9AX/Ku30v2U4X6eroaOK+
	 39eU12nOdtcNfRjWSe2P7+6dSpTFSXt13dDoaP9vvN8fALWPCj6ocgaCucRG/Eo9y3A4U
	 TkQZa38q8oDRjPZxMP+eREXeUNuBpMmRKsNubi7NjZvBLad2QxzxGM5Bi5vK0VHZcjaEK
	 Rb8qeCOkFXtx70ULuAhOqg4lHEZWIoik8YxQQUrnWLepc/K48Vbrb9Qhqm5Kr4M+j8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=bRdMEaXs;
	arc=none smtp.remote-ip=45.254.49.197
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DC8606A31E;
	Fri, 27 Nov 2026 11:04:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51DC8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=bRdMEaXs
Received: from user.localdomain (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5641a2c3c;
	Fri, 27 Nov 2026 19:04:03 +0800 (GMT+08:00)
From: Tian Xuechen <202300460064@mail.sdu.edu.cn>
To: vkoul@kernel.org
Cc: Frank.Li@kernel.org,
	Frank.li@oss.nxp.com,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vz@mleia.com,
	piotr.wojtaszczyk@timesys.com,
	manabian@gmail.com,
	robh@kernel.org,
	saravanak@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/3] dmaengine: lpc18xx-dmamux: Use managed DMA router registration
Date: Fri, 27 Nov 2026 19:03:59 +0800
Message-Id: <20261127110400.379397-3-202300460064@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261127110400.379397-1-202300460064@mail.sdu.edu.cn>
References: <20261127110400.379397-1-202300460064@mail.sdu.edu.cn>
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
X-HM-Tid: 0aa21cad381503a2kunm13da2c70394a87
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDS0pKVkweQ01OThkeHktJGVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlPS0hVSktJQk
	NDTFVKS0tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=bRdMEaXsL+mWkP4+3jgLXai+tVVsoSQO8Hz6+Y2qU+hsj5J8KmwkkDqUZLXMsIcBITN+c3dc4jKMZluX5yj5qv0S3SpPz3HcrC5UGHZO39fTdiI9ITXcsVY09whkcLXVe0vI6txWTNVkVgfX7R8tK5kRfNGDj02nxaFLOErLGY4=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=alSIZIsekIUQhonhUr/B6iYQ/WUEy+yWuBJPxD0PpPw=;
	h=date:mime-version:subject:message-id:from;

The DMA router remains in the OF registry after its device-managed
data is released. Use managed registration to remove the routing
entry before the router data is freed.

This issue was found by our static analysis tool under development.

Fixes: e5f4ae84be74 ("dmaengine: add driver for lpc18xx dmamux")

Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
---
Changes in v2:
  - Use devm_of_dma_router_register() instead of a remove callback.

 drivers/dma/lpc18xx-dmamux.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/lpc18xx-dmamux.c b/drivers/dma/lpc18xx-dmamux.c
index d3ff521951b8..0c6758c53a72 100644
--- a/drivers/dma/lpc18xx-dmamux.c
+++ b/drivers/dma/lpc18xx-dmamux.c
@@ -166,8 +166,9 @@ static int lpc18xx_dmamux_probe(struct platform_device *pdev)
 	dmamux->dmarouter.dev = &pdev->dev;
 	dmamux->dmarouter.route_free = lpc18xx_dmamux_free;
 
-	return of_dma_router_register(np, lpc18xx_dmamux_reserve,
-				      &dmamux->dmarouter);
+	return devm_of_dma_router_register(&pdev->dev, np,
+					   lpc18xx_dmamux_reserve,
+					   &dmamux->dmarouter);
 }
 
 static const struct of_device_id lpc18xx_dmamux_match[] = {
-- 
2.43.0

