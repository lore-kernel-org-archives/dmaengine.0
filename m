Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC12A3D1ABA;
	Sun, 18 Oct 2026 04:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792296556; cv=none; b=KxIWggG+BJS5S8PQa+QeZu7IE5gtLJIe5+uoe8nZKOaV5dzubPwHuICfHpB7LLdZQ75tfJVC9o11M2WS+efHfOTkd1srEUCca43fgSkWYJjd74AcVDD3kqOztBAosUZiAFwBOkMD0ZikroXMTnxQ2da069zV4tTMz15eRy+QO68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792296556; c=relaxed/simple;
	bh=oohKKT/l/QTolpR65ZGNwQYrFEHQp/fn/9nxUD5KVzo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=khsfIdgbQt7RGflEiO0OYrfkV5MBhL5Lq6iVGidLMKezfJZCKOnuk1OiK5k00U6m9+wze4kX/HN1b0iz9ljggsVmhCz8f77aReQck5o5h64n+qPEg7oXRY1IBauhAadbtqVel6RcGDh8FH8c/KFODWi2j0KmF9vbeZB5CBXoF9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=V9Wi/Lwp; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="V9Wi/Lwp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=4c
	9VdAwtQeTjjI8oj1y01rWgBACkk+geaRj0woQWaeM=; b=V9Wi/LwpVLvm1gXc9G
	CsN0TYwd2Uah9Gqt0XUkna1GKVL6tPgXgKUHa2rgmQrin1lxbHMTuYqP0KVT3yB3
	YNFiOltAnuwiAjZSK7XIEViz55ohdISD97BWtfluWlIpCl11Kh2mf8zPov1/tMkb
	sdSM5a1474o2gw7UC+7J5Koik=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3n6n9RdRqdUaGAw--.28247S4;
	Sun, 18 Oct 2026 12:07:29 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Zhang Wei <zw@zh-kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Ebony Zhu <ebony.zhu@freescale.com>,
	Dan Williams <djbw@kernel.org>,
	Kumar Gala <galak@gate.crashing.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linuxppc-dev@lists.ozlabs.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 2/7] dmaengine: fsldma: drain channel tasklet during removal
Date: Sun, 18 Oct 2026 12:07:18 +0800
Message-Id: <20261018040724.534641-3-yaojiale02@163.com>
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
X-CM-TRANSID:_____wD3n6n9RdRqdUaGAw--.28247S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gr45GrW5tFyftF4DZF47urg_yoWDuwc_u3
	W0934xWr1kCFZ0yr4UtFs8ZFWYyayjgF9Igw1vqF1fX343JFnxtrWIywn5Zw1DWFWUCF9r
	u34qqrWfC3yUJjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRyHq-7UUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7wJhm2rURgLHwAAA3q

The channel IRQ schedules a tasklet that accesses the channel descriptor
lists. Device removal frees the IRQs and then releases each channel
without draining tasklets that were already queued.

Kill each channel tasklet before unmapping and freeing the channel. The
removal path has already freed all controller or channel IRQs, so no
interrupt handler can queue the tasklet again.

Fixes: 173acc7ce853 ("dmaengine: add driver for Freescale MPC85xx DMA controller")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/dma/fsldma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index 22d62d958abd..0e2f84862261 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -1205,6 +1205,7 @@ static int fsl_dma_chan_probe(struct fsldma_device *fdev,
 
 static void fsl_dma_chan_remove(struct fsldma_chan *chan)
 {
+	tasklet_kill(&chan->tasklet);
 	irq_dispose_mapping(chan->irq);
 	list_del(&chan->common.device_node);
 	iounmap(chan->regs);
-- 
2.34.1

