Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D334A3BB12C
	for <dmaengine@vger.kernel.org>; Thu, 17 Sep 2026 07:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789629139; cv=none; b=UWJ3gV6rBMRok+dYXa9hUoFqLyx0KUOqhHK808EURtxT/bOVtNBlEy4BrDdhju/TSgfrI7AFJ/nqefv0w3GcXNvX/SM5TFJpDIVxx9GQAbd8pU/Hb7z6PLiYzvWHyrZVCG0IlhYnqy9pcjc9HgJqU+UuI6pbrZ1WtWVIlEUZuM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789629139; c=relaxed/simple;
	bh=SkW+PCauf/Ei4e4PEwLvIKRZIwjX/eLQMDaSRAEFj8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MuEFJVIonyUIak0ASP3SjEVLI3tuCzudAPJu6qkT5MtGBqws8wyz2AuXX8H+P3looSZW/NE+it+jslVi28lE1oanDs5IJbk2NxO6m8ZTvyfI3OHwE4Z9vmCy/hvo+vZ9uoSIqJtAbZGCz60OuSSRaph6VdgeQHBkKqd8DFH/UQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=fLZ1IViX; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="fLZ1IViX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=kncuQpnPp5WV5SnXI+6gnjnd6jcWXPaZm4Du7jUFlg0=; b=fLZ1IV
	iXJv2PZ0l28pNyQUZLFYO3eRf8s3chCFF1DV1w5PerF+6guF3/hWGW/EiQ7ztCGS
	jNvUfffwOIegCDY9AMR5/kNo5wgq7n+fm5it1evkR5Ix1dicu2g+N7GmaTWYJoZF
	Q02t1uLfKyM1+M5XZZJLaZ52rL7op/KPrqe53KvtsPz1GqhqD7gsphUngkLHUPhR
	pd21oWQN+njhCgyjVABaoUJojVTK6wq32zIBtGoe1lZfzrlBhnl2At8xHQqR8b7E
	RmKxMEcvS3Sfy4+Ukh7utrX4wLHLMvhrqKvw54zhBB5eczWNiWg2AfEEH9EA2sWy
	5oHdu2OSaujhljLQ==
Received: (qmail 1890449 invoked from network); 17 Sep 2026 09:12:12 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Sep 2026 09:12:12 +0200
X-UD-Smtp-Session: l3s3148p1@nBSzgKhbFpkujnsL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Koichiro Den <den@valinux.co.jp>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	dmaengine@vger.kernel.org
Subject: [PATCH 2/3] dmaengine: rcar-dmac: Add missing dma_descriptor_unmap()
Date: Thu, 17 Sep 2026 09:12:07 +0200
Message-ID: <20260917071208.36888-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260917071208.36888-1-wsa+renesas@sang-engineering.com>
References: <20260917071208.36888-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Koichiro Den <den@valinux.co.jp>

Call dma_descriptor_unmap() right after dma_cookie_complete() in the
threaded IRQ completion path. Without this, streaming DMA mappings
attached to the descriptor are never released and may eventually exhaust
DMA mapping resources (e.g. IOVA with an IOMMU or bounce-buffer slots
with SWIOTLB), leading to dma_map_* failures.

Also ensure dma_descriptor_unmap() is called in rcar_dmac_chan_reinit()
(error/terminate path) to avoid the same type of leaks.

Fixes: 87244fe5abdf ("dmaengine: rcar-dmac: Add Renesas R-Car Gen2 DMA Controller (DMAC) driver")
Signed-off-by: Koichiro Den <den@valinux.co.jp>
[wsa: added Fixes tag]
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/dma/sh/rcar-dmac.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
index 5b54f1c4ce15..9155bceb723b 100644
--- a/drivers/dma/sh/rcar-dmac.c
+++ b/drivers/dma/sh/rcar-dmac.c
@@ -844,6 +844,7 @@ static void rcar_dmac_chan_reinit(struct rcar_dmac_chan *chan)
 
 	list_for_each_entry_safe(desc, _desc, &descs, node) {
 		list_del(&desc->node);
+		dma_descriptor_unmap(&desc->async_tx);
 		rcar_dmac_desc_put(chan, desc);
 	}
 }
@@ -1654,6 +1655,7 @@ static irqreturn_t rcar_dmac_isr_channel_thread(int irq, void *dev)
 		desc = list_first_entry(&chan->desc.done, struct rcar_dmac_desc,
 					node);
 		dma_cookie_complete(&desc->async_tx);
+		dma_descriptor_unmap(&desc->async_tx);
 		list_del(&desc->node);
 
 		dmaengine_desc_get_callback(&desc->async_tx, &cb);
-- 
2.53.0

