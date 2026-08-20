Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529D6449985;
	Thu, 20 Aug 2026 13:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787231713; cv=none; b=NLy1Lh9+9qUB14caYQx1jjCN5ocZsZEq+76CtLoRMUwZPzM89RtYo3a63rayF35/qa/X/jLZY9I7VD3kDuLMD4WYwDtr/nwMchULhxGQS6O/PcWOBJ54NA9xrNAXDMyrZCK/Zq/JlJqAucclEbA275/E6Yd/KUGrCiOp7YS3Fsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787231713; c=relaxed/simple;
	bh=MW3rv5GzBQrSs03B0zRUaHhRnoXhG4x6QRSc5fXFLt0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cu5QBC2oDa51XZQpJyN8j4zCa5TLHQCLGSGP+IeQKS5/ZFwhBMVI7jYrFY6DyPXmWq+UCvbs2/06vGIgTzkOzRH2OE7ffVxnvsvoPLk+i/f1oFxDpxQDEE74EawBncZCy3fNU1OsNkJD+AHAtGPEyYJ3+qdmlRwmHidfj9IEG04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ah3wEL1N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ah3wEL1N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23D731F00A3F;
	Thu, 20 Aug 2026 13:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787231710;
	bh=FS+JAXouZhTNc23harbB2umNLx+SPjao7IOIsUkxWWA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ah3wEL1Nt14WadyxQeKB6DJaxN9w4Hc13qXosXwWV70NgX8VrYo5AKdg/YOmZ7HXm
	 66NDKhEFhzgnf/3w/BrxE3xtpI+oxNUjSr08f1COX7+zjUfe/sHjohwcLGi4LcDvbA
	 DBYl3ndQk4Ax7v1+3Jm8ZX8Sk1WSvcAw1WhEVnAIQRqSBBTeqwEOKbtZcY3JxbpHGy
	 Kv+C2KDKt63fKKufTyUggb4BlsoRoM5q+S1/M+jL+/umh139Z9DeHg/rARZF0c+z6X
	 XipWFeyACxPwCPOsV016rPZcdcDoFMju5j+AEWXbZZ41QsIHZBdmzF0x/8AeJVOabz
	 dWX0M6x+NweuQ==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 20 Aug 2026 15:15:01 +0200
Subject: [PATCH v2 07/13] dmaengine: ste_dma40: Fix probe runtime PM
 disable
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-dma40-fixes-v2-7-63238334c707@kernel.org>
References: <20260820-dma40-fixes-v2-0-63238334c707@kernel.org>
In-Reply-To: <20260820-dma40-fixes-v2-0-63238334c707@kernel.org>
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

Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/dmaengine/20260618051539.15E201F000E9@smtp.kernel.org/
Assisted-by: Codex:gpt-5-5
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 739e47941d0c..0c9094b4c4ad 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -3512,6 +3512,7 @@ static int __init d40_probe(struct platform_device *pdev)
 	struct resource res_lcpa;
 	void *dmaenginem_reg_group;
 	int num_reserved_chans;
+	bool runtime_pm_enabled = false;
 	u32 val;
 	int ret;
 
@@ -3633,6 +3634,7 @@ static int __init d40_probe(struct platform_device *pdev)
 	pm_runtime_mark_last_busy(base->dev);
 	pm_runtime_set_active(base->dev);
 	pm_runtime_enable(base->dev);
+	runtime_pm_enabled = true;
 
 	dma_set_max_seg_size(base->dev, STEDMA40_MAX_SEG_SIZE);
 
@@ -3678,7 +3680,8 @@ static int __init d40_probe(struct platform_device *pdev)
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

