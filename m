Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACA2255F2D;
	Wed,  8 Jul 2026 03:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783479618; cv=none; b=PCtZ3r47zoUVaCzr6TNIdSgVQYPs5MsdlGjndZAor65xn5uS7ri7YeEAQFElJ0vS5EZn90t+1/QpRDSjt8G0Oj/Rj1/zHsPbMXWwt/CA9Xcw7GnSLNQwF8scl3CGySd2DP1qGT2RCyHHnlwq6rAb1h0/cpLHTQpkdHivRUFwjQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783479618; c=relaxed/simple;
	bh=ScQ/FleeQ8F1aUM1HISfRbn9Zbx1wOayHbB+g6iPO2I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=H2urhbKT8F+5zJKpn1BidZCdBJB1s07UgccUsXcWEMMZd6wBMrRIXuA3puAPNgZPEUv0ceNppNqAE/avo1Iw18kKPMJkk5bfSmbhxq2pHwbWhyacFTk1u2yNTKxXulVvGic4a+krSkCi3kaeIvYy17UC3+QtIKkdAYmR4AERpy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 1eee634e7a7911f1aa26b74ffac11d73-20260708
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:191cc531-1742-484c-aed4-2cf24294ad6e,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:e7bac3a,CLOUDID:86fba6597cb42a73cb87b096cd83fcfb,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:-3,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1eee634e7a7911f1aa26b74ffac11d73-20260708
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1968779627; Wed, 08 Jul 2026 11:00:05 +0800
From: Hongling Zeng <zenghongling@kylinos.cn>
To: ludovic.desroches@microchip.com,
	vkoul@kernel.org,
	Frank.Li@kernel.org,
	tudor.ambarus@linaro.org,
	nicolas.ferre@microchip.com
Cc: linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhongling0719@126.com,
	Hongling Zeng <zenghongling@kylinos.cn>,
	sashiko-bot@kernel.org
Subject: [PATCH v4] dma: at_hdmac: Fix use-after-free by proper tasklet  cleanup
Date: Wed,  8 Jul 2026 10:59:59 +0800
Message-Id: <20260708025959.40283-1-zenghongling@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Current cleanup paths have a use-after-free vulnerability:
- vchan_init() creates tasklets that access at_dma_chan memory
- free_irq() only waits for IRQ handler, NOT tasklets
- atdma is devm-managed and freed after probe/remove
- Running tasklets accessing freed memory → Use-After-Free!

The fix requires careful ordering:
- free_irq() FIRST to synchronize with running IRQ handlers and prevent
  them from scheduling new tasklets
- Then kill tasklets to wait for already-scheduled ones to complete
- Only then free other resources

Fixes: ac803b56860f ("dmaengine: at_hdmac: Convert driver to use virt-dma")
Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/all/20260604073945.54B311F00898@smtp.kernel.org/
Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>

---
Change in v4:
  - Fix error path fallthrough causing double-free_irq()
  - Use channel iteration index (chan_id not initialized before registration)
  - Remove unnecessary defensive checks
---
 drivers/dma/at_hdmac.c | 31 ++++++++++++++++++++++---------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
index e5b30a57c477..044a0fb38b7a 100644
--- a/drivers/dma/at_hdmac.c
+++ b/drivers/dma/at_hdmac.c
@@ -1940,6 +1940,20 @@ static void at_dma_off(struct at_dma *atdma)
 		cpu_relax();
 }
 
+static void at_dma_cleanup_channels(struct at_dma *atdma)
+{
+	struct dma_chan *chan, *_chan;
+	int i = 0;
+
+	list_for_each_entry_safe(chan, _chan, &atdma->dma_device.channels,
+			device_node) {
+		/* Disable interrupts */
+		atc_disable_chan_irq(atdma, i++);
+		tasklet_kill(&to_at_dma_chan(chan)->vc.task);
+		list_del(&chan->device_node);
+	}
+}
+
 static int __init at_dma_probe(struct platform_device *pdev)
 {
 	struct at_dma		*atdma;
@@ -2105,12 +2119,17 @@ static int __init at_dma_probe(struct platform_device *pdev)
 err_of_dma_controller_register:
 	dma_async_device_unregister(&atdma->dma_device);
 err_dma_async_device_register:
+	free_irq(platform_get_irq(pdev, 0), atdma);
+	at_dma_cleanup_channels(atdma);
 	dma_pool_destroy(atdma->memset_pool);
+	dma_pool_destroy(atdma->lli_pool);
+	goto err_clk;
 err_memset_pool_create:
 	dma_pool_destroy(atdma->lli_pool);
 err_desc_pool_create:
 	free_irq(platform_get_irq(pdev, 0), atdma);
 err_irq:
+err_clk:
 	clk_disable_unprepare(atdma->clk);
 	return err;
 }
@@ -2118,23 +2137,17 @@ static int __init at_dma_probe(struct platform_device *pdev)
 static void at_dma_remove(struct platform_device *pdev)
 {
 	struct at_dma		*atdma = platform_get_drvdata(pdev);
-	struct dma_chan		*chan, *_chan;
 
 	at_dma_off(atdma);
 	if (pdev->dev.of_node)
 		of_dma_controller_free(pdev->dev.of_node);
 	dma_async_device_unregister(&atdma->dma_device);
 
-	dma_pool_destroy(atdma->memset_pool);
-	dma_pool_destroy(atdma->lli_pool);
 	free_irq(platform_get_irq(pdev, 0), atdma);
 
-	list_for_each_entry_safe(chan, _chan, &atdma->dma_device.channels,
-			device_node) {
-		/* Disable interrupts */
-		atc_disable_chan_irq(atdma, chan->chan_id);
-		list_del(&chan->device_node);
-	}
+	at_dma_cleanup_channels(atdma);
+	dma_pool_destroy(atdma->memset_pool);
+	dma_pool_destroy(atdma->lli_pool);
 
 	clk_disable_unprepare(atdma->clk);
 }
-- 
2.25.1

