Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57EAF19E7F7;
	Tue, 16 Jun 2026 02:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781577133; cv=none; b=gPaiGg4rtaTo5NKXXlumai80qAxECnG4jEeHD2eV3ice/x5wDAnKzedsb+Se3zaXjiWwcmBCEhWOGk5ZE4GyCX2+HL4wRmDqm65TCZwNSJI97MK8+qcQfLVCesKSOOx3h5p7A3Vus7bYZWttjS0ZKtEUFAnxv6d0rrqLcyA/gLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781577133; c=relaxed/simple;
	bh=KlASHLHhMkDdM2lCLIwSuXaIGLdPbDXQFt94uPRB/do=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=F47C1//HOgubSEoWiwc4o+FNfS6ukcJcy7IQxjdEYFc2RaIn8eiXaHWUquhpaf7tBLgLoK+KDWB9rW0WzzV41LGt2zI9C6GpdS7ZCnlWP9AZzwgEfMqxWepLjonmm7Un3jzco6epxk+nrfysj8WZsAI2NpbCreKlXUisP0TlmA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 8bf6ccc4692b11f1aa26b74ffac11d73-20260616
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:42dd48ea-742f-4450-936b-6e6e106a441e,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:e7bac3a,CLOUDID:04ebaa69d74228393004d0e2d338e65a,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:2,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8bf6ccc4692b11f1aa26b74ffac11d73-20260616
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1395659023; Tue, 16 Jun 2026 10:31:57 +0800
From: Hongling Zeng <zenghongling@kylinos.cn>
To: vkoul@kernel.org,
	Frank.Li@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	mripard@kernel.org,
	arnd@arndb.de
Cc: dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhongling0719@126.com,
	Hongling Zeng <zenghongling@kylinos.cn>
Subject: [PATCH v3] dmaengine: sun6i-dma: Fix use-after-free in error handling paths
Date: Tue, 16 Jun 2026 10:31:38 +0800
Message-Id: <20260616023138.15904-1-zenghongling@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In error handling paths, the for loop frees v_lli in the loop body,
then accesses v_lli->v_lli_next and v_lli->p_lli_next in the
increment expression, which is use-after-free.

Fix by saving both the next virtual and physical pointers before
freeing the current node.

Fixes: 555859308723 ("dmaengine: Add driver for Allwinner sun6i DMA")
Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
Suggested-by: Jernej Skrabec <jernej.skrabec@gmail.com>

---
Changes in v2:
 -Refactored the fix to avoid code duplication by creating a helper function
  sun6i_dma_free_lli_list() that handles LLI list cleanup
 -Add Suggested-by: Jernej Skrabec <jernej.skrabec@gmail.com>

---
Change in v3:
 -Further refactoring to move txd handling into the helper function
  as suggested by Jernej
---
 drivers/dma/sun6i-dma.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index a9a254dbf8cb..7a79f346250a 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -406,16 +406,12 @@ static inline void sun6i_dma_dump_lli(struct sun6i_vchan *vchan,
 		v_lli->len, v_lli->para, v_lli->p_lli_next);
 }
 
-static void sun6i_dma_free_desc(struct virt_dma_desc *vd)
+static void sun6i_dma_free_desc(struct sun6i_dma_dev *sdev,
+				struct sun6i_desc *txd)
 {
-	struct sun6i_desc *txd = to_sun6i_desc(&vd->tx);
-	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(vd->tx.chan->device);
 	struct sun6i_dma_lli *v_lli, *v_next;
 	dma_addr_t p_lli, p_next;
 
-	if (unlikely(!txd))
-		return;
-
 	p_lli = txd->p_lli;
 	v_lli = txd->v_lli;
 
@@ -432,6 +428,17 @@ static void sun6i_dma_free_desc(struct virt_dma_desc *vd)
 	kfree(txd);
 }
 
+static void sun6i_dma_free_desc_virt(struct virt_dma_desc *vd)
+{
+	struct sun6i_desc *txd = to_sun6i_desc(&vd->tx);
+	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(vd->tx.chan->device);
+
+	if (unlikely(!txd))
+		return;
+
+	sun6i_dma_free_desc(sdev, txd);
+}
+
 static int sun6i_dma_start_desc(struct sun6i_vchan *vchan)
 {
 	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(vchan->vc.chan.device);
@@ -788,10 +795,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_slave_sg(
 	return vchan_tx_prep(&vchan->vc, &txd->vd, flags);
 
 err_lli_free:
-	for (p_lli = txd->p_lli, v_lli = txd->v_lli; v_lli;
-	     p_lli = v_lli->p_lli_next, v_lli = v_lli->v_lli_next)
-		dma_pool_free(sdev->pool, v_lli, p_lli);
-	kfree(txd);
+	sun6i_dma_free_desc(sdev, txd);
 	return NULL;
 }
 
@@ -869,10 +873,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_cyclic(
 	return vchan_tx_prep(&vchan->vc, &txd->vd, flags);
 
 err_lli_free:
-	for (p_lli = txd->p_lli, v_lli = txd->v_lli; v_lli;
-	     p_lli = v_lli->p_lli_next, v_lli = v_lli->v_lli_next)
-		dma_pool_free(sdev->pool, v_lli, p_lli);
-	kfree(txd);
+	sun6i_dma_free_desc(sdev, txd);
 	return NULL;
 }
 
@@ -1431,7 +1432,7 @@ static int sun6i_dma_probe(struct platform_device *pdev)
 		struct sun6i_vchan *vchan = &sdc->vchans[i];
 
 		INIT_LIST_HEAD(&vchan->node);
-		vchan->vc.desc_free = sun6i_dma_free_desc;
+		vchan->vc.desc_free = sun6i_dma_free_desc_virt;
 		vchan_init(&vchan->vc, &sdc->slave);
 	}
 
-- 
2.25.1

