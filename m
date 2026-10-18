Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836503D5C26;
	Sun, 18 Oct 2026 04:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792296467; cv=none; b=FlAK8jQ1QJCny3Ka13S4tdMVz5cBlsFHvSotdIgSVzpMyQjZYvvaMXaIifZV1vzvsN9xXNe6lOXtGyGQnIqmP9J9Jd2hBk2phUsUKDGm5QICbGPhWEZ39uwgVr3u3cFDR9CLPLhe1C7MEMTuX73F+4Lywh1GKxToj1IARI2hZpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792296467; c=relaxed/simple;
	bh=7AAwJ174ZdQZd10C3NcPEHHbBSXKfOAwYOgOthhBc1k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gI9eaIwlCJt8TFCbRUQAvQVPqvKAWFkj5yN/0bFEeX3uBzJTaq7sTjMQGXMcCBILpEgWvDPrEzJzPab/ynV2YOcl/gvk8Xkb9nNsdne7FO33PdqE/SvthZVPFnKEqAT5KzJYhYNapXxSYYNPu6fM/6IUH1U7AHTF6rAjzEdKgMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=hpiIupVC; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="hpiIupVC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=H+
	DkddEcokjSY+QJox5qLRi1VG/SViIedycwraUqVa8=; b=hpiIupVCECAyPCaesi
	sYdd6YbFgHzaOii3z0O20MEFrVvCH3MWF+3lgTvGcUtfahuHrhZpmkq7syUFp/zz
	zDZ9L7XK1gGUVYj5rass6xjbSRpydJhDP7udJmA2H821+QWUtadZ+F9fogEIxm3Q
	DF+iLmbBV/TIgB/yyukt1R9Xw=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3n6n9RdRqdUaGAw--.28247S6;
	Sun, 18 Oct 2026 12:07:32 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Zhangfei Gao <zhangfei.gao@marvell.com>,
	Qiao Zhou <zhouqiao@marvell.com>,
	Leo Yan <leoy@marvell.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 4/7] dmaengine: mmp_tdma: synchronize tasklet when freeing a channel
Date: Sun, 18 Oct 2026 12:07:20 +0800
Message-Id: <20261018040724.534641-5-yaojiale02@163.com>
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
X-CM-TRANSID:_____wD3n6n9RdRqdUaGAw--.28247S6
X-Coremail-Antispam: 1Uf129KBjvdXoWrtF4fKF1kuFy8Zr48Xr4UXFb_yoWkAwb_ua
	yF9F1rXFyDGFsFvr10yr17ArW5Ca4DWr1kWwnYqa43Zr95Ja9rAayvgrnxC3W3ZF4UCFsI
	ywsxW3yfZanrCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRHWl9PUUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzQRinGrURgS2XQAA3g

The channel interrupt handler schedules a tasklet to invoke the transfer
completion callback. Channel resource release does not drain a tasklet
that was already queued, so a callback can run after its client state has
been released.

Disable the channel to stop the shared interrupt path from producing
more completions, release a dedicated IRQ when present, and kill the
tasklet before freeing the descriptor storage.

Fixes: c6da0ba8dfc8 ("dmaengine: mmp_tdma: add mmp tdma support")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/dma/mmp_tdma.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/dma/mmp_tdma.c b/drivers/dma/mmp_tdma.c
index ba03321eeff7..e0de0967d7e7 100644
--- a/drivers/dma/mmp_tdma.c
+++ b/drivers/dma/mmp_tdma.c
@@ -399,8 +399,10 @@ static void mmp_tdma_free_chan_resources(struct dma_chan *chan)
 {
 	struct mmp_tdma_chan *tdmac = to_mmp_tdma_chan(chan);
 
+	mmp_tdma_disable_chan(chan);
 	if (tdmac->irq)
 		devm_free_irq(tdmac->dev, tdmac->irq, tdmac);
+	tasklet_kill(&tdmac->tasklet);
 	mmp_tdma_free_descriptor(tdmac);
 	return;
 }
-- 
2.34.1

