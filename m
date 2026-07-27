Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1226442A154
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184324; cv=none; b=I6jY0UUwrZLThFH3jLE3OK6fFkI3mo4URD8Dhwui2XCbGvcsa8sb3JBTp8Jb1rR77O+0uE9hxRWm5XC4ZAbFQotrYIXgSNHkqfWVgnZ6JFSY95YqcBAWlytZNg/OFvERx5jo1JrRAEOX/mZHSFBszVe11XeHJsMhuzBL8W2RAfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184324; c=relaxed/simple;
	bh=2SBQXIFzJ2k+wJeFQEAu/EPcQ3+2kSQL4Bue+V8ZTIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UtOlK6jFjeqHE+TsmbSJVNE7eKOTm2kGW1G7NOth+YaK1/5XHYGquwg+Lhkq1b7MhF++dHVzUnLXFe2BgvtjsXVMY89MGJL4punevwbv/LZ5NAfK9YAlot8q9phwXDvqx90VuRKSpDy9d8xydLAXeQsd52p89FN9X0tFTUHc5fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jphoegg7; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jphoegg7"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cc97653887so37033045ad.1
        for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 13:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184322; x=1785789122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RG+YRr6Yg/R1hJSRvR8r3Ej6+EpdxjH9TEide+tk0lc=;
        b=jphoegg7ftyhX+mlPp9EK1cS3L5IZdXu5afyr91gCy1AvUqhEDczgHot0gG/4NLJwj
         KfZMkzAkHNHKPzC4juKTqywSzs4OL+LshJwijnxJi6GTmjnx2E9IV030lu++IgsfM+YS
         HYl7ypdENH0OPc4BREbLMnCph9tEP02I2wtL3hFCtoZE9G2X3Vi+InKLBeMxhhkNuC78
         trNMCXg5AK4ZhXhwwog7yRAdFnyAx1xeFl5DyvysL/dKR77ubYPSOg2Fpafd4STpeb/A
         hFPOwDUQD4TonmtPBjWv+bzF0i7bD20uUZs9dw+RaxD/MTMZrYbejRJGEUdO3L8wSEn/
         ftqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184322; x=1785789122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RG+YRr6Yg/R1hJSRvR8r3Ej6+EpdxjH9TEide+tk0lc=;
        b=CnBCE6WwIzny5BrGVH90H33rrHbc8okrHWQXdV0tl46x5m8G23PPcVoyChNoFGdtp/
         i48sdTriFKimbqRZy1KD4hDXevnapW1+v9pELwn5GMNrJI7qpt3AOsN+RH9NsnH2uBc2
         +NW1RLCSougWSW/7cS79nLMhzf6ZUW6NjB6g8nAkULE0940ZjQg7F9buj9mlnn4uW+Gd
         FHqrg2KIzG8zS/6eibmMylviCUOKno79NIqUGCBBUi7wVvtamq0kukhWl3eVCpQBNRNy
         umdco6NU6IrUOPbUx6Q4dX85bZhzly6WmXQ8rXivzNEI2vQTPQjBnQtNdY62zlnn5rAm
         be6g==
X-Forwarded-Encrypted: i=1; AHgh+RqvKRp7Jj/kgRG262NDzjlELlGfUXLFyui9kMqjleF9KhX8XocO+Sbojds4+bP7ZfFj0dercFqtSmc=@vger.kernel.org
X-Gm-Message-State: AOJu0YymAcfEsg8T1A5ouVu0iOeDCprEYLQh9xrBwt+lJXqBAlEtgb5M
	fH756nNWnINHLCnHmvfJHWJIap5QMjWd1lq7DST1Nok3tdOdxGBAYrhDhxiLbw==
