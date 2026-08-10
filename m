Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6046143553D
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786385555; cv=none; b=qDbYA5XKqxGJSw0Zsh8yQcAv+zYI9YNIeBS78C/8ewxCwZc5iim7TZF3oyR3FXcdzj2BRJEkVfysi/J/1ldOHs+VJwVOLljYPyJrgTH58VMr+pAg5jHzRBGZOX9SvP11Z+cJ99aXMitnjxbHjFP0U9HVZ1GzDQfNvk5lsUzzTeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786385555; c=relaxed/simple;
	bh=NmPTWKWU/XXWJnxBrOM9+TA4gg2maSIZspzw1qRN4Hw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WRAWOPQZJX+5rCKmkvbheqjg+THWrsAfzBpdcYBN1Gc6iKKrtzxgJa2mFJ1RZOh1dSrnKLIrhnNbuyzD98Ut4NEgqQvUi6pSaq1Khldr5ADspahDkpyUmXK17iDi8h+PQq+U6X+n7ML+meZsphntIzHi/ZRxcAqfab8/kl7kFOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BNHkPm/O; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BNHkPm/O"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38de840f2f0so1560059a91.0
        for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 11:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786385554; x=1786990354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jhv9jwlBVkN0UhJGwK19V7QRpEro4v/LDfkYXX13aoI=;
        b=BNHkPm/O4zIhwUS5xEeiTmRXPNG0h2+g6GZK9+Q7ssR01Jk3lNIUPFdv8LFJYfhLdD
         ORL/9Fp164Cn6LGHaAx2HGVtdSkqMo5vcmnMz0meKOw29cLc/senYqC8XPqM6IWnzl7O
         wrTA/VXgxuUMIvCkyfYC2+xfCWQ5zkjN3pJo2zt+Fkh8DB4vgraq20cUuIcOpPIX/ToN
         QbWaksunNRKJ6az5KANT8SR8q69ERwgHTBDFYSzzT8dgXTxRRIhEjX4ovaVDY4LIaxbB
         x14OPsiPfLhJQG0q2YjqS2/+llxXDir4zIi0/xhpwwFaGkoN7rW5BSYfH0VW/iG3+3D7
         lAdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786385554; x=1786990354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jhv9jwlBVkN0UhJGwK19V7QRpEro4v/LDfkYXX13aoI=;
        b=RQr5wERONpqg3I3q9ayvR19sjMyk0mi+xEZ5ge0JohNvE7w9eeln/dVunr3/lz/i31
         5nKSKKFLUl12X0wKg/9FTNUhx+URJW/NkP7Ep0Z4C9Fj6CpkjbfyEyqwh0ydRJKChW+F
         itKW6dXfAfZ6vcr+2+kEGIbGVIF9nCUmKfAhwFWkg1he+VkFyAkLyWWsR3l0HpEWkG11
         47sYBh51cGrlX3o5pIRM2rHBcoxd73Ktjr/ZcTsZyL4l+kEc94deIaASeRjgoPKU5L9e
         mBhChKTcwtGV7aGLQiq2VuOEr32l4jYawYQtlurkeZttKOH7IETPd1jeYXPZFAoy3NfY
         /vBw==
X-Forwarded-Encrypted: i=1; AHgh+RpmDBmo5t1xn4Xufp6poiv2RHueDQ3kkmNVpQ27GCpcAb/+63E8OZu0rtASqOsHPiBTUnpeo73VVCg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDsUxy48fg7i2JpEn+kRSVEd5IcRpp3TwZPeKmAli0wQ6MLbiA
	mI8QE4TbyJbKe26oKZ1A7SPZtxPu77KXgoVk3MreNv9m6ij7bq59z0cN
X-Gm-Gg: AR+sD10o3PxJH3voZ4yF0SRZYexR2HOJsgKzafQSnyyFUUuyBFU0mboGp9RboMtR0xc
	7FbIJ4WyRwCyaruKYe2caZTvOtoQgKcFo2pLXg7Bpv22Rv4ubw9geFMpqaKMdglTwLlFyqmZp6w
	iGovs5vjKLfO0yelVSSwAk8YPgW8hP1E53vw+5LBZqNbdfULMFybcEVaxPvz9nDRoDqeuwGp/Jm
	llTDS2s2ipVrR+aixFwnTBhlhs1Tdz7kjdkLXIKJbIkVYpDjc5YBU85vYXT4y3gUrL4PlRpAOSz
	SuDdCjDoYBIIQfxpAKQdQNVfA7SvgPDhUUEl0VvUFHHwgxstK3JhZYyAtpKFnW/fw4s0DoR83kc
	9nPo+gLvycwejugD5LF6nUVjhihSRoTxrHtxswacA9MUhPC4T12Gcw3jCORAfXgnukt+Glxsr4H
	/jbZ/P9gmx9PquQ+eSsVMlMfF9Ao1GUk38rpx834PLoLEnyz1EdX4FU3yydQ+P3Gg=
