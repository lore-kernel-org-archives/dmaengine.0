Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795104118;
	b=22ux1a4KIqrUSBabs2O6Hqpjv0p0TxnEdmbrhY1wxtrHfzGCC3FqodJhWUh9YwjBu5XC
	 jzZ6FpKnjnImkacQctI+AzviGmshP/lv4YehW64QWRuA7FpLPdQQE244UhvQpQ95dJSHr
	 wTrV83fhH/CkurNp7dgWsEZqEA4DIBdDGCMGaTq7PZhEYQ/zdIqvdIol2WQ4OHHw9Bnoi
	 RIx3GoIw+u5py8PSyxMv3V03NGNjsId4sqdLi5sEPMB8ixqx0t+UUHTNnEElmnlwv/fol
	 yVzCfAwJq1/9CdIOseHJ8oe50FNoHC8yYy/FRJg/1i2OMUY+jV2JOyumbzUvhkRwNyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104118;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=rfsGoBQIbogwRnnVczPLtH8aeHkW23Do7VnMP/YAMt8=;
	b=S+Pc0RGi5aWKgakY86TEF/sycuyTR9ne7mP9HKILXlHOzDHBGdJ4F4OruEwDg2Yg+iaW
	 1Oz09VS1GPdPhhQcGFAAXL58plktE38kWQuV5m43mlApE+n8jcYdtDsoAk72r7+8S3lqj
	 EHeeh7mTUT1Hb1xP8S+ZcDIGc0d3WpirS9UyqvdBvgCkdWTQX+EP5eWoMThNt+rJ76NnK
	 nbAWZ8poPHCqnb1aP1G1HFcXd8FZoPbqUZxCe+/9XNZrgoL+knHVap+W7VU0l9Kf/SW/y
	 gjUj1kyGE5TABi97KPKqISfuOKHMCBWv37efWwKZYxlCTG35wTMecD2huK/H3im0DeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AHShgd2o;
	arc=none smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CFF60A381B
	for <dmaengine@vger.kernel.org>; Thu, 19 Nov 2026 16:01:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2CFF60A381B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AHShgd2o
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b4d6981c67so15190767b3.1
        for <dmaengine@vger.kernel.org>; Thu, 19 Nov 2026 08:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795104117; x=1795708917; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rfsGoBQIbogwRnnVczPLtH8aeHkW23Do7VnMP/YAMt8=;
        b=AHShgd2oeLMqBrr0sc7ZEvNlAG+K7PWEG/bWzutCIHJdFaft1/dhI00nz1BnT9hp20
         z0tyWXjkaFuAVyKiQUpDHHelnpuqv5JxSipGT/vot72LGj5vtYreb8zbqQT2YTZdPcWc
         nTblMcTjObC+P3KsLoIulu/JU0WzP6qWf16yhDrD1IXZ+Ljq4KGVYSuXCjCTG/3y78lv
         +AISzGfv8sDx0eqSq5TVPhojVGjKhCa9a3fD2LuccNF88MLydstQ/09Ar+ddpYG/zm7t
         teU0gYaJ6kflW3gW2q31Xjjb1+UsTjYFK+Tnl56O2Mp8j/+kpM39G7o2h8+dfsN6wrk3
         deug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795104117; x=1795708917;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rfsGoBQIbogwRnnVczPLtH8aeHkW23Do7VnMP/YAMt8=;
        b=NeVQM7Nbt6V6nCs5szXfeiFShDQ+0zfds57ix8fv25m6O9D85x3gwhTayEvKGKVDaZ
         EzQ/VfNWrf5wPafoG/aK2neuKsjVPcjz6tBHcO8e/ilmr/yKTkYphM35B8mggcRzkjPN
         Zu4LNvxFGVTykuJxBnrvVB+8nA+k6C8YZiUKSrJgpETR9PhOawihnoVilmvCeMAP+kzi
         qUtsdVff6D58dDkO165TqS3bwJG5SWDTmssQJORaWk3KstZm0FwEhuyc7EUOhYwvwuPN
         q0ETjkVaI2+xpRb9Fkj1BWid8xcRpl9/b09/n6JCmaCRlLC/Tz/iljVGsAAAlj+mcRLc
         MYGQ==
X-Forwarded-Encrypted: i=1; AL+hErH0de8Am9f6Bo2dmZzJ4R1kB9JX4DStvdEwEnPzCmhNdhLjYlEutOTNNCIOJOmBqYNXWNZQY4CzyHA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gjoYPhUN4Wu2wGm7YdbZfipRksm3XpFHtPZCov+hmmIJMxHcF
	wFHnAFS/Bj8eIHKF2I9qiIyAiACctFXKfBtNfNncjHYAPemG63Mqjt7e
