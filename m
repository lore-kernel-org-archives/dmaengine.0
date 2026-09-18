Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAC9238C16;
	Fri, 18 Sep 2026 16:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789748677; cv=none; b=q/ILAuIUZ1MQtEwpGcqWiy6VIHM5qHVECwgpW7bvHFuuYHRlGA4v8fBt1H7LbiqgGG/YV18Oq8rnGmTKa7K4RrSWKIFPMyGqScuMVXBGUKQrbBsbrw6bYmOXH1mk1OLbyrkvrNkHLi+tPHo3idR2IU9fnw1IyKnCuzZyNmC9qlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789748677; c=relaxed/simple;
	bh=S9NQZP4cnAOR8UoEI9NoAqgwkz3fArBwchKdzb1hqqs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r75dkMB8esyb5m2KO9k+T5TQ0xWLwz/OPh7Z5BlVw338UcRSLl5T3+GqlwdPeI7QmJkqW/V7qmR62NDeejp247w9HmX+LSske9HRaLdIap0K0EMA/WPkdMdw8C1oJSYZYDFKad6hsM2ngww+05a9RQ1e9+pJdj7a+hkMlxcvImM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P5TcKREn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P5TcKREn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5A3F1F000FF;
	Fri, 18 Sep 2026 16:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789748675;
	bh=9lt8FXhA8Q5oEp+MP/WCLH9+5fOXG5cwqJpgR0TciOU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=P5TcKREnGU5SUctK+e4Flc7Y05KPtCKD3dMBLPSmBePGtdnq5FHJHuHFkxeojFlQz
	 e9AlKNGOFVpAMWJtxfGJGtmh+Xk5v+D6dJX+5UlswmGu8hqcpjzi6uXX0H1FpOrUwd
	 7gDffNI+RsecSmScjk73DS4GXbeWQ0neRCbujPCuOstToeAc5wuMz9Cr/3FyE4suDQ
	 2ghyg6/bfPrYzvbczIaKCtARza1eEWjvIcnVJ7VvLzrud8VbTqY7jKSerMkMrYq+sD
	 tWeX3e4ZG4NIfnhCqwlsfQ4vCOrDsTa9IuT8avy4z9jbwGLVM++2DV3q/HRcs540/G
	 e5t03CqBUHP0g==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 18 Sep 2026 18:24:23 +0200
Subject: [PATCH v3 04/22] dmaengine: ste_dma40: Fix probe runtime PM
 disable
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-dma40-fixes-v3-4-8dd8450669e8@kernel.org>
References: <20260918-dma40-fixes-v3-0-8dd8450669e8@kernel.org>
In-Reply-To: <20260918-dma40-fixes-v3-0-8dd8450669e8@kernel.org>
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
index 451a87992058..28fcd196d95b 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -3543,6 +3543,7 @@ static int __init d40_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct resource res_lcpa;
 	int num_reserved_chans;
+	bool runtime_pm_enabled = false;
 	u32 val;
 	int ret;
 
@@ -3630,12 +3631,6 @@ static int __init d40_probe(struct platform_device *pdev)
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
@@ -3664,6 +3659,13 @@ static int __init d40_probe(struct platform_device *pdev)
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
@@ -3699,7 +3701,8 @@ static int __init d40_probe(struct platform_device *pdev)
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

