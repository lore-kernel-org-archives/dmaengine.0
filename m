Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F383642903D
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184812; cv=none; b=XUWlTwHvk9sATXNjVN8oY+Jew6avq1OTrwbF8ccqDYUGr3Qq78JDJLlWXRj4cLrdP0iMgIPyMGdravFy140lfX47xZwQuedqCeHsTniZ68njrQVFt7FiJgIMyUCN5rViF7Jw6TPYoKxy/pdzZWcc0N7t0OBt/FreTo5WFEaVJNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184812; c=relaxed/simple;
	bh=qp01uDsAO9Xr1IK9DLn05YRNAeKa6fMPBigwOWpIhI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hIzlWLEuMJllHmwvy1LweVDrZrij0uahAFj7L+H3FAd5yj3XOsW9mMhGIr4PhV79M99GjNOFmuXk7dOmpf4VgMEKuNDe+zxAMUgJB6QUptyeqGkkQRYRlB4nGIo+ricvv2yEUFlOthmcGa42mDNk4FN62xbjdM57MF5gYZhDIu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lMGqvmY6; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lMGqvmY6"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-845c92bc464so2608001b3a.2
        for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 13:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184810; x=1785789610; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IgI+ijDqRF9Cm1JOtFQYfvEWTbPsdipHYMQSOr/erIA=;
        b=lMGqvmY6yVHibtj7XTxKhnWQRXlsL5jT1EFyCskrYwcCv3aq/fl3U4ojTWzs5x3gS0
         g9uVphGpmo33XKXZguDGsaxqzkonFeZHmogiL6PEb1oAHwih2gOIZ6JWQQwk35do2j0G
         TH3gaXOBMU+X97VDauXz7kvtVhT0hHGjNBwnSybp1/biU3/vmpeEQsrqcYDbSRkWMi60
         PHoqh5rrUEdL818kIbNA+efznm+t6h6glYNeljswvbPow92DTUQt7WUZhdZzuHgYWlgo
         GA+HXt2NOU2KQvvNOcygUjhpQf0PlOLwkEScsx/DIsJsFAtSHY1RrjEZYMFyt6pvC50g
         OKHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184810; x=1785789610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IgI+ijDqRF9Cm1JOtFQYfvEWTbPsdipHYMQSOr/erIA=;
        b=NO6UuQWnSKoVJTr+CVev3MxgMS/+ohcZDe4rmopvCjtjAm5VHXzVjfLeTBIL9sI7gi
         Xf20tjYSRFzRU0Mii59uNgATj+77N7/SR/UG5LnEyxDTcaA7hJqwfgHMzQMlFRLz6lzD
         /LMC9n6YjhJHRkhh4Hjff3vn8uRtggXg12x53GhAq3dwQ+J7bVs97JlfmnZQFj+MuNUC
         eKlDJyY+EbIDg0BNnDv0B7HCm47Z45/K8JcapeaXVo7DoVaB+HeHQMG8zhmoQNm8FaaZ
         c/UgbzlJNOsbG+KSix6BiLkI/FOyLjXbM5pdYw36G8zRSUMjqDwM5c4WGIA+ilIj4t8x
         l/kA==
X-Forwarded-Encrypted: i=1; AHgh+Rqc2nXhtbQZH+C28sj2HOltlaZ67Ku1GPjbTOoLwKZi+j0WEQ7TX1PFYerKZTvmlflsavlV5AhlZSg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGwvicHfzYfGgeXXzuKaMczMbUZZysezO82j5PU/zb97NwZnfU
	hif8UdH/s4/5zqs0NCZSIYavX/0H0j6sdRXiuy6UVPxISefzViCTQjU3BTH2uw==
X-Gm-Gg: AR+sD11njX5fPpbIEZEOF3vjXRqMQPAwrkqG7mM38XZSSY4oW/8xDUUuhjBvlXQSHes
	nVt/CBnjKKFleV+l3GhpuueUOKSFSCCccR+4pm8vX6rI8kCfw4UYkAkvy40tZTb9kS3truGj5nu
	lgz+wDdu5pyeocBWi0HhiYyMCJyPuHDa0HDuMQFr/BUuYO5gjXdaVuwibkkWs32NKMe0QKv3Soc
	7niwZNy/WvjTt131UpxKFOnS0aV0NELBVp4JdFxUpZpjUBodWqakazahepenRUbTH5NJw+wVI79
	d1u2Ilr1EkGVoVDigo/+/FxEGXaP4vOf0cDFAWvcI4GdVH3COb2xyaD8eT5sf+YCg9OZlyXm1+3
	2PDjIqmcQm4c3F4cUmesl0RNuowkpLNe4iBNaZVDDQT340QRcKp636RM0fa6ozH7E4yeRcWnDoV
	Id7n0a
X-Received: by 2002:a05:6a00:4213:b0:84e:24df:3873 with SMTP id d2e1a72fcca58-84e59498aa8mr8341625b3a.32.1785184810384;
        Mon, 27 Jul 2026 13:40:10 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533d1351sm3583338b3a.39.2026.07.27.13.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:40:09 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev
Subject: [PATCH v2 39/64] dmaengine: fsl-edma-common: kill vchan BH on teardown
Date: Mon, 27 Jul 2026 13:39:01 -0700
Message-ID: <b0bf2faa89ea57cfdd9da400bdacf41fae75a6f8.1785183549.git.allen.lkml@gmail.com>
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
 drivers/dma/fsl-edma-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/fsl-edma-common.c b/drivers/dma/fsl-edma-common.c
index bb7531c456df..70b40e60c39a 100644
--- a/drivers/dma/fsl-edma-common.c
+++ b/drivers/dma/fsl-edma-common.c
@@ -915,7 +915,7 @@ void fsl_edma_cleanup_vchan(struct dma_device *dmadev)
 	list_for_each_entry_safe(chan, _chan,
 				&dmadev->channels, vchan.chan.device_node) {
 		list_del(&chan->vchan.chan.device_node);
-		tasklet_kill(&chan->vchan.task);
+		dma_chan_kill_bh(&chan->vchan.chan);
 	}
 }
 
-- 
2.43.0

