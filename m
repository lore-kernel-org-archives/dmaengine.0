Received: from mail-m49204.qiye.163.com (mail-m49204.qiye.163.com [45.254.49.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB954B3379;
	Thu,  3 Sep 2026 14:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788445061; cv=none; b=Ar9RWFbmbhVSKm1EER8oBsldoHY7BzSchyXmipUym/iLZngLcMiKJgrx8eUWfOCGMQWEWD0TzDtccvBsOvHVFiisjZ8oEdXowEaUkS1JQXWQrHxYszeHIICn/ZDo5qjJ0Ir+pZQ24JG7DzSoMvZP8Tz7/xfsG8fRBTuja58Dy88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788445061; c=relaxed/simple;
	bh=JO1y5pdutmTvqovLl+SMOHQkgHGXSiEs+j2euU0g30Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dm+evK6KD9BB9lqHdr+Cd+RzTBTtHofUnuVnnTAVvJ79o1lDvbMqNYUUChCfL7kY5uosmp4bZl31EectDu/CzIEfBIBht/PHVMKQ6LqyWYvNzfteZHpZf2/ZIoDBpImWtzSXBCNYvunHLpomEglukWCjs4x5nobz5z0hE7cMC4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnics.com; spf=pass smtp.mailfrom=resnics.com; arc=none smtp.client-ip=45.254.49.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnics.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnics.com
Received: from localhost.localdomain (unknown [115.220.204.6])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4c6c1495a;
	Thu, 3 Sep 2026 19:54:51 +0800 (GMT+08:00)
From: Ruizhe Zhou <zhouruizhe@resnics.com>
To: Vinod Koul <vkoul@kernel.org>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Frank Li <Frank.Li@kernel.org>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ruizhe Zhou <zhouruizhe@resnics.com>
Subject: [PATCH 3/3] dmaengine: sprd: Remove obsolete 32-bit DMA mask fallback
Date: Thu,  3 Sep 2026 19:54:41 +0800
Message-Id: <20260903115441.912500-4-zhouruizhe@resnics.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20260903115441.912500-1-zhouruizhe@resnics.com>
References: <20260903115441.912500-1-zhouruizhe@resnics.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0671f2e7e03ackunma38d057f6ea6d
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCGk5PVhgZHx1PQx9ISENJTFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlKSk5VSUlLVUlLT1VNWVdZFhoPEhUdFFlBWU9LSFVKS0
	lPT09IVUpLS1VKQktLWQY+

The DMA API guarantees support for masks of 32 bits or wider and
explicitly identifies retrying a 32-bit mask after a wider request as
incorrect:
https://docs.kernel.org/core-api/dma-api-howto.html#dma-addressing-capabilities

Remove the obsolete fallback while retaining the error check so that a
genuine DMA setup failure is still reported and aborts initialization.

Signed-off-by: Ruizhe Zhou <zhouruizhe@resnics.com>
---
 drivers/dma/sprd-dma.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/sprd-dma.c b/drivers/dma/sprd-dma.c
index 087fea3af2e4..b9f705dd80e5 100644
--- a/drivers/dma/sprd-dma.c
+++ b/drivers/dma/sprd-dma.c
@@ -1117,11 +1117,8 @@ static int sprd_dma_probe(struct platform_device *pdev)
 
 	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(36));
 	if (ret) {
-		ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
-		if (ret) {
-			dev_err(&pdev->dev, "unable to set coherent mask to 32\n");
-			return ret;
-		}
+		dev_err(&pdev->dev, "unable to set 36-bit DMA mask\n");
+		return ret;
 	}
 
 	/* Parse new and deprecated dma-channels properties */
-- 
2.27.0

