Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF274718C5;
	Sun, 20 Sep 2026 18:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789930792; cv=none; b=t8QJxRAHZEoeB02mYKaQ3fQnC0AA+dhmilkMfOi/BjsPVXpRpoDMANKLpfAg7J8pbpAIv7ddO+QbyTrsh/a6DI7awEH37hZsJANmWnoLzU4gzSk9fsSSb3b4uRPdbY0VSoqDxOx72dctsa/5YXcmTfh6pfwaR649YqTBfbup3wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789930792; c=relaxed/simple;
	bh=eEbZKt4dMKK0c85zlMM1Jd6oe3Z34aJfKQyNLTkL60o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kNkf6lU6wYMix02ijGg3bkescY322LHsGdO2QVgan7Ghk9TUn2yWM/Y2r1xYniK5xnIiKEsgxsBEevT6os92lR0TDxuQ0HQKHT41IocueWpQ937dNMOtPGs+HMBiHdjcxtijIqyTlvG5GG8quL/iQQ4GSAd81Jnk7zlNybBRKtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iB1qCNjb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iB1qCNjb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D07411F000FF;
	Sun, 20 Sep 2026 18:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789930791;
	bh=8TGV8irefShwD6CM489ptscjtg0wk9t5Bqfy/mllLnA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=iB1qCNjbOtiSOYK84W9dyCqWdueFWs4kZT9lzm14xwxRmOMaSdTSUCzjHlQUSbe/h
	 oRNrNvIfy3O8UB8IackmXiKYJ905zfob5QlPtuYJQ62TcnWwHVn8cZmuOP95oKE06U
	 rpJjhp+7XEBd9Ag998cFMlJW2zzJBShvG78Ya9iCMyqggkTQeRWrWHGyNlcGQr/VTJ
	 5j/Zagzb3e0QionVFuQAfzwE/F6WgazYxUgP24OYiQ9cDReYarTLoU7kY8A43E/i8u
	 eGtjVnwGhAOCVLmd9vY/IDwtayIODRH8X4lDoYmKnyg4/Bk7gfTk8hP0twAFW8V7CW
	 jtrBDVOA7gQpw==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 20 Sep 2026 20:59:40 +0200
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
Message-Id: <20260920-dma40-fixes-v5-5-5c55cd7f92f9@kernel.org>
References: <20260920-dma40-fixes-v5-0-5c55cd7f92f9@kernel.org>
In-Reply-To: <20260920-dma40-fixes-v5-0-5c55cd7f92f9@kernel.org>
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
index 280a0d2f16c5..1d02226ab5ff 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -3661,6 +3661,7 @@ static int __init d40_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct resource res_lcpa;
 	int num_reserved_chans;
+	bool runtime_pm_enabled = false;
 	u32 val;
 	int ret;
 
@@ -3748,12 +3749,6 @@ static int __init d40_probe(struct platform_device *pdev)
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
@@ -3782,6 +3777,13 @@ static int __init d40_probe(struct platform_device *pdev)
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
@@ -3817,7 +3819,8 @@ static int __init d40_probe(struct platform_device *pdev)
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

