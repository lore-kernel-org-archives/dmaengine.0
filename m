Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEDD30B521;
	Sat, 19 Sep 2026 22:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789856554; cv=none; b=LT7llESZ/ijrJGoQ+JWs72FxxMJI3m9Od1UZEM92CPrmjIPDTreyDdx5/urHxY590eSKFNM4WXKKpJU0RA3S+knsTMxvV0tArjmfKP7win6C6wvQqF1oMJSBVbEbf+m/k7QNw90kXBGi3irXtHdwIUVH3gBaElLsm1wHngcTi7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789856554; c=relaxed/simple;
	bh=3zt/18ary9e4qqAAwWk+albrl7wNw4jiRXa8TeDOS1c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FRu7bx8XVpU4qZIFdRK6B70JkHIomoSpQRNAXUjj/tkeFGVciCLyUIgfk7qy5dOqGhW3HUmuJohBg2jjknmhHFGDnXVG4TxfoDocVNA0mDlEngEYflFriVE4m9cJ77f3V5T7coic/Ma1q/Q1oF5c+tvdJoOpo1YCYXmnK6JPtF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XOCrygDa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XOCrygDa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8E6E1F00893;
	Sat, 19 Sep 2026 22:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789856553;
	bh=5JhxOobaY9WYVvDLhh/WetmeyUWOdcsEJtEuquJ7UqA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=XOCrygDaT/DLrvWE6+inf0P1YRjdPTZkPTUcKbLhBfIloAzj0Xn3dy6INgVj+ExJ+
	 DUCssV2Q84/B4qilxgrbp5BlAsCe+Xp2MoMJ+2owOThMDqZ0ZaeWwj5uEg9zifE3Fu
	 k9iLz8csdQhHsgc8OMw92VAzO3pn6deeLG8HED2SGBVCPCvBM6EJYZ7A6JPCYFlU7e
	 F5g5D9tmxAVP42bcximHXbuoYCYWdlI5z5RJLx5XC+IEBka+/q0c8wFBloG/MyGtqL
	 hijQnEPyTrsJcdcwb0KhP+e+NkhCNQni94wlcjzvqykDftO0lr1inBLwISf2auyAlE
	 sfYht9ZqFE4pQ==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 20 Sep 2026 00:22:20 +0200
Subject: [PATCH v4 09/23] dmaengine: ste_dma40: Init hardware before
 registration
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-dma40-fixes-v4-9-d751b2d9c23f@kernel.org>
References: <20260920-dma40-fixes-v4-0-d751b2d9c23f@kernel.org>
In-Reply-To: <20260920-dma40-fixes-v4-0-d751b2d9c23f@kernel.org>
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
index 9f725369721b..73560d482343 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -3804,19 +3804,21 @@ static int __init d40_probe(struct platform_device *pdev)
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

