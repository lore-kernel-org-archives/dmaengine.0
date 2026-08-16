Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270E11448E0
	for <dmaengine@vger.kernel.org>; Sun, 16 Aug 2026 05:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786859359; cv=none; b=VtKzELCVe7VjgncHAl0+RPeEgmOrwrTxKB7/V87CIyWnnx1jWuZQNdaitnm68G1ziJqJIicmA8XuryY0KP2GUhR+lC944KKgKzmSPKTpbWCEh4cah/6BtbKzNIR2miJJw2PIxMAYrSR6fEg9AuioAMExVREQenwZmgdkuecIZDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786859359; c=relaxed/simple;
	bh=2JGZN/bcZkgUT2cy6m3JA9clVX3O5g3+WE+aGb+GMjk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P+/92IoFZRHK2aE0saVWEk5jnu7MH0iCcXuZOjIjjVjZyTGPN6i1t0zmmz7alR5Q8k7zK2ax7DT/Dv00aPAafFdjDJ5jo1a38egTjKQTGhERxhxFjCtgVcmoju+ZtQ5ocnfm/Lxq0BfSrlmw21KBxifx7+fDCOajeMB29P6+Ino=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ObXJBOz1; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ObXJBOz1"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d01663d816so20326215ad.1
        for <dmaengine@vger.kernel.org>; Sat, 15 Aug 2026 22:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786859357; x=1787464157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EAc8h9QXMDqHRVrTd33Qb8q+njfWz9973Xm3PD36pg8=;
        b=ObXJBOz1rKNTauNYKhCWSfz/SGyhPlvu4kSSEoBfkgfbSVxf4/0ni9OrT2U5O54qRO
         LZX9olHQUxtmr8ZqPSxIeBBou6au62vyB8IHHSyadt/uQAEBzlHjivzMclPuZkFpyZYV
         k6E20hFGW29P6LgTcryyCWa+RdViaCwB/ZtXp9iI+2cs9nYxdVZP3FYVWRj3F/z9fLVU
         uzj0WiAaXHk5HJmipplQ1UMrGHnUxRBaaEqWeFzQMjr4ULmsM+wnWaHOXy64ZvE/YB/y
         8Nk7mVcpVJNwKSHkL0Biw4ugthjYkIGSxcP5oC6fe9im7jQMP9BEdJ5t9/FxhpO/Zi3A
         jqMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786859357; x=1787464157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EAc8h9QXMDqHRVrTd33Qb8q+njfWz9973Xm3PD36pg8=;
        b=JTeQEMRc0S4u3h4WLIj/Q9+KU/PPccpv2usgHnK4SfMBMmCXMtFjfcVwWuXEAsiIdp
         dk7Zx2i4zFkf1pQ3f0smpMokf8enjCawILjeHsq0B61Y/IgbYPmtyR0MwRlLTgoGx7//
         m1R4T0FAefTSQ75RFPMmuB0ijLA2dh3UylHuaxEo068v6wFlFeg5VwPeqGFlZ/LJf/yk
         uj3aKmGpcVs9rliHgBN1fd64ePkgXenRVp3H0m6CdoWM0JAOWvMpUliokwEWxQEQ0+/M
         9rv0dDzeZa9vBNrm4y96Fxe+AFylMlR6NcnM6iOa7GRzs39RM9zL/QIYI0gb6+24CCS0
         Ghiw==
X-Forwarded-Encrypted: i=1; AHgh+Ro9VWsDnXP3A/K1vpN/aBLikDewvdnnnJ5A+NiGKFWAOEwqY0BwI6xlZeE4ipj6N//xQlCeQT7WWs8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGBZK/3TUbtfGi+iujQJeoSPn4TtCs/8DyMBisvqS89ovdzSif
	Rpawaf7jNylZY1jOrgxVrl3ctyZmPVElIpIRaNfx70nteiwvp+4TEfMt
X-Gm-Gg: AR+sD13ANkD5AHMLsveju2clc3gLz07KcBF4DOG0MplFrOJVhiTtaUxWrYavqc9rYXN
	AX6Kx+GZiuj5kk36MCYeyBhQz/AwUji0cAkkurnmCz9P2ijEzEiaVvFwj2JYr5YJ8vecIzQQgCa
	6wZ+mgF8rr/kn6hAzAffQE06bCiWzdcJtbGC5QpewLzZS/fCDCo5Od41pcLhoIWFOzf0zTwkXSr
	A/Hq418jrGsDAk+7GslqeB7t0fUmDjyD2umyNPbMsGEGIgRyJPPe/Ni5WUOuU7gdmz8uXs/EglD
	jA9J1sCC0EddbH5r6G81Ztgk85pD72yiFnCYp44xvKvaKHczoV+6VEU4m4txF4CM0CHIIqwDFbI
	sWNan/0Qa/TcqExkxt0SwYzPjy3ipHR7bC7hRDZj9hk4aFHXtnQ169c+MvNKP0vNCJBbzhzS0m2
	Cug33WcCYf5KSuRLYtRoPq/Ucx6+xmClDbVhAfczITTVHWxt/sdUMdMGywfKnSbF+NUGLyHISg3
	VOLmqEcyluY
X-Received: by 2002:a17:90b:264c:b0:38d:ddc2:7ccb with SMTP id 98e67ed59e1d1-3933b714f34mr17660377a91.1.1786859357310;
        Sat, 15 Aug 2026 22:49:17 -0700 (PDT)
