Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C13E230BD5;
	Sun, 18 Oct 2026 04:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792296476; cv=none; b=HS43SuM3a67KXFo473l4tEE9aSjfbER6Y+b6eZohz6N+yCnL5+yxfj9d0IpyZ5qNUBHcKaaQmw4bQrPOZZQ1//PY2v0WJDA4Yo2jX//qvTswmHpl+dTU3RjzOMPB1kzU7kqdlXNiFCOowmSmoEYWuG3mXhSHs+ictOzXHeuov5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792296476; c=relaxed/simple;
	bh=G8uvKAICumnoju16izJLRqSV727WGM6DvqfjkyaGuNU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=foIbPgIA4prXgBmg05MOBGdGXGL+5zhRn/KLLKdiPxZmQWY05o5W/WSr8ICxS/pKJLW+DB9ftk4KziTyO4gAO65i091T3vjsu4FSGU/yJ8nKflveMtJxnqQprSAnOjtFAbRubjydlOCPY2fS/b9+vsl+aQ0XtXenVBIOwrCrIkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=cro0uQsQ; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="cro0uQsQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=VB
	/wzJZuyZ3XOVyTvVWo7955Ny9Hkqwfin90Z3YdYNk=; b=cro0uQsQu2X3IgTutx
	5OSQXe2l3q5mpHj4Gm5X2k6+zwZM3TKr5peB07LrJolRAx0VCQUL0FEr6CmiNuL6
	ohzYmnYrXM3nHMc5DOGPJhCY75tm9IaXXKGzJpPw3pNQ8xkIy6YT+GZDqQKpYZQ9
	4ABI8L54FVgztcJAzPP4eDEoc=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3n6n9RdRqdUaGAw--.28247S3;
	Sun, 18 Oct 2026 12:07:28 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Ryan Mallon <rmallon@gmail.com>,
	Mika Westerberg <mika.westerberg@iki.fi>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 1/7] dmaengine: ep93xx: drain tasklet before freeing channel resources
Date: Sun, 18 Oct 2026 12:07:17 +0800
Message-Id: <20261018040724.534641-2-yaojiale02@163.com>
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
X-CM-TRANSID:_____wD3n6n9RdRqdUaGAw--.28247S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7tF4UAw4UtFykuF1xXw1UJrb_yoW8JFy7pF
	Z7G3yDuryIyF1ftF1DJw10vF1rWwsxKrWjkrZrKw1fZr4Fqr10qr1rC34jvFyqqrWfZa17
	KFyqy3yfCFs3Cw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pMuWdAUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzgBhm2rURgAnHAAA33

The DMA interrupt handler can schedule the channel tasklet. Releasing
the IRQ waits for a running interrupt handler, but it does not drain a
tasklet that was already queued.

The channel resource release path frees the software descriptors and
disables the clock while such a tasklet can still access the channel and
invoke a completion callback.

Free the IRQ first to stop new tasklet producers, then kill the tasklet
before releasing the descriptors and clock.

Fixes: 5fa29a17fabf ("dmaengine: add ep93xx DMA support")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/dma/ep93xx_dma.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/ep93xx_dma.c b/drivers/dma/ep93xx_dma.c
index 311e55a97ba9..6134e9ca699d 100644
--- a/drivers/dma/ep93xx_dma.c
+++ b/drivers/dma/ep93xx_dma.c
@@ -1015,11 +1015,13 @@ static void ep93xx_dma_free_chan_resources(struct dma_chan *chan)
 	list_splice_init(&edmac->free_list, &list);
 	spin_unlock_irqrestore(&edmac->lock, flags);
 
+	free_irq(edmac->irq, edmac);
+	tasklet_kill(&edmac->tasklet);
+
 	list_for_each_entry_safe(desc, d, &list, node)
 		kfree(desc);
 
 	clk_disable_unprepare(edmac->clk);
-	free_irq(edmac->irq, edmac);
 }
 
 /**
-- 
2.34.1

