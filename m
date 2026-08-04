Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DC046D0AC
	for <dmaengine@vger.kernel.org>; Tue,  4 Aug 2026 15:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785857984; cv=none; b=AiRdntzSb+EUynNWSo1rQgeOCNGsjnzyJnJFcf7mKBKcYxi4u7fwVaqZBP5kYsjI4PMNITYQaWW/qMZMYh0zBUrLCtC4O/JmE1POAwj2ZskylZu+t4qxGNySJaOywOBQvnyejwtzYg2DaJsO9/mnE6nx9fOaAi8PsfvRigDm2nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785857984; c=relaxed/simple;
	bh=GOzRzWbEhVp1+PxLWp0Tf6FKj+pa/ze+t4q/T24vfNw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b7xg9r5RGyxp7lsUhLnYmB3bK9kkXQkHLOsoHTItSNMOxcjxMHd4e4nhx+vrmyyNEnBuO1ODx8Fhm6m27gHBaNXFcl3vQKLAb80A/fC2OvjGFaZAlu44e2gnUDLHVm+GtaIxQBU2Y4iezn8WgG5J9diO3X/IP5d3osnsAoyVvXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ls1c+aFm; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ls1c+aFm"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8485ef63b68so5312596b3a.1
        for <dmaengine@vger.kernel.org>; Tue, 04 Aug 2026 08:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785857977; x=1786462777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GE0WgxrhQlszpq0bFS8ekUeWF2E3M+uVciQ9zYtpewc=;
        b=ls1c+aFmjSv4+Bmm4ou80M7J54CPqUNwumNM9rNXuZMIxTT0wTjJ+60OA+l6Jvsl6c
         FXmzZ4vHq7ah63yhExQZfXvxu3WWdN+Q/l653UX1oVqGWRqQegYSz/uwLEY59qoOTRKn
         DvJRmcQB6OwJ0eSNr3eWkuHsfMZTMaiDkCaObMSvbSED4oIJ9v4Soc5nEpk14XZ1/Wqi
         OsDwiMJtCN0dauFFSKB9qUo9BZEVcPJAMkCs7IhT/RfRD8iB8QeejMtxUegM3SWoSO0N
         rEtyvZHZcyzrH/iRgwSC18jQLSR/YNI12FFZUi8MLjXf73ojUzpSNrfDATJ/u3gEvDdN
         puSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785857977; x=1786462777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GE0WgxrhQlszpq0bFS8ekUeWF2E3M+uVciQ9zYtpewc=;
        b=sj+ZAYBfa9vTPjN0ZaxSYtjKlRAUiEkskB926/Y21JSiLhOAp2fmzaIdW4jm1C60Gy
         LaCptrYQzhkCky35YsaNo8drN45Us4LrCDtW1jPq7W3xRh3D6TW574uhByzwQyjG/jul
         /eDUltrjUdn0j91l1lG+bMQKf3Mx0yU+0H5QQvQUkGT/xseyVbCFTaIILCDBC6GVxwnJ
         Ce72Q2+rlD8X9q6Knx0YH6c7J7T9XzwDi3aEzAVfi7ubMOJv5pFewLDUsQ1n+571SYMv
         QUHmqjvKO7ICK+Ogh6iGo9RJTAHiUj5pNpZD8oXqTMLBKgQASdnizJFtkjv/BKyHo/pb
         HHjw==
X-Gm-Message-State: AOJu0Yxkt34XT02TU9wQYLakjWpJES27DTtqGe7axlw8XbPrlNMMSr9H
	5PeWAAOG+p0zjoI+DCdBjftfzZGt4GtmrifraqwbEo7fuCL+zp36ZKA=
X-Gm-Gg: AR+sD13oV5A6qExKHZfC1ssAf8H7KxclGCUQ1+L1V8bviyNjI0kBSJzaEpvclC8Dftp
	qASxMthHxegPO8C/yTrBkYQboKm7HbojX0ltp4y85lyZJX5FYuaTUtsKLMdHwiOQwp6lDPKi4Li
	el2VHhVytEHw0bn4zHSzmmUGxOjw7WALECjWmJnQFz60jPhpUamVOXwk6H/d61cT22Y46AsG5Cz
	CnKclOD2QCDbMMMOesZiSXP2wZUfugkDSjT8LlwmeVz18yypNyhXCcTfDJ7a7OvSbl8hvRp7war
	I7tkuR8Awm+fPMWkLAfWaM4XrG037Z3Q/hu5Me5MEVwt9ekGtE4rJfqnxuCKJfTZaaqxndQlDyQ
	iTUVNWYVgJ53Z+mfTFtRCXjJHUgP+VW8yOSTv5ag6YuUFkxxdFnY15QsGyhlyrEprJCAES+2g3c
	mUh3oqlSqAuxeD/4qr/HJSEVkwcnuWrLHYY+lbXvrSeMt2cXWK0VxpCv29l5ONPsA39RE+0olV9
	JZx4YCeosIx8apvkSNyMk2jSCkgUOTzRf1zLpIT1JNuan8H2fI4Y5DWm+Nl6sHZ6iY8HPBAlaU4
	+6i6pXbCbbNgK6lcXea1t2g=
