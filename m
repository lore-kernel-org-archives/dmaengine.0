Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7AA528F5
	for <dmaengine@vger.kernel.org>; Tue,  1 Sep 2026 01:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788226786; cv=none; b=sO0uaJ5511AYVQWfZaY7+ieHBsUUNYnFrgieQ23fS4HruMg5REIh+533g/LlBz+GqV5//5MPeCCwY7zxrCaXiSkDwdUuTHddita7S4mF1bjT6FFjxFeWMeHQrxgHiY/bncOg5ohFyAuOZd9BQlYDjGaIOIfbf7VPdOTgO7YSYrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788226786; c=relaxed/simple;
	bh=wNjqOWc9qgwrPCQAGCh3pBN68JeqSMcaioc/47FwYqw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LgIii+m8ojI4nH6PVnW2B+nYVlexhKT+hngguIJlJtxuwWh9MlbqvZax2QTb/cqfXr0PDENIeC4aXeXCXnEYJMytPLsUsIcU2xYSVoEKns+zApMSl6qhVqmeSkSQlVUKuVM88ywlo8RZW2tjdvhGHW4irkDp5TVgPA6yg5JsaKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=GUNp2aaq; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="GUNp2aaq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=ek
	cOCYWo4gHmVSbewGcjcydDi2sPTjixkqFl/dHFrLQ=; b=GUNp2aaqatbXdchaVa
	O6NVT+Ji1RgzXu30FYc7LiSjFoBiCmthD6n7lfLB9b3YsC41Un8PbLsLHdN1uAD5
	EF1ZgHRAEhu02IXpiRHPUg5qtZRqsZ5+FH8hvgpyomO47hJRivY54NOwIf4pT2s2
	G4LjwprRSyZG/l1AT4vtEngJU=
Received: from localhost.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgDXP0DFLJZqTMIpPQ--.38549S2;
	Tue, 01 Sep 2026 09:39:18 +0800 (CST)
From: "Li Youhong" <dayou5941@163.com>
To: Eugeniy.Paltsev@synopsys.com,
	vkoul@kernel.org
Cc: Frank.Li@kernel.org,
	dmaengine@vger.kernel.org,
	Li Youhong <liyouhong@kylinos.cn>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v2] dmaengine: dw-axi-dmac: convert to clk bulk APIs
Date: Tue,  1 Sep 2026 09:39:16 +0800
Message-Id: <20260901013916.194253-1-dayou5941@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgDXP0DFLJZqTMIpPQ--.38549S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXF1DJFyUJFW3Wr48AF45GFg_yoWrJry7pa
	1UJrWFvayvga48Kw4rWw4xAF1FyF45KFWxZ3yxC3Zav3W5ArWktr18K34F9F1qvr1kGw4f
	Ja17tFyrCFnrurDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jnyCJUUUUU=
X-CM-SenderInfo: 5gd103ivzuiqqrwthudrp/xtbC3QZ8K2qWLMaK2AAA3I

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
v2:
- Convert to clk bulk APIs
- Use a static const clk table with ARRAY_SIZE/memcpy
  v1: link: https://lore.kernel.org/all/20260831094438.2244538-1-dayou5941@163.com/

---
 .../dma/dw-axi-dmac/dw-axi-dmac-platform.c    | 23 ++++++-------------
 drivers/dma/dw-axi-dmac/dw-axi-dmac.h         |  8 +++++--
 2 files changed, 13 insertions(+), 18 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index eebed2474210..3a957af0e089 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -1320,8 +1320,7 @@ static int axi_dma_suspend(struct axi_dma_chip *chip)
 	axi_dma_irq_disable(chip);
 	axi_dma_disable(chip);
 
-	clk_disable_unprepare(chip->core_clk);
-	clk_disable_unprepare(chip->cfgr_clk);
+	clk_bulk_disable_unprepare(ARRAY_SIZE(chip->clks), chip->clks);
 
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
+	ret = clk_bulk_prepare_enable(ARRAY_SIZE(chip->clks), chip->clks);
 	if (ret < 0)
 		return ret;
 
@@ -1524,13 +1519,10 @@ static int dw_probe(struct platform_device *pdev)
 
 	chip->dw->hdata->use_cfg2 = !!(flags & AXI_DMA_FLAG_USE_CFG2);
 
-	chip->core_clk = devm_clk_get(chip->dev, "core-clk");
-	if (IS_ERR(chip->core_clk))
-		return PTR_ERR(chip->core_clk);
-
-	chip->cfgr_clk = devm_clk_get(chip->dev, "cfgr-clk");
-	if (IS_ERR(chip->cfgr_clk))
-		return PTR_ERR(chip->cfgr_clk);
+	memcpy(chip->clks, dw_axi_dmac_clks, sizeof(chip->clks));
+	ret = devm_clk_bulk_get(chip->dev, ARRAY_SIZE(chip->clks), chip->clks);
+	if (ret)
+		return ret;
 
 	ret = parse_device_properties(chip);
 	if (ret)
@@ -1642,8 +1634,7 @@ static void dw_remove(struct platform_device *pdev)
 	u32 i;
 
 	/* Enable clk before accessing to registers */
-	clk_prepare_enable(chip->cfgr_clk);
-	clk_prepare_enable(chip->core_clk);
+	clk_bulk_prepare_enable(ARRAY_SIZE(chip->clks), chip->clks);
 	axi_dma_irq_disable(chip);
 	for (i = 0; i < dw->hdata->nr_channels; i++) {
 		axi_chan_disable(&chip->dw->chan[i]);
diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
index 67cc199e24d1..fb11b525727e 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
@@ -22,6 +22,11 @@
 #define DMAC_MAX_MASTERS	2
 #define DMAC_MAX_BLK_SIZE	0x200000
 
+static const struct clk_bulk_data dw_axi_dmac_clks[] = {
+	{ .id = "cfgr-clk", },
+	{ .id = "core-clk", },
+};
+
 struct dw_axi_dma_hcfg {
 	u32	nr_channels;
 	u32	nr_masters;
@@ -69,8 +74,7 @@ struct axi_dma_chip {
 	int			irq[DMAC_MAX_CHANNELS];
 	void __iomem		*regs;
 	void __iomem		*apb_regs;
-	struct clk		*core_clk;
-	struct clk		*cfgr_clk;
+	struct clk_bulk_data	clks[ARRAY_SIZE(dw_axi_dmac_clks)];
 	struct dw_axi_dma	*dw;
 };
 
-- 
2.25.1

