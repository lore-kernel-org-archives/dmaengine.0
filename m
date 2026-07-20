Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388EE3BFACF
	for <dmaengine@vger.kernel.org>; Mon, 20 Jul 2026 20:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784578845; cv=none; b=nW8rU4Od4Ihe58sAmmmSzHDDA91LKJ2S2FDYeNfOV0F+vCnT5vgFBzIC4tZ5TfPBYtPdlOpsUgx9XM4nYG4/uzcoPPKTZcrwPAQPCJflxIrOevG418Qx7hp9u0UqaA3uCMznSVwGvmKffBvrYuuGr2V4bXlUTXwKch+APtM8or8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784578845; c=relaxed/simple;
	bh=FG2nfinof6GfsPPeOY7nWqbpUaUdMm4IJzYEqU76HjA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uQCZDU9nFbj83k9HfI6VbcuQG3pWpO6V8oKpPXvhmlguiVXpqOd2BEc+7i1MWb/e+KQINEjbE7TZY4K9+vN8YPYPHIb+JClMLOZ+efOVTZ1LAqC4MP+es1UmNQt2596Q/0Bx2duzYfTJ6KyaJtoCHNeJYi24o6BP1u2EEfGBR34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DLvCdnva; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DLvCdnva"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ccdb73f0e1so66114425ad.3
        for <dmaengine@vger.kernel.org>; Mon, 20 Jul 2026 13:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784578843; x=1785183643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GvQnFfP3Es1W9NjaXYBktRw/N07DQf6zW551CWQwaBI=;
        b=DLvCdnva2VPVuiY1sNzm7XegL3G0x+Jo5VUFavll0/uoUL4d0WQX6JIR79aw8S02TP
         oTnMLVrJejwrxRPmE4fefovux3BastfW6LL1GT/MSwY9jRmsyVnYoMx72R4Kx4n2RESo
         qMV6iQtbPhhOhcSQfYdygLJ0TYYR8gk3aeigquSXaTpVT674hXAiZLt4jVN94heG1Xce
         G2XzvBCeG8CRoCE01gcJ8JdyPOeEJ0HShNZNJdgkoLnRAsrl78FsgceLGzoe92J1TEo4
         x0KfNHscR5slf3oiSO7HLLf2KqGuZ+lzwXw+QIhXGG1WVOs95xO0+gpsLMYKjmqkjP/M
         4AFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784578843; x=1785183643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GvQnFfP3Es1W9NjaXYBktRw/N07DQf6zW551CWQwaBI=;
        b=P02+yQth98pnqn9TipN19MbUYB4hCnXUZ/Oa38ShFJs3fz/ZyA0viVODZn/18DJ2UM
         k7KyynBvxAyYypJxQUWx2Nmv3AfpvzYT3obiaLifrl5Opz69d/rIZ5nLYfWbyn3FXgpf
         WiVOmbNarXGOeubPoNuQRtTjNNpLi4Q08GNS0OMzT1Vg9M/3qhpyWA5SdPOjVI0E1CUB
         PIB+/e+z7T9EEKi4IV14uJkPTuLqvaYXCG+81ibmYois9onCc1yE+uZwmmcPwx5EIDvm
         IrivyydeBIO4Uah2oQTPeL2KrqVRfEEBvAYKjjyElHwBPeYjdyZTonfWtDwCPsdmavSI
         1vjA==
X-Gm-Message-State: AOJu0YwB9wVO9OSQIbWIG40NzXzNsogR4hj2eXF0+44CgccJ80AUyxDD
	tH6lJt/KuvfS2IeN/hu8L07myu9HII9FpS5oc49hc9ElfiuPygZj+FD0L5eBlCZz
