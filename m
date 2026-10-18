Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555743D331D;
	Sun, 18 Oct 2026 04:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792296478; cv=none; b=WsS7gdstSa90GzLcxm7rY3VHzGANgz/8ETOwqkB/nDCZxuQ2N41B2+ZcY9b/jlU2kUpxD0HWU0HF9vLDPuiU4O17X25l69SacLAMixpmjQJ1DdoarsqFj3Lan6FDFu26C4nDuQumyGGJvnlzFtqDmSL6Gn30bgLT0y6B89jRsxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792296478; c=relaxed/simple;
	bh=8cjbfrxYo0UQ0WDiDa+//l9dLK+I++cvmJNB2g+ehfA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EFL+ddAjOsJnLhOPCJ7N30umr0rsq4qxt4PstncZ9c0nOihYdwGUF3MOq8Ry7zLKIMT+ExhqqL4Dqxf72fXT/7a2LYjH/M9N+V2rDe0AJyiwvY9AN+vhkb09msW9IZxLgzw4QQXbD7cEsY6Fk1B3hlpX5HhsJXB2h9M79gCM+F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=RYUa1hc+; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="RYUa1hc+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=wi
	Uvs0fNM6gXqEcz9Zq//el9YcEiT3LERUrk3rtH4eg=; b=RYUa1hc+lYtbcx0fYA
	q4wo2Fhqzp3rYrbGX868IbuL8K+qm5xm3iIK7LcSU+KcjUrIA/YlGlp02t9DILOZ
	3LuP8jztTPcovqr/8EMQmfXXqg6Difm8IXXQWu/4E0AHjIBVKvuwtZnxaqrxR+Nu
	kpxCJQ+8HsaIdOIhxv92oIBLo=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3n6n9RdRqdUaGAw--.28247S5;
	Sun, 18 Oct 2026 12:07:31 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Zhangfei Gao <zhangfei.gao@marvell.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 3/7] dmaengine: mmp_pdma: drain channel tasklets during removal
Date: Sun, 18 Oct 2026 12:07:19 +0800
Message-Id: <20261018040724.534641-4-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261018040724.534641-1-yaojiale02@163.com>
References: <20261018040724.534641-1-yaojiale02@163.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3n6n9RdRqdUaGAw--.28247S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7uw4xCw13GFWkGFWrCr18AFb_yoW8JF4xpF
	yUGay3WrZ7KF4Y9a4DGw4UZ345XFnaq3yavrW7t3909FZ3Xr9Y9Fy8Ja1UKa98JFWxua1f
	tFWUtryruw47Zr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRJ5rsUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7wNhm2rURgPHzwAA3l

PDMA interrupt handlers schedule per-channel tasklets that process
descriptor lists, invoke callbacks and return descriptors to their
pools. Freeing the IRQs does not drain tasklets that were already queued.

After freeing all controller or channel IRQs, kill every channel tasklet
before unregistering the DMA device and releasing its managed state.

Fixes: c8acd6aa6bed ("dmaengine: mmp-pdma support")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/dma/mmp_pdma.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/dma/mmp_pdma.c b/drivers/dma/mmp_pdma.c
index ed520737882b..a371f017fc3e 100644
--- a/drivers/dma/mmp_pdma.c
+++ b/drivers/dma/mmp_pdma.c
@@ -1119,6 +1119,7 @@ static void dma_do_tasklet(struct tasklet_struct *t)
 static void mmp_pdma_remove(struct platform_device *op)
 {
 	struct mmp_pdma_device *pdev = platform_get_drvdata(op);
+	struct mmp_pdma_chan *chan;
 	struct mmp_pdma_phy *phy;
 	int i, irq = 0, irq_num = 0;
 
@@ -1141,6 +1142,9 @@ static void mmp_pdma_remove(struct platform_device *op)
 		}
 	}
 
+	list_for_each_entry(chan, &pdev->device.channels, chan.device_node)
+		tasklet_kill(&chan->tasklet);
+
 	dma_async_device_unregister(&pdev->device);
 }
 
-- 
2.34.1

