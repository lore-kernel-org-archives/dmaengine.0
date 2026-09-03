Received: from mail-m19731112.qiye.163.com (mail-m19731112.qiye.163.com [220.197.31.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89E64189DE;
	Thu,  3 Sep 2026 12:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788437424; cv=none; b=AOfD+gxoc29tmi9UDcWAAw24t9dS6ZN3YJ/mekd+zRITDanmvn1bVaiuJ/2RG+oWkgaqVp8ZB0DDY4KEnBNHJCAT2HxskTl8tt/z8JzDOKCgpttHR+0TksofCF0edSH8rV/Jsbcc/BQWyoZs+9ah8dgbjT2SggjfP04B0gvHRxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788437424; c=relaxed/simple;
	bh=5HLKsCArL1s3JTqS6jLCeG/O7wO8y6jszUadWPpRwyQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cp5y+kxEH9Xzv2obAtvAdUZ5uciCfj+cloPqRXU7bnvxqQI+J3BC14TMyo8RESuUOhVnk4a+OfjeKiuine66AqLqVFxK2tTuzy3cczl4BLXQiDHXcly0KMKN6OJmW72ca4CHw6xLNAalj9v+x4UIlW9l55R7YPU623bAZQhLnBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnics.com; spf=pass smtp.mailfrom=resnics.com; arc=none smtp.client-ip=220.197.31.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnics.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnics.com
Received: from localhost.localdomain (unknown [115.220.204.6])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4c6c14957;
	Thu, 3 Sep 2026 19:54:50 +0800 (GMT+08:00)
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
Subject: [PATCH 1/3] dmaengine: ptdma: Remove obsolete 32-bit DMA mask fallback
Date: Thu,  3 Sep 2026 19:54:39 +0800
Message-Id: <20260903115441.912500-2-zhouruizhe@resnics.com>
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
X-HM-Tid: 0aa0671f28f903ackunma38d057f6ea65
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDQ0hOVkMZTxgZT0JCGhhMQ1YVFA
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
 drivers/dma/amd/ptdma/ptdma-pci.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/amd/ptdma/ptdma-pci.c b/drivers/dma/amd/ptdma/ptdma-pci.c
index 22739ff0c3c5..d36bb9c67325 100644
--- a/drivers/dma/amd/ptdma/ptdma-pci.c
+++ b/drivers/dma/amd/ptdma/ptdma-pci.c
@@ -178,12 +178,8 @@ static int pt_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(48));
 	if (ret) {
-		ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
-		if (ret) {
-			dev_err(dev, "dma_set_mask_and_coherent failed (%d)\n",
-				ret);
-			goto e_err;
-		}
+		dev_err(dev, "dma_set_mask_and_coherent failed (%d)\n", ret);
+		goto e_err;
 	}
 
 	dev_set_drvdata(dev, pt);
-- 
2.27.0

