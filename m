Received: from mail-m4920.qiye.163.com (mail-m4920.qiye.163.com [45.254.49.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BAD27A46E;
	Fri, 10 Oct 2025 07:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760083189; cv=none; b=ELcgNScY/Rx71GVA7ejevlFiTIzi7UePla30/xZv9HeB+kul0J5GgNEdLA+fY6a9CJzcetODdrWVAXMx44+MWXeJ4F2hsnRYWtO2Q4rqlkn8ppeyhhgYhEEkyMZyRYqGBgkqtf2zOHZbjy4BtTnvpyEJ4G2pvHvtflC9sRXPpKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760083189; c=relaxed/simple;
	bh=MN+Yppi2MH3IyKntEzmv4Swty8t0gZaFEGtWKwbjoV0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CuzM2twzX3AHzSoQ0H2mWwlbrELijrWYrvFtzLNF7HO0TJ6JFHj6gfWiUPSm0foNO6n/INlrsAGka1tjELKWqPQPP30hptMOaOj/oXAW1Z8jd7DtfDmNwcUfXHj82c49ppbyDB8tsVVxc0sZ8AWJAAvOR1eyyzDxZ6WmKabXBoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn; spf=pass smtp.mailfrom=easystack.cn; arc=none smtp.client-ip=45.254.49.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=easystack.cn
Received: from localhost.localdomain (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1153be9f4;
	Fri, 10 Oct 2025 15:54:23 +0800 (GMT+08:00)
From: Zhen Ni <zhen.ni@easystack.cn>
To: Eugeniy.Paltsev@synopsys.com,
	vkoul@kernel.org
Cc: dmaengine@vger.kernel.org,
	Zhen Ni <zhen.ni@easystack.cn>,
	stable@vger.kernel.org
Subject: [PATCH] dma: dw-axi-dmac: Release the clock resources
Date: Fri, 10 Oct 2025 15:54:14 +0800
Message-Id: <20251010075414.204804-1-zhen.ni@easystack.cn>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a99cd1d25120229kunm9668a1e69c4806
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWS1ZQUlXWQ8JGhUIEh9ZQVkaGRhNVh0YTU1JGh0ZGBhCHVYVFAkWGhdVGRETFh
	oSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+

In axi_dma_resume(), if clk_prepare_enable(chip->core_clk) fails,
chip->cfgr_clk remains enabled and is not disabled. This could lead
to resource leaks and inconsistent state during error handling.

Ensure that cfgr_clk is properly disabled.

Fixes: 1fe20f1b8454 ("dmaengine: Introduce DW AXI DMAC driver")
Cc: stable@vger.kernel.org
Signed-off-by: Zhen Ni <zhen.ni@easystack.cn>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index b23536645ff7..ab70dbe54f46 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -1334,8 +1334,10 @@ static int axi_dma_resume(struct axi_dma_chip *chip)
 		return ret;
 
 	ret = clk_prepare_enable(chip->core_clk);
-	if (ret < 0)
+	if (ret < 0) {
+		clk_disable_unprepare(chip->cfgr_clk);
 		return ret;
+	}
 
 	axi_dma_enable(chip);
 	axi_dma_irq_enable(chip);
-- 
2.20.1

