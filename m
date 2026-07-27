Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18C13D16E5;
	Mon, 27 Jul 2026 06:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785133769; cv=none; b=mkgFQ9Wv+Sj2NLgpYbTVPGwdeRn31Nc1nQgdj+QJk3kAk9aXSYT8i4QbO8goLIMNM5DWgTObnNTVoMeKDCzzfsRdaJrJASi+vcBhzWRxn6bvLPV3KtiUzjKbaZYwP7Q3k1fIW3xCOr2oFVKWy5lcEuvVJFAqozuzqXTOYsNFhgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785133769; c=relaxed/simple;
	bh=fQvFDHby4EiTjEatfIlXTLHu0t9BlCdU/iztMt44HN8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BZkKDjwX35M8FXj4FMHAom6B0a2RqeKsDzrSVuKlKqcMOAXE1qJAVCWSlACwXLkcryczRyHnKV773IEeX+/h3E+fkTKxz6fQFMHjEv4yhbo4S0Gwfv+nbqQ3kxsRffouyKbZs5T27rTEPAg6rPp/GF3sXOoJa6So5vE+tgIiS0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 80dfeba8898411f1aa26b74ffac11d73-20260727
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:9d1caa03-1081-4b9d-ac52-44a32a73c686,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e7bac3a,CLOUDID:9203008cfd4a5cc150b0afeb9072f77a,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|136|850|865|898,TC:nil,Content:0|15|
	50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 80dfeba8898411f1aa26b74ffac11d73-20260727
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1814166817; Mon, 27 Jul 2026 14:29:21 +0800
From: Hongling Zeng <zenghongling@kylinos.cn>
To: ludovic.desroches@microchip.com,
	vkoul@kernel.org,
	Frank.Li@kernel.org,
	djbw@kernel.org,
	nicolas.ferre@microchip.com,
	maciej.sosnowski@intel.com
Cc: dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhongling0719@126.com,
	Hongling Zeng <zenghongling@kylinos.cn>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH RESEND v2] dma: at_hdmac: Use stored IRQ in error path
Date: Mon, 27 Jul 2026 14:29:17 +0800
Message-Id: <20260727062917.46905-1-zenghongling@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When request_irq() succeeds but a later error occurs in at_dma_probe(),
the error handling path attempts to free the IRQ by calling
platform_get_irq() again instead of using the already stored IRQ number
in the local variable 'irq'.

Use the stored 'irq' variable directly in free_irq() to make the
code clearer and eliminate smatch warnings about potential IRQ leaks.

While platform_get_irq() is deterministic, using the stored value
makes the error handling more robust against future code changes and
clearly shows the relationship between request_irq() and free_irq().

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>

---
 Change in v2:
 -Add pre-review
---
 drivers/dma/at_hdmac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
index 09b1aedefb45..48b92043881a 100644
--- a/drivers/dma/at_hdmac.c
+++ b/drivers/dma/at_hdmac.c
@@ -2125,7 +2125,7 @@ static int __init at_dma_probe(struct platform_device *pdev)
 err_memset_pool_create:
 	dma_pool_destroy(atdma->lli_pool);
 err_desc_pool_create:
-	free_irq(platform_get_irq(pdev, 0), atdma);
+	free_irq(irq, atdma);
 err_irq:
 	clk_disable_unprepare(atdma->clk);
 	return err;
-- 
2.25.1

