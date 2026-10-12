Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2D2481238
	for <dmaengine@vger.kernel.org>; Mon, 12 Oct 2026 12:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791808239; cv=none; b=j8MVHymn6yaS2HLzUukt5EcqQxskglTt08P1tW40XAjkVIDbEDAHGdKpuNiBtpuysmynJT7f65fybIbZ/iwnw0Pict+m85Fg3bfH2hn6IcTY2QEx0DyUynU4siR+5sELcQIimNM9p/rB5eX5K8whSRxF1FBHuTlJO4pfy982HwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791808239; c=relaxed/simple;
	bh=XTXIPExZqFhEDmyP29DlDsM6MwAJ8F8c5qyw7yygKyY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QHgKZFbUwgHFQ9dieCTK7Zrwot/q6W24L8XjGCULjcwf0IPZcLgsU8SSbW7Zab0QbA81x+T7s8IN4BKU+uHmMIoxmvSy4oTcO5MIhyiQoVeJdBCxhr+jZ1E2K5ImeamlT4RYw6ZOOTgtkvITesKS1ItIaSAscHOlm0Su4kaFwVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=lV2TWFBs; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="lV2TWFBs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=AxzuL2IiROJwnACGVDZMbIFIVXQ106+rXV+3ZgfnZjM=; b=lV2TWF
	BsY8fQtTgn90Gq2hSsEeNt/yUMcvPOQyxdMl4STYxjiev9SYcFLtu1fhr4yIb0Bw
	kYI6RXa6c4HAvrlSWigmR6CgQemvI5BxOMeCzXsZK8SojX6mhbpPdURwNidYKW6M
	vzp1XhnYAoSwzvF/44mEm2fh2dy5BFnnRYG4uiZHKm/RboazXy3Qyikd047UChpp
	e+Tn7CnlCyXnBHjJFxIUSpCao/4mx//6bZ91AZt+Rp+CEylX8ZhVwolzOP+HYJuI
	F764gdMe+PaHqtLgDviSZmPI4st5rAmTKQJ75sLzR2m2rBF+tFLWQI24ZBxrPjg1
	YNQxje/J9XKo1g0g==
Received: (qmail 2248132 invoked from network); 12 Oct 2026 14:30:33 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Oct 2026 14:30:33 +0200
X-UD-Smtp-Session: l3s3148p1@hdw93aNd3MUujnuu
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
Subject: [PATCH v2 2/3] dmaengine: rcar-dmac: Add missing dma_descriptor_unmap()
Date: Mon, 12 Oct 2026 14:30:22 +0200
Message-ID: <20261012123020.11320-7-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261012123020.11320-5-wsa+renesas@sang-engineering.com>
References: <20261012123020.11320-5-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Koichiro Den <den@valinux.co.jp>

Call dma_descriptor_unmap() right before dma_cookie_complete() in the
threaded IRQ completion path. Without this, streaming DMA mappings
attached to the descriptor are never released and may eventually exhaust
DMA mapping resources (e.g. IOVA with an IOMMU or bounce-buffer slots
with SWIOTLB), leading to dma_map_* failures.

Also ensure dma_descriptor_unmap() is called in rcar_dmac_chan_reinit()
(error/terminate path) to avoid the same type of leaks.

Fixes: 87244fe5abdf ("dmaengine: rcar-dmac: Add Renesas R-Car Gen2 DMA Controller (DMAC) driver")
Signed-off-by: Koichiro Den <den@valinux.co.jp>
[wsa: moved unmap before cookie completion, added Fixes tag]
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Change since v1:
* moved unmap before cookie_complete (Sashiko + humans)
* adjusted commit message

 drivers/dma/sh/rcar-dmac.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
index 5b54f1c4ce15..78a913c4c0d8 100644
--- a/drivers/dma/sh/rcar-dmac.c
+++ b/drivers/dma/sh/rcar-dmac.c
@@ -844,6 +844,7 @@ static void rcar_dmac_chan_reinit(struct rcar_dmac_chan *chan)
 
 	list_for_each_entry_safe(desc, _desc, &descs, node) {
 		list_del(&desc->node);
+		dma_descriptor_unmap(&desc->async_tx);
 		rcar_dmac_desc_put(chan, desc);
 	}
 }
@@ -1653,6 +1654,7 @@ static irqreturn_t rcar_dmac_isr_channel_thread(int irq, void *dev)
 	while (!list_empty(&chan->desc.done)) {
 		desc = list_first_entry(&chan->desc.done, struct rcar_dmac_desc,
 					node);
+		dma_descriptor_unmap(&desc->async_tx);
 		dma_cookie_complete(&desc->async_tx);
 		list_del(&desc->node);
 
-- 
2.53.0

