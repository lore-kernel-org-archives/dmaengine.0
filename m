Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F36B40BCD8;
	Thu, 24 Sep 2026 08:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790238927; cv=none; b=lEkXNqVycBpA2CHNXLduW+bZV8G7PHQFkQNjVPuaT6FdFU5/15KP+MYuHp/uCZCDeQ89nUxIOxB6mHQAVjdQNYRH/41G27Vv6Q9zaCM1o4iTC+JlBw6k3PLe5q4CPjqRYl8YkbBPLO+T0MyQkxd7DQ5HmOg4W3IhWcZbS0UUMo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790238927; c=relaxed/simple;
	bh=vPsP6XRei9HADDCPrfc/I/UtPI/gtBWBZG6fbnTcdTU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SyQxbptDo2C2mjj/jfdPo558t8heLC4OBSkVRF777bLmhZ1ZSipFx+Iu8NlmehAHJFZlcI9vecto4ACMN1h8Y3ha0sBz5Mrmh2b60EVHQeWbNhErUw3VOiEBzHb9r1BwA1ED3cvjiEo2p3cC0IQxjM3h2RdR+A5ZnYn7pkPLxI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PFI/mw5B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PFI/mw5B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B27681F000FF;
	Thu, 24 Sep 2026 08:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790238925;
	bh=QMm907poNpqSzmky2/rfVkG+Navv2cCveglbkspW2gM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=PFI/mw5BiBXFt7okFzN6FkUhi+xVULD4y+2CN4RqQeCKO48SX2FBiooPUcROmCYqA
	 rE7H3UV/Gy2zoCFasAxdB4s6qskJpXDUdjXpDC3c+fuJTJcj7NtnysJCEuwAQQh36L
	 nKafxcizaEbgBBi9d2wsToiTSNgt/9zJ7K04YTK/zjMS7kyckx7A2q9pZpCbtsoeHb
	 XztksKGgD/OiF1Hf2KZia2PE4pNSa8Yk8Az9g/QrRMOZMLW2gjrLXlr4dwam0BC4sV
	 A26avNtSQ3xpsdESVoHVy2ojova/Zakde4VTpWIJW2oNjeTdVyM5MLyQ6z+PiEU6P2
	 sX+F49p22UVbA==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 24 Sep 2026 10:35:17 +0200
Subject: [PATCH v6 05/23] dmaengine: ste_dma40: Fix probe runtime PM
 disable
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-dma40-fixes-v6-5-fdb6755020a2@kernel.org>
References: <20260924-dma40-fixes-v6-0-fdb6755020a2@kernel.org>
In-Reply-To: <20260924-dma40-fixes-v6-0-fdb6755020a2@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, sashiko-bot@kernel.org
X-Mailer: b4 0.14.3

Some d40_probe() error paths jump to destroy_cache before runtime PM has
been enabled for the DMA controller device. The label unconditionally calls
pm_runtime_disable(), which increments disable_depth even though this probe
attempt never enabled runtime PM.

Use devm_pm_runtime_set_active_enabled() to mark the controller active,
enable runtime PM and register balanced cleanup for probe failure. This
avoids both the disable-depth imbalance and ad-hoc probe state tracking.

The interrupt handler uses pm_runtime_get_if_active() and cannot
acknowledge a pending interrupt while runtime PM is disabled. Request the
IRQ only after enabling runtime PM so the handler cannot enter an
unacknowledged interrupt loop during probe.

Fixes: 0618c077a8c2 ("dmaengine: ste_dma40: Fix PM disable depth imbalance in d40_probe")
Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/dmaengine/20260618051539.15E201F000E9@smtp.kernel.org/
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 621ae9ffcd57..de1d5670adec 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -3760,12 +3760,6 @@ static int __init d40_probe(struct platform_device *pdev)
 		goto destroy_cache;
 	}
 
-	ret = request_irq(base->irq, d40_handle_interrupt, 0, D40_NAME, base);
-	if (ret) {
-		d40_err(dev, "No IRQ defined\n");
-		goto destroy_cache;
-	}
-
 	if (base->plat_data->use_esram_lcla) {
 
 		base->lcpa_regulator = regulator_get(base->dev, "lcla_esram");
@@ -3790,10 +3784,20 @@ static int __init d40_probe(struct platform_device *pdev)
 
 	pm_runtime_irq_safe(base->dev);
 	pm_runtime_set_autosuspend_delay(base->dev, DMA40_AUTOSUSPEND_DELAY);
-	pm_runtime_use_autosuspend(base->dev);
 	pm_runtime_mark_last_busy(base->dev);
-	pm_runtime_set_active(base->dev);
-	pm_runtime_enable(base->dev);
+
+	ret = devm_pm_runtime_set_active_enabled(base->dev);
+	if (ret) {
+		d40_err(dev, "Failed to enable runtime PM: %d\n", ret);
+		goto destroy_cache;
+	}
+	pm_runtime_use_autosuspend(base->dev);
+
+	ret = request_irq(base->irq, d40_handle_interrupt, 0, D40_NAME, base);
+	if (ret) {
+		d40_err(dev, "No IRQ defined\n");
+		goto destroy_cache;
+	}
 
 	ret = d40_dmaengine_init(base, num_reserved_chans);
 	if (ret)
@@ -3829,7 +3833,6 @@ static int __init d40_probe(struct platform_device *pdev)
 		regulator_disable(base->lcpa_regulator);
 		regulator_put(base->lcpa_regulator);
 	}
-	pm_runtime_disable(base->dev);
 
  report_failure:
 	d40_err(dev, "probe failed\n");

-- 
2.55.0

