Received: from mail-m16023652200.xmail.ntesmail.com (mail-m16023652200.xmail.ntesmail.com [160.236.52.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067F7495524;
	Thu,  3 Sep 2026 11:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.236.52.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788436503; cv=none; b=t4aFxjpQLBKyse3HUYl0l7N/yNxe/6NburXt2xxBXbQdiGZ/hyynxmzZlAw5di8ZMtRye7mouzx9UNXGcmmdVXeBvNPfJw7xHtJZd8tBHF9aaXcVBcUEpPQMHr+YDdfzPPL8xL9I6tc1KOVx2mPUeqJfnEKj894ULbXOUNNH+L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788436503; c=relaxed/simple;
	bh=hby4S036lKbDxVAGNNn2Y+hoZvcqrw/ovKQt2X4mQRs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZhXU8V5hpKHZ8P3MVRjPk6Vbo7KYzau7n/oj5JmtpSwlIEUTrfn+os1DNTE3GkxZYqu0hRPZ6u9Nw0qzak4p0CxpEJmK0W5i4GyqRFtrhDZKqCWGJfeHp2INQOobLiww3TH7YyOtYephtGoDx/RtuKaI441iPb14nW4oQORqoz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnics.com; spf=pass smtp.mailfrom=resnics.com; arc=none smtp.client-ip=160.236.52.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnics.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnics.com
Received: from localhost.localdomain (unknown [115.220.204.6])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4c6c14959;
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
Subject: [PATCH 2/3] dmaengine: plx_dma: Remove obsolete 32-bit DMA mask fallback
Date: Thu,  3 Sep 2026 19:54:40 +0800
Message-Id: <20260903115441.912500-3-zhouruizhe@resnics.com>
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
X-HM-Tid: 0aa0671f2bce03ackunma38d057f6ea6b
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDTE9JVkpNTRpJQx1KHUgfH1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlKSk5VSUlLVUlLT1VNWVdZFhoPEhUdFFlBWU9LSFVKS0
	lPT09IVUpLS1VKQktLWQY+

The DMA API guarantees support for masks of 32 bits or wider and
explicitly identifies retrying a 32-bit mask after a wider request as
incorrect:
https://docs.kernel.org/core-api/dma-api-howto.html#dma-addressing-capabilities

Remove the obsolete fallback while retaining the error check so that a
genuine DMA setup failure is still propagated and aborts initialization.

Signed-off-by: Ruizhe Zhou <zhouruizhe@resnics.com>
---
 drivers/dma/plx_dma.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/dma/plx_dma.c b/drivers/dma/plx_dma.c
index 84941a918b01..ad9187448ed2 100644
--- a/drivers/dma/plx_dma.c
+++ b/drivers/dma/plx_dma.c
@@ -562,8 +562,6 @@ static int plx_dma_probe(struct pci_dev *pdev,
 		return rc;
 
 	rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(48));
-	if (rc)
-		rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
 	if (rc)
 		return rc;
 
-- 
2.27.0

