Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDAD1A4F2F;
	Tue, 16 Jun 2026 03:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781580691; cv=none; b=L/K10SXx5OhPpIg6B2pkE+S/c5zcplGU2Q7DH+7camwY1tAAXOjlSkqYrh4EDdtWiJ0kH/KPS1XB9lXEPHRUv9I7zn3IBLW4ppAwrwgDNeIxxX2HAP7PD5V+sFBJsaR8k3m4dM3wTnIaCPHJ1jwg/kb7bwY572JgV+X3miVXvOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781580691; c=relaxed/simple;
	bh=Y2KI/8DPDFkNPzODRUnUuZ5On4n0HvY0aZ9FK9/iZ54=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ski+ZUktmJ+gBxQyfPOzGdXSTpcn6hX9wlzVKHtleHvqwfHvPD4UVEJNYxAP4uxVtuzrpWGRweNjTqeB2ya0I5UrMtzklPvF/fXH3EagJKLf2eyl4enQnQ6XWpSB4MlV1IMRn6uNcoJhqjzD09DLDRnTQaCbJ7Jl63ej34gLzQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: d922ccde693311f1aa26b74ffac11d73-20260616
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:a41df261-ddae-454f-8e05-8bdf533db092,IP:0,U
	RL:0,TC:0,Content:-5,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-30
X-CID-META: VersionHash:e7bac3a,CLOUDID:dd2cfc02ff709e3f057f61824139d4d7,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:2,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d922ccde693311f1aa26b74ffac11d73-20260616
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 404894445; Tue, 16 Jun 2026 11:31:23 +0800
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
Subject: [PATCH] dmaengine: sun6i-dma: Fix memory leak in sun6i_dma_terminate_all
Date: Tue, 16 Jun 2026 11:31:16 +0800
Message-Id: <20260616033116.23490-1-zenghongling@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When terminating a non-cyclic DMA transfer, the active descriptor
is not properly reclaimed. The descriptor is removed from the
desc_issued list in sun6i_dma_start_desc(), but in
sun6i_dma_terminate_all(), only cyclic transfer descriptors are
added to the desc_completed list before cleanup.

For non-cyclic transfers, pchan->desc is set to NULL without first
adding the descriptor back to a list that vchan_get_all_descriptors()
can collect. This causes the descriptor and its associated LLI chain
to be permanently leaked.

Fix by ensuring both cyclic and non-cyclic active descriptors are
added to the desc_completed list before setting pchan->desc to NULL.

Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
---
 drivers/dma/sun6i-dma.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 7a79f346250a..97730ba6c874 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -946,16 +946,14 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 
 	spin_lock_irqsave(&vchan->vc.lock, flags);
 
-	if (vchan->cyclic) {
-		vchan->cyclic = false;
-		if (pchan && pchan->desc) {
-			struct virt_dma_desc *vd = &pchan->desc->vd;
-			struct virt_dma_chan *vc = &vchan->vc;
+	if (pchan && pchan->desc) {
+		struct virt_dma_desc *vd = &pchan->desc->vd;
+		struct virt_dma_chan *vc = &vchan->vc;
 
-			list_add_tail(&vd->node, &vc->desc_completed);
-		}
+		list_add_tail(&vd->node, &vc->desc_completed);
 	}
 
+	vchan->cyclic = false;
 	vchan_get_all_descriptors(&vchan->vc, &head);
 
 	if (pchan) {
-- 
2.25.1

