Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3F327A47F
	for <dmaengine@vger.kernel.org>; Wed, 19 Aug 2026 05:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787117744; cv=none; b=RllZisx6wQMBAwO5YwE1FmRaNOiQLzSgoTrDiZtSeZU0JKmHcmNQp0UVzAcx7YR8qTE5+UxRN3Zdf2V2lE5FHtJ1DlpLNvgz0OvPK+aRgxJFHP6pSbS+UbMP1P9bukl0jmgDZdpZy7hl57ljjdkojaIP0+aH+F1wNzAE0ZRR3Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787117744; c=relaxed/simple;
	bh=HsF386GNZxn+eGSuaH/u4S7Mmj56BlY3Ur1yX8WFYmc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LjthshG/75xbcQfbm0CIfAvrzvloujTSSVzUlo3hZbbXzBFyZs41YN5O4Wg8oDm8Qqx/FqGwhjb2iPKQf9h5nvV8T+Vw5btChT9iyY/WHP2Szew5uoS9oXiIL2/vDXRBoQfZbkH9TqgzFSn5YLyPFQ8dmxdhXzinNIMTTVV+iQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UtzFEbwq; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UtzFEbwq"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc11a30a259so541769a12.3
        for <dmaengine@vger.kernel.org>; Tue, 18 Aug 2026 22:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787117742; x=1787722542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OGMPj0lHbXjViXj5ygZBe7t9B9PmCW+PrgJb7MfgHEI=;
        b=UtzFEbwqBdkOIKafVnDe+L72pPYbon4r/SVjyuWqma076BwDST39p6KvgeJKW5k52d
         5YshdSK1NI6GQ6fLqoTcof7aAvc0zvMGjwJlSpc2LUtxzypcxOmndxMhTXbYHr889R2C
         GXvcPjCbwtkpBu+mx04tDF1PnsR60ZaF+lmfBs/zGwUAe0dIyXtruAe8eQayfET6V0cQ
         akk1Y6MFc7G4FTdLYo9sUYvGUL9vfI1kSfdMEf7W0zqOxdUg8m7P/NpyFPYBhnP+gtlW
         RItwmuDbpCdffwdnoc22bqxalr/IyL1VS62rP00dMBsjEjcAnXcnhEMrrbkw6gIxCytS
         AxQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787117742; x=1787722542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OGMPj0lHbXjViXj5ygZBe7t9B9PmCW+PrgJb7MfgHEI=;
        b=Ag6Lo64YpKhunS8JEFG1C4iQgNoIkt9Zq3CZgE2WpHxsVM1OpMbJa3QlC4EBRU+OBh
         AJ449vqtyotsBrLehu4l+YGxy13anBW0NC/koGq7mYMzItG+njBHh7Pg4b3z8lB21hTS
         TtPN9uxFLN1ngweJxdVOtOELaR9ilhdUg+LZPwrfNoT8tXIFBXsRFNHeQXJcft6kZKgD
         YJJVXzny9fM8z/U3FGssQjmL9rVnD8egqkQzBTnRHi8jtzBxZyGH+xqmqc5ZcGOTEjIC
         DMBfoowDHGaxbUFBV7mxgUY2wT6Kx19xVSOH+wb6tvFdbH2g0ib7aHqi5ZCo0SZJ4ysL
         mHqQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq0F6fXMW3I5CINw9k+oV2T8USQdNfoIixj6IBcGSJIh0vyvpXq30ElLTBdRjn57auV2ExVoNecAVI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4QxvWFjTDRJ2edw4IrKHwn8Jzn1WJV7CQlipWWkxFuQXNo9JR
	nXdS8NwKynDZBrj1lk1VYoHU+Y86HBX9Gs4uHXyLmnd+3rxArYfde0xp
