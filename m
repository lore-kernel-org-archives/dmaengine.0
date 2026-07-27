Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56D7431A30
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184834; cv=none; b=I5PKAnfoYza9wRPmBcAvKrMYSJhekyOJNuanOPlTEP5ybLNYpMO7CWUdEJ1N3Lheug+qeD+WtUDyjPB9X4qpR9JcDAMezsDyjTQKg0gZDq1EMc0HgfwcQh/XFeVAk6YzxvXPxPScJLMiUPA7dFrllLHZZYdQDu7I4xHxVQYHhdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184834; c=relaxed/simple;
	bh=ad41UXJMfOEQb8wNXSqsTLm9VUwCcsvBLe7BxK2QHSo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PtT/vv/Wy7b9gvDo12Fj2NOOm1X3fxcmCftcDIUTHBuO96m/f5i8lQYtmMmc27JaEtYEESEX246krJc23gX5rgcb0MQBJC7e8pEuJkpHJGEMeNLLUSk+8WM/c6y8KAEZ5EELvaTH7bZAsI0Dz3UiVwpZeU/TkD84eChLazcRCWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aBygaJTM; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aBygaJTM"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-848d21bbaffso3240819b3a.0
        for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 13:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184832; x=1785789632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sjx+7tR04q8WCjgsUYMcsHB4XmblQgjVAPwj0NbvgUU=;
        b=aBygaJTMlpK04Hxw9VfkjosTg5ZyJq/EaTSbAlqGTXnYXSZT7r1hGyHqcoYeyuVMyJ
         kfFbGufp5ftui8c/mdTZtIfdeZSo5xVinTp/PJCznFIgqF2/FVkJPbpgIQaao0eonRfH
         kLYBp5bXv5YRw40WtVnQWlyC677tXc3pzpNS8HrRf6zqUGFhxGiT6bZO2jVrpO6+B/E8
         WJmnkdzpuKTtpMfAFZxg7caN7BC1jGPt6UYXafeqmIPEoDxnZyGUjVb4BoXUnenmSPUB
         qSyaMDL2mZEed0UAe9zFove9eP005gS7hO2RVhOzPvVUkONXqlyCGb3FriIrv09RqIE2
         Fm5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184832; x=1785789632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sjx+7tR04q8WCjgsUYMcsHB4XmblQgjVAPwj0NbvgUU=;
        b=Aw524wIOi/f/hmIoOUqm6FlLjuMVe+EAumWeSJ4QflyRScQPEO5meXxRNwZd5RSHwz
         0L6yqzz6T2FfC5/LIkGiAIm1C7JkqSKz1tQDDoztcvOXP5DYA2SelNOjJmfORiblYml2
         08Flc4yOfyiELkBrDhQQodNykWqtXm7fo1QCRuwbdk72FJInhtRqLykpEcLjuKlKyfWg
         5eZb0iUESNOJh4EPZwPAoRHGfGaHFyK0qa5nHhIydteQin5Sqg50saEUySExx+ILog1u
         XRvWhqhB3rKFOOlakMcy6MGTsGkvlkVxZs5WKkYx3XgB0XWbM/6A9m8t6fZtaKX0awYH
         KReQ==
X-Forwarded-Encrypted: i=1; AHgh+RraoVhkLULUVV58kqH5NHCwplf2Icdv4ZByNwOO55xypH5T0yrnewA4EDf48LwcSKF8CQcq0vRlm/k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0FB56DeIgnW7EkMQd8S/rc7UOqS4QQ6h2aLYRe/eQSe91RQv2
	U5CrHt7oWweBMs+l3MLMT+Csqe1wCCRsu0mTJrajPG71X339d6ljToAd
X-Gm-Gg: AR+sD102yDYwexWJh7N/TiBdt5aFh7IQt18FuE2HVjtZyGT/VLZJ0/houriKxF2BMsO
	Zyy+YLcVqJwU6FMlUqgg0trtP1dYN/rVBR14bBl2/mXto0SOQZXQXY+qJt5cVUSWgQJLitCIgTI
	3D+DBLkOx+J+X15kFuN+QDMgnslfoIBx/0CBtXCkzS8IhnrEP64TA4oR9GZQAewil61ZAFIG4/p
	rYo8DqFui22Uwu+0OcMyDnkbE15VUZEoRnGoVwduwksGRC6lfcKoL7wJEQFWLtIBOMmfSPzaYpX
	+YEl62M1HsHfRL5J4AOqPeyR36tsx6HCnf2gzl97ylrqQRS3R1/NA5OI0Xc2ZoY0KPonZuGWN6D
	StEfyB4Jk3hT8LM18u3X5nTphfHckBuHNTvhRuOS0RBBxa4Ok+Jo9dF6NsQLtCh3v4cpcIJE8kN
	ALNLfZ
X-Received: by 2002:a05:6a00:4ac8:b0:84e:165:da65 with SMTP id d2e1a72fcca58-84e8d0f92e2mr772302b3a.64.1785184831978;
        Mon, 27 Jul 2026 13:40:31 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533d1351sm3583338b3a.39.2026.07.27.13.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:40:31 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 46/64] dmaengine: imx-sdma: kill vchan BH on teardown
Date: Mon, 27 Jul 2026 13:39:08 -0700
Message-ID: <10f4e15741836cf24f08cdaf935da3260dea0250.1785183549.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com> <cover.1785183549.git.allen.lkml@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use dma_chan_kill_bh() for virt-dma cleanup.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/imx-sdma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
index 36368835a845..46f66e5f9f30 100644
--- a/drivers/dma/imx-sdma.c
+++ b/drivers/dma/imx-sdma.c
@@ -2399,11 +2399,11 @@ static void sdma_remove(struct platform_device *pdev)
 	int i;
 
 	devm_free_irq(&pdev->dev, sdma->irq, sdma);
-	/* Kill the tasklet */
+	/* Kill the channel BH */
 	for (i = 0; i < MAX_DMA_CHANNELS; i++) {
 		struct sdma_channel *sdmac = &sdma->channel[i];
 
-		tasklet_kill(&sdmac->vc.task);
+		dma_chan_kill_bh(&sdmac->vc.chan);
 		sdma_free_chan_resources(&sdmac->vc.chan);
 	}
 
-- 
2.43.0

