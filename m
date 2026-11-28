Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795863751;
	b=O8VYL7uMU9ys7RHDoqWzbilrrhpuTnnXxArWN9PddfG7KKDsUlW+kNWuU6tMDj2+/Mfc
	 I5disAppvBOaN1Y8Rv5vqWjYbICWGkBcdLVdoYbCrDszV4M/cw0kBP3Cpg/wfilixzORg
	 7tcib2oXNcxiuzVgkeA2LHT4Htb999NLRk6YQe3yfQVJm3JpLojWoj0Z9OLjk+SvX3QQd
	 aUzOl5+IarAbbva3sC8TKSWflyKxugnwO+YeDiCDomBdewS2ZOrzuYEwjrfmC9wmCxIIw
	 Y7ytPuY04nDdlo/7Ta5TWipSLqEu50dmScRRXgBMURPBhgvotr9Y8Fe/I/hUik42nbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795863751;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=lsX1kvCYPyCyQ9ElHTqyk4H4ZgX2r+VHPSwFofCb59w=;
	b=36gxgFsch7iaRLgLFWgqakPQaKM8/gqDNkSm9lPlL5c8SQ0efIPdqC4gXd09rUHDgsbB
	 +924klX77FmZmKHDBPvssg2/8ce0OEVo/WVbH/hS5HbO2B0OrYPXXv7fbDogJ02zj9pdn
	 UVal8FDHgVGVzD9g1DOx7KLQVMiH8d7t2zjN993WzE6xlT+yUAcVDe9XpfcVbc1wtWIKy
	 mjuGH/AxrNJ9NxcXXasTwioGViDxDtaYEy8Q2xrj5ZcM8+5FHf8jFQj/57nzFurtbyDT7
	 P4H+vP27b2y2HTOr7ubl2+svtAvqPQwG+A8tmqaTZUtiHBmesaheNOh0mFx8rqWw+jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=bt3nr5+7;
	arc=none smtp.remote-ip=45.254.49.197
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EB9606A329
	for <dmaengine@vger.kernel.org>; Sat, 28 Nov 2026 11:02:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51EB9606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=bt3nr5+7
Received: from user.localdomain (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5656652ab;
	Sat, 28 Nov 2026 19:02:26 +0800 (GMT+08:00)
From: Tian Xuechen <202300460064@mail.sdu.edu.cn>
To: vigneshr@ti.com,
	vkoul@kernel.org,
	peter.ujfalusi@ti.com,
	grygorii.strashko@ti.com
Cc: Frank.Li@kernel.org,
	dmaengine@vger.kernel.org,
	liguangshuo@mail.sdu.edu.cn
Subject: [PATCH 2/2] dmaengine: ti-dma-crossbar: Unregister the DMA router on removal
Date: Sat, 28 Nov 2026 19:02:24 +0800
Message-Id: <20261128110224.875369-3-202300460064@mail.sdu.edu.cn>
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
X-HM-Tid: 0aa221d2186403a2kunm94af19d73cbc63
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZSklIVksYTk5OSEoeSBkeSlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlPS0hVSktJQk
	NDTFVKS0tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=bt3nr5+7Sfkn5edhBqxobVRgWqSMK0SM4tL5mFzSIWtrEK38/75LNSiIeA4QA30CEl968wMJuFe1jHKrwKCiC/r/14CM5F581XG9PzzVUUkuDNb4+YtPZtGdTT1si3jdtzoL9FGw5DGTACANnVOyUWxomAtNtFDjVe2vZcWqZTs=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=lsX1kvCYPyCyQ9ElHTqyk4H4ZgX2r+VHPSwFofCb59w=;
	h=date:mime-version:subject:message-id:from;

From: Tian Xuechen <202300460064@mail.sdu.edu.cn>

The DMA router remains in the OF registry after its device-managed
data is released. Remove the routing entry when the device is
unbound.

This issue was found by our static analysis tool under development.

Fixes: a074ae38f859 ("dmaengine: Add driver for TI DMA crossbar on DRA7x")
Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
---
 drivers/dma/ti/dma-crossbar.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/dma/ti/dma-crossbar.c b/drivers/dma/ti/dma-crossbar.c
index b1e66792e7de..a35a8a60c300 100644
--- a/drivers/dma/ti/dma-crossbar.c
+++ b/drivers/dma/ti/dma-crossbar.c
@@ -467,12 +467,18 @@ static int ti_dma_xbar_probe(struct platform_device *pdev)
 	return ret;
 }
 
+static void ti_dma_xbar_remove(struct platform_device *pdev)
+{
+	of_dma_router_free(pdev->dev.of_node);
+}
+
 static struct platform_driver ti_dma_xbar_driver = {
 	.driver = {
 		.name = "ti-dma-crossbar",
 		.of_match_table = ti_dma_xbar_match,
 	},
 	.probe	= ti_dma_xbar_probe,
+	.remove	= ti_dma_xbar_remove,
 };
 
 static int omap_dmaxbar_init(void)

-- 
2.43.0

