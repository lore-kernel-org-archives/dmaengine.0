Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261CC24E4C6
	for <dmaengine@vger.kernel.org>; Sun, 16 Aug 2026 05:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786859417; cv=none; b=XtpAZGxbAGNUkvS0w5Rohv60pvYcBh6GaRYucdlTyD87jN72pZIG41eAMMOaMJFzDKAWErqnyHzHTeRNLYnGKd0Yir3UGlxcBrK72z6wbi9DUXA64VIIL84R6sSjaifs3CitcBNbm8w6BsVjAzH0ic0ZvHJPgLl3txD9OyEmE1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786859417; c=relaxed/simple;
	bh=i1aTlyXstn7XdymhqDtMrPhnqMRQ4GCTCwkWzEodu9g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iARhuiBgF9XUIufeiPHs7PyX4rtoxLNQGVKXqqEQH74EZF1OAHNJJUBV1t7xBNkrW3qN2AycjoRUbb3ZHb7VXU7oAd1LzJcihw5ULWSIxkjud7gvVkUoObAoI68lUY8qlVwpWns1CFSLW3mhvBICjoPRKYie43VRMW4Nf1K8/qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i5nTjSaP; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i5nTjSaP"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cb5b8572b70so2787073a12.2
        for <dmaengine@vger.kernel.org>; Sat, 15 Aug 2026 22:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786859415; x=1787464215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L7rDd1AXsbIweAe6SD2JszwD4pdpkYTmVyXxro3XLzc=;
        b=i5nTjSaPmHnd5AhcGb0tqBV9eJfQvcxHF4781zanD/wHtg4KrzedbbyFVp5tor4enk
         cTLzWdG8Z/am8AvyXOwyYctL6j2EL7crc4KCt4e1cwi6wsrRAVPTlGmIeBPa790hy3+3
         BdjhTQ+f6DSIAbPKulJnB66rhJTb3R2ArSbXUZpv9/XZw5pJ54A5xIim+eqRkKwyx3Wh
         O//SmsWrj8HEXJX4dRvzYZJBcw8zxNKzjtkAmmx6NAzoNCp+ID5yZcngEz+roNW6lWXP
         lNf5HCWbT5X/R3LtW59+uYz4G17CEaZj4UFrn7g+IhDqxAaDrW15wRQfgJ/6QX8vSCby
         YnwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786859415; x=1787464215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L7rDd1AXsbIweAe6SD2JszwD4pdpkYTmVyXxro3XLzc=;
        b=Mo4tU7CqPET/jvM41lB0IOEYDzXsge0MTwcV4ZqoDKZveCHinWeRY6PdWDm0xOhzk9
         SMqHm8139IBYmfcZNdowP+shpZLouH+vxw6RfrGti8EFQNxTJuY/2P+UyDG5m1zqxkRV
         /L2ROjrDHB/7oXa+UkMr8r+zNWTMryRkIXmoUkbiiNNhPaoZk94qmYZSHB/lfTsahnR+
         VwccwXg0n5xlW7mNVUsFKperp8q6isy0Iqg2X4DCfAgxyWm/e3hrRU9TC7QOWGoPHqV2
         BIsDSM6cPuyP86SpvIu5l8UbKmYfJNKjSA59E5Yn6CAIhdRNppRNhpYpsueVKkFSTv9r
         jw8A==
X-Forwarded-Encrypted: i=1; AHgh+RpLbukBSEZqadJ1dFjUWqLKsR8rP+c+MU69j6nKcRXl/FYIbDTYYN1T775DpXwMH0C96uhUssKSoLI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGcJlDuOoghiNz/IrPKHfjKRHrFwb/zjj0YSjQDBxCFh+wGpx3
	HRi0yMFcN4Z1bPJXD5qLgEHFEWow+Fwsy50/Y8lHCQLIC+KPxbU4f7YR
X-Gm-Gg: AR+sD11e/VKiftSQuZFuyG8RoPGYCFgYb/wIKgoQgTix20DIggsYKozh/1DCsbd5mnj
	wZ/xXpZ4p+4GCVi7l09iG/xGlAB55rjjb41eCZvLDXKNFNhGrb1WSq32ejaEtQgg9smic/1X0n/
	xhgctkgh34SxZSY1cjLxU290rkN7Kp0/p8tvI1bYyUdbf5IqAlzaPKSCz+PqX6bqGuh9fiwEyLD
	DBjxqc+i9guB8Jt9JVZPnWMJWrw5WBxScb6k9qtaenJx3CO4FC0OMN3RMbFut1L+COMGpFeEspv
	Uhn+Ra82hU2qu8XHMA6E3DnsnJc9KOutdM4e4WC0opsiRRoMhSvVTy9oIpdicZPVwhKXIhLDtE2
	+w3J/UnQAQ81Jo+67S3e2dVY6PV8YTrl51b9bn3lW00lNr6+xTZGoFO+tTasFufVc3uPPRCKSkN
	ySDQ4e9Vwf9jlLJW67D4uTPzJ2L4hDuLIX5TWuxM71FgzW2VecCpVn0pwygYaJpb2jqDqJTnJv4
	w==
X-Received: by 2002:a05:6a21:600c:b0:3bf:d487:4b42 with SMTP id adf61e73a8af0-3cc71ed4adamr18824280637.35.1786859415348;
        Sat, 15 Aug 2026 22:50:15 -0700 (PDT)
