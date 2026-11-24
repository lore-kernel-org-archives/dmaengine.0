Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=204.191.154.188
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795543349;
	b=KYciy1SD3MoSQZDkGai8GoMCFqd8RS5MNcIBDXCnnMrY/BDLfdAPkNf/CUUedeB0HEnQ
	 RhVQSBjlBi/Z93S15hBLrq+EHMY04rb90sN4BKVw83lFbagLGV5TUvzxG/JRh+uKbW+dH
	 ag6ZeBKs21SDLeQGHpkbZNLpwJLy0w/XVnTbA+2qzTPQDeWuT5Fjh2zx1csEyEjDJIVBR
	 HQQWeg58n4lobXcHmCl6bvwzEVyRMXdPVPUSY5lFWsyYDGCsAficA8Zv23YM1g6LF8Rp4
	 9oHvlcnFxiTCA4fKmSrAHEKQbT9NiC5Sg6XYlUQiCoM3Sluja1oHzuEgHllwhypvHRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795543349;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-SA-Exim-Connect-IP:X-SA-Exim-Rcpt-To:
	 X-SA-Exim-Mail-From:X-Spam-Checker-Version:X-Spam-Level:X-Spam-Status:
	 Subject:X-SA-Exim-Version:X-SA-Exim-Scanned;
	bh=MGxOimM5MwVxunTMPXf1eXM/vKgrxjzG3aM8xXRKgdQ=;
	b=plw7NSuRVvlNg6YWKlN7ZurIg0eMhyms7Nwvd1O2tWyhgfFrL04FOj6wLPB97EY5DdeX
	 an79FmeMQ/K4Lvw5BrmpS1Nd4uD8LDKZKB5AAH/ic4Fj+mg2VZHeChEl0hBnEcPSkDUGv
	 DidoijvnFABNgUCmpPmu/1k+g1qYQf3sDCLNYvKKv9Q93e5BLRkw2o35a/NtR0DNrd5Vt
	 lxaocxu3h79KOu8E1ff8DDqefriDCIaje39oA6eWUPFfa5QYosslo7eB7k9q6wLGAic6m
	 rZe53QM6/6S0c0YR+7jaH67w5psi+dp75v7wF2r5SvNc0Bseq1mG0J8nuJRD4iqL34w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deltatee.com;
	spf=pass smtp.mailfrom=deltatee.com;
	dkim=pass header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=thN+p4Wx;
	arc=none smtp.remote-ip=204.191.154.188
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0878606A685;
	Tue, 24 Nov 2026 18:02:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0878606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deltatee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=thN+p4Wx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Cc:To:From:content-disposition;
	bh=MGxOimM5MwVxunTMPXf1eXM/vKgrxjzG3aM8xXRKgdQ=; b=thN+p4WxxdJ6RLMJ8NEYnCrwCI
	UdIt/heehx+NmvmR0UGuAV5Nz9F+zF/bR1qYnuRk4EDo2ITDBxyWOoL6VYS/ucipsMe1X28h1I878
	E8Z0xvSGxTlhy3WUCefuo+aUxb6JCPTYd26VIhAJOPGYUUgSWODhtnpfwSmc+aQw9m/xCNHse2nCI
	Lb0bLW/qITx3TguzWABMMoccHmo7YrDtVR6u4QAolA5JdiNwRfMA4guEU0he4apbfDNZlAeQlgH/K
	ZaA9sNHhA9S+6KOCevc/S65CCN7MW5m1R/TbULUkMGW52TCAFEMitg5ViSpwQU4Dh2vOrJWg7PvIY
	un/YO8vQ==;
Received: from donard.priv.deltatee.com ([172.16.1.31])
	by ale.deltatee.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xVuqZ-00000000oKy-0xhS;
	Tue, 24 Nov 2026 12:02:28 -0600