X-Gm-Gg: AZFdTZeYogKGx4oQcFRGA7BFIeEih0Z+Ihms+HT5Pm+M9zOc4shNYz5EXk8BeyldXIQ
	9jAb2SIa23gIzLk1oGbEq+yaxFYmvbclwIgf/Jf0WYmtaq3eeG+UVXfQDe+EsI1ClG9Lwt1gFCS
	jQhzy9+WRnJ4wYmVov1R20K/VmUaRbL8lBTbh1VCl8YagS5pXR1LA/N4QexRfL6JWmmcqXUcHkJ
	tu7jOOFDfDSsKzevobUkaiFg6TOj9v3fspKwobjFRifQnk89SIbAKgFxkwKvaZwlfrTGKtQYTUG
	MS4N/O48toJRNrpCDxdvVz5mAsL8HTfUA4JKh2qFtI4HBN+Mf+J0ikeoRZu2xOA3Y7RXAJ6Ay7V
	8kQ6mJYbKA1C4OFC8akU73e/pAlWZuRtRBNjuYffYZcwrDKxjKv3S9TCkikpkse/+J6v/b4+l27
	gjmpn9EqwY7QB5DzIayW99DNzxYNHgOceAVRYVLwSnkH/JA/OAq7Esc+jvD/L//BD/sW7BEnvul
	LTzPNJFT9NyDRYzTWVYLUhOM5TCO5vuSRN7ZXoRYL2rjF+Tzi77Z09qwTd9qVRwLmzElgfWPS2P
	x9uDrDirhCnS3otq9mAxOsvzHwvItif7VFHJyevHSdHf4Wfrggrfcnv8rrsI7bmtqevHMygDqI8
	sOKYITzq3VjsjwYYXeZZcrD2TDS/e6AJ95P1hWFsV3fD+stkCxOsmVfrUlHbSU4TQ7v6iGhu3S/
	PRmn7yEPplgAcuN9IgpSeIRT+8CXpJY9QwVXbm6dPN2J7DCdn+fz7+QsJUtul/sVg6t80WKkXE
X-Received: by 2002:a05:690c:6513:b0:8b1:88ad:1fce with SMTP id 00721157ae682-8b5204cfb03mr879257b3.42.1795104116589;
        Thu, 19 Nov 2026 08:01:56 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52031aa4bsm623267b3.34.2026.11.19.08.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:01:56 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 09:01:02 -0700
Subject: [PATCH v8 7/9] dmaengine: dw-axi-dmac: serialize interrupt status
 with channel reuse
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-submit-dw-axi-dma-stop-pause-v1-v8-7-f8e7fe60594c@gmail.com>
References: <20261119-submit-dw-axi-dma-stop-pause-v1-v8-0-f8e7fe60594c@gmail.com>
In-Reply-To: <20261119-submit-dw-axi-dma-stop-pause-v1-v8-0-f8e7fe60594c@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>, Baruch Siach <baruch@tkos.co.il>
Cc: Mitch Barnett <mitch@accuratesound.ca>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.17-dev

The interrupt handler reads and acknowledges channel status before taking
the channel lock. Termination can finish and a new transfer can start
before the handler takes that lock. The saved completion or error status
then applies to the new descriptor, stopping it and completing its cookie
before its DMA transfer has finished.

Termination also leaves completion and error status pending. A subsequent
interrupt can consume that status after the channel has been reused, even
if no handler was running when the old transfer was stopped.

Read and acknowledge status under the channel lock and keep it held while
processing the event. Move locking out of the completion and error helpers
into their sole caller, and clear all channel status after a successful
stop. Status collection, descriptor ownership and channel reuse then share
the same serialization.

Initialize the virtual channels before requesting the shared IRQs so every
lock is ready before the interrupt handler can run.

Fixes: 1fe20f1b8454 ("dmaengine: Introduce DW AXI DMAC driver")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 31 ++++++++++++--------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index 2547f9596ae6..2eeb902eaad3 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -21,6 +21,7 @@
 #include <linux/iopoll.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/kernel.h>