Received: from amd.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1413889bca5sm37201058c88.12.2026.08.15.22.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 22:49:16 -0700 (PDT)
From: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
To: vkoul@kernel.org
Cc: Frank.Li@kernel.org,
	Frank.li@oss.nxp.com,
	Eugeniy.Paltsev@synopsys.com,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
Subject: [PATCH v2] dmaengine: dw-axi-dmac: convert clock handling to clk_bulk API
Date: Sun, 16 Aug 2026 05:48:58 +0000
Message-ID: <20260816054858.2667380-1-nagachaithanya9911@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <an3y4lS-ZE4CdJ7R@SMW015318>
References: <an3y4lS-ZE4CdJ7R@SMW015318>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver managed its two mandatory clocks (core-clk and cfgr-clk)
individually. This was error prone: axi_dma_resume() enabled cfgr_clk
and then core_clk, and if enabling core_clk failed it returned the
error without disabling cfgr_clk, leaving the clock refcount
unbalanced.

Convert the driver to the clk_bulk API. The two clocks are always
acquired, enabled and disabled together, so a clk_bulk_data array
expresses this naturally and shrinks the get/enable/disable paths.
clk_bulk_prepare_enable() also unwinds any clock it already enabled
when a later one fails, which fixes the resume imbalance.

Fixes: 1fe20f1b8454 ("dmaengine: Introduce DW AXI DMAC driver")
Signed-off-by: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
---
Changes since v1:
- Convert the driver to the clk_bulk API instead of manually disabling
  cfgr_clk on the error path, as suggested by Frank Li.
- v1: https://lore.kernel.org/all/20260813105432.2577322-1-nagachaithanya9911@gmail.com/

 .../dma/dw-axi-dmac/dw-axi-dmac-platform.c    | 28 ++++++++-----------
 drivers/dma/dw-axi-dmac/dw-axi-dmac.h         |  3 +-
 2 files changed, 13 insertions(+), 18 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index bcefaff03b5c..254167a558ff 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -1320,8 +1320,7 @@ static int axi_dma_suspend(struct axi_dma_chip *chip)
 	axi_dma_irq_disable(chip);
 	axi_dma_disable(chip);
 
-	clk_disable_unprepare(chip->core_clk);
-	clk_disable_unprepare(chip->cfgr_clk);
+	clk_bulk_disable_unprepare(ARRAY_SIZE(chip->clks), chip->clks);
 
 	return 0;
 }
@@ -1330,11 +1329,7 @@ static int axi_dma_resume(struct axi_dma_chip *chip)
 {
 	int ret;
 
-	ret = clk_prepare_enable(chip->cfgr_clk);
-	if (ret < 0)
-		return ret;
-
-	ret = clk_prepare_enable(chip->core_clk);
+	ret = clk_bulk_prepare_enable(ARRAY_SIZE(chip->clks), chip->clks);
 	if (ret < 0)
 		return ret;
 
@@ -1524,13 +1519,11 @@ static int dw_probe(struct platform_device *pdev)
 
 	chip->dw->hdata->use_cfg2 = !!(flags & AXI_DMA_FLAG_USE_CFG2);
 
-	chip->core_clk = devm_clk_get(chip->dev, "core-clk");
-	if (IS_ERR(chip->core_clk))
-		return PTR_ERR(chip->core_clk);
-
-	chip->cfgr_clk = devm_clk_get(chip->dev, "cfgr-clk");
-	if (IS_ERR(chip->cfgr_clk))
-		return PTR_ERR(chip->cfgr_clk);
+	chip->clks[0].id = "core-clk";
+	chip->clks[1].id = "cfgr-clk";
+	ret = devm_clk_bulk_get(chip->dev, ARRAY_SIZE(chip->clks), chip->clks);
+	if (ret)
+		return dev_err_probe(chip->dev, ret, "failed to get clocks\n");
 
 	ret = parse_device_properties(chip);
 	if (ret)
@@ -1640,10 +1633,13 @@ static void dw_remove(struct platform_device *pdev)
 	struct dw_axi_dma *dw = chip->dw;
 	struct axi_dma_chan *chan, *_chan;
 	u32 i;
+	int ret;
 
 	/* Enable clk before accessing to registers */
-	clk_prepare_enable(chip->cfgr_clk);
-	clk_prepare_enable(chip->core_clk);
+	ret = clk_bulk_prepare_enable(ARRAY_SIZE(chip->clks), chip->clks);
+	if (ret)
+		dev_warn(chip->dev, "failed to enable clocks before remove: %d\n",
+			 ret);
 	axi_dma_irq_disable(chip);
 	for (i = 0; i < dw->hdata->nr_channels; i++) {
 		axi_chan_disable(&chip->dw->chan[i]);
diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
index 67cc199e24d1..039316c42f05 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
@@ -69,8 +69,7 @@ struct axi_dma_chip {
 	int			irq[DMAC_MAX_CHANNELS];
 	void __iomem		*regs;
 	void __iomem		*apb_regs;
-	struct clk		*core_clk;
-	struct clk		*cfgr_clk;
+	struct clk_bulk_data	clks[2];
 	struct dw_axi_dma	*dw;
 };
 
-- 
2.43.0

