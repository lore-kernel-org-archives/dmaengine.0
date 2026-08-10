Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D653955C7
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786385563; cv=none; b=fFg9ZWtTUrLeuhKfClcvZkq4fFQSvdhbON4UiJmKco4tlZUyDfooFkW0Joy/FYU/oxLsNp8vPXB2w1YTBEDHOZt7/dPuliylzPmu5QS4z2TXLFaaZB8d2oJuslIA1+kUqraK92AnBnru9peIGFO15G2uXO6xum4D/8mTgn8/4OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786385563; c=relaxed/simple;
	bh=VSGfp2nFK2KHhGT5BTCtWQE+xFVZbCQ4FH5muv7ny1k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rp328FSlTBKkrEi+LzBBoErR60oZmSI0noeQS/hjb0d+uWkOl0w3rNjYRB54dEbn3ZadOR6LeQ4LnPj/8xV7dfGCnJBuYsWmJLccpafS8jBQDHRi2ihIGk7DEanHhkLsYxjTeJys9zGD1xdIvM70f0UezSBidLBbaG1PA3G9fZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sYIzIixu; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sYIzIixu"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38e347638adso2454910a91.0
        for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 11:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786385562; x=1786990362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XhfEAW8BttSC81TlBFp6AqcN9U05iRvrtOjyjSXhehI=;
        b=sYIzIixuaVAPldDQes2BkTH4+Sz01uNV4djC0QGb8aep0NY2UVhE/nyFsbb42IMFpY
         Sm9ZU0F1SOkEK+C7AAYPQbjB4mjlBYKo0wYhZwdK0tixQaVy0MgD5DhNha4o/rMUXj37
         6+c+BmGBVdeyH9Xg4kYhn8YlCnYdUferimWS6J3pFC0RO8Pyp8bZve7QC7+oyIrr9rsy
         J70psSFcwJCyOCw8Qf3VZnJ+Ny/rgOfOuXIhD1rEPa7fQ6zpKbePlge5aEIXfUaybzYj
         kWWDNdnI4m4dcDP0Kdix9OiDVTfecTHYLy5RTRUp6S8ULztiUhQU6g9ZD7Q6T0MHUlRN
         QKGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786385562; x=1786990362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XhfEAW8BttSC81TlBFp6AqcN9U05iRvrtOjyjSXhehI=;
        b=OHwggnAwYrIrPPzrRbTgawY9zyZYP5+9SSiD3v8KDZE6hKHQ+HS722FPsQwTVsSR3x
         i5q9EDsRL6tjzCN8XF0RMPktDfqg5KO33hjjs9yCXs14tohlItgZmZIQHWrq0inUepzo
         j37KqE9TH5SPH+ziwMC5gWPATE9AiGfNpWbTFglHXmO/E5LechBaeLsmBLnbtukczcY7
         /aZrqTO/umU7ZZjkAopypnOXUuF9SCUiBc0vwEE3EsamqzBJk2tjhZmokvaewGZrXA0/
         MRIDLJF7MolcBm6vXQBQtqGuPEL/c6Cpxzgapc5XWfvFwaEl+VrLW+yQ86mkRhxRH13r
         h4lw==
X-Forwarded-Encrypted: i=1; AHgh+RpUL5SFr9uzYOeqwNy2Ya6ruUf6Od0WCDF2EzG9KKvBNp2qN6Q4jYOASRvgiksqeJ50YyUMWOXI/Zs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVcPlXJ8NN/jj89HSVRUp+yKVHf2GHLUXrb1xU8G1tVhNbyJY2
	tCUHNQ0qiyQ0bnqBjLjtTE9PNTkfg652+ntfuBb1MddNS2O9DTJnIuif
X-Gm-Gg: AR+sD102WyusaeY8E+1dXoZfcsprKn+FOqYe2BFhi1bHMXHfC8/rTfs6tlic9Wco+xp
	14laZ+rGSjr0A5vr2L3KwYthXGtSIJ5NAjeTCIkcVWVsDffbNpbP7aZ65exxSsGIv1BwWwp2Ezp
	Ge+1gNIA36YjU+s4yIsWKvPm97DKEtfJxSkYE35m74GpR9hHx9D2E9+9ZdBGk0wk34Aw33mi6Jy
	ifv9/8FDxUH+H8rbnrvCMG85LxF9+KUEr4PIIKY7GioBZgurUlNMqPo9P2Dj8X84c1F3e2jGfeh
	BWypDQMpO6LmbP8iyaFtcYdJysHn6ypP7g1+It2OjHf2QDU6x4B+oRVhFEDJDUTpQxpH7iSX3IO
	daY02db8a+ioQj3lU3ZJMijcMBuzln3jm8w88D4MNXKW6n31tEnwlVBCTAWflB1Rql3bZiADspq
	B9l9w3Yg2r7bE4wO5WyrmAgCAlumcW3RCE7dRdG+e2dGGFkHKiNQhWfvA8UTuVbz5Ng4PeT+Nrr
	g==
