Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4765437DAC0;
	Sun, 20 Sep 2026 18:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789930799; cv=none; b=qB8ncSF9fIbsOxB76MyECr+svhHPBP4iG2atS5qGP/4iMivC/BGXyxPFsj3gnNXnqQ1XjZvyK12aBRMiMYd1xfnDTTs+/EShMCytakg5UDXixLWbA5wVYWpQdKtyOd67fRzexNMN402zQNy0cveUB93K9qxUKXQX56nboA8RFec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789930799; c=relaxed/simple;
	bh=8GE4AbcbTdt4c7wphc+8JK3CUicgzJj8MR/1BtjoE+Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QiXEjrneEQN2lgkrGY8+uwCezt6KFWU7AA4k8FHPR6TLZ5QFy+nLSy6XMoNjUHOWEvwO3z5VHvNYmvXILcjLvnVb4vij5o6wrzDiH3SxQLFR8L2laQVklQwUYye5mArYU2Do7tM3T/0rKP/Jh/fA4kstVgIqr/7weZwtPONb75g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TZMTKeEN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TZMTKeEN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 998371F000FF;
	Sun, 20 Sep 2026 18:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789930797;
	bh=GbJfhKxhJNUtwsX3BKNjiTa/faVq+5mrtbzh5g+Xqho=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=TZMTKeENy2ErWFP7Z16c5AieVSnzN6+FuTatqiKQtZKt9LFiJSujXG3bladY6BHaZ
	 f8UZG2rZE49CYy38gh09iYNFncOp0C+0/6OBmG2cUNm0gcN9Da9ce77/cIbyipW7Ee
	 Zcxjk7oFRaoOePGMe6/UUImqfUPzWSiZTyq97JyGY2T3iPLZGowV8re/u3KVN+NLyI
	 +n2pHUhLZ6MJ9Frqz/9tvijVVMgIv/qPcQ2H1PHkFmmHCan32DdKWiWMWFZG2JP+UF
	 Vv/P1Q/wXOsZLGCeqB74zfmD9jGWXb7VQiOowIAxf6/GanG+4gD9vEkPk2QEmuj3v4
	 0sJ6xi6+2ARwQ==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 20 Sep 2026 20:59:44 +0200
Subject: [PATCH v5 09/23] dmaengine: ste_dma40: Init hardware before
 registration
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-dma40-fixes-v5-9-5c55cd7f92f9@kernel.org>
References: <20260920-dma40-fixes-v5-0-5c55cd7f92f9@kernel.org>
In-Reply-To: <20260920-dma40-fixes-v5-0-5c55cd7f92f9@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, sashiko-bot@kernel.org
X-Mailer: b4 0.14.3

d40_probe() enables the interrupt handler and registers DMAengine devices
before calling d40_hw_init(). An interrupt pending from the bootloader can
therefore reach the handler while the hardware interrupt state is not
initialized and channel lookup entries are empty. The handler deliberately
does not acknowledge an interrupt for an unknown channel, so a level IRQ
can retrigger continuously.

Request the IRQ with IRQF_NO_AUTOEN, then initialize the hardware and set
the DMA segment limit. Enable the IRQ before registering DMAengine devices.
This ensures the handler and clients only observe initialized hardware
while still letting request_irq() fail before hardware interrupts are
enabled.

Fixes: 8d318a50b3d7 ("DMAENGINE: Support for ST-Ericssons DMA40 block v3")
Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/dmaengine/20260819225215.5EA2F1F000E9@smtp.kernel.org/
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 4380f9a1b035..7cbcf8433fe0 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -3827,19 +3827,21 @@ static int __init d40_probe(struct platform_device *pdev)
 	pm_runtime_enable(base->dev);
 	runtime_pm_enabled = true;
 
-	ret = request_irq(base->irq, d40_handle_interrupt, 0, D40_NAME, base);
+	ret = request_irq(base->irq, d40_handle_interrupt, IRQF_NO_AUTOEN,
+			  D40_NAME, base);
 	if (ret) {
 		d40_err(dev, "No IRQ defined\n");
 		goto destroy_cache;
 	}
 
-	ret = d40_dmaengine_init(base, num_reserved_chans);
-	if (ret)
-		goto destroy_cache;
-
 	dma_set_max_seg_size(base->dev, STEDMA40_MAX_SEG_SIZE);
 
 	d40_hw_init(base);
+	enable_irq(base->irq);
+
+	ret = d40_dmaengine_init(base, num_reserved_chans);
+	if (ret)
+		goto destroy_cache;
 
 	ret = of_dma_controller_register(np, d40_xlate, NULL);
 	if (ret) {

-- 
2.55.0

