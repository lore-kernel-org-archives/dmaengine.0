Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423942FD665;
	Mon, 25 May 2026 07:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779694538; cv=none; b=kqpmuKh9lbcz6giQNdQpZ+NIrx0E7487WHaJbWy//E04n18UQsti2nFWUugYvGjaKJE5tpROeGx6EMfuvCw1VYhTAJ44QOiBwGk2HkEg+G3YjCJvr9JMpnWpOHlFe/CzesJ6mavWqaN/5i2cUCBjSsx3jmpeWBkWuoZhAT2GBr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779694538; c=relaxed/simple;
	bh=9dvBrkdJfrYfPXnBGL9jqbmpMFwrVe4wBgElwU/t46E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OfOLvNlTPmYAGJnpzg8sn3bCSFlnrk2uHX6EmT5qtUrgJVyhBQz4+JaMlN8r4/cI47xHHT9yYLibtzq9eUvtLvxQ3/Dqy+KD+mGbyJIhWK96Q2vKTLMcyJlrHIbxrOux/x0Xs0iaU9xVzNLI1DAF3tVdZvacHXjOszbb2HLeVxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 4ce2353a580c11f1aa26b74ffac11d73-20260525
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:17505196-8e3b-48c5-8036-9c076d847c24,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:0d366e6f6cfff1987f6fcc35a7a8c5be,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4ce2353a580c11f1aa26b74ffac11d73-20260525
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 168616824; Mon, 25 May 2026 15:35:27 +0800
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
Subject: [PATCH] dmaengine: sun6i-dma: Fix use-after-free in error handling paths
Date: Mon, 25 May 2026 15:35:23 +0800
Message-Id: <20260525073523.1818653-1-zenghongling@kylinos.cn>
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
---
 drivers/dma/sun6i-dma.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index a9a254dbf8cb..eb9c4ae87ac8 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -788,9 +788,15 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_slave_sg(
 	return vchan_tx_prep(&vchan->vc, &txd->vd, flags);
 
 err_lli_free:
-	for (p_lli = txd->p_lli, v_lli = txd->v_lli; v_lli;
-	     p_lli = v_lli->p_lli_next, v_lli = v_lli->v_lli_next)
+	p_lli = txd->p_lli;
+	v_lli = txd->v_lli;
+	while (v_lli) {
+		struct sun6i_dma_lli *next_v_lli = v_lli->v_lli_next;
+		dma_addr_t next_p_lli = v_lli->p_lli_next;
 		dma_pool_free(sdev->pool, v_lli, p_lli);
+		v_lli = next_v_lli;
+		p_lli = next_p_lli;
+	}
 	kfree(txd);
 	return NULL;
 }
@@ -869,9 +875,15 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_cyclic(
 	return vchan_tx_prep(&vchan->vc, &txd->vd, flags);
 
 err_lli_free:
-	for (p_lli = txd->p_lli, v_lli = txd->v_lli; v_lli;
-	     p_lli = v_lli->p_lli_next, v_lli = v_lli->v_lli_next)
+	p_lli = txd->p_lli;
+	v_lli = txd->v_lli;
+	while (v_lli) {
+		struct sun6i_dma_lli *next_v_lli = v_lli->v_lli_next;
+		dma_addr_t next_p_lli = v_lli->p_lli_next;
 		dma_pool_free(sdev->pool, v_lli, p_lli);
+		v_lli = next_v_lli;
+		p_lli = next_p_lli;
+	}
 	kfree(txd);
 	return NULL;
 }
-- 
2.25.1

