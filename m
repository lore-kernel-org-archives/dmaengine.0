Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FF7203710
	for <dmaengine@vger.kernel.org>; Sat,  8 Aug 2026 12:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786190499; cv=none; b=CIF5UOW/wO8JIXNjrWPW1dxWS7eD51SJ83haq/Jb4WfPzjEPL9uCN2YfdBvsXYTs1p8ll/WVqb3g+piyEcA23BVOCDmDYThsdS3sTnJRVZK5KUieqe64yslMniJFapLDZC9D5OkYY6BA2URRo3NpD1XnvkIpAV7PHQZ05YSGCGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786190499; c=relaxed/simple;
	bh=VdKmF0MAy9JnfTs0lWJz1o9FwtWgy0AQWX/cZmeJ1i0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nfj9yDmJ5TCxt4Hgpq5ZeLGhs9ZpytnN8MAHIR0rQOuAzAmXuzrtFWYk5zZBcktFBFZURtugCZsyn8XsY+ngfPg61BVGlfBxDf83sjfvVwq1AKspy2eSaRVxdhrggC7632jNg9YduAy+3vtfN/I7NUeOohq5xhIILqOsFPGwU28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=meotUP5x; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="meotUP5x"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso4688945ad.1
        for <dmaengine@vger.kernel.org>; Sat, 08 Aug 2026 05:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786190497; x=1786795297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K/VDwU6YKDYusuf3bOyqkfoe3Kms6rSYmSwfDWd4AYg=;
        b=meotUP5xW9HTCr6QK2vUhrYpiZ1EFmoLxKYtRrahu1TkqLv5+VqSMK5iA1h5Jneceu
         5FVNZKjkwoYTYTLnwrHb4mhADXsDuplAWFbtJSmaNx6k9+EfYRk8RkQTNmrtD4o8HBON
         cnl+7BMWdEzh+vIQj8g2NhD2j9iECkDMoYdugWvfZfAMqdDgx/QTct3bF5bFqHVudtbH
         IChVsTlm3c6Nt/zEgCLwLEpAfeYR9zPAqZiAZiUTHgLUl/c/Axt5S4yBzE19uNIByTH/
         2+DuyLGr7oOJ4J0IWgKI0gAyBvMNo/cZOSvL3e93G6Dm3+eRgfFqsuXF18//Rl5zWBUN
         iFIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786190497; x=1786795297;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K/VDwU6YKDYusuf3bOyqkfoe3Kms6rSYmSwfDWd4AYg=;
        b=DEQi/cLHMM1d9lN4X1cbADbwQvkbxLhPr0QjDWz9X/FO4zRR7H/VBBgDCS6k+LJQsJ
         wjrfv3Fs6fH6jGUaWRJiz8sEldFWlIAiGfpKn2wJaPcgFnOvrzqdRnY1wdKICzn2YLxc
         UMC9iys1V7Td0ZPr2ckszB1J+ZMl47sA4XYG2Y2Y7HzQSTb4skHarsvAw4eDB7XDM3Oq
         TUxz0EUoXgxKJYz0Ca2fn/wQDYCyJnJls7R9hp2BfviUnPgwoiYaCU58XLgrDxiWjnAj
         5zBuZmWTrGr//PjPELNietgvBxnJ5iojzeSqvDnqLaWVCiUPDhp3oeNqSb1KK4kKGrdv
         yevw==
X-Forwarded-Encrypted: i=1; AHgh+RprwhO2nDBlZWeKPwJJWr19k4BjFdEzo/DId2ji49G18/jU2IeaDYgQirdpqsr8TA3XD0E4CRo37qo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1IBOhE3w4uLx0tCdvkzeS1YOYTXjNlC3nGmPwi/fabHlnCGcP
	yHO4YHovKcJcIUKbqAt+A7nlwnOVgOHFkGjW6m4pIV2BOgvvKookfh/f