X-Received: by 2002:a17:90b:5444:b0:381:1f51:1ff0 with SMTP id 98e67ed59e1d1-392821fc107mr21956496a91.2.1786385553481;
        Mon, 10 Aug 2026 11:12:33 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fa9:fa00:b1a9:6513:83c6:1d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d53b873asm472795a91.17.2026.08.10.11.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:12:32 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>
Subject: [PATCH v3 18/34] dmaengine: xgene-dma: wire descriptor cleanup to dmaengine BH
Date: Mon, 10 Aug 2026 11:09:19 -0700
Message-ID: <29f97cc894a9c6fcd4aa1f2981850476a963db52.1786384169.git.allen.lkml@gmail.com>
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
 drivers/dma/xgene-dma.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/dma/xgene-dma.c b/drivers/dma/xgene-dma.c
index fa1173e49900..bdeed908e37a 100644
--- a/drivers/dma/xgene-dma.c
+++ b/drivers/dma/xgene-dma.c
@@ -260,7 +260,6 @@ struct xgene_dma_desc_sw {
  *	These descriptors have already had their cleanup actions run. They
  *	are waiting for the ACK bit to be set by the async tx API.
  * @desc_pool: descriptor pool for DMA operations
- * @tasklet: bottom half where all completed descriptors cleans
  * @tx_ring: transmit ring descriptor that we use to prepare actual
  *	descriptors for further executions
  * @rx_ring: receive ring descriptor that we use to get completed DMA
@@ -280,7 +279,6 @@ struct xgene_dma_chan {
 	struct list_head ld_running;
 	struct list_head ld_completed;
 	struct dma_pool *desc_pool;
-	struct tasklet_struct tasklet;
 	struct xgene_dma_ring tx_ring;
 	struct xgene_dma_ring rx_ring;
 };
@@ -975,9 +973,10 @@ static enum dma_status xgene_dma_tx_status(struct dma_chan *dchan,
 	return dma_cookie_status(dchan, cookie, txstate);
 }
 
-static void xgene_dma_tasklet_cb(struct tasklet_struct *t)
+static void xgene_dma_tasklet_cb(struct dma_chan *c)
 {
-	struct xgene_dma_chan *chan = from_tasklet(chan, t, tasklet);
+	struct xgene_dma_chan *chan = container_of(c, struct xgene_dma_chan,
+						   dma_chan);
 
 	/* Run all cleanup for descriptors which have been completed */
 	xgene_dma_cleanup_descriptors(chan);
@@ -999,11 +998,11 @@ static irqreturn_t xgene_dma_chan_ring_isr(int irq, void *id)
 	disable_irq_nosync(chan->rx_irq);
 
 	/*
-	 * Schedule the tasklet to handle all cleanup of the current
+	 * Schedule the bottom half to handle all cleanup of the current
 	 * transaction. It will start a new transaction if there is
 	 * one pending.
 	 */
-	tasklet_schedule(&chan->tasklet);
+	dmaengine_schedule_bh(&chan->dma_chan);
 
 	return IRQ_HANDLED;
 }
@@ -1539,7 +1538,7 @@ static int xgene_dma_async_register(struct xgene_dma *pdma, int id)
 	INIT_LIST_HEAD(&chan->ld_pending);
 	INIT_LIST_HEAD(&chan->ld_running);
 	INIT_LIST_HEAD(&chan->ld_completed);
-	tasklet_setup(&chan->tasklet, xgene_dma_tasklet_cb);
+	dmaengine_init_bh(&chan->dma_chan, xgene_dma_tasklet_cb);
 
 	chan->pending = 0;
 	chan->desc_pool = NULL;
@@ -1556,7 +1555,7 @@ static int xgene_dma_async_register(struct xgene_dma *pdma, int id)
 	ret = dma_async_device_register(dma_dev);
 	if (ret) {
 		chan_err(chan, "Failed to register async device %d", ret);
-		tasklet_kill(&chan->tasklet);
+		dmaengine_kill_bh(&chan->dma_chan);
 
 		return ret;
 	}
@@ -1579,7 +1578,7 @@ static int xgene_dma_init_async(struct xgene_dma *pdma)
 		if (ret) {
 			for (j = 0; j < i; j++) {
 				dma_async_device_unregister(&pdma->dma_dev[j]);
-				tasklet_kill(&pdma->chan[j].tasklet);
+				dmaengine_kill_bh(&pdma->chan[j].dma_chan);
 			}
 
 			return ret;
@@ -1790,7 +1789,7 @@ static void xgene_dma_remove(struct platform_device *pdev)
 
 	for (i = 0; i < XGENE_DMA_MAX_CHANNEL; i++) {
 		chan = &pdma->chan[i];
-		tasklet_kill(&chan->tasklet);
+		dmaengine_kill_bh(&chan->dma_chan);
 		xgene_dma_delete_chan_rings(chan);
 	}
 
-- 
2.43.0

