Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CA91D6BB
	for <dmaengine@vger.kernel.org>; Sat, 30 May 2026 00:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780102028; cv=none; b=VLpO82F6D8lR89cywF0MzMG8cgxWkJq86Ey0c/D1r6dMfC+b7ihZEOtM0C4tXhKBDrPhQqMJcJNpqE3+0bFRDUOaFw4L8bHJOTX4hes95X2s2w4VKlcPYG/6sZ8ua0d+3J6lsD2Hdy4tDleCFr7lG6Dk2l+vAfCBTlwj6WJSJDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780102028; c=relaxed/simple;
	bh=jAP1iU3jk2BplcKEfUj40peyaJ9Vq+hgp3oGNJX1Zag=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YsZ2aITvpE2HxuGc9IofN7PyJIrKhpm/KgQHMXgn6S3b3Ml3wX0JKHjXRNl6eVGoRKb4QUSZccTpyLuSp3ZDBeTKjM6I6lFPNe+PFzqFfygS3Lkvv1g8WYIl+jcGiAC2KyZqmQHRIdmzyh2bbBFUXlGzPPTZfFUQlHL7LL/uZpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NLL78CNq; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NLL78CNq"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-50fc496c8baso159156061cf.3
        for <dmaengine@vger.kernel.org>; Fri, 29 May 2026 17:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780102025; x=1780706825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YVTB6NuLGwCrcvRiceoAwSAM7RIs7a/SwGXiXJu2gTA=;
        b=NLL78CNq9+31F8jUrwDDzPzfom8gy/DMdvChtIvauNdCbbWp7SL8rgPvOjCvs3BDbl
         LdzahPy3BRWmPHB/nK6OSZTrHbRS6m/TNL9g8ZqtLzFntJnwQMjESinI9kzuZp06qNxb
         0lSDdbcLqb3Y3dNlUxOlfVSjp2AGG3B8mAPuIcFzxSiwTHmDVMiS7MNqJX5Ue+MRdNdZ
         gaZJkngPEkb0AaL3EPDVdVmPsrySULB4lyoJ9wTTbCPQrdpBZ9g/g4h4L8R3/a81jcTF
         iI1E2YVRrcU2TFLPEjYRy3RrRK9MgnK9/ZVEhjUGjtH9ntcC344YFmeyXAvO3EmHrn8E
         kLJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780102025; x=1780706825;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YVTB6NuLGwCrcvRiceoAwSAM7RIs7a/SwGXiXJu2gTA=;
        b=gyqAM+KKSim/7Fv75hGeW4Hscqonv1kcJfHHH1XVEVpAOkbhaN4r8/k9CeyWlBmBPB
         Xo8BlhfP6MvXuOAHUVe3thCL6iTXQXDuX+OmNL+869Q/apcj74IaRElcTwj0CTSWmkod
         WeKgSu7EP4NCIlfVtipLgtch5Q4oQ1IgXoCz+d28fU4JuVDSIytzzpiP9cG/x/AIDYaJ
         +sZfN/WHW78vEfGTJTZV7o9VJsrPLMhkZuxkUQF5eBWksUUoB1udCkrPkMJOYhHvjh/D
         6uzupC46dYcehAoix3wu9Fx21uPy3FdmpAVhyu+JUh861Abdf6VCeqSQMzN8dTO0xZEg
         0QiA==
X-Gm-Message-State: AOJu0YzEKXtAZMEAcBVU6Wv1uEWqucCBlfaVcBsNeMtbBAFbZApe6hyQ
	ij+wYr+HX7YlObIZERIZbm1OmJ5v4WT4m5hKLvQAnoakIFFVH3rR3Hn+NBq5dA==
X-Gm-Gg: Acq92OGgZW3jGpsYq8wGzjDckveyxn4DOWERXJJ30JRwjtOBPFRVAF0wgITL3XniUzP
	z63WqUbuOq5tqiW22T8zJajOQzzINBvtZ1IIt92VIZ9DUIrGcbjGFOfWNCWQ8j7TP7zrs1ml/Tq
	na4CXK2RxrhM3PaZVDMK2t3LAOU2tbAKpfbneud+rogXZywXwuYfQ48pyLjvsAtAgCSMS10kErQ
	nJOs41J917Z4iC0YwFfMjRsXykegPvept0Ib5y+JzDgYYTncutwyOAowrg+2dU4q360fbyBxYX6
	uG6jTz51XrqajDmKteJvXYix3+eU5h2koy/se66uIcloPMAhh+e58jt9J/VDIXhn+XYD61gTw3m
	i36KvZXEFbM8evIU6gILoIbl3qD6u6KynQFKKT5xawMyafY3CCGfG7RdmAmJwc0GDLHtihTc6S6
	d9hIsS8MNi+c6pffWNPoghVUEPa9FHQJ+GIBcB1AlU8LF6F92oSQIfB3m77BLCfHyWweiUfJ/Uw
	XJoqfeI9iKtKvjMa5vOkde1Hwq2czkyUSd1THg1yMFiOg==
X-Received: by 2002:a05:622a:17cf:b0:50e:a1ab:67ea with SMTP id d75a77b69052e-5173a7d7d8cmr28243011cf.40.1780102025514;
        Fri, 29 May 2026 17:47:05 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5172eb71624sm34780791cf.22.2026.05.29.17.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 17:47:04 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] dmaengine: bestcomm: Enable compile testing
Date: Fri, 29 May 2026 17:46:47 -0700
Message-ID: <20260530004647.43388-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow the BestComm DMA engine to be selected for PowerPC
compile-test builds.

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: remove PATA driver change.
 drivers/dma/bestcomm/Kconfig | 3 +--
 1 file changed, 1 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/bestcomm/Kconfig b/drivers/dma/bestcomm/Kconfig
index 5dd437295964..153b5492c93c 100644
--- a/drivers/dma/bestcomm/Kconfig
+++ b/drivers/dma/bestcomm/Kconfig
@@ -5,7 +5,7 @@
 
 config PPC_BESTCOMM
 	tristate "Bestcomm DMA engine support"
-	depends on PPC_MPC52xx
+	depends on PPC_MPC52xx || (PPC && COMPILE_TEST)
 	default n
 	select PPC_LIB_RHEAP
 	help
@@ -34,4 +34,3 @@ config PPC_BESTCOMM_GEN_BD
 	depends on PPC_BESTCOMM
 	help
 	  This option enables the support for the GenBD tasks.
-
-- 
2.54.0