Received: from logang by donard.priv.deltatee.com with local (Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xVupk-00000003rv0-0X7O;
	Tue, 24 Nov 2026 12:01:36 -0600
From: Logan Gunthorpe <logang@deltatee.com>
To: dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.li@nxp.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Sashiko <sashiko-bot@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Date: Tue, 24 Nov 2026 12:01:28 -0600
Message-ID: <20261124180132.922222-3-logang@deltatee.com>
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
Subject: [PATCH v4 2/6] dmaengine: plx_dma: fix descriptor ring leak in alloc_chan_resources()
X-SA-Exim-Version: 4.2.1 (built Sun, 23 Feb 2025 07:57:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)

If the device is removed between plx_dma_alloc_desc() and the pdev
check, the error path frees hw_ring but leaks desc_ring and every
descriptor in it.

Add plx_dma_free_desc() and use it here, in plx_dma_free_chan_resources()
and in the plx_dma_alloc_desc() error path.

Fixes: c2dbcaa8c672 ("dmaengine: plx-dma: Implement hardware initialization and cleanup")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/dmaengine/20260717223217.B6FBF1F000E9@smtp.kernel.org
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
---
 drivers/dma/plx_dma.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/dma/plx_dma.c b/drivers/dma/plx_dma.c
index 0a7ad2473cb1..5b0e32fec79b 100644
--- a/drivers/dma/plx_dma.c
+++ b/drivers/dma/plx_dma.c
@@ -374,6 +374,16 @@ static irqreturn_t plx_dma_isr(int irq, void *devid)
 	return IRQ_HANDLED;
 }
 
+static void plx_dma_free_desc(struct plx_dma_dev *plxdev)
+{
+	int i;
+
+	for (i = 0; i < PLX_DMA_RING_COUNT; i++)
+		kfree(plxdev->desc_ring[i]);
+
+	kfree(plxdev->desc_ring);
+}
+
 static int plx_dma_alloc_desc(struct plx_dma_dev *plxdev)
 {
 	struct plx_dma_desc *desc;
@@ -398,9 +408,7 @@ static int plx_dma_alloc_desc(struct plx_dma_dev *plxdev)
 	return 0;
 
 free_and_exit:
-	for (i = 0; i < PLX_DMA_RING_COUNT; i++)
-		kfree(plxdev->desc_ring[i]);
-	kfree(plxdev->desc_ring);
+	plx_dma_free_desc(plxdev);
 	return -ENOMEM;
 }
 
@@ -424,7 +432,7 @@ static int plx_dma_alloc_chan_resources(struct dma_chan *chan)
 	if (!rcu_dereference(plxdev->pdev)) {
 		rcu_read_unlock();
 		rc = -ENODEV;
-		goto out_free_hw_ring;
+		goto out_free_desc;
 	}
 
 	writel(PLX_REG_CTRL_RESET_VAL, plxdev->bar + PLX_REG_CTRL);
@@ -443,6 +451,8 @@ static int plx_dma_alloc_chan_resources(struct dma_chan *chan)
 
 	return PLX_DMA_RING_COUNT;
 
+out_free_desc:
+	plx_dma_free_desc(plxdev);
 out_free_hw_ring:
 	dma_free_coherent(plxdev->dma_dev.dev, ring_sz, plxdev->hw_ring,
 			  plxdev->hw_ring_dma);
@@ -454,7 +464,6 @@ static void plx_dma_free_chan_resources(struct dma_chan *chan)
 	struct plx_dma_dev *plxdev = chan_to_plx_dma_dev(chan);
 	size_t ring_sz = PLX_DMA_RING_COUNT * sizeof(*plxdev->hw_ring);
 	int irq = -1;
-	int i;
 
 	spin_lock_bh(&plxdev->ring_lock);
 	plxdev->ring_active = false;
@@ -474,10 +483,7 @@ static void plx_dma_free_chan_resources(struct dma_chan *chan)
 
 	plx_dma_abort_desc(plxdev);
 
-	for (i = 0; i < PLX_DMA_RING_COUNT; i++)
-		kfree(plxdev->desc_ring[i]);
-
-	kfree(plxdev->desc_ring);
+	plx_dma_free_desc(plxdev);
 	dma_free_coherent(plxdev->dma_dev.dev, ring_sz, plxdev->hw_ring,
 			  plxdev->hw_ring_dma);
 
-- 
2.47.3