X-Gm-Gg: AR+sD10tIS6+LyHoe3viiPOC8rPLRQMjsdaeYjv2or2KBCL6a6wINh7uUBmulnUzCV6
	UijOeFAvM9nlt5Y1NjYNfyxQVSyR5RFVJlH1IKSz6vseMEW21HeBUuRU2D+9SVApc1YzmKPQ+D6
	SYO61RX+gr2e0JzOA3xnjlNMOOa8NGpPrpvT8qLgrqu5YH5SCj79xpzA7SvGo7c7fJblWWaUU5D
	/vchrSCeK5vwurSVxvqnFwR8KREyLpWrUNCMfkfX8EzJcToiPZbTBkmraFzF+39pQddDtvUqmA/
	W9qhSb8uTFETm8PDtLKPrx62TpVqoaJpTAA3Kh1A2Kg2V20heuFwckE014alN13YynWV98bxhg3
	J/Bljvb1NPgCiUf3SkP6coj9tMdrt3VbqPhZ7IqHb5DXOsBur0qn0fg15uNhM05dUDSwGn4ewY0
	3XvwNvjCCo7DR7urV5znFYQi1EgC56HJBnui5x+9YFumQ=
X-Received: by 2002:a17:902:da87:b0:2cf:4c0f:5129 with SMTP id d9443c01a7336-2d0caa03fcfmr299424925ad.17.1786190497182;
        Sat, 08 Aug 2026 05:01:37 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d14dbeaa88sm18073605ad.39.2026.08.08.05.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 05:01:36 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Abin Joseph <abin.joseph@amd.com>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kees Cook <kees@kernel.org>,
	Kedareswara rao Appana <appana.durga.rao@xilinx.com>,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] dmaengine: xilinx: zynqmp_dma: fix autosuspend cleanup during teardown
Date: Sat,  8 Aug 2026 19:52:28 +0800
Message-ID: <20260808115228.2798481-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

zynqmp_dma_probe() calls pm_runtime_use_autosuspend(), but its failure
paths and zynqmp_dma_remove() do not call the matching
pm_runtime_dont_use_autosuspend().

If the autosuspend delay is set to a negative value while autosuspend
is enabled, the runtime PM core increments usage_count to prevent
runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
during teardown, this reference is not dropped and usage_count remains
unbalanced.

The documentation for pm_runtime_use_autosuspend() also notes that it
is important to undo it with pm_runtime_dont_use_autosuspend() at
driver exit time, unless runtime PM was initially enabled with
devm_pm_runtime_enable().

Add the missing pm_runtime_dont_use_autosuspend() calls to the probe
failure and remove paths.

This issue was found by manual code inspection.

Fixes: 64c6f7da8c2c ("dmaengine: zynqmp_dma: Add runtime pm support")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/dma/xilinx/zynqmp_dma.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
index f6a812e49ddc..635c3f6cc5c2 100644
--- a/drivers/dma/xilinx/zynqmp_dma.c
+++ b/drivers/dma/xilinx/zynqmp_dma.c
@@ -1116,8 +1116,10 @@ static int zynqmp_dma_probe(struct platform_device *pdev)
 	}
 	if (!pm_runtime_enabled(zdev->dev)) {
 		ret = zynqmp_dma_runtime_resume(zdev->dev);
-		if (ret)
+		if (ret) {
+			pm_runtime_dont_use_autosuspend(zdev->dev);
 			return ret;
+		}
 	}
 
 	ret = zynqmp_dma_chan_probe(zdev, pdev);
@@ -1152,6 +1154,7 @@ static int zynqmp_dma_probe(struct platform_device *pdev)
 err_disable_pm:
 	if (!pm_runtime_enabled(zdev->dev))
 		zynqmp_dma_runtime_suspend(zdev->dev);
+	pm_runtime_dont_use_autosuspend(zdev->dev);
 	pm_runtime_disable(zdev->dev);
 	return ret;
 }
@@ -1172,6 +1175,7 @@ static void zynqmp_dma_remove(struct platform_device *pdev)
 	zynqmp_dma_chan_remove(zdev->chan);
 	if (pm_runtime_active(zdev->dev))
 		zynqmp_dma_runtime_suspend(zdev->dev);
+	pm_runtime_dont_use_autosuspend(zdev->dev);
 	pm_runtime_disable(zdev->dev);
 }
 
-- 
2.43.0

