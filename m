Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEE9348C7B;
	Sat, 19 Sep 2026 22:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789856548; cv=none; b=GFjncqFfbD0UCt2e4QYOO3EwxtkFm1ogpMmM4Qt63jtmUMfXBlCO8rgJnCmOjfCvNDBS/ETkXN2kSZPylUNryPokwqgla4ES8BOwk1HSJG7TRNskczvr5dt87PStruQzqq305clfTB8WmiJYiV3KHe+yVPgQAZtxev66Eml9/lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789856548; c=relaxed/simple;
	bh=DalWrzKciS7IdsPwoctb5400vx9ooCbtzzB+MwyO+1k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OiJlMCl8UW9GIUkEVqbxHCdyM3cQE7ysavo7QWsP656btLzpfLVR3QX6BH+82VlKaPkI4YXWc8iC82/N5pY/aSymBe9z5lbtcmtNB1Kb8PcvkL6uwBAGhkDr6bwp6/EilZQUbs/p0Haj7e9RX5zKcDs1L45drSKz2isTP7V3xx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b1DgjDiw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b1DgjDiw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 268AC1F00893;
	Sat, 19 Sep 2026 22:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789856546;
	bh=xgl0pGKP0a7RUwktjA5fIBxeg0+XEPqwz0FPd1WPNwA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=b1DgjDiwdQT2u87bufzH2meCdQzcZb64Ql72LldCmg/JFRU+WhsCCibJgP1RqU382
	 VXyansTWYZbCN5bEC17iQMS8guwnQ32xohsJaaoflOUb2jtG8Jb5vFgr8odKlvImad
	 M4Ic2A3WJC2KJG/3bc0MhqnXDxPH6nwlDQ7Or0x8QN568JLglPWq0mec1TLCfTf+nQ
	 sK8vRlqA0enhXhbp908PKsw15rqNkM7eUvDOcQjU63uxOCV4i6IZVeRnZgSgRkSIHy
	 s0Dj+lTtTfuowOqeN5e/QrSPA9Pbk2LJaeUB+6riVr2GObKOz6bndpI4UTPUX5/HR9
	 yvDhqbZEfW0pw==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 20 Sep 2026 00:22:16 +0200
Subject: [PATCH v4 05/23] dmaengine: ste_dma40: Fix probe runtime PM
 disable
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-dma40-fixes-v4-5-d751b2d9c23f@kernel.org>
References: <20260920-dma40-fixes-v4-0-d751b2d9c23f@kernel.org>
In-Reply-To: <20260920-dma40-fixes-v4-0-d751b2d9c23f@kernel.org>
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
index 4591da863398..bf3da3a94d8f 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -3643,6 +3643,7 @@ static int __init d40_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct resource res_lcpa;
 	int num_reserved_chans;
+	bool runtime_pm_enabled = false;
 	u32 val;
 	int ret;
 
@@ -3730,12 +3731,6 @@ static int __init d40_probe(struct platform_device *pdev)
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
@@ -3764,6 +3759,13 @@ static int __init d40_probe(struct platform_device *pdev)
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
@@ -3799,7 +3801,8 @@ static int __init d40_probe(struct platform_device *pdev)
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

