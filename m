Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45ECC3B6C1E
	for <dmaengine@vger.kernel.org>; Wed, 23 Sep 2026 04:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790136529; cv=none; b=VWYT45KCIaeMYJMDm385yYah0rInd2Pz0Y7T/vUwAxCt9DT9rGV+0v4yQCw0MrvHkxZQMA5eFgqf7S2bcdpbyScpAEMKCGW+XdSvP79NCCIFN6di+ZwpsnE+7W10r9Pr5JqHYwVEhmQNnh/dj9BwIifmH7sFDTLptYjx8WU3kcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790136529; c=relaxed/simple;
	bh=jZoiwH0lFIbReLNRSoawrg2rKZWe9gy7jXsrTDDxANQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nNTkTFw+6g/w33hF/dwAN6uSPaQ+QZhTpIUGGOGRiVKqymOdiiW91vyIBKQuAzQtM6+2cP7Ilw6e+S4rQ8gJ2zYV8eX+z4sP3rfDwBM8LXiq0588s0FX/4ntAeLmdRVhbp1IPf8Mb/uEEr4DZdDWTo5tFstXw8YgIi7BETxC3xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fUv49y04; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fUv49y04"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747f05ffcso2747275ad.0
        for <dmaengine@vger.kernel.org>; Tue, 22 Sep 2026 21:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790136527; x=1790741327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/Wkrz/pN1mgyckYdtPh64jlSjIcJzRl/WW6ypFtDgEU=;
        b=fUv49y04QKFbQ9wZBNIctWYfWYSSuzV9JRLyrj2/UP7Vmgl8vm510ytVoRR2HdZtfF
         LF6HJFt8vhaDIBKIb3VX7vKZ9JSsxyT6rC2I/LVELV6b0bmxbhLdCIYZMiZuXXZR9Erc
         iyCEIueSALtIdF/ToZbvTmloZ3+Y5yh5PsUn1KC3IzLOLo9PFKZtIVWwT1q/NwkP1G+N
         vDhfkePABUDvjhOAVGM5GUFvNutmeYouppFuBiYXhF2Qrq400p75Kq+i9ZMFO9Or6rkz
         CNcVws75seqK+BlIq2hyaKVUXvd59BEUc2Ar8pC6T7QvpnKzWNthId8+FojacLhdi/Wp
         OuPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790136527; x=1790741327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Wkrz/pN1mgyckYdtPh64jlSjIcJzRl/WW6ypFtDgEU=;
        b=E5Mj6Sy9GwfdLSUJKdbzWA4+d9RrAtZzNMihy1Ct5Hu6DAjAk6bkO8KUo85+XBcu0c
         SiWgz0qYxWBJMzZgBhVUmVNVUp2RRaVC5R/BJG/J7yplZmmGuxn+TtyFyeKh4tI6fC+X
         ej8aMn4uZ+iLTuz67QTjVjk0CPaBwwxxV0GLrMK9eaAHbdmxyuXJooPjMWGrKC0wdifN
         k7UvdGYR7OaNI/Fbn0kIBAyZmN6woefw3XelMYVCQuVJQW9hYPIAOuSXpgYJPQ1DHzbn
         qfJwkGxhQXdmzjzUhNU5OKwxPL9BW+OTspmD9TzyRWgI43aSqdQD46YoABP9Gfh1UxSK
         alIg==
X-Forwarded-Encrypted: i=1; AKwUvBy2gCFpdxpKflepchWAjTM8RZNSDXMN8HA5B2kM38EMPQE47LPbmgNorZ+v953kwH/a+c1pboOQ9Qg=@vger.kernel.org
X-Gm-Message-State: AFuF++lJUDIMgf9VUkMWOnIhBFv+nek0qEGgtyD9ZmMMufF2UDcaHkqU
	vcBQKbhvg7E25UqT9Fg0Ly5i27zYiLFEvhZ5IDy1hHLlcMsk11ly1ZOp
X-Gm-Gg: AYBFou0g+QQazH7jZeIz+Udzq2ncSzub606bbmdiLhvCbx6RgrD8XUhY80RjxwzjS/e
	p3ajFC+H15MThbbu3giWQCpXF0SEUAWI7eaD1xJQ/g3E7jHNIFZecgBlrQc2THtgETou9rCALwT
	tGUyGJBfHrzCj84y1TBCfT4rK63ChbfmBDPLtQjzXwoy1+m+6L8MYpe2I+donekyCL3jtRs7G1g
	gCYNTMQAD0ffKujTdcYwjtJO/iwdZ/cbBKbeEPUVMFynYlf8k2U9xbKqIfN/ZEE3t9Mf+Qz4w0R
	ChYpvxc5ZQrZS1XY/UcHGOW4osBnbUv57GKAapHpjDAWjqdPHaRBOm3BpT3V28wuXKzfhqFdrEr
	6QLeakIhOUQUyghDA0qfyOt5OR2fG2fo+f8cLYypSnzlSNjIJvw1u1UNW2SYqQcA6VEcjFjqrVX
	zEF6WgJGtKpd4e7Ewd4Emjx4+sFvSIbcAWnP0pOUuj7mzk+c1Pub37Bew13sIM9N2I5e6eScBg+
	mhrxKmAD8Rx4vYiZlfkAZ6R1PJZe9pGmZ4afFcg6E1tzSANn1j8cWQL8G6nrj4E4/pI3nz3jWuh
	nET7bctQt4Dtd5M=
X-Received: by 2002:a17:903:1847:b0:2dd:8b0f:70ba with SMTP id d9443c01a7336-2df69d33992mr12697625ad.7.1790136527473;
        Tue, 22 Sep 2026 21:08:47 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a60c674sm3980515ad.81.2026.09.22.21.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 21:08:47 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Vignesh Raghavendra <vigneshr@ti.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>,
	Chuhong Yuan <hslester96@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/2] dmaengine: ti: edma: fix pm_runtime usage counter leak on error
Date: Wed, 23 Sep 2026 11:08:29 +0700
Message-ID: <20260923040831.10936-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

pm_runtime_get_sync() leaves the runtime PM usage counter incremented even
when it fails, but the error path in netcp_probe() does not call
pm_runtime_put_noidle() to balance it, leaking a reference each time
resume fails.

Use pm_runtime_resume_and_get() instead, which automatically drops the
usage counter on failure, fixing the leak.

Fixes: 2a03c1314506 ("dmaengine: ti: edma: add missed operations")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/dma/ti/edma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/ti/edma.c b/drivers/dma/ti/edma.c
index d97db5af3555..8be9e71dab76 100644
--- a/drivers/dma/ti/edma.c
+++ b/drivers/dma/ti/edma.c
@@ -2345,9 +2345,9 @@ static int edma_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, ecc);
 
 	pm_runtime_enable(dev);
-	ret = pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0) {
-		dev_err(dev, "pm_runtime_get_sync() failed\n");
+		dev_err(dev, "pm_runtime_resume_and_get() failed\n");
 		pm_runtime_disable(dev);
 		return ret;
 	}
-- 
2.43.0

