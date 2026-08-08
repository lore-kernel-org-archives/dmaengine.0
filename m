Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D61623E325
	for <dmaengine@vger.kernel.org>; Sat,  8 Aug 2026 11:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786188365; cv=none; b=MjbjEXRd1sp1H003erb7upjvedawm/w/oxuKxzw6eTG20NixZTTErNuW9Nr/R1xgC/AnzPzr9+o+3bJunJ/qbBRic4kaBtPtY4BLQJw9KDmh/gjr+W/Jwkq3ZZJOuX6hV876cfnBzVGWzUKoO7EfcQQggJyGHXu4D9gv1AK/gc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786188365; c=relaxed/simple;
	bh=79eIeLy6BGI+fBiKuSwA2DDf6rq8Fp/Sbknof2xZaCs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NzivTbo6I6j8BbYz27IiSGAwwEBhzHESmy8NqCfceDbQgR9r8IdAhuzpwXyQ5G1yObe06LexCh9WT3hAWWRdB6DCJK7ijZ3t6K/uGZpmY0Ww2/IxuLXugfgopjYHcHNLJzIDYzq8CiDj/QVrj5GGi5kDy6F1G5jt2as3ldR/yR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NhRmPf1o; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NhRmPf1o"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38fdeaed181so445552a91.1
        for <dmaengine@vger.kernel.org>; Sat, 08 Aug 2026 04:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786188363; x=1786793163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BtuOINh8YkDKYuvWIfvZnBXqzDMcNfimlyPxz7Xqg8g=;
        b=NhRmPf1ooNhtD8AfKCgf5GHogVhYqIiEEBRqK3l9qxvopheTpDhbE34jNuuPgz2TIN
         lRRvX4OOhP8wRUbN71lRCP4fQiYod42+QAXaDOt3EDCJzbBFPpMUdjjKvaz0zD4F5yP+
         Qjlsz+oJxufHt0W8EsWs3J0DtyL6G3M9gpwXgBPBl9F8Y2rru68Yrqq0/vFuUU462nmG
         7TlkDBsRYn69p77o9hDhpDHlCkeFN6mwOruoik2OkgC/EKB+fP/krI+vzNpJJbeyWPlM
         hyftV8N32KNCGYq46E98FlBhPSEu81UUgTsstj4aBDzdeB1w4VS+Ie3xAhw9T3Dmi7Aj
         xC1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786188363; x=1786793163;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BtuOINh8YkDKYuvWIfvZnBXqzDMcNfimlyPxz7Xqg8g=;
        b=sXR+mnBP18NdJYmosBDJkMj8x+vOLzx+O6LznxD0v3HJxNCllNNIpDkmuGI90/5FP7
         IH5LHiJ7LTDrgX7laCBz4XknEPnzRlesQocnJ0MHP0ViSYrDK6kNpmKVYydh8BcD52kg
         dTxFyA3Ec621Iblhcgyz36d9+L6xYI7jQH2h19ViGe6Bl1SIaVJCf3yh01cQFJjQZCYm
         +bm615MG/gxqBS5yByiHCdpEMo57YovQw7/gTNNpFAA0ixonIfdrAe2GMRHxb/ftcAbo
         4rFiKuJRDsmvCr5KLhj+YjWsrtM3Q11Ntmh+cHBRAs9m/mm+Qrrgls+tmkdwSEpVtZAU
         O4nw==
X-Forwarded-Encrypted: i=1; AHgh+RqqFK7qv6GLPoNtrgOmoPfRJb47SRq7z7BfVl3mh8aZAyRClsJkgednV/44ggsW8Y1y7vNcqyyyPbM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGVZzY56gDYPmnppH1WNS+ava0BUUYEnEv22L6jDrXOhyVPhn0
	ZUS/PBzTNiiyONijHTTryVpKYhQDrpVZsQWTs0m7oyRHoYIMLqe3gboL
X-Gm-Gg: AR+sD11/HDOAa8Vdu/u+ImfTSEMzc73hp6EmoJQKLOdsyMKXJphmDImKFvO2VMeh0QA
	NZe1t+xX0qAZzmqp+o3ckhq1/50ksqnvPHj3VFzSevoHHmr/ik5EUyMyUNMS2eRUZmQD0LhqfJ0
	M/ibOqa+iMktcHZoJgiagmpc3jDZPKuvpVejsNmYwFEzB7wdYJv49UE36ZbGdF2mYduuRhGkkIt
	Hvw1fk4wWgpHBueaXWgBX44tXazx49V4qYvCFIcrQqOGC/5rvdGIV4EtMXuNuyHt91HcUwsvkJ4
	BOviHg/Mi6g9wwN4l9QngaWB438uDHoqOyrZGE7utM/yBQ7yKiBc+NRFgj1lLSwf2OL/Ie/S4GJ
	EglmJBndhptb2Y3BvfyIRrv4on7wh5fpW5DCKDaXXaD206btgce5L/T+Sp4uXdq0LoPF4qqCeT6
	m2cwIHE1MvWlvdqp7NqHkib12+8z3+FwfHOLYzjpwKa1ZXIx1fhoI=
X-Received: by 2002:a17:90b:1e53:b0:381:a766:efcb with SMTP id 98e67ed59e1d1-3903c54cf2bmr27833795a91.4.1786188363482;
        Sat, 08 Aug 2026 04:26:03 -0700 (PDT)
Received: from lgs.. ([101.36.107.181])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085dbf82csm8235726a91.1.2026.08.08.04.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 04:26:03 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Sinan Kaya <okaya@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] dmaengine: qcom: hidma: fix autosuspend cleanup during teardown
Date: Sat,  8 Aug 2026 19:25:51 +0800
Message-ID: <20260808112551.2786782-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hidma_probe() calls pm_runtime_use_autosuspend(), but neither the probe
failure path nor hidma_remove() calls the matching
pm_runtime_dont_use_autosuspend() before disabling runtime PM.

If the autosuspend delay is set to a negative value while autosuspend
is enabled, the runtime PM core increments usage_count to prevent
runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
during teardown, this reference is not dropped and usage_count remains
unbalanced.

Add the missing pm_runtime_dont_use_autosuspend() calls to both the
probe failure and remove paths before disabling runtime PM.

This issue was found by manual code inspection.

Fixes: 67a2003e0607 ("dmaengine: add Qualcomm Technologies HIDMA channel driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/dma/qcom/hidma.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/dma/qcom/hidma.c b/drivers/dma/qcom/hidma.c
index c939635be21d..78fd765c81e4 100644
--- a/drivers/dma/qcom/hidma.c
+++ b/drivers/dma/qcom/hidma.c
@@ -893,6 +893,7 @@ static int hidma_probe(struct platform_device *pdev)
 		hidma_free(dmadev);
 bailout:
 	pm_runtime_put_sync(&pdev->dev);
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	return rc;
 }
@@ -930,6 +931,7 @@ static void hidma_remove(struct platform_device *pdev)
 
 	dev_info(&pdev->dev, "HI-DMA engine removed\n");
 	pm_runtime_put_sync_suspend(&pdev->dev);
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 }
 
-- 
2.43.0

