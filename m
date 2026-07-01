Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5A93D9666
	for <dmaengine@vger.kernel.org>; Wed,  1 Jul 2026 20:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782936429; cv=none; b=KDZch0ZzVmxeIohBKmPowgjnyumRemWDBR/wXM9AVcDqE647ce51T5g/jxXyjCvuK5toj/+zQBY+RnlafoyraESUoxUpQStnqKT+y1K0mUbrZ/uALz86EC52BQd+QIlb26pYQcP87zYuGtz2Oty+7hpCla77Th4Q31IbZSR/y2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782936429; c=relaxed/simple;
	bh=X03KX3EHILZPCEcBbKYDNa0YOdwNNLHBu1AlKuojYQE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n3ScZB9cosdmirbdBeKWWDzIJBQIztcCNKNwuRQO6AXJmkmiiRih8ENDJ5yJJjbRr4Gw4YQ/GlABvGI3Q/5AGMeFwAHWB7AivFx5jAeZj7JxIyxRORG1uWgu3iI1ehJW3WPMcbvgFwsLwPsi32oHZbE7yLlZLNsN6+sTWiS/l68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LdmtY/jv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LdmtY/jv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D6D41F000E9;
	Wed,  1 Jul 2026 20:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782936428;
	bh=PmqtZ9UynrtR3FXqygucaN5FcrVeXQgED/Jne2Xy9pA=;
	h=From:To:Cc:Subject:Date;
	b=LdmtY/jv28LGUzbuMjalCIUQ4PD/AlaW3wUQLb4XEM13SYZxh/h6ReC3bry7jri/D
	 8pDQkW3eo+CkS/UMSg2+tw0tYzVC0IPvorWqr4pObAn/4rryizJCg+8QR9rZVfo9Tx
	 fW1A4biWSxn4vjHron24xbvORJ9TKpjqg55tKQA0KIJHDX9Yv3x03md5mj7E1viDBU
	 os3h6erWjpCrB4r19hFCoUWn0FVDp8pOuyOIPv/8Gk+QqAR14ncd5SK4IKITxIfO91
	 MHLY8n9VsOulwCUNq017PicsxlBtWkN/8kNBfI3Du3CRvnxQ2C+WLsgLYK1DepXaIK
	 59XxFzIHR8lgA==
From: Vladimir Zapolskiy <vz@kernel.org>
To: Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Long Cheng <long.cheng@mediatek.com>,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] dmaengine: mediatek: mtk-uart-apdma: Return -ENOMEM on memory allocation failure
Date: Wed,  1 Jul 2026 23:07:03 +0300
Message-ID: <20260701200703.117929-1-vz@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If dynamic memory allocation in driver's probe function execution fails, it
should be reported to the driver's framework with -ENOMEM error code.

Fixes: 9135408c3ace ("dmaengine: mediatek: Add MediaTek UART APDMA support")
Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
---
 drivers/dma/mediatek/mtk-uart-apdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c b/drivers/dma/mediatek/mtk-uart-apdma.c
index c269d84d7bd2..f74e9a328588 100644
--- a/drivers/dma/mediatek/mtk-uart-apdma.c
+++ b/drivers/dma/mediatek/mtk-uart-apdma.c
@@ -531,7 +531,7 @@ static int mtk_uart_apdma_probe(struct platform_device *pdev)
 	for (i = 0; i < mtkd->dma_requests; i++) {
 		c = devm_kzalloc(mtkd->ddev.dev, sizeof(*c), GFP_KERNEL);
 		if (!c) {
-			rc = -ENODEV;
+			rc = -ENOMEM;
 			goto err_no_dma;
 		}
 
-- 
2.51.0

