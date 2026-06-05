Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5543D4135
	for <dmaengine@vger.kernel.org>; Fri,  5 Jun 2026 22:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780696924; cv=none; b=MahXgyxQZFw/crnJNZ/Wz5vm56Ko0oDNczUrtvQPS6znW/qAalMsYqd+wVxLKJk8UAyaO42hij8TqzJMrFLPqu8OZkKO848il2lk1knXV2QUhoFfr/ROCcfltwZQiS6xckKGh6Nd7JcWIh+kZi2PBM1C8WdFX3qVQwqM/2hxXcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780696924; c=relaxed/simple;
	bh=M1tCipKgh6sdfzfNx6Ayc+P63xEC6ccKKNUWUXQ278s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bEcPES3QZJGIVCLCxKnPUuVt/VC1w/AFMZ9VigOjaunS8/aWy5UVD+EA7x1DhkZf8J0KpmQHyzHoKl3v9T6MMbIvQIb6t/npbvrd41M9bNBA/R8bJ1JWQADOs0gf6j8VG6/tiNQW8njXRnzK36QcF6OA6gAWJexOoPqPcWPSCK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=edIntREJ; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="edIntREJ"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84231305a80so1333646b3a.0
        for <dmaengine@vger.kernel.org>; Fri, 05 Jun 2026 15:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780696922; x=1781301722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3h60AiEE0ezQWif9mmBIRZAGzyRJ5Mypr0bfFicKOUY=;
        b=edIntREJmYyeRyEcwZbPPQxFR8U4Cl2O8UEeJEDelDNx9uavBZSmtEYOA4je7RXvJk
         XFz0myFGxYPf4xrQxh/YiaJ4bKR3vAfZ9s3zgMBIvTDCjdWP7rvNadeSMlcIGYHUgOYb
         IrogpyBf8bPWnqeJ6yR6SMDe0V/ANnflsWWB7EDBriMWjH/MW7ZymeHFtAVP1oIUwJ3x
         e9rC/f+EcOCLixUyiRxVVnMa5BbfqnyIpijG0hK23J/izENA4mlEBnqFqizsBjtPSZzA
         0L5ilVjUDwEZ5hU9asLToCWbdbTOFH0UUOkeJLWTm/sITa1vZSy4sba9OiORJwxbacgD
         TQ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780696922; x=1781301722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3h60AiEE0ezQWif9mmBIRZAGzyRJ5Mypr0bfFicKOUY=;
        b=f+qAsSHzEIp3ABXhslt2NZmGt+AKoVds7EAvzyaZcnFq45+YuJh3U/y/WLtrTcPoHq
         pnukU5qHZA5J80G/88rR/p/aFOzg1icE5Yg8FhU4jvdv5qZl5JCBtDpKDihs9YAbghjg
         yNdSTp4aA3szdkXsKDxgHF80ryK20IXJpn80cPiqougY6r7yt5ZtX666wcFyHDw1WTkV
         6zwo+Wuqv2T3tXL/uTRPbGnIKJxqL5R38cghAMQYSZhzd3ZgwnTxneAqpwCym/qsczva
         9NQWFF26f8YVHX+sklOc/jdpLAm84+ZQS5vqTnbEFx4cF4RK6dm/M/67xqiwBVqreSTl
         3zhA==
X-Gm-Message-State: AOJu0YxD4cghC3nIq/CYxNz/WYUmul4eRJS8qBQ1EEGNXUbG+17G/t2r
	2HipOcn1pQgK1j9g1CjrnDIrjsObiweTh00ve4mfwV2HuuuSb59rJrBSqaKpng==
X-Gm-Gg: Acq92OEXZpaYhgsvQH86Y2mDWTB9rl5aZKalLlabhojARadlXkUOcmesRqM9gM3V4re
	A7PKm1ck/VSbPrVGauiNUV8I05JEvS6lqL7iur1gL8CgWgbu8xPOhs1iM/JxuHOfYvUITx8AoqF
	jU4T6DfgacX3lA4XWIal/pwOakWn1/VJgqzCqUNogRmdGhkygYDROZhP1BQYrhmecmhh/YdQE+e
	Za0rg0LXoaHVREZGgNoa5rKsvpxQMiC5HQliySxI0YXVjz1roFPKdRCv/cLGSSt9DBdH9pvebz5
	Ar1D/S4lFOo1qoC2tjr2Za8jpW+wJpIIZvbUPNT0LPv29GAxv0PBQEEU8JI7yLXskezNMjWx01f
	mnhzuHR5VNu2ESFH0L4/5LSmwOi27Y1mKstG58Xy5u/AWlCqU8o/J+0J57RZJusgsEOyhzuM3YR
	bWxOmq4oGMeoRSuAkxz9+h1BT35s4USLDydAVYzxafwUAW2V22srLmAdH7ZQqQJXSq2T3FOz30y
	sx17vhfvULLmzS2vOlUUihFsiXSbYTOuPo7yNVBGYbcqw==
X-Received: by 2002:a05:6a00:13a7:b0:842:48ae:1d6c with SMTP id d2e1a72fcca58-842b0f5477emr5790548b3a.24.1780696922232;
        Fri, 05 Jun 2026 15:02:02 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842824a1cb4sm12518883b3a.26.2026.06.05.15.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 15:02:01 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Zhang Wei <zw@zh-kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	linuxppc-dev@lists.ozlabs.org (open list:FREESCALE DMA DRIVER),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH 06/10] dmaengine: fsldma: convert channel allocation to devm_kzalloc
Date: Fri,  5 Jun 2026 15:01:30 -0700
Message-ID: <20260605220134.43295-7-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260605220134.43295-1-rosenp@gmail.com>
References: <20260605220134.43295-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert fsl_dma_chan_probe from kzalloc_obj to devm_kzalloc, tying
the channel lifetime to the parent DMA device. This removes the
need for kfree(chan) in both the probe error path and the remove
function.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/fsldma.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index 2a6a247761a4..ee6e595c2972 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -1111,11 +1111,9 @@ static int fsl_dma_chan_probe(struct fsldma_device *fdev,
 	int err;
 
 	/* alloc channel */
-	chan = kzalloc_obj(*chan);
-	if (!chan) {
-		err = -ENOMEM;
-		goto out_return;
-	}
+	chan = devm_kzalloc(fdev->dev, sizeof(*chan), GFP_KERNEL);
+	if (!chan)
+		return -ENOMEM;
 
 	/* ioremap registers for use */
 	chan->regs = of_iomap(node, 0);
@@ -1197,9 +1195,6 @@ static int fsl_dma_chan_probe(struct fsldma_device *fdev,
 
 out_iounmap_regs:
 	iounmap(chan->regs);
-out_free_chan:
-	kfree(chan);
-out_return:
 	return err;
 }
 
@@ -1208,7 +1203,6 @@ static void fsl_dma_chan_remove(struct fsldma_chan *chan)
 	tasklet_kill(&chan->tasklet);
 	list_del(&chan->common.device_node);
 	iounmap(chan->regs);
-	kfree(chan);
 }
 
 static int fsldma_of_probe(struct platform_device *op)
-- 
2.54.0

