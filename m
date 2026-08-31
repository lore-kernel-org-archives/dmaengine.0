Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFDA3DF008
	for <dmaengine@vger.kernel.org>; Mon, 31 Aug 2026 09:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788169508; cv=none; b=oOy1bDK03Qj2YdqiSl5eqMUtFMgi8dRlRzHO76wR5dQ9GnJ+wVl1w02SkEK8OUImkn0sovd72TmtMug8B3oFMPMMJR+K4/YTMniD7DbTH2lDjnOHZpP/B4TykERNRHtLTNLmE+y/c4w+Xw3N9bhWMMbm12Df97Z6xmsaRcjoX5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788169508; c=relaxed/simple;
	bh=0OztTdsEtWWtcjbeTH9ExDlgp8mOpM1k22KpSXCVGGs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SO/Krr5bpLYinuRcP1PCY2Z90A9ckSSWex4p1RKT+9gns0M3BO7iHVlN9MAeEKnFK3qZIUsiBq3rUmX6Yj25P4djhetgNtZG/Fu3rCuaHf+OXW2FTuqdLr64YFeXMU2KEN4GBVdbkQ1CPaMR+BnzIe/4MfJMTpxL0Qv1SL70Ihw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ZpjAVhFA; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ZpjAVhFA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=8N
	g0utf1Re/GCP52ghs1rtbmMUJPLRwKDE1gsb+StVQ=; b=ZpjAVhFAnPUhdvLyq2
	E5DAvpf8eWhG4rDKy5CCt7PjQDpjjww8SWvK7WhxMm5fGGaL18SSS3MR6GvDd0Gn
	a3U5VcV11NtTOPSPW1jOw0XTKzAomXGlHjGUYOx3uOzyg8kqLSZAyhGOnW+/d7Y3
	xb6Tp4dOO8pu6Fy5twInYHu7E=
Received: from localhost.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgA33SgITZVqRY21PA--.24357S2;
	Mon, 31 Aug 2026 17:44:41 +0800 (CST)
From: "Li Youhong" <dayou5941@163.com>
To: Eugeniy.Paltsev@synopsys.com,
	vkoul@kernel.org
Cc: Frank.Li@kernel.org,
	dmaengine@vger.kernel.org,
	Li Youhong <liyouhong@kylinos.cn>
Subject: [PATCH] dmaengine: dw-axi-dmac: fix cfgr_clk leak when core_clk enable fails
Date: Mon, 31 Aug 2026 17:44:38 +0800
Message-Id: <20260831094438.2244538-1-dayou5941@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgA33SgITZVqRY21PA--.24357S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruF1rKFykZw1ktF1kArW3GFg_yoWDuwc_C3
	WUWrW3Xrn5Xrs5Kr45tF17ZrWj9r97ua1agr4Iyayay3y3Wr4DJr4kZrZ3AwnxA3yUKFZ8
	Ca1DXry7A3WfAjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8aXdUUUUUU==
X-CM-SenderInfo: 5gd103ivzuiqqrwthudrp/xtbC3glVBGqVTQkcMAAA3R

From: Li Youhong <liyouhong@kylinos.cn>

axi_dma_resume() enables cfgr_clk then core_clk. If enabling
core_clk fails, return without disabling cfgr_clk, leaking the
already-enabled clock. Disable cfgr_clk on that error path.

Fixes: 1fe20f1b8454 ("dmaengine: Introduce DW AXI DMAC driver")
Signed-off-by: Li Youhong <liyouhong@kylinos.cn>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index eebed2474210..6ccb3fcfa397 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -1335,8 +1335,10 @@ static int axi_dma_resume(struct axi_dma_chip *chip)
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
2.25.1

