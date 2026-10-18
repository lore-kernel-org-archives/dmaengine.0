Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E566C3D1ABA;
	Sun, 18 Oct 2026 04:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792296472; cv=none; b=UVa4ExH5/IO24rOzI6JfGKQKvmI/tRPp6qBRHxLa4ajaOJoRQfHV7txIINLKrC2Kcm9DWVFhsmB9TMATBr8KqHgnqWNbINA/PsfiTuUtZgIwh/GWVrw8U/RCti+hMPvig9aHS47EW44VPfyVEsIX00Uqr/wHS8Q8Ao/K0D9dFwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792296472; c=relaxed/simple;
	bh=fSljAV2FbT77zUxrmANfexkoq8n2WEr9kzNoVzajjOo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IWRnvYRBjAxsf3adpSYZ9OokRgZDrLM5OU7J9HAGswWvIJ5StDQzJwtRMvTW4H6zT+6KaDXzPSww2am6oMjw7R3ctqTmnm/TrdvkmpLA1jY5q8KuQYCqAU0Kh3Bb9WHCVvTWn4Y6N0ohnL7K2mERg+HMS2jGjEuX+15tUQMH2G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=i3NuQwfw; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="i3NuQwfw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=C3
	DrBSmI7PaY49boo7JnEo8GedqFk7giSTwh1QlA6j0=; b=i3NuQwfwaULvIemX7A
	q5uJgYSuK8P28vzUN1vDuKOFLqDZWN7KV6gIVT7pchAcNbMQWmg8y3rIwY5NVZQB
	5zHw5/plj/x5W1AX7Nmvo8SulEiJyy5Ub6bIqCaUiwUa9aqZk8pkVHVNBqQqmotp
	hevaU7QyKsC3gqs09AIzDcw24=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3n6n9RdRqdUaGAw--.28247S7;
	Sun, 18 Oct 2026 12:07:33 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Lennert Buytenhek <buytenh@marvell.com>,
	Maciej Sosnowski <maciej.sosnowski@intel.com>,
	Nicolas Pitre <nico@marvell.com>,
	Dan Williams <djbw@kernel.org>,
	Saeed Bishara <saeed@marvell.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 5/7] dmaengine: mv_xor: drain IRQ tasklet before freeing channel memory
Date: Sun, 18 Oct 2026 12:07:21 +0800
Message-Id: <20261018040724.534641-6-yaojiale02@163.com>
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
X-CM-TRANSID:_____wD3n6n9RdRqdUaGAw--.28247S7
X-Coremail-Antispam: 1Uf129KBjvJXoW7KFyrAr4ftFy7Xr4rArW5Wrg_yoW8WF1xpr
	47J398CrW8ta1ak3Z0k3WrAFW5tFWxJ3yxKr9Fgw13Ww13Zr92vw18C3WjvF1DtrWkZF42
	k398Xw1FgF1DGF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEiSdQUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzgVinGrURgUnZgAA3J

The XOR interrupt handler schedules irq_tasklet to clean channel
descriptor lists. Both device removal and late channel setup failures
can free the coherent descriptor pool while a previously queued tasklet
still refers to it.

Release the IRQ first so no new tasklet can be queued, kill the tasklet,
and only then free the descriptor pool and DMA mappings.

Fixes: ff7b04796d98 ("dmaengine: DMA engine driver for Marvell XOR engine")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/dma/mv_xor.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/mv_xor.c b/drivers/dma/mv_xor.c
index 25ed61f1b089..ec746cd16960 100644
--- a/drivers/dma/mv_xor.c
+++ b/drivers/dma/mv_xor.c
@@ -1013,6 +1013,9 @@ static int mv_xor_channel_remove(struct mv_xor_chan *mv_chan)
 
 	dma_async_device_unregister(&mv_chan->dmadev);
 
+	free_irq(mv_chan->irq, mv_chan);
+	tasklet_kill(&mv_chan->irq_tasklet);
+
 	dma_free_wc(dev, MV_XOR_POOL_SIZE,
 			  mv_chan->dma_desc_pool_virt, mv_chan->dma_desc_pool);
 	dma_unmap_single(dev, mv_chan->dummy_src_addr,
@@ -1025,8 +1028,6 @@ static int mv_xor_channel_remove(struct mv_xor_chan *mv_chan)
 		list_del(&chan->device_node);
 	}
 
-	free_irq(mv_chan->irq, mv_chan);
-
 	return 0;
 }
 
@@ -1162,6 +1163,7 @@ mv_xor_channel_add(struct mv_xor_device *xordev,
 
 err_free_irq:
 	free_irq(mv_chan->irq, mv_chan);
+	tasklet_kill(&mv_chan->irq_tasklet);
 err_free_dma:
 	dma_free_wc(&pdev->dev, MV_XOR_POOL_SIZE,
 			  mv_chan->dma_desc_pool_virt, mv_chan->dma_desc_pool);
-- 
2.34.1

