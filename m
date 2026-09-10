Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF25426ED59
	for <dmaengine@vger.kernel.org>; Thu, 10 Sep 2026 20:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789072131; cv=none; b=YVcTo26s1QUGgdlcef4M05AN+4NdIN17/GqDYZFF2faPZlQQ94rozLfzPzzlsoHPXNCcaQ6CP2Ya1Q2gSzf6kZHU0N/VHbmpDdEE7amDK8hVnnQLsyX5zZTglBfgY/FSx6XKX6s96ZxnbvAregcIj966JD++S2HwologxlsnMxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789072131; c=relaxed/simple;
	bh=x4/uElXbKPNsHJIECqgisA9YuQG0BqXHRecovgEqQPg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=obz5OI/BiGWg7buu+X0JafoLWPsHq7B741pHxelEJoLE/6T5Sv86uvJffnbclGEZAeIdfZoUm3ZchX2OdgTZ2KucjXU8ZbQ6BGe1ByInt9SYki6gehew6XApiXfOQ+TYMpWKYxWU517okiJQ6GRzA5cvJsulgZzOpPXDr9rTg4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lVqZ4/FG; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lVqZ4/FG"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d944747d41so1439155ad.0
        for <dmaengine@vger.kernel.org>; Thu, 10 Sep 2026 13:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789072129; x=1789676929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Aa3oYV4B3MU/10qO4ouQXqPc/oc+sYQCXCIbQhucJYo=;
        b=lVqZ4/FGOZcsVRYMZLrW7ijoAy1CYNgnLzKs2s4NQt5l18ebH+OwlycdzgkQfDZDIg
         4PruWKO6DDQBiFYX8S0zk9zZjWaN7LZCxqU6GrtJF0bPo0NwfR0nAPTt5BWPqkyUikJu
         yQkzuTz6iQqEtE6By3CGUsWdy6tqMQ6emLzDUpB449oQudEAB1n0e/rtc/Irqz1Gg13z
         12hFo5N/LcC1F59i2qs7uSFIl/2YCgBhQnurGTN77v4Y5rayMWlfoGHHiUllRzJMzK43
         YG4G85J+yjpCa5Utr6m6AQQJ4q7E+qnO+LIRKmAvgkClM0WzWNgfB2a2z0Y5W4cd/6+v
         RJOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789072129; x=1789676929;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Aa3oYV4B3MU/10qO4ouQXqPc/oc+sYQCXCIbQhucJYo=;
        b=GD0O44cKh5ZAozbqv3o+2NVWv7Gl++nU5GP9EWAQEhXDEMj2THuuRmGD5/L1oQgBgj
         pk6JaV4mwVXCnP0o8eF+85Y3zSeceM7ztSKMsgg/8WZrxA6NLZdMBJgY+htEK8/n9xjF
         lpV5oFlV4D9TwwbUqjmkj2Vuhf7wG5BnVofEU2IJgm5ErM6amH0uEV/ZBvp8xKxf6Spw
         mihO68Yr69Rizy5vmcXoFXup68FOM8xWoZZOZvynAfaldXEIcRp/x2MPG5ylblYPAxdW
         ndjvT1KCLF0dFgg2IAol+Sq8T6hle5VCSLwU6hsfVF30t9fhPVYuzgyS4vuuV923a3hS
         Mbuw==
X-Gm-Message-State: AFuF++mWCBSPWRPC9tJ7YP9a0TlvH4lO+0Mz9pZxcKpXisiIA383WB0+
	e602K4usbU56m1betgTSy80AyMehqQCARoLuAirdue3cMeO3gTDyoUU78TS2xA==
X-Gm-Gg: AYBFou0wVVIvWtRXMXe4rN6UiF+nI7KhuLxTHUH3nEte1TLp2v1n+qWyBXmLahbfDXz
	cHT8T6QGC96j4agVDD/8SWqBW1nocHu7gYiKvO+GLcUszSGqs0Y3gKeaQ4mu1khyf4bDVaShdrm
	ENSMDCF7bnVBr2ITSMIRc6zv+48Yk5ua2vYBCxaBKi81z1XM15sd1whARwSMjZd+BE4fl6ls/YU
	rvu5idwH1hw8k9PeqIgcatdjpcsAego/AVntdONe1+CWhXZd061E3/A18I8vM2sQFi4LkA8jR7/
	5k3kPiyo19qNO48V9nWJra83/MGeGuOp3XD1pCU/AlbvSf6sCshHeywwG0KG7jGSrDAyki/2rPA
	fSe26SNsIiS/mcWDfsueVlcAtAhhRa6ca14ooRmg1xnXJaCUmXiLQxVeqHqxQreIXtoQLD0tJ+Y
	MwmXwIl4kI1uhjMixsenEo+AB0bnxyBr95R5+zZ1lIrkmCZlTunI1aKE6Q7BipCTKWRoPisiiBk
	98FODvKd/PA/D/2oXL3NyswWPuk0g2YFsAzuLvtozX/b2HA9Mo5flMO5Dq5AZ9UWNx26Z29mkBF
	o5QnoU+yirPtPTc654RxniABxgzlrXu6WCEJ4+viilhdIQFZ
X-Received: by 2002:a17:903:1a4d:b0:2d9:2149:57c0 with SMTP id d9443c01a7336-2dd2a56f3e4mr20652425ad.22.1789072128998;
        Thu, 10 Sep 2026 13:28:48 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2ceb4024sm1430895ad.33.2026.09.10.13.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 13:28:47 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Zhang Wei <zw@zh-kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linuxppc-dev@lists.ozlabs.org (open list:FREESCALE DMA DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] dmaengine: fsldma: kill tasklet before removing channel
Date: Thu, 10 Sep 2026 13:28:46 -0700
Message-ID: <20260910202846.48941-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add tasklet_kill() in fsl_dma_chan_remove() to prevent a race where the
tasklet is scheduled by the IRQ handler and runs after the channel has been
freed.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 v2: split from series and wrap at 75 characters
 drivers/dma/fsldma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index 6ce0e5668dc2..5eca8ab23564 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -1207,6 +1207,7 @@ static int fsl_dma_chan_probe(struct fsldma_device *fdev,
 
 static void fsl_dma_chan_remove(struct fsldma_chan *chan)
 {
+	tasklet_kill(&chan->tasklet);
 	irq_dispose_mapping(chan->irq);
 	list_del(&chan->common.device_node);
 	iounmap(chan->regs);
-- 
2.55.0

