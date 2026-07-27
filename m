Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D181343B482
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184892; cv=none; b=HMQ3bMRCShHUduElIJfRTQo6H1ix1w/3Be32fvFH+4CXfjZoo3LoKkQkThavE3mPCxlodN9KLAH4+5VRZ31vbY7NepIhdH0e117eP+uj/KM6aK6xawOBe8FU/x1qZ5wsZyx5/lan6YXnEJqOy6qsPrVNd4XfFlAxS3xmvSjwVlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184892; c=relaxed/simple;
	bh=tMRDKtsorJv19qh4QIBQf7AjHv8Uu0NRMvUjf0NFpmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ITQW6dSJ21xR7TtDsU4WH/yuo5nzmxNnwPgEIFbYhTuVohodS45xRLnP2Ea0yJ3RmyuE5xQ0oBSmb9XJ+tczQYteSJ/T80FVV2YRvFxwjbpOcqGy8s2Q6PVumvK4uHsNH2KWbzYiU+f6jg5oLga3QBOTRgiFu8K9/Tz8QFIT0as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cte2Gofa; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cte2Gofa"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-84861fc51f5so2449698b3a.1
        for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 13:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184890; x=1785789690; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uq203R1ZYb1EoosBcCQ2LhjDPAR7gIRz0Ot9zI/XvNU=;
        b=Cte2GofaPy1ynCY24f73+gmwADoYz9jz9o2jwz9NC6UdhJbVgdmHO0X8aZS4rVZZup
         N34+ItmnL4fFjAcyiLTFrQTgsP1Ly8ZOaOxJWjsUrCgUGPT/eFPbuy6tLNlBxtSUKiCD
         nyLKORu58eH+lSre63zKbON9Hu+kfiZGbk2dfwwm+loWGyzN8PxvhYuZbKmwBBxvfQM2
         LlxiP90YOqxe7Yw8YSdcV9R/Nk1iRJimU7IOfD2fpj7KQNOTHAcYGDDlNHgdQIANsGQ6
         lZHmLBIL9/r5hFyHO/cMz49ztbzvLIgd2N8Mrz5ZQO3QmJK51+4TfV5/YDHMZ4xrJYVo
         qICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184890; x=1785789690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uq203R1ZYb1EoosBcCQ2LhjDPAR7gIRz0Ot9zI/XvNU=;
        b=hiIaWOOynU7aInLxJxegb9FvJ6FnyRafKHjQWk3CzlqTzQYViHSdWZyTXbXFNmXNeV
         7Zt5j+PVOJxxWO2xF5y6/63jGDrOG98zW5b6iGE5HDiAjUhXUB/9tbn4HpYHVYH1TtBz
         DfsKhLiU8n0X1hNyfJHaUsp/iFk8/RqIErg4kyGu9BN24qZWjKxPSVtxusxDfWQuJyMZ
         7r3n8nLuScNq5gw3HOrg+F9XzGhc84em8Q5cp8FhiBzmxKRj+I6UMV+D84rwM0MNAU6J
         lybinpojaLu0mWMZbOXCYKI8GkxWXUQDiFFaahb694b9zq731dKYV2ISpPxyMh3lOuF9
         SrLQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp27vr1vOXABM2McljREyKLdTqOR+h/6EvVvoz9XwlfQ8qKKokF/8J9uWRWlLp9QtJMe3iBoRbcnVQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeHFxYL3iOlMlm1wbKJrVCct0gINRdFxzhwTC06gcQNjo+uxDz
	tEtvDzCLeND5D+BX6VRnWMPfCKoKPAm6v2pneCr+LMKa59hYqLHeUiw2Lvii7g==
X-Gm-Gg: AR+sD10ZMaGtC1G+pd/vCslq1H/Zt7Ew1iMXmwl/KQv/TD3J1pZyyEr7UO845G01k70
	lwqH8uJCYrN96XUKiyFmy3/3KZDEQ+NWaPAd7uw9glgMmG9scbEo8Wu6NbVhDs+9SGzK4pDo7zb
	9v02PqaUHvFenGRHT6HWiwxeqTvxfny3xzfUjNIxvA/3poZ5P0RVxatQbfzVdykmWIeiNtvmcDb
	TK8VU7JtEQ4eJ8GlqfovBI//bAdNBSDoitBJScgzgBbYCoio86LTUDYhq6abU+auwxmCTCeCJ8o
	KYM92RBkOLgzqOBbGhCrg6IhpRw2Iz9zz4Pb6oZTHB7ulm2I5QiD9CNBwwXJNa5Rt4gXttjGLoR
	H3QTFVdwkbfNdtqhMohm+iK+aeqs1vmArTrD65RDiUPwCfIcqfuKPGj3m3PPKwf3DCH4JDHAMS5
	vKenbX
X-Received: by 2002:a05:6a00:a88e:b0:848:41e1:473c with SMTP id d2e1a72fcca58-84e8d41cd52mr759600b3a.72.1785184890357;
        Mon, 27 Jul 2026 13:41:30 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533d1351sm3583338b3a.39.2026.07.27.13.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:41:29 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Sinan Kaya <okaya@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 62/64] dmaengine: hidma: defer callbacks via channel BH
Date: Mon, 27 Jul 2026 13:39:24 -0700
Message-ID: <1648cb3a6b6c85009831e1dd263a6336bd31638a.1785183549.git.allen.lkml@gmail.com>
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

Move descriptor callback processing out of the low-level completion
path and schedule it through per-channel BH work. Drain that work while
freeing channels so callbacks cannot outlive channel storage.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/qcom/hidma.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/qcom/hidma.c b/drivers/dma/qcom/hidma.c
index c939635be21d..1f875a499ab3 100644
--- a/drivers/dma/qcom/hidma.c
+++ b/drivers/dma/qcom/hidma.c
@@ -90,7 +90,13 @@ static inline struct hidma_chan *to_hidma_chan(struct dma_chan *dmach)
 
 static void hidma_free(struct hidma_dev *dmadev)
 {
-	INIT_LIST_HEAD(&dmadev->ddev.channels);
+	struct hidma_chan *mchan, *next;
+
+	list_for_each_entry_safe(mchan, next, &dmadev->ddev.channels,
+				 chan.device_node) {
+		dma_chan_kill_bh(&mchan->chan);
+		list_del(&mchan->chan.device_node);
+	}
 }
 
 static unsigned int nr_desc_prm;
@@ -155,6 +161,13 @@ static void hidma_process_completed(struct hidma_chan *mchan)
 	}
 }
 
+static void hidma_chan_bh(struct dma_chan *chan)
+{
+	struct hidma_chan *mchan = to_hidma_chan(chan);
+
+	hidma_process_completed(mchan);
+}
+
 /*
  * Called once for each submitted descriptor.
  * PM is locked once for each descriptor that is currently
@@ -181,7 +194,7 @@ static void hidma_callback(void *data)
 	}
 	spin_unlock_irqrestore(&mchan->lock, irqflags);
 
-	hidma_process_completed(mchan);
+	dma_chan_schedule_bh(&mchan->chan);
 
 	if (queued) {
 		pm_runtime_mark_last_busy(dmadev->ddev.dev);
@@ -203,6 +216,7 @@ static int hidma_chan_init(struct hidma_dev *dmadev, u32 dma_sig)
 	mchan->dmadev = dmadev;
 	mchan->chan.device = ddev;
 	dma_cookie_init(&mchan->chan);
+	dma_chan_init_bh(&mchan->chan, hidma_chan_bh);
 
 	INIT_LIST_HEAD(&mchan->free);
 	INIT_LIST_HEAD(&mchan->prepared);
-- 
2.43.0

