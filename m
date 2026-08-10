Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C93143802C
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786385607; cv=none; b=g3Nux6QfxsOrj1eB6fAerX1KOXDceCgKaX3IvQo6LAWteI36G7v7RmpLCwWEbpY4mXtJfbJYpTrjiA6tOEEW7UIbsg6q54RBsa3E6BwqhpsBQFdG+MvlcWmwo4GdZiRXqswXVkCUmD0pyphl+PjEUOPSr9HHPS5oJz8/LzXi+PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786385607; c=relaxed/simple;
	bh=2nuh6Z1Kkq14n9+zhbeh9dCMiubMvdPS+JVbv3NKu2w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ToQHxzASwjzM/Rsb4e3Q30VS2G6EVKx19620gpE5N/jnjS82X5s8GhWh5NvzyVTCJpRPZZRQRvvj7xjXiYUiifmaVQDf1WNFCL+MM06rutRVYsTEBGmU4p0Gtze1JEBaFbkPJ/reG/lHh3ZrwvxY9DqejRKVBSo8sv8EYGDsBeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m07gKeNe; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m07gKeNe"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so2479154a91.0
        for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 11:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786385605; x=1786990405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9we2iJf7L3DYPmN/0K3SxX0/8nMk4gHEEjHlz8llkHE=;
        b=m07gKeNeUtGr4A3NcYjlYRiJHTTLua6CrvFnA4/xIOF7YXFejreoS7r19zEzKGLBcg
         3Tmu7ywSQDgnzv1U8+Mp8Dl50wKOGnR/GPuHvGkLLrrYD1AggPmntbhgSzOxdYt6CjPf
         gQcBRzWLLwmmVe0KuF5gSRHK2kywIklnnnjcFLGq+f329+Zfp+Oe7YFQcWEQZVmXwqGY
         p9j+jmhv+tPdPq/CQkfvSb0AJuXzUH7xl4jFTmGKc1vVvt2/jMQq3Tfrlhc8qEuzU11p
         BlmWFKSfaQS0Ht8aNAZG1YdsIjbVVSTEkC0iY6nVOZpnvxYU9SVSQYZgauUGmcbc5YqO
         HcJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786385605; x=1786990405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9we2iJf7L3DYPmN/0K3SxX0/8nMk4gHEEjHlz8llkHE=;
        b=AXfFJTwWk2mqYz8EHpgAwHyNGqF+lJXjdBRpbQG0sb49Qu+dfzWHPqje0vXGGXDjby
         uqxJCI/sjgiwqGpAxOQ3Czq/iGM9le4YMiszxnR5X+sXgUhAKERreypiFb5L6a5JW7Um
         mdJAvE+AebrAsu4QZcJSRnZFzPxBMEmH/09GFMOARjQmossApFHmsGZtVlbRisKeqzu0
         kR7nGpW6tc1cp7MuVzEqmr0DfuAQdCAjzk6nz3/SgX6RvsSAz4tXeziC0hCwuDKF3NzE
         gt0D8MARgMRMW3nIWw9sCRwxPdUKspKo0coLuLbeGfQteZCMUwK4Y7/Qs9Ewf3I2qJGA
         upmw==
X-Forwarded-Encrypted: i=1; AHgh+Rqc9DgB8xAy+RCl47+7+yGAoSE8XtXZp4LLc0i3XmHXSquPONQymXvK4hkpQEfY5hMNMk2sZUlzV2A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxL7rP+/GjJKP79VKHmiAGyWbiKz/0ptZuOZgNVVaF3359NB/L
	fRYtp3x1REya7+lqXVlWBgwh1wDOUifWBg8OqZT9EDGWYTqIIX3mGTmX9CeVLQ==
