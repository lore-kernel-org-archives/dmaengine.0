Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB783CC7F4
	for <dmaengine@vger.kernel.org>; Fri,  5 Jun 2026 22:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780696916; cv=none; b=TO4QJFgKuWuY59QRx2sWm6ip5/EiMtsRTS1h8gBDj6EsGlC5XZpSrRC5bccSLaAWgGkNUbyhiP/Z91SNrIGprzmoOeKtBgCXmzGL0lQ7xvs563UAU6CNYzozVs+10lBvpRQ0lgqgShLCY+w+h7sGiEE72UAjdVl14a5EuDMnYsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780696916; c=relaxed/simple;
	bh=Bg1Ph+IpxoVLkz/WKf4vXKiBL9F/M23vAU1d0u4X7c4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pfL+7/6oCi0TQfsqHooKL2ZpW+Z1bNxz0b8T/7oI2izeGT2UN2etOEswBtf+7L00i/MhGNPoObJbUnPlutrgkqVV22BBd70CVsbSoDpYiimWU6m8XPe6AAsYLbnALy8KuxYrbXmkn/JGb4i4bujAGo72Du1BunYv78ohCZTaboQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HyR4SK9/; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HyR4SK9/"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84234c83142so1018166b3a.1
        for <dmaengine@vger.kernel.org>; Fri, 05 Jun 2026 15:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780696915; x=1781301715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W3mpU00CFRN4T3ZBRPTrtzwzlNmgP77kODqdYKCW0Ak=;
        b=HyR4SK9/gqvpO9ZU+iEOl4UgLCLGsilp0aduHPXIH+9RsiofvtIlgEn17SnQ6Eovaj
         /7+LgrnJV4m0hfprf/cvCWOLq2B+DjQCb0dZZLpV/Q67TMP9Ku/zT7WHERPCTopc/fAD
         tOaIRSQQPlyLA88nGMa/PLsi18mLOeKA64wLFVZ1l4bmpOZI1ww+VfjrsRWNBuE7z5j3
         G8gr5VbTPRUTnQDetAB1kKE1Rinn0/SgefijMrXC4caUlsj04yrGBqFNN3Ak/jDQNdkA
         JlzFq+9uk+1aVjMXHr3MUXwH2uE+IkJs4qswwYsC6Dspm0PXe56+snFowrTOnn6KWiRT
         CesA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780696915; x=1781301715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W3mpU00CFRN4T3ZBRPTrtzwzlNmgP77kODqdYKCW0Ak=;
        b=SujoYwHIB8OHddBRUo52+7HBqXbaaceJR7oacP/q043vsT+x9oj1cmNxJ76qRa4Gxs
         9ev86QMIeaaxFSvdpZq2aFHEjV6mZoGRUn53jzUjfdbaJk2Wb7sHMi1Pd6NZJO38Cii7
         WG6+TqbyYAZ17vToreaCKAvR/mG8WxfOaKwG7LBbRa4xrS1bwxuflwde+X/27Q2hbgSr
         7o/dWRkPydOeivNSq1HHODUoMDAY9cGJtg4HdCZ2GOqlp34nc0dmWeT/uCGikZJkMze/
         0dlZMDnqIR7THG/BHJSEeQSGH3GqjXLfQVtOItZYcPuTTCA+m65Z3xLUNMz/Z+mK3/S7
         KdBA==
X-Gm-Message-State: AOJu0Yxt6qJiFIn/NXphHHAjyuWLEkoZ4YiG+bIJLw4Z8/Iza6N1YTGw
	PJGEuIw4CaYgnEarRDJLM271KIxH9sJDEFfWOUyIJb/ZhGlGwhDuk3h1I1lheA==
X-Gm-Gg: Acq92OFRz7SvmvvmJ1rKaQ3JSdl4oDFpArjEgYaflMfK8mNPcS96CE8mcQSnbsPdcLX
	FgttasXyHVouNnXOB6jGb2tbvE06z+EFbbC0Idz5kGFbuPP7Ghtm3ZPWyQMcxnk4stW4yX5CF4d
	4chobtkyluCUezUxriDvwmkTjCV4+/nRk/tJXhY2Lj6OWXKZx4sARnbbGUY/LNTqSe37DsGtSZW
	jiICmaSKm+ALS8kCOKw4G7UOIRre1h2gVmVdn6mqjMC8Su2KA+AwCmOwdK1Nz0kxIrQfeRxmlkr
	6QppyTHqDoQjp3t4/OffRZ0U6Ewc7QdQn52fvpH4HckjOmh2DF2xvFWojq0K22V3CsBc7VPLN1Y
	/BbuJ8f4r2xFPyw+vsM/l0k4LmkpXeV8jPiQVeVGLDI72aODJbGluQ9klO9J+gy250T0xOPeIqk
	wzm9bvRCCTstDj0xrx9bvBjou3oT/Fa5+EBf5XfUrw34TbybdagJCa2+bnGjvSMD78qxi9gKQI3
	5dRfNR2q2rx5kuBiDbsUAEBSOLraLxvlN7dFgX4m7EEsg==
X-Received: by 2002:a05:6a00:32c7:b0:842:422b:259f with SMTP id d2e1a72fcca58-842b0e30c6dmr5022742b3a.10.1780696914650;
        Fri, 05 Jun 2026 15:01:54 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842824a1cb4sm12518883b3a.26.2026.06.05.15.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 15:01:53 -0700 (PDT)
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
Subject: [PATCH 01/10] dmaengine: fsldma: kill tasklet before removing channel
Date: Fri,  5 Jun 2026 15:01:25 -0700
Message-ID: <20260605220134.43295-2-rosenp@gmail.com>
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

Add tasklet_kill() in fsl_dma_chan_remove() to prevent a race
where the tasklet, scheduled by the IRQ handler, runs after
the channel has been torn down. With the recent devm conversions
the channel struct is no longer freed in the remove path, so
this is not a use-after-free crash fix, but rather correct
shutdown sequencing to avoid the tasklet operating on a
logically-removed channel.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/fsldma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index 22d62d958abd..0e2f84862261 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -1205,6 +1205,7 @@ static int fsl_dma_chan_probe(struct fsldma_device *fdev,
 
 static void fsl_dma_chan_remove(struct fsldma_chan *chan)
 {
+	tasklet_kill(&chan->tasklet);
 	irq_dispose_mapping(chan->irq);
 	list_del(&chan->common.device_node);
 	iounmap(chan->regs);
-- 
2.54.0