X-Received: by 2002:a05:6a00:3cd1:b0:847:98ff:4af5 with SMTP id d2e1a72fcca58-84ee47d5328mr14103507b3a.26.1785857976549;
        Tue, 04 Aug 2026 08:39:36 -0700 (PDT)
Received: from localhost.localdomain ([1.226.165.54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edbd31639sm5581184b3a.9.2026.08.04.08.39.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 04 Aug 2026 08:39:35 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Sean Wang <sean.wang@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Myeonghun Pak <mhun512@gmail.com>,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v2 RESEND] dmaengine: mediatek: hsdma: fix runtime PM leak on init failure
Date: Wed,  5 Aug 2026 00:39:24 +0900
Message-ID: <20260804153924.49627-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <aj1RSj5ZXvc-9yu7@lizhi-Precision-Tower-5810>
References: <aj1RSj5ZXvc-9yu7@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mtk_hsdma_hw_init() enables runtime PM and gets a runtime PM reference
before enabling the HSDMA clock. It currently ignores failures from
pm_runtime_get_sync(); if runtime resume fails, the usage count remains
held. If clk_prepare_enable() then fails, the usage count remains held.

Use devm_pm_runtime_enable() to manage runtime PM enablement, and use
pm_runtime_resume_and_get() so resume failures do not leak the usage count.
If clk_prepare_enable() fails after a successful runtime resume, drop the
runtime PM reference before returning.

The probe path also ignores the return value from mtk_hsdma_hw_init(), so a
failed hardware init can continue as a successful probe. Propagate
mtk_hsdma_hw_init() failures from probe, while keeping a separate unwind
label so mtk_hsdma_hw_deinit() is only called after hardware init succeeds.

Fixes: 548c4597e984 ("dmaengine: mediatek: Add MediaTek High-Speed DMA controller for MT7622 and MT7623 SoC")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

---
Changes in v2:
- Use devm_pm_runtime_enable() for runtime PM enablement.
- Drop manual pm_runtime_disable() calls from init/deinit paths.

 drivers/dma/mediatek/mtk-hsdma.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/mediatek/mtk-hsdma.c b/drivers/dma/mediatek/mtk-hsdma.c
index a43412ff5e..27cb370106 100644
--- a/drivers/dma/mediatek/mtk-hsdma.c
+++ b/drivers/dma/mediatek/mtk-hsdma.c
@@ -848,17 +848,27 @@ static int mtk_hsdma_hw_init(struct mtk_hsdma_device *hsdma)
 {
 	int err;
 
-	pm_runtime_enable(hsdma2dev(hsdma));
-	pm_runtime_get_sync(hsdma2dev(hsdma));
+	err = devm_pm_runtime_enable(hsdma2dev(hsdma));
+	if (err)
+		return err;
+
+	err = pm_runtime_resume_and_get(hsdma2dev(hsdma));
+	if (err < 0)
+		return err;
 
 	err = clk_prepare_enable(hsdma->clk);
 	if (err)
-		return err;
+		goto err_put_pm;
 
 	mtk_dma_write(hsdma, MTK_HSDMA_INT_ENABLE, 0);
 	mtk_dma_write(hsdma, MTK_HSDMA_GLO, MTK_HSDMA_GLO_DEFAULT);
 
 	return 0;
+
+err_put_pm:
+	pm_runtime_put_sync(hsdma2dev(hsdma));
+
+	return err;
 }
 
 static int mtk_hsdma_hw_deinit(struct mtk_hsdma_device *hsdma)
@@ -868,7 +878,6 @@ static int mtk_hsdma_hw_deinit(struct mtk_hsdma_device *hsdma)
 	clk_disable_unprepare(hsdma->clk);
 
 	pm_runtime_put_sync(hsdma2dev(hsdma));
-	pm_runtime_disable(hsdma2dev(hsdma));
 
 	return 0;
 }
@@ -983,7 +992,9 @@ static int mtk_hsdma_probe(struct platform_device *pdev)
 		goto err_unregister;
 	}
 
-	mtk_hsdma_hw_init(hsdma);
+	err = mtk_hsdma_hw_init(hsdma);
+	if (err)
+		goto err_free;
 
 	err = devm_request_irq(&pdev->dev, hsdma->irq,
 			       mtk_hsdma_irq, 0,
@@ -991,7 +1002,7 @@ static int mtk_hsdma_probe(struct platform_device *pdev)
 	if (err) {
 		dev_err(&pdev->dev,
 			"request_irq failed with err %d\n", err);
-		goto err_free;
+		goto err_deinit;
 	}
 
 	platform_set_drvdata(pdev, hsdma);
@@ -1000,8 +1011,9 @@ static int mtk_hsdma_probe(struct platform_device *pdev)
 
 	return 0;
 
-err_free:
+err_deinit:
 	mtk_hsdma_hw_deinit(hsdma);
+err_free:
 	of_dma_controller_free(pdev->dev.of_node);
 err_unregister:
 	dma_async_device_unregister(dd);
-- 
2.47.1
