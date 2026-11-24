Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=204.191.154.188
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795543352;
	b=qpfAueN1UTvqnS3YXtuHSrr0x93RWv9bdYY3MW8Hto3OaxC8NwvotzO25pOKy2Fdp4sF
	 aAE9afLh3VsrUgkl6/Z25yaicGNYj9PkA43MIjlwYlK/T6JwgJOXeBujOsOMByVhzSHv2
	 UZrxwBBFWPO5D54bE/4X3MZRqiuY9ww1hy0OmKbFE+qjv9bJdbbhJCbsHmPdr09Wv7XJ8
	 zHWjKXE0M41sDkhTNlc19Dhw785TpPFo00YyXVOTZgdUxso4OMdIHExoiLLYRC08HV4VJ
	 EMuPCOJ4jm4BTsOp8Wg0/rSTX6r1UVztGzoJMqnyQ8/f0RlZzGls7/Df/mCNpc4G49Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795543352;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-SA-Exim-Connect-IP:X-SA-Exim-Rcpt-To:
	 X-SA-Exim-Mail-From:X-Spam-Checker-Version:X-Spam-Level:X-Spam-Status:
	 Subject:X-SA-Exim-Version:X-SA-Exim-Scanned;
	bh=80BwZLAixAs3aWxi4XtZgCv2NQ5zxOV25FshTLRLmzE=;
	b=YV7NL43qe4QRt8gTe29hK/sA+UMafTRWXwjXmpeQYKTjONRuJFMj5Fc8+b5M2glLQMTX
	 V/sn0cOm6zt3yk14l/auPYul1kFIbTyYXjrYFSYoAjQ0dCLv3oC4TROCWJfHZlfPrTeNg
	 Uav9ISEKbA3I3DQTHIuQNQ0zST/kCklJF1Oh5ZK0vXecy1UVolPQ0GiZubmwhocGMgiyK
	 VMbkcZqKIz6ED1W7+2B/QwDLABWP0Luj/7Mj+6Q98304HKDniodC96JeLQ0FM5lflfeE8
	 55IKWuXlB2GLang4U7so/+iEWXORtOHvYpco4nLPH0DiCcubOiMO7ivh7s91Yls/YGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deltatee.com;
	spf=pass smtp.mailfrom=deltatee.com;
	dkim=pass header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=GfJUvr5i;
	arc=none smtp.remote-ip=204.191.154.188
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A07C606A339;
	Tue, 24 Nov 2026 18:02:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A07C606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deltatee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=GfJUvr5i
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Cc:To:From:content-disposition;
	bh=80BwZLAixAs3aWxi4XtZgCv2NQ5zxOV25FshTLRLmzE=; b=GfJUvr5i1AUMbwf8IflvvzJaEm
	PGtSWW7JD0ieHST3QIlyXv5TsrsOy1M9vDzJZJydgE6gfV6W/D49cFdF9lxUmSLYKRZAbeO0Y8Nyi
	koYXi31bIg+HugkPSG1H+QUv7CHLxBkF3NnSDZM3MqBsqlYcAYcPjgDXFC8zYRvwI74sagHCDuAMx
	A3GjcK4SNYBrXMCAziCguBLMPLNHXhCzSKHhepzVilOv2Jl69HNqqsGH0/GlLMyCWQS3cPzI84axA
	lnXH1mdtOGCrMEF3fnIaof9irRnIRqhkB9yjWFMqOc+NwkWSGPCowRCmklxsVNfK9HDrmpUYhakai
	ZeW5jP6A==;
Received: from donard.priv.deltatee.com ([172.16.1.31])
	by ale.deltatee.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xVuqc-00000000oLb-2BiO;
	Tue, 24 Nov 2026 12:02:31 -0600
Received: from logang by donard.priv.deltatee.com with local (Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xVupk-00000003rv6-2FkY;
	Tue, 24 Nov 2026 12:01:36 -0600
From: Logan Gunthorpe <logang@deltatee.com>
To: dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.li@nxp.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Sashiko <sashiko-bot@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Date: Tue, 24 Nov 2026 12:01:31 -0600
Message-ID: <20261124180132.922222-6-logang@deltatee.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261124180132.922222-1-logang@deltatee.com>
References: <20261124180132.922222-1-logang@deltatee.com>
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
X-SA-Exim-Rcpt-To: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, logang@deltatee.com, vkoul@kernel.org, sashiko-bot@kernel.org, Frank.li@nxp.com, Frank.Li@nxp.com
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Level: 
Subject: [PATCH v4 5/6] dmaengine: plx_dma: use spin_lock_bh() in plx_dma_process_desc()
X-SA-Exim-Version: 4.2.1 (built Sun, 23 Feb 2025 07:57:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)

plx_dma_process_desc() is also called from plx_dma_tx_status() in
process context. With a plain spin_lock(), the desc_task tasklet can
run on the same CPU while the lock is held, and spin on it forever.

Fixes: 1d05a0bdb420 ("dmaengine: plx_dma: Move spin_lock_bh() to spin_lock()")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/dmaengine/20260717223217.B6FBF1F000E9@smtp.kernel.org
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
---
 drivers/dma/plx_dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/plx_dma.c b/drivers/dma/plx_dma.c
index 7af29b901bd5..725df770d5de 100644
--- a/drivers/dma/plx_dma.c
+++ b/drivers/dma/plx_dma.c
@@ -138,7 +138,7 @@ static void plx_dma_process_desc(struct plx_dma_dev *plxdev)
 	struct plx_dma_desc *desc;
 	u32 flags;
 
-	spin_lock(&plxdev->ring_lock);
+	spin_lock_bh(&plxdev->ring_lock);
 
 	while (plxdev->tail != plxdev->head) {
 		desc = plx_dma_get_desc(plxdev, plxdev->tail);
@@ -173,7 +173,7 @@ static void plx_dma_process_desc(struct plx_dma_dev *plxdev)
 		plxdev->tail++;
 	}
 
-	spin_unlock(&plxdev->ring_lock);
+	spin_unlock_bh(&plxdev->ring_lock);
 }
 
 static void plx_dma_abort_desc(struct plx_dma_dev *plxdev)
-- 
2.47.3

