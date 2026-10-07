Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893204A262D
	for <dmaengine@vger.kernel.org>; Wed,  7 Oct 2026 12:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791376071; cv=none; b=Hszvni0b9Jb+Cv/HtUqIoEWtocNuNoj9RnAlv1YE/x4fWkraVrME8B7KBFfSzeA522O81s92N0Nehg4z+yHEy7NUtKSO8Yw/63JZ0ZLCcoA46uaGDXYUlBrsirGx+1foRJhWGL1thVzunHXGaPZ2Y4pGhMs1r6eQ3+jBe7usxNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791376071; c=relaxed/simple;
	bh=mrYDL8Jc5kHOxo/uk1bef7rw5P9jwUrrYQcpUUCM5R8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uIoghEuJYQDVhunnBQX8sgY1zJncQuri+yN3TRUlDgAZR0umIzoHE+y9N9B/4b/drP9gkTw/3Qw4yrii21hJHJc0zm6oWaIe5Q/d5RmGoyNDEW5gl771FdrGuaSm6CYoV5Kv6nIHpenQQ9Jt6W8WbEJGAHe0Ggb3munqVW3KYRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BP0pbMui; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BP0pbMui"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3964dfb5b9aso1950110a91.1
        for <dmaengine@vger.kernel.org>; Wed, 07 Oct 2026 05:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791376062; x=1791980862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BhdLoXtc9kkNzHYF4QrrqBcMnO9w0fLSquEWS/rnbxY=;
        b=BP0pbMui3jhElTXQYCUBTYnSKzfUDgvophxTlHJaVR8OoxUZmgv9iRGW65Z5YmaR8V
         CBitjewxxi9zRnXJ6vjMo6wlBleCVDJA4XBb8jiUyImVGj720iHtox3vYGufseei35xe
         S04u/TNrLygaad0S2y93/kMiTmdjr1BEnvf3WMG+gLSJfnd4rKXksmedeONwHDF4Ypsh
         6yCu1KKM8RuRwN09P2e1Rvmy2wDgXGEFkRopDR9QsYAdjjrI0k72w40aItEtNKfKgpnS
         8JQHYGXlcBDtaexYdjRvZACQhgDxbLMFN9rHmNDnIdqFuzQ061AOJRhn0DpURJEjAdzC
         q1Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791376062; x=1791980862;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BhdLoXtc9kkNzHYF4QrrqBcMnO9w0fLSquEWS/rnbxY=;
        b=FGeNvef9ImcpVuPGASdzjGr8HbsPgdcwOi3BotKtOYGJfRDGItt9imTl0V/Qgd52Ew
         qrVibktxx4f3bI94OJXLWnwaRKWa5kfGGuNk+fHrdnI/AMvqOtZptua0ooRGR1v2TBhf
         6nvbrxvd+LpSbl08crTCFGuQDXjDVD7l4rlW7wL241QKR2WOjPC30kpSmk8OaL5HAIX7
         d7IG2KyPHPdmGU65bBErr5nTsqiEj1HRYVYg7MJ9avaf37py/uWr4IxJs5wY2DShok31
         HKSkTWFkRxVi2QjcDXDn1WOo5iYx3xqPLZO2rx4n07Kt1LKLZ5rTKzWzmxGXRorBxk2/
         lztg==
X-Forwarded-Encrypted: i=1; AKwUvBwTVsWe8U+KmWgdb/qrama9PRHyXYT38I3k9ZViIWySOnF7A4UQKRHW+PfPXyRy3j4PlLf+Rn2u7Gk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKtubwUj7/SfB59Cd8TA/H9E6/TpUy7cuV8oR5d1u9k/qevFiAD
	B0p233bETv9IwHFeSWL7Rz5VSl7VisnPP7oy6jccFWhFfENfh+ejQrRO
X-Gm-Gg: AYBFou1xsqEcLL4WeaMpUgtG/jDMn7qcSasOoLSKi57OX1wh13xWew9uvlELZWB0P7w
	w9IIU1ZVhp+0qoNEfL6txU/fjZ+kXbJzrIbKm/gdQMTJO09jULZHe4A1C/6ERRCu1KH177gEFcY
	JFIYbg0DZnXVsSU0eI0YIL/NQwjMGBX4712UHDAR+03ttM/tivz9LnFo2GI1IyOkf7XW2TkhMMw
	7tVRD0xWiywa2/fz0wquXlfMNgXHGe2v2kO56vz3ULTkcIUvd4PoW4lobKqt07pkBUi7URW9ckQ
	m8zx3U2isY6grv6bbW9k+C9NWGOAfIcSt6YhIwS7zzpGMgU53SdZvyZWQRQvg726vHmYFypDkpT
	012gSH5MLE7u2TkE9LUnB8dUvu7g34aeN6YU8zk1XCo3vToLqolckW8MJLzOPB6geukoooLE+ow
	EhsgZXk5yPhNrzl5jrbZLs4b5PHhMporGZ2IdE3WZG7wkHEDD8etsH5ZM=
X-Received: by 2002:a17:90b:2884:b0:3a5:364:dfd with SMTP id 98e67ed59e1d1-3a8a0cd1a2dmr1992504a91.31.1791376061688;
        Wed, 07 Oct 2026 05:27:41 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::8534])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a88eff2146sm6384956a91.10.2026.10.07.05.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 05:27:41 -0700 (PDT)
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
Subject: [PATCH v3] dmaengine: qcom: hidma_mgmt: fix autosuspend cleanup on probe failure
Date: Wed,  7 Oct 2026 20:25:34 +0800
Message-ID: <20261007122534.194286-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hidma_mgmt_probe() calls pm_runtime_use_autosuspend() during probe, but
the probe failure path does not call the matching
pm_runtime_dont_use_autosuspend() before disabling runtime PM.

Add the missing pm_runtime_dont_use_autosuspend() call to the probe
failure path before pm_runtime_disable() so that the autosuspend
setting is properly undone during cleanup.

This issue was found by manual code inspection.

Fixes: 7f8f209fd6e0 ("dmaengine: add Qualcomm Technologies HIDMA management driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
v3:
  - Add the missing changelog.

v2:
  - Keep pm_runtime_enable() and explicitly add the missing
    pm_runtime_dont_use_autosuspend() call in the probe failure path
    instead of switching to devm_pm_runtime_enable().
  - Update the commit message to match the actual change.

 drivers/dma/qcom/hidma_mgmt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/qcom/hidma_mgmt.c b/drivers/dma/qcom/hidma_mgmt.c
index 4805ce390ffa..d8c56af5882d 100644
--- a/drivers/dma/qcom/hidma_mgmt.c
+++ b/drivers/dma/qcom/hidma_mgmt.c
@@ -310,6 +310,7 @@ static int hidma_mgmt_probe(struct platform_device *pdev)
 	return 0;
 out:
 	pm_runtime_put_sync_suspend(&pdev->dev);
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	return rc;
 }
-- 
2.43.0

