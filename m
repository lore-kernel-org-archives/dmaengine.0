Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499485372FA;
	Tue, 22 Sep 2026 23:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790119862; cv=none; b=LFvK5TXfidlbaPksCQRDeq+ojOWGctSlNrxDga+hhY+/QuxVSfldh8N1uLsmaZZjl8c7/HGga9WS08GjSgtnFJthuB2eyn3vbjDh73PlVuw0YR/JZjgcZ4nRJDbC1khLBeqyiNlWu8z/rLm808HxVZQCjFSynoxb9+OfAvEHL+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790119862; c=relaxed/simple;
	bh=YVZItkYmECYDalvQFkZSYATd8WYVUo4EZF7wkBc8iEI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ya//vWNADWMTCNbf0kiejxZXYgWUkyLqPW8hAO8YFbHsTu0qG4Ri6XtVWjcPldi2NdjB+/KSAcJ/sV9Sskwrq9zPbxPX5utJN07D3JlzamNcValU2ea2PXzbTMfmG7LEF1oq4cfjLfFChKmuTlVdf1jy1cpXZhpWNOgQIdPjKjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q3nDrC1L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q3nDrC1L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E9071F00898;
	Tue, 22 Sep 2026 23:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790119860;
	bh=7jMgyNGouhNtlMRJA8DsWd7kS4HQJnbrafm1+gqIr28=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Q3nDrC1LqQNBrmRZ4+ECkPvYF2PmZ8yniRM+ngKtHiMWZ0e45Y5KK6m0ysaQpTF1x
	 PE8b4pziKRXSzBcQeLUM3r+nvR4gWbfnWaUdHUoQnVcgEyAeQW9jjLm+V8r4NrwLuD
	 8rEDPe5wlz6JVUYIk7FHWmpR9gd+MmaRhoneid8mNA67pk7QqnrAbh0meRQLrx+O/Q
	 GSKKyStT8INV5y9LI14WTAwAFIa1znpqY2fHricVK9qqLj0d2nHZ7M5LLOaUarIrXM
	 +QTUYxi/TSFHtqlRGlseZoO7edeeiVjE9PxjrQDtY/wTucXBgeeJrYtJDN0OcDmj5Z
	 M1KA6ijQBEdeg==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 23 Sep 2026 01:30:50 +0200
Subject: [PATCH v5 05/23] dmaengine: ste_dma40: Fix probe runtime PM
 disable
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-dma40-fixes-v5-5-709d160cde76@kernel.org>
References: <20260923-dma40-fixes-v5-0-709d160cde76@kernel.org>
In-Reply-To: <20260923-dma40-fixes-v5-0-709d160cde76@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, sashiko-bot@kernel.org
X-Mailer: b4 0.14.3

Some d40_probe() error paths jump to destroy_cache before runtime PM has
been enabled for the DMA controller device. The label unconditionally
calls pm_runtime_disable(), which increments disable_depth even though
this probe attempt never enabled runtime PM.

Track whether this probe attempt enabled runtime PM before disabling it on
the error path. This is not about a later deferred-probe retry, since the
driver is registered with platform_driver_probe(); it keeps the probe
unwind balanced.

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
 drivers/dma/ste_dma40.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 621ae9ffcd57..0d09908d1978 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -3673,6 +3673,7 @@ static int __init d40_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct resource res_lcpa;
 	int num_reserved_chans;
+	bool runtime_pm_enabled = false;
 	u32 val;
 	int ret;
 
@@ -3760,12 +3761,6 @@ static int __init d40_probe(struct platform_device *pdev)
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
@@ -3794,6 +3789,13 @@ static int __init d40_probe(struct platform_device *pdev)
 	pm_runtime_mark_last_busy(base->dev);
 	pm_runtime_set_active(base->dev);
 	pm_runtime_enable(base->dev);
+	runtime_pm_enabled = true;
+
+	ret = request_irq(base->irq, d40_handle_interrupt, 0, D40_NAME, base);
+	if (ret) {
+		d40_err(dev, "No IRQ defined\n");
+		goto destroy_cache;
+	}
 
 	ret = d40_dmaengine_init(base, num_reserved_chans);
 	if (ret)
@@ -3829,7 +3831,8 @@ static int __init d40_probe(struct platform_device *pdev)
 		regulator_disable(base->lcpa_regulator);
 		regulator_put(base->lcpa_regulator);
 	}
-	pm_runtime_disable(base->dev);
+	if (runtime_pm_enabled)
+		pm_runtime_disable(base->dev);
 
  report_failure:
 	d40_err(dev, "probe failed\n");

-- 
2.55.0

