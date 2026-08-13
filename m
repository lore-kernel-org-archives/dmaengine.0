Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5772448BD2B
	for <dmaengine@vger.kernel.org>; Thu, 13 Aug 2026 15:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786635118; cv=none; b=W6iaCxKjSdGCvTYssawcS4Y7iduwCbn9t5Ovh1/m+sRB8QQl8vLhglIRxpinGesQB3aROLT5IUw5xeMtLg9C9aoBIA3mQBil5+ITYEFzzxgA/6NcqhOrCsw1nQW6irHdzdNOHFQ7YAlBGcETKmkL8643FEyS20RfNqx53ngAV9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786635118; c=relaxed/simple;
	bh=uwjEgmG3Mz4miCS0i07ALdjGmAM8jU1gtnrd0zTRvTs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b4cfHVaANaP6bf6lCJZgDs1ih5HBUfNvXsGtojkO0gODyuq16mTa9q3YW5F9RnlBg6rc2l3ZokAIuzHKK3r62pk5zwKY1/V6rhL+MhV1WBMqbvS9wyZ3/GBI3Ge3uWIRoc4BLhkBd6Ow5CR7hS0bguBeNgsptx5lYGSOR8AuqgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PUdmGrEk; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PUdmGrEk"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cedda2ce6fso518065ad.1
        for <dmaengine@vger.kernel.org>; Thu, 13 Aug 2026 08:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786635115; x=1787239915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CETj+p+UlhsMV5+bA2H7EPmo/n9prPFe/iRhtcp6S0Q=;
        b=PUdmGrEkTKFzqEpEBhZTc27IQXS8rXJlHojLQrzO3BU767qUz2uzshqbOAuAIDmIXc
         7S6BNgxVUE5mGkxtdLnXi/Jg0c9igHRSDCl6ks4t8sJvs9RVssyBEpY3XlMQXULujG3s
         kBqLTfpTV26Qx+tC36t7lVp5MzG8el98LSDFeVejhavvhjamWB23LNhoH5kjIsSMrQ8d
         Tqf8bGIvBD3y6G7uJ2wOarDrdOBFFpmiwEQ7eYLXFT7oTitsMdNduPBSSWqWudKHu89O
         o6iKeb1MrOiCfOLWncxCFrxLXhIiRQ36XR2D5i7Gi8IjxSGS1TTZUEguzlN7BCap2F+G
         S4NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786635115; x=1787239915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CETj+p+UlhsMV5+bA2H7EPmo/n9prPFe/iRhtcp6S0Q=;
        b=D2xjvTXJkTXO8T5dXqQosYhfJDXAthoFQMMbYME26QPiAK53zJIn1h/zjK3RjBfbXF
         C0L4tWQKVrq0HJ67xA5gVXopgVxRMoJv9YxFUpJa5zIE6seJp+dVSqf1jreYgmg4t76a
         7M0vSx2dqUTEzsBHwoPHwcTliUNdkbTiIQypPjG5+lFcIB1Vbeqgn+vcAEmwbUW8Mtzw
         /6v/5puAgWeGSpCvNMPO5efCld9xxCRmCpe+y4HCAZhs6iwW2+SBCX8xTp4uRw6aX01+
         vRh48HmLmMYqq5bMWRL+VgXJC3nBF5/ayWgI2IaUH5bZMkrCWIswrYBzaZngRXSlNJW8
         mIGQ==
X-Gm-Message-State: AOJu0YwfLEObFMGWB/H1XBpcsEsg/pZJigB2K8bWyeU09FnS20fyygRx
	prmarRWDYiqVn/UvjbP1dJEWK0fQWyH8K76FwvqywVowGCGZzpeINo9WF4iTggyZfoI=
X-Gm-Gg: AR+sD114KtT4RSMfnqhYsErggloNlL8PtNM8PJQ6nUjGfsrcCD9q+q+JFN8fPBHA/84
	XlbXLt7HbaXTS8iz/a2vQMusFkxOp/kjdndrnTWIjaMkg7vb6f7QbNisRMphBqP1I6ZMKNNMHev
	EAlbqUXd540nTaxfKFOGx5Z7RTUWWhlQoY1b93KB1kB+Gh3NB2FcsEHBBWKOLQUIk89LsLUAMZn
	n1GMYQVHahGZp0dT2m7+9w9nlno3NnYJnoz59BK2M4quq3iDUwrVyEuzlOAZaSgw3CfNoGCEgqg
	OrFhPKMbjrKtvDWAcHKlyVXKWrNqIswXt5LldgVi6fET2UwhVWuitSjUTeHcl2JPsxufVU3SPPT
	z0ouHbv7MoJKuyQvlciOaTRVnuqTua4ByffCAJm97Z08/wuSVqG0MbWo0a0My6Wvfr+u+e2shUs
	6noxzlb/asTvATuOvRaLgOVwjwW0TRjhbXzRyDuyc0aWDzuY0388C3oxP78dvUjtjzVYf+Fzqg4
	HmhBZ4=
X-Received: by 2002:a17:903:19e3:b0:2cc:9179:32e with SMTP id d9443c01a7336-2d37d88d72bmr83848385ad.10.1786635115377;
        Thu, 13 Aug 2026 08:31:55 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:3b7:6da1:c188:d14f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d37c200029sm12037965ad.6.2026.08.13.08.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 08:31:54 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: dmaengine@vger.kernel.org
Cc: vkoul@kernel.org,
	Frank.Li@kernel.org,
	orsonzhai@gmail.com,
	baolin.wang@linux.alibaba.com,
	zhang.lyra@gmail.com,
	linux-kernel@vger.kernel.org,
	Ruoyu Wang <ruoyuw560@gmail.com>
Subject: [PATCH] dmaengine: sprd: Fix runtime PM reference leak in probe
Date: Thu, 13 Aug 2026 23:31:49 +0800
Message-ID: <20260813153149.3953497-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pm_runtime_get_sync() increments a device's usage counter even when it
fails. sprd_dma_probe() currently jumps directly to controller clock
cleanup on that error, bypassing both pm_runtime_put_noidle() and
pm_runtime_disable(). This can happen if the preceding unchecked
pm_runtime_set_active() fails and the following runtime-resume attempt
also returns an error.

Enter the existing runtime-PM unwind path instead. This drops the
reference without idling the partially initialized device, disables
runtime PM, and then releases the controller clocks. The success path
and propagated error code are unchanged.

This issue was found by a static analysis checker and confirmed by manual
source review.

Fixes: 9b3b8171f7f4 ("dmaengine: sprd: Add Spreadtrum DMA driver")
Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
 drivers/dma/sprd-dma.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/dma/sprd-dma.c b/drivers/dma/sprd-dma.c
index 087fea3af2e411..19b32a23c882de 100644
--- a/drivers/dma/sprd-dma.c
+++ b/drivers/dma/sprd-dma.c
@@ -1212,7 +1212,7 @@ static int sprd_dma_probe(struct platform_device *pdev)
 
 	ret = pm_runtime_get_sync(&pdev->dev);
 	if (ret < 0)
-		goto err_rpm;
+		goto err_register;
 
 	ret = dma_async_device_register(&sdev->dma_dev);
 	if (ret < 0) {
@@ -1234,7 +1234,6 @@ static int sprd_dma_probe(struct platform_device *pdev)
 err_register:
 	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
-err_rpm:
 	sprd_dma_disable(sdev);
 	return ret;
 }
-- 
2.51.0