X-Gm-Gg: AR+sD13fa1nehb9y0vM0KNMuaCimjYTSqc8Cl37GSmL26QEj4G6tALWHgIHD5mtpN8t
	XlCjNruJd7Ki8jVAGWxGuyHU59Ykd8B4pXtCWvPSxfKe8CEuzIiEsOQnZaG5450kGuFayYgpqyO
	JNrG/+yrIicEPMtYLkIETxbfl25ye3qWtOSMsYJUs9GFCbV8y1NQMZQR3ELR2BlcvRGsXdR0Ylz
	est6SgGnEvrPp/zZGJXSxZ8jLe6MnX+RAYCnfECcnYeLyhNbzsxbC9JyIwgus3vunSEUW10RUyD
	NhkCTIwAn9dvFYghJfbYDk0vtofEmvqsVLi5SKNPaJPIZ08oraxLoRYMrqom3Q9CL5KfTATWT0K
	0G59RwoObA0Iq8xKgTyTCFLzc0hj03iwlRdNWPXjhVZQMvdgLsQkYkmE6sn0yx5tX3kJL0aRnnn
	VH3+V4apwKtDZmcbzVWT8qQ/6t6swLMz+2FeMnIhPDrJmbJEI8BKFdrSCqj8NASU8=
X-Received: by 2002:a17:90b:3bd0:b0:37f:c97a:939f with SMTP id 98e67ed59e1d1-392cc993355mr3293962a91.7.1786385605506;
        Mon, 10 Aug 2026 11:13:25 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fa9:fa00:b1a9:6513:83c6:1d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d53b873asm472795a91.17.2026.08.10.11.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:13:25 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Olivier Dautricourt <olivierdautricourt@gmail.com>,
	Stefan Roese <sr@denx.de>
Subject: [PATCH v3 30/34] dmaengine: altera-msgdma: use channel BH helpers
Date: Mon, 10 Aug 2026 11:09:31 -0700
Message-ID: <21c92aefc28557597024ee450f1690761ba6d452.1786384169.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1786384168.git.allen.lkml@gmail.com>
References: <cover.1785183549.git.allen.lkml@gmail.com> <cover.1786384168.git.allen.lkml@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the device tasklet with the per-channel BH helper so completion
handling runs via dmaengine_*_bh.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/altera-msgdma.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/altera-msgdma.c b/drivers/dma/altera-msgdma.c
index e23e5b441a24..c8e145cea6d2 100644
--- a/drivers/dma/altera-msgdma.c
+++ b/drivers/dma/altera-msgdma.c
@@ -170,7 +170,6 @@ struct msgdma_sw_desc {
 struct msgdma_device {
 	spinlock_t lock;
 	struct device *dev;
-	struct tasklet_struct irq_tasklet;
 	struct list_head pending_list;
 	struct list_head free_list;
 	struct list_head active_list;
@@ -684,11 +683,12 @@ static int msgdma_alloc_chan_resources(struct dma_chan *dchan)
 
 /**
  * msgdma_tasklet - Schedule completion tasklet
- * @t: Pointer to the Altera sSGDMA channel structure
+ * @chan: Pointer to the Altera sSGDMA channel structure
  */
-static void msgdma_tasklet(struct tasklet_struct *t)
+static void msgdma_tasklet(struct dma_chan *chan)
 {
-	struct msgdma_device *mdev = from_tasklet(mdev, t, irq_tasklet);
+	struct msgdma_device *mdev = container_of(chan, struct msgdma_device,
+						  dmachan);
 	u32 count;
 	u32 __maybe_unused size;
 	u32 __maybe_unused status;
@@ -748,7 +748,7 @@ static irqreturn_t msgdma_irq_handler(int irq, void *data)
 		spin_unlock(&mdev->lock);
 	}
 
-	tasklet_schedule(&mdev->irq_tasklet);
+	dmaengine_schedule_bh(&mdev->dmachan);
 
 	/* Clear interrupt in mSGDMA controller */
 	iowrite32(MSGDMA_CSR_STAT_IRQ, mdev->csr + MSGDMA_CSR_STATUS);
@@ -766,7 +766,7 @@ static void msgdma_dev_remove(struct msgdma_device *mdev)
 		return;
 
 	devm_free_irq(mdev->dev, mdev->irq, mdev);
-	tasklet_kill(&mdev->irq_tasklet);
+	dmaengine_kill_bh(&mdev->dmachan);
 	list_del(&mdev->dmachan.device_node);
 }
 
@@ -852,7 +852,7 @@ static int msgdma_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	tasklet_setup(&mdev->irq_tasklet, msgdma_tasklet);
+	dmaengine_init_bh(&mdev->dmachan, msgdma_tasklet);
 
 	dma_cookie_init(&mdev->dmachan);
 
-- 
2.43.0

