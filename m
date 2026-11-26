Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699694;
	b=CC6HSfadiHRlJkWFbDeQEOSamoihLR71mlqre1PuJsWRv+O8c9BfTkZyAINqmd2FK9HT
	 qdImHbkazPw6UE5XC0YjT9pCN0yaWLea7DPXreIq+g5FVMtJn+OL5BUxTDeVRRF1ksrXe
	 6uczklOqF6/x/qjjMHthemAA6i0KwE8uG5QN+SkT0f3AbsZsOBoVsTDVtanEMkbI+tnXq
	 QQ8tx/qSnkLe5UFuC1gCreL3Od+0PK3DVI4Q6iAU6fD45QsaYGLcADU38wHhGbm0OpadF
	 lX4BWkN8XwvvhUmto64VMYiEDOlfGBZvMA+sH1geZejvS8CStXuezZraMhGCbo66j0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699694;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=K0fTtBZCCQIk+Resl0yJT5nGklgp5fQhOBmhfcJ+hxc=;
	b=LIkB8KaXC3IUdIW7VexjnEkpmXcqpb62KzYobJ2R5sWR3rZOindce7b9NDibxeRJ+ueV
	 ZCbViNVlr65Wh0QnUMiRubU/GM2pf9ftU6Ap8vnFTWHDQel5vKZi954Dqh10JTvorppWY
	 s9hmhEm1+YSzz2EbkKs4XgPjDXJtJAe0SyhTOrKjCfUn56Y3/XO82QrHZttHXK0xkQ5Fh
	 MtbnWUYuJJcbbEjR2vQBh/ZW0bcATRElNUiOIC1n+Hnw+p9zR5maoLLWf/13u6/AkkPRa
	 2ZKIVscHE1SDlrO29i3kiPJA0tUmGO+MyAkVX0ISDglFT2ZBmqpv7afJPhBgSWWdHSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b="W1G/xKMS";
	arc=none smtp.remote-ip=45.254.49.197
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D675606A31C
	for <dmaengine@vger.kernel.org>; Thu, 26 Nov 2026 13:28:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D675606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=W1G/xKMS
Received: from user.localdomain (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 561f6fcbb;
	Thu, 26 Nov 2026 21:28:09 +0800 (GMT+08:00)
From: Tian Xuechen <202300460064@mail.sdu.edu.cn>
To: vkoul@kernel.org,
	vz@mleia.com,
	piotr.wojtaszczyk@timesys.com,
	manabian@gmail.com
Cc: Frank.Li@kernel.org,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	liguangshuo@mail.sdu.edu.cn
Subject: [PATCH 2/2] dmaengine: lpc32xx-dmamux: Unregister the DMA router on removal
Date: Thu, 26 Nov 2026 21:28:06 +0800
Message-Id: <20261126132806.4091183-3-202300460064@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126132806.4091183-1-202300460064@mail.sdu.edu.cn>
References: <20261126132806.4091183-1-202300460064@mail.sdu.edu.cn>
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
X-HM-Tid: 0aa2180ac63c03a2kunme5d0c11035d963
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaTUlJVhhNH0xCSUMYH0wYTlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlLVUtVS1VLWQ
	Y+
DKIM-Signature: a=rsa-sha256;
	b=W1G/xKMSx7UEkSRjs+GjF2uNYd+P8ulHDcsULEH92rnnx/IGmbsuL0+hQ+KimXD+l6TYBo1v+LTxHWGltogynqiqnYiZhPHMRGqIDC78VKT52lVF0A+cVnVmMaaohgLmHMfljZ/tEBIy7waf+/L10Ox9oXV3CCJo2VIFqb+/OIE=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=K0fTtBZCCQIk+Resl0yJT5nGklgp5fQhOBmhfcJ+hxc=;
	h=date:mime-version:subject:message-id:from;

From: Tian Xuechen <202300460064@mail.sdu.edu.cn>

The DMA router remains in the OF registry after its device-managed
data is released. Remove the routing entry when the device is
unbound.

This issue was found by our static analysis tool under development.

Fixes: 5d318b595982 ("dmaengine: Add dma router for pl08x in LPC32XX SoC")
Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
---
 drivers/dma/lpc32xx-dmamux.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/dma/lpc32xx-dmamux.c b/drivers/dma/lpc32xx-dmamux.c
index 4fbeb3496acf..397640aacd8e 100644
--- a/drivers/dma/lpc32xx-dmamux.c
+++ b/drivers/dma/lpc32xx-dmamux.c
@@ -184,6 +184,11 @@ static int lpc32xx_dmamux_probe(struct platform_device *pdev)
 				      &dmamux->dmarouter);
 }
 
+static void lpc32xx_dmamux_remove(struct platform_device *pdev)
+{
+	of_dma_router_free(pdev->dev.of_node);
+}
+
 static const struct of_device_id lpc32xx_dmamux_match[] = {
 	{ .compatible = "nxp,lpc3220-dmamux" },
 	{},
@@ -191,6 +196,7 @@ static const struct of_device_id lpc32xx_dmamux_match[] = {
 
 static struct platform_driver lpc32xx_dmamux_driver = {
 	.probe	= lpc32xx_dmamux_probe,
+	.remove	= lpc32xx_dmamux_remove,
 	.driver = {
 		.name = "lpc32xx-dmamux",
 		.of_match_table = lpc32xx_dmamux_match,

-- 
2.43.0

