Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.71.155.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779219;
	b=vDCFt+jm6F7sBWdgCIj4jItdfg/4lYV8Mo/F8jMciyEF6rXIsroCPR/q6YhAjSvviXab
	 UPzQQCTFV6DIg4l0/Jf99KKV3dGl0en8LTDczYSX2XhXjacFl7Qnkp/Hvt/48CoXqJ86b
	 Es/pOxj5RbJQoU0a8xJavk+5wCksRLYV5Y7YJbKWvfzrAtt6gHaDicGxgkL4WoBrDPXh4
	 EZNljM5+vEH+h2LzcCOS8xSCfCWr1DGEZaB9GlWGPRgqSDvQm3kgaADvf+7QlADEUr67X
	 vw94VfnyQKNLy6CWp0xzeooK7fkLdx6LkbfBENh3GgBng3J6lPN3so+3MeKBVNzSUtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779219;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=NSB4dlN4H7brFcdBFYN3Nn6XgkkUny+TRmIyH8xk05Q=;
	b=pwZbqU4jSTaRmE0LQSpowhMvh7jpoUSVRsW6ogpWnRrJWL982e6qIXFbZNY2fZOCH6Z4
	 iNZdSCb5xvSUM0NGsBqJ0d+n+a6weuEgPbz3WMwpPbUKFBXDQOo/acDw5Cj2xmvV9GB+a
	 L/18Np82fMIpW2ezSTNSIpNTq81/rxaQ8CrL5rx4LcxCLqdRqxWCkzQJmUgWuVgAkrBtA
	 Gkm7h86sOZbsbnWrWUUGFwv99knKo2T57n6U/0FsxvhvtzMHUMX3luZY9KUIVi+169CKb
	 DjCGT6G/elmy1P+SWSBnNlauu8zcoDIIx9vwJlJE8s1cUzyoUWWMgd76bkafG8jZ8oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=JaiQ8phF;
	arc=none smtp.remote-ip=101.71.155.101
Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913D5606A31F
	for <dmaengine@vger.kernel.org>; Fri, 27 Nov 2026 11:33:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 913D5606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=JaiQ8phF
Received: from user.localdomain (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 564299837;
	Fri, 27 Nov 2026 19:33:35 +0800 (GMT+08:00)
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
Subject: [PATCH 2/3] dmaengine: stm32-dma: Unregister the OF controller and DMA device
Date: Fri, 27 Nov 2026 19:33:31 +0800
Message-Id: <20261127113332.390552-3-202300460064@mail.sdu.edu.cn>
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
X-HM-Tid: 0aa21cc83f7503a2kunm85c9bc3d395dff
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCHRpMVkpIHR5LGU8fHkNCQlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlPS0hVSktJQk
	NDTFVKS0tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=JaiQ8phF1xrfeCJQZWnuo9G8CKgJ5p9irviguhM0MVogUFVgnYa6auLfrDOzieF75ruNsIit7jhE5qf4iruJGnm/u6Id7uBu1nyk3l1fnp32yJhSV8GYRNGcJHqOYVG44Fbxs4HanHAZ91T/P0ncXnDoqT2oeFw8sC7oTrf1Nxw=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=NSB4dlN4H7brFcdBFYN3Nn6XgkkUny+TRmIyH8xk05Q=;
	h=date:mime-version:subject:message-id:from;

From: Tian Xuechen <202300460064@mail.sdu.edu.cn>

The OF controller and DMA engine remain registered after the driver
releases its channel data. Unregister both in reverse order when the
device is removed.

This issue was found by our static analysis tool under development.

Fixes: d8b468394fb7 ("dmaengine: Add STM32 DMA driver")
Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
---
 drivers/dma/stm32/stm32-dma.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/dma/stm32/stm32-dma.c b/drivers/dma/stm32/stm32-dma.c
index ba8121d37f51..6392c15b4317 100644
--- a/drivers/dma/stm32/stm32-dma.c
+++ b/drivers/dma/stm32/stm32-dma.c
@@ -1761,6 +1761,14 @@ static const struct dev_pm_ops stm32_dma_pm_ops = {
 			   stm32_dma_runtime_resume, NULL)
 };
 
+static void stm32_dma_remove(struct platform_device *pdev)
+{
+	struct stm32_dma_device *dmadev = platform_get_drvdata(pdev);
+
+	of_dma_controller_free(pdev->dev.of_node);
+	dma_async_device_unregister(&dmadev->ddev);
+}
+
 static struct platform_driver stm32_dma_driver = {
 	.driver = {
 		.name = "stm32-dma",
@@ -1768,6 +1776,7 @@ static struct platform_driver stm32_dma_driver = {
 		.pm = &stm32_dma_pm_ops,
 	},
 	.probe = stm32_dma_probe,
+	.remove = stm32_dma_remove,
 };
 
 static int __init stm32_dma_init(void)

-- 
2.43.0

