Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=204.191.154.188
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793721153;
	b=D9gJ8+lMhqnv/ODPYXBUvevzkhLbSbk02UrM1y16m5kIFLzR1Y1EGKmhyb3FD2p0YxZq
	 6tcVu35krxRROIsul6bIb0thHotDkmxm4wR7TZN+duH04RBNDAoWHw2ZzeokzxHU2rz9S
	 eogfEYZoaJpoIfrZsLUq/g3OCwMce+mtT5miiv2xfd2XUYSRVdqpsHOH+P8kmtLz28NXu
	 N7guZ/ZOV1UnI7Mt34rq9B0ZFz/pDNk+cXpX2pFrgeOfZOHCkv7upc9i5cjLlX67owyyg
	 XT8Fi4RaA+TyR9HdIX5VEZLsBrNo8KLofDf99QhGlDw5t97y59PpBSqhajpLFh87OOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793721153;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-SA-Exim-Connect-IP:X-SA-Exim-Rcpt-To:
	 X-SA-Exim-Mail-From:X-Spam-Checker-Version:X-Spam-Level:X-Spam-Status:
	 Subject:X-SA-Exim-Version:X-SA-Exim-Scanned;
	bh=YHfsS5HeSIx3M4HO7R3+ERPjYoRNd8+1KvJfx5Z/H1g=;
	b=kWGORBQ+JkTeP6vaFodl7FXGLe2YZitxOIuGmm6dy0xOPiT+GKzUzdVaVTRO3qNKOdpT
	 AbefaxS9W2UnZqxj+cO+xIbOjqSiJcm1jOl3WPLjDbr0at2dR6XUTUKTRvN9zVjYG1xZm
	 Pj3uZyVDu/ggUpIME2d1hlG15L5vctxbPrYZL3nh1hZa06dr69axyVOJ2n/tyO0kZAdjb
	 XLZBMlTyLHBKZSYXUA9f41yhuC+xW+EjnabUEE09pLlhO/IjZGdB/Q1SZ5SGA6KU6eNl2
	 EZ2fvHnZ0FGQiNEaOGEyVU4YciEEfkBpkVp6mrmMhF/ZT4W7qvcYcVOG/ip6yBtJ5zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deltatee.com;
	spf=pass smtp.mailfrom=deltatee.com;
	dkim=pass header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=CJUfrLiu;
	arc=none smtp.remote-ip=204.191.154.188
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF34A606D82F;
	Tue,  3 Nov 2026 15:52:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF34A606D82F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deltatee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=CJUfrLiu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Cc:To:From:content-disposition;
	bh=YHfsS5HeSIx3M4HO7R3+ERPjYoRNd8+1KvJfx5Z/H1g=; b=CJUfrLiuG2lJ+ofItIKomJn2qd
	+ntxClbc4vgkcEoi0ujC7U/y1cxdJRHz8L8GQCV4/ucW/vB2n8UAg8r6byiKlLnc8o2bCj7difbTD
	WoMXhrfdLRiCX0+nwE8+8Vttumt29RC3xh8ogGfcRL7c4ZKA04CrXWS8CWFxyhaAejiOKj/HsYRv/
	PYBj6tyo9rA0TV6EAfrHuZksHd/E/zOVozk2luv/5Q+7ZYuC8I8k1g7P/HcLzon9Waaprx/knxoof
	Kjl8ZypKqRMK2BX7w42WnL7HaR3lMUNzWd5Z7pCvVnEi+LOF6MuiY14BX68kTzK/hzIhCqesxVN+W
	x5D3xoKA==;
Received: from donard.priv.deltatee.com ([172.16.1.31])
	by ale.deltatee.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xOGoI-000000091Rk-3b28;
	Tue, 03 Nov 2026 09:52:31 -0600
Received: from logang by donard.priv.deltatee.com with local (Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xOGns-00000001w7j-3RKv;
	Tue, 03 Nov 2026 09:52:04 -0600
From: Logan Gunthorpe <logang@deltatee.com>
To: dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.li@nxp.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Sashiko <sashiko-bot@kernel.org>
Date: Tue,  3 Nov 2026 09:52:00 -0600
Message-ID: <20261103155202.461725-6-logang@deltatee.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261103155202.461725-1-logang@deltatee.com>
References: <20261103155202.461725-1-logang@deltatee.com>
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, Frank.li@nxp.com, logang@deltatee.com, vkoul@kernel.org, sashiko-bot@kernel.org
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Level: 
Subject: [PATCH 5/6] dmaengine: plx_dma: use spin_lock_bh() in plx_dma_process_desc()
X-SA-Exim-Version: 4.2.1 (built Sun, 23 Feb 2025 07:57:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)

plx_dma_process_desc() is also called from plx_dma_tx_status() in
process context. With a plain spin_lock(), the desc_task tasklet can
run on the same CPU while the lock is held, and spin on it forever.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/dmaengine/20260717223217.B6FBF1F000E9@smtp.kernel.org
Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
---
 drivers/dma/plx_dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/plx_dma.c b/drivers/dma/plx_dma.c
index e4243b66f933..8c4b19d681ad 100644
--- a/drivers/dma/plx_dma.c
+++ b/drivers/dma/plx_dma.c
@@ -138,7 +138,7 @@ static void plx_dma_process_desc(struct plx_dma_dev *plxdev)
 	struct plx_dma_desc *desc;
 	u32 flags;
 
-	spin_lock(&plxdev->ring_lock);
+	spin_lock_bh(&plxdev->ring_lock);
 
 	while (plxdev->tail != plxdev->head) {
 		desc = plx_dma_get_desc(plxdev, plxdev->tail);
@@ -172,7 +172,7 @@ static void plx_dma_process_desc(struct plx_dma_dev *plxdev)
 		plxdev->tail++;
 	}
 
-	spin_unlock(&plxdev->ring_lock);
+	spin_unlock_bh(&plxdev->ring_lock);
 }
 
 static void plx_dma_abort_desc(struct plx_dma_dev *plxdev)
-- 
2.47.3

