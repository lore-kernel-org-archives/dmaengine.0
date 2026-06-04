Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C1B33F58D;
	Thu,  4 Jun 2026 10:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780568367; cv=none; b=B6YJPB+CCvwIh7S2Az/tVUv7bOFIQubDoLkAqcRdCuKxhstWIPiDj8u7sgVnL3jA/kvRQk2HvkniLAxSFcerl1MaflDh44/moALbZGAi+7fCYGJsa0AgK7OXdTXNFAMiwJykm37/4MaN0nVhar4SHuNhCyv8bs4zjZ01tisBzys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780568367; c=relaxed/simple;
	bh=V9ezap07PdNb3higgxSuCJ58J37yNDBt/cjQHt+96mY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=KT34qD/pXC2nzdSNCAgQIgmun9l0agbmuR1OPjkSshCtdX+QMvAsDQvO7i8lk2Ob1j2nh90iSjinFFQOP0NXe5yn5TMv5nMpYOo6JbyseRfT1sUDaRtwJi+KcryMprUq9GkAkVUA81eVf4oYzsoMNGGigFOhun5TB5cJLiBDG28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: d778c6b05ffe11f1aa26b74ffac11d73-20260604
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:0642027d-d015-421b-9a2e-cf088fbc5267,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:e7bac3a,CLOUDID:28094a09612553bf4032c3acc3611d2b,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:-3,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d778c6b05ffe11f1aa26b74ffac11d73-20260604
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 315364915; Thu, 04 Jun 2026 18:19:16 +0800
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
Subject: [PATCH v2] dma: at_hdmac: Fix use-after-free by proper tasklet cleanup
Date: Thu,  4 Jun 2026 18:19:12 +0800
Message-Id: <20260604101912.318118-1-zenghongling@kylinos.cn>
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
Change in v2:
- Fix NULL pointer dereference in probe error path by checking if channels                                                                       list is initialized before cleanup
- Fix race condition by calling free_irq() before tasklet_kill() to ensure
  IRQ handlers cannot reschedule tasklets after cleanup
---
 drivers/dma/at_hdmac.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
index e5b30a57c477..9048b56b082f 100644
--- a/drivers/dma/at_hdmac.c
+++ b/drivers/dma/at_hdmac.c
@@ -1940,6 +1940,19 @@ static void at_dma_off(struct at_dma *atdma)
 		cpu_relax();
 }
 
+static void at_dma_cleanup_channels(struct at_dma *atdma)
+{
+	struct dma_chan *chan, *_chan;
+
+	list_for_each_entry_safe(chan, _chan, &atdma->dma_device.channels,
+			device_node) {
+		/* Disable interrupts */
+		atc_disable_chan_irq(atdma, chan->chan_id);
+		tasklet_kill(&to_at_dma_chan(chan)->vc.task);
+		list_del(&chan->device_node);
+	}
+}
+
 static int __init at_dma_probe(struct platform_device *pdev)
 {
 	struct at_dma		*atdma;
@@ -2109,6 +2122,8 @@ static int __init at_dma_probe(struct platform_device *pdev)
 err_memset_pool_create:
 	dma_pool_destroy(atdma->lli_pool);
 err_desc_pool_create:
+	if (atdma->dma_device.channels.next != NULL)
+		at_dma_cleanup_channels(atdma);
 	free_irq(platform_get_irq(pdev, 0), atdma);
 err_irq:
 	clk_disable_unprepare(atdma->clk);
@@ -2125,16 +2140,11 @@ static void at_dma_remove(struct platform_device *pdev)
 		of_dma_controller_free(pdev->dev.of_node);
 	dma_async_device_unregister(&atdma->dma_device);
 
-	dma_pool_destroy(atdma->memset_pool);
-	dma_pool_destroy(atdma->lli_pool);
 	free_irq(platform_get_irq(pdev, 0), atdma);
+	at_dma_cleanup_channels(atdma);
 
-	list_for_each_entry_safe(chan, _chan, &atdma->dma_device.channels,
-			device_node) {
-		/* Disable interrupts */
-		atc_disable_chan_irq(atdma, chan->chan_id);
-		list_del(&chan->device_node);
-	}
+	dma_pool_destroy(atdma->memset_pool);
+	dma_pool_destroy(atdma->lli_pool);
 
 	clk_disable_unprepare(atdma->clk);
 }
-- 
2.25.1

