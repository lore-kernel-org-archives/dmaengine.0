Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608AA3E4C9F
	for <dmaengine@vger.kernel.org>; Wed,  3 Jun 2026 03:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780456100; cv=none; b=mZI5DHmwmWmLxUzsoKNBeJRz2HF7wh5O+IQyVjsdhmTZXUFUJLX81DP12eHBVJZK2cyaP1ah7ekAypDrApKLdjDVhAFLgABp2a/HUbhKhImKw+FwoOwQsoDmCf37aPwGPeku+9QSwfz/rgXvy9ZMpkL/qfI00QotYqVVzrS7GvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780456100; c=relaxed/simple;
	bh=QpqYfGjnjza1yDhq9iuXBzv4lug+a++X1dRARkJ9T9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WMHDcTQgMIP6fuN9PyXlHmbsI4SJjtlx4pSQSxSZKfFm/LZVKtC7ZpXZqrkwsVJGcdUtIefOmpfqeA1dvb/rOyykxZtzEiF0N6zyJxv8UVD+UGk2AIK72BI2BcEdwYKYZSOQIUk1xIml4jzrENL56P/oNJsAJnxv2/N81uJUvl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pjB9hu8u; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pjB9hu8u"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-36ba706ab46so3440952a91.1
        for <dmaengine@vger.kernel.org>; Tue, 02 Jun 2026 20:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780456097; x=1781060897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t6nTg19H1aEF2hCty9Ml54+E9Am0ueL/QSUT9WJYjuQ=;
        b=pjB9hu8uA/4mTOy16n/+MSPwNBCtkXckDHZ1HqIK+TDFY8pTEQPQjaTFK5RfQsK8qz
         qMavdKp+oVGGe35AWEWgeJgCwd1sQ9aUvv0cGaBGpzI8e7vThAf+z7vcd9hliPkEL/33
         Vs597EMyOsJsBFm8/gQKz2/5Z1F/jK9C4jL8NZdTRU87yKdSysB9MMzzKgqoLPccfvGS
         JppTEdV03ad7nucVoW9lmbJhfOGgLosayLwKwd3gwAYmMN3MjdsEOJQVtxnSbpCAvtXF
         bOi+j++kD80tStJ5VWGpjRoSsS0IPaW52DvIDsU58lDTRWdQd07rxqHo0CMPaFQ9cG/b
         6Ljw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780456097; x=1781060897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t6nTg19H1aEF2hCty9Ml54+E9Am0ueL/QSUT9WJYjuQ=;
        b=FqTAPvdN8RmPVHyL61dK4kQfIv4Kil/Y22gmfQ0WZtCwHmD0DfvD7HS/K4L+pP2tFQ
         5XzHpoidjHOkvJCEx16oLCemjICley/2hxyvI0J+XrqoJ2BPGerC7SQseudsD32Iz1ck
         /s/2Mue3D9iKXgeM+6aDMKa7foZsqwUeGX7V0ll8EhxWi2uq2/ywwRnSlCXa+asO8eS7
         30yDbtmgkGNlYj6L7VO+CkKWLCnBxP6WStXqGWXPCo8kQagZCNXop7NjVjLfvtcnM2E0
         e7uWPh3pS7lt0ffDAe2xNCm+guCWOUwEu4Ra+Mog4YyPDXXRtjnM/HF1hWFX+YcmaQYr
         QWVA==
X-Gm-Message-State: AOJu0YyQ0VFpw51pbE2URJQMnsgH88nS8CpWtwExsHICzLS58e+GevAs
	12KOFLdexMJVQqnr0OHDA7hwl3cUTTYe0/bxYkqz4DklnAS69Lfg/QFIEp1rrZjJ
X-Gm-Gg: Acq92OELPSRFzT0UFPGR8nsIVNMUdCCoGK7nWqISFUyIxKNXNbT8iREureDE2in3/HN
	ibtqAmZJk79TZNzzYqP8aEV7cm4eR8vfKtYuAKJsGhrsp+bVzE8PCRG+xk9AYdJ+6fClizG8Dmr
	YTt5/x5G5O6pFFTRck9RBHHag6HbczwXaN/b4EX1OaS2NorQmxsC8rY4lqYa4ai7/jTHzS1QNUm
	ZO52HOvtoE+8aihVRFIekhhgeRBCtXeav5+CyNgoob8T8QYJNORD910jUFA/JkPqMeA/uRHwDk+
	kkTfQe5QIXO1+6S6b2/ja5KulZ+EBv9GCQ9LU3vPGshd8tNxmQDZv4q1VU5VpuHpwkQw4sqN2gx
	SM6wYIY/eRkhigl7tKX8NBntGSkCLnJv9UyafbctYLN+eshKrEU/3R/TfE0zPWzd0oWjfeaLMI/
	Inrac6P+SRS/ogEqUPlF3QP880bIgHM/oNH1loEXnJIAh7YuhnyweTvxG7JF6H1DPhbK/PJJWC3
	Pm26Q8cnakJmnOvFMCUIApmNTLHpsZJ6fkdaUYE+gtqJA==
X-Received: by 2002:a17:90a:e706:b0:368:ed92:6f6 with SMTP id 98e67ed59e1d1-36e2eede4acmr1636874a91.1.1780456097562;
        Tue, 02 Jun 2026 20:08:17 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36e0a186741sm1247102a91.8.2026.06.02.20.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 20:08:16 -0700 (PDT)
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
Subject: [PATCHv3 3/8] dmaengine: ti: omap-dma: fix CPU PM notifier leak
Date: Tue,  2 Jun 2026 20:07:49 -0700
Message-ID: <20260603030754.288757-4-rosenp@gmail.com>
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

The CPU PM notifier may be registered for needs_busy_check on omap2
rather than may_lose_context on omap3. The remove path only checked
may_lose_context, leaving the omap2 notifier registered during driver
removal.

Check both configuration flags before unregistering the notifier.

Fixes: f4cfa36dab67 ("dmaengine: ti: omap-dma: Use cpu notifier to block idle for omap2")
Cc: stable@vger.kernel.org
Assisted-by: Codex:GPT-5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/ti/omap-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/ti/omap-dma.c b/drivers/dma/ti/omap-dma.c
index 15be3c90440a..0ad8da8b35f8 100644
--- a/drivers/dma/ti/omap-dma.c
+++ b/drivers/dma/ti/omap-dma.c
@@ -1854,7 +1854,7 @@ static void omap_dma_remove(struct platform_device *pdev)
 	struct omap_dmadev *od = platform_get_drvdata(pdev);
 	int irq;
 
-	if (od->cfg->may_lose_context) {
+	if (od->cfg->needs_busy_check || od->cfg->may_lose_context) {
 		cpu_pm_unregister_notifier(&od->nb);
 		synchronize_rcu();
 	}
-- 
2.54.0