X-Gm-Gg: AR+sD129AQM8R/CJckAAOiWOngBK2garSXW1P7oivbFwI8NXEQ2750grkCmWa7pya+S
	33J5/7ujxiL/0ElrzX1Ir0Y+5naQH/QnfqR4uZODei0j3SW+l7jyeOdpuzK8mxAyXB0ogn/n7GO
	NiwS7UTRknu/R0ZFnYMRV3HoN1s1mTECr8fcycbyRdeemyqBmS2bEfOzfw3nt4L9pl4O9AxMxC1
	DCL/xuDYqSPjg2AdOD4GQ62OBDR82Fw7YEkxXcRKw7dlJRCMxv5tOu8sIcF8iltKNpfnELbQwrw
	pLGy/CnbaA72f0kjQ5reUvi84NnficlbJF7ossNQNqTmEit7MgGd+kuRhx5tO0obkEZ5tTDjSI7
	WrcNTmYv1DvQwfHfjOk2Vx3h6i9e18lJd8oTiL2X2GlVlRtFBNJG8D9/oUD1YXDHhwqltZDZl4S
	ygCMbyOfu+NuAY0lBenYh4qz9Y3LqwHQoaufCBzHMMzDNB/+g4j8S6Pmtxtf75gI+x566M3yz9e
	A==
X-Received: by 2002:a05:6a21:6b0f:b0:3c3:8c91:5da0 with SMTP id adf61e73a8af0-3cd012342ecmr4283636637.15.1787117741920;
        Tue, 18 Aug 2026 22:35:41 -0700 (PDT)
Received: from amd.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf175399sm4448208eec.26.2026.08.18.22.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 22:35:41 -0700 (PDT)
From: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
To: frank.li@oss.nxp.com
Cc: Frank.Li@kernel.org,
	vkoul@kernel.org,
	orsonzhai@gmail.com,
	baolin.wang@linux.alibaba.com,
	zhang.lyra@gmail.com,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
Subject: [PATCH v3] dmaengine: sprd: use clk_bulk API to fix clock imbalance
Date: Wed, 19 Aug 2026 05:35:18 +0000
Message-ID: <20260819053518.2825514-1-nagachaithanya9911@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aoMfW_TVbzkuGZeU@SMW015318>
References: <aoMfW_TVbzkuGZeU@SMW015318>
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
and simplifies the enable/disable paths. Both clocks are fetched with
devm_clk_bulk_get_optional(); the optional ashb_eb clock simply becomes
a NULL entry that the bulk helpers treat as a no-op, while the mandatory
enable clock is still checked explicitly.

Fixes: 9b3b8171f7f4 ("dmaengine: sprd: Add Spreadtrum DMA driver")
Signed-off-by: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
---
Changes since v2:
- Fetch both clocks with a single devm_clk_bulk_get_optional() call
  instead of separate devm_clk_get()/devm_clk_get_optional() calls, and
  keep an explicit check for the mandatory "enable" clock (Frank Li).

Changes since v1:
- Convert the enable/disable paths to the clk_bulk API instead of
  manually disabling sdev->clk on the ashb_clk failure path (Frank Li).

v2: https://lore.kernel.org/dmaengine/20260816055005.2667930-1-nagachaithanya9911@gmail.com/
v1: https://lore.kernel.org/dmaengine/20260813105354.2577040-1-nagachaithanya9911@gmail.com/

 drivers/dma/sprd-dma.c | 45 ++++++++++++------------------------------
 1 file changed, 13 insertions(+), 32 deletions(-)

diff --git a/drivers/dma/sprd-dma.c b/drivers/dma/sprd-dma.c
index 087fea3af2e4..749cabd984eb 100644
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
@@ -1140,16 +1120,17 @@ static int sprd_dma_probe(struct platform_device *pdev)
 	if (!sdev)
 		return -ENOMEM;
 
-	sdev->clk = devm_clk_get(&pdev->dev, "enable");
-	if (IS_ERR(sdev->clk)) {
-		dev_err(&pdev->dev, "get enable clock failed\n");
-		return PTR_ERR(sdev->clk);
-	}
+	/* The ashb_eb clock is optional and only present for AGCP DMA */
+	sdev->clks[0].id = "enable";
+	sdev->clks[1].id = "ashb_eb";
+	ret = devm_clk_bulk_get_optional(&pdev->dev, ARRAY_SIZE(sdev->clks),
+					 sdev->clks);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "get clocks failed\n");
 
-	/* ashb clock is optional for AGCP DMA */
-	sdev->ashb_clk = devm_clk_get(&pdev->dev, "ashb_eb");
-	if (IS_ERR(sdev->ashb_clk))
-		dev_warn(&pdev->dev, "no optional ashb eb clock\n");
+	if (!sdev->clks[0].clk)
+		return dev_err_probe(&pdev->dev, -ENOENT,
+				     "get enable clock failed\n");
 
 	/*
 	 * We have three DMA controllers: AP DMA, AON DMA and AGCP DMA. For AGCP
-- 
2.43.0