X-Gm-Gg: AR+sD11JlHZWCTtiYxelaOxmGR0mYwN2tC+LhEv49w0Am3jqmYjyQoH/D0cdOQGDDtI
	rqmvFjY0Jmo6IJL0mglOQyQqg/XKgHnQaDXOHvBGHPe3OuEOhCjuVY0Xv8POspDEEIRXwNKh7OZ
	LltPTjbL5BKsLAwaJySo4Nt9iwVB0QkIO2cQVaBv2eHaH2CGmyEvmpifdgOLlPPm4mnAjggugN9
	xtkjl6MHYSw1eDgBzJzESGjZv7KqM1/stmSMVKdVgLN5jQ2n5yhkeXf8BFNZiuE9kG6gJx9Lg6w
	IxxkpxWig3Tgep+ukuPEYwcT+/bTvARFNC1zF01dulOu7BkGRAEu4taw5JLNKhevG8x9OlYwaX9
	9CCaKFY1DdHrFmM5jnQhfjIMgdLJRJ9B1UcWOXGhL5lnxq7tnsiFhOibpSAheOC0nsA4G0tWYP0
	8Tk0uW
X-Received: by 2002:a17:903:3887:b0:2ca:f8ef:33e4 with SMTP id d9443c01a7336-2cfde7b6eb0mr94219375ad.17.1785184322221;
        Mon, 27 Jul 2026 13:32:02 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59b768sm41551805ad.4.2026.07.27.13.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:31:58 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>
Subject: [PATCH v2 15/64] dmaengine: pch_dma: convert tasklet to dma_chan BH
Date: Mon, 27 Jul 2026 13:28:43 -0700
Message-ID: <e1688959517cfa8b6bc1adcf272d0ea3c73751c2.1785183549.git.allen.lkml@gmail.com>
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
 drivers/dma/pch_dma.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/pch_dma.c b/drivers/dma/pch_dma.c
index bf805f1024f6..b0044bea8fe4 100644
--- a/drivers/dma/pch_dma.c
+++ b/drivers/dma/pch_dma.c
@@ -91,7 +91,6 @@ struct pch_dma_chan {
 	struct dma_chan		chan;
 	void __iomem *membase;
 	enum dma_transfer_direction dir;
-	struct tasklet_struct	tasklet;
 	unsigned long		err_status;
 
 	spinlock_t		lock;
@@ -665,9 +664,10 @@ static int pd_device_terminate_all(struct dma_chan *chan)
 	return 0;
 }
 
-static void pdc_tasklet(struct tasklet_struct *t)
+static void pdc_tasklet(struct dma_chan *c)
 {
-	struct pch_dma_chan *pd_chan = from_tasklet(pd_chan, t, tasklet);
+	struct pch_dma_chan *pd_chan = container_of(c, struct pch_dma_chan,
+						    chan);
 	unsigned long flags;
 
 	if (!pdc_is_idle(pd_chan)) {
@@ -707,7 +707,7 @@ static irqreturn_t pd_irq(int irq, void *devid)
 				if (sts0 & DMA_STATUS0_ERR(i))
 					set_bit(0, &pd_chan->err_status);
 
-				tasklet_schedule(&pd_chan->tasklet);
+				dma_chan_schedule_bh(&pd_chan->chan);
 				ret0 = IRQ_HANDLED;
 			}
 		} else {
@@ -715,7 +715,7 @@ static irqreturn_t pd_irq(int irq, void *devid)
 				if (sts2 & DMA_STATUS2_ERR(i))
 					set_bit(0, &pd_chan->err_status);
 
-				tasklet_schedule(&pd_chan->tasklet);
+				dma_chan_schedule_bh(&pd_chan->chan);
 				ret2 = IRQ_HANDLED;
 			}
 		}
@@ -877,7 +877,7 @@ static int pch_dma_probe(struct pci_dev *pdev,
 		INIT_LIST_HEAD(&pd_chan->queue);
 		INIT_LIST_HEAD(&pd_chan->free_list);
 
-		tasklet_setup(&pd_chan->tasklet, pdc_tasklet);
+		dma_chan_init_bh(&pd_chan->chan, pdc_tasklet);
 		list_add_tail(&pd_chan->chan.device_node, &pd->dma.channels);
 	}
 
@@ -930,7 +930,7 @@ static void pch_dma_remove(struct pci_dev *pdev)
 					 device_node) {
 			pd_chan = to_pd_chan(chan);
 
-			tasklet_kill(&pd_chan->tasklet);
+			dma_chan_kill_bh(&pd_chan->chan);
 		}
 
 		dma_pool_destroy(pd->pool);
-- 
2.43.0

