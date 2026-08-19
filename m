Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFF22773CA
	for <dmaengine@vger.kernel.org>; Wed, 19 Aug 2026 22:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787178966; cv=none; b=fqHNKUGnJxxosVCBoVNSY27qXdXCTrYOOernbV2hYgo392lcj16F7wnaksebC3J2vVd13BmBknK6mHIL3cXKFPIbBbeXVLuxsxbV9EGeg9C4FUSXuLD6F1iUmeZ2mAHslXYX2Fzsyg8bhICTqYyWn0J6Pl/RcEQkbvQExM6f97w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787178966; c=relaxed/simple;
	bh=myQ6ZEptmy+VwLSBa2kF5UyncQoydRhcT8MdmME4mH8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yd4HohiIV0ziwlt6xjcomHOH5ZoZ3L16ivpR3PbK9BlqE7y1hwFDL273j9B4Fj0cKyJIAVxQmVtFpUFPv3TG7ROymkr5xj+d9pwjxb5gobHDE9sBEa30UNjgbuV59eegym4rwQuveOxjFYveZxPpPoZfCedHReQxRS/ePAA+zss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aEw07t5k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aEw07t5k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 989891F000E9;
	Wed, 19 Aug 2026 22:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787178964;
	bh=S4ZfhyV4pnlKhRo6jURPWoSMgxnSbcNbKeQpNwdmhiQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=aEw07t5k9gkoYx0Axy0Wa4Z7E+iPmhbVhNmKxNWKelofgF4FAApkYmIP1aQIjQ4pv
	 RKtz3ZIdyOU073meMnmDd9x8woH2GHGHnOk9iKfbHDuhkplcUTcKILGm8HXEYYyQVT
	 iFbpFdUmi0Oke3g0uzfWMVup0u8PtJbqV4TcDD6vtvyVEZ1tOSbFDt+5wuyr7sxPrN
	 miFuicHL03vHt+Rt0nKe5KNzVyfL+mcu1HRD78hobN5okFzI5gw0Q8xxgp5/o7Wusa
	 mbDfntYFctueqWjIZzMMOP54KCHflnk8kr28vweCWDex0RUWMk41BK14FtHlN5iMjA
	 0RYcd47em2eUQ==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 20 Aug 2026 00:35:58 +0200
Subject: [PATCH 2/4] dmaengine: ste_dma40: Fix probe runtime PM disable
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-dma40-fixes-v1-2-5e14815ad689@kernel.org>
References: <20260820-dma40-fixes-v1-0-5e14815ad689@kernel.org>
In-Reply-To: <20260820-dma40-fixes-v1-0-5e14815ad689@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
 sashiko-bot@kernel.org
X-Mailer: b4 0.14.3

d40_probe() can jump to destroy_cache before runtime PM has been enabled
for the DMA controller device. Calling pm_runtime_disable() on that path
increments disable_depth, which can leave runtime PM disabled after a later
successful deferred probe.

Track whether this probe attempt enabled runtime PM before disabling it on
the error path.

Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/dmaengine/20260618051539.15E201F000E9@smtp.kernel.org/
Assisted-by: Codex:gpt-5-5
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index d5837aa0a789..0c8ff299c2c2 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -3502,6 +3502,7 @@ static int __init d40_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct resource res_lcpa;
 	int num_reserved_chans;
+	bool runtime_pm_enabled = false;
 	u32 val;
 	int ret;
 
@@ -3623,6 +3624,7 @@ static int __init d40_probe(struct platform_device *pdev)
 	pm_runtime_mark_last_busy(base->dev);
 	pm_runtime_set_active(base->dev);
 	pm_runtime_enable(base->dev);
+	runtime_pm_enabled = true;
 
 	ret = d40_dmaengine_init(base, num_reserved_chans);
 	if (ret)
@@ -3658,7 +3660,8 @@ static int __init d40_probe(struct platform_device *pdev)
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