+#include <linux/lockdep.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_dma.h>
@@ -1072,9 +1073,8 @@ static void axi_chan_list_dump_lli(struct axi_dma_chan *chan,
 static noinline void axi_chan_handle_err(struct axi_dma_chan *chan, u32 status)
 {
 	struct virt_dma_desc *vd;
-	unsigned long flags;
 
-	spin_lock_irqsave(&chan->vc.lock, flags);
+	lockdep_assert_held(&chan->vc.lock);
 
 	axi_chan_disable(chan);
 
@@ -1083,7 +1083,7 @@ static noinline void axi_chan_handle_err(struct axi_dma_chan *chan, u32 status)
 	if (!vd) {
 		dev_err(vchan_chan_dev(&chan->vc), "BUG: %s, IRQ with no descriptors\n",
 			axi_chan_name(chan));
-		goto out;
+		return;
 	}
 	/* Remove the completed descriptor from issued list */
 	list_del(&vd->node);
@@ -1100,9 +1100,6 @@ static noinline void axi_chan_handle_err(struct axi_dma_chan *chan, u32 status)
 	chan->desc = NULL;
 	chan->cyclic_restart = false;
 	axi_chan_start_first_queued(chan);
-
-out:
-	spin_unlock_irqrestore(&chan->vc.lock, flags);
 }
 
 static void axi_chan_block_xfer_complete(struct axi_dma_chan *chan)
@@ -1111,11 +1108,11 @@ static void axi_chan_block_xfer_complete(struct axi_dma_chan *chan)
 	struct axi_dma_hw_desc *hw_desc;
 	struct axi_dma_desc *desc;
 	struct virt_dma_desc *vd;
-	unsigned long flags;
 	u64 llp;
 	int i;
 
-	spin_lock_irqsave(&chan->vc.lock, flags);
+	lockdep_assert_held(&chan->vc.lock);
+
 	if (unlikely(axi_chan_is_hw_enable(chan))) {
 		dev_err(vchan_chan_dev(&chan->vc), "BUG: %s caught DWAXIDMAC_IRQ_DMA_TRF, but channel not idle!\n",
 			axi_chan_name(chan));
@@ -1127,7 +1124,7 @@ static void axi_chan_block_xfer_complete(struct axi_dma_chan *chan)
 	if (!vd) {
 		dev_err(vchan_chan_dev(&chan->vc), "BUG: %s, IRQ with no descriptors\n",
 			axi_chan_name(chan));
-		goto out;
+		return;
 	}
 
 	desc = vd_to_axi_desc(vd);
@@ -1159,9 +1156,6 @@ static void axi_chan_block_xfer_complete(struct axi_dma_chan *chan)
 		chan->desc = NULL;
 		axi_chan_start_first_queued(chan);
 	}
-
-out:
-	spin_unlock_irqrestore(&chan->vc.lock, flags);
 }
 
 static irqreturn_t dw_axi_dma_interrupt(int irq, void *dev_id)
@@ -1169,6 +1163,7 @@ static irqreturn_t dw_axi_dma_interrupt(int irq, void *dev_id)
 	struct axi_dma_chip *chip = dev_id;
 	struct dw_axi_dma *dw = chip->dw;
 	struct axi_dma_chan *chan;
+	unsigned long flags;
 
 	u32 status, i;
 
@@ -1178,6 +1173,7 @@ static irqreturn_t dw_axi_dma_interrupt(int irq, void *dev_id)
 	/* Poll, clear and process every channel interrupt status */
 	for (i = 0; i < dw->hdata->nr_channels; i++) {
 		chan = &dw->chan[i];
+		spin_lock_irqsave(&chan->vc.lock, flags);
 		status = axi_chan_irq_read(chan);
 		/* Leave suspension status for the pause and resume paths. */
 		status &= ~DWAXIDMAC_IRQ_SUSPENDED;
@@ -1190,6 +1186,7 @@ static irqreturn_t dw_axi_dma_interrupt(int irq, void *dev_id)
 			axi_chan_handle_err(chan, status);
 		else if (status & DWAXIDMAC_IRQ_DMA_TRF)
 			axi_chan_block_xfer_complete(chan);
+		spin_unlock_irqrestore(&chan->vc.lock, flags);
 	}
 
 	/* Re-enable interrupts */
@@ -1220,7 +1217,7 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
 
 		vchan_terminate_all(&chan->vc);
 
-		axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
+		axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_ALL);
 		chan->desc = NULL;
 		chan->pause_requested = false;
 		chan->is_paused = false;
@@ -1600,10 +1597,6 @@ static int dw_probe(struct platform_device *pdev)
 	if (!dw->chan)
 		return -ENOMEM;
 
-	ret = axi_req_irqs(pdev, chip);
-	if (ret)
-		return ret;
-
 	INIT_LIST_HEAD(&dw->dma.channels);
 	for (i = 0; i < hdata->nr_channels; i++) {
 		struct axi_dma_chan *chan = &dw->chan[i];
@@ -1617,6 +1610,10 @@ static int dw_probe(struct platform_device *pdev)
 		vchan_init(&chan->vc, &dw->dma);
 	}
 
+	ret = axi_req_irqs(pdev, chip);
+	if (ret)
+		return ret;
+
 	/* Set capabilities */
 	dma_cap_set(DMA_MEMCPY, dw->dma.cap_mask);
 	dma_cap_set(DMA_SLAVE, dw->dma.cap_mask);

-- 
2.53.0

