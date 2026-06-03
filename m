Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2C33E5A3B
	for <dmaengine@vger.kernel.org>; Wed,  3 Jun 2026 03:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780456098; cv=none; b=hWcs0CAwKiYdKNScFZBqgBRFxiTFOSY0Gz7hwribFjrQJR39RFeAGDP0ggvPVC0cKXwEhjzYm4066gHQ7x/7X3azy3s0XN4R+9DwKHvllcvmlE8X3sqqOuWwX0mEr6t8q2TumWXpQT+yVehq9u5EjN86BIa4uj7YhsMqigyQcZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780456098; c=relaxed/simple;
	bh=+PVqljYAEuaHeLfyyM+CGl4qW0A24vMOocrK+WLBCf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c0XkJdCp12u57cJAqarJjAjdHgU1/5JSMmUtwb47aXrMRR11Aw6DDHKKqJTWauFyVyjZqvFouW59d1po/EpQUVSuDppxhX8HfF0ofeJgOoNLgYP6UzyNWzsfcnEOIeVuXk09qfXgz+8VFNtnG38fSxNHVAN4vnJIizCxnE5HY/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cu5++uHB; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cu5++uHB"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-36ab8816a35so5977968a91.1
        for <dmaengine@vger.kernel.org>; Tue, 02 Jun 2026 20:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780456096; x=1781060896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RD449MAq8gcYE5XoSdNvMg3UoSZBswuYPEgYBJrnJS4=;
        b=cu5++uHBq0jeWVyVb5uLRQIxJI22DX6gA36+TJXNqFi2FczCD80J0dE0ZmfMYmhfR7
         Ez+2G3OwqrbOVLrlpIdbHR1ujPWbYA91i6OyWpBb+IpTq2JLEyihcehsZyl4TAB0XsG+
         81jK0kCOBS8NyG2qEYcTjxHDRwvvkRsEpA90FLI6jN98g+i0BDpxDFgfp3zudnYs04IF
         uPbQkQRkDMLVrgFDqnOP6BY9UpZki/UsfeY4fpZmnSGpPF236zUfD7FvLUYOOmH/hyfs
         7+W0WiPHtXywTQL8ef+1eV7Lvw3u5gJwCduel5YJdD4bbYmpMHS8NU4zUv8Xa07iSjGA
         B5sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780456096; x=1781060896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RD449MAq8gcYE5XoSdNvMg3UoSZBswuYPEgYBJrnJS4=;
        b=BRAB6099iVGO7IKNHzpUyhNiY1XMqUw7KCFYiU7VCUSqcBVmEFfzDW2jyXIG+QuJ0X
         dH/nV6TY3ja0uGZ7yxw9WnthRiYpSGgsgh2hIWauTU+n6exYb3R79XZVT9/L9gBHA/CR
         rhs7MlHMU1uPPSU1GmXCQgaTvOIdzkzVzqp577LfvZx3ywRGYJYrlEquumxjRuxx/2E3
         KP19WLGRYl2hgoa40SYVr1XQxkFgvbyUzolk2Et2jbypILGkMXQuiz+cgeBWzfnaJbyr
         4Hc+zR47LfWjiAKGUueFbImVPFpo1ABopbVPll6cWh/5KrP9Y3M1zf5w8BzlQVrxAVfl
         oPuA==
X-Gm-Message-State: AOJu0YwTEHC/H9BI12HHPNnL5jFeMEtaZc6984ZJ4f3N7FYrje1stZlG
	+lWnjJ0ZbwWV0bYg6pSMUO62vCQWDPOY5XCzuIrDeu7YaHaO7E3BtcIP/rWV2IWS
X-Gm-Gg: Acq92OECbvG30keZoPUbr4AA1q2OOXzqaFUbqXD2bHVeCTjH+YkUEVyE69mSU7VYPM2
	Qamcw6MxYa7D6LmhjU4ER1flXd9RoC2Iblc9HMOYc2+xSRf7Uw43uhzVPfw3+CGf45gn8hBjbWE
	gpwn6Ilu9aygPEbNnyGnfItar0Bq/cZ7tYmFFuKig0C5mAHU/XUWL1KfxjN7Qt1QO76NKB1Znjn
	PjzkOkmmHx9mwMG43DEmTwe35QLmJKSPZJqOtv/PyqqE39LNR4KbUlP/YgXBub+hOAn737FbQyb
	Z4qHsKv9uVJqryqlgbjy9i5jTaW7wSbcgU/nYcUYLZEE60yOkaWVfGh75upCQ6t2Fwhros12cvf
	DioTba0zdpjSvNe7/KmCjOV5hVWXaNiSbfEFSMyNFs0LUnLQp7OTpLh+lKgcj7ciTt4HkZLgtMG
	EUdCOx68fW7tkFAd8NAygzmsZcog17HFp1o2kNXj6tQ48po1BjYbZ5+2tEvUqSHV30tEvH96Ya4
	4t+v24qs+ZCtDyR8qECQKWNRd1ez30hKU1JgaoehTjDmA==
X-Received: by 2002:a17:90b:1fc7:b0:36d:8f51:fe29 with SMTP id 98e67ed59e1d1-36e32285958mr1450616a91.17.1780456096056;
        Tue, 02 Jun 2026 20:08:16 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36e0a186741sm1247102a91.8.2026.06.02.20.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 20:08:15 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <rmk+kernel@arm.linux.org.uk>,
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be|_ptr)?\b)
Subject: [PATCHv3 2/8] dmaengine: ti: omap-dma: synchronize CPU PM notifier removal
Date: Tue,  2 Jun 2026 20:07:48 -0700
Message-ID: <20260603030754.288757-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260603030754.288757-1-rosenp@gmail.com>
References: <20260603030754.288757-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cpu_pm_notify() walks the raw notifier chain under rcu_read_lock(),
while cpu_pm_unregister_notifier() only unlinks the notifier block.

The controller is devres allocated and can be freed shortly after
remove returns. Wait for an RCU grace period after unregistering the
CPU PM notifier so concurrent CPU PM readers cannot dereference a
freed notifier block.

Fixes: 4c74ecf79227 ("dmaengine: ti: omap-dma: Add device tree match data and use it for cpu_pm")
Cc: stable@vger.kernel.org
Assisted-by: Codex:GPT-5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/ti/omap-dma.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/ti/omap-dma.c b/drivers/dma/ti/omap-dma.c
index 0f6dd6b0a301..15be3c90440a 100644
--- a/drivers/dma/ti/omap-dma.c
+++ b/drivers/dma/ti/omap-dma.c
@@ -14,6 +14,7 @@
 #include <linux/module.h>
 #include <linux/omap-dma.h>
 #include <linux/platform_device.h>
+#include <linux/rcupdate.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/of.h>
@@ -1853,8 +1854,10 @@ static void omap_dma_remove(struct platform_device *pdev)
 	struct omap_dmadev *od = platform_get_drvdata(pdev);
 	int irq;
 
-	if (od->cfg->may_lose_context)
+	if (od->cfg->may_lose_context) {
 		cpu_pm_unregister_notifier(&od->nb);
+		synchronize_rcu();
+	}
 
 	if (pdev->dev.of_node)
 		of_dma_controller_free(pdev->dev.of_node);
-- 
2.54.0

