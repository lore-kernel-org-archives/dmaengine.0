Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AFC230BD5;
	Sun, 18 Oct 2026 04:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792296550; cv=none; b=EkzGxZjpJgjD/J9P4dHpFSKoHMtam6+tWKOi+Ffh0FiejdkhpW7FHFkd5sKFIJth9/bkTcsmE0RDF8MUrcsaLTXcPuBMeJzZolEAcA5IJ/0c9xEwyOQ8ysr4FzOcPt53r0e5ZP1gnXM1BuNohYgpvMaBUByqURVZu9PjXopYa3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792296550; c=relaxed/simple;
	bh=vOTAIKrqlO69I07vVjq/Bh6uNMeCrlYmRKCP1B1HzZ4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jTH+7e2OXnPBBGPx1d883kV/RtxnTD89FFhL+Zfr2v6IkJSvajU/G1wqJTuNDxB4K8i1NZXbUGCdKJ5tnTd3B9s2o29C8MkOWRnzKc6rgiqfOEiTkp/Xm61jXa5SnFjZiJIo79I4Uf0Nb5uFELPI/YmtfgkbL5GT5uxMHU1ZjPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=pG0qzv28; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="pG0qzv28"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=cD
	fkN4RgASnPISjCyv0z3UO7udtv0woiZYBLSoDhUL4=; b=pG0qzv28dfr6ydQjA/
	Mp31Eql3Wr6kzrNffAJVozrufUZzpUio7XXmst4fmt1Zo4lri7eW//9WWaugZOL4
	Jo3+Dx4sDrumvahEhk2vox7bWvWkdzTpCZSlsfiisGM6RXOhS2WWcOC7fMqv60QP
	GXRMhalXe2vTIOsXtXA2p2Jfo=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3n6n9RdRqdUaGAw--.28247S9;
	Sun, 18 Oct 2026 12:07:35 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Linus Walleij <linusw@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Dan Williams <djbw@kernel.org>,
	Srinidh Kasagar <srinidhi.kasagar@stericsson.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 7/7] dmaengine: ste_dma40: synchronize tasklet when releasing a channel
Date: Sun, 18 Oct 2026 12:07:23 +0800
Message-Id: <20261018040724.534641-8-yaojiale02@163.com>
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
X-CM-TRANSID:_____wD3n6n9RdRqdUaGAw--.28247S9
X-Coremail-Antispam: 1Uf129KBjvdXoW7GFW7WrW5tr4kKFy8tryxXwb_yoWkGFb_Za
	40gr93Xw1DGryDCr1Utr15ArySvay2gFn7Ww4jqFy3XrW3Z3ZxJFWq9rykWr18uFW7CF95
	Z34vgryfC3yxCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRuuWL5UUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7whjnWrURgjIHgAA3-

DMA completion handling schedules a per-channel tasklet that processes
completed descriptors and invokes client callbacks. Channel release
terminates and frees the descriptor state without draining a tasklet
that was already queued.

After d40_free_dma() removes the channel from the interrupt lookup
tables, kill the tasklet before returning the channel to the DMAengine
core.

Fixes: 8d318a50b3d7 ("DMAENGINE: Support for ST-Ericssons DMA40 block v3")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/dma/ste_dma40.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 0d9ffa3e2663..647a265590c2 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -2484,6 +2484,8 @@ static void d40_free_chan_resources(struct dma_chan *chan)
 	if (err)
 		chan_err(d40c, "Failed to free channel\n");
 	spin_unlock_irqrestore(&d40c->lock, flags);
+
+	tasklet_kill(&d40c->tasklet);
 }
 
 static struct dma_async_tx_descriptor *d40_prep_memcpy(struct dma_chan *chan,
-- 
2.34.1

