Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE89378811;
	Sun, 27 Sep 2026 09:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790499814; cv=none; b=UVPzVgsI3epx5Q5R9KAzWdMAF/sckpSP5Aiwf1/I5bgQkqQMc0GkA3FBQja969Xr9YpdkYHlFLo/hzIAcA/UGuuZDbGL0CER1pNjAnP+S2AtTIXWJzu6C2NRly6XwEiNGnoGaUTp+w5gaGO/5YSqT4uohIPhifrdn+KWtIHN7Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790499814; c=relaxed/simple;
	bh=8qaU+kGaDl/M9XPtKO8EkZ/B1B0gp1qUQtqSf27SPiI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kTaSiYQ74M93bHOLgUF8CwZm2qJSjdoWYqti9giF7NlSGctx7Ol2aQF3dZoSMJ0vsSzFP6r9UAW3AiyAWERswtBi7RD30W9gteWFwFLYhnd0tEiZE8kDfg0fTfWX+aRJg1en84di2LEmAtXo5uZduH0kxNXudh4Bll/kUpeoNPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RM8GIiAL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RM8GIiAL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EB9D1F00893;
	Sun, 27 Sep 2026 09:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790499812;
	bh=GBBxPJDlG0aN11sQHS7yG9Q1FIXryMnDdP9Non6yypI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=RM8GIiALx4ZyByG+3omPrdROq32+HwQsqF0Y7bVPwSwImoRQK71I/B8s0Q4WtF5ec
	 P/mixnXANu//gi8Izlt/eqxYXT1uU0zblBWMryvFaPkEi1LIN8IKSustCh4Lblt0ZM
	 gKbMEzghT8pYRD/WphvJzGg55xyP333TL9CJ6G3gGuIkmOeOPu4EysiISJvn6p9Dof
	 tHxCzCOIQrn2yxVh3mScKRk6px/XeqgBrHcOe1CcRtWE3qI1Z3WwwlnqwF+oqZeD+i
	 ATLZa1ky59RR/T11m7OBf8116pF8O6J/DwCZxEF08fIAVQekH5hKQQHzieywFxO88z
	 oYo1M3yYEjvNw==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 27 Sep 2026 11:03:18 +0200
Subject: [PATCH v7 05/24] dmaengine: ste_dma40: Fix probe runtime PM
 disable
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-dma40-fixes-v7-5-89f595e8851d@kernel.org>
References: <20260927-dma40-fixes-v7-0-89f595e8851d@kernel.org>
In-Reply-To: <20260927-dma40-fixes-v7-0-89f595e8851d@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, sashiko-bot@kernel.org, 
 Frank Li <Frank.Li@nxp.com>
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 64f7a0ca20b9..1dcfeabb3f36 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -3757,12 +3757,6 @@ static int __init d40_probe(struct platform_device *pdev)
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
@@ -3787,10 +3781,20 @@ static int __init d40_probe(struct platform_device *pdev)
 
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
@@ -3826,7 +3830,6 @@ static int __init d40_probe(struct platform_device *pdev)
 		regulator_disable(base->lcpa_regulator);
 		regulator_put(base->lcpa_regulator);
 	}
-	pm_runtime_disable(base->dev);
 
  report_failure:
 	d40_err(dev, "probe failed\n");

-- 
2.55.0

