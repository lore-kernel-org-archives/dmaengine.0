Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779220;
	b=Gk34+9Ihz81Ho7xfUXzRdoIFS3W02FW+celWvk2gxT5OWGWcLBn/VS2tJCKMPdZtId9R
	 nsutvtP+vln4mwiRdkaNzIA3napb+Y9Is6g8lHDMwwb6g7nnZ3VVAOyPi9KBxVBoX0aA5
	 nJt5W9rgszXJT4+XPo8Ajs0xd+Czhfpo/nONLdnn6A4KjuXSVoYYf915al2lJpWKJwzyw
	 qMOn+vXRwfwz1lyoUgj785V3Q5Kbirg4NUazKiO7vWG2hcPo+FkeKWg5Ok0kldoXxc3vy
	 NMuepa+/y7grdiAOa1fAmUJBod/S0mpuLRsCpznG5r97KxqtV+f0c16Q4U3rsM7MBow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779220;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=jZEqRTavH+CANYJ0mUrthw8G2lgjmIaW27KnktRfffI=;
	b=HbUt4P3dH7PS5K4YDgVcjARATD5dniHsW5YYp0qckTQNwH7IQAK6Fci0OPCNn65e1WTF
	 nEVopQ3549rQrSvsgdiDI7TIKRTYSJZaJwIFfq36rvYAg7drN5ccv9EK1qJZhO1iYj4pK
	 vmi+olRdYiMhENWf5Am4UnIUH2pU5Yw4RhvkkHx2szzOLfuWaL78jBrajmru+L7BiTaHx
	 8SJq4oYmIBiJzATKm8oTFlfMF3o207i/rRvR+25oUdDEIRbZIx4VUUzJUoXS1PNTUFNfW
	 awKeK8qYHAIPz63tRoPuoU4Kgw8I74RlaaoWnoKkihkUdCVfcvD/2iUiCWidEs4lsog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b="J/Tpee7o";
	arc=none smtp.remote-ip=45.254.49.197
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BEA606A31E
	for <dmaengine@vger.kernel.org>; Fri, 27 Nov 2026 11:33:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91BEA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=J/Tpee7o
Received: from user.localdomain (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 564299838;
	Fri, 27 Nov 2026 19:33:36 +0800 (GMT+08:00)
From: Tian Xuechen <202300460064@mail.sdu.edu.cn>
To: amelie.delaunay@foss.st.com,
	vkoul@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	cedric.madianga@gmail.com,
	pierre-yves.mordret@st.com
Cc: Frank.Li@kernel.org,
	dmaengine@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/3] dmaengine: stm32-mdma: Use managed OF DMA controller registration
Date: Fri, 27 Nov 2026 19:33:32 +0800
Message-Id: <20261127113332.390552-4-202300460064@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261127113332.390552-1-202300460064@mail.sdu.edu.cn>
References: <20261127113332.390552-1-202300460064@mail.sdu.edu.cn>
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
X-HM-Tid: 0aa21cc8434003a2kunm85c9bc3d395e01
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZThpLVh9CSEJDHhpPQh9MTVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlPS0hVSktJQk
	NDTFVKS0tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=J/Tpee7oWLcl1bGmBAlS/7Q4qwfz4ze/BlWkr9/kzn9FLt5Gmla4OtK+DZiegfiDqdafu9XE882AExWmoBS+SNh7Yn19QBWbIEXeDhiQsKQethDZihg/iGFcJb0z34rOQaByl9kvq7QN58IlRIHeCEBWJJ1laei7tcWzU3KQPnc=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=jZEqRTavH+CANYJ0mUrthw8G2lgjmIaW27KnktRfffI=;
	h=date:mime-version:subject:message-id:from;

From: Tian Xuechen <202300460064@mail.sdu.edu.cn>

The OF controller outlives the managed DMA engine and its channel
data on removal. Use the managed registration helper to withdraw the
OF controller first.

This issue was found by our static analysis tool under development.

Fixes: a4ffb13c8946 ("dmaengine: Add STM32 MDMA driver")
Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
---
 drivers/dma/stm32/stm32-mdma.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/stm32/stm32-mdma.c b/drivers/dma/stm32/stm32-mdma.c
index 4851c1c7ce0c..c95a9bb1171b 100644
--- a/drivers/dma/stm32/stm32-mdma.c
+++ b/drivers/dma/stm32/stm32-mdma.c
@@ -1714,7 +1714,8 @@ static int stm32_mdma_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_clk;
 
-	ret = of_dma_controller_register(of_node, stm32_mdma_of_xlate, dmadev);
+	ret = devm_of_dma_controller_register(&pdev->dev, of_node,
+					      stm32_mdma_of_xlate, dmadev);
 	if (ret < 0) {
 		dev_err(&pdev->dev,
 			"STM32 MDMA DMA OF registration failed %d\n", ret);

-- 
2.43.0