X-Received: by 2002:a17:90a:e706:b0:38e:b400:a860 with SMTP id 98e67ed59e1d1-392824a96eamr22423349a91.13.1786385561722;
        Mon, 10 Aug 2026 11:12:41 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fa9:fa00:b1a9:6513:83c6:1d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d53b873asm472795a91.17.2026.08.10.11.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:12:41 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Suraj Gupta <suraj.gupta2@amd.com>,
	Marek Vasut <marex@nabladev.com>,
	Folker Schwesinger <dev@folker-schwesinger.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 19/34] dmaengine: xilinx-dma: use dmaengine BH instead of tasklets
Date: Mon, 10 Aug 2026 11:09:20 -0700
Message-ID: <67afeabe4a9cc241704b36875e766d7d129465ec.1786384169.git.allen.lkml@gmail.com>
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
 drivers/dma/xilinx/xilinx_dma.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index 404235c17353..b142c9c0583c 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -402,7 +402,6 @@ struct xilinx_dma_tx_descriptor {
  * @err: Channel has errors
  * @idle: Check for channel idle
  * @terminating: Check for channel being synchronized by user
- * @tasklet: Cleanup work after irq
  * @config: Device configuration info
  * @flush_on_fsync: Flush on Frame sync
  * @desc_pendingcount: Descriptor pending count
@@ -441,7 +440,6 @@ struct xilinx_dma_chan {
 	bool err;
 	bool idle;
 	bool terminating;
-	struct tasklet_struct tasklet;
 	struct xilinx_vdma_config config;
 	bool flush_on_fsync;
 	u32 desc_pendingcount;
@@ -1115,11 +1113,12 @@ static void xilinx_dma_chan_desc_cleanup(struct xilinx_dma_chan *chan)
 
 /**
  * xilinx_dma_do_tasklet - Schedule completion tasklet
- * @t: Pointer to the Xilinx DMA channel structure
+ * @c: Pointer to the Xilinx DMA channel structure
  */
-static void xilinx_dma_do_tasklet(struct tasklet_struct *t)
+static void xilinx_dma_do_tasklet(struct dma_chan *c)
 {
-	struct xilinx_dma_chan *chan = from_tasklet(chan, t, tasklet);
+	struct xilinx_dma_chan *chan = container_of(c,
+			struct xilinx_dma_chan, common);
 
 	xilinx_dma_chan_desc_cleanup(chan);
 }
@@ -1898,7 +1897,7 @@ static irqreturn_t xilinx_mcdma_irq_handler(int irq, void *data)
 		spin_unlock(&chan->lock);
 	}
 
-	tasklet_hi_schedule(&chan->tasklet);
+	dmaengine_schedule_bh(&chan->common);
 	return IRQ_HANDLED;
 }
 
@@ -1955,7 +1954,7 @@ static irqreturn_t xilinx_dma_irq_handler(int irq, void *data)
 		spin_unlock(&chan->lock);
 	}
 
-	tasklet_schedule(&chan->tasklet);
+	dmaengine_schedule_bh(&chan->common);
 	return IRQ_HANDLED;
 }
 
@@ -2654,7 +2653,7 @@ static void xilinx_dma_synchronize(struct dma_chan *dchan)
 {
 	struct xilinx_dma_chan *chan = to_xilinx_chan(dchan);
 
-	tasklet_kill(&chan->tasklet);
+	dmaengine_kill_bh(&chan->common);
 }
 
 /**
@@ -2745,7 +2744,7 @@ static void xilinx_dma_chan_remove(struct xilinx_dma_chan *chan)
 	if (chan->irq > 0)
 		free_irq(chan->irq, chan);
 
-	tasklet_kill(&chan->tasklet);
+	dmaengine_kill_bh(&chan->common);
 
 	list_del(&chan->common.device_node);
 }
@@ -3075,8 +3074,7 @@ static int xilinx_dma_chan_probe(struct xilinx_dma_device *xdev,
 			str_enabled_disabled(chan->has_sg));
 	}
 
-	/* Initialize the tasklet */
-	tasklet_setup(&chan->tasklet, xilinx_dma_do_tasklet);
+	dmaengine_init_bh(&chan->common, xilinx_dma_do_tasklet);
 
 	/*
 	 * Initialize the DMA channel and add it to the DMA engine channels
-- 
2.43.0

