Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB9342A160
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184354; cv=none; b=R/3+Wopk2pVYfShbK7gm5RTUntGYMh2b1AcQjjkscdazprLJrqsRkWsIPoId04E1avjpTF0pGyaHkITUEEqkTnSeYh+sxMQHw+d8h6P+We7CKWxnDxt3iQV9xn44VgizekXHUP1pVamw6XS2vxp5KDfmFQiZd9SSLylrU8YsMVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184354; c=relaxed/simple;
	bh=BfjfrnhbcO2VLWkVFLXa6+RW3NO0V5ODITqAYIm/TiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LS3ONq3cwOWdmhDzeWcsh+Ue3xOgeLtdZef+EdD4uFz9taXx1i4Ccz6IJnBtqRpBMAIiLePBza93pqj7Y6dVTBk0SN0llOZ2tdWB4X3x1px9uuJm9+QnWG+CV2UD8npE/IwMSgssuuOlcF17QFOWZPsNpsJeKszas5yBGSELn3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n6MxV5Xn; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n6MxV5Xn"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ce7d2adef4so38130545ad.3
        for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 13:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184353; x=1785789153; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HXpvuPVqT3NSYIRT/XpZ2ZRtWOA79+OnBYVQ1PWJH2c=;
        b=n6MxV5XnWmJZ6+G7NJSlADwG8W6/K1F3zTyey3n0mSuaE7C4qlgZIW0JgVyR1hUwE5
         M/hWNqC0Dt6miOH+1pfSBqDKLQkLkXbxUMaAdYS8hINuRGt66GnGab+MWpZjnkH/G0Jm
         JVvEbSlpBoItz5cm9MLoLUOk2M9BqxTmmOQNgdWCtCq5vH/P0EdWU+wr4Esi1uYEIZIQ
         ccLGf+3eC0jUmPMcBgNAMxCDmJvH+aPqTSNguTW3lQmLehxGzmhqFx93D1G8Nx0OBpID
         fRv5q06vbXvRY9sCoPKey9l1ir1QQZnwqaga4L3dSAS3oW+D+ShoiLYA/Q/YIaaWoC1n
         WnBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184353; x=1785789153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HXpvuPVqT3NSYIRT/XpZ2ZRtWOA79+OnBYVQ1PWJH2c=;
        b=i+rGJ5Cj35JvknvGNtSbb3nq/KTkGV0xHSDnRbvdijTzhOtbaSfeMzKggqFquKA4IH
         uulv5CpolOaHaNPgF42jXFX/DTHxL3Nma7tbqMWsb8ATweA+mFhxisv3iJXHnaOlh5Pk
         lJlVxkCjAXd+kBDEGknR2T5Dn9Kr2Ge8ggD6oWJpwjRFbhpk5AW49mvl+CFIL3YkJWCG
         2d0JBvai3yQnLqbC9Y+SKGykPeoHonmSY8PzG7Ym2nkFbs2833FTYwsdqaTPP1aTipRq
         RYpsHQbSPQwbBXhyl3Dz4sIrij4zs9xINSo/I1e0Ge4UfiPd4IvBPKNZkLya1wFh5sB1
         s0Ow==
X-Forwarded-Encrypted: i=1; AHgh+RrnNm5CQosjvdGswgTWoISELm2i7YSlW82TtUWJlWOz+ghyl/ju4aEWeKKnqBXM/uFxo5BHRXoF7Yk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyO7ANQgpzICfk4OwollSEJ4Hjuqka4lkS0eZoNS1ZBOGrucvvV
	ofVWmQlWMCLf/RUvuZCNyI3jP4FcisOQUx1QEw5DG3klg6lT8UTkp3nV
X-Gm-Gg: AR+sD10PA9i2zEria/dMSLuQztwFGuIlJxezR7WfuzN+rYB8TVZvJ6dUc+xGB4FCS31
	KHZ7vmbxlK3tZEPRZLt0obeeMtPkwgaqyY+81AEHnIQzxN+eeKPqfflU7ERWYV2IHq+I3wMV+As
	Q3gK/xqEcC+2Th8ToOYXE2XtbC+7pNVCl2dH3Hdwn9ul2uaExNWWXQ+7iAyS3OxzrYibRbY2HNt
	9W5lKDl/t4njgnRyxVuaHlamWrxGjqCqI70GiR4hGFzx3uc6a8A3xFcS+IB9FcJPbM6dnAe1BAD
	07jcBUZSaaY/gSzvJi8/ujEBnOAgIRcGWWSX9jWTCgkvZO46Om0nc0ShPNcnc4xXn3P6BELdnhF
	sXN+Plxz/2ClpDfnZIXlXrjDlz6eFtLl/yF9ez/Hpi62IljkFNfCblXFVuNAu18Y9UrQI6npe/S
	1UOUtO
