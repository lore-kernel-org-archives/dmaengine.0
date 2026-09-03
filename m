Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7632EEE9D
	for <dmaengine@vger.kernel.org>; Thu,  3 Sep 2026 01:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788400510; cv=none; b=dSgAbGN/YQvoCY5FIH3dgEQ9xA0a0yWk8LyBqc2RGBoW7tHUIk+cE5h9mbUQjvspni+ZgVbXkcye3hx5l0XFfOqqLqetzHXP9uyPeppb82bDz40JRg1ALXa0Zy1RJIVkXO/GmPeQH7h9ffvyBDwgnZIJ1byY+z9sdlCQEG/XhS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788400510; c=relaxed/simple;
	bh=12SyA27V+nPFZtoLdhpXEh08iVR4Z6NPZvVlq0xUMpE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=krTAW2LX8v+P6lDHS5iH1SeDqXZPjTRgqv3z+zPgIL+I42BATBkyKQ/YEgpvbomHBgqorYUfeaGBLWJSv9He7Jdc+Ko79Do4E90QKOOBlGbG4KsdaLJIyF0ItxOSsv2DTrkQuLWv1PPKw9yh6qPAz6e/T9F65ci/12haILvoFa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Rro108GB; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Rro108GB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=wC
	mCqOgQF+aMwsOQP+gKJImLGYcqVmGnWDbjWcdf8DE=; b=Rro108GBvJqcMOpfn6
	Ali0cboT7FaVOoIvif5hhaR3VRyTVK9LKdRYGXMxzw3ZlyXYuIMwnxXWjNJrF2rO
	yJwAtZBnLCJx4F9vS7cK3CYu2oQVsVN02hznS6gU15iJlDYMubwUV3y/qFefj55p
	fr4JaiZuC8yalGXuIcj6fm7YY=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgD3Zfxg05hqZAhoOQ--.18144S2;
	Thu, 03 Sep 2026 09:54:41 +0800 (CST)
From: "Li Youhong" <dayou5941@163.com>
To: Eugeniy.Paltsev@synopsys.com,
	vkoul@kernel.org
Cc: Frank.Li@kernel.org,
	dmaengine@vger.kernel.org,
	Li Youhong <liyouhong@kylinos.cn>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v4] dmaengine: dw-axi-dmac: convert to clk bulk APIs
Date: Thu,  3 Sep 2026 09:54:38 +0800
Message-Id: <20260903015438.2514100-1-dayou5941@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgD3Zfxg05hqZAhoOQ--.18144S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXF1DJFy7Gw1DJry8AFWrXwb_yoWrAw45pa
	1UJrWFq3yvga40gayrXw4xAryFyF4YkayxZ3y8Ca4Sv3W5ArZ5tr1kKw1FvF1q9F18ta1f
	Ja17tryrCrnrWrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jnhL8UUUUU=
X-CM-SenderInfo: 5gd103ivzuiqqrwthudrp/xtbC3QHNfGqY02F4KgAA3-

From: Li Youhong <liyouhong@kylinos.cn>

axi_dma_resume() enables cfgr_clk then core_clk. If enabling
core_clk fails, return without disabling cfgr_clk, leaking the
already-enabled clock.

Switch both clocks to the clk bulk helpers so prepare/enable
failures roll back automatically, and update probe/remove/
suspend/resume accordingly.

In dw_remove(), check clk_bulk_prepare_enable(). On failure skip
MMIO and the matching disable to avoid unbalanced clk disable;
always continue with IRQ/OF/tasklet teardown.

Fixes: 1fe20f1b8454 ("dmaengine: Introduce DW AXI DMAC driver")
Suggested-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Li Youhong <liyouhong@kylinos.cn>
---
 .../dma/dw-axi-dmac/dw-axi-dmac-platform.c    | 42 +++++++++----------
 drivers/dma/dw-axi-dmac/dw-axi-dmac.h         |  4 +-
 2 files changed, 22 insertions(+), 24 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index eebed2474210..413be7dce5fc 100644
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
@@ -1640,19 +1633,24 @@ static void dw_remove(struct platform_device *pdev)
 	struct dw_axi_dma *dw = chip->dw;
 	struct axi_dma_chan *chan, *_chan;
 	u32 i;
+	int ret;
 
 	/* Enable clk before accessing to registers */
-	clk_prepare_enable(chip->cfgr_clk);
-	clk_prepare_enable(chip->core_clk);
-	axi_dma_irq_disable(chip);
-	for (i = 0; i < dw->hdata->nr_channels; i++) {
-		axi_chan_disable(&chip->dw->chan[i]);
-		axi_chan_irq_disable(&chip->dw->chan[i], DWAXIDMAC_IRQ_ALL);
+	ret = clk_bulk_prepare_enable(DW_AXI_DMA_MAX_CLKS, chip->clks);
+	if (ret)
+		dev_err(&pdev->dev, "Failed to enable clocks\n");
+	else {
+		axi_dma_irq_disable(chip);
+		for (i = 0; i < dw->hdata->nr_channels; i++) {
+			axi_chan_disable(&chip->dw->chan[i]);
+			axi_chan_irq_disable(&chip->dw->chan[i], DWAXIDMAC_IRQ_ALL);
+		}
+		axi_dma_disable(chip);
 	}
-	axi_dma_disable(chip);
 
 	pm_runtime_disable(chip->dev);
-	axi_dma_suspend(chip);
+	if (!ret)
+		axi_dma_suspend(chip);
 
 	for (i = 0; i < DMAC_MAX_CHANNELS; i++)
 		if (chip->irq[i] > 0)
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

