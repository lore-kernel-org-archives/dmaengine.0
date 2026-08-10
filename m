Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3C0435AAF
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786385574; cv=none; b=fctL3DqwRu29OoQ/FUgjfZCwkq1Uu7+SfsdMH8dzieU6KuoWUIgG0liqdc//nkFFFnbL2NLcG4KHCVpcfVbq/sHfWhbAtRyVqyevbaxX2UFtrlqoDv8oLgc8ctQ/5vAknWLzbczI1u9oreoUuNI3LPBh3jbiyopJFpWmhib82HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786385574; c=relaxed/simple;
	bh=4uAUdRcTYsGvQc18W+1whd/BeJC4brhFOFvRVgZD2sE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q1lkJ8cM/QB3xpBzV0NHDJi1Lr280YNDiSc1ky+mqeb8qRdhxCvJtunEkOJ9Tu6AZ+NSFo9PuuVHb2FSynLftZJBZLm5l/tTwxeJ56d0Xu/mZfEtqCRhw73btDLmbzfJKznxc9xXz+P2veCpW5OkBUicCzt+Bv4si02Ut2fA4ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h7jZJEeF; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h7jZJEeF"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so2478339a91.0
        for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 11:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786385572; x=1786990372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+O3RP4khGolVisKEaJPPZ/5KR4V4I9tZWSXBQpVzFB0=;
        b=h7jZJEeFEZyFI3BXTxR59L8uy/XpF7RpzU4gJcuerop6yHNwSfHQ1icS81G0/fK+Xt
         3wZWXjl6lSL3DvwlE5BMCRR+1Z2kSdL0D/fWKpQMlBq9jzRIC3tVHdHUib0VFJZEU6hr
         cgjZNy1L1boBFDqd5sc/VqwNdMy/MkN29D9wwM6smzDeK4eKoywMPN5HtLu6pbzCvvWA
         Q+qJP17/2u2ObAO1I/1nor7dXOtF4u8oA9o1yYgiAo9s+UiHPfSjUxFmu9MRJJMpLUmc
         RS9R5b025HIabNyIpWXbdLS3r9SHhtg7yYXv+pvEooouBNbbUT687Xcsd7xRvEfK1gib
         RWAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786385572; x=1786990372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+O3RP4khGolVisKEaJPPZ/5KR4V4I9tZWSXBQpVzFB0=;
        b=hzip3xSDUUtzmudzCI5qVkPq7/r0EaH2I8FybpfjHbfIPKYsROogFZPKMuwOHPh93e
         chyTnkQiTxc8Fx+rq8FwrhPdd/YFsbOUfCpi66SKfqej6IACNHg5kuNSbumwIKHVOpsu
         gqEokBarxQvnLFCDe8CTgPOITAxP/F37p0MofGYcHmSuuEFHvRHOAH1uWHalGMhlX6n3
         y1Xa+B6kIsSckCBmnhKFUqQDp9XpWL0ahHZoda78YkgPCbvIyAPDiNci5S1/cjyNJ3ZY
         ZwUbLG8TefU7nuMLanoC1/rjFUGoMd44HATfDOXNeVfmv98zG0FGA77JaLG4Gggri/ON
         PN1Q==
X-Forwarded-Encrypted: i=1; AHgh+RpMyL8hLsX0FwiUOEgud9fpaVQy0OyxJ52yi+5rTcNWX4MR5MXakEX9/GsxijGBLvripynZNIoC20I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5+F/j5eN7XHQCbT9gf5SLKFU8XCRHSyjdjh/Z2R9HRSEkjegA
	T6rxppQ4pGSI4edyu/7yy25dLgAEnSWCrF8UIRXtodn2ZdhlESCexFrHIPZv5A==
X-Gm-Gg: AR+sD13ga6/7zbkKWHQ6rNAVkS7obCG6tbWJhejX0K9hh4yp7lw0pxuZhYfLdD9HCvO
	Dr0Lf/6+EtZ9aGX68gWo7o/mZE3A2i9fFMsowkcyUJIgcrdoRSzmFVXLuMrt3vjXLYMK0UOw6FF
	+J1GrC6rV8dgl0KsSLwXPjohVQaF6ieQhx2ZxbR+vM1ZZVp/eYqGvLCu9/MlOLfh8A+OYnXvYAv
	Brc3CSGn1ZySB5XGtMRLG4Vl5FKHIYOilazCR6YCYNF0aGLsIUIMbZwIGO6B3HnImnGptGW1TJ+
	xQYy7SxrB1HnblU0QBDGD5B86peSlUMpCzhRodZkVTyc1vpU8TJE1a9+BwYrlzZkU9t9/Lt5HtA
	jHaXEoXb+cLGLTlxIeBdtZWp5Hrs44O8iWkSK4+S2FHgJ3dxtCE2rom/qRDF5csVSWR8q0nNWJt
	f6W+EJdT9JXg0gr5jgegPt1o6d5pkLpqlBTNaE+Ek+5dk3S0FA2sGuixbWtMLmDjqjdi/t67rrf
	w==
X-Received: by 2002:a17:90b:4990:b0:38e:4114:d8c7 with SMTP id 98e67ed59e1d1-392cc6da1e6mr3394837a91.0.1786385571937;
        Mon, 10 Aug 2026 11:12:51 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fa9:fa00:b1a9:6513:83c6:1d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d53b873asm472795a91.17.2026.08.10.11.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:12:51 -0700 (PDT)
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
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 21/34] dmaengine: zynqmp-dma: switch completion tasklet to dmaengine BH
Date: Mon, 10 Aug 2026 11:09:22 -0700
Message-ID: <56dce14420ecdf8665c0e03b5f3a42004d33eadd.1786384169.git.allen.lkml@gmail.com>
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

Replace the per-channel tasklet with the shared dmaengine BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/xilinx/zynqmp_dma.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
index f6a812e49ddc..e396a35f0e0d 100644
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
+		dmaengine_schedule_bh(&chan->common);
 		ret = IRQ_HANDLED;
 	}
 
@@ -744,7 +742,7 @@ static irqreturn_t zynqmp_dma_irq_handler(int irq, void *data)
 
 	if (status & ZYNQMP_DMA_INT_ERR) {
 		chan->err = true;
-		tasklet_schedule(&chan->tasklet);
+		dmaengine_schedule_bh(&chan->common);
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
+	dmaengine_kill_bh(&chan->common);
 }
 
 /**
@@ -887,7 +886,7 @@ static void zynqmp_dma_chan_remove(struct zynqmp_dma_chan *chan)
 
 	if (chan->irq)
 		devm_free_irq(chan->zdev->dev, chan->irq, chan);
-	tasklet_kill(&chan->tasklet);
+	dmaengine_kill_bh(&chan->common);
 	list_del(&chan->common.device_node);
 }
 
@@ -937,7 +936,7 @@ static int zynqmp_dma_chan_probe(struct zynqmp_dma_device *zdev,
 
 	chan->is_dmacoherent =  of_property_read_bool(node, "dma-coherent");
 	zdev->chan = chan;
-	tasklet_setup(&chan->tasklet, zynqmp_dma_do_tasklet);
+	dmaengine_init_bh(&chan->common, zynqmp_dma_do_tasklet);
 	spin_lock_init(&chan->lock);
 	INIT_LIST_HEAD(&chan->active_list);
 	INIT_LIST_HEAD(&chan->pending_list);
-- 
2.43.0

