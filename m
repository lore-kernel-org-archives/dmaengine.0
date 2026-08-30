Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B6E282F2A;
	Sun, 30 Aug 2026 14:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788098975; cv=none; b=fNS+D9RadkQibQahsoZE2Q/Tf+aTX0DmJKEx3wmkiXrnMPgqVd2Vff/61NCKt+Wn4sc0j0SXUqjEIN8jkZ0SArra/0Ryy6Cv+z9dq1g1EevTfavXTGW8tenQBcsS3BIJUDUNJUa2c0m9ILRaY4T9/YvcJ5Z++v63EY88c9L8uoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788098975; c=relaxed/simple;
	bh=aq3qOCVQRnrRH/MZ7jN+dWV2whUpt0E7MVX41WDBAQg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HXPlGkK4r6gld77QUeKoUA7qKPuWbqxLW2cbEq6tYXf+QspWy0amVj/zY+dar7JhHk/6DHLZ0mHMqJddfipI+D8As65aL69u++C9AiNVAvelbtdudLLyeazoOqxd94HLVRjiID63qwEYdfUFi4fyXb/QOkKtm51gLVkh/qLOYO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-03 (Coremail) with SMTP id rQCowAAHDDqXOZRqwY6bBg--.17790S2;
	Sun, 30 Aug 2026 22:09:27 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Frank Li <Frank.Li@nxp.com>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Vinod Koul <vkoul@kernel.org>,
	imx@lists.linux.dev,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dmaengine: fsl-edma: make channel resource allocation transactional
Date: Sun, 30 Aug 2026 22:09:25 +0800
Message-ID: <20260830140925.30268-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAAHDDqXOZRqwY6bBg--.17790S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tr4fKr43WF43Kw1xXF4kCrg_yoW8ZrWfpa
	4fJa1FkFWUt34Y9F4DAw4rZr4Fga18JFyUKFW7Gwn8Z3s8Jwn3Cwn5Gw1Svr98ZryrAF4x
	tFn8JFyrCF1UuaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkK14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWx
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUj2YLD
	UUUUU==
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

Channel allocation ignores a required clock failure and does not reject
a failed TCD DMA-pool allocation before requesting IRQ resources.

Check both prerequisites and unwind only the channel clock that was
enabled by this allocation attempt.

Fixes: 9d831528a656 ("dmaengine: fsl-edma: extract common fsl-edma code (no changes in behavior intended)")
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/dma/fsl-edma-common.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/fsl-edma-common.c b/drivers/dma/fsl-edma-common.c
index bb7531c456dfa..02b92d1464cca 100644
--- a/drivers/dma/fsl-edma-common.c
+++ b/drivers/dma/fsl-edma-common.c
@@ -844,13 +844,20 @@ int fsl_edma_alloc_chan_resources(struct dma_chan *chan)
 	struct fsl_edma_chan *fsl_chan = to_fsl_edma_chan(chan);
 	int ret = 0;
 
-	if (fsl_edma_drvflags(fsl_chan) & FSL_EDMA_DRV_HAS_CHCLK)
-		clk_prepare_enable(fsl_chan->clk);
+	if (fsl_edma_drvflags(fsl_chan) & FSL_EDMA_DRV_HAS_CHCLK) {
+		ret = clk_prepare_enable(fsl_chan->clk);
+		if (ret)
+			return ret;
+	}
 
 	fsl_chan->tcd_pool = dma_pool_create("tcd_pool", chan->device->dev,
 				fsl_edma_drvflags(fsl_chan) & FSL_EDMA_DRV_TCD64 ?
 				sizeof(struct fsl_edma_hw_tcd64) : sizeof(struct fsl_edma_hw_tcd),
 				32, 0);
+	if (!fsl_chan->tcd_pool) {
+		ret = -ENOMEM;
+		goto err_pool;
+	}
 
 	if (fsl_chan->txirq)
 		ret = request_irq(fsl_chan->txirq, fsl_chan->irq_handler, IRQF_SHARED,
@@ -873,7 +880,9 @@ int fsl_edma_alloc_chan_resources(struct dma_chan *chan)
 		free_irq(fsl_chan->txirq, fsl_chan);
 err_txirq:
 	dma_pool_destroy(fsl_chan->tcd_pool);
-	clk_disable_unprepare(fsl_chan->clk);
+err_pool:
+	if (fsl_edma_drvflags(fsl_chan) & FSL_EDMA_DRV_HAS_CHCLK)
+		clk_disable_unprepare(fsl_chan->clk);
 
 	return ret;
 }

base-commit: 08dbfad3f5040f5bdb6c529da20d6d4e81fefd72
-- 
2.50.1

