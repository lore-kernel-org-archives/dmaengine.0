Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A75244BCB8
	for <dmaengine@vger.kernel.org>; Thu, 13 Aug 2026 10:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786618501; cv=none; b=BNmdMjcDrOJK/voPUp6yoQZquwVvnbz543tojjtcpkLSqbj0kQjtlnXHfeYgMmps28NETri9jswT0fb4VYvxXFnLl0IXKXG8TRw0K7oQOFnPhERl4se0k8kojkR32peKiE2NnlFpDgVw2hfF744ZK+AulJiEaFdRwZkmrTaFV4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786618501; c=relaxed/simple;
	bh=sfDOcGj49I5Lg9sqPabm+sCqAk30xgmrYMvMPJ1OC10=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OazmWzWLTXA7jvb+UNd9dqV4t9YJc/FSd3gJoJCixdI7KxxWeGIHxe+sVSA0bfFbdcnwJUXcE9F2iEJjLOO3Pd1tGXNPXSJ3d+2AOBHg3gl784KJeOGxDsMbLJ8ngicjjxmvTS31BizzyyB78knfG/uqp8KsRqKu+JorpPkoBQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FgAE86Zb; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FgAE86Zb"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2caed617615so7204485ad.3
        for <dmaengine@vger.kernel.org>; Thu, 13 Aug 2026 03:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786618484; x=1787223284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zrd3znC9RvuRXBUcV5HRJ1iH8to7j8zaCuT9EPtB96s=;
        b=FgAE86ZbbKeeIYOmx2o2D9xXE0tyZ1zIfA/6cDwbPd75MszIy+FJeqPz/P+HHcB+wn
         mYxYsx4zBKxUYDkF6EA51NsTDekBzbs+AY2RhBwf0Ys9b3IvKA0rZGmRK7ODxo6IQy2o
         9grOrfnKC5eojKg/xsNWlUrL03P1GX2g10xkF4FMG//7KuY5eJeojlmPY+Pwcp09vZG7
         B22AFrlHTJBLXh82uDOiqv4KC3Sy7V7Do6UqFk3ANGlgdrjqd8lhFXWqrJ9Mx9mmORYU
         rZBBUtQCjv+VPh8IcKn2+sAUZ59CQOemSKb/cdnGhLiIc4phssIccus1X5hXkq8WBNSx
         x17A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786618484; x=1787223284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zrd3znC9RvuRXBUcV5HRJ1iH8to7j8zaCuT9EPtB96s=;
        b=l9U0B0LHE73sz7myX3n+TerQg71iKThT/oqdqUcLGfzFZPU3nlVqjg8W5lXPTWNKs0
         MPiuES0OrRM+t/BvkFabAHhHYkBTS/+TxKw7RTldwCRl+fFXBGu/hHXJ+fq00B6MqCyR
         HN9ioIrZE0sRuMEJeswG9hMSajr1zMxMUCGTxkmKpBTCd0puuhz6NFYWsNw9km6wKw5u
         tlPpYCjnlHaScQe0KDsQqDZi/CM6LFniFlVQIrdMwKQAlrUiw4fCJGqKpZC2dwn1wMDf
         006IyrZP3/xyNAqJbxi2xlKg3CLngDxhwvrS6idI3f1Ky3Fj03onHnLcNAWdYUMqNEDZ
         UIIA==
X-Forwarded-Encrypted: i=1; AHgh+RpFtDKyUeS9Vs2m2d3KCfpsNPVyi7t/lWM89OMvDFP92j++2NkYrJoQJlMzvMHxENPqFW+TOHk3M98=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa+bwzhy4jA6uSoueaPAuohTZ8NlqF9c0AIo/8btzOS4VREk3w
	KxXlMc3x1mP0isrumr/HfZvA73hQdC8xX8aQKe0IjFeN6bm8rpa0siw6
X-Gm-Gg: AR+sD10l8h4TEK2jkvDPovw+aiIovbMTW+jfwF3elWFivB/SHz+jVbBoO4JDvJUs8RM
	PPnGyOkfZa/TJPxdof4YOCyrXmwAT269F0LAt4r1FaMHK9y5nXDtBHd9JiBjx0EppGg6Gwh/H4m
	84ENHe2a88SGibrXCVk86XFV3WNdLMahphLunBxqeJog/kMnbYSugaRn+6BOCXY1lXMOAQHBO7g
	ORD9soES3xuONje0c+xscPVFxZaOVJQ0hxSAbljV2K/ZuIhY0vHG360k8jIDyeXdc7sCrBfNovK
	zbEUUcoTLAbgARY1YM7J9Evh+MNX++S81lEr577pl8YlG7izr1yjyFprpaA9th49ufrilyzW0pm
	mK98U4QP1J9tfSZGIqdY7DiVwvkrCWkGaAYvK6YoXBJjQpcHbEEhlPPFbxvRkqjiKCfayRpZPT/
	UzX+j6pkhVa8RU/luJiZEWoyU118L2jH9jdRnEkyXJRZxYzRqbmM1II+FLCoMBqjonmS2GXg1ma
	Q==
X-Received: by 2002:a17:902:cec5:b0:2d3:1411:3888 with SMTP id d9443c01a7336-2d37e833f67mr49532675ad.12.1786618484169;
        Thu, 13 Aug 2026 03:54:44 -0700 (PDT)
Received: from amd.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebf732166sm11395032eec.18.2026.08.13.03.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 03:54:43 -0700 (PDT)
From: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	Chaithanya Lagisetty <nagachaithanya9911@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dmaengine: dw-axi-dmac: fix clock imbalance in resume error path
Date: Thu, 13 Aug 2026 10:54:32 +0000
Message-ID: <20260813105432.2577322-1-nagachaithanya9911@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

axi_dma_resume() enables cfgr_clk and then core_clk. If enabling
core_clk fails, the function returns the error without disabling
cfgr_clk, which was already enabled, leaving the clock refcount
unbalanced.

Disable cfgr_clk on the core_clk enable failure path.

Fixes: 1fe20f1b8454 ("dmaengine: Introduce DW AXI DMAC driver")
Signed-off-by: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index bcefaff03b5c..9db8993e0bc6 100644
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
2.43.0