Received: from amd.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d61e1cccsm19695412eec.8.2026.08.15.22.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 22:50:15 -0700 (PDT)
From: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
To: vkoul@kernel.org
Cc: Frank.Li@kernel.org,
	orsonzhai@gmail.com,
	baolin.wang@linux.alibaba.com,
	zhang.lyra@gmail.com,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nagachaithanya9911@gmail.com
Subject: [PATCH v2] dmaengine: sprd: use clk_bulk API to fix clock imbalance
Date: Sun, 16 Aug 2026 05:50:05 +0000
Message-ID: <20260816055005.2667930-1-nagachaithanya9911@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <an3zMHoaxx4XzvpK@SMW015318>
References: <an3zMHoaxx4XzvpK@SMW015318>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sprd_dma_enable() enabled sdev->clk and then the optional ashb_clk. If
enabling ashb_clk failed, sdev->clk was left enabled: both callers
(probe and resume) treat a non-zero return as "nothing was enabled" and
bail out, leaking sdev->clk.

Convert the driver to the clk_bulk API. clk_bulk_prepare_enable()
enables all clocks and unwinds them on failure, and
clk_bulk_disable_unprepare() disables them, which fixes the imbalance
and simplifies the enable/disable paths. The optional ashb_eb clock is
fetched with devm_clk_get_optional(), so a missing clock becomes a NULL
entry that the bulk helpers treat as a no-op.

Fixes: 9b3b8171f7f4 ("dmaengine: sprd: Add Spreadtrum DMA driver")
Signed-off-by: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
---
Changes since v1:
- Convert the enable/disable paths to the clk_bulk API instead of
  manually disabling sdev->clk on the ashb_clk failure path, and fetch
  the optional ashb_eb clock with devm_clk_get_optional() (Frank Li).

v1: https://lore.kernel.org/dmaengine/20260813105354.2577040-1-nagachaithanya9911@gmail.com/

 drivers/dma/sprd-dma.c | 44 +++++++++++++-----------------------------
 1 file changed, 13 insertions(+), 31 deletions(-)

diff --git a/drivers/dma/sprd-dma.c b/drivers/dma/sprd-dma.c
index 087fea3af2e4..ac6fe6118ad1 100644
--- a/drivers/dma/sprd-dma.c
+++ b/drivers/dma/sprd-dma.c
@@ -208,8 +208,7 @@ struct sprd_dma_chn {
 struct sprd_dma_dev {
 	struct dma_device	dma_dev;
 	void __iomem		*glb_base;
-	struct clk		*clk;
-	struct clk		*ashb_clk;
+	struct clk_bulk_data	clks[2];
 	int			irq;
 	u32			total_chns;
 	struct sprd_dma_chn	channels[] __counted_by(total_chns);
@@ -260,31 +259,12 @@ static void sprd_dma_chn_update(struct sprd_dma_chn *schan, u32 reg,
 
 static int sprd_dma_enable(struct sprd_dma_dev *sdev)
 {
-	int ret;
-
-	ret = clk_prepare_enable(sdev->clk);
-	if (ret)
-		return ret;
-
-	/*
-	 * The ashb_clk is optional and only for AGCP DMA controller, so we
-	 * need add one condition to check if the ashb_clk need enable.
-	 */
-	if (!IS_ERR(sdev->ashb_clk))
-		ret = clk_prepare_enable(sdev->ashb_clk);
-
-	return ret;
+	return clk_bulk_prepare_enable(ARRAY_SIZE(sdev->clks), sdev->clks);
 }
 
 static void sprd_dma_disable(struct sprd_dma_dev *sdev)
 {
-	clk_disable_unprepare(sdev->clk);
-
-	/*
-	 * Need to check if we need disable the optional ashb_clk for AGCP DMA.
-	 */
-	if (!IS_ERR(sdev->ashb_clk))
-		clk_disable_unprepare(sdev->ashb_clk);
+	clk_bulk_disable_unprepare(ARRAY_SIZE(sdev->clks), sdev->clks);
 }
 
 static void sprd_dma_set_uid(struct sprd_dma_chn *schan)
@@ -1140,16 +1120,18 @@ static int sprd_dma_probe(struct platform_device *pdev)
 	if (!sdev)
 		return -ENOMEM;
 
-	sdev->clk = devm_clk_get(&pdev->dev, "enable");
-	if (IS_ERR(sdev->clk)) {
-		dev_err(&pdev->dev, "get enable clock failed\n");
-		return PTR_ERR(sdev->clk);
-	}
+	sdev->clks[0].id = "enable";
+	sdev->clks[0].clk = devm_clk_get(&pdev->dev, "enable");
+	if (IS_ERR(sdev->clks[0].clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(sdev->clks[0].clk),
+				     "get enable clock failed\n");
 
 	/* ashb clock is optional for AGCP DMA */
-	sdev->ashb_clk = devm_clk_get(&pdev->dev, "ashb_eb");
-	if (IS_ERR(sdev->ashb_clk))
-		dev_warn(&pdev->dev, "no optional ashb eb clock\n");
+	sdev->clks[1].id = "ashb_eb";
+	sdev->clks[1].clk = devm_clk_get_optional(&pdev->dev, "ashb_eb");
+	if (IS_ERR(sdev->clks[1].clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(sdev->clks[1].clk),
+				     "get ashb_eb clock failed\n");
 
 	/*
 	 * We have three DMA controllers: AP DMA, AON DMA and AGCP DMA. For AGCP
-- 
2.43.0

