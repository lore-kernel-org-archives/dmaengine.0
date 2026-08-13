Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38BE48CD4B
	for <dmaengine@vger.kernel.org>; Thu, 13 Aug 2026 15:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786635111; cv=none; b=KGL7b8Q+6tNzwYCsKRDY262MKPuek2J53lTgMwfGAS+A78E49WmNzlKSLt6zMs5RbExt42DdKai7xSGK64bdvceGBx0vh97CfIkX5+KqCZqg4t4irKKnuen4B4LIyUjsoKf3qQzDUc2JyjQgsikWf1iw7vzjICo+tL7Cafb4xRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786635111; c=relaxed/simple;
	bh=jZxyxU5u8sBykomTeSI+V7SOB5yOkTTJqrCunzVau44=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OVVOm8Tx4wg/6VGg8+5Rj+cu5n6Ax0gcFm9isLY4/9RYM6OKF0vLj/68FOMAI4vbnJCPKs6Wxn7a0/wb26LrXNkC8PE4rK2TvidrLAc/awKHq9uVbaTsySFG8XP9azY9COmFB1peSOiQWn8tKgivEfNi7nFWvzxfjQDi3JvaHbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gy9Ejj08; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gy9Ejj08"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cacf197759so935365ad.2
        for <dmaengine@vger.kernel.org>; Thu, 13 Aug 2026 08:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786635109; x=1787239909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sdfZ1MM3xM7GKAmsObtE+j5gvMl87cGr/Gcwg3tTC/g=;
        b=Gy9Ejj08EmjlWg1nlmcPARlERg80r5oypdby6FIu82e1pMx849g95vPJq5vuVLSolW
         /ccT/c5rDRiyJk+EewwiAN/kiwrLBE55Aa7ZMfa+HQ2TDZH5W1ENWPoKDhSM66MQfDGv
         ySl29w1uaZchwWKXD1ZgRRjSVzbCvAiwGMxoK/JWU3yzPXDUD9gd+jFzrMF3dRO0atkc
         uJVk7HxHsjy4QUWh7NcLS43nfKvORsfkI7OIMzWc6MUxwnVhZJxyMBFiQVNACqyzCvAr
         GUTXMOW1W8TcRGdOdP+Ewwp8HqpH0wHs6ZM4L4C6j53cQwDGs+d7sp+r9+kd3bv9g1fe
         Y3Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786635109; x=1787239909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sdfZ1MM3xM7GKAmsObtE+j5gvMl87cGr/Gcwg3tTC/g=;
        b=M3g6jTHv2uHBE3SQC5Dt2LCdoiDEdRjai0xte12UOsSzKXNGHgm/kGbVt5QIOytowR
         m7oXhp5mvYMf7sXcR4Fz3bsd/CjvfMglqd0LMCcv4BFNCh+LMxrZm+BmyUtDUOdyg0dj
         YqZpaqiBgU3Eysh/6loguwbEMH7Yvva7HgC02CfPhVfRTB3XtwbifjlKru1MH5txRPzY
         6nMg1QJc/0+s0QCqKPpbVEECtlWSlElRzL4/JbA6/ctM/OfxIzM2nPTAd4uK919Urm0h
         ZGHUMq2FUa6RGRWPzsGy3+GgvcUjKN0S4ufuMZV5NDh/zHNFZflG4bc1LQ03gVpkJxGx
         NycQ==
X-Gm-Message-State: AOJu0YzgnyeuW9IC4AhWg1lk0pf75wjbJjESH2UugosjrSBbf+kQm8N/
	5Uiq7cm/0t27LA7ksK38p1QEsgX5TQdOgi43Imixe+fBnFAjTTtU1sCEJyO8tNamyM8=
X-Gm-Gg: AR+sD12XSOwvCyEBv5O14TqHEW37Ox7hJtPOPPzxd6anU6whdmSIWHceHybVgVkL0eL
	Isw69D7WmJQS0Z1IVxi0YhkOpSLg//WXFaE7bWOmLP/1zFZM8y3bV4honIifnblHxPRTI5D8wge
	hLi46eP5XwXYZ3oUWZSodNnF8SRYkA0FoSCgVGxnOkQsK0iEs83jCvi3LXwcZj22/XINHLsR/SC
	UgAPFZw8ZKIT4MOFUpXQP7Cy2XccOL9FG0c2D38YTM3TeXDNU9gL4h/n91vjATd4xiWm1NW4hpG
	ujTOZ+njrXmg7Oi4rH1maxq5SlSZ4aI96MfSzlhgi53DQEDwHIuugc7vJFM4WiOMcwTmYFncgG7
	jwX63iYUdpMpVZdAAjDXcVia4PJMmuvQgNoflv+nEnWgZ085j9tid4/a+qD0+nkJvF9X9W8VqME
	Mg21su2zalMBM5wJQryF4J5CTKGHHrbhXxcmR8+dRuWr/HDohhOT/lDSYcRxMVoTYqs+SuQtTVR
	xViWn8=
X-Received: by 2002:a17:903:1b06:b0:2c8:1c05:16aa with SMTP id d9443c01a7336-2d37e8a6026mr85074095ad.19.1786635109161;
        Thu, 13 Aug 2026 08:31:49 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:3b7:6da1:c188:d14f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d37c200199sm11985545ad.5.2026.08.13.08.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 08:31:48 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: dmaengine@vger.kernel.org
Cc: vkoul@kernel.org,
	Frank.Li@kernel.org,
	ed.blake@sondrel.com,
	linux-kernel@vger.kernel.org,
	Ruoyu Wang <ruoyuw560@gmail.com>
Subject: [PATCH] dmaengine: img-mdc: Fix runtime PM usage counter leak
Date: Thu, 13 Aug 2026 23:31:43 +0800
Message-ID: <20260813153143.3953303-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pm_runtime_get_sync() leaves the IMG MDC device's usage counter
incremented when runtime resume fails. mdc_alloc_chan_resources() returns
that error to the DMA core, so the channel's client count is not
incremented and mdc_free_chan_resources() is not called to drop the
reference. Repeated allocation attempts can therefore accumulate usage
references and prevent runtime suspend.

Use pm_runtime_resume_and_get() so a failed resume does not retain a
usage reference while successful allocations remain paired with
mdc_free_chan_resources(). DMA core only treats negative return values as
allocation failures, so the helper's zero success return preserves
behavior.

This issue was found by a static analysis checker and confirmed by manual
source review.

Fixes: 56d355e6f586 ("dmaengine: img-mdc: Add runtime PM")
Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
 drivers/dma/img-mdc-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/img-mdc-dma.c b/drivers/dma/img-mdc-dma.c
index b3765ba1580308..a3192d49b6c860 100644
--- a/drivers/dma/img-mdc-dma.c
+++ b/drivers/dma/img-mdc-dma.c
@@ -738,7 +738,7 @@ static int mdc_alloc_chan_resources(struct dma_chan *chan)
 	struct mdc_chan *mchan = to_mdc_chan(chan);
 	struct device *dev = mdma2dev(mchan->mdma);
 
-	return pm_runtime_get_sync(dev);
+	return pm_runtime_resume_and_get(dev);
 }
 
 static void mdc_free_chan_resources(struct dma_chan *chan)
-- 
2.51.0

