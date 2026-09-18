Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2F34746CF;
	Fri, 18 Sep 2026 16:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789748684; cv=none; b=B/Fbt6Nz+Aprjf7/jfpviyK+YHy1HWzqpShLQyLeWk5+9YpKHqE//emora5o/FrgAfDUFh+S/EzhKKUezC4V6q4EEEl2D4be1WunQ3M8lXYncpalHGeylKyRo6a/A2ohxlc8Tnwt+zuoHp7QvAKT+302tzBc3/XyyncM38z3myk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789748684; c=relaxed/simple;
	bh=a9UMrlBU/8il4opRr15eFLVA1PKmrBWrGUqquUU6dqE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YABxclydHEyoqhz+1CYpu/5ppwfZPFcXtOoryvibXasLUUsTcrmo5cBA0vBUaWEf+M0vXf7J1iyLRdax/5KKr56drqwUeHgvhD+EwabI4WZ4G+xxsH27Y9MNS5+HqeIRJwTKKNPu++aDFUunjXJ9x/zDf19rX/2QKqva5hZUGdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UV+Fikwj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UV+Fikwj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71D9C1F00898;
	Fri, 18 Sep 2026 16:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789748681;
	bh=BFuxdqrNz7VP56eLQKKpSf2Xnd+7Gjg5FuE32ZBVZ6g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=UV+FikwjusZbpK5g1AiNL7nsRv08tgIOOKrnByofrV9Y7MEKDczpaHFmZzuUWFO2l
	 7yDzBwEdY7P5vurl/uB3OKUNZ/bU/311zw1DwPZNel3DpCKL7H4H215KLu3aFswkHJ
	 rCe+TScrXAWZ30I1a3yY2UNOYE5DkvnsS00bEtqAIkDPlYwVrVH917ASUAEMJsucDx
	 1Hdq2vr4wI+nmtP/ZeKtFnTsC2fJ8fKCHNbUlgq41e75HE/hz4/v3Y/apHw5dTSxdR
	 t429TlaNZfSWIpEQSZc1BOoSZHj2MsCED7dupR2YHoUKUck2iHQzzDrLol9UJunnI8
	 AWdgXm74ZVj6g==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 18 Sep 2026 18:24:27 +0200
Subject: [PATCH v3 08/22] dmaengine: ste_dma40: Init hardware before
 registration
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-dma40-fixes-v3-8-8dd8450669e8@kernel.org>
References: <20260918-dma40-fixes-v3-0-8dd8450669e8@kernel.org>
In-Reply-To: <20260918-dma40-fixes-v3-0-8dd8450669e8@kernel.org>
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
index ba223d9dd3c9..dc6a63f148ff 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -3692,19 +3692,21 @@ static int __init d40_probe(struct platform_device *pdev)
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

