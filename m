Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827BC3D3002;
	Sun, 18 Oct 2026 04:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792296542; cv=none; b=B45yaK510RRuW4mIZ0oVqqNvpHWGLv30AL0JMXonII+R0QvAbdLBCxcZGvc1oQs94vF3W/ILdzoE+7FagwcO1WGgcE3qyaqgnp/L1daqW0e9lrUVj1VbJ8iHKAyZ1fbG9kjEoDqrohTBqpta0hhI9mLoZXV3t61mWNW7hlMQh2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792296542; c=relaxed/simple;
	bh=bTxRs8G0Bwd7zZ4LjTpBMG7fqtk1rqbL5HVg/LUT/gI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IGwofzti9ny/1WmOS4wOn0fl7TeERR6J6lrTnY0g/TyRXg0vZfFUwBBCSSa13T1ygOEucLfsZKy+OYiOvW+CVsSHRbW4v/8oa+8KUaorHzSU4gGZ1hHRP3AM2lwZppQjG9A218zyngnWo7SKhvMSB2oobuJHMk9B+TvLftGJuek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=U/0ItJJF; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="U/0ItJJF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=O3
	i/yK5rC1k+fn8RMtLaWFdcUoFsMUXf2CgVoxMe+YA=; b=U/0ItJJF8jyCmxeXjX
	895pgpe7GzBj9dqLcARE+WvguFtC2NnG+XIDy3fDvd9bX3nbUzTvvnzEwo95iaEa
	gv8nD5YNe+LbyNjoIUm40h0R6Mbbgg1olS+nMh3iy1LXJRt53JEEAoN7COAbJOzd
	UrhUNzZLjkqr7P8JXbGTNRICM=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3n6n9RdRqdUaGAw--.28247S8;
	Sun, 18 Oct 2026 12:07:34 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawn.guo@freescale.com>,
	dmaengine@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 6/7] dmaengine: mxs-dma: synchronize tasklet when freeing a channel
Date: Sun, 18 Oct 2026 12:07:22 +0800
Message-Id: <20261018040724.534641-7-yaojiale02@163.com>
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
X-CM-TRANSID:_____wD3n6n9RdRqdUaGAw--.28247S8
X-Coremail-Antispam: 1Uf129KBjvdXoWrKFW8ZFyxKr18tw4kuF15urg_yoWDAwb_Wa
	10gryfXrn8ZFZ0yw12yrs8ZrWxta4DWF95Wrn2qayaqa43J3ZagrsFvr98C34vga15Za98
	Zwn8JrWxGrZrGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRuuWL5UUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7wZinGrURgbICgAA3r

The DMA interrupt handler schedules a per-channel tasklet to invoke the
completion callback. Releasing the IRQ does not drain a tasklet that was
already queued, so the callback can run after its client state has been
released.

Kill the tasklet after freeing the IRQ and before releasing the channel
command storage and clock.

Fixes: a580b8c5429a ("dmaengine: mxs-dma: add dma support for i.MX23/28")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/dma/mxs-dma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/mxs-dma.c b/drivers/dma/mxs-dma.c
index 7acb3d29dad3..9e85ba45f0fa 100644
--- a/drivers/dma/mxs-dma.c
+++ b/drivers/dma/mxs-dma.c
@@ -442,6 +442,7 @@ static void mxs_dma_free_chan_resources(struct dma_chan *chan)
 	mxs_dma_disable_chan(chan);
 
 	free_irq(mxs_chan->chan_irq, mxs_dma);
+	tasklet_kill(&mxs_chan->tasklet);
 
 	dma_free_coherent(mxs_dma->dma_device.dev, CCW_BLOCK_SIZE,
 			mxs_chan->ccw, mxs_chan->ccw_phys);
-- 
2.34.1

