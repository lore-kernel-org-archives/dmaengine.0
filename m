Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB4B30C618;
	Thu, 24 Sep 2026 08:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790238934; cv=none; b=YSPa/Rkfg2D3sistfhwiT19N7GfA9LSNxGPn4guvGlJXO2IifztrKLcLFCuEINLsVofpDJF5fV4is73166468biAUG5q2qc42qi5ANQojpqiYZuLFHBSngOhz/LCnaUdETJuLGTauJfPWO9rhVZN+RJo51ZIrbxpa1HGjf3A1/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790238934; c=relaxed/simple;
	bh=js/b6+nwhFEvn5VN64j7kMdg0h55/jmGBeKtPogUxb0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gkmrQiymMHweRejirogCxy7OweWsubvlaVW15ZHIMQoCo9wcs9GM1V1N3wukCA1C51h324ZinNMQADNf3U8z6bbjTninPQpYonimWPAD6tnJJWIIlivKi8CfnJFlSqXTEzs72tDv4IWIY2rWr8L0PvL/djlpJb+yIaLPUCoqDi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mmGfK2UN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mmGfK2UN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 349561F000FF;
	Thu, 24 Sep 2026 08:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790238932;
	bh=Npz5Q0tdjitbsy81VelxS68JZzIM/zQwSYQWUnifBTA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=mmGfK2UNi/0nim4hNBhyyPWP8x0Rexlj5IarxtgnSRm8j8qkljHE+QZPTt+MruCpL
	 wyGVGvACCGSX4yfzayIkoz+jUbw+s+Gtq0bwCJKd2p0odvlCxjCbr4WcAAEhl3CmVW
	 6Wyyk2/ymRQPcgWMQ37gv8uxhj9mQjCnSa43BsdARDE+J8h8MlO9Pw5w/wQor5Ey+q
	 MwHhjIoMbNdvSlc3J6Gx2WXhVcGnjLSD5Df75X23PNcPSAICKNOXfF/CLg3eoHG5v8
	 RAIKBKja4A7xDRX/lYNshYdhlm5A+7DBcy0rbjn0dCwe3bbtt1EMUuMkFKxEONHeK7
	 LgoKT14s7LXnQ==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 24 Sep 2026 10:35:21 +0200
Subject: [PATCH v6 09/23] dmaengine: ste_dma40: Init hardware before
 registration
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-dma40-fixes-v6-9-fdb6755020a2@kernel.org>
References: <20260924-dma40-fixes-v6-0-fdb6755020a2@kernel.org>
In-Reply-To: <20260924-dma40-fixes-v6-0-fdb6755020a2@kernel.org>
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
index 271f653a15c4..85789ee7c0c9 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -3838,19 +3838,21 @@ static int __init d40_probe(struct platform_device *pdev)
 	}
 	pm_runtime_use_autosuspend(base->dev);
 
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

