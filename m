Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90515372DB;
	Tue, 22 Sep 2026 23:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790119869; cv=none; b=Xt/QV4pVDLxWxGdcQcZ2TMu8XA17jnKDUtqw3Gif77wrWIvkik0dxdMq5NfByt13BN4F08I3VRtFgQIrpex34l8qsJl81q2Syoemh0pB/kXPqrC/AaqsEVw5Y68tqgTJmD6Lt//NsNIFIW/vIEBeNzQ2H4BK59/UenXO9ldmP6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790119869; c=relaxed/simple;
	bh=Yt6B9RFRtL/tMoOIKEMLR31OdshGRDDrSMOYASdGz+0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U0L9Qqyk3CJJXpEMTvGCerB2yqLHPJlxPISgEK57ZDKdvaarkyoh1d0ZWmT4xmhFccLsf/AYWp1vlphxSvqqTyjXntVHchmXcDs9snOWyX/4Prnw8CYUeWIOrDmfqisCBctMJhwLgYj+P3b09T4xEoXVtIxh++Kp+o9N92MKJJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CJajSk53; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CJajSk53"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62E4F1F00893;
	Tue, 22 Sep 2026 23:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790119867;
	bh=oidfzfDkKyJkJIuLeDW6wJ36tqRDuwt6tUyp36EKSRs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=CJajSk53I2N7vj2CxET8f0EE7o6WC7eeNK6Kk7BqYgxlZyg9T9elZAtYtLr5e71L6
	 gqfQnPsAJxL1aws/fREjq6rGfpbWLqshBjcpXsfNKagqfTnWkUy3nyFCniiZAJaEJP
	 t0QDNYcUUzJ3vjWmJLENxbQNp1onvPl37o2L4dC1RI5dC3sT7yRhUPjdJYmi89opYA
	 OhavR++92FGsi23WSRYB85KDci2TjtY+IwW1OaVd3KoNU2j8JSL7Z25fdzV1wXoUJW
	 7oIMzlVpkOrm+MIYpvTTGyTde55BiQMXJojzGu1wVht9eDepMJaTcs8gSDNiRyiRwU
	 XivnFk3yFVHIQ==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 23 Sep 2026 01:30:54 +0200
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
Message-Id: <20260923-dma40-fixes-v5-9-709d160cde76@kernel.org>
References: <20260923-dma40-fixes-v5-0-709d160cde76@kernel.org>
In-Reply-To: <20260923-dma40-fixes-v5-0-709d160cde76@kernel.org>
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
index 0c3f837fe586..d67126e9c2bf 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -3841,19 +3841,21 @@ static int __init d40_probe(struct platform_device *pdev)
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

