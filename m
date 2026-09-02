Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC9B231832
	for <dmaengine@vger.kernel.org>; Wed,  2 Sep 2026 01:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788312653; cv=none; b=VMP/vZ1Ks8j106/JCrsRKFeurwLNrwgcQyesqOp5fqCN9uEoVoG9Ywvn57G7Yniw3oCVFoQuQLCHsk78PSw34IfOgphCX+/XDN8TXByyqCi+/f0/zMB4xaeblyDZ+B199hMrKH8fQFfjeG4X7/CEM9VzXWwCNlqVMIEn7TYPK24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788312653; c=relaxed/simple;
	bh=XPhNW0PtHRQtLxeWk92s+WKiRBWMC+SETv0uFNE7a6s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fA+4KsFEmRAMWexRqX+3h6HmAAsNpjLT/gZv6MXQkkHhBNGmvpz2KE4pPTEA5VPjXms+IAhqaMk9JhFz9GRRb/SkSWfKaE4go+8w1SlIAPJgF3NnMffd4mQiqpn5p3Xlr7wCPMENVXAd9lBfdnaegiEcK+thN6weJVz/ixrlimI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=TacY1q/m; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="TacY1q/m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=UC
	FJpfTuczGiKe+svED52Qwm0N1GjBgo++HEE5pq5Yg=; b=TacY1q/mndOW7kQW7Q
	i3rhwX0jrESCI4npew0/G+20tBmXHIAA+82qVQjcFU4PfuR6guBKeRIRYCrElTu+
	jvV6D95RJfXtz9HNCQnkLdeVVmUHeM3agZALIEtyM6N/DxPY1vWJmiFj6YyFN/R1
	XUYh2jBH4MdpWArSdtf4NAKuM=
Received: from localhost.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgD3vyspfJdq1EWSPQ--.7486S2;
	Wed, 02 Sep 2026 09:30:19 +0800 (CST)
From: "Li Youhong" <dayou5941@163.com>
To: Eugeniy.Paltsev@synopsys.com,
	vkoul@kernel.org
Cc: Frank.Li@kernel.org,
	dmaengine@vger.kernel.org,
	Li Youhong <liyouhong@kylinos.cn>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v3] dmaengine: dw-axi-dmac: convert to clk bulk APIs
Date: Wed,  2 Sep 2026 09:30:16 +0800
Message-Id: <20260902013016.3381788-1-dayou5941@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgD3vyspfJdq1EWSPQ--.7486S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXF1DJFyUJFW3XryUAw15CFg_yoWrGr17pF
	4UJrWFv3yqq348Kw4rWw43tryFyF4YkFWxZ3yrC3WSv3W3ArWktr1vk34F9F1qvF1kGa1f
	Ja17tryrCrnF9rDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jnyCJUUUUU=
X-CM-SenderInfo: 5gd103ivzuiqqrwthudrp/xtbC3QupWGqXfCsCggAA3N

From: Li Youhong <liyouhong@kylinos.cn>

axi_dma_resume() enables cfgr_clk then core_clk. If enabling
core_clk fails, return without disabling cfgr_clk, leaking the
already-enabled clock.

Switch both clocks to the clk bulk helpers so prepare/enable
failures roll back automatically, and update probe/remove/
suspend/resume accordingly.

Fixes: 1fe20f1b8454 ("dmaengine: Introduce DW AXI DMAC driver")
Suggested-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Li Youhong <liyouhong@kylinos.cn>
---
v3:
- Drop static clk table from header; use DW_AXI_DMA_MAX_CLKS and set
  clock names in probe
  v2: link: https://lore.kernel.org/all/20260901013916.194253-1-dayou5941@163.com/

v2:
- Convert to clk bulk APIs
- Use a static const clk table with ARRAY_SIZE/memcpy
  v1: link: https://lore.kernel.org/all/20260831094438.2244538-1-dayou5941@163.com/

---
 .../dma/dw-axi-dmac/dw-axi-dmac-platform.c    | 24 +++++++------------
 drivers/dma/dw-axi-dmac/dw-axi-dmac.h         |  4 ++--
 2 files changed, 10 insertions(+), 18 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index eebed2474210..cf743450f629 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -1320,8 +1320,7 @@ static int axi_dma_suspend(struct axi_dma_chip *chip)
 	axi_dma_irq_disable(chip);
 	axi_dma_disable(chip);
 
-	clk_disable_unprepare(chip->core_clk);
-	clk_disable_unprepare(chip->cfgr_clk);
+	clk_bulk_disable_unprepare(DW_AXI_DMA_MAX_CLKS, chip->clks);
 
 	return 0;
 }
@@ -1330,11 +1329,7 @@ static int axi_dma_resume(struct axi_dma_chip *chip)
 {
 	int ret;
 
-	ret = clk_prepare_enable(chip->cfgr_clk);
-	if (ret < 0)
-		return ret;
-
-	ret = clk_prepare_enable(chip->core_clk);
+	ret = clk_bulk_prepare_enable(DW_AXI_DMA_MAX_CLKS, chip->clks);
 	if (ret < 0)
 		return ret;
 
@@ -1524,13 +1519,11 @@ static int dw_probe(struct platform_device *pdev)
 
 	chip->dw->hdata->use_cfg2 = !!(flags & AXI_DMA_FLAG_USE_CFG2);
 
-	chip->core_clk = devm_clk_get(chip->dev, "core-clk");
-	if (IS_ERR(chip->core_clk))
-		return PTR_ERR(chip->core_clk);
-
-	chip->cfgr_clk = devm_clk_get(chip->dev, "cfgr-clk");
-	if (IS_ERR(chip->cfgr_clk))
-		return PTR_ERR(chip->cfgr_clk);
+	chip->clks[0].id = "cfgr-clk";
+	chip->clks[1].id = "core-clk";
+	ret = devm_clk_bulk_get(chip->dev, DW_AXI_DMA_MAX_CLKS, chip->clks);
+	if (ret)
+		return ret;
 
 	ret = parse_device_properties(chip);
 	if (ret)
@@ -1642,8 +1635,7 @@ static void dw_remove(struct platform_device *pdev)
 	u32 i;
 
 	/* Enable clk before accessing to registers */
-	clk_prepare_enable(chip->cfgr_clk);
-	clk_prepare_enable(chip->core_clk);
+	clk_bulk_prepare_enable(DW_AXI_DMA_MAX_CLKS, chip->clks);
 	axi_dma_irq_disable(chip);
 	for (i = 0; i < dw->hdata->nr_channels; i++) {
 		axi_chan_disable(&chip->dw->chan[i]);
diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
index 67cc199e24d1..681dd6162baf 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
@@ -21,6 +21,7 @@
 #define DMAC_MAX_CHANNELS	32
 #define DMAC_MAX_MASTERS	2
 #define DMAC_MAX_BLK_SIZE	0x200000
+#define DW_AXI_DMA_MAX_CLKS	2
 
 struct dw_axi_dma_hcfg {
 	u32	nr_channels;
@@ -69,8 +70,7 @@ struct axi_dma_chip {
 	int			irq[DMAC_MAX_CHANNELS];
 	void __iomem		*regs;
 	void __iomem		*apb_regs;
-	struct clk		*core_clk;
-	struct clk		*cfgr_clk;
+	struct clk_bulk_data	clks[DW_AXI_DMA_MAX_CLKS];
 	struct dw_axi_dma	*dw;
 };
 
-- 
2.25.1

