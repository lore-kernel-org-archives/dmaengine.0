Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=204.191.154.188
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794332549;
	b=NtiYeZwRW6a1mlHEvLUmAbAKLKyetdZYBskNRnPGrzLJOyCLbbzjdsI/YkmFPX6nSluG
	 F/5T42/n/vm1bGMtGxlsM/LfbRM9dr+uUeB/Rbzm6p6BsohpQ/z2y5xBCPgToskQS46G9
	 Fb73d3qO5xzk6Y0jngCPhJamsvmTFCWIpNnPfB0lumLNeFcwjkvicm6Z7FzfP0vPowm24
	 apC7am2qMzZ3rq7RepZwT+sID7nsoTBfnQVo4uAGtntgWFZ5xu6Dl0q0nxkyQ2XwiDc1y
	 LXqC8QfIBPv3nOjNgFIRUGlbb3neTqfzh+urbmzaKNeInLwleLkNgMgU/O3lldOypTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794332549;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-SA-Exim-Connect-IP:X-SA-Exim-Rcpt-To:
	 X-SA-Exim-Mail-From:X-Spam-Checker-Version:X-Spam-Level:X-Spam-Status:
	 Subject:X-SA-Exim-Version:X-SA-Exim-Scanned;
	bh=hf5uGQ76nIf9peYYN6KISN8YdEFht+pVkF+Chj50WQU=;
	b=GWfV1NvJogr68FR4lfj0bBpd7kYziIl9oNLG1FhToiBYSBMUQkEQR5KTSLp8o591FRRr
	 WAgYT7rWtKgbxl8SgV3IxC6lhfdDl7TkircsmyGqa2vAxB1Ah7Bjb1c7N4uZog2y7R4tD
	 ccMWlv2DRCUT0datngB3FFCKCCRK7Xv5mvpsaoXR9K7QxRGZe2CscoQ098P+k79tffYWs
	 V4D2WaxamwVWTfKhyYhficgaMHap8Dszkhn5JgQQTOjSjDwgruGIAnrOdu1EMFkYgNT2Q
	 QrH+YevmfvV4G1N6ywMy5r/3u0BoHgBi1Plt3nVhz6jb0pk/p7mb8aNtGYg9O++ERcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deltatee.com;
	spf=pass smtp.mailfrom=deltatee.com;
	dkim=pass header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b="ClH044S/";
	arc=none smtp.remote-ip=204.191.154.188
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E16606A33A;
	Tue, 10 Nov 2026 17:42:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5E16606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deltatee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=ClH044S/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Cc:To:From:content-disposition;
	bh=hf5uGQ76nIf9peYYN6KISN8YdEFht+pVkF+Chj50WQU=; b=ClH044S/7xNbJj24dp9kLxi0fn
	qxN5aOVuaHzXuxVdTPH/gbLxgJ0SCyOW9m/fGOYwRU+l9pXa0e1BeBU1kGJQPYYxkk3zHPnzBv3Ig
	N98PQqfzbqpaoddK1CgPhy2vqXE0LfS7O6bsoDnWmlWegu0Zn0OUlQydGRK8qec3rs5oC4xUvX9Qs
	PccnC5AVCeB7BJiDoyVK+CMJuw7hUi3T1r30xR0n85YL9DGp4L+3dbqERmkvE7mPLjDykpAB4ocbO
	06pJPThlbnZjgn/T2Yqffnb6WK44dSE44w/qkE469Rhe5y8Z0a33cCTyqFjNahim7Z2vcfyz2xdOo
	VI24WwIA==;
Received: from donard.priv.deltatee.com ([172.16.1.31])
	by ale.deltatee.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xQprX-00000000o7U-04ir;
	Tue, 10 Nov 2026 11:42:27 -0600
Received: from logang by donard.priv.deltatee.com with local (Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xQpqg-00000002cVn-18uG;
	Tue, 10 Nov 2026 11:41:34 -0600
From: Logan Gunthorpe <logang@deltatee.com>
To: dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.li@nxp.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Sashiko <sashiko-bot@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Date: Tue, 10 Nov 2026 11:39:23 -0600
Message-ID: <20261110173927.624629-3-logang@deltatee.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261110173927.624629-1-logang@deltatee.com>
References: <20261110173927.624629-1-logang@deltatee.com>
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
Subject: [PATCH v2 2/6] dmaengine: plx_dma: fix descriptor ring leak in alloc_chan_resources()
X-SA-Exim-Version: 4.2.1 (built Sun, 23 Feb 2025 07:57:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)

If the device is removed between plx_dma_alloc_desc() and the pdev
check, the error path frees hw_ring but leaks desc_ring and every
descriptor in it.

Add plx_dma_free_desc() and use it here and in
plx_dma_free_chan_resources().

Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/dmaengine/20260717223217.B6FBF1F000E9@smtp.kernel.org
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
---
 drivers/dma/plx_dma.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/plx_dma.c b/drivers/dma/plx_dma.c
index 0a7ad2473cb1..bfccbb0c70e8 100644
--- a/drivers/dma/plx_dma.c
+++ b/drivers/dma/plx_dma.c
@@ -404,6 +404,16 @@ static int plx_dma_alloc_desc(struct plx_dma_dev *plxdev)
 	return -ENOMEM;
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
 static int plx_dma_alloc_chan_resources(struct dma_chan *chan)
 {
 	struct plx_dma_dev *plxdev = chan_to_plx_dma_dev(chan);
@@ -424,7 +434,7 @@ static int plx_dma_alloc_chan_resources(struct dma_chan *chan)
 	if (!rcu_dereference(plxdev->pdev)) {
 		rcu_read_unlock();
 		rc = -ENODEV;
-		goto out_free_hw_ring;
+		goto out_free_desc;
 	}
 
 	writel(PLX_REG_CTRL_RESET_VAL, plxdev->bar + PLX_REG_CTRL);
@@ -443,6 +453,8 @@ static int plx_dma_alloc_chan_resources(struct dma_chan *chan)
 
 	return PLX_DMA_RING_COUNT;
 
+out_free_desc:
+	plx_dma_free_desc(plxdev);
 out_free_hw_ring:
 	dma_free_coherent(plxdev->dma_dev.dev, ring_sz, plxdev->hw_ring,
 			  plxdev->hw_ring_dma);
@@ -454,7 +466,6 @@ static void plx_dma_free_chan_resources(struct dma_chan *chan)
 	struct plx_dma_dev *plxdev = chan_to_plx_dma_dev(chan);
 	size_t ring_sz = PLX_DMA_RING_COUNT * sizeof(*plxdev->hw_ring);
 	int irq = -1;
-	int i;
 
 	spin_lock_bh(&plxdev->ring_lock);
 	plxdev->ring_active = false;
@@ -474,10 +485,7 @@ static void plx_dma_free_chan_resources(struct dma_chan *chan)
 
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