X-Received: by 2002:a17:902:f787:b0:2ca:2073:3119 with SMTP id d9443c01a7336-2cfde86bc98mr94605435ad.32.1785184352698;
        Mon, 27 Jul 2026 13:32:32 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59b768sm41551805ad.4.2026.07.27.13.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:32:31 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Abin Joseph <abin.joseph@amd.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 21/64] dmaengine: zynqmp-dma: switch completion tasklet to dma_chan BH
Date: Mon, 27 Jul 2026 13:28:49 -0700
Message-ID: <72f509130ced9fd642dbf3906d253f5addff444d.1785183549.git.allen.lkml@gmail.com>
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

Replace the per-channel tasklet with the shared dma_chan BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/xilinx/zynqmp_dma.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
index f6a812e49ddc..6291126cdc9f 100644
--- a/drivers/dma/xilinx/zynqmp_dma.c
+++ b/drivers/dma/xilinx/zynqmp_dma.c
@@ -207,7 +207,6 @@ struct zynqmp_dma_desc_sw {
  * @dev: The dma device
  * @irq: Channel IRQ
  * @is_dmacoherent: Tells whether dma operations are coherent or not
- * @tasklet: Cleanup work after irq
  * @idle : Channel status;
  * @desc_size: Size of the low level descriptor
  * @err: Channel has errors
@@ -232,7 +231,6 @@ struct zynqmp_dma_chan {
 	struct device *dev;
 	int irq;
 	bool is_dmacoherent;
-	struct tasklet_struct tasklet;
 	bool idle;
 	size_t desc_size;
 	bool err;
@@ -735,7 +733,7 @@ static irqreturn_t zynqmp_dma_irq_handler(int irq, void *data)
 
 	writel(isr, chan->regs + ZYNQMP_DMA_ISR);
 	if (status & ZYNQMP_DMA_INT_DONE) {
-		tasklet_schedule(&chan->tasklet);
+		dma_chan_schedule_bh(&chan->common);
 		ret = IRQ_HANDLED;
 	}
 
@@ -744,7 +742,7 @@ static irqreturn_t zynqmp_dma_irq_handler(int irq, void *data)
 
 	if (status & ZYNQMP_DMA_INT_ERR) {
 		chan->err = true;
-		tasklet_schedule(&chan->tasklet);
+		dma_chan_schedule_bh(&chan->common);
 		dev_err(chan->dev, "Channel %p has errors\n", chan);
 		ret = IRQ_HANDLED;
 	}
@@ -760,11 +758,12 @@ static irqreturn_t zynqmp_dma_irq_handler(int irq, void *data)
 
 /**
  * zynqmp_dma_do_tasklet - Schedule completion tasklet
- * @t: Pointer to the ZynqMP DMA channel structure
+ * @c: Pointer to the ZynqMP DMA channel structure
  */
-static void zynqmp_dma_do_tasklet(struct tasklet_struct *t)
+static void zynqmp_dma_do_tasklet(struct dma_chan *c)
 {
-	struct zynqmp_dma_chan *chan = from_tasklet(chan, t, tasklet);
+	struct zynqmp_dma_chan *chan = container_of(c,
+			struct zynqmp_dma_chan, common);
 	u32 count;
 	unsigned long irqflags;
 
@@ -815,7 +814,7 @@ static void zynqmp_dma_synchronize(struct dma_chan *dchan)
 {
 	struct zynqmp_dma_chan *chan = to_chan(dchan);
 
-	tasklet_kill(&chan->tasklet);
+	dma_chan_kill_bh(&chan->common);
 }
 
 /**
@@ -887,7 +886,7 @@ static void zynqmp_dma_chan_remove(struct zynqmp_dma_chan *chan)
 
 	if (chan->irq)
 		devm_free_irq(chan->zdev->dev, chan->irq, chan);
-	tasklet_kill(&chan->tasklet);
+	dma_chan_kill_bh(&chan->common);
 	list_del(&chan->common.device_node);
 }
 
@@ -937,7 +936,7 @@ static int zynqmp_dma_chan_probe(struct zynqmp_dma_device *zdev,
 
 	chan->is_dmacoherent =  of_property_read_bool(node, "dma-coherent");
 	zdev->chan = chan;
-	tasklet_setup(&chan->tasklet, zynqmp_dma_do_tasklet);
+	dma_chan_init_bh(&chan->common, zynqmp_dma_do_tasklet);
 	spin_lock_init(&chan->lock);
 	INIT_LIST_HEAD(&chan->active_list);
 	INIT_LIST_HEAD(&chan->pending_list);
-- 
2.43.0