X-Gm-Gg: AR+sD12Srrq/KTXFKSEYT50emNGSwx4lwoIgMJWp4VttK+pobiSc52is9etX2H8Pi3N
	q/MLiW7cHMDBx6/PfkepMsvDLxmOGuk2nktRq9bmlOMXNaqGGKi7cl/WK4HXJzVyn0BBo7RqK+a
	v56muqbp0WRhuTP6Ye4z83UiDdAUEU/gYiL9uj6RXQSSuWFMmXdYTVZtjHUVlUlQMMyPnQjojza
	OxE8QIglWHvWKg4Ph4Ko2OEamE3jD3H8NzFTOuH/E7oFNfjfpOsxKkntGRZlZ2WmzCyrc6b46rc
	OChQ4uAWZb8LSx0V0V9QdDQJPkdsNB4PSf2K2U+FKDXAUo2SoeSgthhSIeHCJ270BBVC3hCt+nv
	/zEQl9gpIe98sfl1J5TfyVzT9qVKxrWTLflRiiRdVRN1Z1xkj3d6hgksj6jR0AQNtWsbQQlsVui
	GrtV0IcrwCi7+ddTJy24KUluhRLd1O9xx1KF8ntE+QLjlJPVxdU28aCrTJM6rRzVbc+HGziQ4HR
	chsSlf3B79+1LVMScbNvnRYGIhniU1HCvjPJimK49GRePjMBebwxpc=
X-Received: by 2002:a17:903:1ae6:b0:2c9:aae1:a61c with SMTP id d9443c01a7336-2cf348a8c3amr167956745ad.20.1784578843294;
        Mon, 20 Jul 2026 13:20:43 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf34729df7sm63722835ad.63.2026.07.20.13.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 13:20:42 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Xuelin Shi <xuelin.shi@freescale.com>,
	Harninder Rai <harninder.rai@freescale.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] dmaengine: fsl_raid: check fsl_re_chan_probe() return value
Date: Mon, 20 Jul 2026 13:20:40 -0700
Message-ID: <20260720202040.2531311-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fsl_re_probe() ignores the return value of fsl_re_chan_probe() and
unconditionally increments total_chans. When a channel fails to probe
(for example, an IRQ mapping failure) its re_jrs[] slot is left NULL, yet
total_chans still advances, so fsl_re_remove_chan() later dereferences the
NULL pointer during device removal.

Check return value and only count successfully probed channels, and guard
fsl_re_remove() against NULL entries.

Fixes: ad80da658bbc ("dmaengine: Driver support for FSL RaidEngine device.")
Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: fix description
 drivers/dma/fsl_raid.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
index bfaef6245695..30aaca81d855 100644
--- a/drivers/dma/fsl_raid.c
+++ b/drivers/dma/fsl_raid.c
@@ -841,10 +841,26 @@ static int fsl_re_probe(struct platform_device *ofdev)
 		for_each_child_of_node(np, child) {
 			rc = of_device_is_compatible(child,
 					     "fsl,raideng-v1.0-job-ring");
+			if (!rc)
+				continue;
+
+			if (ridx >= FSL_RE_MAX_CHANS) {
+				dev_err(dev,
+					"too many job rings, max %d\n",
+					FSL_RE_MAX_CHANS);
+				of_node_put(child);
+				return -EINVAL;
+			}
+
+			rc = fsl_re_chan_probe(ofdev, child, ridx, off);
 			if (rc) {
-				fsl_re_chan_probe(ofdev, child, ridx++, off);
-				re_priv->total_chans++;
+				dev_err(dev,
+					"job ring %d probe failed: %d\n",
+					ridx, rc);
+				continue;
 			}
+			ridx++;
+			re_priv->total_chans++;
 		}
 	}
 
@@ -875,7 +891,8 @@ static void fsl_re_remove(struct platform_device *ofdev)
 
 	/* Cleanup chan related memory areas */
 	for (i = 0; i < re_priv->total_chans; i++)
-		fsl_re_remove_chan(re_priv->re_jrs[i]);
+		if (re_priv->re_jrs[i])
+			fsl_re_remove_chan(re_priv->re_jrs[i]);
 
 	/* Unregister the driver */
 	dma_async_device_unregister(&re_priv->dma_dev);
-- 
2.55.0

